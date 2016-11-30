#lang racket
(module+ test (require rackunit))

(define (solver-compose f g)
  (define intermediate-program #f)
  (define intermediate-spec '())

  (λ (sketch spec)
    (let loop ()
      (if intermediate-program
          (match (g intermediate-program spec)
            [`(fwd ,out) out]
            [`(bwd ,spec*)
             (set! intermediate-spec (cons spec* intermediate-spec))
             (set! intermediate-program #f)
             (loop)])
          (match (f sketch intermediate-spec)
            [`(fwd ,out)
             (set! intermediate-program out)
             (loop)]
            [`(bwd ,spec*) spec*])))))

(module+ test
  ;; This is a very stupid synthesizer that synthesizes a list of values
  ;; The spec is a list ((i . v) ...) of indexes and values for that index
  ;; The synthesizer takes an already-built prefix and extends it by entries.
  (define (bits-synthesizer prefix spec)
    (define pN (length prefix))
    (or
     (for/first ([entry spec] #:when (and (< (car entry) pN) (not (= (list-ref prefix (car entry)) (cdr entry)))))
       `(bwd ,entry))
     `(fwd
       ,(append
         prefix
         (for/list ([i (range pN (+ pN 4))])
           (match (for/first ([entry spec] #:when (= (car entry) i)) entry)
             [#f 0]
             [(cons (== i) v) v]))))))
  
  (define byte-synthesizer (solver-compose bits-synthesizer bits-synthesizer))
  (define target '(0 1 1 0 0 1 0 1))
  (check-equal?
   (byte-synthesizer '() (for/list ([i (in-naturals)] [j target]) (cons i j)))
   target))
