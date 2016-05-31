(define-header test "")

(define-stylesheet test
  ((tag div)
   [width (px 30)])
  ((tag div2)
   [width (px 50)])
  ((id myid)
   [margin-left (px 10)]))

(define-stylesheet test-empty ? ? ?)

(define-document (test #:width 20)
  ([BLOCK :tag html :x 0 :y 0 :w 20]
   ([BLOCK :tag body :x 0 :y 0 :w 20]
    ([BLOCK :tag div :x 0 :y 0 :w 10]))))

(define-document (test-wrong-id #:width 20)
  ([BLOCK :tag html :x 0 :y 0 :w 20]
   ([BLOCK :tag body :x 0 :y 0 :w 20]
    ([BLOCK :tag djv :x 0 :y 0 :w 30])
    ([BLOCK :tag dlv :x 0 :y 0 :w 30])
    ([BLOCK :tag dnv :x 0 :y 0 :w 30]))))

(define-document (test-wrong-id-2 #:width 20)
  ([BLOCK :tag html :x 0 :y 0 :w 20]
   ([BLOCK :tag body :x 0 :y 0 :w 20]
    ([BLOCK :tag djv :x 0 :y 0 :w 30]))))

(define-document (nested-1 #:width 20)
  ([BLOCK :tag html :x 0 :y 0 :w 20]
   ([BLOCK :tag body :x 0 :y 0 :w 20]
    ([BLOCK :tag djv :x 0 :y 0 :w 20]
     ([BLOCK :tag djv :x 0 :y 0 :w 30])))))

(define-document (one-wrong-id #:width 20)
  ([BLOCK :tag html :x 0 :y 0 :w 20]
   ([BLOCK :tag body :x 0 :y 0 :w 20]
    ([BLOCK :tag djv :x 0 :y 0 :w 30])
    ([BLOCK :tag div :x 0 :y 0 :w 30])
    ([BLOCK :tag div :x 0 :y 0 :w 30]))))

(define-problem test
  #:header test
  #:sheet test
  #:documents test)

(define-problem wrong-id
  #:header test
  #:sheet test
  #:documents test-wrong-id)

(define-problem one-wrong-id
  #:header test
  #:sheet test
  #:documents one-wrong-id)

(define-problem empty
  #:header test
  #:sheet test
  #:documents test-wrong-id)

(define-problem wrong-id-2
  #:header test
  #:sheet test
  #:documents test-wrong-id-2)

(define-problem nested-1
  #:header test
  #:sheet test
  #:documents nested-1)
