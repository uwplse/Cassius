#lang racket

(require "common.rkt")
(require "dom.rkt")
(require "modify-dom.rkt")

(provide parse-file)

(define (parse-file port)
  (define problems (make-hash))
  (define sheets (make-hash))
  (define docs (make-hash))

  (for ([expr (in-port read port)])
    (match expr
      [`(define-stylesheet ,name ,rules ...)
       (hash-set! sheets name rules)]
      [`(define-document (,name ,rest ...) ,tree)
       (define properties (attributes->dict rest))
       (hash-set! docs name (dom name properties tree))]
      [`(define-problem ,name ,rest ...)
       (define properties (attributes->dict rest))
       (set! properties (dict-update properties ':sheets (curry map (curry dict-ref sheets))))
       (set! properties (dict-update properties ':documents (curry map (curry dict-ref docs))))
       (hash-set! problems name properties)]))

  problems)
