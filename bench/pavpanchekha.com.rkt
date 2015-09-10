;; python get_bench.py 'http://pavpanchekha.com/blog/ubuntu-on-lvm.html' 'http://pavpanchekha.com/blog/organization.html'

;; EDITS:
; - <HTML> and <BODY> have :h turned off; no idea why it doesn't work

(define-header header
"html { background-color: #f1f1f1; color: #2E3436; }
body { font-size: 18px; line-height: 1.333; text-rendering: optimizeLegibility; font-family: 'PT Serif', serif; }
pre { font-family: 'Open Sans Light', 'Inconsolata', 'Deja Vu Sans Mono', monospace; font-weight: 300;}
h1 { font-family: 'Open Sans Semibold', 'Deja Vu Sans', 'Georgia', sans; font-weight: 600;
     font-size: 24px; line-height: 1; letter-spacing: -.03em; color: #555753;}
p { -moz-hyphens: auto; -webkit-hyphens: auto; hyphens: auto;}
#content p {text-align: justify}
#postamble p {font-size: 13px; line-height: 1.23;}")

(define-stylesheet unknown-sheet
  ? ? ? ?)

(define-stylesheet partial-good-sheet
  ((sel/tag tag/html) ?)
  ((sel/tag tag/body) ?)
  ((sel/tag tag/pre) ?)
  ((sel/tag tag/h1) ?)
  ((sel/tag tag/p) ?)
  ((sel/id id/postamble) ?))

(define-stylesheet good-sheet
  ((sel/tag tag/html)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((sel/tag tag/body)
   [margin-top (margin/px 0)]
   [margin-right margin/auto]
   [margin-bottom (margin/px 0)]
   [margin-left margin/auto]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 90)]
   [padding-left (padding/px 10)]
   [width (width/px 630)])
  ((sel/tag tag/pre)
   [margin-top (margin/px 21.6)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 30.6)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 9)]
   [padding-right (padding/px 9)]
   [padding-bottom (padding/px 9)]
   [padding-left (padding/px 9)])
  ((sel/tag tag/h1)
   [margin-top (margin/px 36)]
   [margin-bottom (margin/px 0)])
  ((sel/tag tag/p)
   [text-align text-align/inherit]
   [margin-top (margin/px 18)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 18)]
   [margin-left (margin/px 0)])
  ((sel/id id/postamble)
   [text-align text-align/center]
   [margin-top (margin/px 18)]))

;; From http://pavpanchekha.com/blog/ubuntu-on-lvm.html

(define-document (doma #:width 958)
  ([BLOCK :tag HTML :x 0 :y 0 :w 958 #|:h (/ 10291 12)|#]
   ([BLOCK :tag BODY :x 154 :y 36 :w 650 #|:h (/ 8779 12)|#]
    ([BLOCK :tag DIV :id content :x 164 :y 36 :w 630 :h 582]
     ([BLOCK :tag H1 :x 164 :y 36 :w 630 :h 24]
      ([LINE  :x 164 :y 36 :w 630 :h 24]
       ([TEXT :x 164 :y 31.5 :w 273.8 :h 33])))
     ([BLOCK :tag P :x 164 :y 78 :w 630 :h 24]
      ([LINE  :x 164 :y 78 :w 630 :h 24]
       ([TEXT :x 164 :y 79.5 :w 215 :h 21])))
     ([BLOCK :tag DIV :x 164 :y 123.6 :w 630 :h 66]
      ([BLOCK :tag PRE :x 164 :y 123.6 :w 630 :h 66]
       ([LINE  :x 173 :y 132.6 :w 612 :h 24]
        ([TEXT :x 173 :y 132.6 :w 199 :h 24]))
       ([LINE  :x 173 :y 156.6 :w 612 :h 24]
        ([TEXT :x 173 :y 156.6 :w 152 :h 24]))))
     ([BLOCK :tag P :x 164 :y 220.2 :w 630 :h 48]
      ([LINE  :x 164 :y 220.2 :w 630 :h 24]
       ([TEXT :x 164 :y 221.7 :w 630 :h 21]))
      ([LINE  :x 164 :y 244.2 :w 630 :h 24]
       ([TEXT :x 164 :y 245.7 :w 68 :h 21])))
     ([BLOCK :tag DIV :x 164 :y 289.8 :w 630 :h 162]
      ([BLOCK :tag PRE :x 164 :y 289.8 :w 630 :h 162]
       ([LINE  :x 173 :y 298.8 :w 612 :h 24]
        ([TEXT :x 173 :y 298.8 :w 349 :h 24]))
       ([LINE  :x 173 :y 322.8 :w 612 :h 24]
        ([TEXT :x 173 :y 322.8 :w 284 :h 24]))
       ([LINE  :x 173 :y 346.8 :w 612 :h 24]
        ([TEXT :x 173 :y 346.8 :w 302 :h 24]))
       ([LINE  :x 173 :y 370.8 :w 612 :h 24]
        ([TEXT :x 173 :y 370.8 :w 292 :h 24]))
       ([LINE  :x 173 :y 394.8 :w 612 :h 24]
        ([TEXT :x 173 :y 394.8 :w 362 :h 24]))
       ([LINE  :x 173 :y 418.8 :w 612 :h 24]
        ([TEXT :x 173 :y 418.8 :w 145 :h 24]))))
     ([BLOCK :tag P :x 164 :y 482.4 :w 630 :h 48]
      ([LINE  :x 164 :y 482.4 :w 630 :h 24]
       ([TEXT :x 164 :y 483.9 :w 630 :h 21]))
      ([LINE  :x 164 :y 506.4 :w 630 :h 24]
       ([TEXT :x 164 :y 507.9 :w 97 :h 21])))
     ([BLOCK :tag DIV :x 164 :y 552 :w 630 :h 66]
      ([BLOCK :tag PRE :x 164 :y 552 :w 630 :h 66]
       ([LINE  :x 173 :y 561 :w 612 :h 24]
        ([TEXT :x 173 :y 561 :w 199 :h 24]))
       ([LINE  :x 173 :y 585 :w 612 :h 24]
        ([TEXT :x 173 :y 585 :w 247 :h 24])))))
    ([BLOCK :tag DIV :id postamble :x 164 :y 648.6 :w 630 :h 16]
     ([BLOCK :tag P :x 164 :y 648.6 :w 630 :h 16]
      ([LINE  :x 164 :y 648.6 :w 630 :h 16]
       ([TEXT :x 305.5 :y (/ 7789 12) :w 21  :h 15])
       ([TEXT :x 326.5 :y (/ 7789 12) :w 108 :h 15])
       ([TEXT :x 434.5 :y (/ 7789 12) :w 95  :h 15])
       ([TEXT :x 529.5 :y (/ 7789 12) :w 119 :h 15])
       ([TEXT :x 648.5 :y (/ 7789 12) :w 4   :h 15])))))))

;; From http://pavpanchekha.com/blog/organization.html

(define-document (domb #:width 945)
  ([BLOCK :tag HTML :x 0 :y 0 :w 945]
   ([BLOCK :tag BODY :x 147.5 :y 36 :w 650 #|:h (/ 33465 30)|#]
    ([BLOCK :tag DIV :id content :x 157.5 :y 36 :w 630 :h 978.5]
     ([BLOCK :tag H1 :x 157.5 :y 36 :w 630 :h 24]
      ([LINE :x 157.5 :y 36 :w 630 :h 24]
       ([TEXT :x 157.5 :y 31.5 :w 205.1 :h 33])))
     ([BLOCK :tag P :x 157.5 :y 78 :w 630 :h 120.5]
      ([LINE :x 157.5 :w 630 :y 78 :h 24.5]
       ([TEXT :x 157.5 :w (/ 3235 6):y 80 :h 21])
       ([INLINE :tag SPAN :x (/ 2090 3) :w 19]
        ([TEXT :x (/ 2090 3) :w 19 :y 78 :h 24]))
       ([TEXT :x (/ 2147 3) :w (/ 431 6) :y 80 :h 21]))
      ([LINE :x 157.5 :y 102.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 104 :w 630 :h 21]))
      ([LINE :x 157.5 :y 126.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 128 :w 630 :h 21]))
      ([LINE :x 157.5 :y 150.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 152 :w 630 :h 21]))
      ([LINE :x 157.5 :y 174.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 176 :w 506 :h 21])))
     ([BLOCK :tag P :x 157.5 :y 216.5 :w 630 :h 240]
      ([LINE :x 157.5 :y 216.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 218 :w 630 :h 21]))
      ([LINE :x 157.5 :y 240.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 242 :w 630 :h 21]))
      ([LINE :x 157.5 :y 264.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 266 :w 630 :h 21]))
      ([LINE :x 157.5 :y 288.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 290 :w 630 :h 21]))
      ([LINE :x 157.5 :y 312.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 314 :w 630 :h 21]))
      ([LINE :x 157.5 :y 336.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 338 :w 630 :h 21]))
      ([LINE :x 157.5 :y 360.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 362 :w 630 :h 21]))
      ([LINE :x 157.5 :y 384.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 386 :w 630 :h 21]))
      ([LINE :x 157.5 :y 408.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 410 :w 630 :h 21]))
      ([LINE :x 157.5 :y 432.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 434 :w 228 :h 21])))
     ([BLOCK :tag P :x 157.5 :y 474.5 :w 630 :h 240]
      ([LINE :x 157.5 :y 474.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 476 :w 630 :h 21]))
      ([LINE :x 157.5 :y 498.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 500 :w 630 :h 21]))
      ([LINE :x 157.5 :y 522.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 524 :w 630 :h 21]))
      ([LINE :x 157.5 :y 546.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 548 :w 630 :h 21]))
      ([LINE :x 157.5 :y 570.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 572 :w 630 :h 21]))
      ([LINE :x 157.5 :y 594.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 596 :w 630 :h 21]))
      ([LINE :x 157.5 :y 618.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 620 :w 630 :h 21]))
      ([LINE :x 157.5 :y 642.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 644 :w 630 :h 21]))
      ([LINE :x 157.5 :y 666.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 668 :w 630 :h 21]))
      ([LINE :x 157.5 :y 690.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 692 :w 62 :h 21])))
     ([BLOCK :tag P :x 157.5 :y 732.5 :w 630 :h 216]
      ([LINE :x 157.5 :y 732.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 734 :w 630 :h 21]))
      ([LINE :x 157.5 :y 756.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 758 :w 630 :h 21]))
      ([LINE :x 157.5 :y 780.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 782 :w 630 :h 21]))
      ([LINE :x 157.5 :y 804.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 806 :w 630 :h 21]))
      ([LINE :x 157.5 :y 828.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 830 :w 630 :h 21]))
      ([LINE :x 157.5 :y 852.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 854 :w 630 :h 21]))
      ([LINE :x 157.5 :y 876.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 878 :w 630 :h 21]))
      ([LINE :x 157.5 :y 900.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 902 :w 630 :h 21]))
      ([LINE :x 157.5 :y 924.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 926 :w 93 :h 21])))
     ([BLOCK :tag P :x 157.5 :y 966.5 :w 630 :h 48]
      ([LINE :x 157.5 :y 966.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 968 :w 630 :h 21]))
      ([LINE :x 157.5 :y 990.5 :w 630 :h 24]
       ([TEXT :x 157.5 :y 992 :w 281 :h 21]))))
    ([BLOCK :tag DIV :id postamble :x 157.5 :y 1032.5 :w 630 :h 16]
     ([BLOCK :tag P :x 157.5 :y 1032.5 :w 630 :h 16]
      ([LINE :x 157.5 :y 1032.5 :w 630 :h 16]
       ([TEXT :x 299 :y 1033 :w 21 :h 15])
       ([TEXT :x 320 :y 1033 :w 108 :h 15])
       ([TEXT :x 428 :y 1033 :w 95 :h 15])
       ([TEXT :x 523 :y 1033 :w 119 :h 15])
       ([TEXT :x 642 :y 1033 :w 4 :h 15])))))))

(define-problem verify
  #:header header
  #:sheet good-sheet
  #:documents doma domb)

(define-problem sketch
  #:header header
  #:sheet partial-good-sheet
  #:documents doma domb)

(define-problem synthesize
  #:header header
  #:sheet unknown-sheet
  #:documents doma domb)
