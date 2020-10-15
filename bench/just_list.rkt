; FACT(A, B): (>= (- (bottom B) (top A)) 0)
; THEOREM: (>= (- (bottom (last list)) (top (first list))) 0)
; - base: FACT(inductive-base, inductive-base)) ; 3 children (first, base, last)
; - thm: FACT(indcutive-header, inductive-footer) => THEOREM ; 4 children (first, header, footer, last)
; - ind: FACT(indcutive-header, inductive-footer) => FACT(inductive-header, inductive-step) ; 5 children (first, header, footer, step, last)

; base
(define-stylesheet base 
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
(define-fonts base
  [16 "serif" 400 normal 16 0 1.5 1.5 19])
(define-browser base
  :matched true
  :w (between 800 1920)
  :h (between 600 1280)
  :fs (between 16 32)
  :fsm 12
  :scrollw 10
  :component)

(define-document base
 ((html :num 4 :class ())
   ((body :num 5 :class ())
    ((ul :num 0 :class ())
     ((li :num 1 :class ()))
     ((li :num 2 :class ()))
     ((li :num 3 :class ()))))))

(define-layout base (base base)
 ((BLOCK :elt 0 :name list)
  ((BLOCK :elt 1 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?))))
  ((BLOCK :elt 2 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?)) :name inductive-base))
  ;; mystery elements go here
  ((BLOCK :elt 3 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?))))))

(define-problem base
  :title ""
  :url "file:///home/p92/button_test_1.html"
  :sheets base
  :fonts base
  :tests
  (forall () ; base
     (=> (= (floats-tracked ?) 0)
     (let ([inductive-footer inductive-base] [inductive-header inductive-base]) (and (>= (- (bottom inductive-footer) (top inductive-header)) 0) (= (floats-tracked inductive-footer) (floats-tracked inductive-header))))))
  :layouts base
  :features display:list-item empty-text tag:button display:inline-block float:0)

; base2
(define-stylesheet base2 
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
(define-fonts base2
  [16 "serif" 400 normal 16 0 1.5 1.5 19])
(define-browser base2
  :matched true
  :w (between 800 1920)
  :h (between 600 1280)
  :fs (between 16 32)
  :fsm 12
  :scrollw 10
  :component)

(define-document base2
 ((html :num 5 :class ())
   ((body :num 6 :class ())
    ((ul :num 0 :class ())
     ((li :num 1 :class ()))
     ((li :num 2 :class ()))
     ((li :num 3 :class ()))
     ((li :num 4 :class ()))))))

(define-layout base2 (base2 base2)
 ((BLOCK :elt 0 :name list)
  ((BLOCK :elt 1 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?))))
  ((BLOCK :elt 2 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?)) :name inductive-baseA))
  ((BLOCK :elt 3 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?)) :name inductive-baseB :no-next))
  ;; mystery elements go here
  ((BLOCK :elt 4 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?)) :no-prev))))

(define-problem base2
  :title ""
  :url "file:///home/p92/button_test_1.html"
  :sheets base2
  :fonts base2
  :tests
  (forall () ; base2
     (=> (= (floats-tracked ?) 0)
     (let ([inductive-footer inductive-baseB] [inductive-header inductive-baseA]) (and (>= (- (bottom inductive-footer) (top inductive-header)) 0) (= (floats-tracked inductive-footer) (floats-tracked inductive-header))))))
  :layouts base2
  :features display:list-item empty-text tag:button display:inline-block float:0)

; thm
(define-stylesheet thm
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
(define-fonts thm
  [16 "serif" 400 normal 16 0 1.5 1.5 19])
(define-browser thm
  :matched true
  :w (between 800 1920)
  :h (between 600 1280)
  :fs (between 16 32)
  :fsm 12
  :scrollw 10
  :component)

(define-document thm
 ((html :num 5 :class ())
   ((body :num 6 :class ())
    ((ul :num 0 :class ())
     ((li :num 1 :class ()))
     ((li :num 2 :class ()))
     ((li :num 3 :class ()))
     ((li :num 4 :class ()))))))

(define-layout thm (thm thm)
 ((BLOCK :elt 0 :name list :component true) 
  ((BLOCK :elt 1 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?)) :component true))
  ((BLOCK :elt 2 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?)) :component true :name inductive-header :no-next #t))
  ;; mystery elements go her
  ((BLOCK :elt 3 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?)) :component true :name inductive-footer :no-prev #t))
  ((BLOCK :elt 4 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?)) :component true))))


(define-problem thm
  :title ""
  :url "file:///home/p92/button_test_1.html"
  :sheets thm
  :fonts thm
  :tests
   (forall
    ()
    (=>
     (= (floats-tracked ?) 0)
     (and (>= (- (bottom inductive-footer) (top inductive-header)) 0)
          (=
           (floats-tracked inductive-footer)
           (floats-tracked inductive-header)))
     (>= (- (bottom (last list)) (top (first list)) 0))))
  :layouts thm
  :features display:list-item empty-text tag:button display:inline-block float:0)

; ind
(define-stylesheet ind
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
(define-fonts ind
  [16 "serif" 400 normal 16 0 1.5 1.5 19])
(define-browser ind
  :matched true
  :w (between 800 1920)
  :h (between 600 1280)
  :fs (between 16 32)
  :fsm 12
  :scrollw 10
  :component)

(define-document ind
 ((html :num 6 :class ())
   ((body :num 7 :class ())
    ((ul :num 0 :class ())
     ((li :num 1 :class ()))
     ((li :num 2 :class ()))
     ((li :num 3 :class ()))
     ((li :num 4 :class ()))
     ((li :num 5 :class ()))))))

(define-layout ind (ind ind)
 ((BLOCK :elt 0 :name list)
  ((BLOCK :elt 1 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?))))
  ((BLOCK :elt 2 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?)) :name inductive-header :no-next))
  ;; mystery elements go here
  ((BLOCK :elt 3 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?)) :name inductive-footer :no-prev))
  ((BLOCK :elt 4 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?)) :name inductive-step :no-next))
  ((BLOCK :elt 5 :component true :spec (and (> (height ?) 0) (float-flow-skip ?) (non-negative-margins ?)) :no-prev))))


(define-problem ind
  :title ""
  :url "file:///home/p92/button_test_1.html"
  :sheets ind
  :fonts ind
  :tests
   (forall
    ()
    (=>
     (= (floats-tracked ?) 0)
     (and (>= (- (bottom inductive-footer) (top inductive-header)) 0)
          (=
           (floats-tracked inductive-footer)
           (floats-tracked inductive-header)))
        (let ([inductive-footer inductive-step]) (and (>= (- (bottom inductive-footer) (top inductive-header)) 0) (= (floats-tracked inductive-footer) (floats-tracked inductive-header))))))
  :layouts ind
  :features display:list-item empty-text tag:button display:inline-block float:0)
