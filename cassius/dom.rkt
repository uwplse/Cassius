#lang racket
(require unstable/sequence)
(require "common.rkt")

(provide (struct-out dom) (struct-out stylesheet) (struct-out rendering-context)
         inline-element? in-tree-subtrees in-tree-values
         in-dom-levels dom-get dom-type dom-map dom-root elt-name)

(struct dom (name stylesheet context tree))
(struct rendering-context (width))
(struct stylesheet (name count))

(define (inline-element? elt)
  (eq? (car elt) '<>))

(define (in-tree-subtrees tree)
  (apply sequence-append
         (in-parallel (in-value (car tree)) (in-value (cdr tree)))
         (map in-tree-subtrees (cdr tree))))

(define (in-tree-values tree)
  (apply sequence-append
         (in-value (car tree))
         (map in-tree-values (cdr tree))))

(define (atree-init doms)
  (map (λ (dom) (cons dom (dom-tree dom))) doms))

(define (atree-next atrees)
  (for*/list ([atree atrees] [subtree (cddr atree)])
    (cons (car atree) subtree)))

(define (atree-levels atrees)
  (if (null? atrees)
      '()
      (cons
       (for/list ([atree atrees])
        (list (car atree) (cadr atree) (cddr atree)))
       (atree-levels (atree-next atrees)))))

(define (in-dom-levels doms)
  (atree-levels (atree-init doms)))

(define (dom-type dom) (dom-name dom))
(define (dom-map dom) (sformat "~a-map" (dom-name dom)))
(define (dom-root dom) (sformat "~a-root" (dom-name dom)))
(define (dom-get dom elt)
  `(,(dom-map dom) ,(elt-name elt)))

(define elt-names (make-hash))
(define (elt-name def)
  (hash-ref! elt-names def (lambda () (sformat "elt$~a" (hash-count elt-names)))))
