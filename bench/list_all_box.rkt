;; From file:///home/sgriffith/box_press/box_press.html

(define-stylesheet no_press)

(define-fonts no_press
  [16 "serif" 400 normal 16 0 1.5 1.5 19]
  [14 "sans-serif" 400 normal 14 0 1.5 1.5 17])

(define-browser no_press
  :matched true
  :w 1280
  :h 950
  :fs 16
  :fsm 12
  :scrollw 10)

(define-document no_press
  ([html :num 0]
   ([head :num 1])
   ([body :num 2]
    ([ul :num 3 :id list])
    ([script :num 4]) " "
    ([input :num 5 :id myText :w 218 :h 29 :type text]) " "
    ([button :num 6] "Add "))))

(define-layout no_press (no_press no_press)
 ([VIEW :w 1280]
  ([BLOCK :x 0 :y 0 :w 1280 :h 45 :elt 0]
   ([BLOCK :x 8 :y 8 :w 1264 :h 29 :elt 2]
    ([BLOCK :x 8 :y 8 :w 1264 :h 0 :elt 3])
    ([ANON]
     ([LINE]
      ([INLINE :x 8 :y 8 :w 218 :h 29 :elt 5])
      ([TEXT :x 226 :y 12 :w 5 :h 19 :text " "])
      ([INLINE :x 231 :y 8 :w 58 :h 29 :elt 6]
       ([LINE]
        ([TEXT :x 246 :y 14 :w 28 :h 17 :text "Add "])))))))))

(define-problem no_press
  :title ""
  :url "file:///home/sgriffith/box_test/box_test.html"
  :sheets firefox no_press
  :fonts no_press
  :layouts no_press
  :features empty-text tag:input tag:button display:inline-block float:0)


;; From file:///home/sgriffith/box_press/box_press.html

(define-stylesheet one_press)

(define-fonts one_press
  [16 "serif" 400 normal 16 0 1.5 1.5 19]
  [14 "sans-serif" 400 normal 14 0 1.5 1.5 17])

(define-browser one_press
  :matched true
  :w 1280
  :h 950
  :fs 16
  :fsm 12
  :scrollw 10)

(define-document one_press
  ([html :num 0]
   ([head :num 1])
   ([body :num 2]
    ([ul :num 3 :id list]
     ([li :num 4 :id element-1] "Buy Groceries"))
    ([script :num 5]) " "
    ([input :num 6 :id myText :w 218 :h 29 :type text]) " "
    ([button :num 7] "Add "))))

(define-layout one_press (one_press one_press)
 ([VIEW :w 1280]
  ([BLOCK :x 0 :y 0 :w 1280 :h 80 :elt 0]
   ([BLOCK :x 8 :y 8 :w 1264 :h 64 :elt 2]
    ([BLOCK :x 8 :y 8 :w 1264 :h 19 :elt 3]
     ([BLOCK :x 48 :y 8 :w 1224 :h 19 :elt 4]
      ([LINE]
       ([TEXT :x 48 :y 8 :w 115 :h 19 :text "Buy Groceries"]))))
    ([ANON]
     ([LINE]
      ([INLINE :x 8 :y 43 :w 218 :h 29 :elt 6])
      ([TEXT :x 226 :y 47 :w 5 :h 19 :text " "])
      ([INLINE :x 231 :y 43 :w 58 :h 29 :elt 7]
       ([LINE]
        ([TEXT :x 246 :y 49 :w 28 :h 17 :text "Add "])))))))))

(one_press
  :title ""
  :url "file:///home/sgriffith/box_press/box_test.html"
  :sheets firefox one_press
  :fonts one_press
  :layouts one_press
  :features display:list-item empty-text tag:input tag:button display:inline-block float:0)

;; From file:///home/sgriffith/box_press/box_press.html

(define-stylesheet two_press)

(define-fonts two_press
  [16 "serif" 400 normal 16 0 1.5 1.5 19]
  [14 "sans-serif" 400 normal 14 0 1.5 1.5 17])
(define-browser two_press
  :matched true
  :w 1280
  :h 950
  :fs 16
  :fsm 12
  :scrollw 10)
(define-document two_press
  ([html :num 0]
   ([head :num 1])
   ([body :num 2]
    ([ul :num 3 :id list]
     ([li :num 4 :id element-1] "Buy Groceries")
     ([li :num 5 :id element-2] "Brush Dog"))
    ([script :num 6]) " "
    ([input :num 7 :id myText :w 218 :h 29 :type text]) " "
    ([button :num 8] "Add "))))

(define-layout two_press (two_press two_press)
 ([VIEW :w 1280]
  ([BLOCK :x 0 :y 0 :w 1280 :h 99 :elt 0]
   ([BLOCK :x 8 :y 8 :w 1264 :h 83 :elt 2]
    ([BLOCK :x 8 :y 8 :w 1264 :h 38 :elt 3]
     ([BLOCK :x 48 :y 8 :w 1224 :h 19 :elt 4]
      ([LINE]
       ([TEXT :x 48 :y 8 :w 115 :h 19 :text "Buy Groceries"])))
     ([BLOCK :x 48 :y 27 :w 1224 :h 19 :elt 5]
      ([LINE]
       ([TEXT :x 48 :y 27 :w 86 :h 19 :text "Brush Dog"]))))
    ([ANON]
     ([LINE]
      ([INLINE :x 8 :y 62 :w 218 :h 29 :elt 7])
      ([TEXT :x 226 :y 66 :w 5 :h 19 :text " "])
      ([INLINE :x 231 :y 62 :w 58 :h 29 :elt 8]
       ([LINE]
        ([TEXT :x 246 :y 68 :w 28 :h 17 :text "Add "])))))))))
(define-problem two_press
  :title ""
  :url "file:///home/sgriffith/box_test/box_test.html"
  :sheets firefox two_press
  :fonts two_press
  :layouts two_press
  :features display:list-item empty-text tag:input tag:button display:inline-block float:0)
; From file:///home/sgriffith/box_test/box_test.html

(define-stylesheet three_press)

(define-fonts three_press
  [16 "serif" 400 normal 16 0 1.5 1.5 19]
  [14 "sans-serif" 400 normal 14 0 1.5 1.5 17])

(define-browser three_press
  :matched true
  :w 1280
  :h 950
  :fs 16
  :fsm 12
  :scrollw 10)

(define-document three_press
  ([html :num 0]
   ([head :num 1])
   ([body :num 2]
    ([ul :num 3 :id list]
     ([li :num 4 :id element-1] "Buy Groceries")
     ([li :num 5 :id element-2] "Brush Dog")
     ([li :num 6 :id element-3] "Destroy Capatilism"))
    ([script :num 7]) " "
    ([input :num 8 :id myText :w 218 :h 29 :type text]) " "
    ([button :num 9] "Add "))))

(define-layout three_press (three_press three_press)
 ([VIEW :w 1280]
  ([BLOCK :x 0 :y 0 :w 1280 :h 118 :elt 0]
   ([BLOCK :x 8 :y 8 :w 1264 :h 102 :elt 2]
    ([BLOCK :x 8 :y 8 :w 1264 :h 57 :elt 3]
     ([BLOCK :x 48 :y 8 :w 1224 :h 19 :elt 4]
      ([LINE]
       ([TEXT :x 48 :y 8 :w 115 :h 19 :text "Buy Groceries"])))
     ([BLOCK :x 48 :y 27 :w 1224 :h 19 :elt 5]
      ([LINE]
       ([TEXT :x 48 :y 27 :w 86 :h 19 :text "Brush Dog"])))
     ([BLOCK :x 48 :y 46 :w 1224 :h 19 :elt 6]
      ([LINE]
       ([TEXT :x 48 :y 46 :w 154 :h 19 :text "Destroy Capatilism"]))))
    ([ANON]
     ([LINE]
      ([INLINE :x 8 :y 81 :w 218 :h 29 :elt 8])
      ([TEXT :x 226 :y 85 :w 5 :h 19 :text " "])
      ([INLINE :x 231 :y 81 :w 58 :h 29 :elt 9]
       ([LINE]
       ([TEXT :x 246 :y 87 :w 28 :h 17 :text "Add "])))))))))

(define-problem three_press
  :title ""
  :url "file:///home/sgriffith/box_test/box_test.html"
  :sheets firefox three_press
  :fonts three_press
  :layouts three_press
  :features display:list-item empty-text tag:input tag:button display:inline-block float:0)
