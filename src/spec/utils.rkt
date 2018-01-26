#lang racket
(require "../common.rkt" "../smt.rkt")
(provide extra-pointers common-definitions tree-types utility-definitions)

(define extra-pointers (make-parameter '()))

(define-constraints common-definitions
  (define-fun max ((x Real) (y Real)) Real (ite (< x y) y x))
  (define-fun min ((x Real) (y Real)) Real (ite (< x y) x y))
  (define-fun max-if ((x Real) (y? Bool) (y Real)) Real (ite (and y? (< x y)) y x))
  (define-fun min-if ((x Real) (y? Bool) (y Real)) Real (ite (and y? (< y x)) y x))
  (define-fun between ((x Real) (y Real) (z Real)) Bool
    (or (<= x y z) (>= x y z))))

(define-constraints tree-types
  (declare-datatypes ()
     ((Box no-box
           (box (type BoxType)
                (x Real) (y Real) (w Real) (h Real) ; X, Y and width/height
                (xo Real) (yo Real) ; X and Y offset
                (mt Real) (mr Real) (mb Real) (ml Real) ; margins
                ; top/bottom positive/negative margins for collapsing
                (mtp Real) (mtn Real) (mbp Real) (mbn Real)
                (mtp-up Real) (mtn-up Real) (mb-clear Bool)
                (pt Real) (pr Real) (pb Real) (pl Real) ; padding
                (bt Real) (br Real) (bb Real) (bl Real) ; border
                (stfwidth Real) (stfmax Real) (float-stfmax Real) (w-from-stfwidth Bool)
                (&pbox Int) (&vbox Int) (&nbox Int) (&fbox Int) (&lbox Int) ; box tree pointers
                (width-set Bool) ; used for dependency creation only
                (text-indent Real)
                (baseline Real) (above-baseline Real) (below-baseline Real)
                (&nflow Int) (&vflow Int) ; flow tree pointers
                (&ppflow Int) ; parent positioned pointers
                (&pbflow Int)
                (&root Int) ; Root box
                (ez.in EZone) (ez.out EZone)
                (ez.sufficient Bool) (ez.lookback Bool)
                (has-contents Bool) (textalign Text-Align) ; to handle inheritance; TODO: handle better
                (&elt Int) (first-box? Bool) (last-box? Bool)
                ,@(for/list ([i (in-naturals)] [(name p) (in-dict (extra-pointers))])
                    `(,(sformat "&~a" i) Int))
                (fg-color Color) (bg-color Color)))
      (BoxType box/root box/text box/inline box/block box/line)
      (Element no-elt
           (elt (specified-style Style) (computed-style Style) ; see compute-style.rkt
                (is-replaced Bool) (is-image Bool) (intrinsic-width Real) (intrinsic-height Real)
                (&pelt Int) (&velt Int) (&nelt Int) (&felt Int) (&lelt Int)))))

  ,@(for/list ([field '(&pelt &velt &nelt &felt &lelt)])
      `(assert (= (,field no-elt) -1)))
  ,@(for/list ([field '(&pbox &vbox &nbox &fbox &lbox &nflow &vflow &ppflow &pbflow)])
      `(assert (= (,field no-box) -1)))

  (assert (= (&elt no-box) -1)))

(define-constraints utility-definitions
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

  ;; From boxes to elements
  (define-fun box-elt ((box Box)) Element (get/elt (&elt box)))

  ;; Box model helpers
  (define-fun left-outer ((box Box)) Real (- (x box) (ml box)))
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

  ;; Box position and size helpers
  (define-fun box-x ((box Box)) Real (+ (x box) (xo box)))
  (define-fun box-y ((box Box)) Real (+ (y box) (yo box)))
  (define-fun box-width ((box Box)) Real  (+ (bl box) (pl box) (w box) (pr box) (br box)))
  (define-fun box-height ((box Box)) Real (+ (bt box) (pt box) (h box) (pb box) (bb box)))
  
  (define-fun width-padding ((box Box)) Real (+ (pl box) (w box) (pr box)))
  (define-fun height-content ((box Box)) Real (h box))
  (define-fun height-padding ((box Box)) Real (+ (pt box) (h box) (pb box)))
  (define-fun height-border ((box Box)) Real (+ (bt box) (pt box) (h box) (pb box) (bb box)))
  (define-fun height-outer ((box Box)) Real (+ (mtp box) (mtn box) (bt box) (pt box) (h box) (pb box) (bb box) (mbp box) (mbn box)))

  ;; Box predicate helpers
  (define-fun horizontally-adjacent ((box1 Box) (box2 Box)) Bool
    (and
     (or (between (bottom-outer box1) (top-outer box2) (top-outer box1))
         (between (bottom-outer box2) (top-outer box1) (top-outer box2)))
     (=> (and (= (top-outer box1) (top-outer box2)) (= (bottom-outer box1) (bottom-outer box2)))
         (not (= (top-outer box1) (bottom-outer box2))))))


  (define-fun vertically-adjacent ((box1 Box) (box2 Box)) Bool
    (and
     (or (between (right-outer box1) (left-outer box2) (left-outer box1))
         (between (right-outer box2) (left-outer box1) (left-outer box2)))
     (=> (and (= (left-outer box1) (left-outer box2)) (= (right-outer box1) (right-outer box2)))
         (not (= (left-outer box1) (right-outer box2))))))

  (define-fun within ((b1 Box) (b2 Box)) Bool
    (and (<= (box-left b2) (box-left b1))
         (<= (box-top b2) (box-top b1))
         (<= (box-right b1) (box-right b2))
         (<= (box-bottom b1) (box-bottom b2)))))
