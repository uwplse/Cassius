#lang racket
(require "../common.rkt" "../smt.rkt" "css-properties.rkt")
(provide style-computation)

(define (prop-is-positive prop type elt)
  `(and
    (=> (,(sformat "is-~a/px" type) (,(sformat "style.~a" prop) (specified-style ,elt)))
        (<= 0.0 (,(sformat "~a.px" type) (,(sformat "style.~a" prop) (specified-style ,elt)))))
    (=> (,(sformat "is-~a/%" type) (,(sformat "style.~a" prop) (specified-style ,elt)))
        (<= 0.0 (,(sformat "~a.%" type) (,(sformat "style.~a" prop) (specified-style ,elt)))))))


(define-constraints style-computation
  (define-fun compute-style ((elt Element)) Bool
    (and ,@(for/list ([(prop type _d) (in-css-properties)])
             `(not (,(sformat "is-~a/inherit" (slower type))
                    (,(sformat "style.~a" prop) (specified-style elt)))))

         ,@(for/list ([prop '(width min-width max-width min-height max-height
                              margin-top margin-right margin-bottom margin-left
                              padding-top padding-right padding-bottom padding-left
                              border-top-style border-right-style border-bottom-style border-left-style
                              text-align overflow-x overflow-y position top bottom left right)])
             `(= (,(sformat "style.~a" prop) (computed-style elt))
                 (,(sformat "style.~a" prop) (specified-style elt))))

         ,(prop-is-positive 'width 'width 'elt)
         ,(prop-is-positive 'min-width 'min-width 'elt)
         ,(prop-is-positive 'max-width 'max-width 'elt)
         ,(prop-is-positive 'height 'height 'elt)
         ,(prop-is-positive 'min-height 'min-height 'elt)
         ,(prop-is-positive 'max-height 'max-height 'elt)

         ;; If the height of the containing block is not specified
         ;; explicitly (i.e., it depends on content height), and this
         ;; element is not absolutely positioned, the value computes
         ;; to 'auto'
         ;; TODO: Positioning case absent here
         (= (style.height (computed-style elt))
            (let ([h (style.height (specified-style elt))]
                  [h* (style.height (specified-style (pelt elt)))])
              (ite (and (not (or (is-height/px h) (is-height/auto h))) (is-height/auto h*))
                   height/auto
                   (style.height (specified-style elt)))))

         ;; This isn't what the standard says, but is what Firefox does.
         (= (style.float (computed-style elt))
            (let ([pos (style.position (specified-style elt))])
              (ite (or (is-position/relative pos) (is-position/static pos))
                   (style.float (specified-style elt))
                   float/none)))

         ;; border-*-width
         ,@(for/list ([dir '(top right bottom left)])
             `(= (,(sformat "style.border-~a-width" dir) (computed-style elt))
                 (ite (or (is-border-style/none (,(sformat "style.border-~a-style" dir) (specified-style elt)))
                          (is-border-style/hidden (,(sformat "style.border-~a-style" dir) (specified-style elt))))
                      (border/px 0.0)
                      (,(sformat "style.border-~a-width" dir) (specified-style elt))))))))
