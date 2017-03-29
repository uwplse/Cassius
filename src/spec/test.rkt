#lang racket
(require rackunit "../z3.rkt")
(provide add-header! check-sat)

(define z3-header (make-parameter '((set-option :produce-unsat-cores true))))
(define (add-header! h) (z3-header (append (z3-header) h)))

(define (check-sat #:vars [vars '()] expr)
  (check-match
   (z3-solve
    `(,@(z3-header)
      ,@(for/list ([(var type) (in-dict vars)])
          `(declare-const ,var ,type))
      (assert (not ,expr))))
   (list 'core _)))
