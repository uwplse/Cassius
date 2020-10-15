;; From file:///home/p92/button_test_1.html

(define-stylesheet button_test_2)
(define-fonts button_test_2
  [16 "serif" 400 normal 16 0 1.5 1.5 19]
  [14 "sans-serif" 400 normal 14 0 1 1 17])
(define-browser button_test_2
  :matched true
  :w 1280
  :h 950
  :fs 16
  :fsm 12
  :scrollw 10)
(define-document button_test_2
  ([html :num 0]
   ([head :num 1])
   ([body :num 2]
    ([ul :num 3 :id list]
     ([li :num 4 :id element-1] "value-1"))
    ([script :num 5]) " "
    ([button :num 6] "Click Me! "))))
(define-layout button_test_2 (button_test_2 button_test_2)
 ([VIEW :w 1280]
  ([BLOCK :x 0 :y 0 :w 1280 :h 80 :elt 0]
   ([BLOCK :x 8 :y 8 :w 1264 :h 64 :elt 2]
    ([BLOCK :x 8 :y 8 :w 1264 :h 19 :elt 3]
     ([BLOCK :x 48 :y 8 :w 1224 :h 19 :elt 4]
      ([LINE]
       ([TEXT :x 48 :y 8 :w 60 :h 19 :text "value-1"]))))
    ([ANON]
     ([LINE]
      ([INLINE :x 8 :y 43 :w 92 :h 29 :elt 6]
       ([LINE]
        ([TEXT :x 23 :y 49.5 :w 62 :h 16 :text "Click Me! "])))))))))
(define-problem button_test_2
  :title ""
  :url "file:///home/p92/button_test_1.html"
  :sheets firefox button_test_2
  :fonts button_test_2
  :layouts button_test_2
  :features display:list-item empty-text tag:button display:inline-block float:0)
;; From file:///home/p92/button_test_1.html
(define-stylesheet button_test_3)
(define-fonts button_test_3
  [16 "serif" 400 normal 16 0 1.5 1.5 19]
  [14 "sans-serif" 400 normal 14 0 1 1 17])
(define-browser button_test_3
  :matched true
  :w 1280
  :h 950
  :fs 16
  :fsm 12
  :scrollw 10)
(define-document button_test_3
  ([html :num 0]
   ([head :num 1])
   ([body :num 2]
    ([ul :num 3 :id list]
     ([li :num 4 :id element-1] "value-1")
     ([li :num 5 :id element-2] "value-2"))
    ([script :num 6]) " "
    ([button :num 7] "Click Me! "))))
(define-layout button_test_3 (button_test_3 button_test_3)
 ([VIEW :w 1280]
  ([BLOCK :x 0 :y 0 :w 1280 :h 99 :elt 0]
   ([BLOCK :x 8 :y 8 :w 1264 :h 83 :elt 2]
    ([BLOCK :x 8 :y 8 :w 1264 :h 38 :elt 3]
     ([BLOCK :x 48 :y 8 :w 1224 :h 19 :elt 4]
      ([LINE]
       ([TEXT :x 48 :y 8 :w 60 :h 19 :text "value-1"])))
     ([BLOCK :x 48 :y 27 :w 1224 :h 19 :elt 5]
      ([LINE]
       ([TEXT :x 48 :y 27 :w 60 :h 19 :text "value-2"]))))
    ([ANON]
     ([LINE]
      ([INLINE :x 8 :y 62 :w 92 :h 29 :elt 7]
       ([LINE]
        ([TEXT :x 23 :y 68.5 :w 62 :h 16 :text "Click Me! "])))))))))
(define-problem button_test_3
  :title ""
  :url "file:///home/p92/button_test_1.html"
  :sheets firefox button_test_3
  :fonts button_test_3
  :layouts button_test_3
  :features display:list-item empty-text tag:button display:inline-block float:0)
;; From file:///home/p92/button_test_1.html
(define-stylesheet button_test_4)
(define-fonts button_test_4
  [16 "serif" 400 normal 16 0 1.5 1.5 19]
  [14 "sans-serif" 400 normal 14 0 1 1 17])
(define-browser button_test_4
  :matched true
  :w 1280
  :h 950
  :fs 16
  :fsm 12
  :scrollw 10)
(define-document button_test_4
  ([html :num 0]
   ([head :num 1])
   ([body :num 2]
    ([ul :num 3 :id list]
     ([li :num 4 :id element-1] "value-1")
     ([li :num 5 :id element-2] "value-2")
     ([li :num 6 :id element-3] "value-3"))
    ([script :num 7]) " "
    ([button :num 8] "Click Me! "))))
(define-layout button_test_4 (button_test_4 button_test_4)
 ([VIEW :w 1280]
  ([BLOCK :x 0 :y 0 :w 1280 :h 118 :elt 0]
   ([BLOCK :x 8 :y 8 :w 1264 :h 102 :elt 2]
    ([BLOCK :x 8 :y 8 :w 1264 :h 57 :elt 3]
     ([BLOCK :x 48 :y 8 :w 1224 :h 19 :elt 4]
      ([LINE]
       ([TEXT :x 48 :y 8 :w 60 :h 19 :text "value-1"])))
     ([BLOCK :x 48 :y 27 :w 1224 :h 19 :elt 5]
      ([LINE]
       ([TEXT :x 48 :y 27 :w 60 :h 19 :text "value-2"])))
     ([BLOCK :x 48 :y 46 :w 1224 :h 19 :elt 6]
      ([LINE]
       ([TEXT :x 48 :y 46 :w 60 :h 19 :text "value-3"]))))
    ([ANON]
     ([LINE]
      ([INLINE :x 8 :y 81 :w 92 :h 29 :elt 8]
       ([LINE]
        ([TEXT :x 23 :y 87.5 :w 62 :h 16 :text "Click Me! "])))))))))
(define-problem button_test_4
  :title ""
  :url "file:///home/p92/button_test_1.html"
  :sheets firefox button_test_4
  :fonts button_test_4
  :layouts button_test_4
  :features display:list-item empty-text tag:button display:inline-block float:0)
;; From file:///home/p92/button_test_1.html
(define-stylesheet button_test_1)
(define-fonts button_test_1
  [16 "serif" 400 normal 16 0 1.5 1.5 19]
  [14 "sans-serif" 400 normal 14 0 1 1 17])
(define-browser button_test_1
  :matched true
  :w 1280
  :h 950
  :fs 16
  :fsm 12
  :scrollw 10)
(define-document button_test_1
  ([html :num 0]
   ([head :num 1])
   ([body :num 2]
    ([ul :num 3 :id list])
    ([script :num 4]) " "
    ([button :num 5] "Click Me! "))))
(define-layout button_test_1 (button_test_1 button_test_1)
 ([VIEW :w 1280]
  ([BLOCK :x 0 :y 0 :w 1280 :h 45 :elt 0]
   ([BLOCK :x 8 :y 8 :w 1264 :h 29 :elt 2]
    ([BLOCK :x 8 :y 8 :w 1264 :h 0 :elt 3])
    ([ANON]
     ([LINE]
      ([INLINE :x 8 :y 8 :w 92 :h 29 :elt 5]
       ([LINE]
        ([TEXT :x 23 :y 14.5 :w 62 :h 16 :text "Click Me! "])))))))))
(define-problem button_test_1
  :title ""
  :url "file:///home/p92/button_test_1.html"
  :sheets firefox button_test_1
  :fonts button_test_1
  :layouts button_test_1
  :features empty-text tag:button display:inline-block float:0)
;; From file:///home/sgriffith/Cassius/bench/js/button_test_1/button_test_1.html

(define-stylesheet button_test_5)

(define-fonts button_test_5
  [16 "serif" 400 normal 16 0 1.5 1.5 19]
  [14 "sans-serif" 400 normal 14 0 1.5 1.5 17])

(define-browser button_test_5
  :matched true
  :w 1280
  :h 950
  :fs 16
  :fsm 12
  :scrollw 10)

(define-document button_test_5
  ([html :num 0]
   ([head :num 1])
   ([body :num 2]
    ([ul :num 3 :id list]
     ([li :num 4 :id element-1] "value-1")
     ([li :num 5 :id element-2] "value-2")
     ([li :num 6 :id element-3] "value-3")
     ([li :num 7 :id element-4] "value-4"))
    ([script :num 8]) " "
    ([button :num 9] "Click Me! "))))

(define-layout button_test_5 (button_test_5 button_test_5)
 ([VIEW :w 1280]
  ([BLOCK :x 0 :y 0 :w 1280 :h 137 :elt 0]
   ([BLOCK :x 8 :y 8 :w 1264 :h 121 :elt 2]
    ([BLOCK :x 8 :y 8 :w 1264 :h 76 :elt 3]
     ([BLOCK :x 48 :y 8 :w 1224 :h 19 :elt 4]
      ([LINE]
       ([TEXT :x 48 :y 8 :w 58 :h 19 :text "value-1"])))
     ([BLOCK :x 48 :y 27 :w 1224 :h 19 :elt 5]
      ([LINE]
       ([TEXT :x 48 :y 27 :w 58 :h 19 :text "value-2"])))
     ([BLOCK :x 48 :y 46 :w 1224 :h 19 :elt 6]
      ([LINE]
       ([TEXT :x 48 :y 46 :w 58 :h 19 :text "value-3"])))
     ([BLOCK :x 48 :y 65 :w 1224 :h 19 :elt 7]
      ([LINE]
       ([TEXT :x 48 :y 65 :w 58 :h 19 :text "value-4"]))))
    ([ANON]
     ([LINE]
      ([INLINE :x 8 :y 100 :w 95 :h 29 :elt 9]
       ([LINE]
        ([TEXT :x 23 :y 106 :w 65 :h 17 :text "Click Me! "])))))))))

(define-problem button_test_5
  :title ""
  :url "file:///home/sgriffith/Cassius/bench/js/button_test_1/button_test_1.html"
  :sheets firefox button_test_5
  :fonts button_test_5
  :layouts button_test_5
  :features display:list-item empty-text tag:button display:inline-block float:0)
