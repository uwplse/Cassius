(define-header header "")

(define-stylesheet main
  ((tag body)
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((tag main)
   [width (% 100)]
   [float left])
  ((tag div)
   [float left]
   #;[font-size (px 192)]
   [width (px 200)]
   [height (px 200)]))

(define-stylesheet sketch
  ((tag body) ?)
  ((tag main) ?)
  ((tag div) ?))


(define-document (four #:width 400 #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 400 :h 486]
   ([BLOCK :tag BODY :x 0 :y 16 :w 400 :h 454]
    ([BLOCK :tag P :x 0 :y 16 :w 400 :h 19]
     ([LINE]
      ([TEXT :x 0 :y 16 :w 112 :h 19])))
    ([BLOCK :tag MAIN :x 0 :y 51 :w 400]
     ([BLOCK :tag DIV :x 0 :y 51 :w 200 :h 200]
      ([LINE]
       ([TEXT :x 0 :w 139 :h 224])))
     ([BLOCK :tag DIV :x 200 :y 51 :w 200 :h 200]
      ([LINE]
       ([TEXT :x 200 :w 142 :h 224])))
     ([BLOCK :tag DIV :x 0 :y 251 :w 200 :h 200]
      ([LINE]
       ([TEXT :x 0 :w 147 :h 224])))
     ([BLOCK :tag DIV :x 200 :y 251 :w 200 :h 200]
      ([LINE]
       ([TEXT :x 200 :w 155 :h 224]))))
    ([BLOCK :tag P :x 0 :y 51 :w 400 :h 419]
     ([LINE]
      ([TEXT :x 0 :y 451 :w 76 :h 19]))))))

(define-problem main
  #:test (forall (x) (=> (and (not (is-nil-elt (element x))) (is-box (pbox x)) (is-tag/div (tagname (get/elt (element x))))) (within x (pbox x))))
  #:sheet main
  #:documents four)

(define-problem sketch
  #:test (forall (x) (=> (and (not (is-nil-elt (element x))) (is-box (pbox x)) (is-tag/div (tagname (get/elt (element x))))) (within x (pbox x))))
  #:sheet sketch
  #:documents four)
