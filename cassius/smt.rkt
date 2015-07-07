#lang racket

(require "common.rkt")

(provide smt-cond)

(define-syntax smt-cond
  (syntax-rules (else)
    [(smt-cond [else body])
     `body]
    [(smt-cond [test body] rest ...)
     `(ite test body ,(smt-cond rest ...))]))
