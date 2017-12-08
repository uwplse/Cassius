#lang racket

(require json)

(define (filter-problems data)
  (define working-set
    (for/set ([rec data] #:when (equal? (dict-ref rec 'status) "success"))
      (dict-ref rec 'problem)))

  (define (output sexp)
    (pretty-print sexp (current-output-port) 1)
    (newline))

  (for ([sexp (in-port read)])
    (match sexp
      [`(define-problem ,name ,_ ...)
       (when (set-member? working-set (~a name))
         (output sexp))]
      [_
       (output sexp)])))

(module+ main
  (command-line
   #:program "filter-working.rkt"
   #:args (json)
   (filter-problems (call-with-input-file json read-json))))
