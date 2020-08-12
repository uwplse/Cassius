(define-stylesheet just_list
   ((tag html) (display block))
   ((tag body) (display block))
   ((tag ul) (display block))
   ((tag li) (display list-item))
   ((tag body)
    :browser
    (margin-top (px 8))
    (margin-right (px 8))
    (margin-bottom (px 8))
    (margin-left (px 8)))
   ((tag ul)
    :browser
    (margin-top (em 1))
    (margin-bottom (em 1))
    (padding-left (px 40))))
(define-fonts just_list
  [16 "serif" 400 normal 16 0 1.5 1.5 19])
(define-browser just_list
  :matched true
  :w (between 800 1920)
  :h (between 600 1280)
  :fs (between 16 32)
  :fsm 12
  :scrollw 10
  :component)
(define-document just_list
((html :num 4 :class ())
  ((body :num 5 :class ())
   ((ul :num 0 :class ())
    ((li :num 1 :class ()))
    ((li :num 2 :class ()))
    ((li :num 3 :class ()))))))
(define-layout just_list (just_list just_list)
 ((BLOCK :elt 0 :name list)
  ((BLOCK :elt 1 :component true :spec))
  ((BLOCK :elt 2 :component true :spec))
  ((BLOCK :elt 3 :component true :spec))))
(define-problem just_list
  :title ""
  :url "file:///home/p92/button_test_1.html"
  :sheets just_list
  :fonts just_list
  :tests (forall
   ()
   (=>
    (=>
     (or (= (prev list) null) (non-negative-margins (prev list)))
     (non-negative-margins list))))
  (forall
   (b)
   (=>
    (=>
     (onscreen ?)
     (=> (or (is-component b) (is-interactive b)) (onscreen b)))))
  :layouts just_list
  :features display:list-item empty-text tag:button display:inline-block float:0)
