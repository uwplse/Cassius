;; python get_bench.py --name books\books 'file:///C:/Users/amasw/Documents/GitHub/cassiusnew/bench/books/book.html'

(define-header header
"")

;; From file:///C:/Users/amasw/Documents/GitHub/cassiusnew/bench/books/book.html

(define-stylesheet books-sheet
  ((tag img)
   [width (% 100)]
   [height (% 100)])
  ((tag div)
   [width (px 100)]
   [height (px 100)]
   [padding-top (px 10)]))

(define-document (books-document #:width 1242)
  ([BLOCK :tag html :x 0 :y 0 :w 1242 :h (/ 1535 6)]
   ([BLOCK :tag body :x 0 :y 0 :w 1242 :h (/ 1439 6)]
    ([BLOCK :tag div :x 0 :y 0 :w 100 :h 110]
     ([LINE]
      ([INLINE :tag img])))
    ([BLOCK :tag djv :x 0 :y 110 :w 100 :h 110]
     ([LINE]
      ([INLINE :tag img])))
    ([ANON]
     ([LINE]
      ([INLINE :tag label]
       ([TEXT :x 0 :y (/ 6857 30) :w (/ 1867 15) :h 18.7])))))))

(define-problem books-synthesize-rule
  "Cassius Repair Example"
  #:url "file:///C:/Users/amasw/Documents/GitHub/cassiusnew/bench/books/book.html"
  #:header header
  #:sheet books-sheet
  #:documents books-document
  #:features (%))

(define-problem books-synthesize-rule
  "Cassius Repair Example"
  #:url "file:///C:/Users/amasw/Documents/GitHub/cassiusnew/bench/books/book.html"
  #:header header
  #:sheet books-sheet
  #:documents books-document
  #:features (%))

