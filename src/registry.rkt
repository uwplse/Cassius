#lang racket

(require "common.rkt")
(provide name by-name)

(define name-registry (make-hash))

(define (name kind thing [default #f])
  (cond
   [thing
    (define registry (dict-ref! name-registry kind make-hash))
    (dict-ref! registry thing (sformat "~a~a" kind (dict-count registry)))]
   [else
    default]))

(define (by-name kind name)
  (for/first ([(thing name*) (dict-ref name-registry kind)]
              #:when (equal? name name*))
    thing))
