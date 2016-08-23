#lang racket

(require "common.rkt" "tree.rkt")
(provide link-elts-boxes)

(define (produces-boxes? elt)
  (not (node-get* elt ':no-display #:default #f)))

(define (link-elts-boxes elts boxes)
  (define elt->box (make-hasheq))
  (define box->elt (make-hasheq))
  (define (match! elt box)
    (dict-set! elt->box elt box)
    (dict-set! box->elt box elt))
  (link/root match! elts boxes)
  (λ (x) (dict-ref elt->box x (λ () (dict-ref box->elt x #f)))))

(define (link/root match! elt box)
  (assert (equal? (node-type box) 'VIEW)
          "At root, box must be a VIEW box")
  (link/block match! elt (node-fchild box)))

(define (link/block match! elt box)
  (match* ((node-type box) (set-member? (map node-type (node-children box)) 'LINE))
    [('MAGIC _)
     (match! elt box)]
    [('BLOCK #t)
     (match! elt box)
     (for-each (curry link/inline match!)
               (node-children elt)
               (filter (λ (x) (not (equal? (node-type x) 'TEXT)))
                       (apply append (map node-children (node-children box)))))]
    [('BLOCK #f)
     (match! elt box)
     (for-each (curry link/block match!)
               (filter produces-boxes? (node-children elt))
               (node-children box))]
    [('ANON #t)
     (for-each (curry link/inline match!)
               (node-children elt)
               (filter (λ (x) (not (equal? (node-type x) 'TEXT)))
                       (apply append (map node-children (node-children box)))))]))

(define (link/inline match! elt box)
  (match! elt box)
  (for-each (curry link/inline match!)
            (node-children elt)
            (filter (λ (x) (not (equal? (node-type x) 'TEXT))) (node-children box))))
