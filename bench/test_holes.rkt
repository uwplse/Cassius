(define-header test "")

(define-stylesheet test
  ((tag div)
   ?))

(define-document (test #:width 20)
  ([BLOCK :tag html :x 0 :y 0 :w 20]
   ([BLOCK :tag body :x 0 :y 0 :w 20]
    ([BLOCK :tag div :x 0 :y 0 :w 10]))))

(define-problem test
  #:header test
  #:sheet test
  #:documents test)
