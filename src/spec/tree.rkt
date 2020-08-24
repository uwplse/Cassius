#lang racket
(require "../common.rkt" "../smt.rkt" "../encode.rkt" "utils.rkt")
(provide link-definitions link-common)

;; This file defines the tree structures used in Cassius's SMT
;; encoding of CSS. It defines the Element and Box classes, and
;; functions to properly establish the pointers each holds.

(define-constraints (link-definitions)

  ;; Helper functions for some basic primitives
  (define-fun float ((b Box)) Float
    (ite (is-elt (box-elt b))
         (style.float (computed-style (box-elt b)))
         float/none))

  (define-fun position ((b Box)) Position
    (ite (is-elt (box-elt b))
         (style.position (computed-style (box-elt b)))
         position/static))

  (define-fun box-positioned ((box Box)) Bool
    (or (is-position/absolute (position box))
        (is-position/fixed (position box))
        (is-position/relative (position box))))

  (define-fun is-root-elt ((e Element)) Bool
    (is-no-elt (pelt e)))

  (define-fun box-in-flow ((box Box)) Bool
    (and (is-box box) (is-float/none (float box))
         (or (is-position/relative (position box))
             (is-position/static (position box)))))

  (define-fun is-flow-root ((b Box)) Bool
    (and (is-elt (box-elt b))
         (or (is-box/root (type b))
             (is-root-elt (box-elt b))
             (not (box-in-flow b))
             (is-display/inline-block (style.display (computed-style (box-elt b))))
             (not (is-overflow/visible (style.overflow-x (computed-style (box-elt b)))))
             (not (is-overflow/visible (style.overflow-y (computed-style (box-elt b))))))))

  (assert
   (forall ((b Box))
           (ite (is-elt (box-elt b))
                (let ([s (computed-style (box-elt b))])
                  (and (= (bg-color b) (style.background-color s))
                       (= (fg-color b) (style.color s))))
                (and (= (bg-color b) color/transparent)
                     (= (fg-color b)
                        (ite (is-box (pflow b))
                             (fg-color (pflow b))
                             color/black)))))))

(define-constraints (link-common)
  ;; The boxes in each direction in the flow tree
  (define-fun pflow ((box Box)) Box (pbox box))

  (define-fun link-box ((box Box) (p Box) (v Box) (n Box) (f Box) (l Box)) Bool
    (and (= (pbox box) p) (= (vbox box) v) (= (nbox box) n) (= (fbox box) f) (= (lbox box) l)))

  (define-fun link-box-component ((box Box) (p Box) (v Box) (n Box) (f Box) (l Box)) Bool
    (and (=> (is-box p) (and (= (pbox box) p) (= (vbox box) v) (= (nbox box) n)))
         (= (fbox box) f) (= (lbox box) l)))

  (define-fun link-box-magic ((box Box) (p Box) (v Box) (n Box) (f Box) (l Box)) Bool
    (and (=> (is-box p) (and (= (pbox box) p) (= (vbox box) v) (= (nbox box) n)))))
  
   (define-fun link-box-no-next  ((box Box) (p Box) (v Box) (n Box) (f Box) (l Box)) Bool
    (and (= (pbox box) p) (= (vbox box) v)))
  
   (define-fun link-box-no-prev  ((box Box) (p Box) (v Box) (n Box) (f Box) (l Box)) Bool
    (and (= (pbox box) p) (= (nbox box) n)))

   (define-fun link-box-no-next-or-prev  ((box Box) (p Box) (v Box) (n Box) (f Box) (l Box)) Bool
    (and (= (pbox box) p)))

  )

