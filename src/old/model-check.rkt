#lang racket
(require "common.rkt")

(provide generate-from-template)

(define (split-into n k)
  (cond
   [(= n 0) (list (build-list k (const 0)))]
   [(= k 1) (list (list n))]
   [(= k 0) empty]
   [else
    (apply append
           (for/list ([i (in-range 0 (+ 1 n))])
             (map (curry cons i) (split-into (- n i) (- k 1)))))]))

(define (partition-list n)
  (if (= n 0)
      (list empty)
      (apply append
             (for/list ([i (in-range 1 (+ n 1))])
               (split-into (- n i) i)))))

(define (split-body l)
  (match l
    [`(,elt * ,rest ...) (cons (cons '* elt) (split-body rest))]
    [`(,elt ,rest ...) (cons (cons 1 elt) (split-body rest))]
    [`() '()]))

(define (assign-split split parts)
  (let loop ([split split] [parts parts])
    (if (null? parts)
        empty
        (match (car parts)
          [`(* . ,x) (cons (partition-list (car split)) (loop (cdr split) (cdr parts)))]
          [`(,n . ,x) (cons (list (list (car split))) (loop (cdr split) (cdr parts)))]))))

(define (generate-from-template dom i)
  (if (list? dom)
      (let ([parts (split-body (cdr dom))])
        (remove-duplicates
         (for/reap [sow] ([split (split-into i (length parts))])
                   (define split* (assign-split split parts))
                   (define splitschemes (cartesian-product split*))
                   
                   (for ([splitscheme splitschemes])
                     (for-each sow
                      (map (curry cons (car dom))
                           (map (curry apply append)
                                (cartesian-product
                                 (for/list ([repscheme splitscheme] [part (map cdr parts)])
                                   (cartesian-product
                                    (for/list ([rep repscheme])
                                      (generate-from-template part rep))))))))))))
      (list dom)))