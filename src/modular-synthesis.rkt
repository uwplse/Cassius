#lang racket
(module+ test (require rackunit))

(define (solver/c language1 language2)
  (match-define (cons syntax1 semantics1) language1)
  (match-define (cons syntax2 semantics2) language2)
  (-> semantics2 syntax1
      (or/c (list/c (symbols 'fwd) syntax2)
            (list/c (symbols 'bwd) semantics1))))

(define (solver-compose f g #:add [add cons])
  (define intermediate-program #f)
  (define intermediate-spec '())

  (λ (sketch spec)
    (let loop ()
      (if intermediate-program
          (match (g intermediate-program spec)
            [`(fwd ,out) out]
            [`(bwd ,spec*)
             (set! intermediate-spec (add spec* intermediate-spec))
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
  (define (bits-solver prefix spec)
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
  
  (define byte-solver (solver-compose bits-solver bits-solver))
  (define target '(0 1 1 0 0 1 0 1))
  (check-equal?
   (byte-solver '() (for/list ([i (in-naturals)] [j target]) (cons i j)))
   target)

  (define word-synthesizer (solver-compose byte-solver byte-solver))
  (define target2 '(0 1 1 0 0 1 0 1 1 0 0 1 1 1 0 0 1))
  (check-equal?
   (byte-solver '() (for/list ([i (in-naturals)] [j target2]) (cons i j)))
   target))
