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

(define (modularize problem)
  (define fonts (dict-ref problem ':fonts))
  (define sheets (dict-ref problem ':sheets))
  (for*/list ([doc (dict-ref problem ':documents)] [(name thing) (split-document doc)]
              #:unless (null? (cdr thing)))
    (match-define (cons piece specs) thing)
    (define elements* (prune-elements (dom-boxes piece) (dom-elements piece)))
    (define sheets* (prune-sheets sheets (list elements*)))
    (define elements** (prune-attrs elements* sheets* specs))
    (define fonts* (prune-fonts fonts sheets*))
    (define-values (boxes* elements***) (prune-renumber (dom-boxes piece) elements**))
    (define boxes** (prune-box-attrs boxes*))
    (dict-set* problem
               ':documents (list (struct-copy dom piece [elements elements***] [boxes boxes**]))
               ':name (list (dom-name piece)) 
               ':tests specs
               ':tool '(assert)
               ':sheets sheets*
               ':fonts fonts*
               ':title '("[removed for caching]")
               ':url '("[removed for caching]")
               ':features '()))
    (dict-set* dom 'name "replaced-for-caching"))
