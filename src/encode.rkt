#lang racket
(require "common.rkt" "dom.rkt" "spec/css-properties.rkt" "registry.rkt")

(provide dump-tag extract-tag dump-id extract-id dump-class
         dump-elt dump-box dump-dom extract-style
         dump-value extract-value dump-selector extract-selector)

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

(define (dump-class class)
  (sformat "class/~a" class))

(define (dump-elt elt)
  (if elt
      (sformat "~a-elt" (name 'elt elt))
      'no-elt))

(define (dump-box box)
  (if box
      (sformat "~a-box" (name 'box box))
      'no-box))

(define (dump-dom dom)
  (sformat "~a-doc" (dom-name dom)))

(define (extract-style style-expr)
  (match-define (list 'style rec ...) style-expr)
  (for/list ([(prop type default) (in-css-properties)] [value rec]
             ;; TODO Hack on text-align
             #:unless (or (and (equal? prop 'text-align) (equal? value 'text-align/left)) (value=? type value (dump-value prop default))))
    `[,prop ,(extract-value value)]))

(define (dump-value type value)
  (define prefix (slower type))
  (match value
    [(? symbol?) (sformat "~a/~a" prefix value)]
    [(list 'px n) (list (sformat "~a/px" prefix) n)]
    [(list '% n) (list (sformat "~a/%" prefix) n)]
    [0 (dump-value type '(px 0))]))

(define (extract-value value)
  (match value
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
