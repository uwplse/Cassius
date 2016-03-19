#lang racket

(provide tree->string)

(define (tree->string tree #:indent [indent 0])
  (format "~a([~a ~a]~a~a)"
          (build-string indent (const #\space))
          (caar tree)
          (string-join
           (let loop ([props (cdar tree)])
             (match props
               [(list attr `(bad ,val) rest ...)
                (cons (format "\33[1;31m~a ~a\33[0m" attr val) (loop rest))]
               [(list attr val rest ...)
                (cons (format "~a ~a" attr val) (loop rest))]
               [(list) '()]))
           " ")
          (if (null? (cdr tree)) "" "\n")
          (string-join (map (λ (t) (tree->string t #:indent (+ indent 1))) (cdr tree)) "\n")))
