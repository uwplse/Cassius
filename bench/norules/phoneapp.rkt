(define-header header "
* { padding: 0; margin: 0; }
div { outline: 1px solid black; }")

(define-stylesheet main)

(define-document (mockup #:width 750)
  ((BLOCK :tag html :w 750 :x 0 :y 0 :style ())
   ((BLOCK :tag header :x 0 :y 0 :w 750 :h 109 :style ([height ?])))
   ((BLOCK :tag body :w 750 :x 0 :y 109.0
           :style ([padding ? ? ? ?]))
    ((BLOCK :tag div :style ())
     ((BLOCK :tag form :w 500 :h 75 :x 125 :y 159.0
             :style ([margin ? ? ? ?] [padding ? ? ? ?] [width ?] [height ?]))
      ((BLOCK :tag div :style ())
       ((BLOCK :tag btn :w 215 :h 55 :x 135 :y 169.0
               :style ([height ?] [width ?] [float ?] [margin-right ?])))
       ((BLOCK :tag btn :w 215 :h 55 :x 400 :y 169.0
               :style ([height ?] [width ?] [float ?])))))
     ((BLOCK :tag rect :w 650 :h 75 :x 50 :y 259.0
             :style ([height ?] [margin ? ? ? ?])))
     ((BLOCK :tag g :style ())
      ((BLOCK :tag rect :w 300 :h 200 :x 50 :y 359.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag rect :w 250 :h 150 :x 75 :y 384.0
               :style ([height ?] [width ?]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 400 :y 359.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag rect :w 250 :h 150 :x 425 :y 384.0
               :style ([height ?] [width ?]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 50 :y 609.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag rect :w 250 :h 150 :x 75 :y 634.0
               :style ([height ?] [width ?]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 400 :y 609.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag rect :w 250 :h 150 :x 425 :y 634.0
               :style ([height ?] [width ?]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 50 :y 859.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag rect :w 250 :h 150 :x 75 :y 884.0
               :style ([height ?] [width ?]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 400 :y 859.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag rect :w 250 :h 150 :x 425 :y 884.0
               :style ([height ?] [width ?])))))))
   ((BLOCK :tag g
           :style ([width (px 600)] [margin-left (px -300)] [position absolute] [bottom (px 0)] [left (% 50)] [height (px 150)]))
    ((BLOCK :tag rect :w 100 :h 100 :x 100 :y 1209.0
            :style ([float ?] [height ?] [width ?] [margin ? ? ? ?])))
    ((BLOCK :tag rect :w 100 :h 100 :x 250 :y 1209.0
            :style ([float ?] [height ?] [width ?] [margin ? ? ? ?])))
    ((BLOCK :tag rect :w 100 :h 100 :x 400 :y 1209.0
            :style ([float ?] [height ?] [width ?] [margin ? ? ? ?])))
    ((BLOCK :tag rect :w 100 :h 100 :x 550 :y 1209.0
            :style ([float ?] [height ?] [width ?] [margin ? ? ? ?]))))))

(define-document (bigger #:width 1100)
  ((BLOCK :tag html :w 1100 :x 0 :y 0.0 :style ())
   ((BLOCK :tag header :x 0 :y 0 :w 1100 :h 109 :style ([height ?])))
   ((BLOCK :tag body :w 1100 :x 0 :y 109.0 :style ([padding ? ? ? ?]))
    ((BLOCK :tag div :style ())
     ((BLOCK :tag form :w 500 :h 75 :x 300 :y 159.0
             :style ([margin ? ? ? ?] [padding ? ? ? ?] [width ?] [height ?]))
      ((BLOCK :tag div :style ())
       ((BLOCK :tag button :w 215 :h 55 :x 310 :y 169.0
               :style ([height ?] [width ?] [float ?] [margin-right ?])))
       ((BLOCK :tag button :w 215 :h 55 :x 575 :y 169.0
               :style ([height ?] [width ?] [float ?])))))
     ((BLOCK :tag h1 :w 1000 :h 75 :x 50 :y 259.0
             :style ([height ?] [margin ? ? ? ?])))
     ((BLOCK :tag div :style ())
      ((BLOCK :tag rect :w 300 :h 200 :x 50 :y 359.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag rect :w 250 :h 150 :x 75 :y 384.0
               :style ([height ?] [width ?]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 400 :y 359.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag rect :w 250 :h 150 :x 425 :y 384.0
               :style ([height ?] [width ?]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 750 :y 359.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag rect :w 250 :h 150 :x 775 :y 384.0
               :style ([height ?] [width ?]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 50 :y 609.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag rect :w 250 :h 150 :x 75 :y 634.0
               :style ([height ?] [width ?]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 400 :y 609.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag rect :w 250 :h 150 :x 425 :y 634.0
               :style ([height ?] [width ?]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 750 :y 609.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag rect :w 250 :h 150 :x 775 :y 634.0
               :style ([height ?] [width ?])))))))
   ((BLOCK :tag g
           :style ([width ?] [margin-left ?] [position ?] [bottom ?] [left ?] [height ?]))
    ((BLOCK :tag rect :w 100 :h 100 :x 275 :y 1795.0
            :style ([float ?] [height ?] [width ?] [margin ? ? ? ?])))
    ((BLOCK :tag rect :w 100 :h 100 :x 425 :y 1795.0
            :style ([float ?] [height ?] [width ?] [margin ? ? ? ?])))
    ((BLOCK :tag rect :w 100 :h 100 :x 575 :y 1795.0
            :style ([float ?] [height ?] [width ?] [margin ? ? ? ?])))
    ((BLOCK :tag rect :w 100 :h 100 :x 725 :y 1795.0
            :style ([float ?] [height ?] [width ?] [margin ? ? ? ?]))))))

(define-problem one
  #:header header
  #:sheet main
  #:documents mockup)

(define-problem two
  #:header header
  #:sheet main
  #:documents mockup bigger)

(define-document (mockup-correct #:width 750)
  ((BLOCK :tag html :w 750 :x 0 :y 0
          :style ())
   ((BLOCK :tag header :x 0 :y 0 :w 750 :h 109 :style ([height (px 109)])))
   ((BLOCK :tag rect :w 750 :x 0 :y 109.0
           :style ([padding (px 25) (px 25) (px 25) (px 25)]))
    ((BLOCK :tag g
            :style ())
     ((BLOCK :tag rect :w 500 :h 75 :x 125 :y 159.0
             :style ([margin (px 25) auto (px 25) auto] [padding (px 10) (px 10) (px 10) (px 10)] [width (px 480)] [height (px 55)]))
      ((BLOCK :tag g
              :style ())
       ((BLOCK :tag rect :w 215 :h 55 :x 135 :y 169.0
               :style ([height (px 55)] [width (px 215)] [float left] [margin-right (px 50)])))
       ((BLOCK :tag rect :w 215 :h 55 :x 400 :y 169.0
               :style ([height (px 55)] [width (px 215)] [float left])))))
     ((BLOCK :tag rect :w 650 :h 75 :x 50 :y 259.0
             :style ([height (px 75)] [margin (px 0) (px 25) (px 0) (px 25)])))
     ((BLOCK :tag g
             :style ())
      ((BLOCK :tag rect :w 300 :h 200 :x 50 :y 359.0
              :style ([float left] [padding (px 25) (px 25) (px 25) (px 25)] [margin (px 25) (px 25) (px 25) (px 25)]))
       ((BLOCK :tag rect :w 250 :h 150 :x 75 :y 384.0
               :style ([height (px 150)] [width (px 250)]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 400 :y 359.0
              :style ([float left] [padding (px 25) (px 25) (px 25) (px 25)] [margin (px 25) (px 25) (px 25) (px 25)]))
       ((BLOCK :tag rect :w 250 :h 150 :x 425 :y 384.0
               :style ([height (px 150)] [width (px 250)]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 50 :y 609.0
              :style ([float left] [padding (px 25) (px 25) (px 25) (px 25)] [margin (px 25) (px 25) (px 25) (px 25)]))
       ((BLOCK :tag rect :w 250 :h 150 :x 75 :y 634.0
               :style ([height (px 150)] [width (px 250)]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 400 :y 609.0
              :style ([float left] [padding (px 25) (px 25) (px 25) (px 25)] [margin (px 25) (px 25) (px 25) (px 25)]))
       ((BLOCK :tag rect :w 250 :h 150 :x 425 :y 634.0
               :style ([height (px 150)] [width (px 250)]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 50 :y 859.0
              :style ([float left] [padding (px 25) (px 25) (px 25) (px 25)] [margin (px 25) (px 25) (px 25) (px 25)]))
       ((BLOCK :tag rect :w 250 :h 150 :x 75 :y 884.0
               :style ([height (px 150)] [width (px 250)]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 400 :y 859.0
              :style ([float left] [padding (px 25) (px 25) (px 25) (px 25)] [margin (px 25) (px 25) (px 25) (px 25)]))
       ((BLOCK :tag rect :w 250 :h 150 :x 425 :y 884.0
               :style ([height (px 150)] [width (px 250)])))))))
   ((BLOCK :tag g
           :style ([width (px 600)] [position absolute] [bottom (px 0)] [left (% 50)] [margin-left (px -300)] [height (px 150)]))
    ((BLOCK :tag rect :w 100 :h 100 :x 100 :y 1209.0
            :style ([float left] [height (px 100)] [width (px 100)] [margin (px 25) (px 25) (px 25) (px 25)])))
    ((BLOCK :tag rect :w 100 :h 100 :x 250 :y 1209.0
            :style ([float left] [height (px 100)] [width (px 100)] [margin (px 25) (px 25) (px 25) (px 25)])))
    ((BLOCK :tag rect :w 100 :h 100 :x 400 :y 1209.0
            :style ([float left] [height (px 100)] [width (px 100)] [margin (px 25) (px 25) (px 25) (px 25)])))
    ((BLOCK :tag rect :w 100 :h 100 :x 550 :y 1209.0
            :style ([float left] [height (px 100)] [width (px 100)] [margin (px 25) (px 25) (px 25) (px 25)]))))))

(define-problem one-done
  #:header header
  #:sheet main
  #:documents mockup-correct)

(define-problem two-done
  #:header header
  #:sheet main
  #:documents mockup-correct bigger)
