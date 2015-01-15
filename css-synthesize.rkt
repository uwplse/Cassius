#lang racket

(require "solver.rkt")
(z3 "/opt/z3/bin/z3")

(define css-properties
  '([(width) Width]
    [(height) Height]
    [(margin-top margin-bottom margin-left margin-right) Margin]
    [(padding-top padding-bottom padding-left padding-right) Padding]
    [(background-color color) Color]))

(define css-property-pairs
  (for*/list ([category css-properties] [rule-name (car category)])
    `(,rule-name ,(second category))))

(define (r2 x)
  (/ (round (* 10 x)) 10))

(define (print-rules smt-out)
  (with-output-to-file "test.css" #:exists 'replace
    (lambda ()
      (eprintf "\n")
      (for ([k+v (in-hash-pairs smt-out)])
        (when (and (list? (cdr k+v)) (or (eq? (cadr k+v) 'element) (eq? (cadr k+v) 'let)))
          (let ([elt (if (eq? (cadr k+v) 'element) (cddr k+v) (cdr (cadddr k+v)))])
            (match elt
              [`(,tag ,rules ,previous ,parent ,first-child ,fgc ,bgc ,x ,y ,w ,h
                      ,mt ,mb ,ml ,mr ,bt ,bb ,bl ,br ,pt ,pb ,pl ,pr)
               (eprintf "~a (~a) ~a×~a at (~a, ~a)\n" (car k+v) tag (r2 w) (r2 h) (r2 y) (r2 x))
               (eprintf "margin:  ~a ~a ~a ~a\n" (r2 mt) (r2 mr) (r2 mb) (r2 ml))
               (eprintf "border:  ~a ~a ~a ~a\n" (r2 bt) (r2 br) (r2 bb) (r2 bl))
               (eprintf "padding: ~a ~a ~a ~a\n\n" (r2 pt) (r2 pr) (r2 pb) (r2 pl))])))
        (when (member (car k+v) (map car (hash-values *rules*)))
          (printf "~a {\n" (cdr (car (memf (λ (x) (eq? (car x) (car k+v))) (hash-values *rules*)))))
          (for ([property (map car css-property-pairs)]
                [type (map cadr css-property-pairs)]
                [value (cdr (cdr k+v))])
            (printf "  ~a: ~a;\n" property (print-type type value)))
          (printf "}\n"))))))

(define (print-type type value)
  (match type
    [(or 'Width 'Height 'Margin 'Padding)
     (match value
       [`(as auto ,_) 'auto]
       [`((as length ,_) ,x) (format "~apx" x)]
       [`((as percentage ,_) ,x) (format "~a%" (* 100 x))])]
    ['Color
     (string-append "#" (~a (format "~x" value) #:width 6 #:align 'right #:pad-string "0"))]))

(define *rules* (make-hash))

(define (make-rule elt-name rule-name)
  (let ([symb (string->symbol (symbol->string (gensym 'rule)))])
    (hash-set! *rules* elt-name (cons symb rule-name))
    `((declare-const ,symb Rules))))

(define (make-element tag-name e rule-name)
  (let ([re `(rules ,e)])
    (cons
     `(declare-const ,e Element)
     (map (curry list 'assert)
          `((not (is-nil (parent ,e)))
            (not (is-nil ,e))
            (= ,re ,(car (hash-ref *rules* rule-name (λ () (error "Invalid rule name" rule-name)))))
            (= (tagname ,e) ,tag-name)
            (=> (is-length (width ,re))
                (= (width-l (width ,re)) (w ,e)))
            (=> (is-percentage (width ,re))
                (= (* (width-p (width ,re)) (w (parent ,e))) (w ,e)))
            (=> (is-length (height ,re))
                (= (height-l (height ,re)) (h ,e)))
            ; TODO : Figure out what height:auto actually means
            (not (is-auto (height ,re)))

            (=> (is-length (padding-top ,re))
                (= (padding-l (padding-top ,re)) (pt ,e)))
            (=> (is-percentage (padding-top ,re))
                (= (* (padding-p (padding-top ,re)) (w (parent ,e))) (pt ,e)))
            (=> (is-length (padding-right ,re))
                (= (padding-l (padding-right ,re)) (pr ,e)))
            (=> (is-percentage (padding-right ,re))
                (= (* (padding-p (padding-right ,re)) (w (parent ,e))) (pr ,e)))
            (=> (is-length (padding-bottom ,re))
                (= (padding-l (padding-bottom ,re)) (pb ,e)))
            (=> (is-percentage (padding-bottom ,re))
                (= (* (padding-p (padding-bottom ,re)) (w (parent ,e))) (pb ,e)))
            (=> (is-length (padding-left ,re))
                (= (padding-l (padding-left ,re)) (pl ,e)))
            (=> (is-percentage (padding-left ,re))
                (= (* (padding-p (padding-left ,re)) (w (parent ,e))) (pl ,e)))

            (=> (is-length (margin-top ,re))
                (= (margin-l (margin-top ,re)) (mt ,e)))
            (=> (is-percentage (margin-top ,re))
                (= (* (margin-p (margin-top ,re)) (w (parent ,e))) (mt ,e)))
            (=> (is-auto (margin-top ,re)) (= (mt ,e) 0)) ; This is a guess

            ; These are the horrid rules for the right-margin
            ; TODO: These are the CSS1 rules, which are different from the CSS2 rules
            (=> (and (or (is-auto (width ,re)) (is-auto (margin-left ,re)))
                     (is-length (margin-right ,re)))
                (= (margin-l (margin-right ,re)) (mr ,e)))
            (=> (and (or (is-auto (width ,re)) (is-auto (margin-left ,re)))
                     (is-percentage (margin-right ,re)))
                (= (* (margin-p (margin-right ,re)) (w (parent ,e))) (mr ,e)))
            (=> (and (not (is-auto (width ,re)))
                     (is-auto (margin-left ,re)) (is-auto (margin-right ,re)))
                (= (mr ,e) (ml ,e)))
            (=> (and (is-auto (width ,re)) (is-auto (margin-right ,re))) (= (mr ,e) 0))

            (=> (is-length (margin-bottom ,re))
                (= (margin-l (margin-bottom ,re)) (mb ,e)))
            (=> (is-percentage (margin-bottom ,re))
                (= (* (margin-p (margin-bottom ,re)) (w (parent ,e))) (mb ,e)))
            (=> (is-auto (margin-bottom ,re)) (= (mb ,e) 0)) ; This is a guess
            (=> (is-length (margin-left ,re))
                (= (margin-l (margin-left ,re)) (ml ,e)))
            (=> (is-percentage (margin-left ,re))
                (= (* (margin-p (margin-left ,re)) (w (parent ,e))) (ml ,e)))
            (=> (and (is-auto (width ,re)) (is-auto (margin-left ,re))) (= (ml ,e) 0))

            (= (x ,e) (+ (x (parent ,e)) (pl (parent ,e)) (ml ,e)))
            (= (y ,e)
               (ite (= (previous ,e) nil)
                    (+ (mt ,e) (pt (parent ,e)) (y (parent ,e)))
                    (+ (pt (parent ,e)) (y (parent ,e))
                       ; Position of previous element
                       (y (previous ,e)) (pt (previous ,e)) (h (previous ,e))  (pb (previous ,e))
                       ; Gap due to the margins
                       (ite (>= (mb (previous ,e)) 0)
                            (ite (>= (mt ,e) 0)
                                 (max (mb (previous ,e)) (mt ,e))
                                 (+ (mb (previous ,e)) (mt ,e)))
                            (ite (>= (mt ,e) 0)
                                 (+ (mb (previous ,e)) (mt ,e))
                                 (min (mb (previous ,e)) (mt ,e)))))))
            (= (+ (ml ,e) (bl ,e) (pl ,e) (w ,e) (pr ,e) (br ,e) (mr ,e)) (w (parent ,e)))
            (>= (w ,e) 0)
            (>= (h ,e) 0)
            (>= (pl ,e) 0)
            (>= (pr ,e) 0)
            (>= (pb ,e) 0)
            (>= (pt ,e) 0)
            (= (bgc ,e) (background-color ,re))
            (= (fgc ,e) (color ,re))
            ; This isn't true in CSS1; it is only true for "replaced elements"
            #;(=> (is-length (height ,re)) (= (height-l (height ,re)) (h ,e)))
            ; TODO : Add back borders
            (= (bl ,e) 0)
            (= (br ,e) 0)
            (= (bt ,e) 0)
            (= (bb ,e) 0))))))

(define (make-preamble)
  `((declare-datatypes ()
      ((Width   auto (length (width-l Real)) (percentage (width-p Real)))
       (Height  auto (length (height-l Real)))
       (Margin  auto (length (margin-l Real)) (percentage (margin-p Real)))
       (Border  (length (border-l Real)) (percentage (border-p Real)))
       (Padding (length (padding-l Real)) (percentage (padding-p Real)))))

    (declare-datatypes ()
      ((TagNames tag-HTML tag-BODY tag-DIV)))

    (define-sort Color () (_ BitVec 24))

    (declare-datatypes ()
      ((Rules (rules ,@css-property-pairs))))

    (declare-datatypes ()
      ((Element
        nil
        (element (tagname TagNames) (rules Rules)
                 (previous Element) (parent Element)
                 (bgc Color) (fgc Color)
                 (x Real) (y Real) (w Real) (h Real)
                 (mt Real) (mb Real) (ml Real) (mr Real)
                 (bt Real) (bb Real) (bl Real) (br Real)
                 (pt Real) (pb Real) (pl Real) (pr Real)))))

    (define-fun max ((x Real) (y Real)) Real
      (ite (< x y) y x))

    (define-fun min ((x Real) (y Real)) Real
      (ite (< x y) x y))

    (define-fun x- ((e Element)) Real
      (+ (x e) (pl e) (w e) (pr e)))

    (define-fun y- ((e Element)) Real
      (+ (y e) (pt e) (h e) (pb e)))))

(define (make-html name)
  `((declare-const ,name Element)
    (assert (not (is-nil ,name)))
    (assert (= (x ,name) 0))
    (assert (= (y ,name) 0))
    (assert (= (parent ,name) nil))
    (assert (= (tagname ,name) tag-HTML))
    (assert (= (previous ,name) nil))
    (assert (= (pl ,name) 0))
    (assert (= (pr ,name) 0))
    (assert (= (pt ,name) 0))
    (assert (= (pb ,name) 0))
    (assert (= (bl ,name) 0))
    (assert (= (br ,name) 0))
    (assert (= (bt ,name) 0))
    (assert (= (bb ,name) 0))
    (assert (= (ml ,name) 0))
    (assert (= (mr ,name) 0))
    (assert (= (mt ,name) 0))
    (assert (= (mb ,name) 0))))

(print-rules
(solve #:model #t
 `(,@(make-preamble)
   ,@(make-rule 'body 'body)
   ,@(make-rule 'diva '|div:nth-child(1)|)
   ;,@(make-rule 'divb '|div:nth-child(2)|)

   ,@(make-html 'html1)
   ,@(make-element 'tag-BODY 'body1 'body)
   ,@(make-element 'tag-DIV 'diva1 'diva)
   ;,@(make-element 'tag-DIV 'divb1 'divb)
   (assert (= (parent body1) html1))
   (assert (= (previous body1) nil))
   (assert (= (parent diva1) body1))
   (assert (= (previous diva1) nil))
   ;(assert (= (parent divb1) body1))

   (assert (= (w html1) 600))
   (assert (= (h html1) 400))

   (assert (= (x body1) 100))
   (assert (= (x- body1) 500))
   (assert (= (y body1) 0))
   (assert (= (y- body1) 400))
   (assert (= (bgc body1) |#xff0000|))

   (assert (= (x diva1) 150))
   (assert (= (x- diva1) 450))
   (assert (= (y diva1) 5))
   (assert (= (y- diva1) 395))
   (assert (= (bgc diva1) |#x00ff00|))

   ;(assert (= (x divb1) 250))
   ;(assert (= (x- divb1) 350))
   ;(assert (= (bgc divb1) |#x0000ff|))

   ,@(make-html 'html2)
   ,@(make-element 'tag-BODY 'body2 'body)
   ,@(make-element 'tag-DIV 'diva2 'diva)
   ;,@(make-element 'tag-DIV 'divb2 'divb)
   (assert (= (parent body2) html2))
   (assert (= (previous body2) nil))
   (assert (= (parent diva2) body2))
   (assert (= (previous diva2) nil))
   ;(assert (= (parent divb2) body2))

   (assert (= (w html2) 800))
   (assert (= (h html2) 400))

   (assert (= (x body2) 200))
   (assert (= (x- body2) 600))
   (assert (= (y body1) 0))
   (assert (= (y- body1) 400))
   (assert (= (bgc body2) |#xff0000|))

   (assert (= (x diva2) 250))
   (assert (= (x- diva2) 550))
   (assert (= (y diva1) 5))
   (assert (= (y- diva1) 395))
   (assert (= (bgc diva2) |#x00ff00|))

   ;(assert (= (x divb2) 350))
   ;(assert (= (x- divb2) 450))
   ;(assert (= (bgc divb2) |#x0000ff|))
   )))
