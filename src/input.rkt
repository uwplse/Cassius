#lang racket

(require "common.rkt")
(require "dom.rkt")
(require "modify-dom.rkt")

(provide parse-file)

(define (parse-file port)
  (define problems (make-hash))
  (define headers (make-hash))
  (define sheets (make-hash))
  (define docs (make-hash))

  (for ([expr (in-port read port)])
    (match expr
      [`(define-stylesheet ,name ,rules ...)
       (hash-set! sheets name rules)]
      [`(define-document (,name ,rest ...) ,tree)
       (define properties (attributes->dict rest))
       (hash-set! docs name (dom name  tree))]
      [`(define-problem ,name ,rest ...)
       (hash-set! problems name (attributes->dict rest))]))

  problems)
