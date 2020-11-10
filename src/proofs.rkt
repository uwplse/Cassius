#lang racket

(require "common.rkt" "tree.rkt" "dom.rkt" "smt.rkt" "selectors.rkt"
         "assertions.rkt" "input.rkt" "modularize.rkt")

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

;;Returns true if this attrs has the :id list-id combo we are looking for
(define (check-is-list attrs list-id)
  (for/or ([attr1 attrs] [attr2 (cdr attrs)])
    (and (equal? attr1 ':id) (equal? attr2 list-id))))

;;Returns true if this cmds as the ':elt number  combo we are looking for
(define (check-is-list-box cmds num)
  (for/or ([cmd1 cmds] [cmd2 (cdr cmds)])
    (and (equal? cmd1 ':elt) (equal? cmd2 num))))

;;Returns the num attribute or false if no such attribute is in the provided list
(define (get-num attrs)
  (define num #f)
  (for ([attr1 attrs] [attr2 (cdr attrs)]
        #:when (equal? attr1 ':num))
       (set! num attr2))
  num)

(define (append-child d box-info elt-info list-id)
  (define elt-num #f)
  (define new-elt-num (gensym))
  (define is-list #f)
  (define elt-tag #f)
  (define elt-attrs #f)
  (define elt-children #f)
  ;;Create a new elements tree with the child added
  (define elements*
    (let loop ([tree (dom-elements d)])
      (when (list? tree)
        (match-define (list (list tag attrs ...) children ...) tree)
	(set! elt-tag tag)
	(set! elt-attrs attrs)
	(set! elt-children children))
      (if (list? tree)
	(begin
          ;;Figure out if this tree is the list we want based on the list-id
          (when (> (length elt-attrs) 0)
            (set! is-list (check-is-list elt-attrs list-id)))
          ;;Alter Children based on wether or not this is the list
          (when is-list
            (set! is-list #f)
            (set! elt-children (append elt-children (list (list (append elt-info (list ':num new-elt-num))))))
            (set! elt-num (get-num elt-attrs)))
          ;;Build the new elements tree with the potentially altered children
          (cons 
            (cons elt-tag elt-attrs)
            (map loop elt-children)))
	tree)))
  (unless elt-num
    (raise-user-error 'append-child "Could not find element with ID ~a" list-id))
  ;;Retrieve the element number of the list we want
  ;;Create a new box tree with the child added
  (define boxes*
    (let loop ([tree (dom-boxes d)])
      (match-define (list (list type cmds ...) children ...) tree)
      ;;Figure out if this box tree is the one corrolating to the list specified by the id
      (define is-list-box #f)
      (when (> (length cmds) 0)
	(set! is-list-box (check-is-list-box cmds elt-num)))
      ;;Alter the children when this is the list tree
      (when is-list-box
	(set! children (append children (list (list (append box-info (list ':elt new-elt-num)))))))
      (cons
	(cons type cmds)
	(map loop children))))
  ;;return a new dom with the altered elements and box tree
  (struct-copy dom d [elements elements*]
	             [boxes boxes*]))

(define (read-command cmd problem-context theorem-context proof-context)
  (match cmd
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

