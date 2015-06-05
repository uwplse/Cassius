#lang racket
(require unstable/sequence)
(provide (struct-out dom) (struct-out rendering-context) (struct-out stylesheet)
         inline-element? in-tree-subtrees in-tree-values dom-type dom-map dom-root dom-get
         variable-append in-dom-levels)

(define (variable-append var end)
  (string->symbol (string-append (symbol->string var) "-" (symbol->string end))))

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
(define (dom-map dom) (variable-append (dom-name dom) 'map))
(define (dom-root dom) (variable-append (dom-name dom) 'root))
(define (dom-get dom elt)
  #;(variable-append (second elt) 'elt)
  `(,(dom-map dom) ,(second elt)))
