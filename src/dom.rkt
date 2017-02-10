#lang racket
(require "common.rkt" "registry.rkt" "tree.rkt")

(provide (struct-out dom) dom-context in-elements in-boxes elements-difference parse-dom)

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

(define (elements-difference from to)
  (let/ec return
    (let loop ([from from] [to to])
      (for ([cls (set-subtract (node-get to ':class #:default '()) (node-get from ':class #:default '()))])
        (return (list 'add-class from cls)))
      (for ([cls (set-subtract (node-get from ':class #:default '()) (node-get to ':class #:default '()))])
        (return (list 'remove-class from cls)))
      (unless (equal? (node-get from ':id) (node-get to ':id))
        (return (list 'set-id from (node-get to ':id))))
      (unless (= (length (node-children from)) (length (node-children to)))
        (return (list 'children from to)))
      (for-each loop (node-children from) (node-children to)))
    (return #f)))

(define (parse-dom doc)
  (match-define (dom name ctx elts boxes) doc)
  (dom name ctx (parse-tree elts) (parse-tree boxes)))
