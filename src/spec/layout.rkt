#lang racket
(require "../common.rkt")
(require "../smt.rkt")
(require "../dom.rkt")
(require "css-properties.rkt")

(provide layout-definitions)

(define (get-px-or-% prop type wrt b)
  (define r `(computed-style (get/elt (element ,b))))
  `(ite (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) ,r))
        (,(sformat "~a.px" type) (,(sformat "style.~a" prop) ,r))
        (%of (,(sformat "~a.%" type) (,(sformat "style.~a" prop) ,r)) (,wrt (pflow ,b)))))

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

  (define-fun top-margins-collapse-parent ((b Box)) Bool
    (and
     ;; Margins of the root element's box do not collapse.
     (not (is-box/root (type (pflow (pflow b)))))
     ;; Margins between a floated box and any other box do not collapse
     ;; (not even between a float and its in-flow children).
     (is-float/none (float (pflow b)))
     ;; The top margin of an in-flow block element collapses with
     ;; its first in-flow block-level child's top margin if the element
     ;; has no top border, no top padding, and the child has no clearance.
     (= (pt (pflow b)) 0.0) (= (bt (pflow b)) 0.0)))

  (define-fun is-root-elt ((e Element)) Bool
    (is-nil-elt (parent-name e)))

  (define-fun is-flow-root ((b Box)) Bool
    (or (is-box/root (type b))
        (is-root-elt (get/elt (element b)))
        (not (box-in-flow b))
        (not (is-overflow/visible (style.overflow-x (computed-style (get/elt (element b))))))
        (not (is-overflow/visible (style.overflow-y (computed-style (get/elt (element b))))))))

  (define-fun a-view-box ((b Box)) Bool
    (and
     ,@(for/list ([field '(x y xo yo pl pr pt pb bl br bt bb ml mr mt mb mtp mbp mtn mbn)])
         `(= (,field b) 0.0))
     (= (type b) box/root)
     (= (n-name b) nil-box)
     (= (flt-name b) nil-box)
     (= (v-name b) nil-box)))

  (define-fun box-collapsed-through ((b Box)) Bool
    (and (= (box-height b) 0.0)
         (or (is-no-box (lflow b)) (= (box-height (lflow b)) 0.0))))

  (define-fun min-width-limit ((val Real) (e Element)) Real
    ,(smt-cond
      [(is-min-width/px (style.min-width (computed-style e)))
       (max val (min-width.px (style.min-width (computed-style e))))]
      [else ;; %s
       (max val (%of (min-width.% (style.min-width (computed-style e))) (w (pflow (get/box (flow-box e))))))]))
    ;(ite (is-min-width/px (style.min-width (computed-style e)))
    ;    (max val (min-width.px (style.min-width (computed-style e))))
    ;    ;; Leaving here for future percentage support
    ;    val))

  (define-fun max-width-limit ((val Real) (e Element)) Real
    ,(smt-cond
      [(is-max-width/px (style.max-width (computed-style e)))
       (min val (max-width.px (style.max-width (computed-style e))))]
      [(is-max-width/% (style.max-width (computed-style e)))
       (min val (%of (max-width.% (style.max-width (computed-style e))) (w (pflow (get/box (flow-box e))))))]
      [else
       val]))
    ;(ite (is-max-width/px (style.max-width (computed-style e)))
    ;     (min val (max-width.px (style.max-width (computed-style e))))
    ;     ;; Leaving here for future percentage support
    ;     val)

  (define-fun min-height-limit ((val Real) (e Element)) Real
    ,(smt-cond
      [(is-min-height/px (style.min-height (computed-style e)))
       (max val (min-height.px (style.min-height (computed-style e))))]
      [else
       (max val (%of (min-height.% (style.min-height (computed-style e))) (h (pflow (get/box (flow-box e))))))]))
    ;(ite (is-min-height/px (style.min-height (computed-style e)))
    ;    (max val (min-height.px (style.min-height (computed-style e))))
    ;    ;; Leaving here for future percentage support
    ;    val))

  (define-fun max-height-limit ((val Real) (e Element)) Real
    ,(smt-cond
      [(is-max-height/px (style.max-height (computed-style e)))
       (min val (max-height.px (style.max-height (computed-style e))))]
      [(is-max-height/% (style.max-height (computed-style e)))
       (min val (%of (max-height.% (style.max-height (computed-style e))) (h (pflow (get/box (flow-box e))))))]
      [else val]))
    ;;(ite (is-max-height/px (style.max-height (computed-style e)))
    ;    (min val (max-height.px (style.max-height (computed-style e))))
    ;     ;; Leaving here for future percentage support
    ;    ;; val))

  (define-fun margin-min-px ((m Margin) (b Box)) Real
    ,(smt-cond
      [(is-margin/px m) (margin.px m)]
      [(is-margin/% m) (%of (margin.% m) (w (pflow b)))]
      [else 0]))

  (define-fun min-w ((b Box)) Real
    (let ([width (style.width (computed-style (get/elt (element b))))])
      ,(smt-cond
        [(is-width/px width) (width.px width)]
        [(is-width/% width) (%of (width.% width) (w (pflow b)))]
        [else 0])))

  (define-fun min-ml ((b Box)) Real
    (margin-min-px (style.margin-left (computed-style (get/elt (element b)))) b))

  (define-fun min-mr ((b Box)) Real
    (margin-min-px (style.margin-right (computed-style (get/elt (element b)))) b))

  (define-fun top-margin-collapses-with-children ((b Box)) Bool
    (and (not (is-flow-root b)) (= (pt b) 0.0) (= (bt b) 0.0)))

  (define-fun auto-height-for-flow-roots ((b Box)) Real
    ;; The algorithm from section §10.6.7 of CSS 2.1
    ,(smt-cond
      [(is-no-box (real-fbox b)) 0.0]
      [(is-box/line (type (lflow b)))
       ;; If it only has inline-level children, the height is the distance between
       ;; the top of the topmost line box and the bottom of the bottommost line box.
       (- (bottom-border (lflow b)) (top-border (fflow b)))]
      [(is-nil-box (flt-up-name (real-lbox b)))
       (- (bottom-outer (lflow b)) (top-content b))]
      [else
       ;; If it has block-level children, the height is the distance between the
       ;; top margin-edge of the topmost block-level child box and the
       ;; bottom margin-edge of the bottommost block-level child box.
       (- (max (bottom-outer (lflow b)) (bottom-outer (get/box (flt-up-name (real-lbox b)))))
          (top-content b))]))

  (define-fun vertical-position-for-flow-boxes ((b Box)) Real
    ,(smt-cond
      [(is-box (vflow b)) (+ (bottom-border (vflow b)) (max (mtp b) (mbp (vflow b))) (min (mtn b) (mbn (vflow b))))]
      [(top-margin-collapses-with-children (pflow b)) (top-content (pflow b))]
      [else (+ (top-content (pflow b)) (mtp b) (mtn b))]))

  (define-fun a-block-flow-box ((b Box)) Bool
    ,(smt-let ([e (get/elt (element b))] [r (computed-style (get/elt (element b)))]
               [p (pflow b)] [vb (vflow b)] [fb (fflow b)] [lb (lflow b)])

       (= (type b) box/block)
       (= (float b) float/none)

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
               (ite (< (mb b) 0.0) (mb b) 0.0)))

       ,@(for/list ([item '((padding-left padding pl) (padding-right padding pr)
                            (padding-top padding pt) (padding-bottom padding pb)
                            (margin-top margin mt) (margin-bottom margin mb)
                            (border-top-width border bt) (border-right-width border br)
                            (border-bottom-width border bb) (border-left-width border bl))])
           ;; Set properties that are settable with lengths
           (match-define (list prop type field) item)
           `(=> (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) r))
                   (= (,field b) (,(sformat "~a.px" type) (,(sformat "style.~a" prop) r)))))

       (=> (is-width/px (style.width r))
           (and
            (width-set b)
            (not (w-from-stfwidth b))
            (= (ite (is-box-sizing/content-box (style.box-sizing r)) (w b) (box-width b))
               (min-width-limit (max-width-limit (width.px (style.width r)) e) e))))
       (=> (is-height/px (style.height r))
           (= (ite (is-box-sizing/content-box (style.box-sizing r)) (h b) (box-height b))
              (min-height-limit (max-height-limit (height.px (style.height r)) e) e)))

       ,@(for/list ([(dir letter) (in-dict '((left . l) (right . r) (top . t) (bottom . b)))])
           `(and
             (=> (is-margin/% (,(sformat "style.margin-~a" dir) r))
                 (= (,(sformat "m~a" letter) b) (%of (margin.% (,(sformat "style.margin-~a" dir) r)) (w p))))
             (=> (is-border/% (,(sformat "style.border-~a-width" dir) r))
                 (= (,(sformat "b~a" letter) b) (%of (border.% (,(sformat "style.border-~a-width" dir) r)) (w p))))
             (=> (is-padding/% (,(sformat "style.padding-~a" dir) r))
                 (= (,(sformat "p~a" letter) b) (%of (padding.% (,(sformat "style.padding-~a" dir) r)) (w p))))))

       (ite (is-position/relative (style.position r))
            (and
             (=> (is-offset/px (style.left r))
                 (= (xo b) (+ (offset.px (style.left r)) (xo p))))
             (=> (is-offset/% (style.left r))
                 (= (xo b) (+ (%of (offset.% (style.left r)) (w p)) (xo p))))
             (=> (is-offset/px (style.top r))
                 (= (yo b) (+ (offset.px (style.top r)) (yo p))))
             (=> (is-offset/% (style.top r))
                 (= (yo b) (+ (%of (offset.px (style.top r)) (h p)) (yo p))))
             (=> (and (is-offset/auto (style.left r)) (is-offset/px (style.right r)))
                 (= (xo b) (- (xo p) (offset.px (style.right r)))))
             (=> (and (is-offset/auto (style.left r)) (is-offset/% (style.right r)))
                 (= (xo b) (- (xo p) (%of (offset.px (style.right r)) (w p)))))
             (=> (and (is-offset/auto (style.top r)) (is-offset/px (style.bottom r)))
                 (= (yo b) (- (yo p) (offset.px (style.bottom r)))))
             (=> (and (is-offset/auto (style.top r)) (is-offset/% (style.bottom r)))
                 (= (yo b) (- (yo p) (%of (offset.px (style.bottom r)) (w p)))))
             (=> (and (is-offset/auto (style.left r)) (is-offset/auto (style.right r)))
                 (= (xo b) (xo p)))
             (=> (and (is-offset/auto (style.top r)) (is-offset/auto (style.bottom r)))
                 (= (yo b) (yo p))))
            (and
             (= (xo b) (xo p))
             (= (yo b) (yo p))))

       (=> (is-width/% (style.width r))
           (and
            (width-set b)
            (not (w-from-stfwidth b))
            (= (ite (is-box-sizing/content-box (style.box-sizing r)) (w b) (box-width b))
               (min-width-limit (max-width-limit
                                 (ite (w-from-stfwidth p)
                                      0.0
                                      (%of (width.% (style.width r)) (w p))) e) e))))
       (=> (is-height/% (style.height r))
           (= (ite (is-box-sizing/content-box (style.box-sizing r)) (h b) (box-height b))
              (min-height-limit (max-height-limit (%of (height.% (style.height r)) (h p)) e) e)))

       ;; CSS § 10.3.3: Block-level, non-replaced elements in normal flow
       ;; The following constraints must hold among the used values of the other properties:
       ;; 'margin-left' + 'border-left-width' + 'padding-left' + 'width' + 'padding-right' + 'border-right-width' + 'margin-right' = width of containing block
       (= (w p) (+ (ml b) (box-width b) (mr b)))

       (let ([w* (min-width-limit (max-width-limit (min-w b) e) e)]
             [ml* (min-ml b)]
             [mr* (min-mr b)])
         (let ([overflow? (> (+ ml* (bl b) (pl b) w* (pr b) (br b) mr*) (w p))])
           (and

            (not (w-from-stfwidth b))

            ;; It overflows. So what do we do? Ignore margin-right
            (=> overflow? (and (= (w b) w*) (= (ml b) ml*) (width-set b)))

            ;; No overflow, but width: auto, so width dominates
            (=> (and (not overflow?)) (is-width/auto (style.width r))
                (and (= (ml b) ml*) (= (mr b) mr*) (width-set b)))

            ;; No overflow, width given, ignore auto margin
            (=> (and (not overflow?)
                     (not (is-width/auto (style.width r))))
                (and (= (w b) w*)
                     (width-set b)
                     (=> (not (is-margin/auto (style.margin-left r)))
                         (= (ml b) ml*))
                     (=> (and
                          (is-margin/auto (style.margin-left r))
                          (not (is-margin/auto (style.margin-right r))))
                         (= (mr b) mr*))))

            ;; No overflow, margin: ? auto, so centered
            (=> (and (not overflow?)
                     (not (is-width/auto (style.width r)))
                     (is-margin/auto (style.margin-left r))
                     (is-margin/auto (style.margin-right r)))
                (and (= (w b) w*) (= (ml b) (mr b)) (width-set b))))))

       (let ([l (real-lbox b)] [v (real-vbox b)])
         (= (stfwidth b)
            (ite (is-width/auto (style.width r))
                 (max (ite (is-box l)
                           (+ (min-ml l) (bl l) (pl l)
                              (min (w l) (stfwidth l))
                              (pr l) (br l) (min-mr l)) 0)
                      (ite (is-box v) (stfwidth v) 0.0))
                 (w b))))

       ;; Width and horizontal margins out of the way, let's do height and vertical margins
       ;; CSS § 10.6.3 If 'margin-top', or 'margin-bottom' are 'auto', their used value is 0.
       (=> (is-margin/auto (style.margin-top r)) (= (mt b) 0.0))
       (=> (is-margin/auto (style.margin-bottom r)) (= (mb b) 0.0))

       ;; If 'height' is 'auto', the height depends on whether the element has
       ;; any block-level children and whether it has padding or borders:
       (=> (is-height/auto (style.height r))
           ,(smt-cond
             ;; CSS § 10.6.6, first bullet
             [(is-flow-root b)
              (= (h b) (auto-height-for-flow-roots b))]
             ;; CSS § 10.6.3, item 4
             [(is-no-box lb)
              (= (h b) 0.0)]
             ;; CSS § 10.6.3, item 1
             [(is-box/line (type lb))
              (=> (width-set b) (= (bottom-content b) (bottom-border lb)))]
             [(is-box/block (type lb))
              (= (bottom-content b)
                 ;; CSS § 10.6.3, item 2
                 (ite (and (= (pb b) 0.0) (= (bb b) 0.0) (not (is-root-elt e)))
                      (ite (and (not (box-collapsed-through b)) (box-collapsed-through lb))
                           ;; CSS § 10.6.3, item 3
                           (- (bottom-border lb) (mtp lb) (mtn lb))
                           (bottom-border lb)) ; Collapsed bottom margin
                      (bottom-outer lb)))] ; No collapsed bottom margin
             ;; Block boxes may only have line or block children
             [else false]))

       ;; Computing X and Y position
       (= (x b) (+ (left-content p) (ml b)))
       (= (y b) (vertical-position-for-flow-boxes b))

       ,@(for/list ([field '(bl br bt bb pl pr pb pt w h)])
           `(>= (,field b) 0.0))))

  (define-fun a-block-float-box ((b Box)) Bool
    ,(smt-let ([e (get/elt (element b))] [r (computed-style (get/elt (element b)))]
               [p (pflow b)] [vb (vflow b)] [fb (fflow b)] [lb (lflow b)] [flt (fltbox b)])

       (= (type b) box/block)
       (= (mtp b) (max (mt b) 0.0))
       (= (mtn b) (min (mt b) 0.0))
       (= (mbp b) (max (mb b) 0.0))
       (= (mbn b) (min (mb b) 0.0))

       ;; Floating block element layout
       ,@(for/list ([item '((padding-left padding pl) (padding-right padding pr)
                            (padding-top padding pt) (padding-bottom padding pb)
                            (border-top-width border bt) (border-right-width border br)
                            (border-bottom-width border bb) (border-left-width border bl)
                            (margin-top margin mt) (margin-bottom margin mb)
                            (margin-right margin mr) (margin-left margin ml))])
           (match-define (list prop type field) item)
           `(and
             (=> (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) r))
                 (= (,field b) (,(sformat "~a.px" type) (,(sformat "style.~a" prop) r))))
             (=> (,(sformat "is-~a/%" type) (,(sformat "style.~a" prop) r))
                 (= (,field b) (%of (,(sformat "~a.%" type) (,(sformat "style.~a" prop) r)) (w p))))))

       (=> (is-width/px (style.width r))
           (and
            (width-set b)
            (not (w-from-stfwidth b))
            (= (ite (is-box-sizing/content-box (style.box-sizing r)) (w b) (box-width b))
               (min-width-limit (max-width-limit (width.px (style.width r)) e) e))))
       (=> (is-width/% (style.width r))
           (and (width-set b)
                (not (w-from-stfwidth b))
                ;; TODO: what if (w-from-stfwidth p)
                (= (ite (is-box-sizing/content-box (style.box-sizing r)) (w b) (box-width b))
                   (min-width-limit (max-width-limit (%of (width.% (style.width r)) (w p)) e) e))))
       (=> (is-height/px (style.height r))
           (= (ite (is-box-sizing/content-box (style.box-sizing r)) (h b) (box-height b))
              (min-height-limit (max-height-limit (height.px (style.height r)) e) e)))
       (=> (is-height/% (style.height r))
           (= (ite (is-box-sizing/content-box (style.box-sizing r)) (h b) (box-height b))
              (min-height-limit (max-height-limit (%of (height.% (style.height r)) (h p)) e) e)))


       ;; If 'margin-left', or 'margin-right' are computed as 'auto', their used value is '0'.
       ,@(for/list ([(dir letter) (in-dict '((left . l) (right . r) (top . t) (bottom . b)))])
           `(=> (is-margin/auto (,(sformat "style.margin-~a" dir) r))
                 (= (,(sformat "m~a" letter) b) 0)))

       (ite (is-position/relative (style.position r))
            (and
             (=> (is-offset/px (style.left r))
                 (= (xo b) (+ (offset.px (style.left r)) (xo p))))
             (=> (is-offset/% (style.left r))
                 (= (xo b) (+ (%of (offset.% (style.left r)) (w p)) (xo p))))
             (=> (is-offset/px (style.top r))
                 (= (yo b) (+ (offset.px (style.top r)) (yo p))))
             (=> (is-offset/% (style.top r))
                 (= (yo b) (+ (%of (offset.px (style.top r)) (h p)) (yo p))))
             (=> (and (is-offset/auto (style.left r)) (is-offset/px (style.right r)))
                 (= (xo b) (- (xo p) (offset.px (style.right r)))))
             (=> (and (is-offset/auto (style.left r)) (is-offset/% (style.right r)))
                 (= (xo b) (- (xo p) (%of (offset.px (style.right r)) (w p)))))
             (=> (and (is-offset/auto (style.top r)) (is-offset/px (style.bottom r)))
                 (= (yo b) (- (yo p) (offset.px (style.bottom r)))))
             (=> (and (is-offset/auto (style.top r)) (is-offset/% (style.bottom r)))
                 (= (yo b) (- (yo p) (%of (offset.px (style.bottom r)) (w p)))))
             (=> (and (is-offset/auto (style.left r)) (is-offset/auto (style.right r)))
                 (= (xo b) (xo p)))
             (=> (and (is-offset/auto (style.top r)) (is-offset/auto (style.bottom r)))
                 (= (yo b) (yo p))))
            (and
             (= (xo b) (xo p))
             (= (yo b) (yo p))))

       ,(smt-let ([l (real-lbox b)] [v (real-vbox b)])
         (=> (is-width/auto (style.width r))
             (and
              (width-set b)
              (w-from-stfwidth b)
              (= (w b) (min-width-limit (max-width-limit (ite (is-box l) (+ (min-ml l) (bl l) (pl l) (stfwidth l) (pr l) (br l) (min-mr l)) 0.0) e) e))))
         (= (stfwidth b)
            (ite (is-width/auto (style.width r))
                 (max
                  (ite (is-box l) (+ (min-ml l) (bl l) (pl l) (min (w l) (stfwidth l)) (pr l) (br l) (min-mr l)) 0.0)
                  (ite (is-box v) (stfwidth v) 0.0))
                 (w b))))

       ;; CSS 2.1 § 10.6.7 : In certain cases, the height of an
       ;; element that establishes a block formatting context is computed as follows:
       (=> (and (width-set b) (is-height/auto (style.height r)))
           (= (h b) (auto-height-for-flow-roots b)))

       ;; TODO : In addition, if the element has any floating descendants whose bottom margin edge
       ;; is below the element's bottom content edge, then the height is increased to include
       ;; those edges. Only floats that participate in this block formatting context are taken
       ;; into account, e.g., floats inside absolutely positioned descendants or other floats
       ;; are not.

       ;; Positivity constraint
       ;; CSS 2.1 § 9.5.1 : When the float occurs between two collapsing margins, the float is
       ;; positioned as if it had an otherwise empty anonymous block parent taking part in the flow.
       ;; The position of such a parent is defined by the rules in the section on margin collapsing.

       ,@(for/list ([field '(bl br bt bb pl pr pb pt w h)])
           `(>= (,field b) 0.0))

       ;; CSS 2.1, § 9.5.1, item 1: The left outer edge of a left-floating box
       ;; may not be to the left of the left edge of its containing block.
       (=> (is-float/left (float b)) (>= (left-outer b) (left-content p)))
       (=> (is-float/right (float b)) (>= (right-content p) (right-outer b)))

       ;; CSS 2.1, § 9.5.1, item 2: If the current box is left-floating,
       ;; and there are any left-floating boxes generated by elements
       ;; earlier in the source document, then for each such earlier box,
       ;; either the left outer edge of the current box must be to the right
       ;; of the right outer edge of the earlier box, or its top must be lower
       ;; than the bottom of the earlier box.
       ;; SIMPL: either to the right of the previous float, or below it.

       ;; TODO: This doesn't take into account that it's just interactions of
       ;; left floats with left floats, right floats with right floats
       (or (is-no-box flt)
           (ite (is-float/left (float b))
                (or (= (left-outer b) (right-outer flt)) (>= (top-outer b) (bottom-outer flt)))
                (or (= (right-outer b) (left-outer flt)) (>= (top-outer b) (bottom-outer flt)))))


       ;; CSS 2.1, § 9.5.1, item 3: The right outer edge of a left-floating box
       ;; may not be to the right of the left outer edge of any right-floating box
       ;; that is next to it. Analogous rules hold for right-floating elements.
       ;; TODO: Currently impossible --- see restrictions below

       ;; CSS 2.1, § 9.5.1, item 4: A floating box's outer top may not be higher
       ;; than the top of its containing block. When the float occurs between
       ;; two collapsing margins, the float is positioned as if it had an otherwise
       ;; empty anonymous block parent taking part in the flow. The position of such
       ;; a parent is defined by the rules in the section on margin collapsing.
       (>= (top-outer b) (top-content p))

       ;; CSS 2.1, § 9.5.1, item 5: The outer top of a floating box
       ;; may not be higher than the outer top of any block or floated box
       ;; generated by an element earlier in the source document.
       ;; CSS 2.1 § 9.5.1, item 6: The outer top of an element's floating box
       ;; may not be higher than the top of any line-box containing a box
       ;; generated by an element earlier in the source document.
       ;; SIMPL: May not be higher than the top of the previous float or flow box
       (=> (is-box flt) (>= (top-outer b) (top-outer flt)))
       (=> (is-box vb) (>= (top-outer b) (top-outer vb)))
       (=> (and (is-box vb) (is-box (lflow vb)))
           (>= (top-outer b) (top-outer (lflow vb))))

       ;; CSS 2.1, § 9.5.1, item 7: A left-floating box that has another
       ;; left-floating box to its left may not have its right outer edge
       ;; to the right of its containing block's right edge.
       ;; (Loosely: a left float may not stick out at the right edge,
       ;; unless it is already as far to the left as possible.)

       ;; TODO: This doesn't take into account that it's just interactions of
       ;; left floats with left floats, right floats with right floats
       (=> (and (is-box flt) (< (x flt) (x b)) (horizontally-adjacent b flt)
                (is-float/left (float b)))
           (<= (right-outer b) (right-content p)))
       (=> (and (is-box flt) (> (x flt) (x b)) (horizontally-adjacent b flt)
                (is-float/right (float b)))
           (>= (left-outer b) (left-content p)))

       ;; CSS 2.1, § 9.5.1, item 8: A floating box must be placed as high as possible.
       ;; SIMPL: at its normal position, or the same y-position as previous float
       (or (= (top-outer b) (ite (is-no-box vb) (top-content p) (bottom-outer vb)))
           (and (is-box flt) (= (top-outer b) (top-outer flt)))
           (and (is-box flt) (= (top-outer b) (bottom-outer flt))))

       ;; CSS 2.1, § 9.5.1, item 9: A left-floating box must be put as far to the left
       ;; as possible, a right-floating box as far to the right as possible. A higher
       ;; position is preferred over one that is further to the left/right.
       ;; SIMPL: at the left/right or next to an existing floating box

       ;; TODO: This doesn't take into account that it's just interactions of
       ;; left floats with left floats, right floats with right floats
       (=> (is-float/left (float b))
           (or (= (left-outer b) (left-content p))
               (and (is-box flt) (is-float/left (float flt))
                    (horizontally-adjacent b flt)
                    (= (left-outer b) (right-outer flt)))))
       (=> (is-float/right (float b))
           (or (= (right-outer b) (right-content p))
               (and (is-box flt) (is-float/left (float flt))
                    (horizontally-adjacent b flt)
                    (= (right-outer b) (left-outer flt)))))

       ;; Four restrictions on floats to make solving efficient

       ;; R1: No negative margins on floats; otherwise they can overlap
       (! (and ,@(for/list ([m '(mt mr mb ml)]) `(>= (,m b) 0.0)))
          :named restriction-1)
       ;; R2: The bottom of a box is farther down than the bottom of the previous box
       ;; Otherwise, they can make little pyramids
       (! (=> (is-box flt) (>= (bottom-outer b) (bottom-outer flt)))
          :named restriction-2)
       ;; R3: If a float wraps to the next line, the previous line must be full
       (! (=> (and (is-box flt) (= (top-outer b) (bottom-outer flt)))
              (ite (is-float/left (float b))
                   (>= (right-outer flt) (right-content p))
                   (<= (left-outer flt) (left-content p))))
          :named restriction-3)
       ;; R4: If this and the previous float float to different sides,
       ;; they are not horizontally adjacent
       (! (=> (and (is-box flt) (not (= (float flt) (float b))))
              (not (horizontally-adjacent flt b)))
          :named restriction-4)))

  (define-fun a-block-positioned-box ((b Box)) Bool
    ,(smt-let ([e (get/elt (element b))] [r (computed-style (get/elt (element b)))]
               [p (pflow b)] [pp (ppbox b)])

       (= (type b) box/block)
       (= (mtp b) (max (mt b) 0.0))
       (= (mtn b) (min (mt b) 0.0))
       (= (mbp b) (max (mb b) 0.0))
       (= (mbn b) (min (mb b) 0.0))

       ;; Floating block element layout
       ,@(for/list ([item '((padding-left padding pl) (padding-right padding pr)
                            (padding-top padding pt) (padding-bottom padding pb)
                            (border-top-width border bt) (border-right-width border br)
                            (border-bottom-width border bb) (border-left-width border bl))])
           (match-define (list prop type field) item)
           `(and
             (=> (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) r))
                 (= (,field b) (,(sformat "~a.px" type) (,(sformat "style.~a" prop) r))))
             (=> (,(sformat "is-~a/%" type) (,(sformat "style.~a" prop) r))
                 (= (,field b) (%of (,(sformat "~a.%" type) (,(sformat "style.~a" prop) r)) (w p))))))

       (= (xo b) (xo p))
       (= (yo b) (yo p))

       (let ([l (real-lbox b)] [v (real-vbox b)])
         (= (stfwidth b)
            (ite (is-width/auto (style.width r))
                 (max
                  (ite (is-box l) (+ (min-ml l) (bl l) (pl l) (min (w l) (stfwidth l)) (pr l) (br l) (min-mr l)) 0.0)
                  (ite (is-box v) (stfwidth v) 0.0))
                 (w b))))

       ;; Phase 1: Height, via CSS 2.1 § 10.6.4, h, y, mt, mb
       ,(smt-let ([temp-top ,(get-px-or-% 'top 'offset 'h 'b)]
                  [temp-bottom ,(get-px-or-% 'bottom 'offset 'h 'b)]
                  [temp-height ,(get-px-or-% 'height 'height 'h 'b)]
                  [top? (not (is-offset/auto (style.top r)))]
                  [bottom? (not (is-offset/auto (style.bottom r)))]
                  [height? (not (is-height/auto (style.height r)))])

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
                       (= (bottom-border b) (- (bottom-content pp) temp-bottom))))))

       ;; Phase 1: Height, via CSS 2.1 § 10.6.4, h, y, mt, mb
       ,(smt-let ([temp-left ,(get-px-or-% 'left 'offset 'w 'b)]
                  [temp-right ,(get-px-or-% 'right 'offset 'w 'b)]
                  [temp-width ,(get-px-or-% 'width 'width 'w 'b)]
                  [left? (not (is-offset/auto (style.left r)))]
                  [right? (not (is-offset/auto (style.right r)))]
                  [width? (not (is-width/auto (style.width r)))])

          (width-set b)

          ;; Margins work identically unless overspecified
          (=> (not (and left? width? right?))
              (and
               (= (ml b) (margin-min-px (style.margin-left r) b))
               (= (mr b) (margin-min-px (style.margin-right r) b))))

          (=> left? (= (left-border b) (+ (left-content pp) temp-left)))
          (=> width? (and (= (w b) temp-width) (not (w-from-stfwidth b))))
          (=> (and (not width?) (not (and left? right?)))
              (and (= (w b)
                      (let ([l (real-lbox b)] [v (real-vbox b)])
                        (min-width-limit (max-width-limit (ite (is-box l) (+ (min-ml l) (bl l) (pl l) (min (w l) (stfwidth l)) (pr l) (br l) (min-mr l)) 0.0) e) e)))
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
                  (= (right-border b) (- (right-content pp) temp-right)))))))

  (define-fun an-inline-box ((b Box)) Bool
    ,(smt-let ([e (get/elt (element b))] [p (pflow b)] [v (vflow b)] [l (lflow b)]
               [r (computed-style (get/elt (element b)))])
       (= (type b) box/inline)

       ;; The ‘width’ and ‘height’ properties do not apply. For each
       ;; of ‘left’, ‘right’, ‘top’, ‘bottom’, ‘margin-left’,
       ;; ‘margin-right’, ‘margin-top’ and ‘margin-bottom’, the used
       ;; value is equal to the computed value, except that a computed
       ;; value of ‘auto’ becomes a used value of ‘0’.
       ,@(for/list ([item '((padding-left padding pl) (padding-right padding pr)
                            (padding-top padding pt) (padding-bottom padding pb)
                            (margin-top margin mt) (margin-bottom margin mb)
                            (margin-right margin mr) (margin-left margin ml))])
           (match-define (list prop type field) item)
           `(=> (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) r))
                (= (,field b) (,(sformat "~a.px" type) (,(sformat "style.~a" prop) r)))))

       ,@(for/list ([(dir letter) (in-dict '((left . l) (right . r) (top . t) (bottom . b)))])
           `(= (,(sformat "b~a" letter) b)
               (ite (and (is-border/px (,(sformat "style.border-~a-width" dir) r))
                         (not (is-border-style/none (,(sformat "style.border-~a-style" dir) r)))
                         (not (is-border-style/hidden (,(sformat "style.border-~a-style" dir) r))))
                    (border.px (,(sformat "style.border-~a-width" dir) r))
                    0.0)))

       ,@(for/list ([(dir letter) (in-dict '((left . l) (right . r) (top . t) (bottom . b)))])
           `(and
             (=> (is-margin/auto (,(sformat "style.margin-~a" dir) r))
                 (= (,(sformat "m~a" letter) b) 0))
             (=> (is-margin/% (,(sformat "style.margin-~a" dir) r))
                 (= (,(sformat "m~a" letter) b) (%of (margin.% (,(sformat "style.margin-~a" dir) r)) (w p))))
             (=> (is-border/% (,(sformat "style.border-~a-width" dir) r))
                 (= (,(sformat "b~a" letter) b) (%of (border.% (,(sformat "style.border-~a-width" dir) r)) (w p))))
             (=> (is-padding/% (,(sformat "style.padding-~a" dir) r))
                 (= (,(sformat "p~a" letter) b) (%of (padding.% (,(sformat "style.padding-~a" dir) r)) (w p))))))
       (= (mtp b) (max (mt b) 0.0))
       (= (mtn b) (min (mt b) 0.0))
       (= (mbp b) (max (mb b) 0.0))
       (= (mbn b) (min (mb b) 0.0))
       (= (xo b) (xo p))
       (= (yo b) (yo p))

       (let ([l* (real-lbox b)] [v* (real-vbox b)])
         (= (stfwidth b)
            (max (ite (is-box l*) (+ (min-ml l*) (bl l*) (pl l*) (stfwidth l*) (pr l*) (br l*) (min-mr l*)) 0.0)
                 (ite (is-box v*) (stfwidth v*) 0.0))))

       (= (left-outer (fflow b)) (left-content b))
       (= (right-outer (lflow b)) (right-content b))
       ;; This is maybe too loose
       (<= (top-content p) (y b) (+ (top-content p) (h p) (- (h b))))
       ;; This is maybe too tight
       ;;(= (- (top-outer b) (top-content p)) (- (bottom-content p) (bottom-outer b)))
       (=> (is-box v) (= (left-outer b) (right-outer v)))))

  (define-fun a-text-box ((b Box)) Bool
    ,(smt-let ([p (pflow b)] [v (vflow b)])
       (= (type b) box/text)

       ;; Only true if there are no wrapping opportunities in the box
       (= (stfwidth b) (max (w b) (ite (is-box (real-vbox b)) (stfwidth (real-vbox b)) 0.0)))

       (= (xo b) (xo p))
       (= (yo b) (yo p))
       ,@(for/list ([field '(mtp mtn mbp mbn mt mr mb ml pt pr pb pl bt br bb bl)])
           `(= (,field b) 0.0))

       ;; This is super-weak, but for now it really is our formalization of line layout
       (horizontally-adjacent b p)
       (=> (is-box v) (= (x b) (right-border v)))))

  (define-fun a-line-box ((b Box)) Bool
    ,(smt-let ([p (pflow b)] [v (vflow b)] [n (nflow b)] [flt (fltbox b)]
               [f (fflow b)] [l (lflow b)])
       (= (type b) box/line)

       (= (xo b) (xo p))
       (= (yo b) (yo p))
       ,@(for/list ([field '(mtp mtn mbp mbn mt mr mb ml pt pr pb pl bt br bb bl)])
           `(= (,field b) 0.0))

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
                 (= (v-name b) (v-name flt)))])
         (and
          (=> c (= (top-outer b) (bottom-outer flt)))
          (=> (and (not c) (is-no-box v)) (= (y b) (top-content p)))
          (=> (and (not c) (is-box v)) (= (y b) (bottom-border v)))))

       (let ([l* (real-lbox b)] [v* (real-vbox b)])
         (= (stfwidth b)
            (min (w b)
                 (max
                  (ite (is-box l*) (+ (min-ml l*) (bl l*) (pl l*) (stfwidth l*) (pr l*) (br l*) (min-mr l*)) 0.0)
                  (ite (is-box v*) (stfwidth v*) 0.0)))))

       (=> (is-text-align/left (textalign b)) (= (left-border f) (left-content b)))
       (=> (is-text-align/justify (textalign b))
           (and (= (left-border f) (left-content b))
                (=> (is-no-box n) (= (right-border l) (right-content b)))))
       (=> (is-text-align/right (textalign b)) (= (right-border l) (right-content b)))
       (=> (is-text-align/center (textalign b))
           (= (- (right-content b) (right-border l)) (- (left-border f) (left-content b))))))

  (define-fun a-block-box ((b Box)) Bool
    (ite (! (or (is-position/fixed (position b)) (is-position/absolute (position b))) :named positioned)
         (a-block-positioned-box b)
         (ite (! (is-float/none (float b)) :named flow)
              (a-block-flow-box b)
              (a-block-float-box b))))

  (define-fun a-magic-box ((b Box)) Bool
    (or (is-box/block (type b)) (is-box/inline (type b))))

  (define-fun an-anon-block-box ((b Box)) Bool
    ,(smt-let ([p (pflow b)] [v (vflow b)] [l (lflow b)])
       (a-block-flow-box b)
       (= (w b) (w p))
       (not (w-from-stfwidth b))
       (= (bottom-content b) (bottom-border l))
       (ite (is-box v)
            (= (y b) (+ (bottom-border v) (mbp v) (mbn v)))
            (= (y b) (top-content p)))
       (= (x b) (left-content p))
       (= (mt b) (mr b) (mb b) (ml b) 0.0)
       (= (bt b) (br b) (bb b) (bl b) 0.0)
       (= (pt b) (pr b) (pb b) (pl b) 0.0))))
