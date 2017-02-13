#lang racket
(require "../common.rkt" "../smt.rkt" "css-properties.rkt")
(provide layout-definitions)

(define (get-px-or-% prop wrt b)
  (define r `(computed-style (box-elt ,b)))
  (define type (slower (css-type prop)))
  `(ite (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) ,r))
        (,(sformat "~a.px" type) (,(sformat "style.~a" prop) ,r))
        (ite (,(sformat "is-~a/%" type) (,(sformat "style.~a" prop) ,r))
             (%of (,(sformat "~a.%" type) (,(sformat "style.~a" prop) ,r)) (,wrt (pflow ,b)))
             (%of (* 100 (,(sformat "~a.em" type) (,(sformat "style.~a" prop) ,r))) (font-size ,b)))))

(define fields
  '((padding-left padding pl) (padding-right padding pr)
    (padding-top padding pt) (padding-bottom padding pb)
    (margin-left margin ml) (margin-right margin mr)
    (margin-top margin mt) (margin-bottom margin mb)
    (border-top-width border bt) (border-right-width border br)
    (border-bottom-width border bb) (border-left-width border bl)))

(define (extract-field field)
  (match-define (cons prop type)
    (for/first ([rec fields] #:when (equal? (last rec) field))
      (cons (first rec) (second rec))))
  `(and
    (=> (,(sformat "is-~a/%" type) (,(sformat "style.~a" prop) r))
        (= (,field b) (%of (,(sformat "~a.px" type) (,(sformat "style.~a" prop) r)) (w p))))
    (=> (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) r))
        (= (,field b) (,(sformat "~a.px" type) (,(sformat "style.~a" prop) r))))
    (=> (,(sformat "is-~a/em" type) (,(sformat "style.~a" prop) r))
        (= (,field b) (%of (* 100.0 (,(sformat "~a.em" type) (,(sformat "style.~a" prop) r))) (font-size b))))))

(define (zero-auto-margins dirs)
  (for/list ([dir dirs])
    (define letter (sformat "~a" (substring (~a dir) 0 1)))
    `(=> (is-margin/auto (,(sformat "style.margin-~a" dir) r)) (= (,(sformat "m~a" letter) b) 0.0))))

(define-constraints layout-definitions

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

  (define-fun max ((x Real) (y Real)) Real (ite (< x y) y x))
  (define-fun min ((x Real) (y Real)) Real (ite (< x y) x y))
  (define-fun between ((x Real) (y Real) (z Real)) Bool
    (or (<= x y z) (>= x y z)))

  (define-fun %of ((% Real) (base Real)) Real
    ,(let* ([%s (*%*)])
       (for/fold ([out `(* ,(/ (car %s) 100.0) base)]) ([% (cdr %s)])
         `(if (= % ,%) (* ,(/ % 100.0) base) ,out))))

  (define-fun horizontally-adjacent ((box1 Box) (box2 Box)) Bool
    (or (> (bottom-outer box1) (top-outer box2) (top-outer box1))
        (> (bottom-outer box2) (top-outer box1) (top-outer box2))
        (and (= (top-outer box1) (top-outer box2))
             (= (bottom-outer box1) (bottom-outer box2))
             (not (= (top-outer box1) (bottom-outer box2))))))

  (define-fun vertically-adjacent ((box1 Box) (box2 Box)) Bool
    (or (> (right-outer box1) (left-outer box2) (left-outer box1))
        (> (right-outer box2) (left-outer box1) (left-outer box2))
        (and (= (left-outer box1) (left-outer box2))
             (= (right-outer box1) (right-outer box2))
             (not (= (left-outer box1) (right-outer box2))))))

  (define-fun overlaps ((b1 Box) (b2 Box)) Bool
    (and (horizontally-adjacent b1 b2) (vertically-adjacent b1 b2)))

  (define-fun within ((b1 Box) (b2 Box)) Bool
    (and (<= (box-left b2) (box-left b1))
         (<= (box-top b2) (box-top b1))
         (<= (box-right b1) (box-right b2))
         (<= (box-bottom b1) (box-bottom b2))))

  (define-fun is-root-elt ((e Element)) Bool
    (is-nil-elt (&pelt e)))

  (define-fun is-flow-root ((b Box)) Bool
    (or (is-box/root (type b))
        (is-root-elt (box-elt b))
        (not (box-in-flow b))
        (not (is-overflow/visible (style.overflow-x (computed-style (box-elt b)))))
        (not (is-overflow/visible (style.overflow-y (computed-style (box-elt b)))))))

  (define-fun box-collapsed-through ((b Box)) Bool
    (and (= (box-height b) 0.0)
         (or (is-no-box (lflow b)) (= (box-height (lflow b)) 0.0))))

  (define-fun min-max-width ((val Real) (b Box)) Real
    (max ,(get-px-or-% 'min-width 'w 'b) (min val ,(get-px-or-% 'max-width 'w 'b))))

  (define-fun min-max-height ((val Real) (b Box)) Real
    (max ,(get-px-or-% 'min-height 'h 'b) (min val ,(get-px-or-% 'max-height 'h 'b))))

  (define-fun margin-min-px ((m Margin) (b Box)) Real
    ,(smt-cond
      [(is-margin/px m) (margin.px m)]
      [(is-margin/% m) (%of (margin.% m) (w (pflow b)))]
      [(is-margin/em m) (%of (* 100 (margin.em m)) (font-size b))]
      [else 0.0]))

  (define-fun min-w ((b Box)) Real
    (ite (is-width/auto (style.width (computed-style (box-elt b)))) 0.0 ,(get-px-or-% 'width 'w 'b)))

  (define-fun min-ml ((b Box)) Real
    (margin-min-px (style.margin-left (computed-style (box-elt b))) b))

  (define-fun min-mr ((b Box)) Real
    (margin-min-px (style.margin-right (computed-style (box-elt b))) b))

  (define-fun top-margin-collapses-with-children ((b Box)) Bool
    (and (not (is-flow-root b)) (= (pt b) 0.0) (= (bt b) 0.0)))

  (define-fun zero-box-model ((b Box)) Bool
    (and
     (= (mtp b) (mtn b) (mbp b) (mbn b) 0.0)
     (= (mt b) (mr b) (mb b) (ml b) 0.0)
     (= (bt b) (br b) (bb b) (bl b) 0.0)
     (= (pt b) (pr b) (pb b) (pl b) 0.0)))

  (define-fun auto-height-for-flow-roots ((b Box)) Real
    ;; CSS 2.1 § 10.6.7

    ;; TODO : In addition, if the element has any floating descendants whose bottom margin edge
    ;; is below the element's bottom content edge, then the height is increased to include
    ;; those edges. Only floats that participate in this block formatting context are taken
    ;; into account, e.g., floats inside absolutely positioned descendants or other floats
    ;; are not.
    ,(smt-cond
      [(is-no-box (fbox b)) 0.0]
      [(is-box/line (type (lflow b)))
       ;; If it only has inline-level children, the height is the distance between
       ;; the top of the topmost line box and the bottom of the bottommost line box.
       (- (bottom-border (lflow b)) (top-border (fflow b)))]
      [(is-nil-box (&flt-up (lbox b)))
       (- (bottom-outer (lflow b)) (top-content b))]
      [else
       ;; If it has block-level children, the height is the distance between the
       ;; top margin-edge of the topmost block-level child box and the
       ;; bottom margin-edge of the bottommost block-level child box.
       (- (max (bottom-outer (lflow b)) (bottom-outer (get/box (&flt-up (lbox b)))))
          (top-content b))]))

  (define-fun auto-height-for-flow-blocks ((b Box)) Bool
    (let ([lb (lflow b)] [e (box-elt b)])
      ,(smt-cond
        ;; CSS 2.1 § 10.6.6, first bullet
        [(is-flow-root b)
         (= (h b) (auto-height-for-flow-roots b))]
        ;; CSS 2.1 § 10.6.3, item 4
        [(is-no-box lb)
         (= (h b) 0.0)]
        ;; CSS 2.1 § 10.6.3, item 1
        [(is-box/line (type lb))
         (=> (width-set b) (= (bottom-content b) (bottom-border lb)))]
        [(is-box/block (type lb))
         (= (bottom-content b)
            ;; CSS 2.1 § 10.6.3, item 2
            (ite (and (= (pb b) 0.0) (= (bb b) 0.0) (not (is-root-elt e)))
                 (ite (and (not (box-collapsed-through b)) (box-collapsed-through lb))
                      ;; CSS § 10.6.3, item 3
                      (- (bottom-border lb) (mtp lb) (mtn lb))
                      (bottom-border lb)) ; Collapsed bottom margin
                 (bottom-outer lb)))] ; No collapsed bottom margin
        ;; Block boxes may only have line or block children
        [else false])))

  (define-fun margins-collapse ((b Box)) Bool
    ,(smt-let ([e (box-elt b)] [p (pflow b)] [vb (vflow b)] [fb (fflow b)] [lb (lflow b)])
       (= (mtp b)
          (max (ite (and (not (is-root-elt e)) (is-box fb) (= (pt b) 0.0) (= (bt b) 0.0)) (mtp fb) 0.0)
               (max (ite (and (is-box vb) (box-collapsed-through vb)) (mtp vb) 0.0)
                    (max (ite (is-box vb) (mbp vb) 0.0)
                         (ite (> (mt b) 0.0) (mt b) 0.0)))))
       (= (mtn b)
          (min (ite (and (not (is-root-elt e)) (is-box fb) (= (pt b) 0.0) (= (bt b) 0.0)) (mtn fb) 0.0)
               (min (ite (and (is-box vb) (box-collapsed-through vb)) (mtn vb) 0.0)
                    (min (ite (is-box vb) (mbn vb) 0.0)
                         (ite (< (mt b) 0.0) (mt b) 0.0)))))
       (= (mbp b)
          (max (ite (and (not (is-root-elt e)) (is-box lb) (= (pb b) 0.0) (= (bb b) 0.0))
                    (ite (box-collapsed-through lb) (max (mbp lb) (mtp lb)) (mbp lb)) 0.0)
               (ite (> (mb b) 0.0) (mb b) 0.0)))
       (= (mbn b)
          (min (ite (and (not (is-root-elt e)) (is-box lb) (= (pb b) 0.0) (= (bb b) 0.0))
                    (ite (box-collapsed-through lb) (min (mbn lb) (mtn lb)) (mbn lb)) 0.0)
               (ite (< (mb b) 0.0) (mb b) 0.0)))))

  (define-fun margins-dont-collapse ((b Box)) Bool
    (and
     (= (mtp b) (max (mt b) 0.0))
     (= (mtn b) (min (mt b) 0.0))
     (= (mbp b) (max (mb b) 0.0))
     (= (mbn b) (min (mb b) 0.0))))

  (define-fun relatively-positioned ((b Box)) Bool
    ,(smt-let ([r (computed-style (box-elt b))] [p (pflow b)])
       (=> (is-offset/px (style.left r))
           (= (xo b) (+ (offset.px (style.left r)) (xo p))))
       (=> (is-offset/% (style.left r))
           (= (xo b) (+ (%of (offset.% (style.left r)) (w p)) (xo p))))
       (=> (is-offset/em (style.left r))
           (= (xo b) (+ (%of (* 100 (offset.em (style.left r))) (font-size b)) (xo p))))
       (=> (is-offset/px (style.top r))
           (= (yo b) (+ (offset.px (style.top r)) (yo p))))
       (=> (is-offset/% (style.top r))
           (= (yo b) (+ (%of (offset.% (style.top r)) (h p)) (yo p))))
       (=> (is-offset/em (style.top r))
           (= (yo b) (+ (%of (* 100 (offset.em (style.top r))) (font-size b)) (yo p))))
       (=> (and (is-offset/auto (style.left r)) (is-offset/px (style.right r)))
           (= (xo b) (- (xo p) (offset.px (style.right r)))))
       (=> (and (is-offset/auto (style.left r)) (is-offset/% (style.right r)))
           (= (xo b) (- (xo p) (%of (offset.% (style.right r)) (w p)))))
       (=> (and (is-offset/auto (style.left r)) (is-offset/em (style.right r)))
           (= (xo b) (- (xo p) (%of (* 100 (offset.em (style.right r))) (font-size b)))))
       (=> (and (is-offset/auto (style.top r)) (is-offset/px (style.bottom r)))
           (= (yo b) (- (yo p) (offset.px (style.bottom r)))))
       (=> (and (is-offset/auto (style.top r)) (is-offset/% (style.bottom r)))
           (= (yo b) (- (yo p) (%of (offset.% (style.bottom r)) (w p)))))
       (=> (and (is-offset/auto (style.top r)) (is-offset/em (style.bottom r)))
           (= (yo b) (- (yo p) (%of (* 100 (offset.em (style.bottom r))) (font-size b)))))
       (=> (and (is-offset/auto (style.left r)) (is-offset/auto (style.right r)))
           (= (xo b) (xo p)))
       (=> (and (is-offset/auto (style.top r)) (is-offset/auto (style.bottom r)))
           (= (yo b) (yo p)))))

  (define-fun no-relative-offset ((b Box)) Bool
    ,(smt-let ([r (computed-style (box-elt b))] [p (pflow b)])
       (= (xo b) (xo p))
       (= (yo b) (yo p))))

  (define-fun vertical-position-for-flow-boxes ((b Box)) Real
    ,(smt-cond
      [(is-box (vflow b)) (+ (bottom-border (vflow b)) (max (mtp b) (mbp (vflow b))) (min (mtn b) (mbn (vflow b))))]
      [(top-margin-collapses-with-children (pflow b)) (top-content (pflow b))]
      [else (+ (top-content (pflow b)) (mtp b) (mtn b))]))

  (define-fun usable-stfwidth ((b Box)) Real
    (let ([l (lbox b)] [v (vbox b)])
      (min-max-width
       (ite (is-box l)
            (+ (min-ml l) (bl l) (pl l) (stfwidth l) (pr l) (br l) (min-mr l))
            0.0)
       b)))

  (define-fun flow-horizontal-layout ((b Box)) Bool
    ;; CSS § 10.3.3: Block-level, non-replaced elements in normal flow
    ,(smt-let ([e (box-elt b)] [r (computed-style (box-elt b))] [p (pflow b)] )
       (= (w p) (+ (ml b) (box-width b) (mr b)))
       (not (w-from-stfwidth b))
       (let ([w* (min-max-width (min-w b) b)]
             [ml* (min-ml b)]
             [mr* (min-mr b)])
         ,(smt-cond
           [(> (+ ml* (bl b) (pl b) w* (pr b) (br b) mr*) (w p))
            (= (w b) w*)
            (= (ml b) ml*)
            (width-set b)]
           [(is-width/auto (style.width r))
            (= (ml b) ml*)
            (= (mr b) mr*)
            (width-set b)]
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

  (define-fun compute-stfwidth ((b Box)) Real
    (let ([l (lbox b)] [v (vbox b)] [r (computed-style (box-elt b))])
      (ite (is-width/auto (style.width r))
           (max
            (ite (is-box l) (+ (min-ml l) (bl l) (pl l) (min (w l) (stfwidth l)) (pr l) (br l) (min-mr l)) 0.0)
            (ite (is-box v) (stfwidth v) 0.0))
           (w b))))

  (define-fun resolve-font-size ((b Box)) Real
    (let ([e (box-elt b)])
      ,(smt-cond
        [(is-font-size/px (style.font-size (computed-style e)))
         (font-size.px (style.font-size (computed-style e)))]
        [(is-font-size/% (style.font-size (computed-style e)))
         (%of (font-size.% (style.font-size (computed-style e)))
              (font-size (pbox b)))]
        [else ; em
         (%of (* 100 (font-size.em (style.font-size (computed-style e))))
              (font-size (pbox b)))])))

  (define-fun float-rules ((b Box)) Bool
    ,(smt-let ([p (pflow b)] [flt (flt b)] [vb (vbox b)])
       ;; CSS 2.1 § 9.5.1

       ;; CSS 2.1, § 9.5.1, item 1
       (=> (is-float/left (float b)) (>= (left-outer b) (left-content p)))
       (=> (is-float/right (float b)) (>= (right-content p) (right-outer b)))

       ;; CSS 2.1, § 9.5.1, item 2
       ;; SIMPL: either to the right of the previous float, or below it.
       ;; TODO: This doesn't take into account that it's just
       ;; interactions of left floats with left floats, right floats
       ;; with right floats
       (or (is-no-box flt)
           (ite (is-float/left (float b))
                (or (= (left-outer b) (right-outer flt)) (>= (top-outer b) (bottom-outer flt)))
                (or (= (right-outer b) (left-outer flt)) (>= (top-outer b) (bottom-outer flt)))))


       ;; CSS 2.1, § 9.5.1, item 3
       ;; SIMPL: Currently impossible --- see restrictions below

       ;; CSS 2.1, § 9.5.1, item 4
       (>= (top-outer b) (top-content p))

       ;; CSS 2.1, § 9.5.1, item 5 & 6
       ;; SIMPL: May not be higher than the top of the previous float or flow box
       (=> (is-box flt) (>= (top-outer b) (top-outer flt)))
       (=> (is-box vb) (>= (top-outer b) (top-outer vb)))
       (=> (and (is-box vb) (is-box (lflow vb)))
           (>= (top-outer b) (top-outer (lflow vb))))

       ;; CSS 2.1, § 9.5.1, item 7
       ;; TODO: This doesn't take into account that it's just
       ;; interactions of left floats with left floats, right floats
       ;; with right floats
       (=> (and (is-box flt) (< (x flt) (x b)) (horizontally-adjacent b flt)
                (is-float/left (float b)))
           (<= (right-outer b) (right-content p)))
       (=> (and (is-box flt) (> (x flt) (x b)) (horizontally-adjacent b flt)
                (is-float/right (float b)))
           (>= (left-outer b) (left-content p)))

       ;; CSS 2.1, § 9.5.1, item 8
       ;; SIMPL: at its normal position, or the same y-position as previous float
       (or (= (top-outer b) (ite (is-no-box vb) (top-content p) (bottom-outer vb)))
           (and (is-box flt) (= (top-outer b) (top-outer flt)))
           (and (is-box flt) (= (top-outer b) (bottom-outer flt))))

       ;; CSS 2.1, § 9.5.1, item 9
       ;; SIMPL: at the left/right or next to an existing floating box
       ;; TODO: This doesn't take into account that it's just
       ;; interactions of left floats with left floats, right floats
       ;; with right floats
       (=> (is-float/left (float b))
           (or (= (left-outer b) (left-content p))
               (and (is-box flt) (is-float/left (float flt))
                    (horizontally-adjacent b flt)
                    (= (left-outer b) (right-outer flt)))))
       (=> (is-float/right (float b))
           (or (= (right-outer b) (right-content p))
               (and (is-box flt) (is-float/left (float flt))
                    (horizontally-adjacent b flt)
                    (= (right-outer b) (left-outer flt)))))))

  (define-fun float-restrictions ((b Box)) Bool
    ;; Four restrictions on floats to make solving efficient. Not from standard.
    ,(smt-let ([flt (flt b)] [p (pflow b)])
       ;; R1: No negative margins on floats; otherwise they can overlap
       ,@(for/list ([m '(mt mr mb ml)]) `(>= (,m b) 0.0))

       ;; R2: The bottom of a box is farther down than the bottom of the previous box
       ;; Otherwise, they can make little pyramids
       (=> (is-box flt) (>= (bottom-outer b) (bottom-outer flt)))

       ;; R3: If a float wraps to the next line, the previous line must be full
       (=> (and (is-box flt) (= (top-outer b) (bottom-outer flt)))
           (ite (is-float/left (float b))
                (>= (right-outer flt) (right-content p))
                (<= (left-outer flt) (left-content p))))

       ;; R4: If this and the previous float float to different sides,
       ;; they are not horizontally adjacent
       (=> (and (is-box flt) (not (= (float flt) (float b))))
           (not (horizontally-adjacent flt b)))))

  (define-fun positioned-vertical-layout ((b Box)) Bool
     ,(smt-let ([r (computed-style (box-elt b))] [pp (ppflow b)]
                [temp-top ,(get-px-or-% 'top 'h 'b)]
                [temp-bottom ,(get-px-or-% 'bottom 'h 'b)]
                [temp-height ,(get-px-or-% 'height 'h 'b)]
                [top? (not (is-offset/auto (style.top (computed-style (box-elt b)))))]
                [bottom? (not (is-offset/auto (style.bottom (computed-style (box-elt b)))))]
                [height? (not (is-height/auto (style.height (computed-style (box-elt b)))))])

        (=> top? (= (top-border b) (+ (top-content pp) temp-top)))
        (=> height? (= (h b) temp-height))
        (=> (and (not top?) (not bottom?)) (= (y b) (vertical-position-for-flow-boxes b)))
        (=> (and (not height?) (not (and top? bottom?)))
            (= (h b) (auto-height-for-flow-roots b)))
        (=> (and bottom? (not (and top? height?)))
            (= (bottom-border b) (- (bottom-content pp) temp-bottom)))

        ;; Margins work identically unless overspecified
        (=> (not (and top? height? bottom?))
            (and
             (= (mt b) (margin-min-px (style.margin-top r) b))
             (= (mb b) (margin-min-px (style.margin-bottom r) b))))

        ;; Pre-item 2
        (=> (and top? bottom? height?)
            (and (=> (not (is-margin/auto (style.margin-top r)))
                     (= (mt b) (margin-min-px (style.margin-top r) b)))
                 (=> (not (is-margin/auto (style.margin-bottom r)))
                     (= (mb b) (margin-min-px (style.margin-bottom r) b)))
                 (=> (and (is-margin/auto (style.margin-top r))
                          (is-margin/auto (style.margin-bottom r)))
                     (= (mt b) (mb b)))
                 (=> (or (is-margin/auto (style.margin-top r))
                         (is-margin/auto (style.margin-bottom r)))
                     (= (bottom-border b) (- (bottom-content pp) temp-bottom)))))))


  (define-fun positioned-horizontal-layout ((b Box)) Bool
     ,(smt-let ([r (computed-style (box-elt b))] [pp (ppflow b)] [p (pflow b)]
                [temp-left ,(get-px-or-% 'left 'w 'b)]
                [temp-right ,(get-px-or-% 'right 'w 'b)]
                [temp-width ,(get-px-or-% 'width 'w 'b)]
                [left? (not (is-offset/auto (style.left (computed-style (box-elt b)))))]
                [right? (not (is-offset/auto (style.right (computed-style (box-elt b)))))]
                [width? (not (is-width/auto (style.width (computed-style (box-elt b)))))])

        (width-set b)

        ;; Margins work identically unless overspecified
        (=> (not (and left? width? right?))
            (and
             (= (ml b) (margin-min-px (style.margin-left r) b))
             (= (mr b) (margin-min-px (style.margin-right r) b))))

        (=> left? (= (left-border b) (+ (left-content pp) temp-left)))
        (=> width? (and (= (w b) temp-width) (not (w-from-stfwidth b))))
        (=> (and (not width?) (not (and left? right?)))
            (and (= (w b) (usable-stfwidth b))
                 (w-from-stfwidth b)))
        (=> (and (not left?) (not right?))
            (= (left-border b) (left-content p)))
        (=> (and right? (not (and left? width?)))
            (= (right-border b) (- (right-content pp) temp-right)))
        (=> (and left? right?) (not (w-from-stfwidth b)))

        (=> (and left? width? right?)
            (=> (not (is-margin/auto (style.margin-left r)))
                (= (ml b) (margin-min-px (style.margin-left r) b)))
            (=> (not (is-margin/auto (style.margin-right r)))
                (= (mr b) (margin-min-px (style.margin-right r) b)))
            (=> (and (is-margin/auto (style.margin-left r)) (is-margin/auto (style.margin-right r)))
                (= (ml b) (mr b)))
            (=> (or (is-margin/auto (style.margin-left r)) (is-margin/auto (style.margin-right r)))
                (= (right-border b) (- (right-content pp) temp-right))))))

  ;; These three functions define the three types of layouts Cassius
  ;; supports for block boxes: normal in-flow layout, floating layout,
  ;; and positioned layout. By and large, these functions refer to the
  ;; preceding functions.

  (define-fun a-block-flow-box ((b Box)) Bool
    ,(smt-let ([e (box-elt b)] [r (computed-style (box-elt b))]
               [p (pflow b)] [vb (vflow b)] [fb (fflow b)] [lb (lflow b)])

       (ite (is-height/auto (style.height r))
            (auto-height-for-flow-blocks b)
            (= (ite (is-box-sizing/content-box (style.box-sizing r)) (h b) (box-height b))
               ,(get-px-or-% 'height 'h 'b)))

       ,@(map extract-field '(mt mb))
       ,@(zero-auto-margins '(top bottom))
       (margins-collapse b)
       (flow-horizontal-layout b)

       (= (x b) (+ (left-content p) (ml b)))
       (= (y b) (vertical-position-for-flow-boxes b))))

  (define-fun a-block-float-box ((b Box)) Bool
    ,(smt-let ([e (box-elt b)] [r (computed-style (box-elt b))]
               [p (pflow b)] [vb (vflow b)] [fb (fflow b)] [lb (lflow b)] [flt (flt b)])

       ,@(map extract-field '(mt mr mb ml))
       ,@(zero-auto-margins '(left right top bottom))
       (margins-dont-collapse b)

       (= (w-from-stfwidth b) (is-width/auto (style.width r)))
       (=> (is-width/auto (style.width r)) (width-set b))
       (ite (is-width/auto (style.width r))
            (= (w b) (usable-stfwidth b))
            ;; TODO: what do browsers do when (w-from-stfwidth p) and (is-margin/%)?
            (= (ite (is-box-sizing/content-box (style.box-sizing r)) (w b) (box-width b))
               ,(get-px-or-% 'width 'w 'b)))

       (ite (is-height/auto (style.height r))
            (=> (width-set b) (= (h b) (auto-height-for-flow-roots b)))
            (= (ite (is-box-sizing/content-box (style.box-sizing r)) (h b) (box-height b))
               ,(get-px-or-% 'height 'h 'b)))

       (float-rules b)
       (float-restrictions b)))

  (define-fun a-block-positioned-box ((b Box)) Bool
    (and
      (margins-dont-collapse b)
      (positioned-vertical-layout b)
      (positioned-horizontal-layout b)))

  (define-fun a-block-box ((b Box)) Bool
    ,(smt-let ([e (box-elt b)] [r (computed-style (box-elt b))] [p (pflow b)])
       (= (type b) box/block)
       ,@(map extract-field '(pt pr pb pl bt br bb bl))
       (= (stfwidth b) (compute-stfwidth b))
       (ite (is-position/relative (style.position r)) (relatively-positioned b) (no-relative-offset b))
       (= (font-size b) (resolve-font-size b))

       ,(smt-cond
         [(or (is-position/absolute (position b)) (is-position/fixed (position b)))
          (a-block-positioned-box b)]
         [(box-in-flow b)
          (a-block-flow-box b)]
         [else
          (a-block-float-box b)])))

  (define-fun an-inline-box ((b Box)) Bool
    ,(smt-let ([e (box-elt b)] [r (computed-style (box-elt b))]
               [p (pflow b)] [v (vflow b)] [l (lflow b)])
       (= (type b) box/inline)
       ,@(map extract-field '(pt pr pb pl bt br bb bl))

       (margins-dont-collapse b)
       (ite (is-position/relative (style.position r))
            (relatively-positioned b)
            (no-relative-offset b))

       (= (font-size b) (resolve-font-size b))
       (= (stfwidth b) (compute-stfwidth b))
       (= (left-outer (fflow b)) (left-content b))
       (= (right-outer (lflow b)) (right-content b))
       (<= (top-content p) (y b) (+ (top-content p) (h p) (- (h b))))
       (=> (is-box v) (= (left-outer b) (right-outer v)))))

  (define-fun a-text-box ((b Box)) Bool
    ,(smt-let ([p (pflow b)] [v (vflow b)])
       (= (type b) box/text)
       ;; Only true if there are no wrapping opportunities in the box
       (= (stfwidth b) (max (w b) (ite (is-box (vbox b)) (stfwidth (vbox b)) 0.0)))
       ;; This is super-weak, but for now it really is our formalization of line layout
       (horizontally-adjacent b p)
       (= (font-size b) (font-size p))

       (no-relative-offset b)
       (zero-box-model b)
       (=> (is-box v) (= (x b) (right-border v)))))

  (define-fun a-line-box ((b Box)) Bool
    ,(smt-let ([p (pflow b)] [v (vflow b)] [n (nflow b)] [flt (flt b)]
               [f (fflow b)] [l (lflow b)])
       (= (type b) box/line)
       (no-relative-offset b)
       (zero-box-model b)
       (ite (and (is-box flt) (< (top-outer b) (bottom-outer flt))
                 (is-float/left (float flt)))
            (= (left-outer b) (right-outer flt))
            (= (left-outer b) (left-content p)))
       (ite (and (is-box flt) (< (top-outer b) (bottom-outer flt))
                 (is-float/right (float flt)))
            (= (right-outer b) (left-outer flt))
            (= (right-outer b) (right-content p)))

       (let ([c (and ;; Space left for the line of text
                 (> (- (right-outer l) (left-outer f))
                    (ite (is-float/left (float flt))
                         (- (right-content p) (right-outer flt))
                         (- (left-outer flt) (left-content p))))
                 ;; Previous element is a float; see restrictions on floats
                 (is-box flt)
                 (= (&vflow b) (&vflow flt)))])
         (and
          (=> c (= (top-outer b) (bottom-outer flt)))
          (=> (and (not c) (is-no-box v)) (= (y b) (top-content p)))
          (=> (and (not c) (is-box v)) (= (y b) (bottom-border v)))))

       (= (stfwidth b) (compute-stfwidth b))
       (= (font-size b) (font-size p))

       (=> (is-text-align/left (textalign b)) (= (left-border f) (left-content b)))
       (=> (is-text-align/justify (textalign b))
           (and (= (left-border f) (left-content b))
                (=> (is-no-box n) (= (right-border l) (right-content b)))))
       (=> (is-text-align/right (textalign b)) (= (right-border l) (right-content b)))
       (=> (is-text-align/center (textalign b))
           (= (- (right-content b) (right-border l)) (- (left-border f) (left-content b))))))

  (define-fun a-view-box ((b Box)) Bool
    (and
     (= (type b) box/root)
     (zero-box-model b)
     (= (font-size b) 16.0)
     (= (xo b) (yo b) 0.0)))

  (define-fun a-magic-box ((b Box)) Bool
    (or (is-box/block (type b)) (is-box/inline (type b))))

  (define-fun an-anon-block-box ((b Box)) Bool
    ,(smt-let ([p (pflow b)] [v (vflow b)] [l (lflow b)])
       (= (type b) box/block)
       (zero-box-model b)
       (margins-collapse b)
       (flow-horizontal-layout b)
       (= (w b) (w p))
       (= (font-size b) (font-size p))
       (not (w-from-stfwidth b))
       (= (bottom-content b) (bottom-border l))
       (ite (is-box v)
            (= (y b) (+ (bottom-border v) (mbp v) (mbn v)))
            (= (y b) (top-content p)))
       (= (x b) (left-content p)))))
