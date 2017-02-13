#lang racket
(require "../common.rkt" "../smt.rkt" "css-properties.rkt")
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
   '(font-size)))

(define (prop-is-simple prop elt)
  `(= (,(sformat "style.~a" prop) (computed-style ,elt))
      (,(sformat "style.~a" prop) (specified-style ,elt))))

(define (not-inherited prop elt)
  `(not (,(sformat "is-~a/inherit" (slower (css-type prop)))
         (,(sformat "style.~a" prop) (specified-style ,elt)))))

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
              [h* (style.height (specified-style (pelt elt)))])
          (ite (and (not (or (is-height/px h) (is-height/auto h))) (is-height/auto h*))
               height/auto
               (style.height (specified-style elt)))))

     ;; CSS 2.1 § 9.5.1: float and positioning
     ;; NOTE: The standard is ambiguous / undefined, but this is what Firefox does.
     (= (style.float (computed-style elt))
        (let ([pos (style.position (specified-style elt))])
          (ite (or (is-position/relative pos) (is-position/static pos))
               (style.float (specified-style elt))
               float/none)))

     ;; CSS 2.1 § 8.5.3: border-style and border-width
     ,@(for/list ([dir '(top right bottom left)])
         `(= (,(sformat "style.border-~a-width" dir) (computed-style elt))
             (ite (or (is-border-style/none (,(sformat "style.border-~a-style" dir) (specified-style elt)))
                      (is-border-style/hidden (,(sformat "style.border-~a-style" dir) (specified-style elt))))
                  (border/px 0.0)
                  (,(sformat "style.border-~a-width" dir) (specified-style elt))))))))
