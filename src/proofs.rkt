#lang racket

(require "common.rkt" "tree.rkt" "dom.rkt" "smt.rkt" "selectors.rkt"
         "assertions.rkt" "input.rkt" "modularize.rkt" "execute.rkt")

(provide read-proofs)

(define (spec-or-assert assert)
  (define-values (vars body) (disassemble-forall assert))
  (if (null? vars) ':spec ':assert))

(define (box-set stx ctx)
  (let loop ([stx stx])
    (match stx
      [(? symbol?) (dict-ref ctx stx)]
      [`(- ,stx1 ,stx2s ...)
       (apply set-subtract (loop stx1) (map loop stx2s))]
      [`(or ,stx1 ,stx2s ...)
       (apply set-union (loop stx1) (map loop stx2s))]
      [`(and ,stx1 ,stx2s ...)
       (apply set-intersect (loop stx1) (map loop stx2s))])))

(define (rename-problem problem n)
  (dict-set problem ':documents
            (list-update (dict-ref problem ':documents #f) 0
                         (λ (x)
                           (struct-copy dom x [name n])))))

(define (dom-run-proof problem tactics theorem theorems)
  (define the-dom (parse-dom (first (dict-ref problem ':documents))))
  (define elts (dom-elements the-dom))
  (define boxes (dom-boxes the-dom))

  (define (get-by-selector sel)
    (for/list ([box (in-tree boxes)]
               #:when (dom-box->elt the-dom box)
               #:when (selector-matches? sel (dom-box->elt the-dom box)))
      box))

  (define box-context (make-hash (list (cons 'root (list boxes)))))
  (node-set! boxes ':split 0)

  (node-set! boxes ':name 'root)
  (hash-set! box-context '* (list boxes))

  (define extra-problems (list))

  (define selectors '())
  (define named-selectors (make-hash))

  (for ([cmd tactics])
    (match cmd
      
      [`(component ,name ,sel)
       (define selected-boxes (get-by-selector sel))
       (define box
         (match selected-boxes
           [(list) (raise (format "Could not find any elements matching ~a" sel))]
           [(list box) box]
           [(list boxes ...) (raise (format "~a matches multiple elements ~a" sel (string-join (map ~a boxes) ", ")))]))
       (hash-set! box-context name selected-boxes)
       (node-set! box ':name name)
       (node-set*! box ':spec (list))
       (node-set! box ':split (length (hash-ref box-context '*)))
       (set! selectors (cons sel selectors))
       (hash-set! named-selectors name sel)
       (hash-update! box-context '* (curry cons box))]
      [`(components ,sel)
       (define selected-boxes (get-by-selector sel))
       (for ([box selected-boxes])
         (node-set*! box ':spec (list))
         (node-set! box ':split (length (hash-ref box-context '*)))
         (hash-update! box-context '* (curry cons box)))]
      [`(components ,name ,sel)
       (define selected-boxes (get-by-selector sel))
       (hash-set! box-context name selected-boxes)
       (for ([box selected-boxes])
         (node-set*! box ':spec (list))
         (node-set! box ':split (length (hash-ref box-context '*)))
         (hash-update! box-context '* (curry cons box)))]
      ;;Add the relevant tags to the input box to get modularize to correctly create the setup for a proof by induction
      [`(induct ,name ,inductive-fact)
	(define boxes (box-set name box-context))
	(for* ([box (in-list boxes)])
	      (when (node-get box ':inductive-fact)
		(raise (format "~a can not be inducted over more than once" box)))
	      (node-set! box ':inductive-fact inductive-fact))]
      ;;Allow the user to state that a given node will be appended to a given list
	[`(append-list ,name ,box-info ,elt-info)
	  (define boxes (box-set name box-context))
	  (for* ([box (in-list boxes)])
		(node-set! box ':append #t)
		(node-set! box ':box-info box-info)
		(node-set! box ':elt-info elt-info))]	
      ;;Given a name and type of value this command erases all values of that type from the component with the given name
      [`(erase ,name ,type)
       (define boxes (box-set name box-context))
       (for* ([box (in-list boxes)] [subbox (in-tree box)])
         (node-remove! subbox type))]

      [`(,(and (or 'assert 'page (list 'random (? number?))
                   'exhaustive 'admit) tool) ,boxes ,assert)
	(define foo (box-set boxes box-context))
       (for ([box foo])
         (if (equal? tool 'assert)
             (node-add! box (spec-or-assert assert) assert)
             (begin
               (node-add! box ':admit assert)
               (set! extra-problems
                     (cons (list tool box assert) extra-problems)))))]
      [`(pre ,boxes ,assert)
       (for ([box (box-set boxes box-context)])
         (node-add! box ':pre assert))]
      [`(lemma (,thm ,boxes ...))
       (define-values (vars body) (disassemble-forall (theorems thm)))       
       (define-values (thvars thbody) (disassemble-forall theorem))
       (set! theorem
             `(forall ,thvars
                      (=>* (let (,@(map list vars boxes))
                             ,body)
                           ,thbody)))]))

  (define problem* (dict-set problem ':documents (list (unparse-dom the-dom))))
  (define problem** (dict-set* problem* ':tests (list theorem) ':tool '(assert)))

  (define cnt 0)
  (define extras
    (for/list ([thing extra-problems])
      (match-define (list tool box assert) thing)
      (define name
        (match (node-get box ':name)
          [#f
           (define name (sformat "anon-component-~a" cnt))
           (set! cnt (+ 1 cnt))
           (node-set! box ':name name)
           name]
          [name name]))
      (dict-set* problem* ':name (list name) ':component (list name)
                 ':selectors selectors ':named-selectors named-selectors
                 ':tests (list assert) ':tool (list tool))))
(define extras*
    (for/list ([group (group-by (λ (x) (cons (dict-ref x ':component) (dict-ref x ':tool))) extras)])
      (define asserts (append-map (curryr dict-ref ':tests) group))
      (dict-set (first group) ':tests asserts)))
 
  (append
   (modularize problem**)
   extras*
   (list (dict-set* problem** ':tool '(modular) ':name (list ':check)))))

(define (append-child d box-info elt-info list-id)
  (define elt-num #f)
  (define new-elt-num (gensym))
  ;;Create a new elements tree with the child added
  (define elements*
    (let loop ([tree (dom-elements d)])
      (match tree
	[(? string?) tree]
	[(list (list tag attrs ...) children ...)
	 (define attrdict (attributes->dict attrs))
         ;;Alter Children based on wether or not this is the list
         (when (equal? (first (dict-ref attrdict ':id '(#f))) list-id)
           (set! children (append children (list (list (append elt-info (list ':num new-elt-num))))))
           (set! elt-num (first (dict-ref attrdict ':num '(#f)))))
         ;;Build the new elements tree with the potentially altered children
         (cons 
           (cons tag attrs)
           (map loop children))])))
  (unless elt-num
    (raise-user-error 'append-child "Could not find element with ID ~a" list-id))
  ;;Create a new box tree with the child added
  (define boxes*
    (let loop ([tree (dom-boxes d)])
      (match-define (list (list type cmds ...) children ...) tree)
      (define cmddict (attributes->dict cmds))
      ;;Alter the children when this is the list tree
      (when (equal? (first (dict-ref cmddict ':elt '(#f))) elt-num)
	(set! children (append children (list (list (append box-info (list ':elt new-elt-num)))))))
      (cons
	(cons type cmds)
	(map loop children))))
  ;;return a new dom with the altered elements and box tree
  (struct-copy dom d [elements elements*]
	             [boxes boxes*]))

(define (read-command cmd problem-context theorem-context proof-context)
  (match cmd
    ;;Saves a list of provided psuedo js commands to the name of a script to use later
    [`(script ,name ,cmds ...)
      (hash-set! problem-context name cmds)]
    [`(page ,name (load ,file ,pname) ,attrs ...)
     (define problem (dict-ref (call-with-input-file file parse-file) pname))
     (define the-dom* (first (dict-ref problem ':documents)))
     (define ctx*
       (for/fold ([ctx (dom-properties the-dom*)])
           ([(k v) (in-dict (attributes->dict attrs))])
         (dict-set ctx k v)))
     (define problem*
       (dict-set problem ':documents
                 (map dom-strip-positions
                      (cons (struct-copy dom the-dom* [properties ctx*])
                            (cdr (dict-ref problem ':documents))))))
     (hash-set! problem-context name problem*)]
    ;;Creates a new page with a given name by running a script on an already loaded page
    [`(page ,name (run-js ,old-page ,script-name))
      ;;Check that the sudoscript translates to javascript that does what the javascript in the provided file does
      (define generated-js (script->js (hash-ref problem-context script-name) script-name))
      (define problem* (hash-ref problem-context old-page))
      (define provided-js (substring (first (dict-ref problem* ':script)) 1 (- (string-length (first (dict-ref problem* ':script))) 1)))
      (when (not (equal? generated-js provided-js))
	(raise (format "Page script and proof script do not match, can not verify this page\n Page Script: ~a\n Proof Script: ~a\n" provided-js generated-js)))
      ;;Compute the list of changes this script can perform on the page
      (define effects (execute-script (hash-ref problem-context script-name)))
      ;;Pull the problem of the old-page out of the context
      (define the-dom* (first (dict-ref problem* ':documents)))
      ;;Itterate through the effects of the script, changing the page in the needed ways when certain effects appear
      (for ([effect effects])
	(match effect
	  ;;When the append child effect appears, append child and box to elt
          [(list 'append-child (list 'id list-id) elt-info box-info)
            (set! problem*
	      (dict-set problem* ':documents
	        (list (append-child the-dom* box-info elt-info list-id))))
	    (set! the-dom* (first (dict-ref problem* ':documents)))]))
      (hash-set! problem-context name problem*)]
    [`(page ,name (run ,old-page (append-child (id ,list-id) ,box-info ,elt-info)))
      ;;Pull up the old page
      (define problem (hash-ref problem-context old-page))
      (define the-dom* (first (dict-ref problem ':documents)))
      ;;Use the box and elt info to append a new child to the specified list
      (define problem*
	(dict-set problem ':documents
	  (list (append-child the-dom* box-info elt-info list-id))))
      (hash-set! problem-context name problem*)]
    [`(import ,file)
     (call-with-input-file file
       (λ (p)
         (for ([cmd* (in-port read p)])
           (read-command cmd* problem-context theorem-context proof-context))))]
    [`(define (,name ,args ...) ,body)
     (define helper
       (procedure-reduce-arity
        (λ vals (smt-replace-terms body (map cons args vals)))
        (length args)))
     (hash-set! helper-dict (cons name args) body)
     (hash-set! assertion-helpers name helper)]
    [`(,(or 'theorem 'lemma) (,name ,args ...) ,body)
     (hash-set! theorem-context name `(forall ,args ,body))]
    [`(proof (,name ,thmname ,pages ...) ,subcmds ...)
     (define theorem (dict-ref theorem-context thmname))
     (hash-set! proof-context name
                (for/hash ([page pages])
                  (values
                   page
                   (dom-run-proof (dict-ref problem-context page)
                                  subcmds theorem (curry dict-ref theorem-context)))))])
  )

(define (read-proofs port)
  (define problem-context (make-hash))
  (define theorem-context (make-hash))
  (define proof-context (make-hash))
  (for ([cmd (in-port read port)])
    (read-command cmd problem-context theorem-context proof-context))
  proof-context)

