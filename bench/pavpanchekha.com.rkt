#lang racket
(require "../cassius/main.rkt")

(define header
"html { background-color: #f1f1f1; color: #2E3436;}
body { font-size: 18px; line-height: 1.333; text-rendering: optimizeLegibility; font-family: 'PT Serif', serif;}
pre { font-family: 'Open Sans Light', 'Inconsolata', 'Deja Vu Sans Mono', monospace; font-weight: 300;}
h1 { font-family: 'Open Sans Semibold', 'Deja Vu Sans', 'Georgia', sans; font-weight: 600;
     font-size: 24px; line-height: 1; letter-spacing: -.03em; color: #555753;}
p { text-align: justify; -moz-hyphens: auto; -webkit-hyphens: auto; hyphens: auto;}")

(define sheet (stylesheet 'main.css 5))

(define doma
  (let ([tree
        '([<BODY> a0003 :x 147.5 :y 36 :vw 650 :vh 1115.5]
          ([<DIV> a0004 :x 157.5 :y 36 :vw 630 :vh 978.5]
           ([<H1> a0005 :x 157.5 :y 36 :vw 630 :vh 24]
            ([<> a0006 :x 157.5 :y 31.5 :w 205.1 :h 33 :gap -9]))
           ([<P> a0007 :x 157.5 :y 78 :vw 630 :vh 120.5]
            ([<> a0008 :x 157.5 :y 79.5 :w 539.2 :h 21 :gap 3])
            ([<> a0009 :x 696.7 :y 79.5 :w 19 :h 21 :gap 3])
            ([<> a0010 :x 715.7 :y 79.5 :w 71.8 :h 21 :gap 3])
            ([<> a0011 :x 157.5 :y 104 :w 630 :h 21 :gap 3])
            ([<> a0012 :x 157.5 :y 128 :w 630 :h 21 :gap 3])
            ([<> a0013 :x 157.5 :y 152 :w 630 :h 21 :gap 3])
            ([<> a0014 :x 157.5 :y 176 :w 506 :h 21 :gap 3]))
           ([<P> a0015 :x 157.5 :y 216.5 :vw 630 :vh 240]
            ([<> a0016 :x 157.5 :y 218 :w 630 :h 21 :gap 3])
            ([<> a0017 :x 157.5 :y 242 :w 630 :h 21 :gap 3])
            ([<> a0018 :x 157.5 :y 266 :w 630 :h 21 :gap 3])
            ([<> a0019 :x 157.5 :y 290 :w 630 :h 21 :gap 3])
            ([<> a0020 :x 157.5 :y 314 :w 630 :h 21 :gap 3])
            ([<> a0021 :x 157.5 :y 338 :w 630 :h 21 :gap 3])
            ([<> a0022 :x 157.5 :y 362 :w 630 :h 21 :gap 3])
            ([<> a0023 :x 157.5 :y 386 :w 630 :h 21 :gap 3])
            ([<> a0024 :x 157.5 :y 410 :w 630 :h 21 :gap 3])
            ([<> a0025 :x 157.5 :y 434 :w 228 :h 21 :gap 3]))
           ([<P> a0026 :x 157.5 :y 474.5 :vw 630 :vh 240]
            ([<> a0027 :x 157.5 :y 476 :w 630 :h 21 :gap 3])
            ([<> a0028 :x 157.5 :y 500 :w 630 :h 21 :gap 3])
            ([<> a0029 :x 157.5 :y 524 :w 630 :h 21 :gap 3])
            ([<> a0030 :x 157.5 :y 548 :w 630 :h 21 :gap 3])
            ([<> a0031 :x 157.5 :y 572 :w 630 :h 21 :gap 3])
            ([<> a0032 :x 157.5 :y 596 :w 630 :h 21 :gap 3])
            ([<> a0033 :x 157.5 :y 620 :w 630 :h 21 :gap 3])
            ([<> a0034 :x 157.5 :y 644 :w 630 :h 21 :gap 3])
            ([<> a0035 :x 157.5 :y 668 :w 630 :h 21 :gap 3])
            ([<> a0036 :x 157.5 :y 692 :w 62 :h 21 :gap 3]))
           ([<P> a0037 :x 157.5 :y 732.5 :vw 630 :vh 216]
            ([<> a0038 :x 157.5 :y 734 :w 630 :h 21 :gap 3])
            ([<> a0039 :x 157.5 :y 758 :w 630 :h 21 :gap 3])
            ([<> a0040 :x 157.5 :y 782 :w 630 :h 21 :gap 3])
            ([<> a0041 :x 157.5 :y 806 :w 630 :h 21 :gap 3])
            ([<> a0042 :x 157.5 :y 830 :w 630 :h 21 :gap 3])
            ([<> a0043 :x 157.5 :y 854 :w 630 :h 21 :gap 3])
            ([<> a0044 :x 157.5 :y 878 :w 630 :h 21 :gap 3])
            ([<> a0045 :x 157.5 :y 902 :w 630 :h 21 :gap 3])
            ([<> a0046 :x 157.5 :y 926 :w 93 :h 21 :gap 3]))
           ([<P> a0047 :x 157.5 :y 966.5 :vw 630 :vh 48]
            ([<> a0048 :x 157.5 :y 968 :w 630 :h 21 :gap 3])
            ([<> a0049 :x 157.5 :y 992 :w 281 :h 21 :gap 3])))
          #;([<DIV> a0050 :x 157.5 :y 1032.5 :vw 630 :vh 16]
           ([<P> a0051 :x 157.5 :y 1032.5 :vw 630 :vh 16]
            ([<> a0052 :x 299 :y 1033 :w 21 :h 15 :gap 1])
            ([<> a0053 :x 320 :y 1033 :w 108 :h 15 :gap 1])
            ([<> a0054 :x 428 :y 1033 :w 95 :h 15 :gap 1])
            ([<> a0055 :x 523 :y 1033 :w 119 :h 15 :gap 1])
            ([<> a0056 :x 642 :y 1033 :w 4 :h 15 :gap 1]))))]
       [context (rendering-context 945)])
    (dom 'doca sheet context tree)))

(define domb
  (let ([tree
        '([<BODY> b0003 :x 154 :y 36 :vw 650 :vh 731.6]
          ([<DIV> b0004 :x 164 :y 36 :vw 630 :vh 582]
           ([<H1> b0005 :x 164 :y 36 :vw 630 :vh 24]
            ([<> b0006 :x 164 :y 31.5 :w 273.8 :h 33 :gap -9]))
           ([<P> b0007 :x 164 :y 78 :vw 630 :vh 24]
            ([<> b0008 :x 164 :y 79.5 :w 215 :h 21 :gap 3]))
           ([<DIV> b0009 :x 164 :y 123.6 :vw 630 :vh 66]
            ([<PRE> b0010 :x 164 :y 123.6 :vw 630 :vh 66]
             ([<> b0011 :x 173 :y 132.6 :w 199 :h 24 :gap 0])
             ([<> b0012 :x 173 :y 156.6 :w 152 :h 24 :gap 0])))
           ([<P> b0013 :x 164 :y 220.2 :vw 630 :vh 48]
            ([<> b0014 :x 164 :y 221.7 :w 630 :h 21 :gap 3])
            ([<> b0015 :x 164 :y 245.7 :w 68 :h 21 :gap 3]))
           ([<DIV> b0016 :x 164 :y 289.8 :vw 630 :vh 162]
            ([<PRE> b0017 :x 164 :y 289.8 :vw 630 :vh 162]
             ([<> b0018 :x 173 :y 298.8 :w 349 :h 24 :gap 0])
             ([<> b0019 :x 173 :y 322.8 :w 284 :h 24 :gap 0])
             ([<> b0020 :x 173 :y 346.8 :w 302 :h 24 :gap 0])
             ([<> b0021 :x 173 :y 370.8 :w 292 :h 24 :gap 0])
             ([<> b0022 :x 173 :y 394.8 :w 362 :h 24 :gap 0])
             ([<> b0023 :x 173 :y 418.8 :w 145 :h 24 :gap 0])))
           ([<P> b0024 :x 164 :y 482.4 :vw 630 :vh 48]
            ([<> b0025 :x 164 :y 483.9 :w 630 :h 21 :gap 3])
            ([<> b0026 :x 164 :y 507.9 :w 97 :h 21 :gap 3]))
           ([<DIV> b0027 :x 164 :y 552 :vw 630 :vh 66]
            ([<PRE> b0028 :x 164 :y 552 :vw 630 :vh 66]
             ([<> b0029 :x 173 :y 561 :w 199 :h 24 :gap 0])
             ([<> b0030 :x 173 :y 585 :w 247 :h 24 :gap 0]))))
          #;([<DIV> b0031 :x 164 :y 648.6 :vw 630 :vh 16]
           ([<P> b0032 :x 164 :y 648.6 :vw 630 :vh 16]
            ([<> b0033 :x 305.5 :y 649.1 :w 21 :h 15 :gap 1])
            ([<> b0034 :x 326.5 :y 649.1 :w 108 :h 15 :gap 1])
            ([<> b0035 :x 434.5 :y 649.1 :w 95 :h 15 :gap 1])
            ([<> b0036 :x 529.5 :y 649.1 :w 119 :h 15 :gap 1])
            ([<> b0037 :x 648.5 :y 649.1 :w 4 :h 15 :gap 1]))))]
       [context (rendering-context 958)])
    (dom 'docb sheet context tree)))

(cassius-solve #:sheet sheet #:header header domb)
