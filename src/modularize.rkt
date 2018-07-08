#lang racket

(require "common.rkt" "tree.rkt" "dom.rkt" "smt.rkt" "prune.rkt")
(provide modularize)

(define (split-document doc)
  (define out (make-hash))
  (let loop ([tree (dom-boxes doc)])
    (define children* (map loop (rest tree)))
    (match (member ':split (first tree))
      [(list _ name _ ...)
       (let* ([component (parse-tree (cons (first tree) children*))]
              [specs (node-get* component ':spec #:default '())]
              [asserts (node-get* component ':assert #:default '())]
              [ctx (dom-properties doc)])
         (node-remove! component ':spec)
         (node-remove! component ':assert)
         (node-remove! component ':admit)
         (define props
           (if (eq? tree (dom-boxes doc)) ctx (dict-set ctx ':component '())))
         (hash-set! out name
                    (cons (struct-copy dom doc
                                       [name (node-get component ':name #:default false)]
                                       [boxes (unparse-tree component)]
                                       [properties props])
                          (append specs asserts)))
         (unless (eq? tree (dom-boxes doc))
           (node-add! component ':component 'true))
         (node-set*! component ':spec specs)
         (list (first (unparse-tree component))))]
      [_
       (cons (first tree) children*)]))
  out)

(define (rename-problem problem n)
  (dict-set problem ':documents
            (list-update (dict-ref problem ':documents #f) 0
                         (λ (x)
                           (struct-copy dom x [name n])))))

(define (modularize problem)
  (define fonts (dict-ref problem ':fonts))
  (define sheets (dict-ref problem ':sheets))
  (define sheets* sheets #;(prune-sheets sheets (map dom-elements (dict-ref problem ':documents))))
  (cons
   (rename-problem (dict-set (dict-set problem ':render false) ':sheets sheets*) ':check)
   (for*/list ([doc (dict-ref problem ':documents)] [(name thing) (split-document doc)])
     (match-define (cons piece specs) thing)
     (define elements* (prune-elements (dom-boxes piece) (dom-elements piece)))
     (define sheets** (prune-sheets sheets* (list elements*)))
     (define elements** (prune-attrs elements* sheets** specs))
     (define fonts* (prune-fonts fonts sheets**))
     (dict-set* problem
                ':documents (list (struct-copy dom piece [elements elements**]))
                ':test specs
                ':sheets sheets**
                ':fonts fonts*))))
