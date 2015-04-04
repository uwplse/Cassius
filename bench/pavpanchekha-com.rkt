#lang racket
(require "../cassius/main.rkt")

(define header
"html { background-color: #f1f1f1; color: #2E3436;}
body { font-size: 18px; line-height: 1.333; text-rendering: optimizeLegibility; font-family: 'PT Serif', serif;}
pre { font-family: 'Open Sans Light', 'Inconsolata', 'Deja Vu Sans Mono', monospace; font-weight: 300;}
h1 { font-family: 'Open Sans Semibold', 'Deja Vu Sans', 'Georgia', sans; font-weight: 600;
     font-size: 24px; line-height: 1; letter-spacing: -.03em; color: #555753;}
p { text-align: justify; -moz-hyphens: auto; -webkit-hyphens: auto; hyphens: auto;}")

(define sheet1
  (stylesheet 'main.css 3))

(define dom1
  (let ([tree
         '([<BODY>   a01 :x 126 :y 36 :vw 648 :vh 731.6]
           ([<DIV>   a02 :x 135 :y 36 :vw 630 :vh 582]
            ([<H1>   a03 :x 135 :y 36 :vw 630 :vh 24]
             ([<>    a04 :x 135 :y 31.5 :w 273.8 :h 33 :gap -9])) 
            ([<P>    a05 :x 135 :y 78 :vw 630 :vh 24]
             ([<>    a06 :x 135 :y 79.5 :w 215 :h 21 :gap 3])) 
            ([<DIV>  a07 :x 135 :y 123.6 :vw 630 :vh 66]
             ([<PRE> a08 :x 135 :y 123.6 :vw 630 :vh 66]
              ([<>   a09 :x 144 :y 132.6 :w 199 :h 24 :gap 0]) 
              ([<>   a10 :x 144 :y 156.6 :w 152 :h 24 :gap 0]))) 
            ([<P>    a11 :x 135 :y 220.2 :vw 630 :vh 48]
             ([<>    a12 :x 135 :y 221.7 :w 630 :h 21 :gap 3]) 
             ([<>    a13 :x 135 :y 245.7 :w 68 :h 21 :gap 3])) 
            ([<DIV>  a14 :x 135 :y 289.8 :vw 630 :vh 162]
             ([<PRE> a15 :x 135 :y 289.8 :vw 630 :vh 162]
              ([<>   a16 :x 144 :y 298.8 :w 349 :h 24 :gap 0]) 
              ([<>   a17 :x 144 :y 322.8 :w 284 :h 24 :gap 0]) 
              ([<>   a18 :x 144 :y 346.8 :w 302 :h 24 :gap 0]) 
              ([<>   a19 :x 144 :y 370.8 :w 292 :h 24 :gap 0]) 
              ([<>   a20 :x 144 :y 394.8 :w 362 :h 24 :gap 0]) 
              ([<>   a21 :x 144 :y 418.8 :w 145 :h 24 :gap 0]))) 
            ([<P>    a22 :x 135 :y 482.4 :vw 630 :vh 48]
             ([<>    a23 :x 135 :y 483.9 :w 630 :h 21 :gap 3]) 
             ([<>    a24 :x 135 :y 507.9 :w 97 :h 21 :gap 3])) 
            ([<DIV>  a25 :x 135 :y 552 :vw 630 :vh 66]
             ([<PRE> a26 :x 135 :y 552 :vw 630 :vh 66]
              ([<>   a27 :x 144 :y 561 :w 199 :h 24 :gap 0]) 
              ([<>   a28 :x 144 :y 585 :w 247 :h 24 :gap 0])))))]
        [context
         (rendering-context 900)])
    (dom 'doc1 sheet1 context tree)))

(define dom2
  (let ([tree
         '([<BODY> b01 :x 379.5 :y 36 :vw 648 #|:vh 1115|#]
           ([<DIV> b02 :x 388.5 :y 36 :vw 630 :vh 978]
            ([<H1> b03 :x 388.5 :y 36 :vw 630 :vh 24]
             ([<>  b04 :x 388.5 :y 31.5 :w 205 :h 33 :gap -9]))
            ([<P>  b05 :x 388.5 :y 78 :vw 630 :vh 120]
             ([<>  b06 :x 388.5 :y 79.5 :w 534 :h 21 :gap 3])
             ([<>  b07 :x 922.5 :y 79.5 :w 26 :h 21 :gap 3])
             ([<>  b08 :x 948.5 :y 79.5 :w 70 :h 21 :gap 3])
             ([<>  b09 :x 388.5 :y 103.5 :w 630 :h 21 :gap 3])
             ([<>  b10 :x 388.5 :y 127.5 :w 630 :h 21 :gap 3])
             ([<>  b11 :x 388.5 :y 151.5 :w 630 :h 21 :gap 3])
             ([<>  b12 :x 388.5 :y 175.5 :w 506 :h 21 :gap 3]))
            ([<P>  b13 :x 388.5 :y 216 :vw 630 :vh 240]
             ([<>  b14 :x 388.5 :y 217.5 :w 630 :h 21 :gap 3])
             ([<>  b15 :x 388.5 :y 241.5 :w 630 :h 21 :gap 3])
             ([<>  b16 :x 388.5 :y 265.5 :w 630 :h 21 :gap 3])
             ([<>  b17 :x 388.5 :y 289.5 :w 630 :h 21 :gap 3])
             ([<>  b18 :x 388.5 :y 313.5 :w 630 :h 21 :gap 3])
             ([<>  b19 :x 388.5 :y 337.5 :w 630 :h 21 :gap 3])
             ([<>  b20 :x 388.5 :y 361.5 :w 630 :h 21 :gap 3])
             ([<>  b21 :x 388.5 :y 385.5 :w 630 :h 21 :gap 3])
             ([<>  b22 :x 388.5 :y 409.5 :w 630 :h 21 :gap 3])
             ([<>  b23 :x 388.5 :y 433.5 :w 228 :h 21 :gap 3]))
            ([<P>  b24 :x 388.5 :y 474 :vw 630 :vh 240]
             ([<>  b25 :x 388.5 :y 475.5 :w 630  :h 21 :gap 3])
             ([<>  b26 :x 388.5 :y 499.5 :w 630 :h 21 :gap 3])
             ([<>  b27 :x 388.5 :y 523.5 :w 630 :h 21 :gap 3])
             ([<>  b28 :x 388.5 :y 547.5 :w 630 :h 21 :gap 3])
             ([<>  b29 :x 388.5 :y 571.5 :w 630 :h 21 :gap 3])
             ([<>  b30 :x 388.5 :y 595.5 :w 630 :h 21 :gap 3])
             ([<>  b31 :x 388.5 :y 619.5 :w 630 :h 21 :gap 3])
             ([<>  b32 :x 388.5 :y 643.5 :w 630 :h 21 :gap 3])
             ([<>  b33 :x 388.5 :y 667.5 :w 630 :h 21 :gap 3])
             ([<>  b34 :x 388.5 :y 691.5 :w 62 :h 21 :gap 3]))
            ([<P>  b35 :x 388.5 :y 732 :vw 630 :vh 216]
             ([<>  b36 :x 388.5 :y 733.5 :w 630 :h 21 :gap 3])
             ([<>  b37 :x 388.5 :y 757.5 :w 630 :h 21 :gap 3])
             ([<>  b38 :x 388.5 :y 781.5 :w 630 :h 21 :gap 3])
             ([<>  b39 :x 388.5 :y 805.5 :w 630 :h 21 :gap 3])
             ([<>  b40 :x 388.5 :y 829.5 :w 630 :h 21 :gap 3])
             ([<>  b41 :x 388.5 :y 853.5 :w 630 :h 21 :gap 3])
             ([<>  b42 :x 388.5 :y 877.5 :w 630 :h 21 :gap 3])
             ([<>  b43 :x 388.5 :y 901.5 :w 630 :h 21 :gap 3])
             ([<>  b44 :x 388.5 :y 925.5 :w 93 :h 21 :gap 3]))
            ([<P>  b45 :x 388.5 :y 966 :vw 630 :vh 48]
             ([<>  b46 :x 388.5 :y 967.5 :w 630 :h 21 :gap 3])
             ([<>  b47 :x 388.5 :y 991.5 :w 281 :h 21 :gap 3]))))]
        [context (rendering-context 1407)])
    (dom 'doc2 sheet1 context tree)))


(print-rules #:stylesheet sheet1 #:header header
             (solve
              (append
               (make-preamble)
               (stylesheet-constraints sheet1)
               (dom-constraints dom1)
               (dom-constraints dom2)
               (list '(check-sat)))))
