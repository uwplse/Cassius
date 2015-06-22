#lang racket
(require "../cassius/main.rkt")
        
(define header
"body { background: green; }
div { background: blue; outline: 1px solid red;}
html { background: white; }
div div { background: papayawhip; }
")

(define sheet (stylesheet 'main.css 3))

(define doma
  (let ([tree
         '([<BODY> a0001 :x 100 :vw 600 :y 0 :vh 400 :print]
           ([<DIV> a0002 :id sidebar :x 110 :vw 180 :y 10 :vh 380 :print]
            ([<DIV> a0004 :x 120 :vw 160 :vh 160 :y 20 :print]))
           ([<DIV> a0003 :id content :x 310 :vw 380 :y 10 :vh 380]))]
       [context (rendering-context 800)])
    (dom 'doca sheet context tree)))

(cassius-solve #:sheet sheet #:header header #:debug #t doma)
