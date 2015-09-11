#lang racket
(require unstable/sequence)
(require "common.rkt")

(provide (struct-out dom) (struct-out rendering-context)
         in-tree-subtrees in-tree-values
         dom-get dom-type dom-root elt-name elt-from-name
         dom-declarations)

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

(define dom-declarations
  `((declare-datatypes ()
       ((Box no-box
             (box (type BoxType)
                  (x Real) (y Real) (w Real) (h Real)
                  (mt Real) (mr Real) (mb Real) (ml Real)
                  (mtp Real) (mtn Real) (mbp Real) (mbn Real)
                  (pt Real) (pr Real) (pb Real) (pl Real)
                  (bt Real) (br Real) (bb Real) (bl Real)
                  (p-name BoxName) (f-name BoxName) (l-name BoxName)
                  (n-name BoxName) (vnf-name BoxName) (vff-name BoxName)
                  (element ElementName)))
        (BoxType box/root box/text box/inline box/block box/line)
        (Element no-elt
             (elt (document Document) (tagname TagNames) (id Id) (rules Style)
                  (display Display) (float Float) (textalign TextAlign)
                  (previous-name ElementName) (parent-name ElementName) (next-name ElementName)
                  (first-child-name ElementName) (last-child-name ElementName)
                  (flow-box BoxName)))))))

