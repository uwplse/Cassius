#lang racket
(require "../cassius/main.rkt")

(print-rules
(solve
 `(,@(make-preamble)
   ,@(make-rule 'body 'body)
   ,@(make-rule 'div 'div)

   ,@(make-dom 'html1 'doc1
               '([<BODY> body1 body]
                 ([<DIV> diva1 div])))

   (assert (! (= (w (doc1f html1)) 600) :named width-1))
   (assert (! (>= (h (doc1f html1)) 400) :named height-1))

   (assert (! (= (x  (doc1f body1)) 100) :named body-l-1))
   (assert (! (= ,(vw '(doc1f body1)) 400) :named body-r-1))
   (assert (! (= (y  (doc1f body1)) 0) :named body-t-1))
   (assert (! (= ,(vh '(doc1f body1)) 400) :named body-b-1))
   (assert (! (= (bgc (doc1f body1)) |#xff0000|) :named body-bg-1))

   (assert (! (= (x (doc1f diva1)) 150) :named a-l-1))
   (assert (! (= ,(vw '(doc1f diva1)) 300) :named a-r-1))
   (assert (! (= (y (doc1f diva1)) 5) :named a-t-1))
   (assert (! (= ,(vh '(doc1f diva1)) 100) :named a-b-1))
   (assert (! (= (bgc (doc1f diva1)) |#x00ff00|) :named a-bg-1))

   ,@(make-dom 'html2 'doc2
               '([<BODY> body2 body]
                 ([<DIV> diva2 div])
                 ([<DIV> divb2 div])))

   (assert (! (= (w (doc2f html2)) 800) :named width-2))
   (assert (! (>= (h (doc2f html2)) 400) :named height-2))

   (assert (! (= (x (doc2f body2)) 200) :named body-l-2))
   (assert (! (= ,(vw '(doc2f body2)) 400) :named body-r-2))
   (assert (! (= (y (doc2f body2)) 0) :named body-t-2))
   (assert (! (= ,(vh '(doc2f body2)) 400) :named body-b-2))
   (assert (! (= (bgc (doc2f body2)) |#xff0000|) :named body-bg-2))

   (assert (! (= (x (doc2f diva2)) 250) :named a-l-2))
   (assert (! (= ,(vw '(doc2f diva2)) 300) :named a-r-2))
   (assert (! (= (y (doc2f diva2)) 5) :named a-t-2))
   (assert (! (= ,(vh '(doc2f diva2)) 100) :named a-b-2))
   (assert (! (= (bgc (doc2f diva2)) |#x00ff00|) :named a-bg-2))

   (assert (! (= (x (doc2f divb2)) 250) :named b-l-2))
   (assert (! (= ,(vw '(doc2f divb2)) 300) :named b-r-2))
   (assert (! (= (y (doc2f divb2)) 115) :named b-t-2))
   (assert (! (= ,(vh '(doc2f divb2)) 100) :named b-b-2))

   #;(assert (! (= (x (doc2f divc2)) 300) :named c-l-2))
   #;(assert (! (= ,(vw '(doc2f divc2)) 200) :named c-r-2))
   #;(assert (! (= (y (doc2f divc2)) 10) :named c-t-2))
   #;(assert (! (= ,(vh '(doc2f divc2)) 90) :named c-b-2))
   
   (declare-const BODY (Element doc2))
   (assert (= BODY (doc2f body2)))

   (declare-const DIV-A (Element doc2))
   (assert (= DIV-A (doc2f diva2)))

   (declare-const DIV-B (Element doc2))
   (assert (= DIV-B (doc2f divb2)))

   (check-sat)
   )))
