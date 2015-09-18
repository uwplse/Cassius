#lang racket
(require "common.rkt")

(provide sexpr->coq coq->sexpr)

(define/match (list->coqlist e)
  [(`()) `(Nil)]
  [(l) (list `Cons (car l) (list->coqlist (cdr l)))])

(define (coqlist->list e)
  (match e
    [`(Nil) `()]
    [`(Cons, l, r) (cons l (coqlist->list r))]))

(define (sexpr->coq e)
  (match e
    [`(ite, a, b, c) (list `If (sexpr->coq a) (sexpr->coq b) (sexpr->coq c))]
<<<<<<< HEAD
    [(list `and args ...) (list `And (list->coqlist (map sexpr->coq args)))]
    [(list `or args ...) (list `Or (list->coqlist (map sexpr->coq args)))]
    [`(=>, a, b) (list `Imply (sexpr->coq a) (sexpr->coq b))]
=======
    [`(and, a, b) (list `And (sexpr->coq a) (sexpr->coq b))]
>>>>>>> a703946... rename ffi name, put space between definition
    [(list f args ...) (list `Unknown (car e) (list->coqlist (map sexpr->coq (cdr e))))]
    [_ (list `UnknownAtom e)]))

(define (coq->sexpr e)
  (match e
    [`(If, a, b, c) (list `ite (coq->sexpr a) (coq->sexpr b) (coq->sexpr c))]
<<<<<<< HEAD
    [`(And, l) (cons `and (map coq->sexpr (coqlist->list l)))]
    [`(Or, l) (cons `or (map coq->sexpr (coqlist->list l)))]
    [`(Imply, a, b) (list `=> (coq->sexpr a) (coq->sexpr b))]
=======
    [`(And, a, b) (list `and (coq->sexpr a) (coq->sexpr b))]
>>>>>>> a703946... rename ffi name, put space between definition
    [`(Unknown, l, r) (if (null? r) l (cons l (map coq->sexpr (coqlist->list r))))]
    [`(UnknownAtom, r) r]
    [_ (error "unknown case")]))
