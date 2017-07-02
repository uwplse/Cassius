#lang racket
(require "../common.rkt" "../smt.rkt")
(provide tree-types link-definitions extra-pointers)

(define extra-pointers (make-parameter '()))

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
                (&pbox Int) (&vbox Int) (&nbox Int) (&fbox Int) (&lbox Int) ; box tree pointers
                (width-set Bool) ; used for dependency creation only
                (font-size Real)
                (&nflow Int) (&vflow Int) ; flow tree pointers
                (&ppflow Int) ; parent positioned pointers
                (&pbflow Int)
                (ez.in EZone) (ez.out EZone) (ez.sufficient Bool)
                (has-contents Bool) (textalign Text-Align) ; to handle inheritance; TODO: handle better
                (&elt Int) (first-box? Bool) (last-box? Bool)
                ,@(for/list ([i (in-naturals)] [(name p) (in-dict (extra-pointers))])
                    `(,(sformat "&~a" i) Int))
                (fg-color Color) (bg-color Color) (ancestor-bg Color)))
      (BoxType box/root box/text box/inline box/block box/line)
      (Element no-elt
           (elt (specified-style Style) (computed-style Style) ; see compute-style.rkt
                (is-replaced Bool) (intrinsic-width Real) (intrinsic-height Real)
                (&pelt Int) (&velt Int) (&nelt Int) (&felt Int) (&lelt Int)))))

  ,@(for/list ([field '(&pelt &velt &nelt &felt &lelt)])
      `(assert (= (,field no-elt) -1)))
  ,@(for/list ([field '(&pbox &vbox &nbox &fbox &lbox &nflow &vflow &ppflow &pbflow)])
      `(assert (= (,field no-box) -1)))

  (assert (= (&elt no-box) -1))

  ;; TODO: for all three below functions, compute background color for transparent
  ;; backgrounds. Currently stubbed out.
  (define-fun fg-lum ((b Box)) Real
    (lum (color.rgb (fg-color b))))

  (define-fun bg-lum ((b Box)) Real
    (lum (color.rgb (ancestor-bg b))))

  ;; TODO: is this a good place to put this?
  (define-fun color-distance ((c1 Color) (c2 Color)) Real
    (ite (or (is-color/transparent c1) (is-color/transparent c2))
         32.0
         (color.diff (color.rgb c1) (color.rgb c2)))))

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
  (define-fun pbflow ((box Box)) Box (get/box (&pbflow box)))

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
    (= (&pelt e) -1))

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
  (define-fun link-element ((elt Element) (&p Int) (&v Int) (&n Int) (&f Int) (&l Int)) Bool
    (and (is-elt elt)
         (= (&pelt elt) &p)
         (= (&velt elt) &v)
         (= (&nelt elt) &n)
         (= (&felt elt) &f)
         (= (&lelt elt) &l)))

  (define-fun link-box ((box Box) (&p Int) (&v Int) (&n Int) (&f Int) (&l Int)) Bool
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
  (define-fun match-element-box ((&e Int) (&b Int) (first? Bool) (last? Bool)) Bool
    (and
     (= (&elt (get/box &b)) &e)
     (= (first-box? (get/box &b)) first?)
     (= (last-box? (get/box &b)) last?)
     ,@(for/list ([i (in-naturals)] [(name p) (in-dict (extra-pointers))])
         `(= (,(sformat "&~a" i) (get/box &b)) ,(p '&b (sformat "&~a" i))))
     (= (textalign (get/box &b))
        (style.text-align (computed-style (get/elt &e))))
     (= (fg-color (get/box &b))
        (style.color (computed-style (get/elt &e))))
     (= (bg-color (get/box &b))
        (style.background-color (computed-style (get/elt &e))))
     (= (ancestor-bg (get/box &b))
        (ite (is-color/transparent (bg-color (get/box &b)))
             (ancestor-bg (pbox (get/box &b)))
             (bg-color (get/box &b))))))

  (define-fun match-anon-box ((&b Int)) Bool
    (and
     (= (&elt (get/box &b)) -1)
     (= (first-box? (get/box &b)) true)
     (= (last-box? (get/box &b)) true)
     ,@(for/list ([i (in-naturals)] [(name p) (in-dict (extra-pointers))])
         `(= (,(sformat "&~a" i) (get/box &b)) ,(p '&b (sformat "&~a" i))))
     (= (textalign (get/box &b))
        (ite (is-no-box (pflow (get/box &b)))
             text-align/left
             (textalign (pflow (get/box &b)))))
     (= (fg-color (get/box &b))
        (ite (is-no-box (pflow (get/box &b)))
             color/black
             (fg-color (pflow (get/box &b)))))
     (= (bg-color (get/box &b)) color/transparent)
     (= (ancestor-bg (get/box &b)) (ancestor-bg (pbox (get/box &b))))))

  ;; `link-flow-simple`, `link-flow-root`, and `link-flow-block` link
  ;; boxes together in their flow trees. The "block" version is much
  ;; more complex than the non-block version, because so many things
  ;; can only be true of block boxes.
  (define-fun link-flow-root ((b Box) (&b Int)) Bool
    (and
     (= (&ppflow b) &b)
     (= (&pbflow b) -1)
     (= (&vflow b) -1)
     (= (&nflow b) -1)
     (= (ancestor-bg b) (color/rgb (color 255 255 255 1 1 1))) ;; TODO: Browser dependent? User-configurable?
     (= (ez.in b) ez.init)))

  (define-fun link-flow-simple ((b Box) (&b Int)) Bool
    (and
     (= (&ppflow b) (ite (box-positioned (pbox b)) (&pbox b) (&ppflow (pflow b))))
     (= (&pbflow b) (ite (or (is-box/block (type (pbox b))) (is-flow-root (pbox b))) (&pbox b) (&pbflow (pbox b))))
     (= (&vflow b) (&vbox b))
     (= (&nflow b) (&nbox b))
     (= (ez.in b) (ite (is-no-box (vbox b))
                       (ite (is-flow-root (pbox b))
                            ez.init
                            (ez.in (pbox b)))
                       (ez.out (vbox b))))))

  (define-fun link-flow-block ((b Box) (&b Int)) Bool
    (and
     (= (&ppflow b) (ite (box-positioned (pbox b)) (&pbox b) (&ppflow (pbox b))))
     (= (&pbflow b) (ite (or (is-box/block (type (pbox b))) (is-flow-root (pbox b))) (&pbox b) (&pbflow (pbox b))))
     (= (&vflow b)
        ,(smt-cond
          [(is-no-box (vbox b)) -1]
          [(box-in-flow (vbox b)) (&vbox b)]
          [else (&vflow (vbox b))]))
     (= (&nflow b)
        ,(smt-cond
          [(is-no-box (nbox b)) -1]
          [(box-in-flow (nbox b)) (&nbox b)]
          [else (&nflow (nbox b))]))
     (= (ez.in b) (ite (is-no-box (vbox b))
                       (ite (is-flow-root (pbox b))
                            ez.init
                            (ez.in (pbox b)))
                       (ez.out (vbox b)))))))

