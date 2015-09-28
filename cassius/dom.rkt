#lang racket
(require unstable/sequence)
(require "common.rkt")

(provide (struct-out dom) (struct-out rendering-context)
         (struct-out element) parse-tree in-tree element-get
         element-next element-prev element-fchild element-lchild
         dom-root elt-from-name)

(struct dom (name context tree))
(struct rendering-context (width browser))
(struct element (type name attrs parent children)
        #:mutable
        #:methods gen:custom-write
        [(define (write-proc elt port mode)
           (fprintf port "[~a ~a]"
                    (element-type elt)
                    (string-join (map ~a (element-attrs elt)) " ")))])

(define (parse-tree tree)
  (let loop ([tree tree] [parent #f])
    (match-define `([,type ,attrs ...] ,children ...) tree)
    (define elt (element type (void) attrs parent (void)))
    (set-element-name! elt (elt-name elt))
    (define chld (map (curryr loop elt) children))
    (set-element-children! elt chld)
    elt))

(define (element-get elt name #:default [default #f])
  (for/first ([(k v) (in-groups 2 (element-attrs elt))] #:when (equal? k name)) v))

(define (element-prev elt)
  (define sibs (if (element-parent elt) (element-children (element-parent elt)) '()))
  (for/first ([prev (sequence-cons #f sibs)] [elt* sibs] #:when (equal? elt elt*)) prev))

(define (element-next elt)
  (define sibs (if (element-parent elt) (element-children (element-parent elt)) '()))
  (for/first ([next (sequence-tail (sequence-append sibs (in-value #f)) 1)]
              [elt* sibs] #:when (equal? elt elt*))
    next))

(define (element-fchild elt)
  (if (null? (element-children elt)) #f (first (element-children elt))))

(define (element-lchild elt)
  (if (null? (element-children elt)) #f (last (element-children elt))))

(define (in-tree elt)
  (apply sequence-append (in-value elt) (map in-tree (element-children elt))))

(define (dom-root dom) (sformat "~a-root" (dom-name dom)))

(define elt-names (make-hasheq))
(define (elt-name def)
  (hash-ref! elt-names def (lambda () (sformat "elt$~a" (hash-count elt-names)))))

(define (elt-from-name name)
  (for/first ([(key val) (in-hash elt-names)] #:when (eq? val name))
    key))

