#lang racket
(require "registry.rkt" "common.rkt")
(provide parse-tree unparse-tree tree-copy tree=?
         node? node-type node-parent node-children* node-children node-attrs
         node-get node-get* node-set! node-set*! node-add! node-remove!
         node-prev node-next node-fchild node-lchild in-tree)

(struct node (type attrs parent children*) #:mutable
        #:methods gen:custom-write
        [(define (write-proc node port mode)
           (fprintf port "[~a ~a]" (node-type node) (string-join (map ~a (dict->attributes (node-attrs node))) " ")))])

(define (node-children node)
  (filter node? (node-children* node)))

(define (tree-copy tree)
  (assert (not (node-parent tree)) "To (tree-copy) you must pass the root of the tree")
  (parse-tree (unparse-tree tree)))

(define (tree=? tree1 tree2)
  (equal? (unparse-tree tree1) (unparse-tree tree2)))

(define (parse-tree tree)
  (let loop ([tree tree] [parent #f])
    (match-define `([,type ,attrs ...] ,subtrees ...) tree)
    (define n (node type (attributes->dict attrs) parent (void)))
    (set-node-children*! n (for/list ([k subtrees]) (if (list? k) (loop k n) k)))
    n))

(define (unparse-tree node)
  (if (node? node)
      (list*
       (list* (node-type node) (dict->attributes (node-attrs node)))
       (map unparse-tree (node-children* node)))
      node))

(define (node-get node name #:default [default #f])
  (apply values (node-get* node name #:default (list default))))

(define (node-get* node name #:default [default #f])
  (dict-ref (node-attrs node) name default))

(define (node-set! node name value)
  (set-node-attrs! node (dict-set (node-attrs node) name (list value))))

(define (node-add! node name value)
  (node-set*! node name (cons value (node-get* node name #:default '()))))

(define (node-set*! node name value)
  (set-node-attrs! node (dict-set (node-attrs node) name value)))

(define (node-remove! node name)
  (set-node-attrs! node (dict-remove (node-attrs node) name)))

(define (node-prev node)
  (define sibs (if (node-parent node) (node-children (node-parent node)) (list node)))
  (for/first ([prev (cons #f sibs)] [node* sibs] #:when (equal? node node*)) prev))

(define (node-next node)
  (define sibs (if (node-parent node) (node-children (node-parent node)) (list node)))
  (match (member node sibs) [(list _ next _ ...) next] [(list _) #f]))

(define (node-fchild node)
  (if (null? (node-children node)) #f (first (node-children node))))

(define (node-lchild node)
  (if (null? (node-children node)) #f (last (node-children node))))

(define (in-tree node)
  (apply sequence-append (in-value node) (map in-tree (node-children node))))
