#lang racket
(require "../common.rkt")
(require "../smt.rkt")
(require "../dom.rkt")

(require unstable/sequence)
(provide layout-definitions)

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

  (define-fun box-width ((box Box)) Real  (+ (bl box) (pl box) (w box) (pr box) (br box)))
  (define-fun box-height ((box Box)) Real (+ (bt box) (pt box) (h box) (pb box) (bb box)))

  (define-fun max ((x Real) (y Real)) Real (ite (< x y) y x))
  (define-fun min ((x Real) (y Real)) Real (ite (< x y) x y))
  (define-fun between ((x Real) (y Real) (z Real)) Bool
    (or (<= x y z) (>= x y z)))

  (define-fun horizontally-adjacent ((box1 Box) (box2 Box)) Bool
    (or (> (bottom-outer box1) (top-outer box2) (top-outer box1))
        (> (bottom-outer box2) (top-outer box1) (top-outer box2))))

  (define-fun an-element ((e Element)) Bool
    ,(smt-let ([r (rules e)] [b (get/box (flow-box e))])
       (= (textalign e)
          (ite (is-text-align/inherit (style.text-align r))
               (textalign (parent e))
               (style.text-align r)))
       (=> (is-display/inline (display e)) (is-float/none (float e)))
       (= (float e)
          (ite (is-float/inherit (style.float r)) (float (parent e)) (style.float r)))))

  (define-fun a-root-element ((e Element)) Bool
    ,(smt-let ([b (get/box (flow-box e))])
       (= (tagname e) no-tag)
       (= (float e) float/none)
       (= (textalign e) text-align/left)
       ,@(for/list ([field '(x y pl pr pt pb bl br bt bb ml mr mt mb mtp mbp mtn mbn)])
           `(= (,field b) 0.0))
       (= (type b) box/root)
       (= (n-name b) nil-box)
       (= (flt-name b) nil-box)
       (= (v-name b) nil-box)))

  (define-fun a-block-flow-box ((b Box)) Bool
    ,(smt-let ([e (get/elt (element b))] [r (rules (get/elt (element b)))]
               [p (pbox b)] [vb (vbox b)] [fb (fbox b)] [lb (lbox b)])

       (= (type b) box/block)

       ;; Computing maximum collapsed positive and negative margin
       (= (mtp b)
          (max (ite (> (mt b) 0.0) (mt b) 0.0)
               (ite (and (not (= (tagname e) tag/html)) (is-box fb)
                         (= (pt b) 0.0) (= (bt b) 0.0)) (mtp fb) 0.0)))
       (= (mtn b)
          (min (ite (< (mt b) 0.0) (mt b) 0.0)
               (ite (and (not (= (tagname e) tag/html)) (is-box fb)
                         (= (pt b) 0.0) (= (bt b) 0.0)) (mtn fb) 0.0)))
       (= (mbp b)
          (max (ite (> (mb b) 0.0) (mb b) 0.0)
               (ite (and (not (= (tagname e) tag/html)) (is-box lb)
                         (= (pb b) 0.0) (= (bb b) 0.0)) (mbp lb) 0.0)))
       (= (mbn b)
          (min (ite (< (mb b) 0.0) (mb b) 0)
               (ite (and (not (= (tagname e) tag/html)) (is-box lb)
                         (= (pb b) 0.0) (= (bb b) 0.0)) (mbn lb) 0.0)))

       ,@(for/list ([item '((width width w) (height height h)
                            (padding-left padding pl) (padding-right padding pr)
                            (padding-top padding pt) (padding-bottom padding pb)
                            (border-top border bt) (border-right border br)
                            (border-bottom border bb) (border-left border bl)
                            (margin-top margin mt) (margin-bottom margin mb))])
           ;; Set properties that are settable with lengths
           (match-define (list prop type field) item)
           `(=> (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) r))
                (= (,field b) (,(sformat "~a.px" type) (,(sformat "style.~a" prop) r)))))
       
       ;; CSS § 10.3.3: Block-level, non-replaced elements in normal flow
       ;; The following constraints must hold among the used values of the other properties:
       ;; 'margin-left' + 'border-left-width' + 'padding-left' + 'width' + 'padding-right' + 'border-right-width' + 'margin-right' = width of containing block
       (= (w p) (+ (ml b) (box-width b) (mr b)))

       ,(smt-cond
         ;; See CSS § 10.3.3
         [(> (+ (ite (is-width/auto (style.width r)) 0.0 (width.px (style.width r)))
                (ite (is-margin/auto (style.margin-left r)) 0.0 (margin.px (style.margin-left r)))
                (ite (is-margin/auto (style.margin-right r)) 0.0 (margin.px (style.margin-right r)))
                (pl b) (pr b) (bl b) (br b))
             (w p))
          ;; It overflows. So what do we do? This is what Chrome & Firefox do (but see CSS § 10.3.3)
          (and
           (= (w b) (ite (is-width/auto (style.width r)) 0.0 (width.px (style.width r))))
           (= (ml b) (ite (is-margin/auto (style.margin-left r)) 0.0 (margin.px (style.margin-left r)))))]
         [(is-width/auto (style.width r))
          ;; If it does not overflow, we set everything, and just figure out what to constrain.
          (and
           (= (ml b) (ite (is-margin/auto (style.margin-left r)) 0.0 (margin.px (style.margin-left r))))
           (= (mr b) (ite (is-margin/auto (style.margin-right r)) 0.0 (margin.px (style.margin-right r)))))]
         [else
          (and
           (= (w b) (width.px (style.width r)))
           (=> (and (is-margin/auto (style.margin-left r)) (is-margin/auto (style.margin-right r)))
               (= (ml b) (mr b)))
           (=> (is-margin/px (style.margin-left r)) (= (ml b) (margin.px (style.margin-left r))))
           (=> (and (is-margin/px (style.margin-right r)) (is-margin/auto (style.margin-left r)))
               (= (mr b) (margin.px (style.margin-right r)))))])

       ;; Width and horizontal margins out of the way, let's do height and vertical margins
       ;; CSS § 10.6.3 If 'margin-top', or 'margin-bottom' are 'auto', their used value is 0.
       (=> (is-margin/auto (style.margin-top r)) (= (mt b) 0.0))
       (=> (is-margin/auto (style.margin-bottom r)) (= (mb b) 0.0))

       ;; If 'height' is 'auto', the height depends on whether the element has
       ;; any block-level children and whether it has padding or borders:
       (=> (is-height/auto (style.height r))
           ,(smt-cond
             ;; CSS § 10.6.3, item 1: the bottom edge of the last line box,
             ;; if the box establishes a inline formatting context with one or more lines
             [(and (is-box lb) (is-box/line (type lb)))
              (= (bottom-content b) (bottom-border lb))]
             [(and (is-box lb) (is-box/block (type lb)))
              (= (bottom-content b)
                 ;; CSS § 10.6.3, item 2: the bottom edge of the bottom
                 ;; (possibly collapsed) margin of its last in-flow child,
                 ;; if the child's bottom margin does not collapse with the
                 ;; element's bottom margin
                 (ite (and (= (pb b) 0.0) (= (bb b) 0.0) (not (= (tagname e) tag/html)))
                      (bottom-border lb) ; Collapsed bottom margin
                      (bottom-outer lb)))] ; No collapsed bottom margin
             ;; CSS § 10.6.3, item 3: the bottom border edge of the last in-flow child
             ;; whose top margin doesn't collapse with the element's bottom margin
             ;; NOTE: This can happen if the box height is 0.
             ;; We don't support that, so it's not an issue.

             ;; CSS § 10.6.3, item 4: zero, otherwise
             [else (= (h b) 0.0)]))

       ;; Computing X and Y position
       (= (x b) (+ (left-content p) (ml b)))
       (= (y b)
          (ite (is-no-box vb)
           (ite (and
                 ;; Margins of the root element's box do not collapse. 
                 (not (is-box/root (type (pbox p))))
                 ;; Margins between a floated box and any other box do not collapse
                 ;; (not even between a float and its in-flow children). 
                 (is-float/none (float (get/elt (element p))))
                 ;; The top margin of an in-flow block element collapses with
                 ;; its first in-flow block-level child's top margin if the element
                 ;; has no top border, no top padding, and the child has no clearance. 
                 (= (pt p) 0.0) (= (bt p) 0.0))
                (top-content p)
                (+ (top-content p) (+ (mtp b) (mtn b))))
           (+ (bottom-border vb) (max (mbp vb) (mtp b)) (min (mbn vb) (mtn b)))))

       ;; Positivity constraint---otherwise floats can overlap
       (> (box-height b) 0.0)

       ,@(for/list ([field '(pl pr pb pt w h)])
           `(>= (,field b) 0.0))
       ,@(for/list ([field '(bl br bt bb)])
           `(= (,field b) 0.0))))

  (define-fun a-block-float-box ((b Box)) Bool
    ,(smt-let ([e (get/elt (element b))] [r (rules (get/elt (element b)))]
               [p (pbox b)] [vb (vbox b)] [fb (fbox b)] [lb (lbox b)] [flt (fltbox b)]
               [flte (get/elt (element (fltbox b)))])

       (= (type b) box/block)
       (= (mtp b) (max (mt b) 0.0))
       (= (mtn b) (min (mt b) 0.0))
       (= (mbp b) (max (mb b) 0.0))
       (= (mbn b) (min (mb b) 0.0))

       ;; Floating block element layout
       ,@(for/list ([item '((width width w) (height height h)
                            (padding-left padding pl) (padding-right padding pr)
                            (padding-top padding pt) (padding-bottom padding pb)
                            (border-top border bt) (border-right border br)
                            (border-bottom border bb) (border-left border bl)
                            (margin-top margin mt) (margin-bottom margin mb)
                            (margin-right margin mr) (margin-left margin ml))])
           (match-define (list prop type field) item)
           `(=> (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) r))
                (= (,field b) (,(sformat "~a.px" type) (,(sformat "style.~a" prop) r)))))

       ;; If 'margin-left', or 'margin-right' are computed as 'auto', their used value is '0'.
       (=> (is-margin/auto (style.margin-left r)) (= (ml b) 0))
       (=> (is-margin/auto (style.margin-right r)) (= (mr b) 0))
       (=> (is-margin/auto (style.margin-top r)) (= (mt b) 0))
       (=> (is-margin/auto (style.margin-bottom r)) (= (mb b) 0))

       ;; TODO : We don't allow auto widths (CSS § 10.3.5) on floats, it's too hard to compute
       (not (is-width/auto (style.width r)))

       ;; CSS 2.1 § 10.6.7 : In certain cases, the height of an
       ;; element that establishes a block formatting context is computed as follows:
       (=> (is-height/auto (style.height r))
           (= (h b)
              (ite (is-box fb)
                   (ite (is-box/line (type lb))
                        ;; If it only has inline-level children, the height is the distance between
                        ;; the top of the topmost line box and the bottom of the bottommost line box.
                        (- (bottom-border lb) (top-border fb))
                        ;; If it has block-level children, the height is the distance between the
                        ;; top margin-edge of the topmost block-level child box and the
                        ;; bottom margin-edge of the bottommost block-level child box.
                        (- (bottom-outer lb) (top-outer fb)))
                   0.0)))

       ;; TODO : In addition, if the element has any floating descendants whose bottom margin edge
       ;; is below the element's bottom content edge, then the height is increased to include
       ;; those edges. Only floats that participate in this block formatting context are taken
       ;; into account, e.g., floats inside absolutely positioned descendants or other floats
       ;; are not.

       ;; Positivity constraint
       ;; CSS 2.1 § 9.5.1 : When the float occurs between two collapsing margins, the float is
       ;; positioned as if it had an otherwise empty anonymous block parent taking part in the flow.
       ;; The position of such a parent is defined by the rules in the section on margin collapsing.

       ,@(for/list ([field '(pl pr pb pt w h)])
           `(>= (,field b) 0.0))
       ,@(for/list ([field '(bl br bt bb)])
           `(= (,field b) 0.0))

       ;; CSS 2.1, § 9.5.1, item 1: The left outer edge of a left-floating box
       ;; may not be to the left of the left edge of its containing block.
       ;; TODO: An analogous rule holds for right-floating elements.
       (=> (is-float/left (float e)) (>= (left-outer b) (left-content p)))
       (=> (is-float/right (float e)) (>= (right-content p) (right-outer b)))

       ;; CSS 2.1, § 9.5.1, item 2: If the current box is left-floating,
       ;; and there are any left-floating boxes generated by elements
       ;; earlier in the source document, then for each such earlier box,
       ;; either the left outer edge of the current box must be to the right
       ;; of the right outer edge of the earlier box, or its top must be lower
       ;; than the bottom of the earlier box.
       ;; TODO: Analogous rules hold for right-floating boxes.
       ;; SIMPL: either to the right of the previous float, or below it.
       (or (is-no-box flt)
           (ite (is-float/left (float e))
                (or (= (left-outer b) (right-outer flt)) (>= (box-top b) (bottom-outer flt)))
                (or (= (right-outer b) (left-outer flt)) (>= (box-top b) (bottom-outer flt)))))


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
       (=> (and (is-box vb) (is-box (lbox vb)))
           (>= (top-outer b) (top-outer (lbox (ite (is-box vb) vb b)))))

       ;; CSS 2.1, § 9.5.1, item 7: A left-floating box that has another
       ;; left-floating box to its left may not have its right outer edge
       ;; to the right of its containing block's right edge.
       ;; (Loosely: a left float may not stick out at the right edge,
       ;; unless it is already as far to the left as possible.)
       (=> (and (is-box flt) (< (x flt) (x b)) (horizontally-adjacent b flt)
                (is-float/left (float e)))
           (<= (right-outer b) (right-content p)))
       (=> (and (is-box flt) (> (x flt) (x b)) (horizontally-adjacent b flt)
                (is-float/right (float e)))
           (>= (left-outer b) (left-content p)))

       ;; CSS 2.1, § 9.5.1, item 8: A floating box must be placed as high as possible.
       ;; SIMPL: at its normal position, or the same y-position as previous float
       (or (= (top-outer b) (ite (is-no-box vb) (top-content p) (bottom-outer (vbox b))))
           (and (is-box flt) (= (top-outer b) (top-outer flt)))
           (and (is-box flt) (= (top-outer b) (bottom-outer flt))))

       ;; CSS 2.1, § 9.5.1, item 9: A left-floating box must be put as far to the left
       ;; as possible, a right-floating box as far to the right as possible. A higher
       ;; position is preferred over one that is further to the left/right.
       ;; SIMPL: at the left/right or next to an existing floating box
       (=> (is-float/left (float e))
           (or (= (left-outer b) (left-content p))
               (and (is-box flt) (= (left-outer b) (right-outer flt)))))
       (=> (is-float/right (float e))
           (or (= (right-outer b) (right-content p))
               (and (is-box flt) (= (right-outer b) (left-outer flt)))))

       ;; Three restrictions on floats to make solving efficient

       ;; No negative margins on floats; otherwise they can overlap
       ,@(for/list ([m '(mt mr mb ml)]) `(>= (,m b) 0.0))
       ;; The bottom of a box is farther down than the bottom of the previous box
       ;; Otherwise, they can make little pyramids
       (=> (is-box flt) (>= (bottom-outer b) (bottom-outer flt)))
       ;; If a float wraps to the next line, the previous line must be full
       (=> (and (is-box flt) (= (top-outer b) (bottom-outer flt)))
           (ite (is-float/left (float e))
                (= (right-outer flt) (right-content p))
                (= (left-outer flt) (left-content p))))
       ;; If this and the previous float float to different sides,
       ;; they are not horizontally adjacent
       (=> (and (is-box flt) (not (= (float flte) (float e))))
           (not (horizontally-adjacent flt b)))))

  (define-fun an-inline-box ((b Box)) Bool
    ,(smt-let ([e (get/elt (element b))] [p (pbox b)] [v (vbox b)])
       (= (type b) box/inline)

       ,@(for/list ([field '(mtp mtn mbp mbn mt mr mb ml pt pr pb pl bt br bb bl)])
           `(= (,field b) 0.0))

       (= (left-outer (fbox b)) (left-content b))
       (= (right-outer (lbox b)) (right-content b))
       ;; This is maybe too loose
       (<= (top-content p) (y b) (+ (top-content p) (h p) (- (h b))))
       ;; This is maybe too tight
       ;;(= (- (top-outer b) (top-content p)) (- (bottom-content p) (bottom-outer b)))
       (=> (is-box v) (= (x b) (right-border v)))))

  (define-fun a-text-box ((b Box)) Bool
    ,(smt-let ([p (pbox b)] [v (vbox b)])
       (= (type b) box/inline)

       ,@(for/list ([field '(mtp mtn mbp mbn mt mr mb ml pt pr pb pl bt br bb bl)])
           `(= (,field b) 0.0))

       (between (top-content p) (y b) (+ (top-content p) (h p) (- (h b))))
       (=> (is-box v) (= (x b) (right-border v)))))

  (define-fun a-line-box ((b Box)) Bool
    ,(smt-let ([e (get/elt (element (pbox b)))] [p (pbox b)] [v (vbox b)] [flt (fltbox b)]
               [f (fbox b)] [l (lbox b)] [flte (get/elt (element (fltbox b)))])
       (is-box/line (type b))
       (is-float/none (float e)) ; Where else would we set this?

       ,@(for/list ([field '(mtp mtn mbp mbn mt mr mb ml pt pr pb pl bt br bb bl)])
           `(= (,field b) 0.0))

       (ite (and (is-box flt) (< (top-outer b) (bottom-outer flt))
                 (is-float/left (float flte)))
            (= (left-outer b) (right-outer flt))
            (= (left-outer b) (left-content p)))
       (ite (and (is-box flt) (< (top-outer b) (bottom-outer flt))
                 (is-float/right (float flte)))
            (= (right-outer b) (left-outer flt))
            (= (right-outer b) (right-content p)))

       (ite (and
             ;; Space left for the line of text
             (> (- (right-outer l) (left-outer f))
                (ite (is-float/left (float flte))
                     (- (right-content p) (right-outer flt))
                     (- (left-outer flt) (left-content p))))
             ;; Previous element is a float; see restrictions on floats
             (is-box flt)
             (= (v-name b) (v-name flt)))
            (= (top-outer b) (bottom-outer flt))
            (= (y b) (ite (is-no-box v) (top-content p) (bottom-border v))))

       (not (is-no-box f))
       ,(smt-cond
         [(is-text-align/left (textalign e)) (= (left-border f) (left-content b))]
         [(is-text-align/right (textalign e)) (= (right-border l) (right-content b))]
         [(is-text-align/center (textalign e))
          (= (- (right-content b) (right-border l)) (- (left-border f) (left-content b)))]
         [else true])))

  (define-fun a-block-box ((b Box)) Bool
    (let ((e (get/elt (element b))))
      (ite (is-float/none (float e))
           (a-block-flow-box b)
           (a-block-float-box b)))))
