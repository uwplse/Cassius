#lang racket
(provide smt->string)

(define (smt->string query)
  ;(printf "~a\n\n\n" query)
  (apply string-append
         (for/list ([cmd query])
           (match cmd
             [(list 'echo comment) (format "; ~a\n" comment)]
             [_ (format "~a\n" cmd)])))) ;; each block of constraings = cmd
