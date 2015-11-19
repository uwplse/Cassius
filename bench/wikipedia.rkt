;; python get_bench.py --name wikipedia 'file:///tmp/Cassius%20Marcellus%20Clay%20(politician)%20-%20Wikipedia,%20the%20free%20encyclopedia.html'

(define-header header
"")

;; From file:///tmp/Cassius%20Marcellus%20Clay%20(politician)%20-%20Wikipedia,%20the%20free%20encyclopedia.html

(define-stylesheet doc-1
  ((or (tag html) (tag body))
   #;[height height/100%]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((id mw-page-base)
   [height (height/px 80)])
  ((id mw-head-base)
   [height (height/px 80)]
   [margin-top (margin/px -80)]
   [margin-left (margin/px 176)])
  ((id content)
   [margin-top (margin/px -1)]
   [margin-left (margin/px 176)]
   [padding-top (padding/px 20)]
   [padding-right (padding/px 24)]
   [padding-bottom (padding/px 20)]
   [padding-left (padding/px 24)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((id footer)
   [margin-left (margin/px 176)]
   [padding-top (padding/px 20)]
   [padding-right (padding/px 20)]
   [padding-bottom (padding/px 20)]
   [padding-left (padding/px 20)])
  ((tag h1)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 7.2)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [border-bottom-width (border/px 1)])
  ((id interwiki-completelist)
   #;[font-weight font-weight/bold])
  ((id toolbar)
   [height (height/px 22)]
   [margin-bottom (margin/px 6)])
  #;((id simpleSearch)
   [width (width/px 381.4)]
   [min-width min-width/5em]
   [max-width max-width/20em])
  ((id e10008)
   #;[clear clear/both])
  ((id e1)
   [padding-top (padding/px 5.6)]
   [float float/right])
  ((id catlinks)
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   [padding-top (padding/px 5)]
   [padding-right (padding/px 5)]
   [padding-bottom (padding/px 5)]
   [padding-left (padding/px 5)]
   [margin-top (margin/px 16.8)])
  ((id contentsub)
   [margin-left (margin/px (/ 706 60))]))

(define-stylesheet doc-1-sketch
  ((or (tag html) (tag body))
   #;[height height/100%]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((id mw-page-base)
   [height (height/px 80)])
  ((id mw-head-base)
   [height (height/px 80)]
   [margin-top (margin/px -80)]
   [margin-left (margin/px 176)])
  ((id content)
   [margin-top (margin/px -1)]
   [margin-left (margin/px 176)]
   [padding-top (padding/px 20)]
   [padding-right (padding/px 24)]
   [padding-bottom (padding/px 20)]
   [padding-left (padding/px 24)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((id footer)
   [margin-left (margin/px 176)]
   [padding-top (padding/px 20)]
   [padding-right (padding/px 20)]
   [padding-bottom (padding/px 20)]
   [padding-left (padding/px 20)])
  ((tag h1)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 7.2)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [border-bottom-width (border/px 1)])
  ((id interwiki-completelist)
   #;[font-weight font-weight/bold])
  ((id toolbar)
   [height (height/px 22)]
   [margin-bottom (margin/px 6)])
  #;((id simpleSearch)
   [width (width/px 381.4)]
   [min-width min-width/5em]
   [max-width max-width/20em])
  ((id e10008)
   #;[clear clear/both])
  ((id e1)
   [padding-top (padding/px 5.6)]
   [float float/right])
  ((id catlinks)
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   [padding-top (padding/px 5)]
   [padding-right (padding/px 5)]
   [padding-bottom (padding/px 5)]
   [padding-left (padding/px 5)]
   [margin-top (margin/px 16.8)])
  ((id contentsub)
   [margin-left (margin/px (/ 706 60))]))


(define-document (doc-1 #:width 1907 #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 1907 #|:h 985|#]
   ([BLOCK :tag BODY :x 0 :y 0 :w 1907 #|:h 985|#]
    ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 80 :id mw-page-base])
    ([BLOCK :tag DIV :x 176 :y 0 :w 1731 :h 80 :id mw-head-base])
    ([BLOCK :tag DIV :x 176 :y 79 :w 1731 #|:h (/ 18808 5)|# :id content]
     ([BLOCK :tag DIV :x 201 :y 100 :w 1682 :h 0 :id siteNotice]
      ([BLOCK :tag DIV :x 201 :y 100 :w 1682 :h 0 :id centralNotice]))
     ([BLOCK :tag H1 :x 201 :y 100 :w 1682 :h (/ 1153 30) :id firstHeading]
      ([LINE]
       ([TEXT :x 201 :y (/ 3066 30) :w 448 :h 33])))

     ([BLOCK :tag DIV :x 201 :y (/ 4369 30) :w 1682 :h (/ 44041 12) :id bodyContent :class (mw-body-content)]
      ([BLOCK :tag DIV :x 201 :y (/ 4369 30) :w 1682 :h (/ 309 15) :id siteSub]
       ([LINE]
        ([TEXT :x 201 :y (/ 4483 30) :w 240 :h 13])))
      ([MAGIC :h (/ 1 60)])
      ([BLOCK :tag DIV :x (/ 6383 30) :y 166.25 :w (/ 50107 30) :h 0 :id contentSub])
      ([MAGIC :tag DIV :x 201 :y 171.25 :w 1682 :h 3562.2 :id mw-content-text :class (mw-content-ltr)])
      #;
      ([BLOCK :tag DIV :x 201 :y 171.25 :w 1682 :h 3562.2 :id mw-content-text :class (mw-content-ltr)]
       ([BLOCK :tag DL :x 201 :y 171.25 :w 1682 :h 23.4]
        ([BLOCK :tag DD :x 223.4 :y 171.25 :w 1659.6 :h 23.4]
         ([LINE]
          ([INLINE :tag I]
           ([TEXT :x 223.4 :y (/ 2231 12) :w 772 :h 16])
           ([INLINE :tag A]
            ([TEXT :x 995.4 :y (/ 2231 12) :w 101 :h 16]))
           ([TEXT :x 1096.4 :y (/ 2231 12) :w 192 :h 16])
           ([INLINE :tag A :class (mw-redirect)]
            ([TEXT :x 1288.4 :y (/ 2231 12) :w 176 :h 16]))))))
       ([MAGIC :tag TABLE :x (/ 48361 30) :y 205.625 :w (/ 8129 30) :h (/ 24351 15) :mt (/ 37 6) :mr 0 :mb (/ 37 6) :ml 12.3 :class (infobox vcard)])
       ([BLOCK :tag P :x 201 :y 213.1 :w 1682 :h 23.4]
        ([LINE]
         ([INLINE :tag B]
          ([TEXT :x 201 :y 216.3 :w 179 :h 16]))
         ([TEXT :x 380 :y 218.3 :w 327 :h 14])
         ([INLINE :tag B]
          ([TEXT :x 707 :y 216.3 :w 172 :h 16]))
         ([TEXT :x 879 :y 218.3 :w 374 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1253 :y 218.3 :w 124 :h 14]))
         ([TEXT :x 1377 :y 218.3 :w 4 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 7305 30) :w 1682 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y 232.25 :w 218 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 419 :y 232.25 :w 113 :h 14]))
         ([TEXT :x 532 :y 232.25 :w 852 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 3275 12) :w 1682 :h 0])
       ([MAGIC :tag DIV :x 201 :y (/ 3275 12) :w 244.65 :h 315.3 :mt 0 :mr 0 :mb 0 :ml 0 :id toc :class (toc)])
       ([BLOCK :tag P :x 201 :y (/ 17857 30) :w 1682 :h 0])
       ([BLOCK :tag H2 :x 201 :y (/ 18277 30) :w 1311.25 :h 28.3]
        ([LINE]
         ([INLINE :tag SPAN :id Early_life.2C_education_and_marriage :class (mw-headline)]
          ([TEXT :x 201 :y 610.9 :w 317 :h 24]))))
       ([BLOCK :tag P :x 201 :y (/ 9668 15) :w 1682 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 9731 15) :w 244 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 445 :y (/ 9731 15) :w 75 :h 14]))
         ([TEXT :x 520 :y (/ 9731 15) :w 157 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 677 :y (/ 9731 15) :w 56 :h 14]))
         ([TEXT :x 733 :y (/ 9731 15) :w 34 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 767 :y (/ 9731 15) :w 170 :h 14]))
         ([TEXT :x 937 :y (/ 9731 15) :w 633 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 10067 15) :w 256 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 2089 3) :w 1682 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 10508 15) :w 523 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 724 :y (/ 10508 15) :w 89 :h 14]))
         ([TEXT :x 813 :y (/ 10508 15) :w 669 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1482 :y (/ 10508 15) :w 72 :h 14]))
         ([TEXT :x 1554 :y (/ 10508 15) :w 30 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 10844 15) :w 128 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 329 :y (/ 10844 15) :w 138 :h 14]))
         ([TEXT :x 467 :y (/ 10844 15) :w 399 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 866 :y (/ 10844 15) :w 122 :h 14]))
         ([TEXT :x 988 :y (/ 10844 15) :w 301 :h 14])
         ([INLINE :tag SUP :id cite_ref-eliza_1-0 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1289 :y (/ 4327 6) :w 4 :h 11]))
           ([TEXT :x 1293 :y (/ 4327 6) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1300 :y (/ 4327 6) :w 4 :h 11]))))
         ([TEXT :x 1304 :y (/ 10844 15) :w 77 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1381 :y (/ 10844 15) :w 118 :h 14]))
         ([TEXT :x 1499 :y (/ 10844 15) :w 76 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 2236 3) :w 309 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 11558 15) :w 1682 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 11621 15) :w 191 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 392 :y (/ 11621 15) :w 152 :h 14]))
         ([TEXT :x 544 :y (/ 11621 15) :w 180 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 724 :y (/ 11621 15) :w 83 :h 14]))
         ([TEXT :x 807 :y (/ 11621 15) :w 301 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1108 :y (/ 11621 15) :w 147 :h 14]))
         ([TEXT :x 1255 :y (/ 11621 15) :w 320 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 11957 15) :w 623 :h 14])
         ([INLINE :tag SUP :id cite_ref-2 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 824 :y (/ 23861 30) :w 4 :h 11]))
           ([TEXT :x 828 :y (/ 23861 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 835 :y (/ 23861 30) :w 4 :h 11]))))
         ([TEXT :x 839 :y (/ 11957 15) :w 741 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 12293 15) :w 225 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-0 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 426 :y (/ 24533 30) :w 4 :h 11]))
           ([TEXT :x 430 :y (/ 24533 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 437 :y (/ 24533 30) :w 4 :h 11]))))))
       ([BLOCK :tag H2 :x 201 :y (/ 12881 15) :w 1311.25 :h 28.3]
        ([LINE]
         ([INLINE :tag SPAN :id Marriage_and_family :class (mw-headline)]
          ([TEXT :x 201 :y (/ 12906 15) :w 190 :h 24]))))
       ([BLOCK :tag P :x 201 :y (/ 26821 30) :w 1682 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 26947 30) :w 387 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 588 :y (/ 26947 30) :w 99 :h 14]))
         ([TEXT :x 687 :y (/ 26947 30) :w 556 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1243 :y (/ 26947 30) :w 64 :h 14]))
         ([TEXT :x 1307 :y (/ 26947 30) :w 46 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1353 :y (/ 26947 30) :w 37 :h 14]))
         ([TEXT :x 1390 :y (/ 26947 30) :w 8 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1398 :y (/ 26947 30) :w 71 :h 14]))
         ([TEXT :x 1469 :y (/ 26947 30) :w 108 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 27619 30) :w 674 :h 14])))
       ([BLOCK :tag H2 :x 201 :y (/ 5759 6) :w 1311.25 :h 28.3]
        ([LINE]
         ([INLINE :tag SPAN :id Political_career :class (mw-headline)]
          ([TEXT :x 201 :y (/ 28845 30) :w 140 :h 24]))))
       ([BLOCK :tag P :x 201 :y (/ 14927 15) :w 1682 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 2998 3) :w 267 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 468 :y (/ 2998 3) :w 115 :h 14]))
         ([TEXT :x 583 :y (/ 2998 3) :w 1015 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 15326 15) :w 44 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 245 :y (/ 15326 15) :w 111 :h 14]))
         ([TEXT :x 356 :y (/ 15326 15) :w 4 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-1 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 360 :y (/ 30599 30) :w 4 :h 11]))
           ([TEXT :x 364 :y (/ 30599 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 371 :y (/ 30599 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 15704 15) :w 1682 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 15767 15) :w 265 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 466 :y (/ 15767 15) :w 245 :h 14]))
         ([TEXT :x 711 :y (/ 15767 15) :w 4 :h 14])
         ([INLINE :tag SUP :id cite_ref-4 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 715 :y (/ 31481 30) :w 4 :h 11]))
           ([TEXT :x 719 :y (/ 31481 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 726 :y (/ 31481 30) :w 4 :h 11]))))
         ([TEXT :x 730 :y (/ 15767 15) :w 817 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 16103 15) :w 1388 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 16439 15) :w 56 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 257 :y (/ 16439 15) :w 79 :h 14]))
         ([TEXT :x 336 :y (/ 16439 15) :w 257 :h 14])
         ([INLINE :tag SUP :id cite_ref-BorgenichtRegan2010_5-0 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 593 :y (/ 6565 6) :w 4 :h 11]))
           ([TEXT :x 597 :y (/ 6565 6) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 604 :y (/ 6565 6) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 16817 15) :w 1682 :h 68.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 3379 3) :w 402 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 603 :y (/ 3373 3) :w 100 :h 16]))
         ([TEXT :x 703 :y (/ 3379 3) :w 24 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 727 :y (/ 3379 3) :w 136 :h 14]))
         ([TEXT :x 863 :y (/ 3379 3) :w 734 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 17231 15) :w 1370 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 17567 15) :w 297 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 498 :y (/ 17567 15) :w 107 :h 14]))
         ([TEXT :x 605 :y (/ 17567 15) :w 536 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-2 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1141 :y (/ 35081 30) :w 4 :h 11]))
           ([TEXT :x 1145 :y (/ 35081 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1152 :y (/ 35081 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 3589 3) :w 1682 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 18008 15) :w 126 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 327 :y (/ 18008 15) :w 154 :h 14]))
         ([TEXT :x 481 :y (/ 18008 15) :w 36 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 517 :y (/ 18008 15) :w 50 :h 14]))
         ([TEXT :x 567 :y (/ 18008 15) :w 461 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 1028 :y (/ 18008 15) :w 136 :h 14]))
         ([TEXT :x 1164 :y (/ 18008 15) :w 419 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 18344 15) :w 1356 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 3736 3) :w 47 :h 14])
         ([INLINE :tag SUP :id cite_ref-BorgenichtRegan2010_5-1 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 248 :y (/ 37307 30) :w 4 :h 11]))
           ([TEXT :x 252 :y (/ 37307 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 259 :y (/ 37307 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 19058 15) :w 1682 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 19121 15) :w 387 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 588 :y (/ 19121 15) :w 78 :h 14]))
         ([TEXT :x 666 :y (/ 19121 15) :w 288 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 954 :y (/ 19121 15) :w 41 :h 14]))
         ([TEXT :x 995 :y (/ 19121 15) :w 155 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1150 :y (/ 19121 15) :w 97 :h 14]))
         ([TEXT :x 1247 :y (/ 19121 15) :w 126 :h 14])
         ([INLINE :tag SUP :id cite_ref-6 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1373 :y (/ 38189 30) :w 4 :h 11]))
           ([TEXT :x 1377 :y (/ 38189 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1384 :y (/ 38189 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 19499 15) :w 1682 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 19562 15) :w 686 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 887 :y (/ 19562 15) :w 113 :h 14]))
         ([TEXT :x 1000 :y (/ 19562 15) :w 249 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1249 :y (/ 19562 15) :w 113 :h 14]))
         ([TEXT :x 1362 :y (/ 19562 15) :w 161 :h 14]))
        ([LINE]
         ([INLINE :tag A]
          ([TEXT :x 201 :y (/ 19898 15) :w 76 :h 14]))
         ([TEXT :x 277 :y (/ 19898 15) :w 306 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 583 :y (/ 19898 15) :w 107 :h 14]))
         ([TEXT :x 690 :y (/ 19898 15) :w 48 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 738 :y (/ 19898 15) :w 258 :h 14]))
         ([TEXT :x 996 :y (/ 19898 15) :w 4 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-3 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1000 :y (/ 39743 30) :w 4 :h 11]))
           ([TEXT :x 1004 :y (/ 39743 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1011 :y (/ 39743 30) :w 4 :h 11]))))
         ([TEXT :x 1015 :y (/ 19898 15) :w 186 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1201 :y (/ 19898 15) :w 109 :h 14]))
         ([TEXT :x 1310 :y (/ 19898 15) :w 4 :h 14])))
       ([BLOCK :tag H2 :x 201 :y (/ 20486 15) :w 1311.25 :h 28.3]
        ([LINE]
         ([INLINE :tag SPAN :id Civil_War_and_Minister_to_Russia :class (mw-headline)]
          ([TEXT :x 201 :y (/ 20511 15) :w 299 :h 24]))))
       ([BLOCK :tag P :x 201 :y (/ 42031 30) :w 1682 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 42157 30) :w 325 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 526 :y (/ 42157 30) :w 54 :h 14]))
         ([TEXT :x 580 :y (/ 42157 30) :w 164 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 744 :y (/ 42157 30) :w 99 :h 14]))
         ([TEXT :x 843 :y (/ 42157 30) :w 173 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1016 :y (/ 42157 30) :w 55 :h 14]))
         ([TEXT :x 1071 :y (/ 42157 30) :w 465 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 42829 30) :w 1350 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 43501 30) :w 1103 :h 14])
         ([INLINE :tag SUP :id cite_ref-7 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1304 :y (/ 21724 15) :w 4 :h 11]))
           ([TEXT :x 1308 :y (/ 21724 15) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1315 :y (/ 21724 15) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 44257 30) :w 1682 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 44383 30) :w 284 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 485 :y (/ 44383 30) :w 174 :h 14]))
         ([TEXT :x 659 :y (/ 44383 30) :w 555 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1214 :y (/ 44383 30) :w 94 :h 14]))
         ([TEXT :x 1308 :y (/ 44383 30) :w 289 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 9011 6) :w 1398 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 45727 30) :w 742 :h 14])
         ([INLINE :tag SUP :id cite_ref-8 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 943 :y (/ 22837 15) :w 4 :h 11]))
           ([TEXT :x 947 :y (/ 22837 15) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 954 :y (/ 22837 15) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 46483 30) :w 1682 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 46609 30) :w 672 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-4 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 873 :y (/ 23278 15) :w 4 :h 11]))
           ([TEXT :x 877 :y (/ 23278 15) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 884 :y (/ 23278 15) :w 4 :h 11]))))
         ([TEXT :x 888 :y (/ 46609 30) :w 311 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 1199 :y (/ 46609 30) :w 65 :h 14]))
         ([TEXT :x 1264 :y (/ 46609 30) :w 21 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1285 :y (/ 46609 30) :w 44 :h 14]))
         ([TEXT :x 1329 :y (/ 46609 30) :w 4 :h 14])
         ([INLINE :tag SUP :class (noprint Inline-Template Template-Fact) :id e10001]
          ([TEXT :x 1333 :y (/ 23278 15) :w 4 :h 11])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([INLINE :tag SPAN]
             ([TEXT :x 1337 :y (/ 23248 15) :w 87 :h 13]))))
          ([TEXT :x 1424 :y (/ 23278 15) :w 4 :h 11]))))
       ([BLOCK :tag H2 :x 201 :y (/ 9557 6) :w 1311.25 :h 28.3]
        ([LINE]
         ([INLINE :tag SPAN :id Later_political_activities :class (mw-headline)]
          ([TEXT :x 201 :y (/ 47835 30) :w 217 :h 24]))))
       ([BLOCK :tag P :x 201 :y (/ 24422 15) :w 1682 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 4897 3) :w 443 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 644 :y (/ 4897 3) :w 45 :h 14]))
         ([TEXT :x 689 :y (/ 4897 3) :w 204 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 893 :y (/ 4897 3) :w 66 :h 14]))
         ([TEXT :x 959 :y (/ 4897 3) :w 594 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 24821 15) :w 170 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 25199 15) :w 1682 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 25262 15) :w 536 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 737 :y (/ 25262 15) :w 119 :h 14]))
         ([TEXT :x 856 :y (/ 25262 15) :w 159 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1015 :y (/ 25262 15) :w 29 :h 14]))
         ([TEXT :x 1044 :y (/ 25262 15) :w 4 :h 14])
         ([INLINE :tag SUP :id cite_ref-9 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1048 :y (/ 50471 30) :w 4 :h 11]))
           ([TEXT :x 1052 :y (/ 50471 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1059 :y (/ 50471 30) :w 4 :h 11]))))
         ([INLINE :tag SUP :class (noprint Inline-Template) :id e10002]
          ([TEXT :x 1063 :y (/ 50471 30) :w 4 :h 11])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([INLINE :tag SPAN]
             ([TEXT :x 1067 :y (/ 50411 30) :w 74 :h 13]))))
          ([TEXT :x 1141 :y (/ 50471 30) :w 4 :h 11]))
         ([TEXT :x 1145 :y (/ 25262 15) :w 437 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 25598 15) :w 239 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-5 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 440 :y (/ 51143 30) :w 4 :h 11]))
           ([TEXT :x 444 :y (/ 51143 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 451 :y (/ 51143 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 25976 15) :w 1682 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 26039 15) :w 319 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 520 :y (/ 26039 15) :w 124 :h 14]))
         ([TEXT :x 644 :y (/ 26039 15) :w 399 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1043 :y (/ 26039 15) :w 106 :h 14]))
         ([TEXT :x 1149 :y (/ 26039 15) :w 329 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1478 :y (/ 26039 15) :w 36 :h 14]))
         ([TEXT :x 1514 :y (/ 26039 15) :w 34 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1548 :y (/ 26039 15) :w 36 :h 14]))
         ([TEXT :x 1584 :y (/ 26039 15) :w 4 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 5275 3) :w 135 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 336 :y (/ 5275 3) :w 116 :h 14]))
         ([TEXT :x 452 :y (/ 5275 3) :w 359 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 811 :y (/ 5275 3) :w 124 :h 14]))
         ([TEXT :x 935 :y (/ 5275 3) :w 4 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-6 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 939 :y (/ 52697 30) :w 4 :h 11]))
           ([TEXT :x 943 :y (/ 52697 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 950 :y (/ 52697 30) :w 4 :h 11]))))))
       ([BLOCK :tag H2 :x 201 :y (/ 26963 15) :w 1311.25 :h 28.3]
        ([LINE]
         ([INLINE :tag SPAN :id Later_years :class (mw-headline)]
          ([TEXT :x 201 :y (/ 21590 12) :w 104 :h 24]))))
       ([BLOCK :tag P :x 201 :y (/ 10997 6) :w 1682 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 55111 30) :w 311 :h 14])
         ([INLINE :tag SUP :id cite_ref-Clay_1984_10-0 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 512 :y (/ 27529 15) :w 4 :h 11]))
           ([TEXT :x 516 :y (/ 27529 15) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 530 :y (/ 27529 15) :w 4 :h 11]))))
         ([TEXT :x 534 :y (/ 55111 30) :w 1036 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 55783 30) :w 44 :h 14])
         ([INLINE :tag SUP :id cite_ref-Clay_1984_10-1 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 245 :y (/ 5573 3) :w 4 :h 11]))
           ([TEXT :x 249 :y (/ 5573 3) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 263 :y (/ 5573 3) :w 4 :h 11]))))
         ([TEXT :x 267 :y (/ 55783 30) :w 429 :h 14])
         ([INLINE :tag SUP :class (noprint Inline-Template Template-Fact) :id e10003]
          ([TEXT :x 696 :y (/ 5573 3) :w 4 :h 11])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([INLINE :tag SPAN]
             ([TEXT :x 700 :y (/ 5567 3) :w 87 :h 13]))))
          ([TEXT :x 787 :y (/ 5573 3) :w 4 :h 11]))))
       ([BLOCK :tag P :x 201 :y (/ 56539 30) :w 1682 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 11333 6) :w 1112 :h 14])
         ([INLINE :tag SUP :id cite_ref-11 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1313 :y (/ 28306 15) :w 4 :h 11]))
           ([TEXT :x 1317 :y (/ 28306 15) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1331 :y (/ 28306 15) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 57421 30) :w 1682 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 57547 30) :w 689 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 890 :y (/ 57547 30) :w 100 :h 14]))
         ([TEXT :x 990 :y (/ 57547 30) :w 61 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 58303 30) :w 1682 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 58429 30) :w 722 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 923 :y (/ 58429 30) :w 69 :h 14]))
         ([TEXT :x 992 :y (/ 58429 30) :w 34 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1026 :y (/ 58429 30) :w 96 :h 14]))
         ([TEXT :x 1122 :y (/ 58429 30) :w 115 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1237 :y (/ 58429 30) :w 105 :h 14]))
         ([TEXT :x 1342 :y (/ 58429 30) :w 63 :h 14])
         ([INLINE :tag SUP :id cite_ref-12 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1405 :y (/ 29188 15) :w 4 :h 11]))
           ([TEXT :x 1409 :y (/ 29188 15) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1423 :y (/ 29188 15) :w 4 :h 11]))))))
       ([BLOCK :tag H2 :x 201 :y (/ 11921 6) :w 1682 :h 28.3]
        ([LINE]
         ([INLINE :tag SPAN :id Legacy :class (mw-headline)]
          ([TEXT :x 201 :y (/ 59655 30) :w 65 :h 24]))))
       ([BLOCK :tag DIV :x 1623 :y (/ 30411 15) :w 260 :h (/ 592 3) :class (thumb tright)]
        ([BLOCK :tag DIV :x 1623 :y (/ 30411 15) :w 260 :h (/ 592 3) :class (thumbinner) :id e10004]
         ([ANON]
          ([LINE]
           ([INLINE :tag A :class (image)]
            ([INLINE :tag IMG :class (thumbimage)]))))
         ([BLOCK :tag DIV :x 1627 :y (/ 32961 15) :w 252 :h (/ 70 3) :class (thumbcaption)]
          ([BLOCK :tag DIV :x 1861 :y (/ 33006 15) :w 15 :h 11 :class (magnify)]
           ([BLOCK :tag A :x 1861 :y (/ 33006 15) :w 15 :h 11 :class (internal)]))
          ([ANON]
           ([LINE]
            ([INLINE :tag A :class (mw-redirect)]
             ([TEXT :x 1630 :y 2203.05 :w 62 :h 12])))))))
       ([BLOCK :tag P :x 201 :y (/ 30332 15) :w 1682 :h 23.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 6082 3) :w 115 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 316 :y (/ 6082 3) :w 67 :h 14]))
         ([TEXT :x 383 :y (/ 6082 3) :w 366 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 749 :y (/ 6076 3) :w 212 :h 16]))
         ([TEXT :x 961 :y (/ 6082 3) :w 4 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 30788 15) :w 1682 :h 89.6]
        ([LINE]
         ([TEXT :x 201 :y (/ 30851 15) :w 987 :h 14])
         ([INLINE :tag SUP :class (noprint Inline-Template Template-Fact) :id e10005]
          ([TEXT :x 1188 :y (/ 61649 30) :w 4 :h 11])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([INLINE :tag SPAN]
             ([TEXT :x 1192 :y (/ 61589 30) :w 87 :h 13]))))
          ([TEXT :x 1279 :y (/ 61649 30) :w 4 :h 11]))
         ([TEXT :x 1283 :y (/ 30851 15) :w 319 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 31187 15) :w 323 :h 14])
         ([INLINE :tag SUP :class (noprint Inline-Template Template-Fact) :id e10006]
          ([TEXT :x 524 :y (/ 62321 30) :w 4 :h 11])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([INLINE :tag SPAN]
             ([TEXT :x 528 :y (/ 62261 30) :w 87 :h 13]))))
          ([TEXT :x 615 :y (/ 62321 30) :w 4 :h 11]))
         ([TEXT :x 619 :y (/ 31187 15) :w 965 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 31523 15) :w 1072 :h 14])
         ([INLINE :tag SUP :id cite_ref-13 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1273 :y (/ 62993 30) :w 4 :h 11]))
           ([TEXT :x 1277 :y (/ 62993 30) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1291 :y (/ 62993 30) :w 4 :h 11]))))
         ([TEXT :x 1295 :y (/ 31523 15) :w 278 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 31859 15) :w 269 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 470 :y (/ 31859 15) :w 98 :h 14]))
         ([TEXT :x 568 :y (/ 31859 15) :w 123 :h 14])))
       ([BLOCK :tag BLOCKQUOTE :x 201 :y (/ 32342 15) :w 1402.4 :h 58.8]
        ([BLOCK :tag P :x 241 :y (/ 32447 15) :w 1322.4 :h 44.8]
         ([LINE]
          ([TEXT :x 241 :y (/ 6502 3) :w 1316 :h 14]))
         ([LINE]
          ([TEXT :x 241 :y (/ 32846 15) :w 134 :h 14]))))
       ([BLOCK :tag P :x 201 :y (/ 33434 15) :w 1682 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 33497 15) :w 128 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 329 :y (/ 33497 15) :w 78 :h 14]))
         ([TEXT :x 407 :y (/ 33497 15) :w 186 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 593 :y (/ 33497 15) :w 107 :h 14]))
         ([TEXT :x 700 :y (/ 33497 15) :w 700 :h 14])
         ([INLINE :tag SUP :id cite_ref-14 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1400 :y (/ 66941 30) :w 4 :h 11]))
           ([TEXT :x 1404 :y (/ 66941 30) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1418 :y (/ 66941 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 6775 3) :w 1682 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 33938 15) :w 1381 :h 14])
         ([INLINE :tag SUP :id cite_ref-rohleder_15-0 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1582 :y (/ 67823 30) :w 4 :h 11]))
           ([TEXT :x 1586 :y (/ 67823 30) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1600 :y (/ 67823 30) :w 4 :h 11]))))
         ([TEXT :x 1604 :y (/ 33938 15) :w 4 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 1608 :y (/ 33938 15) :w 119 :h 14]))
         ([TEXT :x 1727 :y (/ 33938 15) :w 151 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 34274 15) :w 85 :h 14])
         ([INLINE :tag SUP :id cite_ref-rohleder_15-1 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 286 :y (/ 13699 6) :w 4 :h 11]))
           ([TEXT :x 290 :y (/ 13699 6) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 304 :y (/ 13699 6) :w 4 :h 11]))))
         ([TEXT :x 308 :y (/ 34274 15) :w 4 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 312 :y (/ 34274 15) :w 125 :h 14]))
         ([TEXT :x 437 :y (/ 34274 15) :w 672 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1109 :y (/ 34274 15) :w 100 :h 14]))
         ([TEXT :x 1209 :y (/ 34274 15) :w 267 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1476 :y (/ 34274 15) :w 100 :h 14]))
         ([TEXT :x 1576 :y (/ 34274 15) :w 185 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1761 :y (/ 34274 15) :w 78 :h 14]))
         ([TEXT :x 1839 :y (/ 34274 15) :w 35 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 6922 3) :w 127 :h 14])
         ([INLINE :tag SUP :id cite_ref-16 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 328 :y (/ 69167 30) :w 4 :h 11]))
           ([TEXT :x 332 :y (/ 69167 30) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 346 :y (/ 69167 30) :w 4 :h 11]))))))
       ([BLOCK :tag H2 :x 201 :y (/ 35198 15) :w 1682 :h 28.3]
        ([LINE]
         ([INLINE :tag SPAN :id Writings :class (mw-headline)]
          ([TEXT :x 201 :y (/ 28178 12) :w 80 :h 24]))))
       ([BLOCK :tag UL :x 223.4 :y (/ 28561 12) :w 1659.6 :h 48.2]
        ([MAGIC :tag LI :x 223.4 :y (/ 28561 12) :w 1659.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0])
        ([MAGIC :tag LI :x 223.4 :y 2404.9 :w 1659.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]))
       ([BLOCK :tag H2 :x 201 :y 2296.25 :w 1682 :h 28.3]
        ([LINE]
         ([INLINE :tag SPAN :id See_also :class (mw-headline)]
          ([TEXT :x 201 :y (/ 36764 15) :w 74 :h 24]))))
       ([BLOCK :tag UL :x 223.4 :y (/ 14897 6) :w 1659.6 :h 22.4]
        ([MAGIC :tag LI :x 223.4 :y (/ 14897 6) :w 1659.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0]))
       ([BLOCK :tag H2 :x 201 :y (/ 75787 30) :w 1682 :h 28.3]
        ([LINE]
         ([INLINE :tag SPAN :id References :class (mw-headline)]
          ([TEXT :x 201 :y 2527.9 :w 102 :h 24]))))
       ([BLOCK :tag DIV :x 201 :y (/ 76794 30) :w 1682 :h (/ 1070 3) :class (reflist) :id e10007]
        ([BLOCK :tag OL :x 241.3 :y (/ 76794 30) :w 1641.7 :h (/ 1070 3) :class (references)]
         ([MAGIC :tag LI :x 241.3 :y (/ 76794 30) :w 1641.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-eliza-1])
         ([MAGIC :tag LI :x 241.3 :y (/ 77466 30) :w 1641.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-2])
         ([MAGIC :tag LI :x 241.3 :y 2604.65 :w 1641.7 :h (/ 121 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-FOOTNOTEChisholm1911-3])
         ([MAGIC :tag LI :x 241.3 :y (/ 31513 12) :w 1641.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-4])
         ([MAGIC :tag LI :x 241.3 :y (/ 79455 30) :w 1641.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-BorgenichtRegan2010-5])
         ([MAGIC :tag LI :x 241.3 :y 2670.95 :w 1641.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-6])
         ([MAGIC :tag LI :x 241.3 :y (/ 40401 15) :w 1641.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-7])
         ([MAGIC :tag LI :x 241.3 :y (/ 32590 12) :w 1641.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-8])
         ([MAGIC :tag LI :x 241.3 :y 2738.25 :w 1641.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-9])
         ([MAGIC :tag LI :x 241.3 :y 2760.7 :w 1641.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-Clay_1984-10])
         ([MAGIC :tag LI :x 241.3 :y 2783.1 :w 1641.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-11])
         ([MAGIC :tag LI :x 241.3 :y 2805.55 :w 1641.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-12])
         ([MAGIC :tag LI :x 241.3 :y 2876 :w 1641.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-13])
         ([MAGIC :tag LI :x 241.3 :y (/ 34205 12) :w 1641.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-14])
         ([MAGIC :tag LI :x 241.3 :y 2872.85 :w 1641.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-rohleder-15])
         ([MAGIC :tag LI :x 241.3 :y 2714.375 :w 1641.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-16])))
       ([BLOCK :tag DL :x 201 :y 2922.75 :w 1682 :h 22.4]
        ([BLOCK :tag DT :x 201 :y 2922.75 :w 1682 :h 22.4]
         ([LINE]
          ([TEXT :x 201 :y 2925.95 :w 84 :h 16]))))
       ([BLOCK :tag P :x 201 :y 2952.15 :w 1682 :h 23.4]
        ([LINE]
         ([INLINE :tag A :class (image)]
          ([INLINE :tag IMG]))
         ([TEXT :x 213 :y 2957.35 :w 4 :h 14])
         ([INLINE :tag CITE :class (citation encyclopaedia)]
          ([TEXT :x 217 :y 2957.35 :w 202 :h 14])
          ([INLINE :tag A :class (extiw)]
           ([TEXT :x 419 :y 2957.35 :w 159 :h 14]))
          ([TEXT :x 578 :y 2957.35 :w 13 :h 14])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([TEXT :x 591 :y 2955.35 :w 169 :h 16])))
          ([TEXT :x 760 :y 2957.35 :w 272 :h 14]))
         ([INLINE :tag SPAN :class (Z3988)])))
       ([BLOCK :tag H2 :x 201 :y 2996.55 :w 1682 :h 28.3]
        ([LINE]
         ([INLINE :tag SPAN :id Further_reading :class (mw-headline)]
          ([TEXT :x 201 :y 2998.2 :w 148 :h 24]))))
       ([BLOCK :tag UL :x 223.4 :y 3030.1 :w 1659.6 :h 172.2]
        ([MAGIC :tag LI :x 223.4 :y 3030.1 :w 1659.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0])
        ([MAGIC :tag LI :x 223.4 :y 3054.9 :w 1659.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0])
        ([MAGIC :tag LI :x 223.4 :y 3079.7 :w 1659.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0])
        ([MAGIC :tag LI :x 223.4 :y 3104.5 :w 1659.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0])
        ([MAGIC :tag LI :x 223.4 :y 3129.3 :w 1659.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0])
        ([MAGIC :tag LI :x 223.4 :y 3154.1 :w 1659.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0])
        ([MAGIC :tag LI :x 223.4 :y 3178.9 :w 1659.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]))
       ([BLOCK :tag H2 :x 201 :y 3223.3 :w 1682 :h 28.3]
        ([LINE]
         ([INLINE :tag SPAN :id External_links :class (mw-headline)]
          ([TEXT :x 201 :y 3224.95 :w 129 :h 24]))))
       ([BLOCK :tag UL :x 223.4 :y 3256.85 :w 1659.6 :h 117.6]
        ([MAGIC :tag LI :x 223.4 :y 3256.85 :w 1659.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0])
        ([MAGIC :tag LI :x 223.4 :y 3280.65 :w 1659.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0])
        ([MAGIC :tag LI :x 223.4 :y 3304.45 :w 1659.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0])
        ([MAGIC :tag LI :x 223.4 :y 3328.25 :w 1659.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0])
        ([MAGIC :tag LI :x 223.4 :y 3352.05 :w 1659.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0]))
       ([MAGIC :tag TABLE :x 688.2 :y 3381.1 :w (/ 8491 12) :h (/ 1589 12) :mt 6.65 :mr 0 :mb 6.65 :ml 0 :class (wikitable succession-box)])
       ([MAGIC :tag TABLE :x 201 :y (/ 21155 6) :w 1682 :h (/ 5623 30) :mt 12.3 :mr 0 :mb 0 :ml 0 :class (navbox)])
       ([MAGIC :tag TABLE :x 201 :y (/ 55684 15) :w 1682 :h 32.65 :mt -1 :mr 0 :mb 0 :ml 0 :class (navbox)]))
      ([BLOCK :tag DIV :x 201 :y (/ 45107 12) :w 1682 :h 56.8 :id catlinks :class (catlinks)]
       ([BLOCK :tag DIV :x 207 :y (/ 45179 12) :w 1670 :h 44.8 :id mw-normal-catlinks :class (mw-normal-catlinks)]
        ([LINE]
         ([INLINE :tag A]
          ([TEXT :x 207 :y 3769.1 :w 75 :h 14]))
         ([TEXT :x 282 :y 3769.1 :w 9 :h 14])
         ([INLINE :tag UL]))))))
    ([MAGIC :tag DIV :x 0 :y 3600.625 :w 1907 :h 0 :id mw-navigation])
    #;([BLOCK :tag DIV :x 0 :y 3600.625 :w 1907 :h 0 :id mw-navigation]
     ([BLOCK :tag H2 :x 0 :y -9999 :w 204 :h (/ 553 12)]
      ([LINE]
       ([TEXT :x 0 :y -9984.5 :w 204 :h 24])))
     ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 80 :id mw-head]
      ([BLOCK :tag DIV :x 1346 :y 5 :w 545 :h 20.7 :id p-personal]
       ([MAGIC :tag UL :x 1346 :y 5 :w 545 :h 0]))
      ([BLOCK :tag DIV :x 176 :y 40 :w 89.6 :h 40 :id left-navigation]
       ([BLOCK :tag DIV :x 176 :y 40 :w 89.6 :h 40 :id p-namespaces]
        ([MAGIC :tag UL :x 177 :y 40 :w 88.6 :h 40])))
      ([BLOCK :tag DIV :x 1368.2 :y 40 :w 538.8 :h 40 :id right-navigation]
       ([BLOCK :tag DIV :x 1368.2 :y 40 :w 170.4 :h 40 :id p-views]
        ([MAGIC :tag UL :x 1369.2 :y 40 :w 169.4 :h 40])
       ([BLOCK :tag DIV :x 1546.6 :y 40 :w 344.4 :h 34.8 :id p-search]
        ([BLOCK :tag FORM :x 1546.6 :y 50.4 :w 344.4 :h 24.4 :id searchform]
         ([BLOCK :tag DIV :x 1546.6 :y 50.4 :w 344.4 :h 24.4 :id simpleSearch]
          ([ANON]
           ([LINE]
            ([INLINE :tag INPUT])))
          ([BLOCK :tag INPUT :x 1868 :y 51.4 :w 22 :h 22.4 :id searchButton]))))))))
     ([MAGIC :tag DIV :x 0 :y 160 :w 168 :h 695.5 :id mw-panel])
     #;([BLOCK :tag DIV :x 0 :y 160 :w 168 :h 695.5 :id mw-panel]
      ([BLOCK :tag DIV :x 8 :y 0 :w 160 :h 160 :id p-logo]
       ([BLOCK :tag A :x 8 :y 0 :w 160 :h 160]))
      ([BLOCK :tag DIV :x 19.2 :y 176 :w 139.2 :h 144.5 :id p-navigation]
       ([BLOCK :tag DIV :x 27.2 :y 180 :w 131.2 :h 136.5]
        ([MAGIC :tag UL :x 27.2 :y 180 :w 131.2 :h 136.5])))
      ([BLOCK :tag DIV :x 19.2 :y 320.5 :w 139.2 :h 125.5 :id p-interaction]
       ([BLOCK :tag H3 :x 19.2 :y 324.5 :w 139.2 :h 20 :id p-interaction-label]
        ([LINE]
         ([TEXT :x 22.2 :y 328.5 :w 68 :h 12])))
       ([BLOCK :tag DIV :x 39.2 :y 344.5 :w 119.2 :h 97.5]
        ([MAGIC :tag UL :x 39.2 :y 344.5 :w 119.2 :h 97.5])))
      ([BLOCK :tag DIV :x 19.2 :y 446 :w 139.2 :h 184 :id p-tb]
       ([BLOCK :tag H3 :x 19.2 :y 450 :w 139.2 :h 20 :id p-tb-label]
        ([LINE]
         ([TEXT :x 22.2 :y 454 :w 31 :h 12])))
       ([BLOCK :tag DIV :x 39.2 :y 470 :w 119.2 :h 156]
        ([MAGIC :tag UL :x 39.2 :y 470 :w 119.2 :h 156])))
      ([BLOCK :tag DIV :x 19.2 :y 630 :w 139.2 :h 86.5 :id p-coll-print_export]
       ([BLOCK :tag H3 :x 19.2 :y 634 :w 139.2 :h 20 :id p-coll-print_export-label]
        ([LINE]
         ([TEXT :x 22.2 :y 638 :w 73 :h 12])))
       ([BLOCK :tag DIV :x 39.2 :y 654 :w 119.2 :h 58.5]
        ([MAGIC :tag UL :x 39.2 :y 654 :w 119.2 :h 58.5])))
      ([BLOCK :tag DIV :x 19.2 :y 716.5 :w 139.2 :h 139 :id p-lang]
       ([BLOCK :tag SPAN :x 144.4 :y 723.5 :w 14 :h 16])
       ([BLOCK :tag H3 :x 19.2 :y 720.5 :w 125.2 :h 20 :id p-lang-label]
        ([LINE]
         ([TEXT :x 22.2 :y 724.5 :w 69 :h 12])))
       ([BLOCK :tag DIV :x 39.2 :y 740.5 :w 119.2 :h 111]
        ([BLOCK :tag UL :x 39.2 :y 740.5 :w 119.2 :h 97.5]
         ([MAGIC :tag LI :x 39.2 :y 740.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (interlanguage-link interwiki-de)])
         ([MAGIC :tag LI :x 39.2 :y 760 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (interlanguage-link interwiki-es)])
         ([MAGIC :tag LI :x 39.2 :y 779.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (interlanguage-link interwiki-fr)])
         ([MAGIC :tag LI :x 39.2 :y 799 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (interlanguage-link interwiki-pl)])
         ([MAGIC :tag LI :x 39.2 :y 818.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (interlanguage-link interwiki-sv)]))
        ([BLOCK :tag DIV :x 39.2 :y 838 :w 119.2 :h 13.5]
         ([BLOCK :tag SPAN :x 85.4 :y 838 :w 73 :h 13.5]
          ([LINE]
           ([INLINE :tag A]
            ([TEXT :x 96.4 :y 838.75 :w 56 :h 12]))))))))
    ([MAGIC :tag DIV :x 176 :y 3600.625 :w 1731 :h (/ 4079 30) :id footer])
    #;([BLOCK :tag DIV :x 176 :y 3600.625 :w 1731 :h (/ 4079 30) :id footer]
     ([MAGIC :tag UL :x 196 :y 3619.375 :w 1691 :h (/ 1613 30) :id footer-info])
     ([MAGIC :tag UL :x 196 :y (/ 117435 30) :w 526.2 :h 33.6 :id footer-places])
     ([MAGIC :tag UL :x 1699.8 :y (/ 117435 30) :w 187.2 :h 42.2 :id footer-icons])
     ([BLOCK :tag DIV :x 196 :y 3956.7 :w 1691 :h 0 :id e10008])))))

(define-problem verify
  "Cassius Marcellus Clay (politician) - Wikipedia, the free encyclopedia"
  #:url "file:///tmp/Cassius%20Marcellus%20Clay%20(politician)%20-%20Wikipedia,%20the%20free%20encyclopedia.html"
  #:header header
  #:sheet doc-1
  #:documents doc-1
  #:features (tables inline-block unknown-display position unknown-selector s em clear % px auto vw % auto))

(define-problem sketch
  #:header header
  #:sheet doc-1-sketch
  #:documents doc-1)

(define-problem check
  #:header header
  #:sheet doc-1-sketch
  #:documents doc-1)
