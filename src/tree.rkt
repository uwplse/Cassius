#lang racket
(require "common.rkt")
(provide parse-tree unparse-tree tree-copy tree=?
         node-stx? node? node-type node-id node-parent node-children* node-children node-attrs
         node-get node-get* node-set! node-set*! node-add! node-remove!
         node-prev node-next node-fchild node-lchild in-ancestors in-tree
	 add-node-before! clone-node delete-node! append-node!)

(define-by-match node-stx?
  (? string?)
  (list (list (? symbol?) _ ...) (? node-stx?) ...))

(struct node (type id attrs parent children*) #:mutable
        #:methods gen:custom-write
        [(define (write-proc node port mode)
           (fprintf port "[~a ~a]" (node-type node) (string-join (map ~a (dict->attributes (node-attrs node))) " ")))])

(define node-counter 0)
(on-reset! (λ () (set! node-counter 0)))

(define (node-children node)
  (filter node? (node-children* node)))

(define (tree-copy tree)
  (assert (not (node-parent tree)) "To (tree-copy) you must pass the root of the tree")
  (parse-tree (unparse-tree tree)))

(define (tree=? tree1 tree2)
  (equal? (unparse-tree tree1) (unparse-tree tree2)))

(define (delete-node! node)
  (set-node-children*!
   (node-parent node)
   (filter (λ (x) (not (equal? x node))) (node-children* (node-parent node)))))

(define (add-to-list-before lst elt to-add)
  (if (equal? (car lst) elt)
      (cons to-add lst)
      (cons (car lst) (add-to-list-before (cdr lst) elt to-add))))

(define (add-node-before! next node)
  (set-node-children*!
   (node-parent next)
   (add-to-list-before (node-children* (node-parent next)) next node)))

(define (add-to-list-after lst elt to-add)
  (if (equal? (car lst) elt)
    (cons lst to-add)
    (cons (car lst) (add-to-list-after (cdr lst) elt to-add))))

(define (append-node! parent node-info)
  (match-define `([,type ,attrs ...]) node-info)
  (define n (node type node-counter (attributes->dict attrs) parent '()))
  (set! node-counter (+ 1 node-counter))
  (if (not (empty? (node-children parent)))
    (set-node-children*!
      parent
      (append (node-children parent) (list n)))
    (set-node-children*!
      parent
      (cons n empty)))
  n)

(define (clone-node n)
  (match n
    [(? string?) n]
    [(node type id attrs parent children*)
     (define n* (node type node-counter attrs parent (map clone-node children*)))
     (when (node-get n* ':num) (node-set! n* ':num (node-id n*)))
     (set! node-counter (+ 1 node-counter))
     n*]))

(define (parse-tree tree)
  (let loop ([tree tree] [parent #f])
    (match-define `([,type ,attrs ...] ,subtrees ...) tree)
    (define n (node type node-counter (attributes->dict attrs) parent (void)))
    (set! node-counter (+ 1 node-counter))
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

(define (in-ancestors node)
  (if node
      (sequence-append (in-value node) (in-ancestors (node-parent node)))
      empty-sequence))

(define (in-tree node)
  (apply sequence-append (in-value node) (map in-tree (node-children node))))
