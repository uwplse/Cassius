#lang racket

(require racket/runtime-path racket/path)
(require racket/cmdline)
(require "dom.rkt")
(require "z3.rkt")
(require "main.rkt")

(struct problem (header sheet documents))

(define (parse-file port)
  (define problems (make-hash))
  (define headers (make-hash))
  (define sheets (make-hash))
  (define docs (make-hash))
  (for ([expr (in-port read port)])
    (match expr
      [`(define-stylesheet ,name ,rules ...)
       (hash-set! sheets name rules)]
      [`(define-document (,name #:width ,width) ,tree)
       (hash-set! docs name (dom name #f (rendering-context width) tree))]
      [`(define-header ,name ,header)
       (hash-set! headers name header)]
      [`(define-problem ,name #:header ,header #:sheet ,sheet #:documents ,documents ...)
       (hash-set! problems name
                  (problem (hash-ref headers header) (hash-ref sheets sheet)
                           (map (curry hash-ref docs) documents)))]))
  problems)

(define (run-file fname pname #:debug debug? #:output outname)
  (define time-start (current-inexact-milliseconds))
  (match (hash-ref (parse-file (open-input-file fname)) (string->symbol pname))
    [(problem header sheet documents)
     (define constraints (all-constraints sheet documents))
     (define time-constraints (current-inexact-milliseconds))

     (define query (z3-prepare constraints))
     (define time-prepare (current-inexact-milliseconds))

     (define model (z3-solve query #:debug debug? #:get-unsat unsat-constraint-info))
     (define time-solve (current-inexact-milliseconds))

     (with-output-to-file outname #:exists 'replace
       (lambda () (print-rules #:stylesheet sheet #:header header model)))

     (eprintf "Solved in ~as: [~as] constraints [~as] prepare [~as] solve\n"
              (~r #:precision '(= 3) (/ (- (current-inexact-milliseconds) time-start) 1000))
              (~r #:precision '(= 3) #:min-width 8 (/ (- time-constraints time-start) 1000))
              (~r #:precision '(= 3) #:min-width 8 (/ (- time-prepare time-constraints) 1000))
              (~r #:precision '(= 3) #:min-width 8 (/ (- time-solve time-prepare) 1000)))
     (eprintf "Used ~a constraints (compiled to ~a)\n" (length constraints) (length query))]))

(module+ main
  (define debug '())
  (define-runtime-path default-out-file "../test.css")
  (define out-file default-out-file)

  (command-line
   #:program "cassius"
   #:multi
   [("-d" "--debug") type "Turn on debug information"
    (set! debug (cons (string->symbol type) debug))]
   #:once-each
   [("-o" "--output") fname "File name for final CSS file"
    (set! out-file fname)]
   #:args (fname problem)
   (run-file fname problem #:output out-file #:debug debug)))
