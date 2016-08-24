#lang racket

(require "common.rkt" "tree.rkt" "selectors.rkt")
(provide link-elts-boxes)

(define (sheet->display? elts sheet)
  (define eqs (equivalence-classes sheet (sequence->list (in-tree elts))))
  (λ (elt)
    (match-define (cons class-hash value-hash) (dict-ref eqs 'display))
    (not (equal? 'none (dict-ref value-hash (dict-ref class-hash elt))))))

(define (link-elts-boxes sheet elts boxes)
  (define elt->box (make-hasheq))
  (define box->elt (make-hasheq))
  (define (match! elt box)
    (dict-set! elt->box elt box)
    (dict-set! box->elt box elt))
  (link/root match! (sheet->display? elts sheet) elts boxes)
  (λ (x) (dict-ref elt->box x (λ () (dict-ref box->elt x #f)))))

(define (link/root match! display? elt box)
  (assert (equal? (node-type box) 'VIEW)
          "At root, box must be a VIEW box")
  (when (display? elt)
    (link/block match! display? elt (node-fchild box))))

(define (link/block match! display? elt box)
  (match* ((node-type box) (set-member? (map node-type (node-children box)) 'LINE))
    [('MAGIC _)
     (match! elt box)]
    [('BLOCK #t)
     (match! elt box)
     (for-each (curry link/inline match! display?)
               (node-children elt)
               (filter (λ (x) (not (equal? (node-type x) 'TEXT)))
                       (apply append (map node-children (node-children box)))))]
    [('BLOCK #f)
     (match! elt box)
     (for-each (curry link/block match! display?)
               (filter display? (node-children elt))
               (node-children box))]
    [('ANON #t)
     (for-each (curry link/inline match! display?)
               (node-children elt)
               (filter (λ (x) (not (equal? (node-type x) 'TEXT)))
                       (apply append (map node-children (node-children box)))))]))

(define (link/inline match! display? elt box)
  (match! elt box)
  (for-each (curry link/inline match! display?)
            (node-children elt)
            (filter (λ (x) (not (equal? (node-type x) 'TEXT))) (node-children box))))
