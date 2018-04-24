#lang racket

(require "common.rkt" "tree.rkt" "dom.rkt")
(provide modularize)

(define (split-document doc)
  (reap [sow]
    (let loop ([tree (dom-boxes doc)])
      (define children* (map loop (rest tree)))
      (if (set-member? (first tree) ':spec)
          (let* ([component (parse-tree (cons (first tree) children*))]
                 [spec (node-get component ':spec)]
                 [ctx (dom-properties doc)])
            (node-remove! component ':spec)
            (define props
              (if (eq? tree (dom-boxes doc)) ctx (dict-set ctx ':component '())))
            (sow (cons (struct-copy dom doc
                                    [name (node-get component ':name #:default false)]
                                    [boxes (unparse-tree component)]
                                    [properties props])
                       spec))
            (unless (eq? tree (dom-boxes doc))
              (node-add! component ':component 'true))
            (node-add! component ':spec spec)
            (list (first (unparse-tree component))))
          (cons (first tree) children*)))))

(define (modularize problem)
  (cons
   (dict-set problem ':render false)
   (for/list ([(piece spec) (in-dict (append-map split-document (dict-ref problem ':documents)))])
     (dict-set (dict-set problem ':documents (list piece)) ':test (list spec)))))
