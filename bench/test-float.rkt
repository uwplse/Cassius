;; python get_bench.py 'file:///home/pavpan/cassius/bench/test-float.html'

(define-header header "div {background: red} p {margin: 0}")

(define-stylesheet unknown-sheet ? ? ?)

(define-stylesheet good-sheet
  ((sel/tag tag/body)
   [width (width/px 800)]
   [margin-top (margin/px 8)]
   [margin-left (margin/px 8)]
   [margin-bottom (margin/px 16)]
   [margin-right (margin/px 8)])
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

;; From file:///home/pavpan/cassius/bench/test-float.html

(define-document (doc-a #:width 1920)
  ([BLOCK :tag HTML :x 0 :y 0 :w 1920 #|:h 518|#]
   ([BLOCK :tag BODY :x 8 :y 16 :w 800 #|:h 358|#]
    ([BLOCK :tag DIV :id left :x 18 :y 26 :w 200 :h 200])
    ([BLOCK :tag P :x 8 :y 16 :w 800 :h 266]
     ([LINE :x 228 :y 16 :w 580 :h 19]
      ([TEXT :x 228 :y 17.5 :w 555 :h 16]))
     ([LINE :x 228 :y 35 :w 580 :h 19]
      ([TEXT :x 228 :y 36.5 :w 555 :h 16]))
     ([LINE :x 228 :y 54 :w 580 :h 19]
      ([TEXT :x 228 :y 55.5 :w 555 :h 16]))
     ([LINE :x 228 :y 73 :w 580 :h 19]
      ([TEXT :x 228 :y 74.5 :w 555 :h 16]))
     ([LINE :x 228 :y 92 :w 580 :h 19]
      ([TEXT :x 228 :y 93.5 :w 555 :h 16]))
     ([LINE :x 228 :y 111 :w 580 :h 19]
      ([TEXT :x 228 :y 112.5 :w 555 :h 16]))
     ([LINE :x 228 :y 130 :w 580 :h 19]
      ([TEXT :x 228 :y 131.5 :w 555 :h 16]))
     ([LINE :x 228 :y 149 :w 580 :h 19]
      ([TEXT :x 228 :y 150.5 :w 555 :h 16]))
     ([LINE :x 228 :y 168 :w 580 :h 19]
      ([TEXT :x 228 :y 169.5 :w 555 :h 16]))
     ([LINE :x 228 :y 187 :w 580 :h 19]
      ([TEXT :x 228 :y 188.5 :w 555 :h 16]))
     ([LINE :x 228 :y 206 :w 580 :h 19]
      ([TEXT :x 228 :y 207.5 :w 555 :h 16]))
     ([LINE :x 228 :y 225 :w 580 :h 19]
      ([TEXT :x 228 :y 226.5 :w 555 :h 16]))
     ([LINE :x 8 :y 244 :w 800 :h 19]
      ([TEXT :x 8 :y 245.5 :w 800 :h 16]))
     ([LINE :x 8 :y 263 :w 800 :h 19]
      ([TEXT :x 8 :y 264.5 :w 30 :h 16])))
    ([BLOCK :tag DIV :id right :x 598 :y 292 :w 200 :h 200])
    ([BLOCK :tag P :x 8 :y 282 :w 800 :h 76]
     ([LINE :x 8 :y 282 :w 580 :h 19]
      ([TEXT :x 8 :y 283.5 :w 555 :h 16]))
     ([LINE :x 8 :y 301 :w 580 :h 19]
      ([TEXT :x 8 :y 302.5 :w 555 :h 16]))
     ([LINE :x 8 :y 320 :w 580 :h 19]
      ([TEXT :x 8 :y 321.5 :w 555 :h 16]))
     ([LINE :x 8 :y 339 :w 580 :h 19]
      ([TEXT :x 8 :y 340.5 :w 205 :h 16]))))))

(define-problem verify
  #:header header
  #:sheet good-sheet
  #:documents doc-a)

(define-problem synthesize
  #:header header
  #:sheet unknown-sheet
  #:documents doc-a)
