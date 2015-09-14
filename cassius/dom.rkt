#lang racket
(require unstable/sequence)
(require "common.rkt")

(provide (struct-out dom) (struct-out rendering-context)
         in-tree-subtrees in-tree-values
         dom-get dom-type dom-root elt-name elt-from-name)

(struct dom (name stylesheet context tree))
(struct rendering-context (width browser))

(define (in-tree-subtrees tree)
  (apply sequence-append
         (in-parallel (in-value (car tree)) (in-value (cdr tree)))
         (map in-tree-subtrees (cdr tree))))

(define (in-tree-values tree)
  (apply sequence-append
         (in-value (car tree))
         (map in-tree-values (cdr tree))))

(define (dom-type dom) (dom-name dom))
(define (dom-root dom) (sformat "~a-root" (dom-name dom)))
(define (dom-get dom elt) `(get/elt ,(elt-name elt)))

(define elt-names (make-hasheq))
(define (elt-name def)
  (hash-ref! elt-names def (lambda () (sformat "elt$~a" (hash-count elt-names)))))

(define (elt-from-name name)
  (for/first ([(key val) (in-hash elt-names)] #:when (eq? val name))
    key))

