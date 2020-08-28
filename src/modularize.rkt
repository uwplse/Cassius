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
  (define thm-box (parse-tree (dom-boxes component-document)))
  (pretty-print thm-box)
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
       ;;Create the document/proof for the base2 case
       ;;Create the document/proof for the thm case
       ;;Add the proper tags to the inductive header, inductive footer, and end of the list to get the correct inductive behaviour from Cassius
       (node-set*! (node-next (node-fchild thm-box)) ':no-next #t)
       (node-set*! (node-prev (node-lchild thm-box)) ':no-prev-or-next #t)
       (node-set*! (node-lchild thm-box) ':no-prev #t)
       ;;Name the inductive header and footer
       (node-set*! (node-next (node-fchild thm-box)) ':name "inductive-header")
       (node-set*! (node-prev (node-lchild thm-box)) ':name "inductive-footer")
       ;;Reconstruct the proof to fit the inductive fact into the set of pre conditions
       (pretty-print postcondition)
       ;;Create the document/proof for the ind case
       (list (cons component-document postcondition)))]))

(define (modularize problem)
  (define fonts (dict-ref problem ':fonts))
  (define sheets (dict-ref problem ':sheets))
  (for*/list ([doc (dict-ref problem ':documents)] 
	      [(name thing) (split-document doc)]
	      [cases (inductive-cases (car thing) 'todo-no-precondition (cdr thing))]
              #:unless (null? (cdr thing)))
    (match-define (cons piece specs) thing)
    (define problem*
      (dict-set* problem
                 ':documents (list piece)
                 ':name (list (dom-name piece))
                 ':tests specs
                 ':tool '(assert)))
    (for/fold ([problem problem*]) ([pruning-function pruning-functions])
      (pruning-function problem))))
