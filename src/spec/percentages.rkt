#lang racket
(provide *%* make-%of)

(define *%* (make-parameter '(0 10 20 30 40 50 60 70 80 90 100 150 200/3)))

(define (make-%of)
  `((define-fun %of ((% Real) (base Real)) Real
      ,(let* ([%s (*%*)])
         (for/fold ([out `(* ,(/ (car %s) 100.0) base)]) ([% (cdr %s)])
           `(ite (= % ,%) (* ,(if (integer? %) (/ % 100.0) `(/ ,% 100.0)) base) ,out))))))
