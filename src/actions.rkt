#lang racket

(require "selectors.rkt" "tree.rkt")
(provide interpret-action)

(define (interpret-action act handlers tree)
  (define-values (type target vals)
    (match act
      [(list 'click sel)
       (define elts (for/list ([elt (in-tree tree)] #:when (selector-matches? sel elt)) elt))
       (when (not (= (length elts) 1))
         (error "Invalid click action on more than one element" elts))
       (values 'click (car elts) (list (car elts)))]))
  (define handler
    (for/first ([handler handlers]
                #:when (equal? (second handler) type)
                #:when (selector-matches? (first handler) target))
      handler))
  (when handler
    (match-define (list sel evt vars actions ...) handler)
    (define env (map cons vars vals))
    (for ([line actions])
      (interpret-line tree line env))))

(define (interpret-line tree script env)
  (match script
    [(list 'add-class eltexpr cls)
     (define elts (interpret-eltexpr tree eltexpr env))
     (for ([elt elts])
       (node-set! elt ':class (remove-duplicates (append (node-get elt ':class) (list cls)))))]
    [(list 'remove-class eltexpr cls)
     (define elts (interpret-eltexpr tree eltexpr env))
     (for ([elt elts])
       (node-set! elt ':class (filter (λ (x) (not (equal? x cls))) (node-get elt ':class))))]))

(define (interpret-eltexpr tree eltexpr env)
  (match eltexpr
    [(list 'select sel)
     (for/list ([elt (in-tree tree)] #:when (selector-matches? sel elt)) elt)]
    [(list 'parent expr)
     (map node-parent (interpret-eltexpr tree expr env))]
    [(? symbol?)
     (list (dict-ref env eltexpr))]))
