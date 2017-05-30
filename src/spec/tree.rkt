#lang racket
(require "../common.rkt" "../smt.rkt")
(provide tree-types link-definitions)

;; This file defines the tree structures used in Cassius's SMT
;; encoding of CSS. It defines the Element and Box classes, and
;; functions to properly establish the pointers each holds.

(define-constraints tree-types
  (declare-datatypes ()
     ((Box no-box
           (box (type BoxType)
                (x Real) (y Real) (w Real) (h Real) ; X, Y and width/height
                (xo Real) (yo Real) ; X and Y offset
                (mt Real) (mr Real) (mb Real) (ml Real) ; margins
                (mtp Real) (mtn Real) (mbp Real) (mbn Real) ; top/bottom positive/negative margins for collapsing
                (pt Real) (pr Real) (pb Real) (pl Real) ; padding
                (bt Real) (br Real) (bb Real) (bl Real) ; border
                (stfwidth Real) (stfmax Real) (w-from-stfwidth Bool)
                (&pbox BoxName) (&vbox BoxName) (&nbox BoxName) (&fbox BoxName) (&lbox BoxName) ; box tree pointers
                (width-set Bool) ; used for dependency creation only
                (font-size Real)
                (&nflow BoxName) (&vflow BoxName) ; flow tree pointers
                (&ppflow BoxName) ; parent positioned pointers
                (ez.in EZone) (ez.out EZone)
                (textalign Text-Align) ; to handle inheritance; TODO: handle better
                (&elt ElementName)))
      (BoxType box/root box/text box/inline box/block box/line)
      (Element no-elt
           (elt (specified-style Style) (computed-style Style) ; see compute-style.rkt
                (is-replaced Bool) (intrinsic-width Real) (intrinsic-height Real)
                (&pelt ElementName) (&velt ElementName) (&nelt ElementName)
                (&felt ElementName) (&lelt ElementName)))))

  ,@(for/list ([field '(&pelt &velt &nelt &felt &lelt)])
      `(assert (= (,field no-elt) nil-elt)))
  ,@(for/list ([field '(&pbox &vbox &nbox &fbox &lbox &nflow &vflow &ppflow)])
      `(assert (= (,field no-box) nil-box)))

  (assert (= (&elt no-box) nil-elt)))

(define-constraints link-definitions
  ;; The elements in each direction in the element tree
  (define-fun velt ((elt Element)) Element (get/elt (&velt elt)))
  (define-fun nelt ((elt Element)) Element (get/elt (&nelt elt)))
  (define-fun pelt ((elt Element)) Element (get/elt (&pelt elt)))
  (define-fun felt ((elt Element)) Element (get/elt (&felt elt)))
  (define-fun lelt ((elt Element)) Element (get/elt (&lelt elt)))

  ;; The boxes in each direction in the box tree
  (define-fun pbox ((box Box)) Box (get/box (&pbox box)))
  (define-fun fbox ((box Box)) Box (get/box (&fbox box)))
  (define-fun lbox ((box Box)) Box (get/box (&lbox box)))
  (define-fun vbox ((box Box)) Box (get/box (&vbox box)))
  (define-fun nbox ((box Box)) Box (get/box (&nbox box)))

  ;; Three additional pointers: to the previous floating box, the
  ;; parent block box, and the parent positioned box.
  (define-fun ppflow ((box Box)) Box (get/box (&ppflow box)))

  ;; From elements to boxes and back
  (define-fun box-elt ((box Box)) Element (get/elt (&elt box)))

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
    (is-nil-elt (&pelt e)))

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
  (define-fun nflow ((box Box)) Box (get/box (&nflow box)))
  (define-fun vflow ((box Box)) Box (get/box (&vflow box)))
  (define-fun fflow ((b Box)) Box
    (ite (=> (is-box (fbox b)) (box-in-flow (fbox b)))
         (fbox b) (nflow (fbox b))))
  (define-fun lflow ((b Box)) Box
    (ite (=> (is-box (lbox b)) (box-in-flow (lbox b)))
         (lbox b) (vflow (lbox b))))

  ;; `link-element` and `link-box` set the element and box tree pointers
  (define-fun link-element
    ((elt Element) (&p ElementName) (&v ElementName) (&n ElementName)
     (&f ElementName) (&l ElementName)) Bool
    (and (is-elt elt)
         (= (&pelt elt) &p)
         (= (&velt elt) &v)
         (= (&nelt elt) &n)
         (= (&felt elt) &f)
         (= (&lelt elt) &l)))

  (define-fun link-box
    ((box Box) (&p BoxName) (&v BoxName) (&n BoxName)
     (&f BoxName) (&l BoxName)) Bool
    (and (is-box box)
         (= (&pbox box) &p)
         (= (&vbox box) &v)
         (= (&nbox box) &n)
         (= (&fbox box) &f)
         (= (&lbox box) &l)
         ,@(for/list ([field '(bl br bt bb pr pb pt w h mtp mbp stfwidth)]) ; No pl because text-indent
             `(>= (,field box) 0.0))
         ,@(for/list ([field '(mtn mbn)])
             `(<= (,field box) 0.0))))

  ;; `match-element-box` matchs elements and boxes together.
  ;; `match-anon-element` and `match-anon-box` do the same for
  ;; elements and boxes without links on the other side.
  (define-fun match-element-box ((&e ElementName) (&b BoxName)) Bool
    (and
     (= (&elt (get/box &b)) &e)
     (= (textalign (get/box &b))
        (style.text-align (computed-style (get/elt &e))))))

  (define-fun match-anon-box ((&b BoxName)) Bool
    (and
     (= (&elt (get/box &b)) nil-elt)
     (= (textalign (get/box &b))
        (ite (is-no-box (pflow (get/box &b)))
             text-align/left
             (textalign (pflow (get/box &b)))))))

  ;; `link-flow-simple`, `link-flow-root`, and `link-flow-block` link
  ;; boxes together in their flow trees. The "block" version is much
  ;; more complex than the non-block version, because so many things
  ;; can only be true of block boxes.
  (define-fun link-flow-root ((b Box) (&b BoxName)) Bool
    (and
     (= (&ppflow b) &b)
     (= (&vflow b) nil-box)
     (= (&nflow b) nil-box)
     (= (ez.in b) ez.init)))

  (define-fun link-flow-simple ((b Box) (&b BoxName)) Bool
    (and
     (= (&ppflow b) (ite (box-positioned (pbox b)) (&pbox b) (&ppflow (pflow b))))
     (= (&vflow b) (&vbox b))
     (= (&nflow b) (&nbox b))
     (= (ez.in b) (ite (is-no-box (vbox b))
                       (ite (is-flow-root (pbox b))
                            ez.init
                            (ez.in (pbox b)))
                       (ez.out (vbox b))))))

  (define-fun link-flow-block ((b Box) (&b BoxName)) Bool
    (and
     (= (&ppflow b) (ite (box-positioned (pbox b)) (&pbox b) (&ppflow (pbox b))))
     (= (&vflow b)
        ,(smt-cond
          [(is-no-box (vbox b)) nil-box]
          [(box-in-flow (vbox b)) (&vbox b)]
          [else (&vflow (vbox b))]))
     (= (&nflow b)
        ,(smt-cond
          [(is-no-box (nbox b)) nil-box]
          [(box-in-flow (nbox b)) (&nbox b)]
          [else (&nflow (nbox b))]))
     (= (ez.in b) (ite (is-no-box (vbox b))
                       (ite (is-flow-root (pbox b))
                            ez.init
                            (ez.in (pbox b)))
                       (ez.out (vbox b)))))))

