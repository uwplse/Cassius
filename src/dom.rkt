#lang racket
(require "common.rkt" "registry.rkt")

(provide (struct-out dom)
         (struct-out element) parse-tree unparse-tree in-tree in-elements in-boxes
         element-get element-get* element-set! element-remove! dom-context
         element-parent element-next element-prev element-fchild element-lchild element-anscestors
         box-parent box-next box-prev box-fchild box-lchild box-anscestors
         is-element?)

(struct dom (name properties tree))
(struct element (type attrs parent* children)
        #:mutable
        #:methods gen:custom-write
        [(define (write-proc elt port mode)
           (fprintf port "[~a ~a]"
                    (element-type elt)
                    (string-join (map ~a (element-attrs elt)) " ")))])

(define (dom-context dom key #:default [default #f])
  (dict-ref (dom-properties dom) key default))

(define (parse-tree tree)
  (let loop ([tree tree] [parent #f])
    (match-define `([,type ,attrs ...] ,children ...) tree)
    (define elt (element type attrs parent (void)))
    (define chld (map (curryr loop elt) children))
    (set-element-children! elt chld)
    elt))

(define (unparse-tree tree)
  (cons
   (list* (element-type tree) (element-attrs tree))
   (map unparse-tree (element-children tree))))

(define (element-get elt name #:default [default #f])
  (for/first ([(k v) (in-groups 2 (element-attrs elt))] #:when (equal? name k)) v))

(define (element-get* elt names)
  (for/list ([(k v) (in-groups 2 (element-attrs elt))] #:when (set-member? names k))
    (cons k v)))

(define (element-set! elt name value)
  (set-element-attrs! elt
    (let loop ([plist (element-attrs elt)])
      (cond
       [(null? plist)
        (list name value)]
       [(equal? (car plist) name)
        (list* (car plist) value (cddr plist))]
       [else
        (list* (car plist) (cadr plist) (loop (cddr plist)))]))))

(define (element-remove! elt name)
  (set-element-attrs! elt
    (let loop ([plist (element-attrs elt)])
      (cond
       [(null? plist) plist]
       [(equal? (car plist) name) (cddr plist)]
       [else
        (list* (car plist) (cadr plist) (loop (cddr plist)))]))))

(define (is-element? elt)
  (or (not elt) (element-get elt ':tag)))

(define (box-parent elt)
  (element-parent* elt)) 

(define (element-parent elt)
  (define e (box-parent elt))
  (cond
   [(not e) #f]
   [(is-element? e) e]
   [else (element-parent e)]))

(define (element-prev elt)
  (define e (box-prev elt))
  (cond
   [(not e) #f]
   [(is-element? e) e]
   [(is-element? (box-lchild e)) (box-lchild e)]
   [else (or (element-prev (box-lchild e)) (element-prev e))]))

(define (box-prev elt)
  (define sibs (if (element-parent elt) (element-children (element-parent elt)) '()))
  (for/first ([prev (sequence-cons #f sibs)] [elt* sibs] #:when (equal? elt elt*)) prev))

(define (element-next elt)
  (define e (box-next elt))
  (cond
   [(not e) #f]
   [(is-element? e) e]
   [(is-element? (box-fchild e)) (box-fchild e)]
   [else (or (element-next (box-fchild e)) (element-next e))]))

(define (box-next elt)
  (define sibs (if (element-parent elt) (element-children (element-parent elt)) '()))
  (for/first ([next (sequence-tail (sequence-append sibs (in-value #f)) 1)]
              [elt* sibs] #:when (equal? elt elt*))
    next))

(define (element-fchild elt)
  (define e (box-fchild elt))
  (cond
   [(not e) #f]
   [(is-element? e) e]
   [else (element-next e)]))

(define (box-fchild elt)
  (if (null? (element-children elt)) #f (first (element-children elt))))

(define (element-lchild elt)
  (define e (box-lchild elt))
  (cond
   [(not e) #f]
   [(is-element? e) e]
   [else (element-prev e)]))

(define (box-lchild elt)
  (if (null? (element-children elt)) #f (last (element-children elt))))

(define (element-anscestors elt)
  (if (element-parent elt) (cons (element-parent elt) (element-anscestors (element-parent elt))) '()))

(define (box-anscestors elt)
  (if (box-parent elt) (cons (box-parent elt) (box-anscestors (box-parent elt))) '()))

(define (in-tree elt)
  (apply sequence-append (in-value elt) (map in-tree (element-children elt))))

(define (in-boxes dom)
  (in-tree (dom-tree dom)))

(define (in-elements dom)
  (sequence-filter is-element? (in-boxes dom)))
