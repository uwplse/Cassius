
(define-document test
  ([html]
   ([body]
    ([header]
     ([h1] "Title")
     ([h2] "Subtitle"))
    ([nav]
     ([img])
     ([ul :id other-pages]
      ([li] "First")
      ([li] "Second")
      ([li] "Third")
      ([li] "Fourth")
      ([li] "Fifth"))
     ([ul :id about-site]
      ([li] "About the author")
      ([li] "Some other page")
      ([li] "Contact someone")))
    ([div :class posts]
     ([article]
      ([h1] "foo")
      ([p]))
     ([article]
      ([h1] "bar")
      ([p]))))))

(define-layout (test :browser firefox)
  ([VIEW :w 800 :h 1000]
   ([BLOCK :w 800 :h 950 :x 0 :y 0]
    ([BLOCK :w 800 :h 950 :x 0 :y 0]
     ([BLOCK :w 800 :h 150 :x 0 :y 0]
      ([BLOCK :w 800 :h 64 :x 0 :y 16]
       ([LINE :w 800 :h 64 :x 0 :y 16]
        ([TEXT :w 200 :h 64 :x 300 :y 16])))
      ([BLOCK :w 800 :h 36 :x 0 :y 98]
       ([LINE :w 800 :h 36 :x 0 :y 98]
        ([TEXT :w 300 :h 36 :x 250 :y 98]))))
     ([BLOCK :w 200 :h 600 :x 0 :y 150]
      ([BLOCK :w 100 :h 100 :x 50 :y 190])
      ([BLOCK :w 180 :h 250 :x 10 :y 330]
       ([BLOCK :w 180 :h 50 :x 10 :y 330])
       ([BLOCK :w 180 :h 50 :x 10 :y 380])
       ([BLOCK :w 180 :h 50 :x 10 :y 430])
       ([BLOCK :w 180 :h 50 :x 10 :y 480])
       ([BLOCK :w 180 :h 50 :x 10 :y 530]))
      ([BLOCK :w 180 :h 150 :x 10 :y 590]
       ([BLOCK :w 180 :h 50 :x 10 :y 590])
       ([BLOCK :w 180 :h 50 :x 10 :y 640])
       ([BLOCK :w 180 :h 50 :x 10 :y 690])))
     ([BLOCK :w 800 :h 800 :x 0 :y 150]
      ([BLOCK :w 500 :h 300 :x 250 :y 200]
       ([BLOCK :w 500 :h 50 :x 250 :y 200]
        ([LINE :w 500 :h 50 :x 250 :y 200]
         ([TEXT :w 500 :h 50 :x 250 :y 200])))
       ([BLOCK :w 500 :h 250 :x 250 :y 250]
        ([LINE :w 500 :h 250 :x 250 :y 250]
         ([TEXT :w 500 :h 250 :x 250 :y 250]))))
      ([BLOCK :w 500 :h 400 :x 250 :y 550]
       ([BLOCK :w 500 :h 50 :x 250 :y 550]
        ([LINE :w 500 :h 50 :x 250 :y 550]
         ([TEXT :w 500 :h 50 :x 250 :y 550])))
       ([BLOCK :w 500 :h 350 :x 250 :y 600]
        ([LINE :w 500 :h 350 :x 250 :y 600]
         ([TEXT :w 500 :h 350 :x 250 :y 600])))))))))

(define-stylesheet test
  ((tag body) ?)
  ((tag header) ?)
  ((tag h1) ?)
  ((tag h2) ?)
  ((tag nav) ?)
  ((desc (tag nav) (tag img)) ?)
  ((desc (tag nav) (tag ul)) ?)
  ((desc (tag nav) (tag ul) (tag li)) ?)
  ((class posts) ?)
  ((desc (class posts) (tag article)) ?)
  ((desc (tag article) (tag h1)) ?)
  ((desc (tag article) (tag p)) ?))

(define-problem test
  :title "Test web page"
  :sheets test
  :documents test
  :layouts test)
