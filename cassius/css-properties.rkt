#lang racket

(provide in-css-properties in-css-types)

(define css-types-hash (make-hash))
(define css-property-hash (make-hash))

(define-syntax-rule (define-css-type (name decl ...) [prop default] ...)
  (begin
    (hash-set! css-types-hash 'name '(decl ...))
    (hash-set! css-property-hash 'prop (cons 'name 'default)) ...))

(define (in-css-properties)
  (in-parallel
   (in-hash-keys css-property-hash)
   (sequence-map car (in-hash-values css-property-hash))
   (sequence-map cdr (in-hash-values css-property-hash))))

(define (in-css-types)
  (in-hash css-types-hash))

(define-css-type (Width width/auto (width/px (width.px Real)) width/5% width/30% width/100% width/inherit)
  [width width/auto])

(define-css-type (Height height/auto (height/px (height.px Real)) height/50% height/100% height/inherit)
  [height height/auto])

(define-css-type (Margin margin/auto (margin/px (margin.px Real)) margin/50% margin/inherit)
  [margin-top margin/auto]
  [margin-right (margin/px 0)]
  [margin-bottom margin/auto]
  [margin-left (margin/px 0)])

(define-css-type (Padding (padding/px (padding.px Real)) padding/1% padding/2% padding/50% padding/inherit)
  [padding-top (padding/px 0)]
  [padding-right (padding/px 0)]
  [padding-bottom (padding/px 0)]
  [padding-left (padding/px 0)])

(define-css-type (Border (border/px (border.px Real)) border/inherit)
  [border-top-width (border/px 0)]
  [border-right-width (border/px 0)]
  [border-bottom-width (border/px 0)]
  [border-left-width (border/px 0)])

(define-css-type (Float float/none float/left float/right float/inherit)
 [float float/none])

(define-css-type (Display display/block display/inline display/inherit))

(define-css-type (Text-Align text-align/left text-align/right text-align/center text-align/inherit)
 [text-align text-align/inherit])
