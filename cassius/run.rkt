#lang racket

(require racket/cmdline)
(require "dom.rkt")
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

(define (run-file fname pname #:debug debug?)
  (match (hash-ref (parse-file (open-input-file fname)) (string->symbol pname))
    [(problem header sheet documents)
     (cassius-solve #:debug debug? #:sheet sheet #:header header documents)]))

(module+ main
  (define debug '())

  (command-line
   #:program "cassius"
   #:multi
   [("-d" "--debug") type "Turn on debug information"
    (set! debug (cons (string->symbol type) debug))]
   #:args (fname problem)
   (run-file fname problem #:debug debug)))
