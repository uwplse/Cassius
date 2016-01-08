#lang racket
(provide smt->string)

(define (smt->string query)
  (apply string-append
         (for/list ([cmd query])
           (match cmd
             [(list 'echo comment) (format "; ~a\n" comment)]
             [_ (format "~a\n" cmd)]))))
