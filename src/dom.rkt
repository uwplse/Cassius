#lang racket
(require "common.rkt" "registry.rkt" "tree.rkt")

(provide (struct-out dom) dom-context in-elements in-boxes)

(struct dom (name properties elements boxes))
(struct element (type attrs parent* children)
        #:mutable
        #:methods gen:custom-write
        [(define (write-proc elt port mode)
           (fprintf port "[~a ~a]"
                    (element-type elt)
                    (string-join (map ~a (element-attrs elt)) " ")))])

(define (dom-context dom key #:default [default #f])
  (dict-ref (dom-properties dom) key default))

(define in-elements (compose in-tree dom-elements))
(define in-boxes    (compose in-tree dom-boxes))

