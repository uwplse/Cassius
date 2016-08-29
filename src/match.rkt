#lang racket

(require "common.rkt" "tree.rkt" "selectors.rkt" "smt.rkt" "registry.rkt" "z3.rkt")
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

(define (link/root/c elt box)
  (smt-and `(displayed ,elt) (link/block/c elt (node-fchild box))))

(define (link/block/c elt box)
  (match* ((node-type box) (set-member? (map node-type (node-children box)) 'LINE))
    [('MAGIC _) 'true]
    [('BLOCK #t)
     (apply smt-and
            (map (λ (e b) (smt-and `(displayed ,e) (link/inline/c e b)))
                 (node-children elt)
                 (filter (λ (x) (not (equal? (node-type x) 'TEXT)))
                         (apply append (map node-children (node-children box))))))]
    [('BLOCK #f)
     (let loop ([elts (node-children elt)] [boxes (node-children box)])
       (match* (elts boxes)
         [('() '()) 'true]
         [('() _) 'false]
         [(_ _)
          (define match-heads
            (with-handlers ([(const true) (λ (e) #f)])
              (link/block/c (car elts) (car boxes))))
          (if match-heads
              `(ite (displayed ,(car elts))
                    ,(smt-and match-heads (loop (cdr elts) (cdr boxes)))
                    ,(loop (cdr elts) boxes))
              (smt-and `(not (displayed ,(car elts))) (loop (cdr elts) boxes)))]))]
    [('ANON #t)
     (apply smt-and
            (map (λ (e b) (smt-and `(displayed ,e) (link/inline/c e b)))
                 (node-children elt)
                 (filter (λ (x) (not (equal? (node-type x) 'TEXT)))
                         (apply append (map node-children (node-children box))))))]))

(define (link/inline/c elt box)
  (apply smt-and
         (map (λ (e b) (smt-and `(displayed ,e) (link/inline/c e b)))
              (node-children elt)
              (filter (λ (x) (not (equal? (node-type x) 'TEXT))) (node-children box)))))

(define (synthesize-dom elts boxes1 boxes2)
  (define match1-constraints
    (smt-replace
     (link/root/c elts boxes1)
     (list (cons '(displayed) (λ (elt) (sformat "d1/~a" (name 'elt elt)))))))
  (define match2-constraints
    (smt-replace
     (link/root/c elts boxes2)
     (list (cons '(displayed) (λ (elt) (sformat "d2/~a" (name 'elt elt)))))))

  (z3-solve
   `(,@(for/list ([elt (in-tree elts)]) `(declare-const ,(sformat "d1/~a" (name 'elt elt)) Bool))
     ,@(for/list ([elt (in-tree elts)]) `(declare-const ,(sformat "d2/~a" (name 'elt elt)) Bool))
     (assert ,match1-constraints)
     (assert ,match2-constraints)
     ,@(for/list ([elt (in-tree elts)])
         `(assert-soft ,(sformat "d1/~a" (name 'elt elt))))
     ,@(for/list ([elt (in-tree elts)])
         `(assert-soft (= ,(sformat "d1/~a" (name 'elt elt)) ,(sformat "d2/~a" (name 'elt elt))))))))
