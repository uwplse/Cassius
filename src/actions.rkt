#lang racket

(require "selectors.rkt" "tree.rkt")
(provide interpret-action)

(define (interpret-action target-expr act handlers tree)
  (match-define (list target)
                (for/list ([elt (in-tree tree)] #:when (selector-matches? target-expr elt)) elt))

  (define-values (type vals)
    (match act
      [`(click) (values 'click (list))]))

  (define handler
    (for/first ([handler handlers]
                #:when (equal? (second handler) type)
                #:when (selector-matches? (first handler) target))
      handler))

  (when handler
    (match-define (list sel evt vars script ...) handler)
    (interpret-script tree script (cons (cons 'this (list target)) (map cons vars vals)))))

(define (interpret-script tree script env)
  (for ([line script])
    (interpret-line tree line env)))

(define (interpret-line tree line env)
  (match line
    [(list 'add-class eltexpr cls)
     (define elts (interpret-eltexpr tree eltexpr env))
     (for ([elt elts])
       (node-set! elt ':class (remove-duplicates (append (node-get elt ':class #:default '()) (list cls)))))]
    [(list 'remove-class eltexpr cls)
     (define elts (interpret-eltexpr tree eltexpr env))
     (for ([elt elts])
       (node-set! elt ':class (filter (λ (x) (not (equal? x cls))) (node-get elt ':class #:default '()))))]))

(define (interpret-eltexpr tree eltexpr env)
  (match eltexpr
    [(list 'select sel)
     (for/list ([elt (in-tree tree)] #:when (selector-matches? sel elt)) elt)]
    [(list 'parent expr)
     (map node-parent (interpret-eltexpr tree expr env))]
    [(? symbol?)
     (dict-ref env eltexpr)]))
