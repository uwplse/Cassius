#lang racket
(require "../common.rkt" "../smt.rkt" "../encode.rkt")
(provide make-font-datatype make-font-table)

(define (make-font-datatype)
  `(declare-datatypes () ((Font-Metric (font (font.ascender Int) (font.xHeight Int) (font.descender Int) (font.leading Int))))))

(define (make-font-table fonts)
  (match fonts
    [`(((,rules ...)))
     `(define-fun get-metrics ((ID Int)) Font-Metric
        ,(for/fold ([expr `(font 0 0 0 0)]) ([font rules])
           (match font
             [(list fid a x d l) `(ite (= ID ,fid) (font ,a ,x ,d ,l) ,expr)])))]
    [#f (writeln "Error: Bad Font Format")]))