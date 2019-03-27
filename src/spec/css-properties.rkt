#lang racket
(require "../common.rkt")
(provide
 in-css-properties in-css-types css-constants
 css-shorthand-properties css-type css-properties css-types css-default css-inheritable?)

;; The CSS properties and data types Cassius supports. The file is in
;; three parts: helper macros, type and property definitions, and
;; helper functions


;; Macros for defining CSS types and properties
(define css-types-hash (make-hash))
(define css-property-hash (make-hash))

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

;; CSS datatypes and the properties that use them
(define-css-type (Width auto (px Real) (% Real) (em Real))
  [width auto])

(define-css-type (Min-Width (px Real) (% Real) (em Real))
  [min-width (px 0)])

(define-css-type (Max-Width none (px Real) (% Real) (em Real))
  [max-width none])

(define-css-type (Height auto (px Real) (% Real) (em Real))
  [height auto])

(define-css-type (Min-Height (px Real) (% Real) (em Real))
  [min-height (px 0)])

(define-css-type (Max-Height none (px Real) (% Real) (em Real))
  [max-height none])

(define-css-type (Margin auto (px Real) (% Real) (em Real))
  [margin-top (px 0)]
  [margin-right (px 0)]
  [margin-bottom (px 0)]
  [margin-left (px 0)])

(define-css-type (Padding (px Real) (% Real) (em Real))
  [padding-top (px 0)]
  [padding-right (px 0)]
  [padding-bottom (px 0)]
  [padding-left (px 0)])

(define-css-type (Border (px Real) (% Real) (em Real))
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
  [text-align left])

(define-css-type (Overflow visible hidden auto scroll)
  [overflow-x visible]
  [overflow-y visible])

(define-css-type (Position static relative absolute fixed)
  [position static])

(define-css-type (Offset (px Real) (% Real) (em Real) auto)
  [top auto]
  [right auto]
  [bottom auto]
  [left auto])

(define-css-type (Box-Sizing border-box content-box)
  [box-sizing content-box])

(define-css-type (Display block inline inline-block none list-item inline-table table table-row table-column table-cell table-caption table-column-group table-row-group table-header-group table-footer-group flex)
  [display inline])

(define-css-type (Font-Size (px Real) (% Real) (em Real))
  [font-size (em 1)])

; Font Family is a string so Z3 thinks of it as an integer
(define-css-type (Font-Family (string Real))
  [font-family "serif"])

(define-css-type (Font-Weight bolder lighter (num Real) initial)
  [font-weight 400])

(define-css-type (Font-Style normal italic oblique initial)
  [font-style normal])

(define-css-type (Text-Indent (px Real) (% Real) (em Real))
  [text-indent (px 0)])

(define-css-type (Clear none left right both)
  [clear none])

(define-css-type (Color transparent (rgb RGBColor))
  [color (rgb 0 0 0)]
  [background-color transparent])

(define-css-type (Line-Height (px Real) (% Real) (em Real) (num Real) normal)
  [line-height normal])

(define inheritable-properties '(text-align text-indent color background-color line-height font-weight font-style font-family))

(define (css-inheritable? x) (set-member? inheritable-properties x))

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

;; Helper Functions

(define (css-properties)
  (dict-keys css-property-hash))

(define (css-types)
  (dict-keys css-types-hash))

(define (css-type property)
  (match-define (cons type default) (dict-ref css-property-hash property))
  type)

(define (css-default property)
  (match-define (cons type default) (dict-ref css-property-hash property))
  default)

(define (in-css-properties)
  (in-parallel
   (in-hash-keys css-property-hash)
   (sequence-map car (in-hash-values css-property-hash))
   (sequence-map cdr (in-hash-values css-property-hash))))

(define (in-css-types)
  (in-hash css-types-hash))

(define css-constants
  #hash((Border . #hash((thin . (px 1)) (medium . (px 3)) (thick . (px 5))))
        (Min-Height . #hash((auto . 0)))
        (Text-Align . #hash((start . left) (end . right)))
        (Font-Size . #hash((xx-small . (px 9)) (x-small . (px 10)) (small . (px 13))
                           (medium . (px 16)) (smaller . (em 2/3)) (larger . (em 3/2))
                           (large . (px 18)) (x-large . (px 24)) (xx-large . (px 32))))
        (Font-Weight . #hash((normal . 400) (bold . 700)))
        (Color . #hash((undefined . transparent)))))
