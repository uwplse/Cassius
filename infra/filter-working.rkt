#lang racket

(require json)

(define (filter-problems data working not-working)
  (define working-set
    (for/set ([rec (dict-ref data 'problems)] #:when (equal? (dict-ref rec 'status) "success"))
      (dict-ref rec 'problem)))

  (define failing-set
    (for/set ([rec (dict-ref data 'problems)] #:when (equal? (dict-ref rec 'status) "fail"))
      (dict-ref rec 'problem)))

  (define (output sexp)
    (lambda (port)
      (pretty-print sexp port 1)
      (newline port)))

  (define result #f)
  (for ([sexp (in-port read)])
    (match sexp
      [`(define-stylesheet ,name ,_ ...)
       (cond
         [(set-member? working-set (~a name))
          (set! result 'success)
          (call-with-output-file working #:exists 'append (output sexp))]
         [(set-member? failing-set (~a name))
          (set! result 'failure)
          (call-with-output-file not-working #:exists 'append (output sexp))]
         [else (set! result #f)])]
      [_
       (match result
         ['success (call-with-output-file working #:exists 'append (output sexp))]
         ['failure (call-with-output-file not-working #:exists 'append (output sexp))]
         [else #f])])))

(module+ main
  (command-line
   #:program "filter-working.rkt"
   #:args (json working not-working)
   ;; Clear output files
   (call-with-output-file working #:exists 'replace (lambda (port) (display "" port)))
   (call-with-output-file not-working #:exists 'replace (lambda (port) (display "" port)))
   (filter-problems
    (call-with-input-file json read-json)
    working
    not-working)))
