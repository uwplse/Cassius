#lang racket
(require "dom.rkt")
(require "smt.rkt")
(require "common.rkt")

(require unstable/sequence)
(provide element-general-constraints
         box-block-constraints box-inline-constraints box-line-constraints
         element-definitions)

(define element-definitions
  `((define-fun an-element ((e Element)) Bool
      ,(smt-let ([r (rules e)] [bf (get/box (flow-box e))])

        (= (p-name bf) (flow-box (parent e)))
        (= (vnf-name bf)
           ,(smt-cond
             [(is-no-elt (previous e)) nil-box]
             [(is-float/none (float (previous e))) (flow-box (previous e))]
             [else (vnf-name (get/box (flow-box (previous e))))]))
        (= (n-name bf)
           ,(smt-cond
             [(is-no-elt (next e)) nil-box]
             [(is-float/none (float (next e))) (flow-box (next e))]
             [else (n-name (get/box (flow-box (next e))))]))
        (= (vff-name bf)
           ,(smt-cond
             [(is-no-elt (previous e)) (vff-name (get/box (flow-box (parent e))))]
             [(is-float/none (float (previous e))) (vff-name (get/box (flow-box (previous e))))]
             [else (flow-box (previous e))]))
        (= (f-name bf) (flow-box (fchild e)))
        (= (l-name bf) (flow-box (lchild e)))

        (= (textalign e)
           ,(smt-cond
             [(is-no-tag (tagname e)) (textalign (parent e))]
             [(is-text-align/inherit (style.text-align r))
              (textalign (parent e))]
             [else
              (style.text-align r)]))
        (=> (is-display/inline (display e)) (is-float/none (float e)))
        (= (float e)
           (ite (is-float/inherit (style.float r)) (float (parent e)) (style.float r)))))

    (define-fun flow-compute-y ((b Box)) Real
      (let ([vb (vbox b)] [p (pbox b)])
        (ite (is-no-box vb)
             (ite (and (not (= (tagname (get/elt (element p))) tag/html))
                       (is-float/none (float (get/elt (element p))))
                       (= (pt p) 0.0) (= (bt p) 0.0))
                  (top-content p)
                  (+ (top-content p) (+ (mtp b) (mtn b))))
             (+ (bottom-border vb) (max (mbp vb) (mtp b)) (min (mbn vb) (mtn b))))))

    (define-fun a-block-flow-box ((b Box)) Bool
      ,(smt-let ([e (get/elt (element b))] [r (rules (get/elt (element b)))]
                 [p (pbox b)] [vb (vbox b)] [fb (fbox b)] [lb (lbox b)])
                (= (type b) box/block)

                ; Computing maximum collapsed positive and negative margin
                (= (mtp b)
                   (max (ite (> (mt b) 0.0) (mt b) 0.0)
                        (ite (and (not (= (tagname e) tag/html)) (is-box fb) (is-float/none (float e))
                                  (= (pt b) 0.0) (= (bt b) 0.0)) (mtp fb) 0.0)))
                (= (mtn b)
                   (min (ite (< (mt b) 0.0) (mt b) 0.0)
                        (ite (and (not (= (tagname e) tag/html)) (is-box fb) (is-float/none (float e))
                                  (= (pt b) 0.0) (= (bt b) 0.0)) (mtn fb) 0.0)))
                (= (mbp b)
                   (max (ite (> (mb b) 0.0) (mb b) 0.0)
                        (ite (and (not (= (tagname e) tag/html)) (is-box lb) (is-float/none (float e))
                                  (= (pb b) 0.0) (= (bb b) 0.0)) (mbp lb) 0.0)))
                (= (mbn b)
                   (min (ite (< (mb b) 0.0) (mb b) 0)
                        (ite (and (not (= (tagname e) tag/html)) (is-box lb) (is-float/none (float e))
                                  (= (pb b) 0.0) (= (bb b) 0.0)) (mbn lb) 0.0)))

                ; Set properties that are settable with lengths
                ,@(for/list ([prop '(width height padding-left padding-right padding-top padding-bottom margin-top margin-bottom)]
                             [type '(width height padding padding padding padding margin margin)]
                             [field '(w h pl pr pt pb mt mb)])
                    `(=> (and (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) r)) (is-float/none (float e)))
                         (= (,field b) (,(sformat "~a.px" type) (,(sformat "style.~a" prop) r)))))

                ; CSS § 10.3.3: Block-level, non-replaced elements in normal flow
                ; The following constraints must hold among the used values of the other properties:
                ; 'margin-left' + 'border-left-width' + 'padding-left' + 'width' + 'padding-right' + 'border-right-width' + 'margin-right' = width of containing block
                (= (w p) (+ (ml b) (box-width b) (mr b)))

                ,(smt-cond
                  ; See CSS § 10.3.3
                  [(> (+ (ite (is-width/auto (style.width r)) 0.0 (width.px (style.width r)))
                         (ite (is-margin/auto (style.margin-left r)) 0.0 (margin.px (style.margin-left r)))
                         (ite (is-margin/auto (style.margin-right r)) 0.0 (margin.px (style.margin-right r)))
                         (pl b) (pr b) (bl b) (br b))
                      (w p))
                   ; It overflows. So what do we do? This is what Chrome & Firefox do (but see CSS § 10.3.3)
                   (and
                    (= (w b) (ite (is-width/auto (style.width r)) 0.0 (width.px (style.width r))))
                    (= (ml b) (ite (is-margin/auto (style.margin-left r)) 0.0 (margin.px (style.margin-left r)))))]
                  [(is-width/auto (style.width r))
                   ; If it does not overflow, we set everything, and just figure out what to constrain.
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

                ; Width and horizontal margins out of the way, let's do height and vertical margins
                ; CSS § 10.6.3 If 'margin-top', or 'margin-bottom' are 'auto', their used value is 0.
                (=> (is-margin/auto (style.margin-top r)) (= (mt b) 0.0))
                (=> (is-margin/auto (style.margin-bottom r)) (= (mb b) 0.0))

                ; If 'height' is 'auto', the height depends on whether the element has
                ; any block-level children and whether it has padding or borders:
                (=> (is-height/auto (style.height r))
                    ,(smt-cond
                      ; CSS § 10.6.3, item 1: the bottom edge of the last line box,
                      ; if the box establishes a inline formatting context with one or more lines
                      [(and (is-box lb) (is-box/line (type lb)))
                       (= (bottom-content b) (bottom-border lb))]
                      [(and (is-box lb) (is-box/block (type lb)))
                       (= (bottom-content b)
                          ; CSS § 10.6.3, item 2: the bottom edge of the bottom
                          ; (possibly collapsed) margin of its last in-flow child,
                          ; if the child's bottom margin does not collapse with the
                          ; element's bottom margin
                          (ite (and (= (pb b) 0.0) (= (bb b) 0.0) (not (= (tagname e) tag/html)))
                               (bottom-border lb) ; Collapsed bottom margin
                               (bottom-outer lb)))] ; No collapsed bottom margin
                      ; CSS § 10.6.3, item 3: the bottom border edge of the last in-flow child
                      ; whose top margin doesn't collapse with the element's bottom margin
                      ; NOTE: This can happen if the box height is 0.
                      ; We don't support that, so it's not an issue.

                      ; CSS § 10.6.3, item 4: zero, otherwise
                      [else (= (h b) 0.0)]))

                ; Computing X and Y position

                (= (x b) (+ (left-content p) (ml b)))
                (= (y b) (flow-compute-y b))

                ; Positivity constraint---otherwise floats can overlap
                (> (box-height b) 0.0)

                ,@(for/list ([field '(pl pr pb pt w h)])
                    `(>= (,field b) 0.0))
                ,@(for/list ([field '(bl br bt bb)])
                    `(= (,field b) 0.0))))

    (define-fun an-inline-box ((b Box)) Bool
      ,(smt-let ([e (get/elt (element b))] [p (pbox b)] [v (vbox b)])
                (= (type b) box/inline)

                ,@(for/list ([field '(mtp mtn mbp mbn mt mr mb ml pt pr pb pl bt br bb bl)])
                    `(= (,field b) 0.0))

                (between (top-content p) (y b) (+ (top-content p) (h p) (- (h b))))

                ; Inline element layout
                (=> (is-box v) (= (x b) (right-border v)))))

    (define-fun a-line-box ((b Box)) Bool
      ,(smt-let ([e (get/elt (element b))] [p (pbox b)] [v (vbox b)] [vff (vffbox b)]
                 [f (fbox b)] [l (lbox b)] [vfe (get/elt (element (vffbox b)))])
                (= (type b) box/line)

                ,@(for/list ([field '(mtp mtn mbp mbn mt mr mb ml pt pr pb pl bt br bb bl)])
                    `(= (,field b) 0.0))

                (ite (and (is-box vff) (< (top-outer b) (bottom-outer vff))
                          (is-float/left (float vfe)))
                     (= (left-outer b) (right-outer vff))
                     (= (left-outer b) (left-content p)))
                (ite (and (is-box vff) (< (top-outer b) (bottom-outer vff))
                          (is-float/right (float vfe)))
                     (= (right-outer b) (left-outer vff))
                     (= (right-outer b) (right-content p)))

                (ite (and
                      ; Space left for the line of text
                      (> (- (right-outer l) (left-outer f))
                         (ite (is-float/left (float vfe))
                              (- (right-content p) (right-outer vff))
                              (- (left-outer vff) (left-content p))))
                      ; Previous element is a float; see restrictions on floats
                      (is-box vff)
                      (= (vnf-name b) (vnf-name vff)))
                     (= (top-outer b) (bottom-outer vff))
                     (= (y b) (ite (is-no-box v) (top-content p) (bottom-border v))))

                (not (is-no-box f))
                ,(smt-cond
                  [(is-text-align/left (textalign e)) (= (left-border f) (left-content b))]
                  [(is-text-align/right (textalign e)) (= (right-border l) (right-content b))]
                  [(is-text-align/center (textalign e))
                   (= (- (right-content b) (right-border l)) (- (left-border f) (left-content b)))]
                  [else true])))

    (define-fun a-block-float-box ((b Box)) Bool
      ,(smt-let ([e (get/elt (element b))] [r (rules (get/elt (element b)))]
                 [p (pbox b)] [vb (vbox b)] [fb (fbox b)] [lb (lbox b)] [vff (vffbox b)]
                 [vfe (get/elt (element (vffbox b)))])

                (= (type b) box/block)

                ; Copied from above
                (= (mtp b) (max (mt b) 0.0))
                (= (mtn b) (min (mt b) 0.0))
                (= (mbp b) (max (mb b) 0.0))
                (= (mbn b) (min (mb b) 0.0))

                ; Floating block element layout
                ,@(for/list ([item '((width width w) (height height h)
                                     (padding-left padding pl) (padding-right padding pr)
                                     (padding-top padding pt) (padding-bottom padding pb)
                                     (border-top border bt) (border-right border br)
                                     (border-bottom border bb) (border-left border bl)
                                     (margin-top margin mt) (margin-bottom margin mb)
                                     (margin-right margin mr) (margin-left margin ml))])
                    (match item
                      [(list prop type field)
                       `(=> (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) r))
                            (= (,field b) (,(sformat "~a.px" type) (,(sformat "style.~a" prop) r))))]))

                ; If 'margin-left', or 'margin-right' are computed as 'auto', their used value is '0'.
                (=> (is-margin/auto (style.margin-left r)) (= (ml b) 0))
                (=> (is-margin/auto (style.margin-right r)) (= (mr b) 0))
                (=> (is-margin/auto (style.margin-top r)) (= (mt b) 0))
                (=> (is-margin/auto (style.margin-bottom r)) (= (mb b) 0))

                ; TODO : We don't allow auto widths (CSS § 10.3.5) on floats, it's too hard to compute
                (not (is-width/auto (style.width r)))

                ; CSS 2.1 § 10.6.7 : In certain cases, the height of an
                ; element that establishes a block formatting context is computed as follows:
                (=> (is-height/auto (style.height r))
                    (= (h b)
                       (ite (is-box fb)
                            (ite (is-box/line (type lb))
                                 ; If it only has inline-level children, the height is the distance between
                                 ; the top of the topmost line box and the bottom of the bottommost line box.
                                 (- (bottom-border lb) (top-border fb))
                                 ; If it has block-level children, the height is the distance between the
                                 ; top margin-edge of the topmost block-level child box and the
                                 ; bottom margin-edge of the bottommost block-level child box.
                                 (- (bottom-outer lb) (top-outer fb)))
                            0.0)))

                ; TODO : In addition, if the element has any floating descendants whose bottom margin edge
                ; is below the element's bottom content edge, then the height is increased to include
                ; those edges. Only floats that participate in this block formatting context are taken
                ; into account, e.g., floats inside absolutely positioned descendants or other floats
                ; are not.

                ; Positivity constraint
                ; CSS 2.1 § 9.5.1 : When the float occurs between two collapsing margins, the float is
                ; positioned as if it had an otherwise empty anonymous block parent taking part in the flow.
                ; The position of such a parent is defined by the rules in the section on margin collapsing.

                ,@(for/list ([field '(pl pr pb pt w h)])
                    `(>= (,field b) 0.0))
                ,@(for/list ([field '(bl br bt bb)])
                    `(= (,field b) 0.0))

                ; CSS 2.1, § 9.5.1, item 1: The left outer edge of a left-floating box
                ; may not be to the left of the left edge of its containing block.
                ; TODO: An analogous rule holds for right-floating elements.
                (=> (is-float/left (float e)) (>= (left-outer b) (left-content p)))
                (=> (is-float/right (float e)) (>= (right-content p) (right-outer b)))

                ; CSS 2.1, § 9.5.1, item 2: If the current box is left-floating,
                ; and there are any left-floating boxes generated by elements
                ; earlier in the source document, then for each such earlier box,
                ; either the left outer edge of the current box must be to the right
                ; of the right outer edge of the earlier box, or its top must be lower
                ; than the bottom of the earlier box.
                ; TODO: Analogous rules hold for right-floating boxes.
                ; SIMPL: either to the right of the previous float, or below it.
                (or (is-no-box vff)
                    (ite (is-float/left (float e))
                        (or (= (left-outer b) (right-outer vff)) (>= (box-top b) (bottom-outer vff)))
                        (or (= (right-outer b) (left-outer vff)) (>= (box-top b) (bottom-outer vff)))))


                ; CSS 2.1, § 9.5.1, item 3: The right outer edge of a left-floating box
                ; may not be to the right of the left outer edge of any right-floating box
                ; that is next to it. Analogous rules hold for right-floating elements.
                ; TODO: Currently impossible --- see restrictions below

                ; CSS 2.1, § 9.5.1, item 4: A floating box's outer top may not be higher
                ; than the top of its containing block. When the float occurs between
                ; two collapsing margins, the float is positioned as if it had an otherwise
                ; empty anonymous block parent taking part in the flow. The position of such
                ; a parent is defined by the rules in the section on margin collapsing.
                (>= (top-outer b) (top-content p))

                ; CSS 2.1, § 9.5.1, item 5: The outer top of a floating box
                ; may not be higher than the outer top of any block or floated box
                ; generated by an element earlier in the source document.
                ; CSS 2.1 § 9.5.1, item 6: The outer top of an element's floating box
                ; may not be higher than the top of any line-box containing a box
                ; generated by an element earlier in the source document.
                ; SIMPL: May not be higher than the top of the previous float or flow box
                (=> (is-box vff) (>= (top-outer b) (top-outer vff)))
                (>= (top-outer b) (top-outer vb))


                ; CSS 2.1, § 9.5.1, item 7: A left-floating box that has another
                ; left-floating box to its left may not have its right outer edge
                ; to the right of its containing block's right edge.
                ; (Loosely: a left float may not stick out at the right edge,
                ; unless it is already as far to the left as possible.)
                (=> (and (is-box vff) (< (x vff) (x b)) (horizontally-adjacent b vff)
                         (is-float/left (float e)))
                    (<= (right-outer b) (right-content p)))
                (=> (and (is-box vff) (> (x vff) (x b)) (horizontally-adjacent b vff)
                         (is-float/right (float e)))
                    (>= (left-outer b) (left-content p)))

                ; CSS 2.1, § 9.5.1, item 8: A floating box must be placed as high as possible.
                ; SIMPL: at its normal position, or the same y-position as previous float
                (or (= (top-outer b) (ite (is-no-box vb) (top-content p) (bottom-outer (vbox b))))
                    (and (is-box vff) (= (top-outer b) (top-outer vff)))
                    (and (is-box vff) (= (top-outer b) (bottom-outer vff))))

                ; CSS 2.1, § 9.5.1, item 9: A left-floating box must be put as far to the left
                ; as possible, a right-floating box as far to the right as possible. A higher
                ; position is preferred over one that is further to the left/right.
                ; SIMPL: at the left/right or next to an existing floating box
                (=> (is-float/left (float e))
                    (or (= (left-outer b) (left-content p))
                        (and (is-box vff) (= (left-outer b) (right-outer vff)))))
                (=> (is-float/right (float e))
                    (or (= (right-outer b) (right-content p))
                        (and (is-box vff) (= (right-outer b) (left-outer vff)))))

                ; Three restrictions on floats to make solving efficient

                ; No negative margins on floats; otherwise they can overlap
                ,@(for/list ([m '(mt mr mb ml)]) `(>= (,m b) 0.0))
                ; The bottom of a box is farther down than the bottom of the previous box
                ; Otherwise, they can make little pyramids
                (=> (is-box vff) (>= (bottom-outer b) (bottom-outer vff)))
                ; If a float wraps to the next line, the previous line must be full
                (=> (and (is-box vff) (= (top-outer b) (bottom-outer vff)))
                    (ite (is-float/left (float e))
                         (= (right-outer vff) (right-content p))
                         (= (left-outer vff) (left-content p))))
                ; If this and the previous float float to different sides,
                ; they are not horizontally adjacent
                (=> (and (is-box vff) (not (= (float vfe) (float e))))
                    (not (horizontally-adjacent vff b)))))

    (define-fun a-block-box ((b Box)) Bool
      (let ((e (get/elt (element b))))
        (ite (is-float/none (float e))
             (a-block-flow-box b)
             (a-block-float-box b))))))

(define (element-general-constraints e-name) `(assert (an-element (get/elt ,e-name))))
(define (box-block-constraints b) `((assert (a-block-box ,b))))
(define (box-inline-constraints b) `((assert (an-inline-box ,b))))
(define (box-line-constraints b) `((assert (a-line-box ,b))))
