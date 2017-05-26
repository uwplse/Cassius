(define-stylesheet null)

(define-stylesheet main
  ((tag body)
   [margin-right (px 0)]
   [margin-left (px 0)])
  ((tag main)
   [width (% 100)]
   [overflow-y auto])
  ((tag div)
   [float left]
   #;[font-size (px 192)]
   [width (px 200)]
   [height (px 200)]))

(define-stylesheet sketch
  ((tag body) ?)
  ((tag main) ?)
  ((tag div) ?))

(define-document four
  ([html :num 1]
   ([body :num 2]
    ([p :num 3])
    ([main :num 4]
     ([div :num 5])
     ([div :num 6])
     ([div :num 7])
     ([div :num 8]))
    ([p :num 9]))))

(define-layout (four :browser firefox :matched true)
  ([VIEW :w 400]
   ([BLOCK :tag HTML :x 0 :y 0 :w 400 :h 486 :elt 1]
    ([BLOCK :tag BODY :x 0 :y 16 :w 400 :h 454 :elt 2]
     ([BLOCK :tag P :x 0 :y 16 :w 400 :h 19 :elt 3]
      ([LINE]
       ([TEXT :x 0 :y 16 :w 112 :h 19])))
     ([BLOCK :tag MAIN :x 0 :y 51 :w 400 :h 400 :elt 4]
      ([BLOCK :tag DIV :x 0 :y 51 :w 200 :h 200 :elt 5]
       ([LINE]
        ([TEXT :x 0 :w 139 :h 224])))
      ([BLOCK :tag DIV :x 200 :y 51 :w 200 :h 200 :elt 6]
       ([LINE]
        ([TEXT :x 200 :w 142 :h 224])))
      ([BLOCK :tag DIV :x 0 :y 251 :w 200 :h 200 :elt 7]
       ([LINE]
        ([TEXT :x 0 :w 147 :h 224])))
      ([BLOCK :tag DIV :x 200 :y 251 :w 200 :h 200 :elt 8]
       ([LINE]
        ([TEXT :x 200 :w 155 :h 224]))))
     ([BLOCK :tag P :x 0 :y 451 :w 400 :h 19 :elt 9]
      ([LINE]
       ([TEXT :x 0 :y 451 :w 76 :h 19])))))))

(define-problem null
  :sheets null
  :layouts four
  :documents four)

(define-problem main
  :test (forall (x) (=> (and (is-elt (element x)) (is-box (pbox x)) (is-tag/div (tagname (box-elt x)))) (within x (pbox x))))
  :sheets main
  :layouts four
  :documents four)

(define-problem sketch
;;  :test (forall (x) (=> (and (not (is-nil-elt (element x))) (is-box (pbox x)) (is-tag/div (tagname (get/elt (element x))))) (within x (pbox x))))
  :sheets sketch
  :layouts four
  :documents four)
