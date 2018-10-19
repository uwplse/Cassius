#lang racket
(require "../common.rkt" "../smt.rkt" "../encode.rkt" "../registry.rkt")
(provide font-datatype make-get-font font-computation)

(define-by-match font-info?
  (list size name weight style ascent descent top-offset bottom-offset line-height))
; Ascent varies from 8% to 150%
; Descent varies from -50% to 30%
; Top-offset varies from 0% to 55%, with outlier -19%
; Bottom-offset varies from 0% to 55%, with outlier -80% and -5%
; Line-height varies from 100% to 180%, with 0 outlier
; Ascent + descent varies from 10% to 110%
; Selection height varies from 100% to 180%, with 0 outlier

(define (fuzzy= var val [fuzz *fuzz*])
  (if (fuzz)
      `(< (- ,val ,(fuzz)) ,var (+ ,val ,(fuzz)))
      `(= ,val ,var)))

(define/contract (make-get-font fonts)
  (-> (listof font-info?) any/c)
  (reap [sow]
        (sow `(declare-fun get-font (Font-Family Font-Weight Font-Style Real) Font-Metric))
        (for* ([font (in-list fonts)])
          (match-define (list size family weight style a d t b l) font)
          (match-define (list a* d* t* b* l*) (map z3->number (list a d t b l)))
          (define var (sformat "font~a-~a" (name 'font (list family weight style)) (z3->number size)))
          (sow `(declare-const ,var Font-Metric))
          (sow `(assert (<= 0 (font.ascent ,var))))
          (sow `(assert (<= 0 (font.descent ,var))))
          (sow `(assert ,(fuzzy= `(+ (font.ascent ,var) (font.descent ,var)) (+ a* d*) *font-fuzz*)))
          (sow `(assert ,(fuzzy= `(font.topoffset ,var) t*)))
          (sow `(assert ,(fuzzy= `(font.bottomoffset ,var) b*)))
          ;; These are commented out because Firefox does not get the metrics correctly
          #;(sow `(assert ,(fuzzy= `(font.ascent ,var) a* *font-fuzz*)))
          #;(sow `(assert ,(fuzzy= `(font.descent ,var) d* *font-fuzz*)))
          (sow `(assert ,(fuzzy= `(font.selection-height ,var) (+ a* d* t* b*))))
          (sow `(assert ,(fuzzy= `(font.line-height ,var) l)))
          (sow `(assert (= (get-font ,(dump-value 'font-family family)
                                     ,(dump-value 'font-weight weight)
                                     ,(dump-value 'font-style style)
                                     ,size) ,var))))))

(define-constraints (font-datatype)
  (declare-datatypes ()
   ((Font-Metric
     (font-metric
      (font.ascent Real) (font.descent Real)
      (font.topoffset Real) (font.bottomoffset Real)
      (font.line-height Real) (font.selection-height Real)))))

  (define-fun font.valid? ((fm Font-Metric) (x Real)) Bool
    ;; Is `fm` a valid font at font-size `x`? Most real fonts satisfy the below,
    ;; but it cannot be asserted of all results to `get-font` because Z3 cannot
    ;; prove that such a font always exists.
    (and (<= (* .1 x) (+ (font.ascent fm) (font.descent fm)) (* 1.1 x))
         (<= 0 (font.topoffset fm) (* .6 x))
         (<= 0 (font.bottomoffset fm) (* .6 x))
         (<= x (font.line-height fm) (* 1.8 x))
         (<= x (font.selection-height fm) (* 1.8 x)))))

(define-constraints (font-computation)
  (declare-fun font-info (Box) Font-Metric)

  (define-fun font ((e Element)) Font-Metric
    (let ([style (computed-style e)])
      (get-font (style.font-family style)
                (style.font-weight style)
                (style.font-style style)
                (font-size.px (style.font-size style)))))

  (assert (forall ((e Element)) (font.valid? (font e) (font-size.px (style.font-size (computed-style e))))))

  (assert (forall ((b Box))
                  (= (font-info b)
                     (ite (is-elt (box-elt b))
                          (font (box-elt b))
                          (ite (is-box (pbox b))
                               (font-info (pbox b))
                               (font-info (fbox b)))))))

  (define-fun height-text ((b Box)) Real
    (+ (font.ascent (font-info b)) (font.descent (font-info b))))

  (define-fun horizontally-overlapping ((box1 Box) (box2 Box)) Bool
    (let ([m1 (font-info box1)]
          [m2 (font-info box2)])
      (or (> (- (bottom-outer box1) (+ 1 (font.bottomoffset m1)))
             (+ (top-outer box2) (font.topoffset m2))
             (+ (top-outer box1) 1 (font.topoffset m1)))
          (> (- (bottom-outer box2) (+ 1 (font.bottomoffset m2)))
             (+ (top-outer box1) (font.topoffset m1))
             (+ (top-outer box2) 1 (font.topoffset m2)))
          (< (- 1) (- (+ (top-outer box1) (font.topoffset m1)) (+ (top-outer box2) (font.topoffset m2))) 1))))

  (define-fun vertically-overlapping ((box1 Box) (box2 Box)) Bool
    (or (> (right-outer box1) (left-outer box2) (left-outer box1))
        (> (right-outer box2) (left-outer box1) (left-outer box2))
        (= (left-outer box1) (left-outer box2))))

  (define-fun overlaps ((b1 Box) (b2 Box)) Bool
    (and (horizontally-overlapping b1 b2) (vertically-overlapping b1 b2))))
