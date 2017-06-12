#lang racket
(require "../smt.rkt")
(provide colors)

(define-constraints colors
  (declare-datatypes ()
    (
     (RGBColor (color (color.r Real) (color.g Real) (color.b Real)))))
  )