#lang racket

(require "common.rkt")

(provide smt-cond asserts smt-let)

(define-syntax smt-cond
  (syntax-rules (else)
    [(smt-cond [else body])
     `body]
    [(smt-cond [test body] rest ...)
     `(ite test body ,(smt-cond rest ...))]))

(define-syntax-rule (asserts constraints ...)
  (list `(assert (and constraints ...)))
  #;(map (curry list 'assert) `(constraints ...)))

(define-syntax-rule (smt-let bindings constraints ...)
  `(let bindings (and constraints ...)))
