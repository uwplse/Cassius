#lang racket

(require "../common.rkt")
(provide in-css-properties in-css-types *%* css-shorthand-properties)

(define css-types-hash (make-hash))
(define css-property-hash (make-hash))

;; This weird list is the one necessary to pass the CSSWG tests.
(define *%* (make-parameter '(0 1 1.5 2 5 10 15 18 20 25 29 50 62 66 80 100 101 125 200)))

(define (css-constructor name items)
  (for/list ([variant (list* 'inherit items)])
    (match variant
      [(? symbol?) (sformat "~a/~a" (slower name) variant)]
      [(list (? symbol? constructor) (? symbol? type))
       (list (sformat "~a/~a" (slower name) constructor)
             (list (sformat "~a.~a" (slower name) constructor) type))])))

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

(define-css-type (Width auto (px Real) (% Real))
  [width auto])

(define-css-type (Min-Width (px Real) (% Real))
  [min-width (px 0)])

(define-css-type (Max-Width none (px Real) (% Real))
  [max-width none])

(define-css-type (Height auto (px Real) (% Real))
  [height auto])

(define-css-type (Min-Height (px Real) (% Real))
  [min-height (px 0)])

(define-css-type (Max-Height none (px Real) (% Real))
  [max-height none])

(define-css-type (Margin auto (px Real) (% Real))
  [margin-top auto]
  [margin-right (px 0)]
  [margin-bottom auto]
  [margin-left (px 0)])

(define-css-type (Padding (px Real) (% Real))
  [padding-top (px 0)]
  [padding-right (px 0)]
  [padding-bottom (px 0)]
  [padding-left (px 0)])

(define-css-type (Border (px Real) (% Real))
  [border-top-width medium]
  [border-right-width medium]
  [border-bottom-width medium]
  [border-left-width medium])

(define-css-type (Border-Style none hidden dotted dashed solid double groove ridge inset outset)
  [border-top-style none]
  [border-right-style none]
  [border-bottom-style none]
  [border-left-style none])

(define-css-type (Float none left right)
  [float none])

(define-css-type (Text-Align left right center justify)
  [text-align inherit])

(define-css-type (Overflow visible hidden auto scroll)
  [overflow-x visible]
  [overflow-y visible])

(define-css-type (Position static relative absolute fixed)
  [position static])

(define-css-type (Offset (px Real) (% Real) auto)
  [top auto]
  [right auto]
  [bottom auto]
  [left auto])

(define-css-type (Box-Sizing border-box content-box)
  [box-sizing content-box])

(define-css-type (Display block inline none)
  [display inline])

(define css-shorthand-properties
  '((margin margin-top margin-right margin-bottom margin-left)
    (padding padding-top padding-right padding-bottom padding-left)
    (border-width border-top-width border-right-width border-bottom-width border-left-width)
    (border-style border-top-style border-right-style border-bottom-style border-left-style)
    (border-top border-top-width border-top-style)
    (border-right border-right-width border-right-style)
    (border-bottom border-bottom-width border-bottom-style)
    (border-left border-left-width border-left-style)
    (overflow overflow-x overflow-y)))
