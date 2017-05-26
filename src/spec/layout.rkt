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
  (define-fun box-collapsed-through ((b Box)) Bool
    (and (= (box-height b) 0.0)
         (or (is-no-box (lflow b)) (= (box-height (lflow b)) 0.0))))

  (define-fun min-max-width ((val Real) (b Box)) Real
    (max ,(get-px-or-% 'min-width 'w 'b)
         (ite (is-max-width/none (style.max-width (computed-style (box-elt b))))
              val
              (min val ,(get-px-or-% 'max-width 'w 'b)))))

  (define-fun min-max-height ((val Real) (b Box)) Real
    (max ,(get-px-or-% 'min-height 'h 'b)
         (ite (is-max-height/none (style.max-height (computed-style (box-elt b))))
              val
              (min val ,(get-px-or-% 'max-height 'h 'b)))))

  (define-fun margin-min-px ((m Margin) (b Box)) Real
    ,(smt-cond
      [(is-margin/px m) (margin.px m)]
      [(is-margin/% m) (%of (margin.% m) (w (pflow b)))]
      [(is-margin/em m) (%of (* 100 (margin.em m)) (font-size b))]
      [else 0.0]))

  (define-fun min-w ((b Box)) Real
    (ite (is-width/auto (style.width (computed-style (box-elt b))))
         (ite (is-replaced (box-elt b))
              (intrinsic-width (box-elt b))
              0.0)
         ,(get-px-or-% 'width 'w 'b)))

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
     (= (mtp b) (mtn b) (mbp b) (mbn b) 0.0)
     (= (mt b) (mr b) (mb b) (ml b) 0.0)
     (= (bt b) (br b) (bb b) (bl b) 0.0)
     (= (pt b) (pr b) (pb b) (pl b) 0.0)))

  (define-fun auto-height-for-flow-roots ((b Box)) Real
    ;; CSS 2.1 § 10.6.7
    ,(smt-cond
      [(is-replaced (box-elt b))
       (min-max-height (intrinsic-height (box-elt b)) b)]
      [(is-no-box (fbox b)) (min-max-height 0.0 b)]
      [(is-no-box (fflow b))
       (min-max-height (max (- (ez.max (ez.out (lbox b))) (top-content b)) 0.0) b)]
      [(is-box/line (type (fflow b)))
       ;; If it only has inline-level children, the height is the distance between
       ;; the top of the topmost line box and the bottom of the bottommost line box.
       (min-max-height (- (bottom-border (lflow b)) (top-border (fflow b))) b)]
      [else
       ;; If it has block-level children, the height is the distance between the
       ;; top margin-edge of the topmost block-level child box and the
       ;; bottom margin-edge of the bottommost block-level child box.
       (min-max-height
        (- (max (ez.max (ez.out (lbox b)))
                (ite (box-collapsed-through (lflow b))
                     (bottom-border (lflow b))
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
        [(is-replaced (box-elt b))
         (min-max-height (intrinsic-height (box-elt b)) b)]
        [(is-no-box lb)
         (min-max-height 0.0 b)]
        ;; CSS 2.1 § 10.6.3, item 1
        [(is-box/line (type lb))
         (min-max-height (- (bottom-border lb) (top-content b)) b)]
        [else ; (is-box/block (type lb)), because blocks only have block or line children
         (min-max-height 
          (- ;; CSS 2.1 § 10.6.3, item 2
           (ite (bottom-margin-collapses-with-children b)
                (ite (box-collapsed-through lb)
                     (- (top-border lb) (+ (mbp lb) (mbn lb))) ; Confusing but correct
                     (bottom-border lb))
                (ite (box-collapsed-through lb)
                     ;; CSS § 10.6.3, item 3
                     (bottom-border lb)
                     (bottom-outer lb)))
           (top-content b))
          b)])))

  (define-fun vertical-position-for-flow-boxes ((b Box)) Real
    (let ([p (pflow b)] [v (vflow b)] [l (lflow b)])
       (ite (is-box v)
            ;; These parts don't check (hash-clearance) because they're
            ;; computed "as if" there were no clearance
            (+ (bottom-border v)
               (ite (box-collapsed-through v)
                    0.0
                    (+ (max (mbp v) (mtp b)) (min (mbn v) (mtn b)))))
            (+ (top-content p)
               (ite (top-margin-collapses-with-children p)
                    0.0
                    (+ (mtp b) (mtn b)))))))

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

  (define-fun margins-collapse ((b Box)) Bool
    (and
     (let ([f (fflow b)] [n (nflow b)])
       (and
        (= (mtp b)
           (max (ite (> (mt b) 0.0) (mt b) 0.0)
                (max (ite (and (top-margin-collapses-with-children b) (is-box f) (not (has-clearance f))) (mtp f) 0.0)
                     (ite (box-collapsed-through b)
                          (max-if (ite (> (mb b) 0.0) (mb b) 0.0) (is-box n) (mtp n))
                          0.0))))
        (= (mtn b)
           (min (ite (< (mt b) 0.0) (mt b) 0.0)
                (min (ite (and (top-margin-collapses-with-children b) (is-box f) (not (has-clearance f))) (mtn f) 0.0)
                     (ite (box-collapsed-through b)
                          (min-if (ite (< (mb b) 0.0) (mb b) 0.0) (is-box n) (mtn n))
                          0.0))))))
     (let ([l (lflow b)] [v (vflow b)])
       (and
        (= (mbp b)
           (max (ite (> (mb b) 0.0) (mb b) 0.0)
                (max (ite (and (bottom-margin-collapses-with-children b) (is-box l)) (mbp l) 0.0)
                     (ite (box-collapsed-through b)
                          (max-if (ite (> (mt b) 0.0) (mt b) 0.0) (is-box v) (mbp v))
                          0.0))))
        (= (mbn b)
           (min (ite (< (mb b) 0.0) (mb b) 0.0)
                (min (ite (and (bottom-margin-collapses-with-children b) (is-box l)) (mbn l) 0.0)
                     (ite (box-collapsed-through b)
                          (min-if (ite (< (mt b) 0.0) (mt b) 0.0) (is-box v) (mbn v))
                          0.0))))))))

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
           [(and (is-width/auto (style.width r)) (not (is-replaced e)))
            (ite (and (not (is-max-width/none (style.max-width r)))
                      (> (- (w p) ml* (bl b) (pl b) (pr b) (br b) mr*)
                         ,(get-px-or-% 'max-width 'w 'b)))
                 (and
                  (= (w b) ,(get-px-or-% 'max-width 'w 'b))
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
    (let ([l (lbox b)] [v (vbox b)])
      (min-max-width
       (ite (is-box l)
            (min (max (stfwidth l) (available-width b)) (stfmax l))
            (ite (is-replaced (box-elt b))
                 (intrinsic-width (box-elt b))
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

  (define-fun resolve-font-size ((b Box)) Real
    (let ([e (box-elt b)])
      ,(smt-cond
        [(is-no-elt e) (font-size (pbox b))]
        [(is-font-size/px (style.font-size (computed-style e)))
         (font-size.px (style.font-size (computed-style e)))]
        [(is-font-size/% (style.font-size (computed-style e)))
         (%of (font-size.% (style.font-size (computed-style e)))
              (font-size (pbox b)))]
        [else ; em
         (%of (* 100 (font-size.em (style.font-size (computed-style e))))
              (font-size (pbox b)))])))

  (define-fun positioned-vertical-layout ((b Box)) Bool
    ;; CSS 2.1 § 10.6.4
    ,(smt-let ([r (computed-style (box-elt b))] [pp (ppflow b)]
               [temp-top ,(get-px-or-% 'top 'h 'b)]
               [temp-bottom ,(get-px-or-% 'bottom 'h 'b)]
               [temp-height (min-max-height (ite (is-replaced (box-elt b)) (intrinsic-height (box-elt b)) ,(get-px-or-% 'height 'h 'b)) b)]
               [top? (not (is-offset/auto (style.top (computed-style (box-elt b)))))]
               [bottom? (not (is-offset/auto (style.bottom (computed-style (box-elt b)))))]
               [height?
                (not (or (is-replaced (box-elt b))
                         (is-height/auto (style.height (computed-style (box-elt b))))))])
       (=> top? (= (top-border b) (+ (top-padding pp) temp-top)))
       (=> height? (= (h b) temp-height))
       (=> (and (not top?) (not bottom?)) (= (y b) (vertical-position-for-flow-boxes b)))
       (=> (and (not height?) (not (and top? bottom?)))
           (= (h b) (auto-height-for-flow-roots b)))
       (=> (and bottom? (not (and top? height?)))
           (= (bottom-border b) (- (bottom-padding pp) temp-bottom)))

       ;; Margins work identically unless overspecified
       (=> (not (and top? height? bottom?))
           (and
            (= (mt b) (margin-min-px (style.margin-top r) b))
            (= (mb b) (margin-min-px (style.margin-bottom r) b))))

       ;; Paragraph before the list, "If none of the three are 'auto'"
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
                    (= (bottom-border b) (- (bottom-padding pp) temp-bottom)))))))


  (define-fun positioned-horizontal-layout ((b Box)) Bool
     ,(smt-let ([r (computed-style (box-elt b))] [pp (ppflow b)] [p (pflow b)]
                [temp-left ,(get-px-or-% 'left 'w 'b)]
                [temp-right ,(get-px-or-% 'right 'w 'b)]
                [temp-width (min-max-width (ite (is-replaced (box-elt b)) (intrinsic-width (box-elt b)) ,(get-px-or-% 'width 'w 'b)) b)]
                [left? (not (is-offset/auto (style.left (computed-style (box-elt b)))))]
                [right? (not (is-offset/auto (style.right (computed-style (box-elt b)))))]
                [width? (not (or (is-replaced (box-elt b)) (is-width/auto (style.width (computed-style (box-elt b))))))])

        (width-set b)

        ;; Margins work identically unless overspecified
        (=> (not (and left? width? right?))
            (and
             (= (ml b) (margin-min-px (style.margin-left r) b))
             (= (mr b) (margin-min-px (style.margin-right r) b))))

        (=> left? (= (left-border b) (+ (left-padding pp) temp-left)))
        (=> width? (and (= (w b) temp-width) (not (w-from-stfwidth b))))
        (=> (and (not width?) (not (and left? right?)))
            (and (= (w b) (usable-stfwidth b))
                 (w-from-stfwidth b)))
        (=> (and (not left?) (not right?))
            (= (left-border b) (left-padding p)))
        (=> (and right? (not (and left? width?)))
            (= (right-border b) (- (right-padding pp) temp-right)))
        (=> (and left? right?) (not (w-from-stfwidth b)))

        (=> (and left? width? right?)
            (=> (not (is-margin/auto (style.margin-left r)))
                (= (ml b) (margin-min-px (style.margin-left r) b)))
            (=> (not (is-margin/auto (style.margin-right r)))
                (= (mr b) (margin-min-px (style.margin-right r) b)))
            (=> (and (is-margin/auto (style.margin-left r)) (is-margin/auto (style.margin-right r)))
                (= (ml b) (mr b)))
            (=> (or (is-margin/auto (style.margin-left r)) (is-margin/auto (style.margin-right r)))
                (= (right-border b) (- (right-padding pp) temp-right))))))

  ;; These three functions define the three types of layouts Cassius
  ;; supports for block boxes: normal in-flow layout, floating layout,
  ;; and positioned layout. By and large, these functions refer to the
  ;; preceding functions.

  (define-fun a-block-flow-box ((b Box)) Bool
    ,(smt-let ([e (box-elt b)] [r (computed-style (box-elt b))]
               [p (pflow b)] [vb (vflow b)] [fb (fflow b)] [lb (lflow b)])

       (ite (is-height/auto (style.height r))
            (= (h b) (auto-height-for-flow-blocks b))
            (= (ite (is-box-sizing/content-box (style.box-sizing r)) (h b) (box-height b))
               (min-max-height ,(get-px-or-% 'height 'h 'b) b)))

       ,@(map extract-field '(mt mb))
       ,@(zero-auto-margins '(top bottom))
       (margins-collapse b)

       (ite (is-flow-root b)
            (and
             ;; TODO: layout of overflow box---it avoids floats in some complicated & stupid way
             true)
            (and
             (flow-horizontal-layout b)
             (= (x b) (+ (left-content p) (ml b)))
             (= (y b) (resolve-clear b (vertical-position-for-flow-boxes b)))))
       (= (ez.out b) (ite (is-box (lbox b)) (ez.out (lbox b)) (ez.in b)))))

  (define-fun a-block-float-box ((b Box)) Bool
    ,(smt-let ([e (box-elt b)] [r (computed-style (box-elt b))]
               [p (pflow b)] [vb (vflow b)] [fb (fflow b)] [lb (lflow b)])

       ,@(map extract-field '(mt mr mb ml))
       ,@(zero-auto-margins '(left right top bottom))
       (margins-dont-collapse b)

       (= (w-from-stfwidth b) (is-width/auto (style.width r)))
       (width-set b)
       (ite (is-width/auto (style.width r))
            (ite (is-replaced e)
                 (= (w b) (intrinsic-width e))
                 (= (w b) (usable-stfwidth b)))
            ;; todo: what do browsers do when (w-from-stfwidth p) and (is-margin/%)?
            (= (ite (is-box-sizing/content-box (style.box-sizing r)) (w b) (box-width b))
               (min-max-width ,(get-px-or-% 'width 'w 'b) b)))

       (ite (is-height/auto (style.height r))
            (ite (is-replaced e)
                 (= (h b) (intrinsic-height e))
                 (=> (width-set b) (= (h b) (auto-height-for-flow-roots b))))
            (= (ite (is-box-sizing/content-box (style.box-sizing r)) (h b) (box-height b))
               (min-max-height ,(get-px-or-% 'height 'h 'b) b)))

       ;; level -> x -> advance -> can-add -> add
       (let* ([ez (ez.in b)]
              [w (- (right-outer b) (left-outer b))]
              [h (- (bottom-outer b) (top-outer b))]
              [y-normal
               (ite (is-no-box vb)
                    (top-content p)
                    (ite (is-box/block (type vb))
                         (bottom-outer vb)
                         (top-content p)))]
              [y* (ez.level ez w (left-content p) (right-content p) y-normal)]
              [y (max y-normal y*)]
              [x* (ez.x ez y (style.float r) (left-content p) (right-content p))]
              [x (ite (is-float/left (style.float r)) x* (- x* w))]
              [ez* (ez.advance ez y)])
         (and
          (= (top-outer b) y)
          (= (left-outer b) x)
          (ez.can-add ez* (+ y h)) ;; This is the key restriction
          (= (ez.out b) (ez.add ez* (style.float r) y (+ w x) (+ h y) x))))))

  (define-fun a-block-positioned-box ((b Box)) Bool
    (and
      (margins-dont-collapse b)
      (positioned-vertical-layout b)
      (positioned-horizontal-layout b)
      (= (ez.out b) (ez.in b))))

  (define-fun a-block-box ((b Box)) Bool
    ,(smt-let ([e (box-elt b)] [r (computed-style (box-elt b))] [p (pflow b)])
       (= (type b) box/block)
       ,@(map extract-field '(pt pr pb pl bt br bb bl))
       (= (stfwidth b) (compute-stfwidth b))
       (= (stfmax b) (max-if (compute-stfmax b) (is-box (vbox b)) (stfmax (vbox b))))
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
       ,@(map extract-field '(bt bb pt pb mt mb))
       (ite (first-box? b)
            (and ,@(map extract-field '(pl bl ml)))
            (and (= (pl b) (bl b) (ml b) 0.0)))
       (ite (last-box? b)
            (and ,@(map extract-field '(pr br mr)))
            (and (= (pr b) (br b) (mr b) 0.0)))

       ,@(zero-auto-margins '(left right top bottom))
       (margins-dont-collapse b)

       (ite (is-position/relative (style.position r))
            (relatively-positioned b)
            (no-relative-offset b))
       (= (font-size b) (resolve-font-size b))
       (= (stfwidth b) (compute-stfwidth b))
       (= (stfmax b) (+ (ite (is-box (vbox b)) (stfmax (vbox b)) 0.0) (compute-stfmax b)))

       ,(smt-cond
         [(is-replaced e)
          (= (h b) (intrinsic-height e))]
         [(not (is-height/auto (style.height r)))
          (= (ite (is-box-sizing/content-box (style.box-sizing r)) (h b) (box-height b))
             (min-max-height ,(get-px-or-% 'height 'h 'b) b))]
         [(is-display/inline-block (style.display r))
          (= (h b) (auto-height-for-flow-roots b))]
         [else
          true])

       ,(smt-cond
         [(is-replaced e)
          (= (w b) (intrinsic-width e))]
         [(not (is-width/auto (style.width r)))
          (= (ite (is-box-sizing/content-box (style.box-sizing r)) (w b) (box-width b))
             (min-max-width ,(get-px-or-% 'width 'w 'b) b))]
         [(is-display/inline-block (style.display r))
          (= (w b) (usable-stfwidth b))]
         [(is-box (fflow b))
          (and
           (= (left-outer (fflow b)) (left-content b))
           (= (right-outer (lflow b)) (right-content b)))]
         [else
          (= (w b) 0.0)])

       (<= (top-content p) (top-outer b) (+ (top-content p) (h p) (- (h b))))
       (=> (is-box v) (= (left-outer b) (right-outer v)))

       (= (ez.out b)
          (ite (is-box (lbox b)) (ez.out (lbox b)) (ez.in b)))))

  (define-fun a-text-box ((b Box)) Bool
    ,(smt-let ([p (pflow b)] [v (vflow b)])
       (= (type b) box/text)
       ;; Only true if there are no wrapping opportunities in the box
       (= (stfwidth b) (max (w b) (ite (is-box (vbox b)) (stfwidth (vbox b)) 0.0)))
       (= (stfmax b)
          (+ (ite (is-box (vbox b)) (stfmax (vbox b)) 0.0)
             (ite (and (= (w b) 0.0) (is-no-box (nbox b))) 5.0 (w b)))) ;; HAXXX
       ;; This is super-weak, but for now it really is our formalization of line layout
       (horizontally-adjacent b p)
       (= (font-size b) (font-size p))

       (no-relative-offset b)
       (zero-box-model b)
       (=> (is-box v) (= (x b) (right-outer v)))
       (= (ez.out b) (ez.in b))))

  (define-fun a-line-box ((b Box)) Bool
    ,(smt-let ([p (pflow b)] [v (vflow b)] [n (nflow b)] [flt (flt b)]
               [f (fflow b)] [l (lflow b)])
       (= (type b) box/line)
       (no-relative-offset b)

       ;; Left-padding is not 0
       (= (mtp b) (mtn b) (mbp b) (mbn b) 0.0)
       (= (mt b) (mr b) (mb b) (ml b) 0.0)
       (= (bt b) (br b) (bb b) (bl b) 0.0)
       (= (pt b) (pr b) (pb b) 0.0)

       (= (pl b) (ite (is-no-box v) ,(get-px-or-% 'text-indent 'w 'p) 0.0))

       (let ([y-normal
              (resolve-clear b (ite (is-no-box v) (top-content p) (bottom-border v)))]
             [ez (ez.in b)])
         (and
          (ez.test (ez.in b) y-normal) ;; Key float restriction
          (= (y b)
             (max y-normal (ez.level ez (stfwidth b) (left-content p) (right-content p) y-normal)))
          (= (left-outer b) (ez.x ez y-normal float/left (left-content p) (right-content p)))
          (= (right-outer b) (ez.x ez y-normal float/right (left-content p) (right-content p)))))

       (= (stfwidth b) (compute-stfwidth b))
       (= (stfmax b) (+ (ite (is-box v) (stfmax v) 0.0) (+ (stfmax (lbox b)) (pl b))))
       (= (font-size b) (font-size p))

       (=> (and (is-text-align/left (textalign b)) (is-box f)) (= (left-outer f) (left-content b)))
       (=> (and (is-text-align/justify (textalign b)) (is-box f))
           (and (= (left-outer f) (left-content b))
                (=> (is-box n) (= (right-outer l) (right-content b)))))
       (=> (and (is-text-align/right (textalign b)) (is-box f)) (= (right-outer l) (right-content b)))
       (=> (and (is-text-align/center (textalign b)) (is-box f))
           (= (- (right-content b) (right-outer l)) (- (left-outer f) (left-content b))))
       (= (ez.out b) (ez.out (lbox b)))))

  (define-fun a-view-box ((b Box)) Bool
    (and
     (= (type b) box/root)
     (zero-box-model b)
     (= (font-size b) 16.0)
     (= (x b) (y b) 0.0)
     (= (xo b) (yo b) 0.0)
     (= (ez.out b) (ez.out (lbox b)))))

  (define-fun a-magic-box ((b Box)) Bool
    (or (is-box/block (type b)) (is-box/inline (type b))))

  (define-fun an-anon-block-box ((b Box)) Bool
    ,(smt-let ([p (pflow b)] [v (vflow b)] [l (lflow b)])
       (= (type b) box/block)
       (no-relative-offset b)
       (zero-box-model-except-collapse b)
       (margins-collapse b)
       (flow-horizontal-layout b)
       (= (stfmax b) (stfmax l))
       (= (stfwidth b) (stfwidth l))
       (= (w b) (w p))
       (= (font-size b) (font-size p))
       (not (w-from-stfwidth b))
       (= (bottom-content b) (bottom-border l))
       (= (y b) (vertical-position-for-flow-boxes b))
       (= (x b) (left-content p))
       (= (ez.out b) (ez.out (lbox b))))))
