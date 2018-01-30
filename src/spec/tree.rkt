#lang racket
(require "../common.rkt" "../smt.rkt" "../encode.rkt" "utils.rkt")
(provide link-definitions)

;; This file defines the tree structures used in Cassius's SMT
;; encoding of CSS. It defines the Element and Box classes, and
;; functions to properly establish the pointers each holds.

(define-constraints link-definitions


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

  ;; The boxes in each direction in the flow tree
  (define-fun pflow ((box Box)) Box (pbox box))

  ;; `link-element` and `link-box` set the element and box tree pointers
  (define-fun link-element ((elt Element) (pe Element) (ve Element) (ne Element) (fe Element) (le Element)) Bool
    (and (= (pelt elt) pe) (= (velt elt) ve) (= (nelt elt) ne) (= (felt elt) fe) (= (lelt elt) le)))

  (define-fun link-box ((box Box) (p Box) (v Box) (n Box) (f Box) (l Box)) Bool
    (and (= (pbox box) p) (= (vbox box) v) (= (nbox box) n) (= (fbox box) f) (= (lbox box) l)
         ,@(for/list ([field '(bl br bt bb pr pb pt w h mtp mbp stfwidth)]) ; No pl because text-indent
             `(>= (,field box) 0.0))
         ,@(for/list ([field '(mtn mbn)])
             `(<= (,field box) 0.0))))

  ;; `match-element-box` matchs elements and boxes together.
  ;; `match-anon-element` and `match-anon-box` do the same for
  ;; elements and boxes without links on the other side.
  (define-fun match-element-box ((e Element) (b Box) (first? Bool) (last? Bool)) Bool
    (and
     (= (box-elt b) e)
     (= (first-box? b) first?)
     (= (last-box? b) last?)
     (= (textalign b)
        (style.text-align (computed-style e)))
     (= (fg-color b)
        (style.color (computed-style e)))
     (= (bg-color b)
        (style.background-color (computed-style e)))))

  (define-fun match-anon-box ((b Box)) Bool
    (and
     (is-no-elt (box-elt b))
     (= (first-box? b) true)
     (= (last-box? b) true)
     (= (textalign b)
        (ite (is-no-box (pflow b))
             text-align/left
             (textalign (pflow b))))
     (= (fg-color b)
        (ite (is-no-box (pflow b))
             color/black
             (fg-color (pflow b))))
     (= (bg-color b) color/transparent)))

  ;; `link-flow-simple`, `link-flow-root`, and `link-flow-block` link
  ;; boxes together in their flow trees. The "block" version is much
  ;; more complex than the non-block version, because so many things
  ;; can only be true of block boxes.
  (define-fun link-flow-root ((b Box)) Bool
    (and
     (= (ez.in b) ez.init)))

  (define-fun link-flow-simple ((b Box)) Bool
    (and
     (= (ez.in b) (ite (is-no-box (vbox b))
                       (ite (is-flow-root (pbox b))
                            ez.init
                            (ez.in (pbox b)))
                       (ez.out (vbox b))))))

  (define-fun link-flow-block ((b Box)) Bool
    (and
     (= (ez.in b) (ite (is-no-box (vbox b))
                       (ite (is-flow-root (pbox b))
                            ez.init
                            (ez.in (pbox b)))
                       (ez.out (vbox b)))))))

