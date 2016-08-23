#lang racket

(require "selectors.rkt" "dom.rkt")

(define (interpret-action act handlers dom)
  (define-values (type target vals)
    (match act
      [(list 'click sel)
       (define elts (for/list ([elt (in-elements dom)] #:when (selector-matches? sel elt)) elt))
       (when (not (= (length elts) 1))
         (error "Invalid click action on more than one element" elts))
       (values 'click (car elts) (list (car elts)))]))
  (define handler
    (for/first ([handler handlers]
                #:when (equal? (second handler) type)
                #:when (selector-matches? (first handler) target))
      handler))
  (match-define (list sel evt vars actions ...) handler)
  (define env (map cons vars vals))
  (for ([line actions])
    (interpret-line dom line env)))

(define (interpret-line dom script env)
  (match script
    [(list 'add-class eltexpr cls)
     (define elts (interpret-eltexpr dom eltexpr env))
     (for ([elt elts])
       (node-set! elt ':class (remove-duplicates (cons cls (node-get elt ':class)))))]
    [(list 'remove-class eltexpr cls)
     (define elts (interpret-eltexpr dom eltexpr env))
     (for ([elt elts])
       (node-set! elt ':class (filter (λ (x) (not (equal? x cls))) (node-get elt ':class))))]))

(define (interpret-eltexpr dom eltexpr env)
  (match eltexpr
    [(list 'select sel)
     (for/list ([elt (in-elements dom)] #:when (selector-matches? sel elt)) elt)]
    [(list 'parent expr)
     (map node-parent (interpret-eltexpr dom expr env))]
    [(? symbol?)
     (list (dict-ref env eltexpr))]))
