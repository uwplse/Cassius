#lang racket
(require "dom.rkt")
(require "smt.rkt")
(require "common.rkt")

(require unstable/sequence)
(provide element-general-constraints
         box-block-constraints box-inline-constraints box-line-constraints
         element-definitions)

(define element-definitions
  `((define-fun is-an-element ((e Element)) Bool
      ,(smt-let
        ((r (rules e)) (bp (get/box (child-box e))) (bf (get/box (flow-box e))))

        (= bp bf)
        (= (p-name bf) (flow-box (parent e)))
        (= (v-name bf) (flow-box (previous e)))
        (= (f-name bf) (flow-box (fchild e)))
        (= (l-name bf) (flow-box (lchild e)))

        (= (textalign e)
           ,(smt-cond
             [(is-no-tag (tagname e)) (textalign (parent e))]
             [(is-text-align/inherit (style.text-align r))
              (textalign (parent e))]
             [else
              (style.text-align r)]))
        (= (float e)
           ,(smt-cond
             [(is-display/inline (display e)) float/none]
             [(is-no-tag (tagname e)) float/none]
             [(is-float/inherit (style.float r)) (float (parent e))]
             [else (style.float r)]))))))

(define (element-general-constraints e-name)
  `(assert (is-an-element (get/elt ,e-name))))

(define (box-block-constraints b)
  (define e `(get/elt (element ,b)))
  (define r `(rules ,e))
  (define pb `(pbox ,b))
  (define vb `(vbox ,b))
  (define fb `(fbox ,b))
  (define lb `(lbox ,b))

  (asserts
   (= (type ,b) box/block)

   ; Computing maximum collapsed positive and negative margin
   (= (mtp ,b)
      (max (ite (> (mt ,b) 0.0) (mt ,b) 0.0)
           (ite (and (not (= (tagname ,e) tag/html)) (is-box ,fb) (is-float/none (float ,e))
                     (= (pt ,b) 0.0) (= (bt ,b) 0.0)) (mtp ,fb) 0.0)))
   (= (mtn ,b)
      (min (ite (< (mt ,b) 0.0) (mt ,b) 0.0)
           (ite (and (not (= (tagname ,e) tag/html)) (is-box ,fb) (is-float/none (float ,e))
                     (= (pt ,b) 0.0) (= (bt ,b) 0.0)) (mtn ,fb) 0.0)))
   (= (mbp ,b)
      (max (ite (> (mb ,b) 0.0) (mb ,b) 0.0)
           (ite (and (not (= (tagname ,e) tag/html)) (is-box ,lb) (is-float/none (float ,e))
                     (= (pb ,b) 0.0) (= (bb ,b) 0.0)) (mbp ,lb) 0.0)))
   (= (mbn ,b)
      (min (ite (< (mb ,b) 0.0) (mb ,b) 0)
           (ite (and (not (= (tagname ,e) tag/html)) (is-box ,lb) (is-float/none (float ,e))
                     (= (pb ,b) 0.0) (= (bb ,b) 0.0)) (mbn ,lb) 0.0)))

   ; Set properties that are settable with lengths
   ,@(for/list ([prop '(width height padding-left padding-right padding-top padding-bottom margin-top margin-bottom)]
                [type '(width height padding padding padding padding margin margin)]
                [field '(w h pl pr pt pb mt mb)])
       `(=> (and (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) ,r)) (is-float/none (float ,e)))
            (= (,field ,b) (,(sformat "~a.px" type) (,(sformat "style.~a" prop) ,r)))))

   ; The flow boxe of a float is an empty anonymous block box
   (=> (not (is-float/none (float ,e)))
       (and
        ,@(for/list ([field '(h pl pr pt pb mt mb ml mr bl br bt bb)])
            `(= (,field ,b) 0))))

   ; CSS § 10.3.3: Block-level, non-replaced elements in normal flow
   ; The following constraints must hold among the used values of the other properties:
   ; 'margin-left' + 'border-left-width' + 'padding-left' + 'width' + 'padding-right' + 'border-right-width' + 'margin-right' = width of containing block
   (= (w ,pb) (+ (ml ,b) (box-width ,b) (mr ,b)))

   ,(smt-cond
     [(not (is-float/none (float ,e)))
      true]
     ; See CSS § 10.3.3
     [(> (+ (ite (is-width/auto (style.width ,r)) 0.0 (width.px (style.width ,r)))
            (ite (is-margin/auto (style.margin-left ,r)) 0.0 (margin.px (style.margin-left ,r)))
            (ite (is-margin/auto (style.margin-right ,r)) 0.0 (margin.px (style.margin-right ,r)))
            (pl ,b) (pr ,b) (bl ,b) (br ,b))
         (w ,pb))
      ; It overflows. So what do we do? This is what Chrome & Firefox do (but see CSS § 10.3.3)
      (and
       (= (w ,b) (ite (is-width/auto (style.width ,r)) 0.0 (width.px (style.width ,r))))
       (= (ml ,b) (ite (is-margin/auto (style.margin-left ,r)) 0.0 (margin.px (style.margin-left ,r)))))]
     [(is-width/auto (style.width ,r))
      ; If it does not overflow, we set everything, and just figure out what to constrain.
      (and
       (= (ml ,b) (ite (is-margin/auto (style.margin-left ,r)) 0.0 (margin.px (style.margin-left ,r))))
       (= (mr ,b) (ite (is-margin/auto (style.margin-right ,r)) 0.0 (margin.px (style.margin-right ,r)))))]
     [else
      (and
       (= (w ,b) (width.px (style.width ,r)))
       (=> (and (is-margin/auto (style.margin-left ,r)) (is-margin/auto (style.margin-right ,r)))
           (= (ml ,b) (mr ,b)))
       (=> (is-margin/px (style.margin-left ,r)) (= (ml ,b) (margin.px (style.margin-left ,r))))
       (=> (and (is-margin/px (style.margin-right ,r)) (is-margin/auto (style.margin-left ,r)))
           (= (mr ,b) (margin.px (style.margin-right ,r)))))])

   ; Width and horizontal margins out of the way, let's do height and vertical margins
   ; CSS § 10.6.3 If 'margin-top', or 'margin-bottom' are 'auto', their used value is 0.
   (=> (and (is-float/none (float ,e)) (is-margin/auto (style.margin-top ,r))) (= (mt ,b) 0.0))
   (=> (and (is-float/none (float ,e)) (is-margin/auto (style.margin-bottom ,r))) (= (mb ,b) 0.0))

   ; If 'height' is 'auto', the height depends on whether the element has
   ; any block-level children and whether it has padding or borders:
   (=> (and (is-height/auto (style.height ,r)) (is-float/none (float ,e)))
       ,(smt-cond
         ; CSS § 10.6.3, item 1: the bottom edge of the last line box,
         ; if the box establishes a inline formatting context with one or more lines
         [(and (is-box ,lb) (is-box/line (type ,lb)))
          (= (bottom-content ,b) (bottom-border ,lb))]
         [(and (is-box ,lb) (is-box/block (type ,lb)))
          (= (bottom-content ,b)
             ; CSS § 10.6.3, item 2: the bottom edge of the bottom
             ; (possibly collapsed) margin of its last in-flow child,
             ; if the child's bottom margin does not collapse with the
             ; element's bottom margin
             (ite (and (= (pb ,b) 0.0) (= (bb ,b) 0.0) (not (= (tagname ,e) tag/html)))
                  (bottom-border ,lb) ; Collapsed bottom margin
                  (bottom-outer ,lb)))] ; No collapsed bottom margin
         ; CSS § 10.6.3, item 3: the bottom border edge of the last in-flow child
         ; whose top margin doesn't collapse with the element's bottom margin
         ; NOTE: This can happen if the box height is 0.
         ; We don't support that, so it's not an issue.

         ; CSS § 10.6.3, item 4: zero, otherwise
         [else (= (h ,b) 0.0)]))

   ; Computing X and Y position

   (=> (is-float/none (float ,e))
       (and
        (= (x ,b) (+ (left-content ,pb) (ml ,b)))
        (= (y ,b)
           (ite (is-no-box ,vb)
                (ite (and (not (= (tagname (get/elt (element ,pb))) tag/html)) (is-float/none (float (get/elt (element ,pb))))
                          (= (pt ,pb) 0.0) (= (bt ,pb) 0.0))
                     (top-content ,pb)
                     (+ (top-content ,pb) (+ (mtp ,b) (mtn ,b))))
                (+ (bottom-border ,vb) (max (mbp ,vb) (mtp ,b)) (min (mbn ,vb) (mtn ,b)))))))

   ; Positivity constraint---otherwise floats can overlap
   (> (box-height ,b) 0.0)

   ,@(for/list ([field '(pl pr pb pt w h)])
       `(>= (,field ,b) 0.0))
   ,@(for/list ([field '(bl br bt bb)])
       `(= (,field ,b) 0.0))))

(define (box-inline-constraints b)
  (define e `(get/elt (element ,b)))
  (define pb `(pbox ,b))
  (define vb `(vbox ,b))
  (define fb `(fbox ,b))
  (define lb `(lbox ,b))

  (asserts
   (= (type ,b) box/inline)

   ; Computing maximum collapsed positive and negative margin
   ,@(for/list ([field '(mtp mtn mbp mbn mt mr mb ml pt pr pb pl bt br bb bl)])
       `(= (,field ,b) 0.0))

   (between (top-content ,pb) (y ,b) (+ (top-content ,pb) (h ,pb) (- (h ,b))))

   ; Inline element layout
   (=> (not (is-no-box ,vb)) (= (x ,b) (right-border ,vb)))))

(define (box-line-constraints b)
  (define e `(get/elt (element ,b)))
  (define pb `(pbox ,b))
  (define vb `(vbox ,b))
  (define fb `(fbox ,b))
  (define lb `(lbox ,b))

  (asserts
   (= (type ,b) box/line)

   ; Computing maximum collapsed positive and negative margin
   ,@(for/list ([field '(mtp mtn mbp mbn mt mr mb ml pt pr pb pl bt br bb bl)])
       `(= (,field ,b) 0.0))

   (= (x ,b) (left-content ,pb))
   (= (y ,b) (ite (is-no-box ,vb) (top-content ,pb) (bottom-border ,vb)))
   (= (w ,b) (w ,pb))

   (not (is-no-box ,fb))
   ,(smt-cond
     [(is-text-align/left (textalign ,e)) (= (left-border ,fb) (left-content ,b))]
     [(is-text-align/right (textalign ,e)) (= (right-border ,lb) (right-content ,b))]
     [(is-text-align/center (textalign ,e))
      (= (- (right-content ,b) (right-border ,lb)) (- (left-border ,fb) (left-content ,b)))]
     [else true])))
