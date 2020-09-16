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

;; Produces the documents and problems for the different cases of a proof by induction and returns a list of those cases based on the input document and pre and post conditions
(define (inductive-cases component-document precondition postcondition)
  (define base-dom (parse-dom component-document))
  (define base-box (dom-boxes base-dom))
  (define base-elt (dom-box->elt base-dom base-box))
  (define base2-dom (parse-dom component-document))
  (define base2-box (dom-boxes base2-dom))
  (define base2-elt (dom-box->elt base2-dom base2-box))
  (define thm-box (parse-tree (dom-boxes component-document)))
  (define ind-dom (parse-dom component-document))
  (define ind-box (dom-boxes ind-dom))
  ;;If the list has an inductive fact and it has 4 or more elements, set up a proof by induction
  (cond
    ;;When no induction is requested, do nothing
    [(not (node-get* thm-box ':inductive-fact))
     (list (cons component-document postcondition))]
    ;;When induction is requested, but the list given doesn't have at leaste for elements, print out a warning and do nothing
    [(and (not (and (and (and (and (node-lchild thm-box) (node-fchild thm-box)) (and (node-next (node-fchild thm-box)) (node-prev (node-lchild thm-box)))) (and (not (equal? (node-next (node-fchild thm-box)) (node-lchild thm-box))) (not (equal? (node-next (node-fchild thm-box)) (node-prev (node-lchild thm-box))))))))  (node-get* thm-box ':inductive-fact))
     (begin
       (eprintf "Warning: ~a is to small to induct over on page one of the given pages. ~a Must have at least 4 elements. Skipping induction for ~a\n"   (node-get* thm-box ':name) (node-get* thm-box ':name) (node-get* thm-box ':name))
       (list (cons component-document postcondition)))]
    ;;When induction is requested and the list given has at least 4 elements create and return the list of cases for induction
    [(and (and (and (and (and (node-lchild thm-box) (node-fchild thm-box)) (and (node-next (node-fchild thm-box)) (node-prev (node-lchild thm-box)))) (and (not (equal? (node-next (node-fchild thm-box)) (node-lchild thm-box))) (not (equal? (node-next (node-fchild thm-box)) (node-prev (node-lchild thm-box))))))) (node-get* thm-box ':inductive-fact))
     (begin
       (eprintf "Found inductive fact ~a\n" (node-get* thm-box ':inductive-fact))
       ;;Create the document/proof for the base case
       ;;Name the inductive base
;       (node-set! (node-next (node-fchild base-box)) ':name 'inductive-base)
       ;;Remove the nodes that arent the first, last, or inductive base form the lisit
;       (for ([child (node-children base-box)]
;	    #:unless (or (equal? child (node-fchild base-box)) (equal? child (node-next (node-fchild base-box))) (equal? child (node-lchild base-box))))
;		(delete-node! child))
;       (for ([child-elt (node-children base-elt)]
;	    #:unless (or (equal? child-elt (node-fchild base-elt)) (equal? child-elt (node-next (node-fchild base-elt))) (equal? child-elt (node-lchild base-elt))))
;		(delete-node! child-elt))
       ;;Reconstruct the proof to fit the inductive fact into the set of pre conditions
;       (match-define (list `(forall (,base-varss ...) (=> ,base-press ... ,base-posts)) ...) postcondition)
 ;      (define base-test 
;	 (for/list ([base-vars base-varss] [base-pres base-press] [base-post base-posts])
;	   `(forall (,@base-vars) (=> ,@base-pres  (let ([inductive-footer inductive-base] [inductive-header inductive-base]) ,@(node-get* base-box ':inductive-fact))))))
       ;;Create the document/proof for the base2 case
       ;;Add the relevant tags to the list boxes
       (node-set! (node-prev (node-lchild base2-box)) ':no-next #t)
       (node-set! (node-lchild base2-box) ':no-prev #t)
       ;;Name the inductive base
       (node-set! (node-next (node-fchild base2-box)) ':name 'inductive-baseA)
       (node-set! (node-prev (node-lchild base2-box)) ':name 'inductive-baseB)
       ;;Remove the nodes that arent the first, last, or inductive base form the lisit
       (pretty-print (node-children base2-box))
       (for ([child2 (node-children base2-box)]
	    #:unless (or (equal? child2 (node-fchild base2-box)) (equal? child2 (node-next (node-fchild base2-box))) (equal? child2 (node-prev (node-lchild base2-box))) (equal? child2 (node-lchild base2-box))))
		(delete-node! child2))
       (pretty-print (node-children base2-box))
       (pretty-print (node-children base2-elt))
       (for ([child2-elt (node-children base2-elt)]
	    #:unless (or (equal? child2-elt (node-fchild base2-elt)) (equal? child2-elt (node-next (node-fchild base2-elt))) (equal? child2-elt (node-prev (node-lchild base2-elt))) (equal? child2-elt (node-lchild base2-elt))))
		(delete-node! child2-elt))
       (pretty-print (node-children base2-elt))
       ;;Reconstruct the proof to fit the inductive fact into the set of pre conditions
       (match-define (list `(forall (,base2-varss ...) (=> ,base2-press ... ,base2-posts)) ...) postcondition)
       (define base2-test 
	 (for/list ([base2-vars base2-varss] [base2-pres base2-press] [base2-post base2-posts])
	   `(forall (,@base2-vars) (=> ,@base2-pres  (let ([inductive-footer inductive-baseB] [inductive-header inductive-baseA]) ,@(node-get* base2-box ':inductive-fact))))))
       ;;Create the document/proof for the thm case
       ;;Add the proper tags to the inductive header, inductive footer, and end of the list to get the correct inductive behaviour from Cassius
;       (node-set! (node-next (node-fchild thm-box)) ':no-next #t)
;       (node-set! (node-prev (node-lchild thm-box)) ':no-prev #t)
       ;;Name the inductive header and footer
;       (node-set! (node-next (node-fchild thm-box)) ':name 'inductive-header)
;       (node-set! (node-prev (node-lchild thm-box)) ':name 'inductive-footer)
       ;;Reconstruct the proof to fit the inductive fact into the set of pre conditions
;       (match-define (list `(forall (,thm-varss ...) (=> ,thm-press ... ,thm-posts)) ...) postcondition)
;       (define thm-test 
;	 (for/list ([thm-vars thm-varss] [thm-pres thm-press] [thm-post thm-posts])
;	   `(forall (,@thm-vars) (=> ,@thm-pres ,@(node-get* thm-box ':inductive-fact) ,thm-post))))
       ;;Create the document/proof for the ind case
       ;;Create and add the node for the inductive-step
;       (define ind-clone (clone-node (node-prev (node-lchild ind-box))))
;       (add-node-before! (node-prev (node-lchild ind-box)) ind-clone)
;       (define ind-elt-clone (clone-node (node-prev (node-lchild (dom-box->elt ind-dom ind-box)))))
;       (add-node-before! (node-prev (node-lchild (dom-box->elt ind-dom ind-box))) ind-elt-clone)
;       (node-set! (node-prev (node-prev (node-lchild ind-box))) ':elt (node-id ind-elt-clone))
       ;;Add the proper tags to the inductive header, inductive footer, and end of the list to get the correct inductive behaviour from Cassius
;       (node-set! (node-next (node-fchild ind-box)) ':no-next #t)
;       (node-set! (node-prev (node-prev (node-lchild ind-box))) ':no-prev #t)
;       (node-set! (node-prev (node-lchild ind-box)) ':no-next #t)
;       (node-set! (node-lchild ind-box) ':no-prev #t)
       ;;Name the inductive header, step, and footer
;       (node-set! (node-next (node-fchild ind-box)) ':name 'inductive-header)
;       (node-set! (node-prev (node-prev (node-lchild ind-box))) ':name 'inductive-footer)
;       (node-set! (node-prev (node-lchild ind-box)) ':name 'inductive-step)
       ;;Reconstruct the proof to fit the inductive fact into the set of pre conditions
;       (match-define (list `(forall (,ind-varss ...) (=> ,ind-press ... ,ind-posts)) ...) postcondition)
;       (define ind-test 
;	 (for/list ([ind-vars ind-varss] [ind-pres ind-press] [ind-post ind-posts])
;	   `(forall (,@ind-vars) (=> ,@ind-pres ,@(node-get* ind-box ':inductive-fact) (let ([inductive-footer inductive-step]) ,@(node-get* ind-box ':inductive-fact))))))
       ;;Return a list of the documents of each of the cases
       (list #|(cons (unparse-dom base-dom) base-test)|#
	     (cons (unparse-dom base2-dom) base2-test)
	     #|(cons (struct-copy dom component-document [boxes (unparse-tree thm-box)]) thm-test)|#
	     #|(cons (unparse-dom ind-dom) ind-test)|#))]))

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
