#lang racket

(require "common.rkt")
(provide in-css-properties in-css-types %ages)

(define css-types-hash (make-hash))
(define css-property-hash (make-hash))

(define %ages-data
  '((Width 1 15 18 20 50 80 100 125 200 62 66 25 29 101 5)
    (Height 1 20 25 50 100 200)
    (Margin 15 50 29 2)
    (Padding 1 2 20 50)
    (Offset 1.5)))

(define (%ages type)
  (match (assoc type %ages-data)
    [#f '()]
    [(list _ %s ...) %s]))

(define (%age-constructor type)
  (map (curry sformat "~a/~a%" (slower type)) (%ages type)))

(define-syntax-rule (define-css-type (name decl ...) [prop default] ...)
  (begin
    (hash-set! css-types-hash 'name
               `(decl ... ,@(%age-constructor 'name)))
    (hash-set! css-property-hash 'prop (cons 'name 'default)) ...))

(define (in-css-properties)
  (in-parallel
   (in-hash-keys css-property-hash)
   (sequence-map car (in-hash-values css-property-hash))
   (sequence-map cdr (in-hash-values css-property-hash))))

(define (in-css-types)
  (in-hash css-types-hash))

(define-css-type (Width width/auto (width/px (width.px Real)) width/inherit)
  [width width/auto])

(define-css-type (Height height/auto (height/px (height.px Real)) height/inherit)
  [height height/auto])

(define-css-type (Margin margin/auto (margin/px (margin.px Real)) margin/inherit)
  [margin-top margin/auto]
  [margin-right (margin/px 0)]
  [margin-bottom margin/auto]
  [margin-left (margin/px 0)])

(define-css-type (Padding (padding/px (padding.px Real)) padding/inherit)
  [padding-top (padding/px 0)]
  [padding-right (padding/px 0)]
  [padding-bottom (padding/px 0)]
  [padding-left (padding/px 0)])

(define-css-type (Border (border/px (border.px Real)) border/inherit)
  [border-top-width border/medium]
  [border-right-width border/medium]
  [border-bottom-width border/medium]
  [border-left-width border/medium])

(define-css-type (Border-Style border-style/none border-style/hidden border-style/dotted
                              border-style/dashed border-style/solid border-style/double
                              border-style/groove border-style/ridge border-style/inset
                              border-style/outset border-style/inherit)
  [border-top-style border-style/none]
  [border-right-style border-style/none]
  [border-bottom-style border-style/none]
  [border-left-style border-style/none])

(define-css-type (Float float/none float/left float/right float/inherit)
 [float float/none])

(define-css-type (Display display/block display/inline display/inherit))

(define-css-type (Text-Align text-align/left text-align/right text-align/center text-align/inherit)
 [text-align text-align/inherit])

(define-css-type (Overflow overflow/visible overflow/hidden overflow/overflow/auto overflow/scroll overflow/inherit overflow/auto)
 [overflow-x overflow/visible]
 [overflow-y overflow/visible])

(define-css-type (Position position/static position/relative position/absolute position/fixed position/inherit)
  [position position/static])

(define-css-type (Offset (offset/px (offset.px Real)) offset/auto offset/inherit)
  [top offset/auto]
  [right offset/auto]
  [bottom offset/auto]
  [left offset/auto])

(define-css-type (Box-Sizing box-sizing/border-box box-sizing/content-box box-sizing/inherit)
  [box-sizing box-sizing/content-box])
