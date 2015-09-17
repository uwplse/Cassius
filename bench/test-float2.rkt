;; python get_bench.py --name test-float2 'file:/home/pavpan/cassius/bench/test-float2-a.html'

(define-header header
"")

(define-stylesheet unknown-sheet ? ? ?)

(define-stylesheet good-sheet
  ((sel/tag tag/body)
   [width (width/px 800)]
   [margin-top (margin/px 16)]
   [margin-left (margin/px 8)]
   [margin-bottom (margin/px 16)]
   [margin-right (margin/px 8)])
  ((sel/id id/left)
   [float float/left])
  ((sel/tag tag/div)
   [width (width/px 200)]
   [height (height/px 200)]
   [margin-top (margin/px 10)]
   [margin-left (margin/px 10)]
   [margin-bottom (margin/px 10)]
   [margin-right (margin/px 10)])
  ;; This is a workaround: we don't handle margin-collapse
  ;; for zero-height boxes correctly, and this makes it work anyway
  ((sel/tag tag/figure)
   [margin-top (margin/px 0)]
   [margin-bottom (margin/px 0)])
  ((sel/tag tag/p)
   [margin-top (margin/px 0)]
   [margin-bottom (margin/px 0)]))

;; From file:/home/pavpan/cassius/bench/test-float2-a.html

(define-document (doc-a #:width 958 #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 958 :h 317]
   ([BLOCK :tag BODY :x 8 :y 16 :w 800 :h 285]
    ([BLOCK :tag FIGURE :x 48 :y 16 :w 720 :h 0]
     ([BLOCK :tag DIV :x 58 :y 26 :w 200 :h 200 :id left]))
    ([BLOCK :tag P :x 8 :y 16 :w 800 :h 285]
     ([LINE :h 19]
      ([TEXT :x 268 :y 17.5 :w 530 :h 16 :text " Test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 268 :y 36.5 :w 527 :h 16 :text "test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 268 :y 55.5 :w 527 :h 16 :text "test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 268 :y 74.5 :w 527 :h 16 :text "test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 268 :y 93.5 :w 527 :h 16 :text "test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 268 :y 112.5 :w 527 :h 16 :text "test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 268 :y 131.5 :w 527 :h 16 :text "test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 268 :y 150.5 :w 527 :h 16 :text "test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 268 :y 169.5 :w 527 :h 16 :text "test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 268 :y 188.5 :w 527 :h 16 :text "test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 268 :y 207.5 :w 527 :h 16 :text "test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 268 :y 226.5 :w 527 :h 16 :text "test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 8 :y 245.5 :w 793 :h 16 :text "test test test test test test test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 8 :y 264.5 :w 793 :h 16 :text "test test test test test test test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 8 :y 283.5 :w 223 :h 16 :text "test test test test test test "]))))))

(define-problem synthesize
  #:header header
  #:sheet unknown-sheet
  #:documents doc-a)

(define-problem verify
  #:header header
  #:sheet good-sheet
  #:documents doc-a)

(define-problem render
  #:header header
  #:sheet good-sheet
  #:documents (print-all (strip-positions doc-a)))
