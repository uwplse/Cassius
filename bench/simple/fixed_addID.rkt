;; python get_bench.py --name  'file:///Users/Amanda/Documents/GitHub/bench/simple/addID.html'
;; This example document should have two side by side blue boxes, 150px width.
;; The id box on the second block child element is missing. It should be added to match the spec.

(define-header header
"")

;; From file:///Users/Amanda/Documents/GitHub/bench/simple/addID.html

(define-stylesheet doc-1
  ((and (id box-container))
   [width (px 400)]
   [height (px 400)]
   [display inline-block])
  ((child (and (id box-container)) (and (id box)))
   [width (px 150)]
   [height (px 150)]
   [margin-left (px 10)]
   #;[background-color blue])
  ((child (and (id box-container)) (and (tag div)))
   [width (px 50)]
   [height (px 50)]
   #;[background-color blue]))

(define-document (doc-1 #:width 1280 #:browser firefox)
([BLOCK :tag HTML :w 1280.0 :h 8.247524752475247 :x 0.0 :y 0.0]
 ([BLOCK :tag BODY :w 1264.0 :h 0.24752475247524752 :x 8.0 :y 0.0]
  ([MAGIC :tag DIV :x 8.0 :y 8.0 :w 399.9999999999991 :h 399.9999999999991 :mt 0 :mr 0 :mb 0 :ml 0 :id box-container]
   ([BLOCK :tag DIV :id box :w 150.0 :h 150.0 :x 11112.0 :y -4808.247524752475]))
  ([ANON :w 1264.0 :h 16.0 :x 8.0 :y 1573.2475247524753]
   ([LINE :w 1264.0 :h 16.0 :x 8.0 :y 1573.2475247524753]
    ([TEXT :w 4.0 :h 16.0 :x 97.0 :y 1573.2475247524753])))
  ([MAGIC :tag DIV :x 412.0 :y 8.0 :w 400.0 :h 399.9999999999982 :mt 0 :mr 0 :mb 0 :ml 0 :id box-container]
   ([BLOCK :tag DIV :w 50.0 :h 50.0 :x 5941.0 :y -12589.247524752474])))))


(define-problem doc-1
  ""
  #:url "file:///Users/Amanda/Documents/GitHub/bench/simple/addID.html"
  #:header header
  #:sheet doc-1
  #:documents doc-1
  #:features (inline-block))
