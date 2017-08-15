#lang racket
(require "../common.rkt" "../smt.rkt" "css-properties.rkt" "../encode.rkt")
(provide style-computation)

;; This file defines the translation from specified to computed
;; styles. The specified style happens after all the cascading and so
;; on occurs, but it differs from the specified style in three weird
;; cases where CSS wants "bad" but legal values not to participate in
;; inheritance.

(define (prop-is-positive prop elt)
  (define type (slower (css-type prop)))
  `(and
    (=> (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) (specified-style ,elt)))
        (<= 0.0 (,(sformat "~a.px" type) (,(sformat "style.~a" prop) (specified-style ,elt)))))
    (=> (,(sformat "is-~a/em" type) (,(sformat "style.~a" prop) (specified-style ,elt)))
        (<= 0.0 (,(sformat "~a.em" type) (,(sformat "style.~a" prop) (specified-style ,elt)))))
    (=> (,(sformat "is-~a/%" type) (,(sformat "style.~a" prop) (specified-style ,elt)))
        (<= 0.0 (,(sformat "~a.%" type) (,(sformat "style.~a" prop) (specified-style ,elt)))))))

(define simple-computed-properties
  ;; These are properties whose computed style is just directly their specified style
  (append
   '(width min-width max-width min-height max-height)
   '(margin-top margin-right margin-bottom margin-left)
   '(padding-top padding-right padding-bottom padding-left)
   '(border-top-style border-right-style border-bottom-style border-left-style)
   '(text-align overflow-x overflow-y position top bottom left right)
   '(font-size box-sizing display text-indent clear)
   '(color background-color line-height)))

(define (prop-is-simple prop elt)
  `(= (,(sformat "style.~a" prop) (computed-style ,elt))
      (ite (,(sformat "is-~a/inherit" (slower (css-type prop)))
            (,(sformat "style.~a" prop) (specified-style ,elt)))
           (ite (is-elt (pelt ,elt))
                (,(sformat "style.~a" prop) (computed-style (pelt ,elt)))
                ,(dump-value (css-type prop) (css-default prop)))
           (,(sformat "style.~a" prop) (specified-style ,elt)))))

(define (not-inherited prop elt)
  `(not (,(sformat "is-~a/inherit" (slower (css-type prop)))
         (,(sformat "style.~a" prop) (computed-style ,elt)))))

(define positive-properties
  (append
   '(width min-width max-width height min-height max-height)
   '(padding-top padding-right padding-bottom padding-left)
   '(border-top-width border-right-width border-bottom-width border-left-width)))

(define-constraints style-computation
  (define-fun compute-style ((elt Element)) Bool
    (and
     ,@(map (curryr not-inherited 'elt) (css-properties))
     ,@(map (curryr prop-is-simple 'elt) simple-computed-properties)
     ,@(map (curryr prop-is-positive 'elt) positive-properties)

     ;; CSS 2.1 § 10.5: height
     ;; TODO: Positioning case absent here
     ;; TODO: Also applies somewhat to max and min height, not implemented here
     (= (style.height (computed-style elt))
        (let ([h (style.height (specified-style elt))]
              [h* (style.height (computed-style (pelt elt)))])
          (ite (is-height/inherit h)
               (ite (is-elt (pelt elt)) h* height/auto)
               (ite (and (is-height/% h) (is-height/auto h*))
                    height/auto
                    h))))

     ;; CSS 2.1 § 9.7: relationship between `float` and `position`
     ;; NOTE: The standard is ambiguous / undefined, but this is what Firefox does.
     (= (style.float (computed-style elt))
        (let ([pos (style.position (specified-style elt))])
          (ite (or (is-position/absolute pos) (is-position/fixed pos))
               float/none
               (ite (is-float/inherit (style.float (specified-style elt)))
                    (ite (is-elt (pelt elt)) (style.float (computed-style (pelt elt))) float/none)
                    (style.float (specified-style elt))))))

     ;; CSS 2.1 § 8.5.3: border-style and border-width
     ,@(for/list ([dir '(top right bottom left)])
         `(= (,(sformat "style.border-~a-width" dir) (computed-style elt))
             (ite (or (is-border-style/none (,(sformat "style.border-~a-style" dir) (computed-style elt)))
                      (is-border-style/hidden (,(sformat "style.border-~a-style" dir) (computed-style elt))))
                  (border/px 0.0)
                  (ite (is-border/inherit (,(sformat "style.border-~a-width" dir) (specified-style elt)))
                       (ite (is-elt (pelt elt))
                            (,(sformat "style.border-~a-width" dir) (computed-style (pelt elt)))
                            (border/px 0.0))
                       (,(sformat "style.border-~a-width" dir) (specified-style elt)))))))))

(module+ test
  (require rackunit)
  (check set=?
         (set-union simple-computed-properties
                    '(height float border-top-width border-right-width border-bottom-width border-left-width))
         (css-properties)))
