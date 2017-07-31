#lang racket

(require "common.rkt" "dom.rkt" "registry.rkt" "selectors.rkt" "spec/tree.rkt" "encode.rkt" "smt.rkt" "spec/tree.rkt")
(provide compile-assertion)

(define helpers
  (hash
   'descends
   (λ (b sel) `(matches ,b ,sel (desc ,sel *)))
   'is-interactive
   (λ (b) `(matches ,b (tag a) (tag input) (tag button)))
   'viewable
   (λ (b) `(and (> (right ,b) (left root)) (> (bottom ,b) (top root))))
   'onscreen
   (λ (b) `(and (> (left ,b) (left root)) (> (top ,b) (top root))))
   '!=
   (λ (a b) `(not (= ,a ,b)))
   'width
   (λ (b [dir 'border]) `(- (right ,b ,dir) (left ,b ,dir)))
   'height
   (λ (b [dir 'border]) `(- (bottom ,b ,dir) (top ,b ,dir)))
   ))

(define (compile-assertion doms body ctx #:wrapped [wrapped? #t])
  (match-define (list dom) doms)
  (let loop ([expr body] [wrapped? wrapped?] [ctx ctx])
    (match expr
      ;; Booleans
      [(or 'true 'false) expr]
      [`(and ,parts ...) `(and ,@(map (curryr loop wrapped? ctx) parts))]
      [`(or ,parts ...) `(or ,@(map (curryr loop wrapped? ctx) parts))]
      [`(=> ,as ... ,b)
       `(=> ,@(map (curryr loop wrapped? ctx) as) ,(loop b wrapped? ctx))]
      [`(not ,part) `(not ,(loop part wrapped? ctx))]
      ;; Real numbers
      [(? number?) expr]
      [(list (and (or '= '< '> '<= '>=) op) parts ...)
       (cons op (map (curryr loop #f ctx) parts))]
      [(list (and (or '+ '- '* '/) op) parts ...)
       (cons op (map (curryr loop wrapped? ctx) parts))]
      ;; Boxes
      [(? symbol?)
       (define name (dict-ref ctx expr))
       (if wrapped? `(get/box ,name) name)]
      ['null (if wrapped? 'no-box '-1)]
      ['root (if wrapped? (dump-box dom) (name 'box box))]
      [(list (and (or 'parent 'next 'prev 'first 'last) field) box)
       (define function
         (match field
           ['parent (if wrapped? 'pflow '&pbox)]
           ['next  (if wrapped? 'nflow '&nflow)]
           ['prev  (if wrapped? 'vflow '&vflow)]
           ['first (if wrapped? 'fflow '&fflow)]
           ['last  (if wrapped? 'lflow '&lflow)]))
       `(,function ,(loop box #t ctx))]
      [`(ancestor ,box ,cond*)
       (define cond (loop cond* #f #hash((? . &b))))
       (define (cond-fn &b id)
         `(ite (let ([&b ,&b]) ,cond)
               ,&b
               (,id (pflow (get/box ,&b)))))
       (define idx (length (extra-pointers)))
       (extra-pointers (append (extra-pointers) (list (cons cond* cond-fn))))
       (define ptr `(,(sformat "&~a" idx) ,(loop box #t ctx)))
       (if wrapped? `(get/box ,ptr) ptr)]
      [`(has-contents ,box) `(has-contents ,(loop box #t ctx))]
      [`(has-type ,box ,(and (or 'root 'text 'inline 'block 'line) boxtype))
       (define function (sformat "is-box/~a" boxtype))
       `(,function (type ,(loop box #t ctx)))]
      [(list-rest (and (or 'top 'right 'bottom 'left) dir) box edge*)
       (define edge
         (match edge* [(list edge) edge] [(list) 'border]))
       (define function (sformat "~a-~a" dir edge))
       `(,function ,(loop box #t ctx))]

      ;; Colors
      [`(fg ,box) `(fg-color ,(loop box #t ctx))]
      [`(bg ,box) `(bg-color ,(loop box #t ctx))]
      ['transparent 'color/transparent]
      [`(rgb ,(? number? r) ,(? number? g) ,(? number? b))
       (dump-value (list 'rgb r g b))]
      [(list (and (or 'r 'g 'b) component) `(gamma ,color))
       (define function (sformat "color.~a-corr" component))
       `(,function (color.rgb ,(loop color #t ctx)))]
      [(list (and (or 'r 'g 'b) component) color)
       (define function (sformat "color.~a" component))
       `(,function (color.rgb ,(loop color #t ctx)))]

      ;; Elements
      [`(anonymous? ,b)
       `(= (&elt ,(loop b #t ctx)) -1)]
      [`(matches ,b ,sels ...)
       (define b* (loop b #t ctx))
       (apply smt-or
              (for*/list ([dom doms] [elt (in-elements dom)]
                          #:when (ormap (curryr selector-matches? elt)
                                        sels))
                `(= (&elt ,b*) ,(name 'elt elt))))]

      ;; Extra syntax
      [`(if ,c ,t ,f)
       `(if ,(loop c wrapped? ctx)
            ,(loop t wrapped? ctx)
            ,(loop f wrapped? ctx))]
      [`(let ([,vars ,vals] ...) ,body)
       (define vals* (for/list ([val vals]) (loop val #f ctx)))
       (define ctx*
         (for/fold ([ctx ctx]) ([var vars])
           (dict-set ctx var var)))
       `(let (,@(map list vars vals*)) ,(loop body wrapped? ctx*))]

      ;; Expandable
      [(list (? (curry dict-has-key? helpers) fname) args ...)
       (loop (apply (dict-ref helpers fname) args) wrapped? ctx)])))
