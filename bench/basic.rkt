
(define-header header "body { background: green; } div { background: blue; } html { background: white; }")

(define-stylesheet unknown-sheet ? ? ?)

(define-stylesheet good-sheet
  ((sel/tag tag/body)
   [width (width/px 400)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 100)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 100)]
   [height (height/px 334)]
   [float float/left]
   [padding-top (padding/px 66)]
   [padding-left (padding/px 100)]
   [padding-bottom (padding/px 0)]
   [padding-right (padding/px 100)])
  ((sel/tag tag/div)
   [width (width/px 400)]
   [height (height/px 100)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 67)]
   [margin-left (margin/px 0)]))

(define-document (doc #:width 800 #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 800]
   ([BLOCK :tag BODY :x 100 :y   0 :w 600 :h 400]
    ([BLOCK :tag DIV :id short :x 200 :y  66 :w 400 :h 100])
    ([BLOCK :tag DIV :x 200 :y 233 :w 400 :h 100 :print]))))

(define-problem verify
  #:header header
  #:sheet good-sheet
  #:documents doc)

(define-problem synthesize
  #:header header
  #:sheet unknown-sheet
  #:documents doc)
