#lang racket

(require "common.rkt")
(provide name by-name all-by-name reset-names!)

(define name-registry (make-hash))

(define (name kind thing [default #f])
  (cond
   [thing
    (define registry (dict-ref! name-registry kind make-hash))
    (dict-ref! registry thing (dict-count registry))]
   [else
    default]))

(define (by-name kind name)
  (for/first ([(thing name*) (dict-ref name-registry kind)]
              #:when (equal? name name*))
    thing))

(define (all-by-name kind)
  (dict-ref name-registry kind '()))

(define (reset-names!)
  (dict-clear! name-registry))
