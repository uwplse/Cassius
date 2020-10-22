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
	[`(append-list ,name ,node-info)]	
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

