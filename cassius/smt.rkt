#lang racket

(require "common.rkt")

(provide smt-cond asserts)

(define-syntax smt-cond
  (syntax-rules (else)
    [(smt-cond [else body])
     `body]
    [(smt-cond [test body] rest ...)
     `(ite test body ,(smt-cond rest ...))]))

(define-syntax-rule (asserts constraints ...)
  (map (curry list 'assert) `(constraints ...)))
