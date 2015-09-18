#lang racket
(require "common.rkt")
(define ToCoqList (lambda (e) (if (null? e) `(Nil) (list `Cons (car e) (ToCoqList (cdr e))))))
(define FromCoqList
  (lambda (e)
    (match e
      [`(Nil) `()]
      [`(Cons, l, r) (cons l (FromCoqList r))])))
(define ToCoq
  (lambda (e)
    (match e
      [`(ite, a, b, c) (list `If (ToCoq a) (ToCoq b) (ToCoq c))]
      [`(and, a, b) (list `And (ToCoq a) (ToCoq b))]
      [(? list?) (list `Unknown (car e) (ToCoqList (map ToCoq (cdr e))))]
      [_ (list `UnknownAtom e)])))
(define ToCoqPrint (lambda (e) (printf "Argument Of ToCoqPrint: ") (pretty-print e) (ToCoq e)))
(define FromCoq
  (lambda (e)
    (match e
      [`(If, a, b, c) (list `ite (FromCoq a) (FromCoq b) (FromCoq c))]
      [`(And, a, b) (list `and (FromCoq a) (FromCoq b))]
      [`(Unknown, l, r) (if (null? r) l (cons l (map FromCoq (FromCoqList r))))]
      [`(UnknownAtom, r) r]
      [_ (error "unknown case")])))
(define FromCoqPrint (lambda (e) (printf "Argument Of FromCoqPrint: ") (pretty-print e) (FromCoq e)))
(provide ToCoq FromCoq ToCoqPrint FromCoqPrint)

