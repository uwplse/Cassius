#lang racket
(require "common.rkt")
(require "smt.rkt")
(require "dom.rkt")
(provide box-float-constraints general-float-constraints)

(define (box-float-constraints b)
  (define e `(get/elt (element ,b)))
  (define r `(rules ,e))
  (define pb `(pbox ,b))
  (define vb `(vbox ,b))
  (define fb `(fbox ,b))
  (define lb `(lbox ,b))

  (asserts
   ; Copied from above
   (= (mtp ,b) (max (mt ,b) 0.0))
   (= (mtn ,b) (min (mt ,b) 0.0))
   (= (mbp ,b) (max (mb ,b) 0.0))
   (= (mbn ,b) (min (mb ,b) 0.0))

   ; Floating block element layout
   ,@(for/list ([item '((width width w) (height height h)
                        (padding-left padding pl) (padding-right padding pr)
                        (padding-top padding pt) (padding-bottom padding pb)
                        (margin-top margin mt) (margin-bottom margin mb)
                        (margin-right margin mr) (margin-left margin ml))])
       (match item
         [(list prop type field)
          `(=> (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) ,r))
               (= (,field ,b) (,(sformat "~a.px" type) (,(sformat "style.~a" prop) ,r))))]))

   ; If 'margin-left', or 'margin-right' are computed as 'auto', their used value is '0'.
   (=> (is-margin/auto (style.margin-left ,r)) (= (ml ,b) 0))
   (=> (is-margin/auto (style.margin-right ,r)) (= (mr ,b) 0))
   (=> (is-margin/auto (style.margin-top ,r)) (= (mt ,b) 0))
   (=> (is-margin/auto (style.margin-bottom ,r)) (= (mb ,b) 0))

   ; CSS § 10.3.5 : If 'width' is computed as 'auto', the used value is the "shrink-to-fit"
   ; width.
   ; Calculation of the shrink-to-fit width is similar to calculating the width of a table
   ; cell using the automatic table layout algorithm. Roughly: calculate the preferred width
   ; by formatting the content without breaking lines other than where explicit line breaks
   ; occur, and also calculate the preferred minimum width, e.g., by trying all possible
   ; line breaks. CSS 2.1 does not define the exact algorithm. Thirdly, find the available
   ; width: in this case, this is the width of the containing block minus the used values
   ; of 'margin-left', 'border-left-width', 'padding-left', 'padding-right',
   ; 'border-right-width', 'margin-right', and the widths of any relevant scroll bars.
   ; Then the shrink-to-fit width is: min(max(preferred minimum width, available width),
   ; preferred width).
   ; TODO : We just don't allow auto widths on floats
   (=> (not (is-float/none (float ,e))) (not (is-width/auto (style.width ,r))))

   ; CSS 2.1 § 10.6.7 : In certain cases, the height of an
   ; element that establishes a block formatting context is computed as follows:
   (=> (is-height/auto (style.height ,r))
       (= (h ,b)
          (ite (is-box ,fb)
               (ite (is-display/inline (display (get/elt (element ,lb))))
                    ; If it only has inline-level children, the height is the distance between
                    ; the top of the topmost line box and the bottom of the bottommost line box.
                    (- (bottom-border ,lb) (top-border ,fb))
                    ; If it has block-level children, the height is the distance between the
                    ; top margin-edge of the topmost block-level child box and the
                    ; bottom margin-edge of the bottommost block-level child box.
                    (- (bottom-outer ,lb) (top-outer ,fb)))
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
       `(>= (,field ,b) 0.0))
   ,@(for/list ([field '(bl br bt bb)])
       `(= (,field ,b) 0.0))


   ; CSS 2.1, § 9.5.1, item 1: The left outer edge of a left-floating box
   ; may not be to the left of the left edge of its containing block.
   ; An analogous rule holds for right-floating elements.
   (=> (is-float/left (float ,e)) (>= (left-outer ,b) (left-content ,pb)))
   (=> (is-float/right (float ,e)) (<= (right-outer ,b) (right-content ,pb)))

   ; TODO : The current float spec doesn't capture the notion that we must place
   ; a box as high as possible, which may lead to boxes overlapping.
   ; For now, we ban negative margins.
   (>= (mt ,b) 0.0)
   (>= (mb ,b) 0.0)
   (>= (ml ,b) 0.0)
   (>= (mr ,b) 0.0)

   ; CSS 2.1, § 9.5.1, item 4: A floating box's outer top may not be higher
   ; than the top of its containing block. When the float occurs between
   ; two collapsing margins, the float is positioned as if it had an otherwise
   ; empty anonymous block parent taking part in the flow. The position of such
   ; a parent is defined by the rules in the section on margin collapsing.
   (>= (top-outer ,b) (top-content ,pb))))

(define-syntax for/boxes
  (syntax-rules (<<<)
    [(for/boxes dom ([var type] [vars types] ...) body ...)
     (apply append
            (for/list ([var (in-tree-values (dom-tree dom))])
              (for/boxes dom ([vars types] ... <<< var)
                         (let ([var `(,(sformat "~a-box" 'type) ,(dom-get dom var))])
                           body ...))))]
    [(for/boxes dom ([var type] [vars types] ... <<< lb) body ...)
     (apply append
            (for/list ([var (in-tree-values (dom-tree dom))] #:break (eq? var lb))
              (for/boxes dom ([vars types] ... <<< var)
                         (let ([var `(,(sformat "~a-box" 'type) ,(dom-get dom var))])
                           body ...))))]
    [(for/boxes dom (<<< var) body ...)
     (list body ...)]))

(define (general-float-constraints dom)
  (for*/list ([elt (in-tree-values (dom-tree dom))])
    (define e (dom-get dom elt))
    (define b `(float-box ,e))
    (define p `(pbox ,b))

    (list*
     ; CSS 2.1, § 9.5.1, item 8: A floating box must be placed as high as possible.
     ; NOTE: Simplified to be at its normal position, or the same y-position as another float
     `(assert
       (or (= (y ,b) (y (flow-box ,e)))
           ,@(for/list ([elt* (in-tree-values (dom-tree dom))] #:break (eq? elt elt*))
               (define b* `(flow-box ,(dom-get dom elt*)))
               `(and (not (is-float/none (float (get/elt (element ,b*)))))
                     (or (= (top-outer ,b) (top-outer ,b*))
                         (= (top-outer ,b) (bottom-outer ,b*)))))))

     ; CSS 2.1, § 9.5.1, item 9: A left-floating box must be put as far to the left
     ; as possible, a right-floating box as far to the right as possible. A higher
     ; position is preferred over one that is further to the left/right.
     ; NOTE: simplified to being at the left/right or next to an existing floating box
     `(assert
       (or (= (left-outer ,b) (left-content ,p))
           ,@(for/list ([elt* (in-tree-values (dom-tree dom))] #:break (eq? elt elt*))
               (define b* `(child-box ,(dom-get dom elt*)))
               `(and (is-float/left (float (get/elt (element ,b*))))
                     (= (left-outer ,b) (right-outer ,b*))))))

     `(assert
       (or (= (right-outer ,b) (right-content ,p))
           ,@(for/list ([elt* (in-tree-values (dom-tree dom))] #:break (eq? elt elt*))
               (define b* `(child-box ,(dom-get dom elt*)))
               `(and (is-float/right (float (get/elt (element ,b*))))
                     (= (right-outer ,b) (left-outer ,b*)))))))

     (apply append
            ; The #:break ensures these are only preceding elements
            (for/list ([elt* (in-tree-values (dom-tree dom))] #:break (eq? elt elt*))
              (define e* (dom-get dom elt*))
              (define b* `(child-box ,(dom-get dom elt*)))

              (list
               ; CSS 2.1, § 9.5.1, item 2: If the current box is left-floating,
               ; and there are any left-floating boxes generated by elements
               ; earlier in the source document, then for each such earlier box,
               ; either the left outer edge of the current box must be to the right
               ; of the right outer edge of the earlier box, or its top must be lower
               ; than the bottom of the earlier box.
               ; Analogous rules hold for right-floating boxes.
               `(assert (=> (and (is-float/left (float ,e)) (is-float/left (float ,e*)))
                            (or (>= (left-outer ,b) (right-outer ,b*))
                                (>= (box-top ,b) (box-bottom ,b*)))))
               `(assert (=> (and (is-float/right (float ,e)) (is-float/right (float ,e*)))
                            (or (<= (right-outer ,b) (left-outer ,b*))
                                (>= (box-top ,b) (box-bottom ,b*)))))

               ; CSS 2.1, § 9.5.1, item 3: The right outer edge of a left-floating box
               ; may not be to the right of the left outer edge of any right-floating box
               ; that is next to it. Analogous rules hold for right-floating elements.
               `(assert (=> (and (is-float/left (float ,e)) (is-float/right (float ,e*))
                                 (horizontally-adjacent ,b ,b*))
                            (<= (right-outer ,b) (left-outer ,b*))))
               `(assert (=> (and (is-float/right (float ,e)) (is-float/left (float ,e*))
                                 (horizontally-adjacent ,b ,b*))
                            (>= (left-outer ,b) (right-outer ,b*))))

               ; CSS 2.1, § 9.5.1, item 5: The outer top of a floating box
               ; may not be higher than the outer top of any block or floated box
               ; generated by an element earlier in the source document.
               `(assert (=> (and (not (is-float/none (float ,e))) (is-display/block (display ,e*)))
                            (>= (top-outer ,b) (top-outer ,b*))))

               ; CSS 2.1 § 9.5.1, item 6: The outer top of an element's floating box
               ; may not be higher than the top of any line-box containing a box
               ; generated by an element earlier in the source document.
               `(assert (=> (and (or (is-float/right (float ,e)) (is-float/left (float ,e)))
                                 (is-display/inline (display ,e*)))
                            (>= (top-outer ,b) (y ,b*))))

               ; CSS 2.1, § 9.5.1, item 7: A left-floating box that has another
               ; left-floating box to its left may not have its right outer edge
               ; to the right of its containing block's right edge.
               ; (Loosely: a left float may not stick out at the right edge,
               ; unless it is already as far to the left as possible.)
               ; An analogous rule holds for right-floating elements.
               ; TODO : is this equivalent to (at left edge /\ not over right edge)?
               `(assert (=> (and (is-float/left (float ,e)) (is-float/left (float ,e*))
                                 (< (x ,b*) (x ,b)) (horizontally-adjacent ,b ,b*))
                            (<= (right-outer ,b) (right-content ,p))))
               `(assert (=> (and (is-float/right (float ,e)) (is-float/right (float ,e*))
                                 (> (x ,b*) (x ,b)) (horizontally-adjacent ,b ,b*))
                            (>= (left-outer ,b) (left-content ,p)))))))))
