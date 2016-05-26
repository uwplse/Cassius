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

(define (css-constructor name items)
  (append (%age-constructor name)
          (for/list ([variant (list* 'inherit items)])
            (match variant
              [(? symbol?) (sformat "~a/~a" (slower name) variant)]
              [(list (? symbol? constructor) (? symbol? type))
               (list (sformat "~a/~a" (slower name) constructor)
                     (list (sformat "~a.~a" (slower name) constructor)
                           type))]))))

(define-syntax-rule (define-css-type (name decl ...) [prop default] ...)
  (begin
    (hash-set! css-types-hash 'name (css-constructor 'name '(decl ...)))
    (hash-set! css-property-hash 'prop (cons 'name 'default)) ...))

(define (in-css-properties)
  (in-parallel
   (in-hash-keys css-property-hash)
   (sequence-map car (in-hash-values css-property-hash))
   (sequence-map cdr (in-hash-values css-property-hash))))

(define (in-css-types)
  (in-hash css-types-hash))

(define-css-type (Width auto (px Real))
  [width width/auto])

;; define Min-Width, not sure if it works
(define-css-type (Min-Width (px Real))
  [min-width (min-width/px 0)])

(define-css-type (Height auto (px Real))
  [height height/auto])

(define-css-type (Margin auto (px Real))
  [margin-top margin/auto]
  [margin-right (margin/px 0)]
  [margin-bottom margin/auto]
  [margin-left (margin/px 0)])

(define-css-type (Padding (px Real))
  [padding-top (padding/px 0)]
  [padding-right (padding/px 0)]
  [padding-bottom (padding/px 0)]
  [padding-left (padding/px 0)])

(define-css-type (Border (px Real))
  [border-top-width border/medium]
  [border-right-width border/medium]
  [border-bottom-width border/medium]
  [border-left-width border/medium])

(define-css-type (Border-Style none hidden dotted dashed solid double groove ridge inset outset)
  [border-top-style border-style/none]
  [border-right-style border-style/none]
  [border-bottom-style border-style/none]
  [border-left-style border-style/none])

(define-css-type (Float none left right)
 [float float/none])

(define-css-type (Display block inline))

(define-css-type (Text-Align left right center justify)
 [text-align text-align/inherit])

(define-css-type (Overflow visible hidden auto scroll)
 [overflow-x overflow/visible]
 [overflow-y overflow/visible])

(define-css-type (Position static relative absolute fixed)
  [position position/static])

(define-css-type (Offset (px Real) auto)
  [top offset/auto]
  [right offset/auto]
  [bottom offset/auto]
  [left offset/auto])

(define-css-type (Box-Sizing border-box content-box)
  [box-sizing box-sizing/content-box])

(define-css-type (White-Space normal pre nowrap pre-wrap pre-word)
  [white-space white-space/normal])
