#lang racket
(require "../common.rkt" "../smt.rkt" "../encode.rkt")
(provide fonts make-font-table)

(define (make-font-table fonts)
  (match fonts
    [`(((,rules ...)))
     `(define-fun get-metrics ((ID Int)) Font-Metric
        ,(for/fold ([expr `(Font-Metric 0 0 0 0)]) ([font rules])
           (match font
             [(list fid a x d l) `(ite (= ID ,fid) (Font-Metric ,a ,x ,d ,l) ,expr)])))]
    [#t (writeln "Error: Bad Font Format")]))

(define-constraints fonts
  (declare-datatypes () ((Font-Metric (font (font.ascender Int) (font.xHeight Int) (font.descender Int) (font.leading Int))))))