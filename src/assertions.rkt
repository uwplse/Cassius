#lang racket

(require "common.rkt" "dom.rkt" "registry.rkt" "selectors.rkt" "encode.rkt" "smt.rkt" "spec/utils.rkt")
(provide compile-assertion auxiliary-definitions)

(define auxiliary-definitions (make-parameter '()))

(define helpers
  (hash
   'descends
   (λ (b sel) `(matches (ancestor ,b (not (anonymous? ?))) ,sel (desc ,sel *)))
   'is-interactive
   (λ (b) `(matches ,b (tag a) (tag input) (tag button)))
   'viewable
   (λ (b) `(and (> (right ,b) (left root)) (> (bottom ,b) (top root))))
   'onscreen
   (λ (b) `(and (>= (left ,b) (left root)) (>= (top ,b) (top root))))
   '!=
   (λ (a b) `(not (= ,a ,b)))
   'width
   (λ (b [dir 'border]) `(- (right ,b ,dir) (left ,b ,dir)))
   'height
   (λ (b [dir 'border]) `(- (bottom ,b ,dir) (top ,b ,dir)))
   ))

(define (compile-assertion doms body ctx)
  (match-define (list dom) doms)
  (let loop ([expr body] [ctx ctx])
    (match expr
      ;; Booleans
      [(or 'true 'false) expr]
      [`(and ,parts ...) `(and ,@(map (curryr loop ctx) parts))]
      [`(or ,parts ...) `(or ,@(map (curryr loop ctx) parts))]
      [`(=> ,as ... ,b)
       `(=> ,@(map (curryr loop ctx) as) ,(loop b ctx))]
      [`(not ,part) `(not ,(loop part ctx))]

      ;; Real numbers
      [(? number?) expr]
      [(list (and (or '= '< '> '<= '>=) op) parts ...)
       (cons op (map (curryr loop ctx) parts))]
      [(list (and (or '+ '- '* '/) op) parts ...)
       (cons op (map (curryr loop ctx) parts))]
      [`(max ,a ,b)
       `(max ,(loop a ctx) ,(loop b ctx))]

      ;; Boxes
      ['null 'no-box]
      ['root (dump-box (dom-boxes dom))]
      [(list (and (or 'parent 'next 'prev 'first 'last) field) box)
       (define function
         (match field ['parent 'pflow] ['next  'nflow] ['prev  'vflow] ['first 'fflow] ['last  'lflow]))
       `(,function ,(loop box ctx))]
      [`(ancestor ,box ,cond*)
       (define cond (loop cond* #hash((? . b))))
       (define aux (name 'aux cond))
       (define aux-def
         `((declare-fun ,aux (Box) Box)
           (assert (forall ((b Box)) (= (,aux b) (ite ,cond b (,aux (pflow b))))))))
       (auxiliary-definitions (append auxiliary-definitions aux-def))
       `(,aux ,(loop box ctx))]
      [`(has-contents ,box) `(has-contents ,(loop box ctx))]
      [`(has-type ,box ,(and (or 'root 'text 'inline 'block 'line) boxtype))
       (define function (sformat "is-box/~a" boxtype))
       `(,function (type ,(loop box ctx)))]
      [(list-rest (and (or 'top 'right 'bottom 'left) dir) box edge*)
       (define edge
         (match edge* [(list edge) edge] [(list) 'border]))
       (define function (sformat "~a-~a" dir edge))
       `(,function ,(loop box ctx))]
      [`(text-height ,box)
       `(let ([b ,(loop box ctx)]) (height-text b))]
      [`(vertically-adjacent ,box1 ,box2)
       `(vertically-adjacent ,(loop box1 ctx) ,(loop box2 ctx))]

      ;; Colors
      [`(fg ,box) `(fg-color ,(loop box ctx))]
      [`(bg ,box) `(bg-color ,(loop box ctx))]
      ['transparent 'color/transparent]
      [`(color ,name) (sformat "color/~a" name)]
      [`(rgb ,(? number? r) ,(? number? g) ,(? number? b))
       (dump-value (list 'rgb r g b))]
      [(list (and (or 'r 'g 'b) component) `(gamma ,color))
       (define function (sformat "color.~a-corr" component))
       `(,function (color.rgb ,(loop color ctx)))]
      [(list (and (or 'r 'g 'b) component) color)
       (define function (sformat "color.~a" component))
       `(,function (color.rgb ,(loop color ctx)))]

      ;; Elements
      [`(anonymous? ,b)
       `(is-no-elt (box-elt ,(loop b ctx)))]
      [`(matches ,b ,sels ...)
       (define b* (loop b ctx))
       (apply smt-or
              (for*/list ([dom doms] [elt (in-elements dom)]
                          #:when (ormap (curryr selector-matches? elt) sels))
                `(= (box-elt ,b*) ,(dump-elt elt))))]

      ;; Extra syntax
      [`(if ,c ,t ,f)
       `(if ,(loop c ctx) ,(loop t ctx) ,(loop f ctx))]
      [`(let ([,vars ,vals] ...) ,body)
       (define vals* (for/list ([val vals]) (loop val ctx)))
       (define ctx*
         (for/fold ([ctx ctx]) ([var vars])
           (dict-set ctx var var)))
       `(let (,@(map list vars vals*)) ,(loop body ctx*))]

      ;; Expandable
      [(list (? (curry dict-has-key? helpers) fname) args ...)
       (loop (apply (dict-ref helpers fname) args) ctx)]
      [`(luminance ,color)
       `(lum (color.rgb ,(loop color ctx)))]
      [`(overlaps ,b1 ,b2)
       `(overlaps ,(loop b1 ctx) ,(loop b2 ctx))]
      [`(within ,b1 ,b2)
       `(within ,(loop b1 ctx) ,(loop b2 ctx))]

      ;; Variables
      [(? symbol?)
       (dict-ref ctx expr)])))
