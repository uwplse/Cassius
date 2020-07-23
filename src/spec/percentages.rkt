#lang racket
(require "../common.rkt" "../encode.rkt" "../smt.rkt")
(provide *%* make-%of gather-percentages)

(define *%* (make-parameter '(0 10 20 30 40 50 60 70 80 90 100 150 200/3)))

(define (gather-percentages sheets)
  (reap [sow]
        (for* ([sheet sheets] [rule sheet])
          (match-define (list _ (? attribute?) ... (? list? props) ...) rule)
          (for ([(prop value) (in-dict props)])
            (match (car value)
              [(list 'rem v) (sow (* 100 v))]
              [(list 'em v) (sow (* 100 v))]
              [(list '% v) (sow v)]
              [(? number? v) (sow (* v 100))]
              [_ (void)])))))

(define-constraints (make-%of)
  (define-fun %of ((% Real) (base Real)) Real
    ,(let* ([%s (*%*)])
       (for/fold ([out `(* ,(/ (car %s) 100.0) base)]) ([% (cdr %s)])
         `(ite (= % ,%) (* ,(if (integer? %) (/ % 100.0) `(/ ,% 100.0)) base) ,out)))))
