;; python get_bench.py --name wikipedia 'file:///tmp/Cassius%20Marcellus%20Clay%20(politician)%20-%20Wikipedia,%20the%20free%20encyclopedia.html'

(define-header header
"")

;; From file:///tmp/Cassius%20Marcellus%20Clay%20(politician)%20-%20Wikipedia,%20the%20free%20encyclopedia.html

(define-stylesheet doc-1-skel ? ? ?)

(define-stylesheet doc-1-sketch
  ((or (tag html) (tag body))
   ?)
  ((id mw-head-base)
   ?)
  ((id mw-page-base)
   ?)
  ((id content)
   ?)
  ((tag h1)
   ?))

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
   [float float/right]))

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
     ([MAGIC :tag DIV :x 201 :y (/ 4369 30) :w 1682 :h (/ 44041 12) :ml 0 :mr 0 :mt 0 :mb 0 :id bodyContent]))
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

(define-problem synthesize
  #:header header
  #:sheet doc-1-skel
  #:documents doc-1)

(define-problem sketch
  #:header header
  #:sheet doc-1-sketch
  #:documents doc-1)
