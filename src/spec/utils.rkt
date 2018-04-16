#lang racket
(require "../common.rkt" "../smt.rkt")
(provide common-definitions tree-types utility-definitions)

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
           (box (bid Int) (type BoxType)
                (x Real) (y Real) (w Real) (h Real) ; X, Y and width/height
                (xo Real) (yo Real) ; X and Y offset
                (mt Real) (mr Real) (mb Real) (ml Real) ; margins
                ; top/bottom positive/negative margins for collapsing
                (mtp Real) (mtn Real) (mbp Real) (mbn Real)
                (mtp-up Real) (mtn-up Real) (mb-clear Bool)
                (pt Real) (pr Real) (pb Real) (pl Real) ; padding
                (bt Real) (br Real) (bb Real) (bl Real) ; border
                (stfwidth Real) (stfmax Real) (float-stfmax Real) (w-from-stfwidth Bool)
                (width-set Bool) ; used for dependency creation only
                (text-indent Real)
                (baseline Real) (above-baseline Real) (below-baseline Real)
                (ez.sufficient Bool) (ez.lookback Bool)
                (has-contents Bool) (first-box? Bool) (last-box? Bool)
                (fg-color Color) (bg-color Color)))
      (BoxType box/root box/text box/inline box/block box/line)
      (Element no-elt
           (elt (eid Int) (specified-style Style) (computed-style Style) ; see compute-style.rkt
                (is-replaced Bool) (is-image Bool) (intrinsic-width Real) (intrinsic-height Real))))))

(define-constraints utility-definitions
  ;; The elements in each direction in the element tree
  (declare-fun velt (Element) Element)
  (declare-fun nelt (Element) Element)
  (declare-fun pelt (Element) Element)
  (declare-fun felt (Element) Element)
  (declare-fun lelt (Element) Element)

  ;; The boxes in each direction in the box tree
  (declare-fun pbox (Box) Box)
  (declare-fun fbox (Box) Box)
  (declare-fun lbox (Box) Box)
  (declare-fun vbox (Box) Box)
  (declare-fun nbox (Box) Box)

  ,@(for/list ([field '(pbox vbox nbox fbox lbox)])
      `(assert (= (,field no-box) no-box)))

  ;; From boxes to elements
  (declare-fun box-elt (Box) Element)
  (assert (is-no-elt (box-elt no-box)))

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
  (define-fun width-border ((box Box)) Real (+ (bl box) (pl box) (w box) (pr box) (br box)))
  (define-fun width-outer ((box Box)) Real (+ (ml box) (bl box) (pl box) (w box) (pr box) (br box) (mr box)))
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

  (define-fun overlaps-outer ((box1 Box) (box2 Box)) Bool
    (and (horizontally-adjacent box1 box2) (vertically-adjacent box1 box2)))

  (define-fun within-outer ((b1 Box) (b2 Box)) Bool
    (and (>= (left-outer b1) (left-outer b2))
         (>= (top-outer b1) (top-outer b2))
         (<= (right-outer b1) (right-outer b2))
         (<= (bottom-outer b1) (bottom-outer b2)))))

(module+ test
  (require "test.rkt")

  (add-header! `((declare-sort Color) (declare-sort Style)))
  (add-header! (common-definitions))
  (add-header! (tree-types))
  (add-header! (utility-definitions))
  (add-header! `((declare-datatypes () ((Rect (rect (rx Real) (ry Real) (rw Real) (rh Real)))))))

  (check-sat #hash((b1 . Box) (b2 . Box) (b3 . Box) (r1 . Rect) (r2 . Rect) (r3 . Rect))
             `(=>
               (is-box b1) (is-box b2) (is-box b3)
               (= r1 (rect (top-outer b1) (right-outer b1) (bottom-outer b1) (left-outer b1)))
               (= r2 (rect (top-outer b2) (right-outer b2) (bottom-outer b2) (left-outer b2)))
               (= r3 (rect (top-outer b3) (right-outer b3) (bottom-outer b3) (left-outer b3)))
               (>= (width-outer b1) 0) (>= (width-outer b2) 0) (>= (width-outer b3) 0)
               (>= (height-outer b1) 0) (>= (height-outer b2) 0) (>= (height-outer b3) 0)
               (within-outer b1 b2) (overlaps-outer b1 b3)
               (overlaps-outer b2 b3))))
