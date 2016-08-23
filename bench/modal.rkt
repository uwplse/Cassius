;; python get_bench.py --name modal 'file:///home/modal.html'
;; From file:///home/modal.html

(define-stylesheet main
  ((tag body)
   [margin-top (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [margin-right (px 0)]
   [font-size (px 14)]
   [line-height (multiplier (/ 8 7))])
  ((tag h1)
   [margin-top (px 20)]
   [margin-bottom (px 10)]
   [font-size (px 36)]
   [line-height (multiplier 1.1)])
  ((tag button)
   [width (px 180)]
   [height (px 20)]
   [padding-left (px 10)]
   [padding-right (px 10)]
   [padding-top (px 10)]
   [padding-bottom (px 10)])
  ((and (class modal) (class backdrop))
   [display none]
   [position fixed]
   [top (px 0)]
   [right (px 0)]
   [bottom (px 0)]
   [left (px 0)]
   [padding-top (px 20)]
   [padding-right (px 20)]
   [padding-bottom (px 20)]
   [padding-left (px 20)])
  ((and (class modal) (class backdrop) (class in))
   [display block])
  ((and (class modal) (class dialog))
   [margin-left auto]
   [margin-right auto]
   [width (px 600)]
   [position relative])
  ((and (class modal) (class close))
   [position absolute]
   [right (px 10)]
   [top (px 10)]
   [padding-left (px 0)]
   [padding-right (px 0)]
   [padding-top (px 0)]
   [padding-bottom (px 0)]
   [width auto]
   [height auto]))

(define-document dom-0
  ([html]
   ([body]
    ([h1] "Hello, Modal!")
    ([button :id clickme] "Launch demo modal")
    ([div :class (modal backdrop)]
     ([div :class (modal dialog)]
      ([button :class (modal close)]
       ([img]))
      ([content]))))))

(define-layout (snap-0 :browser firefox)
 ([VIEW :w 1920]
  ([BLOCK :tag html :x 0 :y 0 :w 1920 :h 107]
   ([BLOCK :tag body :x 0 :y 20 :w 1920 :h 87]
    ([BLOCK :tag h1 :x 0 :y 20 :w 1920 :h 37]
     ([LINE :h 37]
      ([TEXT :x 0 :y 21.3 :w 209 :h 37])))
    ([BLOCK :tag button :x 0 :y 67 :w 200 :h 40 :id clickme]
     ([LINE :h 19]
      ([TEXT :x 10 :y 79.6 :w 163 :h 19])))))))

(define-document dom-1
  ([html]
   ([body]
    ([h1] "Hello, Modal!")
    ([button :id clickme] "Launch demo modal")
    ([div :class (modal backdrop in)]
     ([div :class (modal dialog)]
      ([button :class (modal close)]
       ([img]))
      ([content]))))))

(define-layout (snap-1 :browser firefox)
 ([VIEW :w 1920]
  ([BLOCK :tag html :x 0 :y 0 :w 1920 :h 107]
   ([BLOCK :tag body :x 0 :y 20 :w 1920 :h 87]
    ([BLOCK :tag h1 :x 0 :y 20 :w 1920 :h 37]
     ([LINE :h 37]
      ([TEXT :x 0 :y 21.3 :w 209 :h 37])))
    ([BLOCK :tag button :x 0 :y 67 :w 200 :h 40 :id clickme]
     ([LINE :h 19]
      ([TEXT :x 10 :y 79.6 :w 163 :h 19])))
    ([BLOCK :tag div :class (modal backdrop in) :x 0 :y 0 :w 1920 :h 1080]
     ([BLOCK :tag div :class (modal dialog) :w 600 :h 200 :x 660 :y 20]
      ([BLOCK :tag button :class (modal close) :w 10 :h 10 :x 1240 :y 30]
       ([MAGIC :tag img :w 10 :h 10 :x 1240 :y 30]))
      ([MAGIC :tag content :x 660 :y 20 :w 600 :h 200])))))))

(define-handler open-dialog (id clickme) (click target)
  (add-class (select (and (class modal) (class backdrop))) in))

(define-handler close-dialog (and (class close) (class in)) (click target)
  (remove-class (parent (parent target)) in))

(define-action open-dialog
  (click (id clickme))
  (dom-0 dom-1))

(define-action close-dialog
  (click (class close))
  (dom-1 dom-0))

(define-problem actions
  :sheets main
  :layouts snap-0 snap-1
  :documents dom-0 dom-1
  ;:documents snap-0 snap-1
  :actions open-dialog close-dialog
  :handlers open-dialog close-dialog)
