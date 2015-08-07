#lang racket
(require unstable/sequence)
(require "common.rkt")

(provide (struct-out dom) (struct-out rendering-context)
         in-tree-subtrees in-tree-values
         dom-get dom-type dom-root elt-name elt-from-name
         dom-definitions dom-declarations)

(struct dom (name stylesheet context tree))
(struct rendering-context (width))

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
             (box (x Real) (y Real) (w Real) (h Real)
                  (mt Real) (mr Real) (mb Real) (ml Real)
                  (mtp Real) (mtn Real) (mbp Real) (mbn Real)
                  (pt Real) (pr Real) (pb Real) (pl Real)
                  (bt Real) (br Real) (bb Real) (bl Real)
                  (p-name BoxName) (v-name BoxName) (f-name BoxName) (l-name BoxName)
                  (element ElementName)))
        (Element no-elt
             (elt (document Document) (tagname TagNames) (id Id) (rules Style)
                  (display Display) (float Float) (textalign TextAlign)
                  (previous-name ElementName) (parent-name ElementName)
                  (first-child-name ElementName) (last-child-name ElementName)
                  (flow-box BoxName) (float-box BoxName) (child-box BoxName)))))))

(define dom-definitions
  `((define-fun left-outer ((box Box)) Real (- (x box) (ml box)))
    (define-fun left-border ((box Box)) Real (x box))
    (define-fun box-left ((box Box)) Real (+ (x box) (bl box)))
    (define-fun left-padding ((box Box)) Real (+ (x box) (bl box)))
    (define-fun left-content ((box Box)) Real (+ (x box) (bl box) (pl box)))

    (define-fun right-content ((box Box)) Real (+ (x box) (bl box) (pl box) (w box)))
    (define-fun right-padding ((box Box)) Real (+ (x box) (bl box) (pl box) (w box) (pr box)))
    (define-fun box-right ((box Box)) Real (+ (x box) (bl box) (pl box) (w box) (pr box)))
    (define-fun right-border ((box Box)) Real (+ (x box) (bl box) (pl box) (w box) (pr box) (br box)))
    (define-fun right-outer ((box Box)) Real (+ (x box) (bl box) (pl box) (w box) (pr box) (br box) (mr box)))

    (define-fun top-outer ((box Box)) Real (- (y box) (mtn box) (mtp box)))
    (define-fun top-border ((box Box)) Real (y box))
    (define-fun box-top ((box Box)) Real (+ (y box) (bt box)))
    (define-fun top-padding ((box Box)) Real (+ (y box) (bt box)))
    (define-fun top-content ((box Box)) Real (+ (y box) (bt box) (pt box)))

    (define-fun bottom-content ((box Box)) Real (+ (y box) (bt box) (pt box) (h box)))
    (define-fun bottom-padding ((box Box)) Real (+ (y box) (bt box) (pt box) (h box) (pb box)))
    (define-fun box-bottom ((box Box)) Real (+ (y box) (bt box) (pt box) (h box) (pb box)))
    (define-fun bottom-border ((box Box)) Real (+ (y box) (bt box) (pt box) (h box) (pb box) (bb box)))
    (define-fun bottom-outer ((box Box)) Real (+ (y box) (bt box) (pt box) (h box) (pb box) (bb box) (mbp box) (mbn box)))

    (define-fun box-width ((box Box)) Real  (+ (bl box) (pl box) (w box) (pr box) (br box)))
    (define-fun box-height ((box Box)) Real (+ (bt box) (pt box) (h box) (pb box) (bb box)))

    (define-fun max ((x Real) (y Real)) Real (ite (< x y) y x))
    (define-fun min ((x Real) (y Real)) Real (ite (< x y) x y))
    (define-fun between ((x Real) (y Real) (z Real)) Bool
      (or (<= x y z) (>= x y z)))

    (define-fun horizontally-adjacent ((box1 Box) (box2 Box)) Bool
      (or (> (+ (y box1) (box-height box1)) (y box2) (y box1))
          (> (+ (y box2) (box-height box2)) (y box1) (y box2))))

    (define-fun previous ((elt Element)) Element (get/elt (previous-name elt)))
    (define-fun parent   ((elt Element)) Element (get/elt (parent-name elt)))
    (define-fun fchild   ((elt Element)) Element (get/elt (first-child-name elt)))
    (define-fun lchild   ((elt Element)) Element (get/elt (last-child-name elt)))

    (define-fun pbox ((box Box)) Box (get/box (p-name box)))
    (define-fun vbox ((box Box)) Box (get/box (v-name box)))
    (define-fun fbox ((box Box)) Box (get/box (f-name box)))
    (define-fun lbox ((box Box)) Box (get/box (l-name box)))))
