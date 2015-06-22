#lang racket
(require "dom.rkt")

(require unstable/sequence)

(provide box-functions element-type element-constraints)

(define box-functions
  `((declare-datatypes ()
       ((Box (box (x Real) (y Real) (w Real) (h Real)
                  (mt Real) (mr Real) (mb Real) (ml Real)
                  (mtp Real) (mtn Real) (mbp Real) (mbn Real)
                  (pt Real) (pr Real) (pb Real) (pl Real)
                  (bt Real) (br Real) (bb Real) (bl Real)
                  (gap Real)))))

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

    (define-fun horizontally-adjacent ((box1 Box) (box2 Box)) Bool
      (or (> (+ (y box1) (box-height box1)) (y box2) (y box1))
          (> (+ (y box2) (box-height box2)) (y box1) (y box2))))))

(define element-type
  `(declare-datatypes ()
      ((Element
        nil
        (element
            (document Document)
            (tagname TagNames) (id Id) (rules ComputedRule)
            (display Display) (float Float)
            (previous ElementName) (parent ElementName)
            (first-child ElementName) (last-child ElementName)
            (flow-box Box) (placement-box Box))))))

(define (element-constraints e-tag e-name map-name)
  (define (elt name) `(,map-name ,name))

  (define e (elt e-name))
  (define ve (elt `(previous ,e)))
  (define pe (elt `(parent ,e)))
  (define fe (elt `(first-child ,e)))
  (define le (elt `(last-child ,e)))

  (define r `(rules ,e))

  (define b  `(flow-box ,e))
  (define bp `(placement-box ,e))
  (define vb `(flow-box ,ve))
  (define pb `(placement-box ,pe))
  (define fb `(flow-box ,fe))
  (define lb `(flow-box ,le))

  `(; Basic element stuff
    (assert (= (display ,e) ,(if (eq? e-tag '<>) 'inline 'block)))
    (assert (not (is-nil ,pe)))
    (assert (= (tagname ,e) ,e-tag))
    (assert (= (float ,e)
               (ite (is-inline (display ,e))
                    none ; Cannot float inline elements
                    (ite (is-inherit (float ,r))
                         (float ,pe)
                         (float ,r)))))

    ; Computing maximum collapsed positive and negative margin
    (assert (= (mtp ,b)
               (max (ite (> (mt ,b) 0.0) (mt ,b) 0.0)
                    (ite (and (= (pt ,b) 0.0) (= (bt ,b) 0.0))
                         (if (is-element ,fe) (mtp ,fb) 0.0) 0.0))))
    (assert (= (mtn ,b)
               (min (ite (< (mt ,b) 0.0) (mt ,b) 0.0)
                    (ite (and (= (pt ,b) 0.0) (= (bt ,b) 0.0))
                         (if (is-element ,fe) (mtn ,fb) 0.0) 0.0))))
    (assert (= (mbp ,b)
               (max (ite (> (mb ,b) 0.0) (mb ,b) 0.0)
                    (ite (and (= (pb ,b) 0.0) (= (bb ,b) 0.0))
                         (if (is-element ,fe) (mbp ,fb) 0.0) 0.0))))
    (assert (= (mbn ,b)
               (min (ite (< (mb ,b) 0.0) (mb ,b) 0)
                    (ite (and (= (pb ,b) 0.0) (= (bb ,b) 0.0))
                         (if (is-element ,fe) (mbn ,fb) 0.0) 0.0))))

    ; Inline element layout
   ,@(map (λ (x) `(assert (=> (= (display ,e) inline) ,x)))
          `((<= (w ,b) (w ,pb))
            (= (mt ,b) (mr ,b) (mb ,b) (ml ,b) 0.0)
            (= (mtp ,b) (mbp ,b) (mtn ,b) (mbp ,b) 0.0)
            (= (pt ,b) (pr ,b) (pb ,b) (pl ,b) 0.0)
            (= (bt ,b) (br ,b) (bb ,b) (bl ,b) 0.0)
            (ite (is-nil ,ve)
                 (and (= (x ,b) (left-content ,pb))
                      (= (y ,b) (+ (top-content ,pb) (/ (gap ,b) 2))))
                 (or
                  (and (= (x ,b) (left-content ,pb)) ; We might break line
                       (= (y ,b) (+ (box-bottom ,vb) (/ (+ (gap ,b) (gap ,vb)) 2))))
                  (and (= (x ,b) (box-right ,vb)) ; Or we might not
                       (= (- (y ,b) (/ (gap ,b) 2)) (- (y ,vb) (/ (gap ,vb) 2))))))
            (= (placement-box ,e) (flow-box ,e))))

   ; In-flow block element layout
   ,@(map (λ (x) `(assert (=> (and (= (display ,e) block) (is-none (float ,e))) ,x)))
          `(; Set properties that are settable with lengths
            ,@(for/list ([item '((width width w) (height height h)
                                 (padding-left padding pl) (padding-right padding pr)
                                 (padding-top padding pt) (padding-bottom padding pb)
                                 (margin-top margin mt) (margin-bottom margin mb))])
                (match item
                  [(list prop type field)
                   `(=> (is-length (,prop ,r)) (= (,field ,b) (,(variable-append type 'l) (,prop ,r))))]))

            ; Block elements don't have a gap
            (= (gap ,b) 0.0)

            ; CSS § 10.3.3: Block-level, non-replaced elements in normal flow
            ; The following constraints must hold among the used values of the other properties:
            ; 'margin-left' + 'border-left-width' + 'padding-left' + 'width' + 'padding-right' + 'border-right-width' + 'margin-right' = width of containing block
            (= (w ,pb) (+ (ml ,b) (box-width ,b) (mr ,b)))

            ; I cannot summarize these rules; see CSS § 10.3.3
            ; Note that the implementation here is what Chrome and Firefox do,
            ; not what the standard says, which they contradict.
            (ite (> (+ (ite (is-auto (width ,r)) 0.0 (width-l (width ,r)))
                       (ite (is-auto (margin-left ,r)) 0.0 (margin-l (margin-left ,r)))
                       (ite (is-auto (margin-right ,r)) 0.0 (margin-l (margin-right ,r)))
                       (pl ,b) (pr ,b) (bl ,b) (br ,b))
                    (w ,pb))
                 (and ; It overflows. So what do we do?
                  ; Experimentally, this is what Firefox and Chrome do.
                  ; NOTE: this behavior contradicts CSS § 10.3.3.
                  (= (w ,b) (ite (is-auto (width ,r)) 0.0 (width-l (width ,r))))
                  (= (ml ,b) (ite (is-auto (margin-left ,r)) 0.0 (margin-l (margin-left ,r)))))
                 ; If it does not overflow, we set everything, and just figure out what to constrain.
                 (ite (is-auto (width ,r))
                      (and
                       (= (ml ,b) (ite (is-auto (margin-left ,r)) 0.0 (margin-l (margin-left ,r))))
                       (= (mr ,b) (ite (is-auto (margin-right ,r)) 0.0 (margin-l (margin-right ,r)))))
                      (and
                       (=> (and (is-auto (margin-left ,r)) (is-auto (margin-right ,r)))
                           (= (ml ,b) (mr ,b)))
                       (=> (is-length (margin-left ,r)) (= (ml ,b) (margin-l (margin-left ,r))))
                       (=> (and (is-length (margin-right ,r)) (is-auto (margin-left ,r)))
                           (= (mr ,b) (margin-l (margin-right ,r)))))))

            ; Width and horizontal margins out of the way, let's do height and vertical margins
            ; CSS § 10.6.3 If 'margin-top', or 'margin-bottom' are 'auto', their used value is 0.
            (=> (is-auto (margin-top ,r)) (= (mt ,b) 0.0))
            (=> (is-auto (margin-bottom ,r)) (= (mb ,b) 0.0))

            ; If 'height' is 'auto', the height depends on whether the element has
            ; any block-level children and whether it has padding or borders: 
            (=> (is-auto (height ,r))
                (= (h ,b) 
                   (ite (is-element ,le)
                        (ite (= (display ,le) inline)
                             ; CSS § 10.6.3, item 1: the bottom edge of the last line box,
                             ; if the box establishes a inline formatting context with one or more lines 
                             (- (+ (box-bottom ,lb) (/ (gap ,lb) 2)) (top-content ,b))
                             ; CSS § 10.6.3, item 2: the bottom edge of the bottom
                             ; (possibly collapsed) margin of its last in-flow child,
                             ; if the child's bottom margin does not collapse with the
                             ; element's bottom margin 
                             (ite (and (= (pb ,b) 0.0) (= (bb ,b) 0.0))
                                  ; Collapsed margin
                                  (- (box-bottom ,lb) (top-content ,b)) 
                                  ; No collapsed margin
                                  (- (bottom-outer ,lb) (top-content ,b))))
                        ; CSS § 10.6.3, item 3: the bottom border edge of the last in-flow child
                        ; whose top margin doesn't collapse with the element's bottom margin 
                        ; NOTE: This can happen if the box height is 0.
                        ; We don't support that, so it's not an issue.

                        ; CSS § 10.6.3, item 4: zero, otherwise 
                        0.0)))

           ; Computing X and Y position

           (= (x ,b) (+ (left-content ,pb) (ml ,b)))
           (= (y ,b)
              (ite (is-nil ,ve)
                   (ite (and (not (= (tagname ,pe) <HTML>)) (is-none (float ,pe))
                             (= (pt ,pb) 0.0) (= (bt ,pb) 0.0))
                        (top-content ,pb)
                        (+ (top-content ,pb) (+ (mtp ,b) (mtn ,b))))
                   (+ (bottom-border ,vb) (max (mbp ,vb) (mtp ,b)) (min (mbn ,vb) (mtn ,b)))))

           ; Positivity constraint---otherwise floats can overlap
           (> (box-height ,b) 0.0)

           (>= (w ,b) 0.0)
           (>= (h ,b) 0.0)
           (>= (pl ,b) 0.0)
           (>= (pr ,b) 0.0)
           (>= (pb ,b) 0.0)
           (>= (pt ,b) 0.0)
           (= (bl ,b) 0.0)
           (= (br ,b) 0.0)
           (= (bt ,b) 0.0)
           (= (bb ,b) 0.0)

           ; Place at the float box

           (= (placement-box ,e) (flow-box ,e))))

   ; Floating block element layout
   ,@(map (λ (x) `(assert (=> (and (= (display ,e) block) (not (is-none (float ,e)))) ,x)))
          `(,@(for/list ([item '((width width w) (height height h)
                                 (padding-left padding pl) (padding-right padding pr)
                                 (padding-top padding pt) (padding-bottom padding pb)
                                 (margin-top margin mt) (margin-bottom margin mb)
                                 (margin-right margin mr) (margin-left margin ml))])
                (match item
                  [(list prop type field)
                   `(=> (is-length (,prop ,r)) (= (,field ,bp) (,(variable-append type 'l) (,prop ,r))))]))

            ; Block elements don't have a gap
            (= (gap ,bp) 0.0)

            ; If 'margin-left', or 'margin-right' are computed as 'auto', their used value is '0'.
            (=> (is-auto (margin-left ,r)) (= (ml ,bp) 0))
            (=> (is-auto (margin-right ,r)) (= (mr ,bp) 0))
            (=> (is-auto (margin-top ,r)) (= (mt ,bp) 0))
            (=> (is-auto (margin-bottom ,r)) (= (mb ,bp) 0))

            (= (mtp ,bp) (max (mt ,bp) 0.0))
            (= (mtn ,bp) (min (mt ,bp) 0.0))
            (= (mbp ,bp) (max (mb ,bp) 0.0))
            (= (mbn ,bp) (min (mb ,bp) 0.0))

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

            ; TODO : We just don't support auto widths on floats.
            (not (is-auto (width ,r)))

            ; CSS 2.1 § 10.6.7 : In certain cases, the height of an
            ; element that establishes a block formatting context is computed as follows:
            (=> (is-auto (height ,r))
                (= (h ,bp) 
                   (ite (is-element ,le)
                        (ite (= (display ,le) inline)
                             ; If it only has inline-level children, the height is the distance between
                             ; the top of the topmost line box and the bottom of the bottommost line box.
                             (- (box-bottom ,lb) (box-top ,fb))
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
            (= (flow-box ,e)
               ; TODO : Handle the margin collapsing nonsense
               (ite (is-nil ,ve)
                    (box (left-content ,pb) (top-content ,pb) (w ,pb) 0.0
                         0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
                         0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
                         0.0)
                    (box (left-content ,pb) (box-bottom ,vb) (w ,pb) 0.0
                         0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
                         0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
                         0.0)))
            
            (>= (w ,bp) 0.0)
            (>= (h ,bp) 0.0)
            (>= (pl ,bp) 0.0)
            (>= (pr ,bp) 0.0)
            (>= (pb ,bp) 0.0)
            (>= (pt ,bp) 0.0)
            (= (bl ,bp) 0.0)
            (= (br ,bp) 0.0)
            (= (bt ,bp) 0.0)
            (= (bb ,bp) 0.0)

            (= (float ,e) (float ,r))))))
