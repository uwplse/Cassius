#lang racket

(require "common.rkt")

(provide smt-cond asserts smt-let define-constraints smt-replace smt-and smt-or)

(define-syntax smt-cond
  (syntax-rules (else)
    [(smt-cond [else body])
     `body]
    [(smt-cond [test body] rest ...)
     `(ite test body ,(smt-cond rest ...))]))

(define-syntax-rule (define-constraints name body ...)
  (define name `(body ...)))

(define-syntax-rule (asserts constraints ...)
  (list `(assert (and constraints ...))))

(define-syntax-rule (smt-let bindings constraints ...)
  `(let bindings (and constraints ...)))

(define (smt-and . pieces)
  (define pieces* (filter (λ (x) (not (equal? x 'true))) pieces))
  (if (ormap (curry equal? 'false) pieces*)
      'false
      (match pieces*
        ['() 'true]
        [(list x) x]
        [xs (cons 'and xs)])))

(define (smt-or . pieces)
  (define pieces* (filter (λ (x) (not (equal? x 'false))) pieces))
  (if (ormap (curry equal? 'true) pieces*)
      'true
      (match pieces*
        ['() 'false]
        [(list x) x]
        [xs (cons 'or xs)])))

#|
(define (smt-replace expr bindings)
  (match expr
    [(? (curry dict-has-key? bindings))
     (dict-ref bindings expr)]
    [(list (app list (? (curry dict-has-key? bindings) f)) args ...)
     (apply (dict-ref bindings f) args)]
    [(list f vars ...) (cons f (map (curryr smt-replace bindings) vars))]
    [`(let ((,vars ,vals) ...) ,body)
     `(let (,@(map list vars (map (curryr smt-replace bindings) vals)))
        ,(smt-replace body (dict-remove* bindings vars)))]
    [_ expr]))
|#

(define-syntax-rule (smt-replace expr [pattern body ...] ...)
  (let loop ([e expr])
    (match e
      [pattern body ...] ...
      [x
       (if (list? x)
           (cons (car x) (map loop (cdr x)))
           x)])))
