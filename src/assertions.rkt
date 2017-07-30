#lang racket

(require "common.rkt" "dom.rkt" "registry.rkt" "selectors.rkt" "spec/tree.rkt" "encode.rkt" "smt.rkt" "spec/tree.rkt")
(provide compile-assertion)

(define need-to-be-defined
  '(descends is-interactive viewable onscreen))

(define (expand-match doms &e sel)
  (apply smt-or
         (for*/list ([dom doms] [elt (in-elements dom)]
                     #:when (selector-matches? sel elt))
           `(= ,&e ,(name 'elt elt)))))

(define (compile-assertion doms body ctx #:wrapped [wrapped? #t])
  (match-define (list dom) doms)
  (let loop ([expr body] [wrapped? wrapped?])
    (match expr
      ;; Booleans
      [(or 'true 'false) expr]
      [`(and ,parts ...) `(and ,@(map (curryr loop wrapped?) parts))]
      [`(or ,parts ...) `(or ,@(map (curryr loop wrapped?) parts))]
      [`(not ,part) `(not ,(loop part wrapped?))]
      ;; Real numbers
      [(? number?) expr]
      [(list (and (or '= '< '> '<= '>=) op) parts ...)
       (cons op (map (curryr loop #f) parts))]
      [(list (and (or '+ '- '* '/) op) parts ...)
       (cons op (map (curryr loop wrapped?) parts))]
      ;; Boxes
      [(? symbol?)
       (define true-name (dict-ref ctx expr))
       (if wrapped? `(get/box ,true-name) true-name)]
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
       `(,function ,(loop box #t))]
      [`(ancestor ,box ,cond*)
       (define cond (loop cond* #f))
       (define (cond-fn &b id)
         `(ite ,(smt-replace-terms cond (list (cons '? `(get/box ,&b))))
               ,&b
               ,(id (pflow (get/box ,&b)))))
       (define idx (length (extra-pointers)))
       (extra-pointers (append (extra-pointers) (list cond-fn)))
       (define ptr (,(sformat "&~a" idx) ,(loop box #t)))
       (if wrapped? `(get/box ,ptr) ,ptr)]
      [`(has-contents ,box) `(has-contents ,(loop box #t))]
      [`(has-type ,box ,(and (or 'root 'text 'inline 'block 'line) boxtype))
       (define function (sformat "is-box/~a" type))
       `(,function (type (loop box #t)))]
      [(list-rest (and (or 'top 'right 'bottom 'left) dir) box edge*)
       (define edge
         (match edge* [(list edge) edge] [(list) 'border]))
       (define function (sformat "~a-~a" dir edge))
       `(,function ,(loop box #t))]

      ;; Colors
      [`(fg ,box) `(fg-color ,(loop box #t))]
      [`(bg ,box) `(bg-color ,(loop box #t))]
      ['transparent 'color/transparent]
      [`(rgb ,(? number? r) ,(? number? g) ,(? number? b))
       (dump-value (list 'rgb r g b))]
      [(list (and (or 'r 'g 'b) component) `(gamma ,color))
       (define function (sformat "color.~a-corr" component))
       `(,function (color.rgb ,(loop color #t)))]
      [(list (and (or 'r 'g 'b) component) color)
       (define function (sformat "color.~a" component))
       `(,function (color.rgb ,(loop color #t)))]

      ;; Elements
      [`(anonymous? ,b)
       `(= (&elt ,(loop b #t)) -1)]
      [`(matches ,b ,sel)
       (expand-match doms `(&elt ,(loop b #t)) sel)])))
