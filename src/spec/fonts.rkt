#lang racket
(require "../common.rkt" "../smt.rkt" "../encode.rkt")
(provide fonts make-font-table)

(define (make-font-table fonts)
  (writeln fonts))

(define-constraints fonts
  (declare-datatypes () ((Font-Metric (font (font.ascender Int) (font.xHeight Int) (font.descender Int) (font.leading Int))))))