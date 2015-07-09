#lang racket
(require "../cassius/main.rkt")

;; python get_bench.py 'http://pavpanchekha.com/blog/ubuntu-on-lvm.html' 'http://pavpanchekha.com/blog/organization.html'

;; EDITS:
; - No footer text (centered text)
; - Ignore doc 2 (inline text of different sizes)

(define header
"html { background-color: #f1f1f1; color: #2E3436;}
body { font-size: 18px; line-height: 1.333; text-rendering: optimizeLegibility; font-family: 'PT Serif', serif;}
pre { font-family: 'Open Sans Light', 'Inconsolata', 'Deja Vu Sans Mono', monospace; font-weight: 300;}
h1 { font-family: 'Open Sans Semibold', 'Deja Vu Sans', 'Georgia', sans; font-weight: 600;
     font-size: 24px; line-height: 1; letter-spacing: -.03em; color: #555753;}
p { text-align: justify; -moz-hyphens: auto; -webkit-hyphens: auto; hyphens: auto;}")

(define sheet '(#f #f #f #f))
#;(define sheet
  '(((sel/tag box/<HTML>)
     [margin-top (margin/px 0)]
     [margin-right (margin/px 0)]
     [margin-bottom (margin/px 0)]
     [margin-left (margin/px 0)]
     [padding-top (padding/px 0)]
     [padding-right (padding/px 0)]
     [padding-bottom (padding/px 0)]
     [padding-left (padding/px 0)])
    ((sel/tag box/<BODY>)
     [margin-top (margin/px 0)]
     [margin-right margin/auto]
     [margin-bottom (margin/px 0)]
     [margin-left margin/auto]
     [padding-top (padding/px 0)]
     [padding-right (padding/px 10)]
     [padding-bottom (padding/px 90)]
     [padding-left (padding/px 10)]
     [width (width/px 630)])
    ((sel/tag box/<PRE>)
     [margin-top (margin/px 21.6)]
     [margin-right (margin/px 0)]
     [margin-bottom (margin/px 30.6)]
     [margin-left (margin/px 0)]
     [padding-top (padding/px 9)]
     [padding-right (padding/px 9)]
     [padding-bottom (padding/px 9)]
     [padding-left (padding/px 9)])
    ((sel/tag box/<H1>)
     [margin-top (margin/px 36)])
    ((sel/tag box/<P>)
     [text-align text-align/inherit]
     [margin-top (margin/px 18)]
     [margin-right (margin/px 0)]
     [margin-bottom (margin/px 18)]
     [margin-left (margin/px 0)])
    ((sel/id ID-postamble)
     [text-align text-align/center]
     [margin-top (margin/px 18)])))

;; From http://pavpanchekha.com/blog/ubuntu-on-lvm.html

(define doma
  (let ([tree
         '([BLOCK <HTML> :x 0 :y 0 :vw 958 :vh 822]
           ([BLOCK <BODY> :x 154 :y 36 :vw 650 :vh (/ 8779 12)]
            ([BLOCK <DIV> :x 164 :y 36 :vw 630 :vh 582]
             ([BLOCK <H1> :x 164 :y 36 :vw 630 :vh 24]
              ([LINE :x 164 :y 36 :w 630 :h 24 :gap 0]
               ([TEXT :x 164 :y 31.5 :w 273.8 :h 33 :gap -9])))
             ([BLOCK <P> :x 164 :y 78 :vw 630 :vh 24]
              ([LINE :x 164 :y 78 :w 630 :h 24 :gap 0]
               ([TEXT :x 164 :y 79.5 :w 215 :h 21 :gap 3])))
             ([BLOCK <DIV> :x 164 :y 123.6 :vw 630 :vh 66]
              ([BLOCK <PRE> :x 164 :y 123.6 :vw 630 :vh 66]
               ([LINE :x 173 :y 132.6 :w 612 :h 24 :gap 0]
                ([TEXT :x 173 :y 132.6 :w 199 :h 24 :gap 0]))
               ([LINE :x 173 :y 156.6 :w 612 :h 24 :gap 0]
                ([TEXT :x 173 :y 156.6 :w 152 :h 24 :gap 0]))))
             ([BLOCK <P> :x 164 :y 220.2 :vw 630 :vh 48]
              ([LINE :x 164 :y 220.2 :w 630 :h 24 :gap 0]
               ([TEXT :x 164 :y 221.7 :w 630 :h 21 :gap 3]))
              ([LINE :x 164 :y 244.2 :w 630 :h 24 :gap 0]
               ([TEXT :x 164 :y 245.7 :w 68 :h 21 :gap 3])))
             ([BLOCK <DIV> :x 164 :y 289.8 :vw 630 :vh 162]
              ([BLOCK <PRE> :x 164 :y 289.8 :vw 630 :vh 162]
               ([LINE :x 173 :y 298.8 :w 612 :h 24 :gap 0]
                ([TEXT :x 173 :y 298.8 :w 349 :h 24 :gap 0]))
               ([LINE :x 173 :y 322.8 :w 612 :h 24 :gap 0]
                ([TEXT :x 173 :y 322.8 :w 284 :h 24 :gap 0]))
               ([LINE :x 173 :y 346.8 :w 612 :h 24 :gap 0]
                ([TEXT :x 173 :y 346.8 :w 302 :h 24 :gap 0]))
               ([LINE :x 173 :y 370.8 :w 612 :h 24 :gap 0]
                ([TEXT :x 173 :y 370.8 :w 292 :h 24 :gap 0]))
               ([LINE :x 173 :y 394.8 :w 612 :h 24 :gap 0]
                ([TEXT :x 173 :y 394.8 :w 362 :h 24 :gap 0]))
               ([LINE :x 173 :y 418.8 :w 612 :h 24 :gap 0]
                ([TEXT :x 173 :y 418.8 :w 145 :h 24 :gap 0]))))
             ([BLOCK <P> :x 164 :y 482.4 :vw 630 :vh 48]
              ([LINE :x 164 :y 482.4 :w 630 :h 24 :gap 0]
               ([TEXT :x 164 :y 483.9 :w 630 :h 21 :gap 3]))
              ([LINE :x 164 :y 506.4 :w 630 :h 24 :gap 0]
               ([TEXT :x 164 :y 507.9 :w 97 :h 21 :gap 3])))
             ([BLOCK <DIV> :x 164 :y 552 :vw 630 :vh 66]
              ([BLOCK <PRE> :x 164 :y 552 :vw 630 :vh 66]
               ([LINE :x 173 :y 561 :w 612 :h 24 :gap 0]
                ([TEXT :x 173 :y 561 :w 199 :h 24 :gap 0]))
               ([LINE :x 173 :y 585 :w 612 :h 24 :gap 0]
                ([TEXT :x 173 :y 585 :w 247 :h 24 :gap 0])))))
           #;([BLOCK <DIV> :x 164 :y 648.6 :vw 630 :vh 16]
            ([BLOCK <P> :x 164 :y 648.6 :vw 630 :vh 16]
             ([LINE :x 305.5 :y (/ 7789 12) :w 630 :h 16 :gap 0]
              ([TEXT :x 305.5 :y (/ 7789 12) :w 21 :h 15 :gap 1])
              ([TEXT :x 326.5 :y (/ 7789 12) :w 108 :h 15 :gap 1])
              ([TEXT :x 434.5 :y (/ 7789 12) :w 95 :h 15 :gap 1])
              ([TEXT :x 529.5 :y (/ 7789 12) :w 119 :h 15 :gap 1])
              ([TEXT :x 648.5 :y (/ 7789 12) :w 4 :h 15 :gap 1]))))))]
[context (rendering-context 958)])
    (dom 'doca sheet context tree)))

;; From http://pavpanchekha.com/blog/organization.html

(define domb
  (let ([tree
         '([BLOCK <HTML> :x 0 :y 0 :vw 945]
           ([BLOCK <BODY> :x 147.5 :y 36 :vw 650 #|:vh (/ 33465 30)|#]
            ([BLOCK <DIV> :x 157.5 :y 36 :vw 630 :vh 978.5]
             ([BLOCK <H1> :x 157.5 :y 36 :vw 630 :vh 24]
              ([TEXT :x 157.5 :y 31.5 :w 205.1 :h 33 :gap -9]))
             ([BLOCK <P> :x 157.5 :y 78 :vw 630 :vh 120.5]
              ([TEXT :x 157.5 :w (/ 3235 6) #|:y 80 :h 21 :gap 3|#])
              ([INLINE <SPAN> :x (/ 2090 3) :w 19]
               ([TEXT :x (/ 2090 3) :w 19 #|:y 78 :h 24 :gap 0|#]))
              ([TEXT :x (/ 2147 3) :w (/ 431 6) #|:y 80 :h 21 :gap 3|#])
              ([TEXT :x 157.5 :y 104 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 128 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 152 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 176 :w 506 :h 21 :gap 3]))
             ([BLOCK <P> :x 157.5 :y 216.5 :vw 630 :vh 240]
              ([TEXT :x 157.5 :y 218 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 242 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 266 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 290 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 314 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 338 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 362 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 386 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 410 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 434 :w 228 :h 21 :gap 3]))
             ([BLOCK <P> :x 157.5 :y 474.5 :vw 630 :vh 240]
              ([TEXT :x 157.5 :y 476 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 500 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 524 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 548 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 572 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 596 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 620 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 644 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 668 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 692 :w 62 :h 21 :gap 3]))
             ([BLOCK <P> :x 157.5 :y 732.5 :vw 630 :vh 216]
              ([TEXT :x 157.5 :y 734 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 758 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 782 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 806 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 830 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 854 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 878 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 902 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 926 :w 93 :h 21 :gap 3]))
             ([BLOCK <P> :x 157.5 :y 966.5 :vw 630 :vh 48]
              ([TEXT :x 157.5 :y 968 :w 630 :h 21 :gap 3])
              ([TEXT :x 157.5 :y 992 :w 281 :h 21 :gap 3])))
            #;([BLOCK <DIV> :x 157.5 :y 1032.5 :vw 630 :vh 16]
            ([BLOCK <P> :x 157.5 :y 1032.5 :vw 630 :vh 16]
              ([TEXT :x 299 :y 1050 :w 21 :h 15 :gap 1])
              ([TEXT :x 320 :y 1050 :w 108 :h 15 :gap 1])
              ([TEXT :x 428 :y 1050 :w 95 :h 15 :gap 1])
              ([TEXT :x 523 :y 1050 :w 119 :h 15 :gap 1])
              ([TEXT :x 642 :y 1050 :w 4 :h 15 :gap 1])))))]
       [context (rendering-context 945)])
    (dom 'docb sheet context tree)))

(cassius-solve #:sheet sheet #:header header doma #;domb)
