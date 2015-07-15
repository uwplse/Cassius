#lang racket
(require unstable/sequence)
(require "common.rkt")

(provide (struct-out dom) (struct-out rendering-context)
         in-tree-subtrees in-tree-values
         dom-get dom-type dom-root elt-name elt-from-name
         dom-definitions)

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

(define elt-names (make-hash))
(define (elt-name def)
  (hash-ref! elt-names def (lambda () (sformat "elt$~a" (hash-count elt-names)))))

(define (elt-from-name name)
  (for/first ([(key val) (in-hash elt-names)] #:when (eq? val name))
    key))

(define dom-definitions
  `((declare-datatypes ()
       ((Rect (rect (x Real) (y Real) (w Real) (h Real)
                    (mt Real) (mr Real) (mb Real) (ml Real)
                    (mtp Real) (mtn Real) (mbp Real) (mbn Real)
                    (pt Real) (pr Real) (pb Real) (pl Real)
                    (bt Real) (br Real) (bb Real) (bl Real)))
        (Box no-box
             (box (document Document) (tagname TagNames) (id Id) (rules Style)
                  (display Display) (float Float) (textalign TextAlign)
                  (previous ElementName) (parent ElementName)
                  (first-child ElementName) (last-child ElementName)
                  (flow-box Rect) (placement-box Rect)))))

    (define-fun left-outer ((box Rect)) Real (- (x box) (ml box)))
    (define-fun left-border ((box Rect)) Real (x box))
    (define-fun box-left ((box Rect)) Real (+ (x box) (bl box)))
    (define-fun left-padding ((box Rect)) Real (+ (x box) (bl box)))
    (define-fun left-content ((box Rect)) Real (+ (x box) (bl box) (pl box)))

    (define-fun right-content ((box Rect)) Real (+ (x box) (bl box) (pl box) (w box)))
    (define-fun right-padding ((box Rect)) Real (+ (x box) (bl box) (pl box) (w box) (pr box)))
    (define-fun box-right ((box Rect)) Real (+ (x box) (bl box) (pl box) (w box) (pr box)))
    (define-fun right-border ((box Rect)) Real (+ (x box) (bl box) (pl box) (w box) (pr box) (br box)))
    (define-fun right-outer ((box Rect)) Real (+ (x box) (bl box) (pl box) (w box) (pr box) (br box) (mr box)))

    (define-fun top-outer ((box Rect)) Real (- (y box) (mtn box) (mtp box)))
    (define-fun top-border ((box Rect)) Real (y box))
    (define-fun box-top ((box Rect)) Real (+ (y box) (bt box)))
    (define-fun top-padding ((box Rect)) Real (+ (y box) (bt box)))
    (define-fun top-content ((box Rect)) Real (+ (y box) (bt box) (pt box)))

    (define-fun bottom-content ((box Rect)) Real (+ (y box) (bt box) (pt box) (h box)))
    (define-fun bottom-padding ((box Rect)) Real (+ (y box) (bt box) (pt box) (h box) (pb box)))
    (define-fun box-bottom ((box Rect)) Real (+ (y box) (bt box) (pt box) (h box) (pb box)))
    (define-fun bottom-border ((box Rect)) Real (+ (y box) (bt box) (pt box) (h box) (pb box) (bb box)))
    (define-fun bottom-outer ((box Rect)) Real (+ (y box) (bt box) (pt box) (h box) (pb box) (bb box) (mbp box) (mbn box)))

    (define-fun box-width ((box Rect)) Real  (+ (bl box) (pl box) (w box) (pr box) (br box)))
    (define-fun box-height ((box Rect)) Real (+ (bt box) (pt box) (h box) (pb box) (bb box)))

    (define-fun max ((x Real) (y Real)) Real (ite (< x y) y x))
    (define-fun min ((x Real) (y Real)) Real (ite (< x y) x y))
    (define-fun between ((x Real) (y Real) (z Real)) Bool
      (or (<= x y z) (>= x y z)))

    (define-fun horizontally-adjacent ((box1 Rect) (box2 Rect)) Bool
      (or (> (+ (y box1) (box-height box1)) (y box2) (y box1))
          (> (+ (y box2) (box-height box2)) (y box1) (y box2))))))
