#lang racket
(require "../cassius/main.rkt")

(define header
"body { background: green; }
div { background: blue; }
html { background: white; }")

(define sheet1 (stylesheet 'main.css 2))

(define dom1
  (dom 'doc1 sheet1 (rendering-context 800)
       '([<BODY> body2 :x 100 :y   0 :vw 600 :vh 400]
         ([<DIV> diva2 :x 200 :y  66 :vw 400 :vh 100])
         ([<DIV> divb2 :x 200 :y 233 :vw 400 :vh 100]))))

(cassius-solve #:sheet sheet1 #:header header dom1 #:debug #f)
