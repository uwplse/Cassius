(define-header header "")

(define-stylesheet main
  ((tag body)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((tag main)
   #;[background-color background-color/gray]
   #;[background-image background-image/none]
   #;[background-repeat background-repeat/repeat]
   #;[background-attachment background-attachment/scroll]
   #;[background-position (background-position/px 0)]
   #;[background-clip background-clip/border-box]
   #;[background-origin background-origin/padding-box]
   #;[background-size background-size/auto auto]
   [width width/100%]
   [float float/left])
  ((tag div)
   [float float/left]
   #;[font-size (font-size/px 192)]
   [width (width/px 200)]
   [height (height/px 200)]))

(define-document (four #:width 400 #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 400 :h 486]
   ([BLOCK :tag BODY :x 0 :y 16 :w 400 :h 454]
    ([BLOCK :tag P :x 0 :y 16 :w 400 :h 19]
     ([LINE]
      ([TEXT :x 0 :y 16 :w 112 :h 19])))
    ([BLOCK :tag MAIN :x 0 :y 51 :w 400 :h 400]
     ([BLOCK :tag DIV :x 0 :y 51 :w 200 :h 200]
      ([LINE]
       ([TEXT :x 0 :y 54 :w 139 :h 224])))
     ([BLOCK :tag DIV :x 200 :y 51 :w 200 :h 200]
      ([LINE]
       ([TEXT :x 200 :y 54 :w 142 :h 224])))
     ([BLOCK :tag DIV :x 0 :y 251 :w 200 :h 200]
      ([LINE]
       ([TEXT :x 0 :y 254 :w 147 :h 224])))
     ([BLOCK :tag DIV :x 200 :y 251 :w 200 :h 200]
      ([LINE]
       ([TEXT :x 200 :y 254 :w 155 :h 224]))))
    ([BLOCK :tag P :x 0 :y 51 :w 400 :h 419]
     ([LINE]
      ([TEXT :x 0 :y 451 :w 76 :h 19]))))))

(define-problem verify
  ""
  #:url "file:///home/Dropbox/Work/Cassius/intro-example.html"
  #:header header
  #:sheet main
  #:documents four
  #:features (%))
