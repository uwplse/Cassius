#lang racket
(require "../common.rkt" "../smt.rkt" "css-properties.rkt")
(provide layout-definitions view-width-name view-height-name boxref-definitions scroll-width-name)

(define view-width-name (make-parameter false))
(define view-height-name (make-parameter false))
(define scroll-width-name (make-parameter false))

(define (get-px-or-% prop wrt b)
  (define r `(computed-style (box-elt ,b)))
  (define type (slower (css-type prop)))
  (define out
    `(ite (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) ,r))
          (,(sformat "~a.px" type) (,(sformat "style.~a" prop) ,r))
          (%of (,(sformat "~a.%" type) (,(sformat "style.~a" prop) ,r)) ,wrt)))
  (match prop
   [(or 'min-width 'width 'max-width)
    `(-
      ,out
      (ite (is-box-sizing/border-box (style.box-sizing ,r))
           (+ (bl ,b) (pl ,b) (pr ,b) (br ,b))
           0.0)
      (scroll-y ,b))]
   [(or 'min-height 'height 'max-height)
    `(-
      ,out
      (ite (is-box-sizing/border-box (style.box-sizing ,r))
           (+ (bt ,b) (pt ,b) (pb ,b) (bb ,b))
           0.0)
      (scroll-x ,b))]
   [else
    out]))

(define-constraints boxref-definitions
  (declare-fun rootbox (Box) Box)
  (assert
   (forall ((b Box))
           (= (rootbox b)
              (ite (is-no-box (pbox b))
                   b
                   (rootbox (pbox b))))))

  (assert (forall ((b Box)) (is-box (rootbox b))))

  (declare-fun nflow (Box) Box)
  (assert
   (forall ((b Box))
           (= (nflow b)
              (ite (is-no-box (nbox b))
                   no-box
                   (ite (box-in-flow (nbox b))
                        (nbox b)
                        (nflow (nbox b)))))))

  (declare-fun vflow (Box) Box)
  (assert
   (forall ((b Box))
           (= (vflow b)
              (ite (is-no-box (vbox b))
                   no-box
                   (ite (box-in-flow (vbox b))
                        (vbox b)
                        (vflow (vbox b)))))))

  (declare-fun fflow (Box) Box)
  (assert
   (forall ((b Box))
           (= (fflow b) (ite (=> (is-box (fbox b)) (box-in-flow (fbox b))) (fbox b) (nflow (fbox b))))))

  (declare-fun lflow (Box) Box)
  (assert
   (forall ((b Box))
           (= (lflow b) (ite (=> (is-box (lbox b)) (box-in-flow (lbox b))) (lbox b) (vflow (lbox b))))))


  (define-fun ez.outside ((ez EZone) (b Box)) Bool
    (and (ez.valid? ez) (=> (ez.mark? ez) (<= (ez.max ez) (top-border b)))))

  (define-fun ez.inside ((ez EZone) (b Box)) Bool
    (and (ez.valid? ez) (=> (ez.mark? ez) (<= (ez.max ez) (bottom-border b)))))

  (define-fun no-margins ((b Box)) Bool
    (= (mtp b) (mtn b) (mbp b) (mbn b) 0.0))

  (define-fun non-negative-margins ((b Box)) Bool
    (and (>= (mtp b) (- (mtn b))) (>= (mbp b) (- (mbn b))))))

(define-constraints layout-definitions

  ;; Three additional pointers: to the previous floating box, the
  ;; parent block box, and the parent positioned box.
  (declare-fun ppflow (Box) Box)
  (assert
   (forall ((b Box))
           (= (ppflow b)
              (ite (is-no-box (pbox b))
                   b
                   (ite (box-positioned (pbox b)) (pbox b) (ppflow (pbox b)))))))

  (declare-fun pbflow (Box) Box)
  (assert
   (forall ((b Box))
           (= (pbflow b)
              (ite (is-no-box (pbox b))
                   no-box
                   (ite (or (is-box/block (type (pbox b))) (is-flow-root (pbox b))) (pbox b) (pbflow (pbox b)))))))
  
  (define-const quirks-mode Bool false)

  (declare-fun contains-content (Box) Bool)

  (assert (forall ((b Box))
                  (let ([e (box-elt b)] [v (vflow b)] [l (lflow b)])
                    (= (contains-content b)
                       (or (> (ml b) 0) (> (bl b) 0) (> (pl b) 0) (> (pr b) 0) (> (br b) 0) (> (mr b) 0)
                           (> (w b) 0) (and (is-elt e) (is-replaced e))
                           (and (is-box v) (contains-content v)) (and (is-box l) (contains-content l)))))))

  (declare-fun box-collapsed-through (Box) Bool)

  (assert
   (forall ((b Box))
           (= (box-collapsed-through b)
              (and (= (box-height b) 0.0)
                   (or (and (is-box/line (type b))
                            (=> (is-box (lflow b)) (not (contains-content (lflow b)))))
                       (is-no-box (lflow b))
                       (box-collapsed-through (lflow b)))))))

  (define-fun min-max-width ((val Real) (b Box)) Real
    (max (ite (is-elt (box-elt b)) ,(get-px-or-% 'min-width '(w (pflow b)) 'b) 0.0)
         (ite (or (is-no-elt (box-elt b)) (is-max-width/none (style.max-width (computed-style (box-elt b)))))
              val
              (min val ,(get-px-or-% 'max-width '(w (pflow b)) 'b)))))

  (define-fun min-max-height ((val Real) (b Box)) Real
    (max (ite (is-elt (box-elt b)) ,(get-px-or-% 'min-height '(h (pflow b)) 'b) 0.0)
         (ite (or (is-no-elt (box-elt b)) (is-max-height/none (style.max-height (computed-style (box-elt b)))))
              val
              (min val ,(get-px-or-% 'max-height '(h (pflow b)) 'b)))))

  (define-fun margin-min-px ((m Margin) (b Box)) Real
    ,(smt-cond
      [(is-margin/px m) (margin.px m)]
      [(is-margin/% m) (%of (margin.% m) (w (pflow b)))]
      [else 0.0]))

  (define-fun min-w ((b Box)) Real
    (ite (is-elt (box-elt b))
         (ite (is-width/auto (style.width (computed-style (box-elt b))))
              (ite (is-replaced (box-elt b))
                   (- (intrinsic-width (box-elt b)) (bl b) (br b) (pl b) (pr b))
                   0.0)
              ,(get-px-or-% 'width '(w (pflow b)) 'b))
         0.0))

  (define-fun min-ml ((b Box)) Real
    (ite (is-elt (box-elt b))
         (margin-min-px (style.margin-left (computed-style (box-elt b))) b)
         0.0))

  (define-fun min-mr ((b Box)) Real
    (ite (is-elt (box-elt b))
         (margin-min-px (style.margin-right (computed-style (box-elt b))) b)
         0.0))

  (define-fun top-margin-collapses-with-children ((b Box)) Bool
    (and (not (is-flow-root b)) (= (pt b) 0.0) (= (bt b) 0.0)))

  (define-fun bottom-margin-collapses-with-children ((b Box)) Bool
    (and (not (is-flow-root b)) (= (pb b) 0.0) (= (bb b) 0.0)
         (=> (is-elt (box-elt b))
             (and (is-height/auto (style.height (computed-style (box-elt b))))
                  (not (is-replaced (box-elt b)))))))

  (define-fun zero-box-model-except-collapse ((b Box)) Bool
    (and
     (= (mt b) (mr b) (mb b) (ml b) 0.0)
     (= (bt b) (br b) (bb b) (bl b) 0.0)
     (= (pt b) (pr b) (pb b) (pl b) 0.0)))

  (define-fun zero-box-model ((b Box)) Bool
    (and
     (= (mtp b) (mtn b) (mbp b) (mbn b) (mtp-up b) (mtn-up b) 0.0)
     (= (mb-clear b) false)
     (= (mt b) (mr b) (mb b) (ml b) 0.0)
     (= (bt b) (br b) (bb b) (bl b) 0.0)
     (= (pt b) (pr b) (pb b) (pl b) 0.0)))

  (declare-fun ancestor-line (Box) Box)
  (assert
   (forall ((b Box))
     (= (ancestor-line b)
        (ite (is-box/line (type b))
             b
             (ite (is-flow-root (pbox b))
                  no-box
                  (ancestor-line (pbox b)))))))

  (declare-fun firstish-box (Box) Bool)

  (define-fun vertical-position-for-flow-boxes ((b Box)) Real
    (let ([p (pflow b)] [v (vflow b)])
      ;; These parts don't check (has-clearance) because they're
      ;; computed "as if" there were no clearance
       (ite (firstish-box b)
            (+ (top-content p)
               (ite (and (top-margin-collapses-with-children p)
                         (not (and (is-elt (box-elt b)) (is-root-elt (box-elt b))))
                         (not (is-box/root (type b))))
                    0.0
                    (+ (mtp b) (mtn b))))
            (+ (ite (box-collapsed-through v)
                    (top-outer v)
                    (bottom-border v))
               (+ (max (mbp v) (mtp b)) (min (mbn v) (mtn b)))))))

  (declare-fun inline-float-next-line (Box) Bool)

  (define-fun vertical-position-for-flow-roots ((b Box)) Real
    (let ([p (pflow b)] [v (vflow b)])
      (ite (or (is-box/block (type p)) (is-flow-root p))
           (ite (is-box v)
                (+ (ite (box-collapsed-through v)
                        (top-outer v)
                        (bottom-border v))
                   (mbp v) (mbn v))
                (top-content p))
           (ite (inline-float-next-line b)
                (bottom-border (ancestor-line b))
                (ite (is-box (vbox (ancestor-line b)))
                     (bottom-border (vbox (ancestor-line b)))
                     (top-content (pbox (ancestor-line b))))))))

  (define-fun has-clearance ((b Box)) Bool
    (and (is-elt (box-elt b))
         (or
          (and
           (is-clear/left (style.clear (computed-style (box-elt b))))
           (< (vertical-position-for-flow-boxes b) (ez.left-max (ez.in b))))
          (and
           (is-clear/right (style.clear (computed-style (box-elt b))))
           (< (vertical-position-for-flow-boxes b) (ez.right-max (ez.in b))))
          (and
           (is-clear/both (style.clear (computed-style (box-elt b))))
           (< (vertical-position-for-flow-boxes b)
              (max (ez.left-max (ez.in b)) (ez.right-max (ez.in b))))))))

  (assert (forall ((b Box))
                  (= (firstish-box b)
                     (let ([p (pflow b)] [v (vflow b)])
                       (or (and (not (is-box v)) (not (has-clearance v)))
                           (and (box-collapsed-through v) (not (has-clearance v)) (firstish-box v)))))))

  (define-fun change-s831c ((b Box)) Bool
    (and
     (top-margin-collapses-with-children b)
     (is-box (lflow b))
     (firstish-box (lflow b))
     (box-collapsed-through (lflow b))
     (is-elt (box-elt b))
     (let ([mh (style.min-height (computed-style (box-elt b)))])
       (or
        (and (is-min-height/px mh) (> (min-height.px mh) 0))
        (and (is-min-height/% mh) (> (min-height.% mh) 0))))
     (is-height/auto (style.height (computed-style (box-elt b))))))

  (define-fun auto-height-for-flow-roots ((b Box)) Real
    ;; CSS 2.1 § 10.6.7
    ,(smt-cond
      [(is-replaced (box-elt b))
       (min-max-height (- (intrinsic-height (box-elt b)) (bt b) (bb b) (pt b) (pb b)) b)]
      [(is-no-box (fbox b)) (min-max-height 0.0 b)]
      [(is-no-box (fflow b))
       (min-max-height (max (- (ez.max (ez.out (lbox b))) (top-content b)) 0.0) b)]
      [else
       ;; If it has block-level children, the height is the distance between the
       ;; top margin-edge of the topmost block-level child box and the
       ;; bottom margin-edge of the bottommost block-level child box.
       (min-max-height
        (- (max (ez.max (ez.out (lbox b)))
                (ite (box-collapsed-through (lflow b))
                     (+ (top-outer (lflow b)) (mbp (lflow b)) (mbn (lflow b)))
                     (bottom-outer (lflow b))))
           (top-content b))
        b)]))

  (define-fun auto-height-for-flow-blocks ((b Box)) Real
    (let ([lb (lflow b)] [e (box-elt b)])
      ,(smt-cond
        ;; CSS 2.1 § 10.6.6, first bullet
        [(is-flow-root b)
         (auto-height-for-flow-roots b)]
        ;; CSS 2.1 § 10.6.3, item 4
        [(and (is-elt e) (is-replaced e))
         (min-max-height (- (intrinsic-height e) (bt b) (bb b) (pt b) (pb b)) b)]
        [(is-no-box lb)
         (min-max-height 0.0 b)]
        ;; CSS 2.1 § 10.6.3, item 1
        [(is-box/line (type lb))
         (min-max-height (- (bottom-border lb) (top-content b)) b)]
        [else ; (is-box/block (type lb)), because blocks only have block or line children
         (min-max-height 
          (ite (and (box-collapsed-through lb) (firstish-box lb) (top-margin-collapses-with-children b) (not (mb-clear lb)))
               0.0 ;; This special case should be refactored
               (- ;; CSS 2.1 § 10.6.3, item 2
                (+ (ite (box-collapsed-through lb)
                        (top-outer lb)
                        (bottom-border lb))
                   (ite (and (bottom-margin-collapses-with-children b) (not (mb-clear lb)))
                        0.0
                        (+ (mbp lb) (mbn lb))))
                (top-content b)))
          b)])))

  (define-fun margins-collapse ((b Box)) Bool
    (let ([f (fflow b)] [l (lflow b)] [v (vflow b)])
      (and
       (= (mtp b)
          (max-if
           (max-if
            (ite (> (mt b) 0.0) (mt b) 0.0)
            (and (top-margin-collapses-with-children b) (is-box f) (not (has-clearance f)))
            (mtp-up f))
           (and (box-collapsed-through b) (not (has-clearance b)) (is-box v))
           (mbp v)))
       (= (mtp-up b)
          (max-if (ite (box-collapsed-through b) (mbp b) (mtp b))
                  (and (is-box (nflow b)) (box-collapsed-through b) (not (has-clearance (nflow b))))
                  (mtp-up (nflow b))))
       (= (mtn b)
          (min-if
           (min-if
            (ite (< (mt b) 0.0) (mt b) 0.0)
            (and (top-margin-collapses-with-children b) (is-box f) (not (has-clearance f)))
            (mtn-up f))
           (and (box-collapsed-through b) (not (has-clearance b)) (is-box v))
           (mbn v)))
       (= (mtn-up b)
          (min-if (ite (box-collapsed-through b) (mbn b) (mtn b))
                  (and (is-box (nflow b)) (box-collapsed-through b) (not (has-clearance (nflow b))))
                  (mtn-up (nflow b))))
       (= (mb-clear b)
          (or (has-clearance b) (and (is-box v) (box-collapsed-through b) (mb-clear v))))
       (= (mbp b)
          (max-if
           (max-if
            (ite (> (mb b) 0.0) (mb b) 0.0)
            (and (bottom-margin-collapses-with-children b) (is-box l) (not (mb-clear l))
                 (not (change-s831c b)))
            (mbp l))
           (box-collapsed-through b)
           (mtp b)))
       (= (mbn b)
          (min-if
           (min-if
            (ite (< (mb b) 0.0) (mb b) 0.0)
            (and (bottom-margin-collapses-with-children b) (is-box l) (not (mb-clear l))
                 (not (change-s831c b)))
            (mbn l))
           (box-collapsed-through b)
           (mtn b))))))

  (define-fun margins-dont-collapse ((b Box)) Bool
    (and
     (= (mtp-up b) (mtp b) (max (mt b) 0.0))
     (= (mb-clear b) false)
     (= (mtn-up b) (mtn b) (min (mt b) 0.0))
     (= (mbp b) (max (mb b) 0.0))
     (= (mbn b) (min (mb b) 0.0))))

  (define-fun relatively-positioned ((b Box)) Bool
    ,(smt-let ([r (computed-style (box-elt b))] [p (pflow b)])
       (=> (is-offset/px (style.left r))
           (= (xo b) (+ (offset.px (style.left r)) (xo p))))
       (=> (is-offset/% (style.left r))
           (= (xo b) (+ (%of (offset.% (style.left r)) (w p)) (xo p))))
       (=> (is-offset/px (style.top r))
           (= (yo b) (+ (offset.px (style.top r)) (yo p))))
       (=> (is-offset/% (style.top r))
           (= (yo b) (+ (%of (offset.% (style.top r)) (h p)) (yo p))))
       (=> (and (is-offset/auto (style.left r)) (is-offset/px (style.right r)))
           (= (xo b) (- (xo p) (offset.px (style.right r)))))
       (=> (and (is-offset/auto (style.left r)) (is-offset/% (style.right r)))
           (= (xo b) (- (xo p) (%of (offset.% (style.right r)) (w p)))))
       (=> (and (is-offset/auto (style.top r)) (is-offset/px (style.bottom r)))
           (= (yo b) (- (yo p) (offset.px (style.bottom r)))))
       (=> (and (is-offset/auto (style.top r)) (is-offset/% (style.bottom r)))
           (= (yo b) (- (yo p) (%of (offset.% (style.bottom r)) (h p)))))
       (=> (and (is-offset/auto (style.left r)) (is-offset/auto (style.right r)))
           (= (xo b) (xo p)))
       (=> (and (is-offset/auto (style.top r)) (is-offset/auto (style.bottom r)))
           (= (yo b) (yo p)))))

  (define-fun no-relative-offset ((b Box)) Bool
    ,(smt-let ([r (computed-style (box-elt b))] [p (pflow b)])
       (= (xo b) (xo p))
       (= (yo b) (yo p))))

  (define-fun resolve-clear ((b Box) (default Real)) Real
    (max-if
     (max-if
      default
      (and (is-elt (box-elt b))
           (or
            (is-clear/left (style.clear (computed-style (box-elt b))))
            (is-clear/both (style.clear (computed-style (box-elt b))))))
      (ez.left-max (ez.in b)))
     (and (is-elt (box-elt b))
          (or
           (is-clear/right (style.clear (computed-style (box-elt b))))
           (is-clear/both (style.clear (computed-style (box-elt b))))))
     (ez.right-max (ez.in b))))

  (define-fun flow-horizontal-layout ((b Box) (available-width Real)) Bool
    ;; CSS § 10.3.3: Block-level, non-replaced elements in normal flow
    ,(smt-let ([e (box-elt b)] [r (computed-style (box-elt b))] [p (pflow b)] )
       (= available-width (+ (ml b) (box-width b) (mr b)))
       (not (w-from-stfwidth b))
       (let ([w* (min-max-width (min-w b) b)]
             [ml* (min-ml b)]
             [mr* (min-mr b)])
         ,(smt-cond
           [(> (+ ml* (bl b) (pl b) w* (pr b) (br b) mr* (scroll-y b)) available-width)
            (= (w b) w*)
            (= (ml b) ml*)
            (width-set b)]
           [(or (is-no-elt e) (and (is-width/auto (style.width r)) (not (is-replaced e))))
            (ite (and (is-elt e) (not (is-max-width/none (style.max-width r)))
                      (> (- available-width ml* (bl b) (pl b) (pr b) (br b) mr*)
                         ,(get-px-or-% 'max-width '(w p) 'b)))
                 (and
                  (= (w b) ,(get-px-or-% 'max-width '(w p) 'b))
                  ,(smt-cond
                    [(not (is-margin/auto (style.margin-left r)))
                     (= (ml b) ml*)]
                    [(not (is-margin/auto (style.margin-right r)))
                     (= (mr b) mr*)]
                    [else
                     (= (ml b) (mr b))])
                  (width-set b))
                 (and
                  (= (ml b) ml*)
                  (= (mr b) mr*)
                  (width-set b)))]
           [else
            (= (w b) w*)
            (width-set b)
            ,(smt-cond
              [(not (is-margin/auto (style.margin-left r)))
               (= (ml b) ml*)]
              [(not (is-margin/auto (style.margin-right r)))
               (= (mr b) mr*)]
              [else
               (= (ml b) (mr b))])]))))

  (define-fun available-width ((b Box)) Real
    (- (w (pbox b)) (ml b) (bl b) (pl b) (pr b) (br b) (mr b)))

  (define-fun usable-stfwidth ((b Box)) Real
    (let ([l (lbox b)])
      (min-max-width
       (ite (is-box l)
            (min (max (stfwidth l) (available-width b)) (+ (stfmax l) (float-stfmax l)))
            (ite (is-replaced (box-elt b))
                 (- (intrinsic-width (box-elt b)) (bl b) (br b) (pl b) (pr b))
                 0.0))
       b)))

  (define-fun compute-stfwidth ((b Box)) Real
    (let ([l (lbox b)] [v (vbox b)] [r (computed-style (box-elt b))])
      (max
       ,(smt-cond
         [(is-no-elt (box-elt b))
          (+ (bl b) (max (pl b) 0.0) 
             (ite (is-box l) (stfwidth l) 0.0) 
             (pr b) (br b))]
         [(is-float/left (style.float r))
          (- (right-outer b) (left-content (pbox b)))]
         [(is-float/right (style.float r))
          (- (right-content (pbox b)) (left-outer b))]
         [else
          (+ (min-ml b) (bl b) (max (pl b) 0.0) 
             (ite (and (not (is-replaced (box-elt b))) (is-width/auto (style.width r)))
                  (ite (is-box l) (stfwidth l) 0.0)
                  (w b))
             (pr b) (br b) (min-mr b))])
       (ite (is-box v) (stfwidth v) 0.0))))

  (define-fun compute-stfmax ((b Box)) Real
    (let ([l (lbox b)] [v (vbox b)] [r (computed-style (box-elt b))])
      ,(smt-cond
        [(is-no-elt (box-elt b))
         (+ (ml b) (bl b) (pl b) (ite (is-box l) (stfmax l) 0.0) (pr b) (br b) (mr b))]
        [(is-float/left (style.float r))
         (- (right-outer b) (left-content (pbox b)))]
        [(is-float/right (style.float r))
         (- (right-content (pbox b)) (left-outer b))]
        [else
         (+ (min-ml b) (bl b) (max (pl b) 0.0) 
            (ite (and (not (is-replaced (box-elt b))) (is-width/auto (style.width r)))
                 (ite (is-box l) (stfmax l) 0.0)
                 (w b))
            (pr b) (br b) (min-mr b))])))

  (define-fun positioned-vertical-layout ((b Box)) Bool
    ;; CSS 2.1 § 10.6.4
    ,(smt-let* ([r (computed-style (box-elt b))]
                [pp (ite (is-position/fixed (style.position (computed-style (box-elt b)))) (rootbox b) (ppflow b))]
                [temp-top ,(get-px-or-% 'top '(height-padding pp) 'b)]
                [temp-bottom ,(get-px-or-% 'bottom '(height-padding pp) 'b)]
                [temp-height (min-max-height (ite (is-replaced (box-elt b)) (- (intrinsic-height (box-elt b)) (bt b) (bb b) (pt b) (pb b)) ,(get-px-or-% 'height '(height-padding pp) 'b)) b)]
                [top? (not (is-offset/auto (style.top (computed-style (box-elt b)))))]
                [bottom? (not (is-offset/auto (style.bottom (computed-style (box-elt b)))))]
                [height?
                 (or (is-replaced (box-elt b))
                     (not (is-height/auto (style.height (computed-style (box-elt b))))))])
       (=> top? (= (top-outer b) (+ (top-padding pp) temp-top)))
       (=> height? (= (h b) temp-height))
       (=> (and (not top?) (not bottom?)) (= (top-outer b) (vertical-position-for-flow-roots b)))
       (=> (and (not height?) (not (and top? bottom?)))
           (= (h b) (auto-height-for-flow-roots b)))
       (=> (and bottom? (not (and top? height?)))
           (= (bottom-outer b) (- (bottom-padding pp) temp-bottom)))

       ;; Margins work identically unless overspecified
       (=> (not (and top? height? bottom?))
           (and
            (= (mt b) (margin-min-px (style.margin-top r) b))
            (= (mb b) (margin-min-px (style.margin-bottom r) b))))

       ;; Paragraph before the list, "If none of the three are 'auto'"
       (=> (and top? bottom? height?)
           (and
            (=> (not (is-margin/auto (style.margin-top r)))
                (= (mt b) (margin-min-px (style.margin-top r) b)))
            (=> (not (is-margin/auto (style.margin-bottom r)))
                (= (mb b) (margin-min-px (style.margin-bottom r) b)))
            (=> (and (is-margin/auto (style.margin-top r))
                     (is-margin/auto (style.margin-bottom r)))
                (= (mt b) (mb b)))
            (=> (or (is-margin/auto (style.margin-top r))
                    (is-margin/auto (style.margin-bottom r)))
                (= (bottom-outer b) (- (bottom-padding pp) temp-bottom)))))))


  (define-fun positioned-horizontal-layout ((b Box)) Bool
     ,(smt-let* ([r (computed-style (box-elt b))]
                 [pp (ite (is-position/fixed (style.position (computed-style (box-elt b)))) (rootbox b) (ppflow b))]
                 [p (pflow b)]
                 [temp-left ,(get-px-or-% 'left '(width-padding pp) 'b)]
                 [temp-right ,(get-px-or-% 'right '(width-padding pp) 'b)]
                 [temp-width (min-max-width (ite (is-replaced (box-elt b)) (- (intrinsic-width (box-elt b)) (bl b) (br b) (pl b) (pr b)) ,(get-px-or-% 'width '(width-padding pp) 'b)) b)]
                 [left? (not (is-offset/auto (style.left (computed-style (box-elt b)))))]
                 [right? (not (is-offset/auto (style.right (computed-style (box-elt b)))))]
                 [width? (or (is-replaced (box-elt b)) (not (is-width/auto (style.width (computed-style (box-elt b))))))])

        (width-set b)

        ;; Margins work identically unless overspecified
        (=> (not (and left? width? right?))
            (and
             (= (ml b) (margin-min-px (style.margin-left r) b))
             (= (mr b) (margin-min-px (style.margin-right r) b))))

        (=> left? (= (left-outer b) (+ (left-padding pp) temp-left)))
        (=> width? (and (= (w b) temp-width)
                        (not (w-from-stfwidth b))))
        (=> (and (not width?) (not (and left? right?)))
            (and (= (w b) (usable-stfwidth b))
                 (w-from-stfwidth b)))
        (=> (and (not left?) (not right?))
            (if (or (is-box/block (type p)) (is-box/root (type p)) (is-no-box (vflow b)))
                (= (left-outer b) (left-content p))
                (= (left-outer b) (right-outer (vflow b)))))
        (=> (and right? (not (and left? width?)))
            (= (right-outer b) (- (right-padding pp) temp-right)))
        (=> (and left? right?) (not (w-from-stfwidth b)))

        (=> (and left? width? right?)
            (and
             (=> (not (is-margin/auto (style.margin-left r)))
                 (= (ml b) (margin-min-px (style.margin-left r) b)))
             (=> (not (is-margin/auto (style.margin-right r)))
                 (= (mr b) (margin-min-px (style.margin-right r) b)))
             (=> (and (is-margin/auto (style.margin-left r)) (is-margin/auto (style.margin-right r)))
                 (= (ml b) (mr b)))
             (=> (or (is-margin/auto (style.margin-left r)) (is-margin/auto (style.margin-right r)))
                 (= (right-outer b) (- (right-padding pp) temp-right)))))))

  (declare-fun line-height (Box) Real)
  (assert
   (forall ((b Box))
           (let ([e (box-elt b)])
             (= (line-height b)
                (ite (is-elt e)
                     (let ([lh (style.line-height (computed-style e))]
                           [fs (style.font-size (computed-style e))])
                       ,(smt-cond
                         [(is-line-height/normal lh)
                          (font.line-height (font-info b))]
                         [(is-line-height/num lh)
                          (%of (* 100.0 (line-height.num lh)) (font-size.px fs))]
                         [else ;(is-line-height/px (lineheight b))
                          (line-height.px lh)]))
                     (ite (is-box (pflow b)) (line-height (pflow b)) 0.0))))))

  ;; ez.line is a specialized thing for floats inside lines
  (declare-fun ez.line (Box) EZone)
  (declare-fun ez.line-up (Box) EZone)

  (assert (forall ((b Box))
                  (= (ez.line-up b)
                     (ite (and (is-flow-root b) (is-box (ancestor-line b))
                               (< (top-outer b) (bottom-outer (ancestor-line b))))
                          (ez.line b)
                          (ite (is-box (lbox b))
                               (ez.line-up (lbox b))
                               (ez.line b))))))
  (assert
   (forall ((b Box))
     (= (ez.line b)
        (ite (and (is-flow-root b) (is-box (ancestor-line b))
                  (< (top-outer b) (bottom-outer (ancestor-line b))))
             (ez.out b)
             (ite (is-box (vbox b))
                  (ez.line-up (vbox b))
                  (ez.in b))))))

  ;; These three functions define the three types of layouts Cassius
  ;; supports for block boxes: normal in-flow layout, floating layout,
  ;; and positioned layout. By and large, these functions refer to the
  ;; preceding functions.

  (declare-fun uses-parent-w (Box) Bool)
  
  (assert
   (forall ((b Box))
           (let ([e (box-elt b)] [r (computed-style (box-elt b))])
             (= (uses-parent-w b)
                (or
                 (and (=> (is-elt e) (is-width/auto (style.width r))) (is-box (vflow b)) (uses-parent-w (vflow b)))
                 (and (=> (is-elt e) (is-width/auto (style.width r))) (is-box (lflow b)) (uses-parent-w (lflow b)))
                 (and (is-elt e) (is-margin/% (style.margin-left r)))
                 (and (is-elt e) (is-margin/% (style.margin-right r)))
                 (and (is-elt e) (is-border/% (style.border-left-width r)))
                 (and (is-elt e) (is-border/% (style.border-right-width r)))
                 (and (is-elt e) (is-padding/% (style.padding-left r)))
                 (and (is-elt e) (is-padding/% (style.padding-right r)))
                 (and (is-elt e) (is-width/% (style.width r))))))))

  (define-fun a-block-flow-box ((b Box)) Bool
    ,(smt-let ([e (box-elt b)] [r (computed-style (box-elt b))]
               [p (pflow b)] [vb (vflow b)] [fb (fflow b)] [lb (lflow b)])

       (ite (is-height/auto (style.height r))
         (= (h b) (auto-height-for-flow-blocks b))
         (= (h b) (min-max-height ,(get-px-or-% 'height '(h p) 'b) b)))

       (= (mt b)
          (ite (is-margin/auto (style.margin-top r)) 0.0 ,(get-px-or-% 'margin-top '(w p) 'b)))
       (= (mb b)
          (ite (is-margin/auto (style.margin-bottom r)) 0.0 ,(get-px-or-% 'margin-bottom '(w p) 'b)))
       (margins-collapse b)
       (= (stfmax b) (max-if (min-max-width (compute-stfmax b) b) (is-box (vbox b)) (stfmax (vbox b))))
       (= (float-stfmax b)
          (+ (min-max-width (ite (is-box (lbox b)) (float-stfmax (lbox b)) 0.0) b)
             (ite (is-box (vbox b)) (float-stfmax (vbox b)) 0.0)))

       (let ([y* (resolve-clear b (vertical-position-for-flow-boxes b))])
         (ite (or (is-flow-root b) (and (is-elt e) (is-replaced e)))
              (and
               (= (ez.lookback b) (ez.test (ez.in b) y*))
               (ite (ez.lookback b)
                    (= (y b)
                       (ez.level (ez.in b) (+ (bl b) (pl b) (min-w b) (pr b) (br b))
                                 (left-content p) (right-content p) y* float/left))
                    (>= (y b) y*)))
              (and
               (= (ez.lookback b) true)
               (= (y b) y*))))

       (ite (or (is-flow-root b) (and (is-elt e) (is-replaced e)))
           (ite (ez.lookback b)
                (flow-horizontal-layout b (- (ez.x (ez.in b) (y b) float/right (left-content p) (right-content p))
                                             (ez.x (ez.in b) (y b) float/left (left-content p) (right-content p))))
                ;; `lookback-overflow-width` is a black box that is
                ;; narrower than `(w p)`, because we don't know the
                ;; shape of the exclusion zone when `(not (ez.lookback
                ;; b))`.
                (and (>= (left-outer b) (left-content p)) (<= (right-outer b) (right-content p))))
           (flow-horizontal-layout b (w p)))
       (= (x b) (+ (ml b)
                   (ite (or (is-flow-root b) (and (is-elt e) (is-replaced e))) (ez.x (ez.in b) (y b) float/left (left-content p) (right-content p)) (left-content p))))))

  (define-fun a-block-float-box ((b Box)) Bool
    ,(smt-let ([e (box-elt b)] [r (computed-style (box-elt b))]
               [p (pflow b)] [vb (vflow b)] [fb (fflow b)] [lb (lflow b)])

       (= (mt b) (ite (is-margin/auto (style.margin-top r)) 0.0 ,(get-px-or-% 'margin-top '(w p) 'b)))
       (= (mr b) (ite (is-margin/auto (style.margin-right r)) 0.0 ,(get-px-or-% 'margin-right '(w p) 'b)))
       (= (mb b) (ite (is-margin/auto (style.margin-bottom r)) 0.0 ,(get-px-or-% 'margin-bottom '(w p) 'b)))
       (= (ml b) (ite (is-margin/auto (style.margin-left r)) 0.0 ,(get-px-or-% 'margin-left '(w p) 'b)))
       (margins-dont-collapse b)

       (= (w-from-stfwidth b) (is-width/auto (style.width r)))
       (= (stfmax b) (ite (is-box (vbox b)) (stfmax (vbox b)) 0.0))
       (= (float-stfmax b) 
          (+ (min-max-width (max (- (right-outer b) (left-outer b)) 0.0) b)
             (ite (is-box (vbox b)) (float-stfmax (vbox b)) 0.0)))
       (width-set b)
       (ite (is-width/auto (style.width r))
            (ite (is-replaced e)
                 (= (w b) (- (intrinsic-width e) (bl b) (br b) (pl b) (pr b)))
                 (or (= (w b) (usable-stfwidth b)) (and (is-box (lbox b)) (uses-parent-w (lbox b)))))
            ;; todo: what do browsers do when (w-from-stfwidth p) and (is-margin/%)?
            (= (w b)
               (min-max-width ,(get-px-or-% 'width '(w (pbflow b)) 'b) b)))

       (ite (is-height/auto (style.height r))
            (ite (is-replaced e)
                 (= (h b) (- (intrinsic-height e) (bt b) (bb b) (pt b) (pb b)))
                 (=> (width-set b)
                     (= (h b) (auto-height-for-flow-roots b))))
            (= (h b) (min-max-height ,(get-px-or-% 'height '(h p) 'b) b)))

       ;; level -> x -> advance -> can-add -> add
       (let* ([ez (ez.in b)]
              [w (- (right-outer b) (left-outer b))]
              [h (- (bottom-outer b) (top-outer b))]
              [y-normal
               (resolve-clear b (vertical-position-for-flow-roots b))]
              [y* (ez.level ez w (left-content (pbflow b)) (right-content (pbflow b)) y-normal (style.float r))]
              [x* (ez.x ez y* (style.float r) (left-content (pbflow b)) (right-content (pbflow b)))]
              [x (ite (is-float/left (style.float r)) x* (- x* w))]
              [ez* (ez.advance ez y*)])
         (and
          (= (top-outer b) y*)
          (= (left-outer b) x)
          (= (ez.lookback b) true)))))

  (define-fun a-block-positioned-box ((b Box)) Bool
    (and
      (margins-dont-collapse b)
      (positioned-vertical-layout b)
      (positioned-horizontal-layout b)
      (= (stfmax b) (ite (is-box (vbox b)) (stfmax (vbox b)) 0.0))
      (= (float-stfmax b)
         (+ (min-max-width (ite (is-box (lbox b)) (float-stfmax (lbox b)) 0.0) b)
            (ite (is-box (vbox b)) (float-stfmax (vbox b)) 0.0)))
      (= (ez.lookback b) true)))

  (define-fun a-block-box ((b Box)) Bool
    ,(smt-let ([e (box-elt b)] [r (computed-style (box-elt b))] [p (pflow b)])
       (= (type b) box/block)
       (= (bt b) ,(get-px-or-% 'border-top-width '(w p) 'b))
       (= (br b) ,(get-px-or-% 'border-right-width '(w p) 'b))
       (= (bb b) ,(get-px-or-% 'border-bottom-width '(w p) 'b))
       (= (bl b) ,(get-px-or-% 'border-left-width '(w p) 'b))
       (= (pt b) ,(get-px-or-% 'padding-top '(w p) 'b))
       (= (pr b) ,(get-px-or-% 'padding-right '(w p) 'b))
       (= (pb b) ,(get-px-or-% 'padding-bottom '(w p) 'b))
       (= (pl b) ,(get-px-or-% 'padding-left '(w p) 'b))
       (= (stfwidth b) (min-max-width (compute-stfwidth b) b))
       ;;(= (stfmax b) (max-if (compute-stfmax b) (is-box (vbox b)) (stfmax (vbox b))))
       ;;(= (float-stfmax b) (ite (is-box (vbox b)) (float-stfmax (vbox b)) 0.0))
       (ite (is-position/relative (style.position r)) (relatively-positioned b) (no-relative-offset b))

       (= (text-indent b)
          (ite (is-elt e) ,(get-px-or-% 'text-indent '(w p) 'b) 0.0))

       ,(smt-cond
         [(or (is-position/absolute (position b)) (is-position/fixed (position b)))
          (a-block-positioned-box b)]
         [(box-in-flow b)
          (a-block-flow-box b)]
         [else
          (a-block-float-box b)])))

  (declare-fun inline-block-offset (Box) Real)

  (define-fun an-inline-box ((b Box)) Bool
    ,(smt-let ([e (box-elt b)] [r (computed-style (box-elt b))]
               [p (pflow b)] [v (vflow b)] [l (lflow b)]
               [metrics (font-info b)] [leading (- (line-height b) (height-text b))])
       (= (type b) box/inline)
       (= (bt b) ,(get-px-or-% 'border-top-width '(w p) 'b))
       (= (bb b) ,(get-px-or-% 'border-bottom-width '(w p) 'b))
       (= (pt b) ,(get-px-or-% 'padding-top '(w p) 'b))
       (= (pb b) ,(get-px-or-% 'padding-bottom '(w p) 'b))
       (= (mt b) (ite (is-margin/auto (style.margin-top r)) 0.0 ,(get-px-or-% 'margin-top '(w p) 'b)))
       (= (mb b) (ite (is-margin/auto (style.margin-bottom r)) 0.0 ,(get-px-or-% 'margin-bottom '(w p) 'b)))
       (ite (first-box? b)
            (and
             (= (pl b) ,(get-px-or-% 'padding-left '(w p) 'b))
             (= (bl b) ,(get-px-or-% 'border-left-width '(w p) 'b))
             (= (ml b)
                (+ (ite (is-margin/auto (style.margin-left r)) 0.0 ,(get-px-or-% 'margin-left '(w p) 'b))
                   (ite (and (is-no-box v) (is-box/line (type p)) (is-no-box (vflow p))) (text-indent p) 0.0))))
            (and (= (pl b) (bl b) 0.0)
                 (= (ml b) (ite (and (is-no-box v) (is-box/line (type p)) (is-no-box (vflow p))) (text-indent p) 0.0))))
       (ite (last-box? b)
            (and
             (= (pr b) ,(get-px-or-% 'padding-right '(w p) 'b))
             (= (br b) ,(get-px-or-% 'border-right-width '(w p) 'b))
             (= (mr b) (ite (is-margin/auto (style.margin-right r)) 0.0 ,(get-px-or-% 'margin-right '(w p) 'b))))
            (and (= (pr b) (br b) (mr b) 0.0)))

       (margins-dont-collapse b)

       (ite (is-position/relative (style.position r))
            (relatively-positioned b)
            (no-relative-offset b))
       (= (stfwidth b)
          (+ (ite (and (is-no-box v) (is-box/line (type p)) (is-no-box (vflow p))) (text-indent p) 0.0)
             (min-max-width (compute-stfwidth b) b)))
       (= (stfmax b)
          (+ (ite (and (is-no-box v) (is-box/line (type p)) (is-no-box (vflow p))) (text-indent p) 0.0)
             (ite (is-box (vbox b)) (stfmax (vbox b)) 0.0)
             (min-max-width (compute-stfmax b) b)))
       (= (float-stfmax b)
          (+ 
           (ite (and (not (is-display/inline-block (style.display r))) (is-box (lbox b)))
                (min-max-width (float-stfmax (lbox b)) b)
                0.0)
           (ite (is-box (vbox b)) (float-stfmax (vbox b)) 0.0)))

       (= (text-indent b)
          (ite (is-elt e) ,(get-px-or-% 'text-indent '(w p) 'b) 0.0))

       (= (baseline b) (baseline p))

       (=> (and (is-elt e) (is-image e)) (= (inline-block-offset b) 1))

       (ite (or (and (is-elt e) (is-replaced e)) (is-display/inline-block (style.display r)))
           (and
            (< 0 (inline-block-offset b) (max (height-outer b) (font.descent metrics)))
            (= (above-baseline b)
               (max-if (- (height-outer b) (inline-block-offset b))
                       (is-box v) (above-baseline v)))
            (= (below-baseline b)
               (max-if (inline-block-offset b)
                       (is-box v) (below-baseline v)))
            (= (bottom-outer b) (+ (baseline p) (inline-block-offset b))))
           (and
            (= (top-content b) (- (baseline b) (font.ascent metrics) (font.topoffset metrics)))
            (= (above-baseline b)
               (max-if (max-if (+ (font.ascent metrics) (/ leading 2))
                               (is-box v) (above-baseline v))
                       (is-box l) (above-baseline l)))
            (= (below-baseline b)
               (max-if (max-if (+ (font.descent metrics) (/ leading 2))
                               (is-box v) (below-baseline v))
                       (is-box l) (below-baseline l)))))

       ,(smt-cond
         [(is-replaced e)
          (= (h b) (- (intrinsic-height e) (bt b) (bb b) (pt b) (pb b)))]
         [(is-display/inline-block (style.display r))
          (= (h b)
             (ite (is-height/auto (style.height r))
                  (auto-height-for-flow-roots b)
                  (min-max-height ,(get-px-or-% 'height '(h p) 'b) b)))]
         [else
          (= (h b) (font.selection-height metrics))])

       ,(smt-cond
         [(is-replaced e)
          (= (w b) (- (intrinsic-width e) (bl b) (br b) (pl b) (pr b)))]
         [(is-display/inline-block (style.display r))
          (ite (is-width/auto (style.width r))
               (= (w b) (usable-stfwidth b))
               (= (w b) (min-max-width ,(get-px-or-% 'width '(w p) 'b) b)))]
         [(is-box (fflow b))
          (and
           (= (left-outer (fflow b)) (left-content b))
           (= (right-outer (lflow b)) (right-content b)))]
         [else
          (= (w b) 0.0)])

       (=> (is-box v) (= (left-outer b) (right-outer v)))

       (= (ez.lookback b) true)))

  (define-fun a-text-box ((b Box)) Bool
    ,(smt-let ([p (pflow b)] [v (vflow b)]
               [metrics (font-info b)] [leading (- (line-height b) (height-text b))])
       (= (type b) box/text)
       ;; Only true if there are no wrapping opportunities in the box
       (= (stfwidth b) (max (+ (ml b) (w b)) (ite (is-box (vbox b)) (stfwidth (vbox b)) 0.0)))
       (= (stfmax b)
          (+ (ite (is-box (vbox b)) (stfmax (vbox b)) 0.0)
             (ite (and (= (w b) 0.0) (is-no-box (nbox b))) 5.0 (+ (w b) (ml b))))) ;; HAXXX
       (= (float-stfmax b) (ite (is-box (vbox b)) (float-stfmax (vbox b)) 0.0))

       (= (baseline b) (baseline p))
       (= (text-indent b) 0.0)
       
       (= (h b) (font.selection-height metrics))
       (= (above-baseline b)
          (max-if (ite (> (w b) 0.0) (+ (font.ascent metrics) (/ leading 2)) 0.0)
                  (is-box v) (above-baseline v)))
       (= (below-baseline b)
          (max-if (ite (> (w b) 0.0) (+ (font.descent metrics) (/ leading 2)) 0.0)
                  (is-box v) (below-baseline v)))
       (= (y b) (- (baseline b) (+ (font.ascent metrics) (font.topoffset metrics))))

       (no-relative-offset b)
       (= (mtp b) (mtn b) (mbp b) (mbn b) (mtp-up b) (mtn-up b) 0.0)
       (= (mb-clear b) false)
       (= (mt b) (mr b) (mb b) 0.0)
       (= (bt b) (br b) (bb b) (bl b) 0.0)
       (= (pt b) (pr b) (pb b) (pl b) 0.0)

       (= (ml b) (ite (and (is-no-box v) (is-box/line (type p)) (is-no-box (vflow p))) (text-indent p) 0.0))

       (=> (is-box v) (= (x b) (right-outer v))) ; Otherwise set by the line box
       (= (ez.lookback b) true)))
  
  (declare-fun ancestor-elt (Box) Element)
  (assert
   (forall ((b Box))
           (= (ancestor-elt b) (ite (is-elt (box-elt b)) (box-elt b) (ite (is-box (pbox b)) (ancestor-elt (pbox b)) no-elt)))))

  (define-fun a-line-box ((b Box)) Bool
    ,(smt-let ([p (pflow b)] [v (vflow b)] [n (nflow b)] [flt (flt b)]
               [f (fflow b)] [l (lflow b)]
               [metrics (font-info b)] [leading (- (line-height b) (height-text b))])
       (= (type b) box/line)
       (no-relative-offset b)
       (zero-box-model b)

       (= (text-indent b) (text-indent p))

       (let ([y-normal (resolve-clear b (ite (is-no-box v) (top-content p) (bottom-border v)))]
             [ez (ez.line-up (lbox b))])
         (and
          (= (ez.lookback b) (ez.test (ez.in b) y-normal)) ;; Key float restriction
          (ite (ez.lookback b)
               (and
                ;; Here we use (stfmax (lbox b)) because that ignores floats on future lines
                (= (y b) (ez.level ez (stfwidth (lbox b)) (left-content p) (right-content p) y-normal float/left))
                (= (left-outer b) (ez.x ez (y b) float/left (left-content p) (right-content p)))
                (= (right-outer b) (ez.x ez (y b) float/right (left-content p) (right-content p))))
               (and
                (>= (y b) y-normal)
                (>= (left-outer b) (left-content p))
                (<= (right-outer b) (right-content p))))))

       (= (stfwidth b) (compute-stfwidth b))
       (= (stfmax b) (+ (ite (is-box v) (stfmax v) 0.0) (+ (stfmax (lbox b)) (pl b))))
       (= (float-stfmax b)
          (+ (ite (is-box (lbox b)) (float-stfmax (lbox b)) 0.0)
             (ite (is-box (vbox b)) (float-stfmax (vbox b)) 0.0)))

       (=> (is-box l)
           (= (baseline b)
              (+ (y b) (max-if
                        (above-baseline l)
                        (=> quirks-mode (is-display/list-item (style.display (computed-style (box-elt (pflow b))))))
                        (+ (font.ascent metrics) (* 0.5 leading))))))
       (=> (is-box l)
           (= (h b)
              (ite (contains-content l)
                   (+ (max-if
                       (above-baseline l)
                       (=> quirks-mode (is-display/list-item (style.display (computed-style (box-elt (pflow b))))))
                       (+ (font.ascent metrics) (* 0.5 leading)))
                      (max-if
                       (below-baseline l)
                       (=> quirks-mode (is-display/list-item (style.display (computed-style (box-elt (pflow b))))))
                       (+ (font.descent metrics) (* 0.5 leading))))
                   0.0)))

       (=> (is-box f)
           (let ([wsub (- (right-outer l) (left-outer f))]
                 [textalign (style.text-align (computed-style (ancestor-elt b)))])
             ,(smt-cond
               [(> wsub (w b)) (= (left-outer f) (left-content b))]
               [(is-text-align/left textalign) (= (left-outer f) (left-content b))]
               [(is-text-align/justify textalign)
                (and (= (left-outer f) (left-content b))
                     (=> (is-box n) (= (right-outer l) (right-content b))))]
               [(is-text-align/right textalign)
                (= (right-outer l) (right-content b))]
               [(is-text-align/center textalign)
                (= (- (left-outer f) (left-content b)) (- (right-content b) (right-outer l)))]
               [else false])))))

  (define-fun a-view-box ((b Box)) Bool
    (and
     (= (type b) box/root)
     (zero-box-model b)
     (= (x b) (y b) 0.0)
     (= (xo b) (yo b) 0.0)
     (= (box-width b) ,(view-width-name))
     (= (box-height b) ,(view-height-name))
     (= (ez.lookback b) true)
     (= (text-indent b) 0.0)))

  (define-fun a-magic-box ((b Box)) Bool
    (and
     (or (is-box/block (type b)) (is-box/inline (type b)))
     (ez.lookback b)))

  (define-fun an-anon-block-box ((b Box)) Bool
    ,(smt-let ([p (pflow b)] [v (vflow b)] [l (lflow b)])
       (= (type b) box/block)
       (no-relative-offset b)
       (zero-box-model-except-collapse b)
       (margins-collapse b)
       (flow-horizontal-layout b (w p))
       (= (h b) (auto-height-for-flow-blocks b))
       (= (text-indent b) (text-indent p))
       (= (stfmax b) (max-if (stfmax l) (is-box v) (stfmax v)))
       (= (stfwidth b) (max-if (stfwidth l) (is-box v) (stfwidth v)))
       (= (float-stfmax b)
          (+ (ite (is-box (lbox b)) (float-stfmax (lbox b)) 0.0)
             (ite (is-box (vbox b)) (float-stfmax (vbox b)) 0.0)))
       (not (w-from-stfwidth b))
       (= (y b) (vertical-position-for-flow-boxes b))
       (= (x b) (left-content p))
       (= (ez.lookback b) true)))

  ;; In some cases either the x or y scrollbar can be shown but not both;
  ;; in this case only the y scrollbar is ever shown
  ;; Also, we do not model the fact no scrollbars is preferred if both are possible
  (define-const min-size-for-scrollbars Real 45.0)

  (assert
   (forall ((b Box))
           (or 
            (= (scroll-x b)
               (ite
                (and
                 (> (- (box-width b) (scroll-y b)) min-size-for-scrollbars)
                 (is-box (pbox b))
                 (is-elt (box-elt b))
                 (is-elt (pelt (box-elt b)))
                 (is-overflow/scroll (style.overflow-x (computed-style (box-elt b)))))
                ,(scroll-width-name)
                0))
            (and
             (is-no-box (pbox b))
             (or (= (scroll-x b) 0) (= (scroll-x b) ,(scroll-width-name))))))) ; The root box is weird in several ways

  (assert
   (forall ((b Box))
           (or
            (= (scroll-y b)
               (ite 
                (and
                 (> (- (box-height b) (scroll-x b)) min-size-for-scrollbars)
                 (is-box (pbox b))
                 (is-elt (box-elt b))
                 (is-elt (pelt (box-elt b)))
                 (is-overflow/scroll (style.overflow-y (computed-style (box-elt b)))))
                ,(scroll-width-name)
                0))
            (and
             (is-no-box (pbox b))
             (or (= (scroll-y b) 0) (= (scroll-y b) ,(scroll-width-name))))))))
