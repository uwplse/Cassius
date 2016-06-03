(define-header header
"")

(define-stylesheet book-sheet
  ((id booklabel)
   [width (px 50)])
  ((tag body)
   [width (px 100)]))

(define-document (book-simple #:width 100)
  ([BLOCK :tag html :x 0 :y 0 :w 100]
   ([BLOCK :tag body :x 0 :y 0 :w 100]
    ([BLOCK :tag div :id booklabel :x 0 :y 0 :w 50]
     ([INLINE :tag img :x 0 :y 0 :w 30]))
    ([BLOCK :tag div :id boookLabe :x 0 :y 0 :w 50]
     ([INLINE :tag img :x 0 :y 0 :w 30])))))

(define-problem book-simple
  #:header header
  #:sheet book-sheet
  #:documents book-simple)