#lang racket
(require "common.rkt" "dom.rkt" "tree.rkt" "spec/css-properties.rkt" "spec/utils.rkt" "smt.rkt")

(provide dump-tag extract-tag dump-id extract-id
         dump-elt dump-box extract-box extract-style
         dump-value extract-value dump-selector extract-selector
         z3->number number->z3 extract-field extract-test
         extract-ctx! extract-core! extract-tree! extract-counterexample!)

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
      (sformat "elt~a" (node-id elt))
      'no-elt))

(define (dump-box box)
  (if box
      (sformat "box~a" (node-id box))
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
    ;; Round to avoid exponential notation; it's graphics, so accuracy doesn't matter much
    (/ (round (* corrected 10000)) 10000)))

(define all-strings (make-hash))

(define (dump-value type value)
  (define prefix (slower type))
  (match value
    [(? symbol?) (sformat "~a/~a" prefix value)]
    [(? string?)
     ;; TODO: Default input font instead of "Sans"
     (define value* (if (equal? value "-moz-field") "Sans" value))
     (list (sformat "~a/string" prefix)
           (hash-ref! all-strings value* (hash-count all-strings)))]
    [0 (list (sformat "~a/px" prefix) 0)]
    [(? number?) (list (sformat "~a/num" prefix) (number->z3 value))]
    [(list 'em n) (list (sformat "~a/em" prefix) (number->z3 n))]
    [(list 'rem n) (list (sformat "~a/px" prefix) (list 'rem2px (number->z3 n)))]
    [(list 'px n) (list (sformat "~a/px" prefix) (number->z3 n))]
    [(list '% n) (list (sformat "~a/%" prefix) (number->z3 n))]
    [(list 'rgb r g b) `(color/rgb (color ,r ,g ,b ,(gamma-correction r) ,(gamma-correction g) ,(gamma-correction b)))]
    [(list 'rgba r g b a)
     (warn "Colors with alpha values not supported" "Encoding " type " " value)
     (dump-value type (list 'rgb r g b))]
    [0 (dump-value type '(px 0))]))

(define (extract-value value)
  (match value
    [`(color/rgb (color ,r ,g ,b ,rc ,gc, bc)) `(rgb ,r ,g ,b)]
    [(list (app split-symbol (list _ ... 'px)) x) (list 'px x)]
    [(list (app split-symbol (list _ ... 'num)) x) x]
    [(list (app split-symbol (list _ ... 'em)) x) (list 'em x)]
    [(list (app split-symbol (list _ ... '%)) x) (list '% x)]
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

(define (extract-box box)
  (define box-def
    (match (tree-types)
      [(list
        _ ...
        `(declare-datatypes ()
          (,_ ...
             (Box ,_ ...
                  (box (,names ,types) ...))
             ,_ ...))
        _ ...)
       (map cons names types)]))
  (match box
    ['no-box #f]
    [(list 'box fields ...)
     (for/hash ([field fields] [(name type) (in-dict box-def)])
       (values name
               (match type
                 [(or 'Color 'Line-Height 'Text-Align) (extract-value field)]
                 ['BoxType (second (split-symbol field))]
                 [(or 'Real 'Int 'Bool) field]
                 ['EZone field])))])) ; TODO

(define (extract-tree! tree smt-out)
  (for ([elt (in-tree tree)])
    (define box-model (dict-ref smt-out (dump-box elt) #f))
    (when (and box-model (list? box-model))
      (define data (curry dict-ref (extract-box box-model)))
      (node-set! elt ':x (+ (data 'x) (data 'xo)))
      (node-set! elt ':y (+ (data 'y) (data 'yo)))
      (node-set! elt ':w (+ (data 'bl) (data 'pl) (data 'w) (data 'pr) (data 'scroll-y) (data 'br)))
      (node-set! elt ':h (+ (data 'bt) (data 'pt) (data 'h) (data 'pb) (data 'scroll-x) (data 'bb)))
      (node-set! elt ':fg (data 'fg-color))
      (node-set! elt ':bg (data 'bg-color)))))


(define (extract-field smt-out box field)
  (dict-ref (extract-box (dict-ref smt-out (dump-box box) #f)) field))

(define (extract-test smt-out tests)
  (define which (hash-ref smt-out 'which-constraint))
  ;; Test needed for case where the bad test is a model insufficiency
  (define test (if (< which (length tests)) (list-ref tests which) false))
  (let loop ([test test])
    (match test
      [`(=>* ,_ ... ,b)
       (loop b)]
      [_ test])))

(define (extract-ctx! model d)
  (define ctx*
    (for/fold ([ctx (dom-properties d)]) ([(attr varname) #hash((:w . w) (:h . h) (:fs . font-size))])
      (define var (sformat "config/~a/~a" (dom-name d) varname))
      (if (dict-has-key? model var)
          (dict-set ctx attr (list (dict-ref model var)))
          ctx)))
  (struct-copy dom d [properties ctx*]))

;; Does tagging of bad
(define (extract-core! core doms)
  (define fields (make-hash))
  (for ([name core] #:when (set-member? '(box-x box-y box-width box-height) (caar (split-line-name name))))
    (match-define (list accessor box-name) (first (split-line-name name)))
    (define field-name (match accessor ['box-x ':x] ['box-y ':y] ['box-width ':w] ['box-height ':h]))
    (hash-update! fields box-name (curry cons field-name) '()))

  (for* ([dom doms] [box (in-boxes dom)])
    (define bad-fields (hash-ref fields (node-id box) '()))
    (for ([field-name bad-fields])
      (node-set! box field-name `(bad ,(node-get box field-name))))))

(define (extract-counterexample! smt-out doms bad-test)
  (define id (hash-ref smt-out 'which-constraint))
  (define-values (bad-vars bad-body) (disassemble-forall bad-test))
  (for ([var bad-vars])
    (define smt-var (sformat "cex~a~a" id var))
    (define bid (dict-ref (extract-box (dict-ref smt-out smt-var)) 'bid))
    (for/first ([dom doms] #:when true
                [box (in-boxes dom)] #:when (equal? (node-id box) bid))
      (node-add! box ':cex `(bad ,var)))))
