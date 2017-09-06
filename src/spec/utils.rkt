#lang racket
(require "../common.rkt" "../smt.rkt")
(provide common-definitions utility-definitions)

(define-constraints common-definitions
  (declare-datatypes () ((RealOpt (realopt (realopt.value Real) (realopt.is-some? Bool)))))
  (define-fun ropt-max-if ((x RealOpt) (y? Bool) (y RealOpt)) RealOpt
         (ite (realopt.is-some? x)
              (ite (and y? (realopt.is-some? y))
                   (ite (> (realopt.value x) (realopt.value y))
                        x
                        y)
                   x)
              y))
  (define-fun ropt-min-if ((x RealOpt) (y? Bool) (y RealOpt)) RealOpt
         (ite (realopt.is-some? x)
              (ite (and y? (realopt.is-some? y))
                   (ite (< (realopt.value x) (realopt.value y))
                        x
                        y)
                   x)
              y))
  (define-fun max ((x Real) (y Real)) Real (ite (< x y) y x))
  (define-fun min ((x Real) (y Real)) Real (ite (< x y) x y))
  (define-fun max-if ((x Real) (y? Bool) (y Real)) Real (ite (and y? (< x y)) y x))
  (define-fun min-if ((x Real) (y? Bool) (y Real)) Real (ite (and y? (< y x)) y x))
  (define-fun between ((x Real) (y Real) (z Real)) Bool
    (or (<= x y z) (>= x y z))))

(define-constraints utility-definitions
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

  (define-fun box-x ((box Box)) Real (+ (x box) (xo box)))
  (define-fun box-y ((box Box)) Real (+ (y box) (yo box)))
  (define-fun box-width ((box Box)) Real  (+ (bl box) (pl box) (w box) (pr box) (br box)))
  (define-fun box-height ((box Box)) Real (+ (bt box) (pt box) (h box) (pb box) (bb box)))

  (define-fun horizontally-adjacent ((box1 Box) (box2 Box)) Bool
    (and (or (between (bottom-outer box1) (top-outer box2) (top-outer box1))
             (between (bottom-outer box2) (top-outer box1) (top-outer box2)))
         (=> (and (= (top-outer box1) (top-outer box2)) (= (bottom-outer box1) (bottom-outer box2)))
             (not (= (top-outer box1) (bottom-outer box2))))))

  (define-fun vertically-adjacent ((box1 Box) (box2 Box)) Bool
    (and (or (between (right-outer box1) (left-outer box2) (left-outer box1))
             (between (right-outer box2) (left-outer box1) (left-outer box2)))
         (=> (and (= (left-outer box1) (left-outer box2)) (= (right-outer box1) (right-outer box2)))
             (not (= (left-outer box1) (right-outer box2))))))

  (define-fun overlaps ((b1 Box) (b2 Box)) Bool
    (and (horizontally-adjacent b1 b2) (vertically-adjacent b1 b2)))

  (define-fun within ((b1 Box) (b2 Box)) Bool
    (and (<= (box-left b2) (box-left b1))
         (<= (box-top b2) (box-top b1))
         (<= (box-right b1) (box-right b2))
         (<= (box-bottom b1) (box-bottom b2)))))
