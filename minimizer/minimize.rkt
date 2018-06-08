#lang racket

(require json "../src/common.rkt" "../src/tree.rkt" "../src/dom.rkt")

(provide get-box-to-remove)

(define/contract (get-elt-ancestor box)
  (-> node? (or/c node? false))
  (for/first ([anc (in-ancestors box)] #:when (node-get anc ':elt))
    anc))

(define/contract (elt<->ptr-association old)
  (-> (listof dom?) (values any/c any/c))

  (define tagcounts (make-hash))
  (define tag&index->elt (make-hash))
  (define elt->tag&index (make-hash))
  (for* ([doc old] [elt (in-elements doc)])
    (define tag (node-type elt))
    (define idx (dict-ref tagcounts tag 0))
    (dict-set! elt->tag&index elt (cons tag idx))
    (dict-set! tag&index->elt (cons tag idx) elt)
    (dict-set! tagcounts tag (+ 1 idx)))
  (values tag&index->elt elt->tag&index))

(define/contract (box-elt-index-association new old)
  (-> (listof node?) (listof dom?) (values any/c any/c))

  (define box->elt (make-hash))
  (define elt->box (make-hash))
  (for* ([boxes new] [dom old]
         [box (in-tree boxes)] [elt (in-elements dom)]
         #:when (and (node-get box ':elt) (node-get elt ':num))
         #:when (equal? (node-get box ':elt) (node-get elt ':num)))
    (dict-set! box->elt (node-get box ':elt) elt)
    (dict-set! elt->box (node-get elt ':num) box))
  (values box->elt elt->box))

(define (mark-ancestors nodes mark value)
  (for* ([node nodes] [anc (in-ancestors node)])
    (node-set! node mark value)))

;; Core selection algorithms

(define (bad-box? box)
  (for/or ([(key value) (in-dict (node-attrs box))])
    (match value
      [(list (list 'bad prop)) #t]
      [_ #f])))

(define (removable-uncle node test)
  (define parent (node-parent node))
  (and parent
       (let ([fromparent (removable-uncle parent test)]
             [next (node-next node)]
             [prev (node-prev node)])
         (or (test fromparent) (and next (test next)) (and prev (test prev))))))

(define (elt-to-remove node)
  (or
   (removable-uncle node (negate (curryr node-get ':bad)))
   (removable-uncle node (negate (curryr node-get ':dnr)))))

(define (sub-tree-size node)
  (+ 1 (apply + (map sub-tree-size (node-children node)))))

;; Glue code

(define elt-ptr? (cons/c symbol? integer?))

(define/contract (get-box-to-remove new* old* backtracked) ; new and old unparsed
  (-> (listof any/c #|trees|#) (listof any/c #|doms|#) (listof elt-ptr?) (list/c elt-ptr? integer? integer?))

  (define old (map parse-dom old*))
  (define new (map parse-tree new*))

  (define-values (ptr->elt elt->ptr) (elt<->ptr-association old))
  (define backtracked-elts (map (curry hash-ref ptr->elt) backtracked))
  (define-values (box->elt elt->box) (box-elt-index-association new old))

  (define failing
    (filter bad-box? (append-map (compose sequence->list in-tree) new)))

  (mark-ancestors (append failing backtracked-elts) ':bad #t)
  (mark-ancestors backtracked-elts ':dnr #t)

  (define candidates
    (for/list ([problem-box failing] #:when (get-elt-ancestor problem-box))
      (elt-to-remove
        (dict-ref box->elt (node-get (get-elt-ancestor problem-box) ':elt)))))

  (match candidates
    ['() false]
    [(list _ ...)
     (define to-remove (argmax sub-tree-size candidates))
     (define num (node-get to-remove ':num))

     (define removed-boxes (sub-tree-size (dict-ref elt->box to-remove)))
     (define total-boxes
       (length (append-map (compose sequence->list in-boxes) old)))

     (list (elt->ptr to-remove)
           removed-boxes
           total-boxes)]))
