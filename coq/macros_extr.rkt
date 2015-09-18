#lang racket/base

(provide lambdas @ match)

(define-syntax lambdas
  (syntax-rules ()
    [(lambdas (a) es ...) (lambda (a) es ...)]
    [(lambdas (a as ...) es ...) (lambda (a) (lambdas (as ...) es ...))]))

(define-syntax @
  (syntax-rules ()
    [(@ e) e]
    [(@ f a as ...) (@ (f a) as ...)]))

(define-syntax match
  (syntax-rules ()
    [(match e) void]
    [(match e ((t as ...) f) cs ...)
      (if (eq? 't (car e))
        (apply (lambda (as ...) f) (cdr e))
        (match e cs ...))]))

