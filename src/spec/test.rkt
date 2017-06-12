#lang racket
(require rackunit "../z3.rkt")
(provide add-header! check-sat)

(define z3-header (make-parameter '((set-option :produce-unsat-cores true))))
(define (add-header! h) (z3-header (append (z3-header) h)))

(define-check (check-sat vars expr)
  (define constraints
     `(,@(z3-header)
       ,@(for/list ([(var type) (in-dict vars)])
           `(declare-const ,var ,type))
       (assert (not ,expr))))
  (with-output-to-file
      "test.z3"
    #:exists 'replace
      (lambda ()
        (begin
          (for ([constraint constraints])
            (display constraint)
            (newline))
          (display "(check-sat)"))))
  (define out
    (z3-solve constraints))
  (match out
    [(list 'core _)
     (void)]
    [(list 'model m)
     (with-check-info*
      (for/list ([(k v) (in-dict m)])
        (make-check-info k v))
      (λ () (fail-check)))]))
