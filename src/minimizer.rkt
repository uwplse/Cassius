#lang racket

(require json "common.rkt" "tree.rkt" "dom.rkt")

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
    (dict-set! box->elt box elt)
    (dict-set! elt->box elt box))
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

(define/contract (removable-uncle node test)
  (-> node? (-> node? boolean?) (or/c node? false))
  (define parent (node-parent node))
  (and parent
       (let ([fromparent (removable-uncle parent test)]
             [next (node-next node)]
             [prev (node-prev node)])
         (cond
          [(and fromparent (test fromparent)) fromparent]
          [(and next (test next)) next]
          [(and prev (test prev)) prev]
          [else false]))))

(define/contract (elt-to-remove node)
  (-> node? (or/c node? false))
  (or
   (removable-uncle node (negate (curryr node-get ':bad)))
   (removable-uncle node (negate (curryr node-get ':dnr)))))

(define (sub-tree-size node)
  (+ 1 (apply + (map sub-tree-size (node-children node)))))

;; Glue code

(define elt-ptr? (cons/c symbol? integer?))

(define/contract (get-box-to-remove new* old* backtracked) ; new and old unparsed
  (-> (listof any/c #|trees|#) (listof any/c #|doms|#) (listof elt-ptr?)
      (or/c (list/c elt-ptr? integer? integer?) false))

  (define old (map parse-dom old*))
  (define new (map parse-tree new*))

  (define-values (ptr->elt elt->ptr) (elt<->ptr-association old))
  ;; TODO: Why are the backtracked elements sometimes not present?
  (define backtracked-elts (filter identity (map (λ (x) (hash-ref ptr->elt x #f)) backtracked)))
  (define-values (box->elt elt->box) (box-elt-index-association new old))

  (define failing
    (filter bad-box? (append-map (compose sequence->list in-tree) new)))

  (mark-ancestors (append failing backtracked-elts) ':bad #t)
  (mark-ancestors backtracked-elts ':dnr #t)

  (define candidates
    (filter identity
            (for/list ([problem-box failing] #:when (get-elt-ancestor problem-box))
              (elt-to-remove
               (dict-ref box->elt (get-elt-ancestor problem-box))))))

  (match candidates
    ['() false]
    [(list _ ...)
     (define to-remove (argmax sub-tree-size candidates))
     (define num (node-get to-remove ':num))

     (define removed-boxes (sub-tree-size (dict-ref elt->box to-remove)))
     (define total-boxes
       (length (append-map (compose sequence->list in-boxes) old)))

     (list (dict-ref elt->ptr to-remove)
           removed-boxes
           total-boxes)]))
