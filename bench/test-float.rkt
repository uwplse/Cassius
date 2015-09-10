;; python get_bench.py 'file:///home/pavpan/cassius/bench/test-float-a.html'

(define-header header "div {background: red} p {margin: 0}")

(define-stylesheet unknown-sheet ? ? ?)

(define-stylesheet good-sheet
  ((sel/tag tag/body)
   [width (width/px 800)]
   [margin-top (margin/px 16)]
   [margin-left (margin/px 8)]
   [margin-bottom (margin/px 16)]
   [margin-right (margin/px 8)])
  ((sel/tag tag/p)
   [margin-top (margin/px 0)]
   [margin-bottom (margin/px 0)])
  ((sel/id id/left)
   [float float/left])
  ((sel/id id/right)
   [float float/right])
  ((sel/tag tag/div)
   [width (width/px 200)]
   [height (height/px 200)]
   [margin-top (margin/px 10)]
   [margin-left (margin/px 10)]
   [margin-bottom (margin/px 10)]
   [margin-right (margin/px 10)]))

;; From file:///home/pavpan/cassius/bench/test-float-a.html

(define-document (doc-a #:width 900 #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 900 #|:h 502|#]
   ([BLOCK :tag BODY :x 8 :y 16 :w 800 #|:h 342|#]
    ([BLOCK :tag DIV :x 18 :y 26 :w 200 :h 200 :id left])
    ([BLOCK :tag P :x 8 :y 16 :w 800 :h 266]
     ([LINE :h 19]
      ([TEXT :x 228 :y 17.5 :w 568 :h 16 :text " Test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 228 :y 36.5 :w 565 :h 16 :text "test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 228 :y 55.5 :w 565 :h 16 :text "test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 228 :y 74.5 :w 565 :h 16 :text "test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 228 :y 93.5 :w 565 :h 16 :text "test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 228 :y 112.5 :w 565 :h 16 :text "test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 228 :y 131.5 :w 565 :h 16 :text "test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 228 :y 150.5 :w 565 :h 16 :text "test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 228 :y 169.5 :w 565 :h 16 :text "test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 228 :y 188.5 :w 565 :h 16 :text "test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 228 :y 207.5 :w 565 :h 16 :text "test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 228 :y 226.5 :w 565 :h 16 :text "test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 8 :y 245.5 :w 793 :h 16 :text "test test test test test test test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 8 :y 264.5 :w 565 :h 16 :text "test test test test test test test test test test test test test test test "])))
    ([BLOCK :tag DIV :x 598 :y 292 :w 200 :h 200 :id right])
    ([BLOCK :tag P :x 8 :y 282 :w 800 :h 76 :print]
     ([LINE :h 19]
      ([TEXT :x 8 :y 283.5 :w 565 :h 16 :text " test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 8 :y 302.5 :w 565 :h 16 :text "test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 8 :y 321.5 :w 565 :h 16 :text "test test test test test test test test test test test test test test test "]))
     ([LINE :h 19]
      ([TEXT :x 8 :y 340.5 :w 337 :h 16 :text "test test test test test test test test test "]))))))

(define-problem verify
  #:header header
  #:sheet good-sheet
  #:documents doc-a)

(define-problem synthesize
  #:header header
  #:sheet unknown-sheet
  #:documents doc-a)
