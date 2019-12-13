#lang racket
(require rackunit "../z3.rkt")
(provide add-header! check-sat)

(define z3-header (make-parameter '((set-option :produce-unsat-cores true))))
(define (add-header! h) (z3-header (append (z3-header) h)))

(define (z3-check constraints evals)
  (call-with-z3
   (λ (z3)
     (z3-send z3 constraints)
     (match (z3 '(check-sat))
       [`(core ,_) #f]
       [`(model ,model)
        (cons model
              (for/list ([eval evals])
                (z3 (list 'eval eval))))]))))

(define-check (check-sat vars expr to-print)
  (define constraints
     `(,@(z3-header)
       ,@(for/list ([(var type) (in-dict vars)])
           `(declare-const ,var ,type))
       (assert (not ,expr))))
  (match (z3-check constraints to-print)
    [#f (void)]
    [(list m evals ...)
     (with-check-info*
      (append
       (for/list ([(k v) (in-dict m)])
         (make-check-info k v))
       (for/list ([expr to-print] [result evals] [i (in-naturals)])
         (make-check-info (string->symbol (format "expr ~a" i)) (list expr '-> result))))
      (λ () (fail-check)))]))
