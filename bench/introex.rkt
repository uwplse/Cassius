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

(define-document (four :browser firefox)
#|00|#  ([VIEW :w 400]
#|01|#   ([BLOCK :tag HTML :x 0 :y 0 :w 400 :h 486]
#|02|#    ([BLOCK :tag BODY :x 0 :y 16 :w 400 :h 454]
#|03|#     ([BLOCK :tag P :x 0 :y 16 :w 400 :h 19]
#|04|#      ([LINE]
#|05|#       ([TEXT :x 0 :y 16 :w 112 :h 19])))
#|06|#     ([BLOCK :tag MAIN :x 0 :y 51 :w 400 :h 400]
#|07|#      ([BLOCK :tag DIV :x 0 :y 51 :w 200 :h 200]
#|08|#       ([LINE]
#|09|#        ([TEXT :x 0 :w 139 :h 224])))
#|10|#      ([BLOCK :tag DIV :x 200 :y 51 :w 200 :h 200]
#|11|#       ([LINE]
#|12|#        ([TEXT :x 200 :w 142 :h 224])))
#|13|#      ([BLOCK :tag DIV :x 0 :y 251 :w 200 :h 200]
#|14|#       ([LINE]
#|15|#        ([TEXT :x 0 :w 147 :h 224])))
#|16|#      ([BLOCK :tag DIV :x 200 :y 251 :w 200 :h 200]
#|17|#       ([LINE]
#|18|#        ([TEXT :x 200 :w 155 :h 224]))))
#|19|#     ([BLOCK :tag P :x 0 :y 451 :w 400 :h 19]
#|20|#      ([LINE]
#|21|#       ([TEXT :x 0 :y 451 :w 76 :h 19])))))))

(define-problem null
  :sheets null
  :documents four)

(define-problem main
  :test (forall (x) (=> (and (not (is-nil-elt (element x))) (is-box (pbox x)) (is-tag/div (tagname (get/elt (element x))))) (within x (pbox x))))
  :sheets main
  :documents four)

(define-problem sketch
  :test (forall (x) (=> (and (not (is-nil-elt (element x))) (is-box (pbox x)) (is-tag/div (tagname (get/elt (element x))))) (within x (pbox x))))
  :sheets sketch
  :documents four)
