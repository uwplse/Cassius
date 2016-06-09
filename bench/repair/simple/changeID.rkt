;; python get_bench.py --name  'file:///Users/Amanda/Documents/GitHub/bench/changeID.html'
;; This example document should have two side by side blue boxes, 150px width. 
;; The id 'boxx' is incorrect. It should be changed to 'box' to match the specification. 

(define-header header
"")

;; From file:///Users/Amanda/Documents/GitHub/bench/changeID.html

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
  ([BLOCK :tag HTML :x 0 :y 0 :w 1280 :h 421.6]
   ([BLOCK :tag BODY :x 8 :y 8 :w 1264 :h 405.6]
    ([MAGIC :tag DIV :x 8 :y 8 :w 400 :h 400 :mt 0 :mr 0 :mb 0 :ml 0 :id box-container]
     ([BLOCK :tag DIV :x 18 :y 8 :w 150 :h 150 :id box]))
    ([ANON]
     ([LINE]
      ([TEXT :x 408 :y 396 :w 4 :h 16])))
    ([MAGIC :tag DIV :x 412 :y 8 :w 400 :h 400 :mt 0 :mr 0 :mb 0 :ml 0 :id box-container]
     ([BLOCK :tag DIV :x 422 :y 8 :w 150 :h 150 :id boxx])))))

(define-problem doc-1
  ""
  #:url "file:///Users/Amanda/Documents/GitHub/bench/changeID.html"
  #:header header
  #:sheet doc-1
  #:documents doc-1
  #:features (inline-block))

