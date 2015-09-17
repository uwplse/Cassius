#lang racket
(require "common.rkt")
(define ToCoq
  (lambda (e)
    (match e
      [`(ite, a, b, c) (list `If (ToCoq a) (ToCoq b) (ToCoq c))]
      [`(and, a, b) (list `And (ToCoq a) (ToCoq b))]
      [(? list?) (list `Unknown (car e) (map ToCoq (cdr e)))]
      [_ (list `Unknown e `())])))
(define FromCoq
  (lambda (e)
    (match e
      [`(If, a, b, c) (list `ite (FromCoq a) (FromCoq b) (FromCoq c))]
      [`(And, a, b) (list `and (FromCoq a) (FromCoq b))]
      [`(Unknown, l, nil) l]
      [`(Unknown, l, r) (list l (map FromCoq r))])))