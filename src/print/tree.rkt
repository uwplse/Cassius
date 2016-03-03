#lang racket

(provide tree->string)

(define (tree->string tree #:indent [indent 0])
  (format "~a([~a ~a]~a~a)"
          (build-string indent (const #\space))
          (caar tree)
          (string-join (map ~a (cdar tree)) " ")
          (if (null? (cdr tree)) "" "\n")
          (string-join (map (λ (t) (tree->string t #:indent (+ indent 1))) (cdr tree)) "\n")))
