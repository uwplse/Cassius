#lang racket
(require "../common.rkt" "../smt.rkt" "../encode.rkt")
(provide make-font-datatype make-font-table)

(define-constraints make-font-datatype
  (declare-datatypes () ((Font-Metric (font (font.ascent Int) (font.descent Int) (font.topoffset Int) (font.bottomoffset Int) (font.leading Int))))))

(define-by-match font-info?
  (list fid a x d t b))

(define/contract (make-font-table fonts)
  (-> (listof font-info?) any/c)

  `(define-fun get-metrics ((ID Int)) Font-Metric
     ,(for/fold ([expr `(font 0 0 0 0 0)]) ([font fonts])
        (match-define (list fid a d t b l) font)
        `(ite (= ID ,fid) (font ,a ,d ,t ,b ,l) ,expr))))