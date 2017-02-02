(define-stylesheet main
  ((tag body)
   (padding-top ?)
   (padding-right ?)
   (padding-bottom ?)
   (padding-left ?))
  ((tag header)
   (height ?))
  ((tag form)
   (width ?)
   (height ?)
   (margin-top ?)
   (margin-right ?)
   (margin-bottom ?)
   (margin-left ?)
   (padding-top ?)
   (padding-right ?)
   (padding-bottom ?)
   (padding-left ?))
  ((tag btn)
   (height ?)
   (width ?)
   (float ?)
   (margin-right ?)
   (margin-left ?))
  ((tag h1)
   (height ?)
   (margin-top ?)
   (margin-right ?)
   (margin-bottom ?)
   (margin-left ?))
  ((tag rect)
   (float ?)
   (margin-top ?)
   (margin-right ?)
   (margin-bottom ?)
   (margin-left ?)
   (padding-top ?)
   (padding-right ?)
   (padding-bottom ?)
   (padding-left ?))
  ((tag img)
   (height ?) (width ?))
  ((tag footer)
   (width ?)
   (margin-left ?)
   (position ?)
   (bottom ?)
   (left ?)
   (height ?))
  ((tag icon)
   (float ?)
   (width ?)
   (height ?)
   (margin-top ?)
   (margin-right ?)
   (margin-bottom ?)
   (margin-left ?)))

(define-stylesheet main-selector
  ((tag body) ?)
  ((tag header)
   ?)
  ((tag form)
   ?)
  ((tag btn)
   ?)
  ((tag h1)
   ?)
  ((tag rect)
   ?)
  ((tag img)
   ?)
  ((tag footer)
   ?)
  ((tag icon)
   ?))

(define-document main
  ([html]
   ([header])
   ([body]
    ([div]
     ([form]
      ([div] ([btn]) ([btn])))
     ([h1])
     ([g]
      ([rect] ([img]))
      ([rect] ([img]))
      ([rect] ([img]))
      ([rect] ([img]))
      ([rect] ([img]))
      ([rect] ([img])))))
   ([footer]
    ([icon])
    ([icon])
    ([icon])
    ([icon]))))

(define-layout (mockup)
 ([VIEW :w 750 :h 1334]
  ((BLOCK :tag html :w 750 :x 0 :y 0)
   ((BLOCK :tag header :x 0 :y 0 :w 750 :h 109))
   ((BLOCK :tag body :w 750 :x 0 :y 109.0)
    ((BLOCK :tag div)
     ((BLOCK :tag form :w 500 :h 75 :x 125 :y 159.0)
      ((BLOCK :tag div)
       ((BLOCK :tag btn :w 235 :h 55 :x 135 :y 169.0))
       ((BLOCK :tag btn :w 235 :h 55 :x 380 :y 169.0))))
     ((BLOCK :tag h1 :w 650 :h 75 :x 50 :y 259.0))
     ((BLOCK :tag g)
      ((BLOCK :tag rect :w 300 :h 200 :x 50 :y 359.0)
       ((BLOCK :tag img :w 250 :h 150 :x 75 :y 384.0)))
      ((BLOCK :tag rect :w 300 :h 200 :x 400 :y 359.0)
       ((BLOCK :tag img :w 250 :h 150 :x 425 :y 384.0)))
      ((BLOCK :tag rect :w 300 :h 200 :x 50 :y 609.0)
       ((BLOCK :tag img :w 250 :h 150 :x 75 :y 634.0)))
      ((BLOCK :tag rect :w 300 :h 200 :x 400 :y 609.0)
       ((BLOCK :tag img :w 250 :h 150 :x 425 :y 634.0)))
      ((BLOCK :tag rect :w 300 :h 200 :x 50 :y 859.0)
       ((BLOCK :tag img :w 250 :h 150 :x 75 :y 884.0)))
      ((BLOCK :tag rect :w 300 :h 200 :x 400 :y 859.0)
       ((BLOCK :tag img :w 250 :h 150 :x 425 :y 884.0))))))
   ((BLOCK :tag footer)
    ((BLOCK :tag icon :w 100 :h 100 :x 100 :y 1209.0))
    ((BLOCK :tag icon :w 100 :h 100 :x 250 :y 1209.0))
    ((BLOCK :tag icon :w 100 :h 100 :x 400 :y 1209.0))
    ((BLOCK :tag icon :w 100 :h 100 :x 550 :y 1209.0))))))

(define-layout (bigger)
 ([VIEW :w 1100 :h 1920]
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
            :style ([float ?] [height ?] [width ?] [margin ? ? ? ?])))))))

(define-problem one
  :sheets main
  :documents main
  :layouts mockup)

(define-problem one-selector
  :sheets main-selector
  :documents main
  :layouts mockup)

(define-problem two
  :sheets main
  :documents main main
  :layouts mockup bigger)

(define-layout (mockup-restricted)
 ([VIEW :w 750 :h 1334]
  ((BLOCK :tag html :w 750 :x 0 :y 0 :style ())
   ((BLOCK :tag header :x 0 :y 0 :w 750 :h 109 :style ([height ?])))
   ((BLOCK :tag body :w 750 :x 0 :y 109.0
           :style ([padding ? ? ? ?]))
    ((BLOCK :tag div :style ())
     ((BLOCK :tag form :w 500 :h 75 :x 125 :y 159.0
             :style ([margin ? ? ? ?] [padding ? ? ? ?] [width ?] [height ?]))
      ((BLOCK :tag div :style ())
       ((BLOCK :tag btn :w 235 :h 55 :x 135 :y 169.0
               :style ([height ?] [width ?] [float ?] [margin-right ?] [margin-left ?])))
       ((BLOCK :tag btn :w 235 :h 55 :x 380 :y 169.0
               :style ([height ?] [width ?] [float ?] [margin-right ?] [margin-left ?])))))
     ((BLOCK :tag h1 :w 650 :h 75 :x 50 :y 259.0
             :style ([height ?] [margin ? ? ? ?])))
     ((BLOCK :tag g :style ())
      ((BLOCK :tag rect :w 300 :h 200 :x 50 :y 359.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag img :w 250 :h 150 :x 75 :y 384.0
               :style ([height ?] [width ?]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 400 :y 359.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag img :w 250 :h 150 :x 425 :y 384.0
               :style ([height ?] [width ?]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 50 :y 609.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag img :w 250 :h 150 :x 75 :y 634.0
               :style ([height ?] [width ?]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 400 :y 609.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag img :w 250 :h 150 :x 425 :y 634.0
               :style ([height ?] [width ?]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 50 :y 859.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag img :w 250 :h 150 :x 75 :y 884.0
               :style ([height ?] [width ?]))))
      ((BLOCK :tag rect :w 300 :h 200 :x 400 :y 859.0
              :style ([float ?] [padding ? ? ? ?] [margin ? ? ? ?]))
       ((BLOCK :tag img :w 250 :h 150 :x 425 :y 884.0
               :style ([height ?] [width ?])))))))
   ((BLOCK :tag footer
           :style ([width ?] [margin-left ?] [position ?] [bottom ?] [left ?] [height ?]))
    ((BLOCK :tag icon :w 100 :h 100 :x 100 :y 1209.0
            :style ([float ?] [height ?] [width ?] [margin ? ? ? ?])))
    ((BLOCK :tag icon :w 100 :h 100 :x 250 :y 1209.0
            :style ([float ?] [height ?] [width ?] [margin ? ? ? ?])))
    ((BLOCK :tag icon :w 100 :h 100 :x 400 :y 1209.0
            :style ([float ?] [height ?] [width ?] [margin ? ? ? ?])))
    ((BLOCK :tag icon :w 100 :h 100 :x 550 :y 1209.0
            :style ([float ?] [height ?] [width ?] [margin ? ? ? ?])))))))

(define-layout (mockup-correct)
 ([VIEW :w 750 :h 1334]
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
            :style ([float left] [height (px 100)] [width (px 100)] [margin (px 25) (px 25) (px 25) (px 25)])))))))

(define-problem one-done
  :sheets main
  :documents main
  :layouts mockup-correct)

(define-problem two-done
  :sheets main
  :documents main main
  :layouts mockup-correct bigger)