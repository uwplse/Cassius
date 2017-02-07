#lang racket
(require "../common.rkt" "../smt.rkt")
(provide tree-types link-definitions)

(define-constraints tree-types
  (declare-datatypes ()
     ((Box no-box
           (box (type BoxType)
                (x Real) (y Real) (w Real) (h Real)
                (xo Real) (yo Real)
                (mt Real) (mr Real) (mb Real) (ml Real)
                (mtp Real) (mtn Real) (mbp Real) (mbn Real)
                (pt Real) (pr Real) (pb Real) (pl Real)
                (bt Real) (br Real) (bb Real) (bl Real)
                (stfwidth Real) (w-from-stfwidth Bool)
                (&pbox BoxName)
                (&vbox BoxName) (&nbox BoxName)
                (&fbox BoxName) (&lbox BoxName)
                (width-set Bool)
                (&nflow BoxName) (&vflow BoxName)
                (&pbflow BoxName) (&ppflow BoxName)
                (&flt BoxName) (&flt-up BoxName)
                ;; Because text-align inherits by default, it needs a
                ;; slot in the box type to propagate values from
                ;; parent to child.
                (textalign Text-Align)
                (&elt ElementName)))
      (BoxType box/root box/text box/inline box/block box/line)
      (Element no-elt
           (elt (specified-style Style) (computed-style Style)
                (&pelt ElementName) (&velt ElementName) (&nelt ElementName)
                (&felt ElementName) (&lelt ElementName)
                (&box BoxName)))))

  (assert (and (= (&elt no-box) nil-elt) (= (&box no-elt) nil-box))))

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
  (define-fun flt ((box Box)) Box (get/box (&flt box)))
  (define-fun pbflow ((box Box)) Box (get/box (&pbflow box)))
  (define-fun ppflow ((box Box)) Box (get/box (&ppflow box)))

  ;; From elements to boxes and back
  (define-fun box-elt ((box Box)) Element (get/elt (&elt box)))
  (define-fun elt-box ((elt Element)) Box (get/box (&box elt)))

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

  (define-fun box-in-flow ((box Box)) Bool
    (and (is-box box) (is-float/none (float box))
         (or (is-position/relative (position box))
             (is-position/static (position box)))))

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

  ;; `link-element` and `link-box` define the element and box trees
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
         (= (&lbox box) &l)))

  ;; `match-element-box` matchs elements and boxes together.
  ;; `match-anon-element` and `match-anon-box` do the same for
  ;; elements and boxes without links on the other side.
  (define-fun match-element-box ((&e ElementName) (&b BoxName)) Bool
    (and
     (= (&elt (get/box &b)) &e)
     (= (&box (get/elt &e)) &b)
     (= (textalign (pflow (get/box &b)))
        (style.text-align (computed-style (get/elt &e))))))

  (define-fun match-anon-element ((&e ElementName)) Bool
    (= (&box (get/elt &e)) nil-box))

  (define-fun match-anon-box ((&b BoxName)) Bool
    (and
     (= (&elt (get/box &b)) nil-elt)
     (= (textalign (pflow (get/box &b)))
        (ite (is-no-box (pflow (get/box &b)))
             text-align/left
             (textalign (pflow (get/box &b)))))))

  ;; `link-flow-simple`, `link-flow-root`, and `link-flow-block` link
  ;; boxes together in their flow trees. The "block" version is much
  ;; more complex than the non-block version, because so many things
  ;; can only be true of block boxes.
  (define-fun link-flow-simple ((b Box) (&b BoxName)) Bool
    (and
     (= (&pbflow b) (&pbflow (pflow b)))
     (= (&ppflow b) (&ppflow (pflow b)))
     (= (&vflow b) (&vbox b))
     (= (&nflow b) (&nbox b))
     (= (&flt b) (&flt (pbflow b)))
     (= (&flt-up b) (&flt b))))

  (define-fun link-flow-root ((b Box) (&b BoxName)) Bool
    (and
     (= (&pbflow b) &b)
     (= (&ppflow b) &b)
     (= (&vflow b) nil-box)
     (= (&nflow b) nil-box)
     (= (&flt b) nil-box)
     (= (&flt-up b) nil-box)))

  (define-fun link-flow-block ((b Box) (&b BoxName)) Bool
    (and
     (= (&pbflow b) &b)
     (= (&ppflow b)
        (ite (box-positioned (pbox b))
             (&pbox b)
             (&ppflow (pbox b))))
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
     (!
      (= (&flt b)
         ,(smt-cond
           [(is-box (vbox b)) (&flt-up (vbox b))]
           [(box-in-flow (pbox b)) (&flt (pbox b))]
           [else nil-box]))
      :opt false)
     (!
      (= (&flt-up b)
         ,(smt-cond
           [(box-positioned b) (ite (is-box (vbox b)) (&flt-up (vbox b)) nil-box)]
           [(not (is-float/none (float b))) &b]
           [(is-no-box (lbox b)) (&flt b)]
           [else (&flt-up (lbox b))]))
      :opt false))))

