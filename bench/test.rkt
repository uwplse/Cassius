(define-header test "")

(define-stylesheet test
  ((tag div)
   [width (px 10)]))



(define-stylesheet test-max-width
  ((tag div)
  [max-width (px 10)]))

  (define-stylesheet test-max-width-wrong
    ((tag djv)
    [max-width (px 10)]))

(define-document (test #:width 20)
  ([BLOCK :tag html :x 0 :y 0 :w 20]
   ([BLOCK :tag body :x 0 :y 0 :w 20]
    ([BLOCK :tag div :x 0 :y 0 :w 10]))))

    (define-document (test-wrong-id #:width 20)
      ([BLOCK :tag html :x 0 :y 0 :w 20]
       ([BLOCK :tag body :x 0 :y 0 :w 20]
        ([BLOCK :tag djv :x 0 :y 0 :w 10]))))

(define-problem test
  #:header test
  #:sheet test
  #:documents test)

  (define-problem wrong-id
    #:header test
    #:sheet test
    #:documents test-wrong-id)
