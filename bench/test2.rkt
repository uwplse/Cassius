(define-header test "")

(define-stylesheet test
  ((tag div)
   [width (px 30)])
  ((tag div2)
   [width (px 50)])
  ((id myid)
   [margin-left (px 10)]))

(define-stylesheet with-hole
  (? ?)
  ((tag div)
   [width (px 30)])
  ((tag div2)
   [width (px 50)])
  ((id myid)
   [margin-left (px 10)]))

(define-stylesheet bad-ids
  ((id good-id-1)
   [width (px 30)])
  ((id good-id-2)
   [width (px 40)]))

(define-stylesheet test-empty ? ? ?)

(define-document (test #:width 20)
  ([BLOCK :tag html :x 0 :y 0 :w 20]
   ([BLOCK :tag body :x 0 :y 0 :w 20]
    ([BLOCK :tag div :x 0 :y 0 :w 10]))))

(define-document (test-wrong-id #:width 20)
  ([BLOCK :tag html :x 0 :y 0 :w 20]
   ([BLOCK :tag body :x 0 :y 0 :w 20]
    ([BLOCK :tag div :x 0 :y 0 :w 30])
    ([BLOCK :tag djv :x 0 :y 0 :w 30])
    ([BLOCK :tag div :x 0 :y 0 :w 30]))))

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
    ([BLOCK :tag djv :x 0 :y 0 :w 30])
    ([BLOCK :tag djv :x 0 :y 0 :w 30]))))

(define-document (cant-fix #:width 20)
  ([BLOCK :tag html :x 0 :y 0 :w 20]
   ([BLOCK :tag body :x 0 :y 0 :w 20]
    ([BLOCK :tag djv :x 10 :y 10 :w 100]))))


(define-document (bad-ids #:width 20)
  ([BLOCK :tag html :x 0 :y 0 :w 20]
   ([BLOCK :tag body :x 0 :y 0 :w 20]
    ([BLOCK :tag div :id bad :x 0 :y 0 :w 30])
    ([BLOCK :tag div :id bad2 :x 0 :y 0 :w 40]))))

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


(define-problem with-hole
  #:header test
  #:sheet with-hole
  #:documents test-wrong-id)

(define-problem cant-fix
  #:header test
  #:sheet test
  #:documents cant-fix)

(define-problem bad-ids
  #:header test
  #:sheet bad-ids
  #:documents bad-ids)