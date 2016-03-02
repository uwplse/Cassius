#lang racket

(require "common.rkt")
(require "dom.rkt")
(require "modify-dom.rkt")

(provide parse-file (struct-out problem))

(struct problem (desc url header sheet documents features test))

(define (parse-file port)
  (define problems (make-hash))
  (define headers (make-hash))
  (define sheets (make-hash))
  (define docs (make-hash))

  (define (parse-document name)
    (match name
      [`(limit-depth ,n ,x) (dom-limit-depth n (parse-document x))]
      [`(strip-positions ,x) (dom-strip-positions (parse-document x))]
      [`(print-all ,x) (dom-print-all (parse-document x))]
      [(? symbol?) (hash-ref docs name)]))

  (for ([expr (in-port read port)])
    (match expr
      [`(define-stylesheet ,name ,rules ...)
       (define rules*
         (for/list ([rule rules])
           (if (equal? rule '?) '(? ?) rule)))
       (hash-set! sheets name rules*)]
      [`(define-document (,name #:width ,width #:browser ,browser) ,tree)
       (hash-set! docs name (dom name (rendering-context width browser) tree))]
      [`(define-document (,name #:width ,width) ,tree)
       (hash-set! docs name (dom name (rendering-context width #f) tree))]
      [`(define-header ,name ,header)
       (hash-set! headers name header)]
      [`(define-problem ,name #:test ,test #:sheet ,sheet #:documents ,documents ...)
       (hash-set! problems name
                  (problem #f #f #f (hash-ref sheets sheet)
                           (map parse-document documents) '() test))]
      [`(define-problem ,name #:header ,header #:sheet ,sheet #:documents ,documents ...)
       (hash-set! problems name
                  (problem #f #f (hash-ref headers header) (hash-ref sheets sheet)
                           (map parse-document documents) '() #f))]
      [`(define-problem ,name ,desc #:url ,url #:header ,header #:sheet ,sheet #:documents ,documents ... #:features ,feats)
       (hash-set! problems name
                  (problem desc url (hash-ref headers header) (hash-ref sheets sheet)
                           (map parse-document documents) feats #f))]))
  problems)
