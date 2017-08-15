
(define-stylesheet main
  ((tag body)
   [margin-right (px 0)]
   [margin-left (px 0)])
  ((tag main)
   [width (% 100)]
   [overflow-y auto])
  ((tag div)
   [float left]
   [font-size (px 192)]
   [width (px 200)]
   [height (px 200)]))

(define-document four
  ([html :num 1]
   ([body :num 2]
    ([p :num 3] "Our Products:")
    ([main :num 4]
     ([div :num 5] "A")
     ([div :num 6] "B")
     ([div :num 7] "C")
     ([div :num 8] "D"))
    ([p :num 9] "Buy now!"))))

(define-layout (four :browser firefox :matched true :w 400 :fs 16)
  ([VIEW :w 400]
   ([BLOCK :x 0 :y 0 :w 400 :h 502 :elt 1]
    ([BLOCK :x 0 :y 16 :w 400 :h 470 :elt 2]
     ([BLOCK :x 0 :y 16 :w 400 :h 19 :elt 3]
      ([LINE]
       ([TEXT :x 0 :y 16 :w 112 :h 19])))
     ([BLOCK :x 0 :y 51 :w 400 :h 400 :elt 4]
      ([BLOCK :x 0 :y 51 :w 200 :h 200 :elt 5]
       ([LINE]
        ([TEXT :x 0 :w 139 :h 224])))
      ([BLOCK :x 200 :y 51 :w 200 :h 200 :elt 6]
       ([LINE]
        ([TEXT :x 200 :w 142 :h 224])))
      ([BLOCK :x 0 :y 251 :w 200 :h 200 :elt 7]
       ([LINE]
        ([TEXT :x 0 :w 147 :h 224])))
      ([BLOCK :x 200 :y 251 :w 200 :h 200 :elt 8]
       ([LINE]
        ([TEXT :x 200 :w 155 :h 224]))))
     ([BLOCK :x 0 :y 467 :w 400 :h 19 :elt 9]
      ([LINE]
       ([TEXT :x 0 :y 467 :w 76 :h 19])))))))

(define-problem main :sheets main :layouts four :documents four)
