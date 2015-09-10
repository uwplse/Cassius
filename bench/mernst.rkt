;; python get_bench.py 'http://homes.cs.washington.edu/~mernst/'

(define-header header
"")

(define-stylesheet good-sheet
  ((sel/id id/leftsidebar)
   [width (width/px 175)]
   [float float/left]))

(define-stylesheet unknown-sheet
  ?)

;; From http://homes.cs.washington.edu/~mernst/

(define-document (doc-a #:width 958 #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 958 #|:h (/ 6419 15)|#]
   ([BLOCK :tag BODY :x 8 :y (/ 643 30) :w 942 #|:h (/ 4244 15)|#]
    ([BLOCK :tag DIV :x 8 :y (/ 643 30) :w 175 :h 406.5 :id leftsidebar]
     ([MAGIC :tag TABLE :x 8 :y (/ 643 30) :w 175 :h 406.5 :mt 0 :mr 0 :mb 0 :ml 0]))
    ([BLOCK :tag H1 :x 8 :y (/ 643 30) :w 942 :h 38]
     ([LINE]
      ([TEXT :x 183 :y (/ 643 30) :w 250 :h 38 :text "Michael Ernst"])))
    ([BLOCK :tag P :x 8 :y (/ 1213 15) :w 942 :h 57]
     ([LINE]
      ([TEXT :x 183 :y (/ 2471 30) :w 81 :h 16 :text " Professor"]))
     ([LINE]
      ([INLINE :tag A]
       ([TEXT :x 183 :y (/ 3041 30) :w 282 :h 16 :text "Computer Science & Engineering"])))
     ([LINE]
      ([INLINE :tag A]
       ([TEXT :x 183 :y (/ 3611 30) :w 212 :h 16 :text "University of Washington"]))
      ([TEXT :x 395 :y (/ 3611 30) :w 0 :h 16 :text " "])))
    ([BLOCK :tag P :x 8 :y (/ 2308 15) :w 942 :h 57]
     ([LINE]
      ([TEXT :x 183 :y (/ 4661 30) :w 76 :h 16 :text " My chief "])
      ([INLINE :tag A]
       ([TEXT :x 259 :y (/ 4661 30) :w 147 :h 16 :text "research interest"]))
      ([TEXT :x 406 :y (/ 4661 30) :w 329 :h 16 :text " is programmer productivity, including "])
      ([INLINE :tag A]
       ([TEXT :x 735 :y (/ 4661 30) :w 187 :h 16 :text "software engineering, "])))
     ([LINE]
      ([INLINE :tag A]
       ([TEXT :x 183 :y (/ 5231 30) :w 208 :h 16 :text "programming languages"]))
      ([TEXT :x 391 :y (/ 5231 30) :w 10 :h 16 :text ", "])
      ([INLINE :tag A]
       ([TEXT :x 401 :y (/ 5231 30) :w 66 :h 16 :text "security"]))
      ([TEXT :x 467 :y (/ 5231 30) :w 348 :h 16 :text ", testing, and related issues. Many of my "])
      ([INLINE :tag A]
       ([TEXT :x 815 :y (/ 5231 30) :w 104 :h 16 :text "publications"]))
      ([TEXT :x 919 :y (/ 5231 30) :w 0 :h 16 :text " "]))
     ([LINE]
      ([TEXT :x 183 :y (/ 5801 30) :w 37 :h 16 :text "and "])
      ([INLINE :tag A]
       ([TEXT :x 220 :y (/ 5801 30) :w 82 :h 16 :text "programs"]))
      ([TEXT :x 302 :y (/ 5801 30) :w 181 :h 16 :text " are available on-line. "])))
    ([BLOCK :tag P :x 8 :y (/ 3403 15) :w 942 :h 77.5]
     ([LINE]
      ([TEXT :x 183 :y (/ 3448 15) :w 40 :h 16 :text " I am "])
      ([INLINE :tag A]
       ([INLINE :tag B]
        ([TEXT :x 223 :y (/ 3403 15) :w 170 :h 19 :text "actively recruiting"])))
      ([TEXT :x 393 :y (/ 3448 15) :w 520 :h 16 :text " strong students who are interested in software engineering, "]))
     ([LINE]
      ([TEXT :x 183 :y (/ 3733 15) :w 718 :h 16 :text "programming languages, security, testing, and related topics. I am interested in new "]))
     ([LINE]
      ([TEXT :x 183 :y (/ 4018 15) :w 739 :h 16 :text "colleagues at all levels: undergraduates, graduate students, and postdocs. Finally, I am "]))
     ([LINE]
      ([TEXT :x 183 :y (/ 4303 15) :w 56 :h 16 :text "hiring "])
      ([INLINE :tag A]
       ([TEXT :x 239 :y (/ 4303 15) :w 157 :h 16 :text "staff programmers"]))
      ([TEXT :x 396 :y (/ 4303 15) :w 6 :h 16 :text ". "]))))))

(define-problem verify
  #:header header
  #:sheet good-sheet
  #:documents doc-a)

(define-problem synthesize
  #:header header
  #:sheet unknown-sheet
  #:documents doc-a)
