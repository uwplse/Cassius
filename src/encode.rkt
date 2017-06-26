#lang racket
(require "common.rkt" "dom.rkt" "spec/css-properties.rkt" "registry.rkt" "spec/percentages.rkt")

(provide dump-tag extract-tag dump-id extract-id
         dump-elt dump-box extract-style
         dump-value extract-value dump-selector extract-selector
         z3->number number->z3)

(define (dump-tag tag)
  (if tag
      (string->symbol (string-replace (format "tag/~a" (slower tag)) ":" ".."))
      'no-tag))

(define (extract-tag tag)
  (and (not (equal? tag 'no-tag))
       (string->symbol (string-replace (~a (second (split-symbol tag))) ".." ":"))))

(define (dump-id id)
  (if id
      (sformat "id/~a" id)
      'no-id))

(define (extract-id id)
  (and (not (equal? id 'no-id)) (second (split-symbol id))))

(define (dump-elt elt)
  (if elt
      (sformat "elt~a" (name 'elt elt))
      'no-elt))

(define (dump-box box)
  (if box
      (sformat "box~a" (name 'box box))
      'no-box))

(define (extract-style style-expr)
  (match-define (list 'style rec ...) style-expr)
  (for/list ([(prop type default) (in-css-properties)] [value rec]
             #:unless (or (value=? type value (dump-value prop default))))
    `[,prop ,(extract-value value)]))

(define (number->z3 v)
  (match v
    [(? number?) (exact->inexact v)]
    [`(/ ,n ,d) `(/ ,(exact->inexact n) ,(exact->inexact d))]))

(define (gamma-correction x)
  (let ([corrected (expt (/ x 255) 2.2)])
    (if (> corrected 0.0001)
        corrected
        0)))

(define (dump-value type value)
  (define prefix (slower type))
  (match value
    [(? symbol?) (sformat "~a/~a" prefix value)]
    [(list 'em n) (list (sformat "~a/em" prefix) (number->z3 n))]
    [(list 'px n) (list (sformat "~a/px" prefix) (number->z3 n))]
    [(list '% n) (list (sformat "~a/%" prefix) (number->z3 n))]
    [(list 'rgb r g b) `(color/rgb (color ,r ,g ,b ,(gamma-correction r) ,(gamma-correction g) ,(gamma-correction b)))]
    [0 (dump-value type '(px 0))]))

(define (extract-value value)
  (match value
    [`(color/rgb (color ,r ,g ,b ,rc ,gc, bc)) `(rgb ,r ,g ,b)]
    [(list (app split-symbol (list _ ... 'px)) x) (list 'px x)]
    [(list (app split-symbol (list _ ... '%)) x)
     (if (ormap (curry = x) (*%*)) ; Percentages that aren't in the list are its first element
         (list '% x)
         (list '% (car (*%*))))]
    [(? symbol?) (last (split-symbol value))]))

(define (dump-selector selector)
  (match selector
    [`(id ,id) `(sel/id ,(dump-id id))]
    [`(tag ,tag) `(sel/tag ,(dump-tag tag))]
    [`* `sel/all]
    [_ #f]))

(define (extract-selector sel)
  (match sel
    ['sel/all '*]
    [`(sel/id ,id) (list 'id (string->symbol (substring (~a id) 3)))]
    [`(sel/tag ,tag) (list 'tag (string->symbol (substring (~a tag) 4)))]))

(define (z3->number v)
  (match v
    [`(/ ,a ,b) (/ a b)]
    [_ v]))
