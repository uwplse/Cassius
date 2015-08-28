;; python get_bench.py 'file:///home/pavpan/cassius/bench/test-float.html'

(define-header header "div {background: red}")

(define-stylesheet unknown-sheet ? ?)

(define-stylesheet good-sheet
  ((sel/tag tag/BODY)
   [width (width/px 800)])
  ((set/tag tag/DIV)
   [width (width/px 200)]
   [height (height/px 200)]
   [margin-top (margin/px 10)]
   [margin-left (margin/px 10)]
   [margin-bottom (margin/px 10)]
   [margin-right (margin/px 10)]
   [float float/left]))

;; From file:///home/pavpan/cassius/bench/test-float.html

(define-document (doc-a #:width 1015)
  ([BLOCK :tag HTML :x 0 :y 0 :w 1015 #|:h 355|#]
   ([BLOCK :tag BODY :x 8 :y 16 :w 800 #|:h 323|# :print]
    ([FLOAT :tag DIV :x 18 :y 16 :w 200 :h 200 :print])
    ([BLOCK :tag P :x 8 :y 16 :w 800 :h 323]
     ([LINE :x 228 :w 580 :y 16 :h 19 :print]
      ([TEXT :x 228 :y 17.5 :w 568 :h 16]))
     ([LINE :x 228 :w 580 :y 35 :h 19]
      ([TEXT :x 228 :y 36.5 :w 565 :h 16]))
     ([LINE :x 228 :w 580 :y 54 :h 19]
      ([TEXT :x 228 :y 55.5 :w 565 :h 16]))
     ([LINE :x 228 :w 580 :y 73 :h 19]
      ([TEXT :x 228 :y 74.5 :w 565 :h 16]))
     ([LINE :x 228 :w 580 :y 92 :h 19]
      ([TEXT :x 228 :y 93.5 :w 565 :h 16]))
     ([LINE :x 228 :w 580 :y 111 :h 19]
      ([TEXT :x 228 :y 112.5 :w 565 :h 16]))
     ([LINE :x 228 :w 580 :y 130 :h 19]
      ([TEXT :x 228 :y 131.5 :w 565 :h 16]))
     ([LINE :x 228 :w 580 :y 149 :h 19]
      ([TEXT :x 228 :y 150.5 :w 565 :h 16]))
     ([LINE :x 228 :w 580 :y 168 :h 19]
      ([TEXT :x 228 :y 169.5 :w 565 :h 16]))
     ([LINE :x 228 :w 580 :y 187 :h 19]
      ([TEXT :x 228 :y 188.5 :w 565 :h 16]))
     ([LINE :x 228 :w 580 :y 206 :h 19]
      ([TEXT :x 228 :y 207.5 :w 565 :h 16]))
     ([LINE :x 228 :w 580 :y 225 :h 19]
      ([TEXT :x 228 :y 226.5 :w 565 :h 16]))
     ([LINE :x 8 :w 800 :y 244 :h 19]
      ([TEXT :x 8 :y 245.5 :w 793 :h 16]))
     ([LINE :x 8 :w 800 :y 263 :h 19]
      ([TEXT :x 8 :y 264.5 :w 793 :h 16]))
     ([LINE :x 8 :w 800 :y 282 :h 19]
      ([TEXT :x 8 :y 283.5 :w 793 :h 16]))
     ([LINE :x 8 :w 800 :y 301 :h 19]
      ([TEXT :x 8 :y 302.5 :w 793 :h 16]))
     ([LINE :x 8 :w 800 :y 320 :h 19]
      ([TEXT :x 8 :y 321.5 :w 223 :h 16]))))))

(define-problem verify
  #:header header
  #:sheet unknown-sheet
  #:documents doc-a)

(define-problem synthesize
  #:header header
  #:sheet unknown-sheet
  #:documents doc-a)
