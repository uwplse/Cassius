#lang racket

(require "common.rkt")

(provide smt-cond asserts smt-let define-constraints)

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
