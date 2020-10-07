#lang racket

(require "common.rkt" "tree.rkt" "dom.rkt" "smt.rkt" "prune.rkt")
(provide modularize is-component)

(define (is-component box)
  (or (not (node-parent box)) (node-get* box ':split)))

(define (split-document doc)
  (define out (make-hash))
  (let loop ([tree (dom-boxes doc)])
    (define children* (map loop (rest tree)))
    (match (member ':split (first tree))
      [(list _ name _ ...)
       (let* ([component (parse-tree (cons (first tree) children*))]
              [specs (node-get* component ':spec #:default '())]
              [asserts (node-get* component ':assert #:default '())]
              [pres (node-get* component ':pre #:default '())]
              [ctx (dom-properties doc)])
         (node-remove! component ':spec)
         (node-remove! component ':assert)
         (node-remove! component ':admit)
         (define props
           (if (eq? tree (dom-boxes doc)) ctx (dict-set ctx ':component '())))
         (hash-set! out name
                    (cons (struct-copy dom doc
                                       [name (node-get component ':name #:default name)]
                                       [boxes (unparse-tree component)]
                                       [properties props])
                          (for/list ([p (append specs asserts)])
                            (define-values (vars body) (disassemble-forall p))
                            `(forall (,@vars) (=> ,@pres ,body)))))
         (unless (eq? tree (dom-boxes doc))
           (node-add! component ':component 'true))
         (node-set*! component ':spec specs)
         (node-remove! component ':split)
         (list (first (unparse-tree component))))]
      [_
       (cons (first tree) children*)]))
  out)

;;For Inductive proofs create the problem for the case where the list is 3 items long
(define (one-case component-document precondition postcondition ind-fact)
  (define one-dom (parse-dom component-document))
  (define one-box (dom-boxes one-dom))
  (define one-elt (dom-box->elt one-dom one-box))
  ;;Remove the nodes that arent the first, last, or inductive base form the lisit
  (for ([child (node-children one-box)]
    #:unless (equal? child (node-fchild one-box)))
	(delete-node! child))
  (for ([child-elt (node-children one-elt)]
    #:unless (equal? child-elt (node-fchild one-elt)))
	(delete-node! child-elt))
       ;;Reconstruct the proof to fit the inductive fact into the set of pre conditions
  (cons (unparse-dom one-dom) postcondition))

;;For Inductive proofs create the problem for the case where the list is 3 items long
(define (two-case component-document precondition postcondition ind-fact)
  (define two-dom (parse-dom component-document))
  (define two-box (dom-boxes two-dom))
  (define two-elt (dom-box->elt two-dom two-box))
  (node-set! (node-next (node-fchild two-box)) ':name 'inductive-base)
  ;;Remove the nodes that arent the first, last, or inductive base form the lisit
  (for ([child (node-children two-box)]
    #:unless (or (equal? child (node-fchild two-box)) (equal? child (node-lchild two-box))))
	(delete-node! child))
  (for ([child-elt (node-children two-elt)]
    #:unless (or (equal? child-elt (node-fchild two-elt)) (equal? child-elt (node-lchild two-elt))))
	(delete-node! child-elt))
  (cons (unparse-dom two-dom) postcondition))

;;For Inductive proofs create the problem for the case where the list is 3 items long
(define (three-case component-document precondition postcondition ind-fact)
  (define three-dom (parse-dom component-document))
  (define three-box (dom-boxes three-dom))
  (define three-elt (dom-box->elt three-dom three-box))
  (node-set! (node-next (node-fchild three-box)) ':name 'inductive-base)
  ;;Remove the nodes that arent the first, last, or inductive base form the lisit
  (for ([child (node-children three-box)]
    #:unless (or (equal? child (node-fchild three-box)) (equal? child (node-next (node-fchild three-box))) (equal? child (node-lchild three-box))))
	(delete-node! child))
  (for ([child-elt (node-children three-elt)]
    #:unless (or (equal? child-elt (node-fchild three-elt)) (equal? child-elt (node-next (node-fchild three-elt))) (equal? child-elt (node-lchild three-elt))))
	(delete-node! child-elt))
       ;;Reconstruct the proof to fit the inductive fact into the set of pre conditions
  (match-define (list `(forall (,three-varss ...) (=> ,three-press ... ,three-posts)) ...) postcondition)
  (define three-test 
    (for/list ([three-vars three-varss] [three-pres three-press] [three-post three-posts])
     `(forall (,@three-vars) (=> ,@three-pres  (let ([inductive-footer inductive-base] [inductive-header inductive-base]) ,@ind-fact)))))
  (cons (unparse-dom three-dom) three-test))

;;For inductive proofs create the problem for the base case
(define (base-case component-document precondition postcondition ind-fact) 
  (define base-dom (parse-dom component-document))
  (define base-box (dom-boxes base-dom))
  (define base-elt (dom-box->elt base-dom base-box))
  (node-set! (node-prev (node-lchild base-box)) ':no-next #t)
  (node-set! (node-lchild base-box) ':no-prev #t)
  ;;Name the inductive base
  (node-set! (node-next (node-fchild base-box)) ':name 'inductive-baseA)
  (node-set! (node-prev (node-lchild base-box)) ':name 'inductive-baseB)
  ;;Remove the nodes that arent the first, last, or inductive base form the lisit
  (for ([child (node-children base-box)]
    #:unless (or (equal? child (node-fchild base-box)) (equal? child (node-next (node-fchild base-box))) (equal? child (node-prev (node-lchild base-box))) (equal? child (node-lchild base-box))))
	(delete-node! child))
  (for ([child-elt (node-children base-elt)]
    #:unless (or (equal? child-elt (node-fchild base-elt)) (equal? child-elt (node-next (node-fchild base-elt))) (equal? child-elt (node-prev (node-lchild base-elt))) (equal? child-elt (node-lchild base-elt))))
	(delete-node! child-elt))
  ;;Reconstruct the proof to fit the inductive fact into the set of pre conditions
  (match-define (list `(forall (,base-varss ...) (=> ,base-press ... ,base-posts)) ...) postcondition)
  (define base-test 
    (for/list ([base-vars base-varss] [base-pres base-press] [base-post base-posts])
     `(forall (,@base-vars) (=> ,@base-pres  (let ([inductive-footer inductive-baseB] [inductive-header inductive-baseA]) ,@ind-fact)))))
  (cons (unparse-dom base-dom) base-test))

;;For inductive proofs create the problem for the ind case
(define (ind-case component-document precondition postcondition ind-fact)
  (define ind-dom (parse-dom component-document))
  (define ind-box (dom-boxes ind-dom))
  (define ind-elt (dom-box->elt ind-dom ind-box))
  (define ind-clone (clone-node (node-prev (node-lchild ind-box))))
  (add-node-before! (node-prev (node-lchild ind-box)) ind-clone)
  (define ind-elt-clone (clone-node (node-prev (node-lchild (dom-box->elt ind-dom ind-box)))))
  (add-node-before! (node-prev (node-lchild (dom-box->elt ind-dom ind-box))) ind-elt-clone)
  (node-set! (node-prev (node-prev (node-lchild ind-box))) ':elt (node-id ind-elt-clone))
  ;;Add the proper tags to the inductive header, inductive footer, and end of the list to get the correct inductive behaviour from Cassius
  (node-set! (node-next (node-fchild ind-box)) ':no-next #t)
  (node-set! (node-prev (node-prev (node-lchild ind-box))) ':no-prev #t)
  (node-set! (node-prev (node-lchild ind-box)) ':no-next #t)
  (node-set! (node-lchild ind-box) ':no-prev #t)
  ;;Name the inductive header, step, and footer
  (node-set! (node-next (node-fchild ind-box)) ':name 'inductive-header)
  (node-set! (node-prev (node-prev (node-lchild ind-box))) ':name 'inductive-footer)
  (node-set! (node-prev (node-lchild ind-box)) ':name 'inductive-step)
  ;;Reconstruct the proof to fit the inductive fact into the set of pre conditions
  (match-define (list `(forall (,ind-varss ...) (=> ,ind-press ... ,ind-posts)) ...) postcondition)
  (define ind-test 
    (for/list ([ind-vars ind-varss] [ind-pres ind-press] [ind-post ind-posts])
      `(forall (,@ind-vars) (=> ,@ind-pres ,@ind-fact (let ([inductive-footer inductive-step]) ,@ind-fact)))))
  (cons (unparse-dom ind-dom) ind-test))

;;For inductive proofs create the problem for the thm case
(define (thm-case component-document precondition postcondition ind-fact)
  (define thm-dom (parse-dom component-document))
  (define thm-box (dom-boxes thm-dom))
  (node-set! (node-next (node-fchild thm-box)) ':no-next #t)
  (node-set! (node-prev (node-lchild thm-box)) ':no-prev #t)
  ;;Name the inductive header and footer
  (node-set! (node-next (node-fchild thm-box)) ':name 'inductive-header)
  (node-set! (node-prev (node-lchild thm-box)) ':name 'inductive-footer)
  ;;Reconstruct the proof to fit the inductive fact into the set of pre conditions
  (match-define (list `(forall (,thm-varss ...) (=> ,thm-press ... ,thm-posts)) ...) postcondition)
  (define thm-test 
    (for/list ([thm-vars thm-varss] [thm-pres thm-press] [thm-post thm-posts])
      `(forall (,@thm-vars) (=> ,@thm-pres ,@ind-fact ,thm-post))))
  (cons (unparse-dom thm-dom) thm-test))

(define-syntax-rule (while condition body ...)
  (let loop ()
    (cond
     [condition
      body ...
      (loop)]
     [else
      (void)])))

;; Produces the documents and problems for the different cases of a proof by induction and returns a list of those cases based on the input document and pre and post conditions
(define (inductive-cases component-document precondition postcondition)
  (define list-dom (parse-dom component-document))
  (define list-box (dom-boxes list-dom))
  (define list-elt (dom-box->elt list-dom list-box))
  (define ind-fact (node-get* list-box ':inductive-fact))
  (define name (node-get list-box ':name))

  ;;If the list has an inductive fact and it has 4 or more elements, set up a proof by induction
  (cond
    ;;When no induction is requested, do nothing
    [(not ind-fact)
     (list (cons component-document postcondition))]

    ;;When induction is requested, but the list given is empty, print out a warning and do nothing
    [(and (= (length (node-children list-box)) 0) ind-fact)
     (eprintf "Warning: Cannot induct over empty component ~a. Proving ~a directly\n" name name name)
     (list (cons component-document postcondition))]
    [(< (length (node-children list-box)) 4)
     (eprintf "Warning: Generating new elements for inductive component ~a.\n" name)
     (while (< (length (node-children list-box)) 4)
       (define box-clone (clone-node (node-lchild list-box)))
       (define elt-clone (clone-node (node-lchild list-elt)))
       (add-node-before! (node-lchild list-box) box-clone)
       (add-node-before! (node-lchild list-elt) elt-clone)
       (node-set! box-clone ':elt (node-id elt-clone)))
     (inductive-cases (unparse-dom list-dom) precondition postcondition)]
    [(< 4 (length (node-children list-box)))
     (while (< 4 (length (node-children list-box)))
       (delete-node! (node-prev (node-lchild list-box)))
       (delete-node! (node-prev (node-lchild list-elt))))
     (inductive-cases (unparse-dom list-dom) precondition postcondition)]

    ;;When induction is requested and the list given has at least 4 elements create and return the list of cases for induction
    [(>= (length (node-children list-box)) 4)
     ;;Return a list of the documents of each of the cases
     (list   (one-case component-document precondition postcondition ind-fact)
	     (two-case component-document precondition postcondition ind-fact)
       	     (three-case component-document precondition postcondition ind-fact)
	     (base-case component-document precondition postcondition ind-fact)
	     (thm-case component-document precondition postcondition ind-fact)
	     (ind-case component-document precondition postcondition ind-fact))]))

(define (modularize problem)
  (define fonts (dict-ref problem ':fonts))
  (define sheets (dict-ref problem ':sheets))
  (for*/list ([doc (dict-ref problem ':documents)] 
	      [(name thing) (split-document doc)]
	      [case* (inductive-cases (car thing) 'todo-no-precondition (cdr thing))]
              #:unless (null? (cdr thing)))
    (match-define (cons piece specs) case*)
    (define problem*
      (dict-set* problem
                 ':documents (list piece)
                 ':name (list (dom-name piece))
                 ':tests specs
                 ':tool '(assert)))
    (for/fold ([problem problem*]) ([pruning-function pruning-functions])
      (pruning-function problem))))
