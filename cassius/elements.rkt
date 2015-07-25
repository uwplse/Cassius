#lang racket
(require "dom.rkt")
(require "smt.rkt")
(require "common.rkt")

(require unstable/sequence)
(provide element-general-constraints
         element-block-constraints element-inline-constraints element-line-constraints)

(define (element-general-constraints e-name)
  (define e `(get/elt ,e-name))
  (define r `(rules ,e))
  (define bp `(get/box (placement-box ,e)))
  (define bf `(get/box (flow-box ,e)))

  (asserts
   (= (flow-box ,e) ,(sformat "~a-flow" e-name))
   (= (placement-box ,e) ,(sformat "~a-real" e-name))

   (= ,bp ,bf)

   (= (textalign ,e)
      ,(smt-cond
        [(is-box/line (tagname ,e)) (textalign (parent ,e))]
        [(is-text-align/inherit (style.text-align ,r))
         (textalign (parent ,e))]
        [else
         (style.text-align ,r)]))
   (= (float ,e)
      ,(smt-cond
        [(is-display/inline (display ,e)) float/none]
        [(is-box/line (tagname ,e)) float/none]
        [(is-float/inherit (style.float ,r)) (float (parent ,e))]
        [else (style.float ,r)]))))

(define (element-block-constraints b)
  (define e `(get/elt (element ,b)))
  (define ve `(previous ,e))
  (define pe `(parent ,e))
  (define fe `(fchild ,e))
  (define le `(lchild ,e))

  (define r `(rules ,e))

  (define bp `(get/box (placement-box ,e)))
  (define vb `(get/box (flow-box ,ve)))
  (define pb `(get/box (placement-box ,pe)))
  (define fb `(get/box (flow-box ,fe)))
  (define lb `(get/box (flow-box ,le)))

  (asserts
   ; Computing maximum collapsed positive and negative margin
   (= (mtp ,b)
      (max (ite (> (mt ,b) 0.0) (mt ,b) 0.0)
           (ite (and (not (= (tagname ,e) tag/<HTML>)) (is-elt ,fe)
                     (= (pt ,b) 0.0) (= (bt ,b) 0.0)) (mtp ,fb) 0.0)))
   (= (mtn ,b)
      (min (ite (< (mt ,b) 0.0) (mt ,b) 0.0)
           (ite (and (not (= (tagname ,e) tag/<HTML>)) (is-elt ,fe)
                     (= (pt ,b) 0.0) (= (bt ,b) 0.0)) (mtn ,fb) 0.0)))
   (= (mbp ,b)
      (max (ite (> (mb ,b) 0.0) (mb ,b) 0.0)
           (ite (and (not (= (tagname ,e) tag/<HTML>)) (is-elt ,le)
                     (= (pb ,b) 0.0) (= (bb ,b) 0.0)) (mbp ,lb) 0.0)))
   (= (mbn ,b)
      (min (ite (< (mb ,b) 0.0) (mb ,b) 0)
           (ite (and (not (= (tagname ,e) tag/<HTML>)) (is-elt ,le)
                     (= (pb ,b) 0.0) (= (bb ,b) 0.0)) (mbn ,lb) 0.0)))

   ; Set properties that are settable with lengths
   ,@(for/list ([item '((width width w) (height height h)
                        (padding-left padding pl) (padding-right padding pr)
                        (padding-top padding pt) (padding-bottom padding pb)
                        (margin-top margin mt) (margin-bottom margin mb))])
       (match item
         [(list prop type field)
          `(=> (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) ,r))
               (= (,field ,b) (,(sformat "~a.px" type) (,(sformat "style.~a" prop) ,r))))]))

   ; CSS § 10.3.3: Block-level, non-replaced elements in normal flow
   ; The following constraints must hold among the used values of the other properties:
   ; 'margin-left' + 'border-left-width' + 'padding-left' + 'width' + 'padding-right' + 'border-right-width' + 'margin-right' = width of containing block
   (= (w ,pb) (+ (ml ,b) (box-width ,b) (mr ,b)))

   ; I cannot summarize these rules; see CSS § 10.3.3
   ; Note that the implementation here is what Chrome and Firefox do,
   ; not what the standard says, which they contradict.
   (ite (> (+ (ite (is-width/auto (style.width ,r)) 0.0 (width.px (style.width ,r)))
              (ite (is-margin/auto (style.margin-left ,r)) 0.0 (margin.px (style.margin-left ,r)))
              (ite (is-margin/auto (style.margin-right ,r)) 0.0 (margin.px (style.margin-right ,r)))
              (pl ,b) (pr ,b) (bl ,b) (br ,b))
           (w ,pb))
        (and ; It overflows. So what do we do?
         ; Experimentally, this is what Firefox and Chrome do.
         ; NOTE: this behavior contradicts CSS § 10.3.3.
         (= (w ,b) (ite (is-width/auto (style.width ,r)) 0.0 (width.px (style.width ,r))))
         (= (ml ,b) (ite (is-margin/auto (style.margin-left ,r)) 0.0 (margin.px (style.margin-left ,r)))))
        ; If it does not overflow, we set everything, and just figure out what to constrain.
        (ite (is-width/auto (style.width ,r))
             (and
              (= (ml ,b) (ite (is-margin/auto (style.margin-left ,r)) 0.0 (margin.px (style.margin-left ,r))))
              (= (mr ,b) (ite (is-margin/auto (style.margin-right ,r)) 0.0 (margin.px (style.margin-right ,r)))))
             (and
              (= (w ,b) (width.px (style.width ,r)))
              (=> (and (is-margin/auto (style.margin-left ,r)) (is-margin/auto (style.margin-right ,r)))
                  (= (ml ,b) (mr ,b)))
              (=> (is-margin/px (style.margin-left ,r)) (= (ml ,b) (margin.px (style.margin-left ,r))))
              (=> (and (is-margin/px (style.margin-right ,r)) (is-margin/auto (style.margin-left ,r)))
                  (= (mr ,b) (margin.px (style.margin-right ,r)))))))

   ; Width and horizontal margins out of the way, let's do height and vertical margins
   ; CSS § 10.6.3 If 'margin-top', or 'margin-bottom' are 'auto', their used value is 0.
   (=> (is-margin/auto (style.margin-top ,r)) (= (mt ,b) 0.0))
   (=> (is-margin/auto (style.margin-bottom ,r)) (= (mb ,b) 0.0))

   ; If 'height' is 'auto', the height depends on whether the element has
   ; any block-level children and whether it has padding or borders:
   (=> (is-height/auto (style.height ,r))
       ,(smt-cond
         ; CSS § 10.6.3, item 1: the bottom edge of the last line box,
         ; if the box establishes a inline formatting context with one or more lines
         [(and (is-elt ,le) (= (display ,le) display/inline))
          (= (bottom-content ,b) (bottom-border ,lb))]
         [(and (is-elt ,le) (= (display ,le) display/block))
          (= (bottom-content ,b)
             ; CSS § 10.6.3, item 2: the bottom edge of the bottom
             ; (possibly collapsed) margin of its last in-flow child,
             ; if the child's bottom margin does not collapse with the
             ; element's bottom margin
             (ite (and (= (pb ,b) 0.0) (= (bb ,b) 0.0) (not (= (tagname ,e) tag/<HTML>)))
                  (bottom-border ,lb) ; Collapsed bottom margin
                  (bottom-outer ,lb)))] ; No collapsed bottom margin
         ; CSS § 10.6.3, item 3: the bottom border edge of the last in-flow child
         ; whose top margin doesn't collapse with the element's bottom margin
         ; NOTE: This can happen if the box height is 0.
         ; We don't support that, so it's not an issue.

         ; CSS § 10.6.3, item 4: zero, otherwise
         [else (= (h ,b) 0.0)]))

   ; Computing X and Y position

   (= (x ,b) (+ (left-content ,pb) (ml ,b)))
   (= (y ,b)
      (ite (is-no-elt ,ve)
           (ite (and (not (= (tagname ,pe) tag/<HTML>)) (is-float/none (float ,pe))
                     (= (pt ,pb) 0.0) (= (bt ,pb) 0.0))
                (top-content ,pb)
                (+ (top-content ,pb) (+ (mtp ,b) (mtn ,b))))
           (+ (bottom-border ,vb) (max (mbp ,vb) (mtp ,b)) (min (mbn ,vb) (mtn ,b)))))

   ; Positivity constraint---otherwise floats can overlap
   (> (box-height ,b) 0.0)

   ,@(for/list ([field '(pl pr pb pt w h)])
       `(>= (,field ,b) 0.0))
   ,@(for/list ([field '(bl br bt bb)])
       `(= (,field ,b) 0.0))))

(define (element-float-constraints b)
  (define e `(get/elt (element ,b)))
  (define ve `(previous ,e))
  (define pe `(parent ,e))
  (define fe `(fchild ,e))
  (define le `(lchild ,e))

  (define r `(rules ,e))

  (define bp `(get/box (placement-box ,e)))
  (define vb `(get/box (flow-box ,ve)))
  (define pb `(get/box (placement-box ,pe)))
  (define fb `(get/box (flow-box ,fe)))
  (define lb `(get/box (flow-box ,le)))

  (asserts
   ; Copied from above
   (= (mtp ,b)
      (max (ite (> (mt ,b) 0.0) (mt ,b) 0.0)
           (ite (and (not (= (tagname ,e) tag/<HTML>)) (is-elt ,fe)
                     (= (pt ,b) 0.0) (= (bt ,b) 0.0)) (mtp ,fb) 0.0)))
   (= (mtn ,b)
      (min (ite (< (mt ,b) 0.0) (mt ,b) 0.0)
           (ite (and (not (= (tagname ,e) tag/<HTML>)) (is-elt ,fe)
                     (= (pt ,b) 0.0) (= (bt ,b) 0.0)) (mtn ,fb) 0.0)))
   (= (mbp ,b)
      (max (ite (> (mb ,b) 0.0) (mb ,b) 0.0)
           (ite (and (not (= (tagname ,e) tag/<HTML>)) (is-elt ,le)
                     (= (pb ,b) 0.0) (= (bb ,b) 0.0)) (mbp ,lb) 0.0)))
   (= (mbn ,b)
      (min (ite (< (mb ,b) 0.0) (mb ,b) 0)
           (ite (and (not (= (tagname ,e) tag/<HTML>)) (is-elt ,le)
                     (= (pb ,b) 0.0) (= (bb ,b) 0.0)) (mbn ,lb) 0.0)))

   ; Floating block element layout
   ,@(for/list ([item '((width width w) (height height h)
                        (padding-left padding pl) (padding-right padding pr)
                        (padding-top padding pt) (padding-bottom padding pb)
                        (margin-top margin mt) (margin-bottom margin mb)
                        (margin-right margin mr) (margin-left margin ml))])
       (match item
         [(list prop type field)
          `(=> (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) ,r))
               (= (,field ,bp) (,(sformat "~a.px" type) (,(sformat "style.~a" prop) ,r))))]))

   ; If 'margin-left', or 'margin-right' are computed as 'auto', their used value is '0'.
   (=> (is-margin/auto (style.margin-left ,r)) (= (ml ,bp) 0))
   (=> (is-margin/auto (style.margin-right ,r)) (= (mr ,bp) 0))
   (=> (is-margin/auto (style.margin-top ,r)) (= (mt ,bp) 0))
   (=> (is-margin/auto (style.margin-bottom ,r)) (= (mb ,bp) 0))

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
   (not (is-width/auto (style.width ,r)))

   ; CSS 2.1 § 10.6.7 : In certain cases, the height of an
   ; element that establishes a block formatting context is computed as follows:
   (=> (is-height/auto (style.height ,r))
       (= (h ,bp)
          (ite (is-elt ,le)
               (ite (= (display ,le) display/inline)
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
   ; TODO

   ,@(for/list ([field '(pl pr pb pt w h)])
       `(>= (,field ,bp) 0.0))
   ,@(for/list ([field '(bl br bt bb)])
       `(= (,field ,bp) 0.0))))

(define (element-inline-constraints b)
  (define e `(get/elt (element ,b)))
  (define ve `(previous ,e))
  (define pe `(parent ,e))
  (define fe `(fchild ,e))
  (define le `(lchild ,e))

  (define r `(rules ,e))

  (define bp `(get/box (placement-box ,e)))
  (define vb `(get/box (flow-box ,ve)))
  (define pb `(get/box (placement-box ,pe)))
  (define fb `(get/box (flow-box ,fe)))
  (define lb `(get/box (flow-box ,le)))

  (asserts
   ; Computing maximum collapsed positive and negative margin
   ,@(for/list ([field '(mtp mtn mbp mbn mt mr mb ml pt pr pb pl bt br bb bl)])
       `(= (,field ,b) 0.0))

   (between (top-content ,pb) (y ,b) (+ (top-content ,pb) (h ,pb) (- (h ,b))))

   ; Inline element layout
   (=> (not (is-no-elt ,ve)) (= (x ,b) (right-border ,vb)))
   (= (get/box (placement-box ,e)) (get/box (flow-box ,e)))))

(define (element-line-constraints b)
  (define e `(get/elt (element ,b)))
  (define vb `(get/box (flow-box (previous ,e))))
  (define pb `(get/box (placement-box (parent ,e))))
  (define fb `(get/box (flow-box (fchild ,e))))
  (define lb `(get/box (flow-box (lchild ,e))))

  (asserts
   ; Computing maximum collapsed positive and negative margin
   ,@(for/list ([field '(mtp mtn mbp mbn mt mr mb ml pt pr pb pl bt br bb bl)])
       `(= (,field ,b) 0.0))

   (= (x ,b) (left-content ,pb))
   (= (y ,b) (ite (is-no-elt (previous ,e)) (top-content ,pb) (bottom-border ,vb)))
   (= (w ,b) (w ,pb))

   (not (is-no-elt (fchild ,e)))
   ,(smt-cond
     [(is-text-align/left (textalign ,e)) (= (left-border ,fb) (left-content ,b))]
     [(is-text-align/right (textalign ,e)) (= (right-border ,lb) (right-content ,b))]
     [(is-text-align/center (textalign ,e))
      (= (- (right-content ,b) (right-border ,lb)) (- (left-border ,fb) (left-content ,b)))]
     [else true])

   (= (get/box (placement-box ,e)) (get/box (flow-box ,e)))))
