#lang racket
(require "common.rkt")
(provide ToCoq FromCoq ToCoqPrint FromCoqPrint)
(define/match (list->coq e)
  [(`()) `(Nil)]
  [(l) (list `Cons (car l) (list->coq (cdr l)))])
(define coq->list
  (lambda (e)
    (match e
      [`(Nil) `()]
      [`(Cons, l, r) (cons l (coq->list r))])))
(define ToCoq
  (lambda (e)
    (match e
      [`(ite, a, b, c) (list `If (ToCoq a) (ToCoq b) (ToCoq c))]
      [`(and, a, b) (list `And (ToCoq a) (ToCoq b))]
      [(list f args ...) (list `Unknown (car e) (list->coq (map ToCoq (cdr e))))]
      [_ (list `UnknownAtom e)])))
(define ToCoqPrint (lambda (e) (printf "Argument Of ToCoqPrint: ") (pretty-print e) (ToCoq e)))
(define FromCoq
  (lambda (e)
    (match e
      [`(If, a, b, c) (list `ite (FromCoq a) (FromCoq b) (FromCoq c))]
      [`(And, a, b) (list `and (FromCoq a) (FromCoq b))]
      [`(Unknown, l, r) (if (null? r) l (cons l (map FromCoq (coq->list r))))]
      [`(UnknownAtom, r) r]
      [_ (error "unknown case")])))
(define FromCoqPrint (lambda (e) (printf "Argument Of FromCoqPrint: ") (pretty-print e) (FromCoq e)))

