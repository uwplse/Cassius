#lang racket

(require "solver.rkt")
(z3 "/opt/z3/bin/z3")

(define css-properties
  '([(width) Width]
    [(height) Height]
    [(margin-top margin-bottom margin-left margin-right) Margin]
    [(padding-top padding-bottom padding-left padding-right) Padding]))

(define css-property-pairs
  (for*/list ([category css-properties] [rule-name (car category)])
    `(,rule-name ,(second category))))

(define (print-rules smt-out)
  (for ([k+v (in-hash-pairs smt-out)])
    (when (member (car k+v) (map car (hash-values *rules*)))
      (printf "~a {\n" (cdr (car (memf (λ (x) (eq? (car x) (car k+v))) (hash-values *rules*)))))
      (for ([property (map car css-property-pairs)]
            [type (map cadr css-property-pairs)]
            [value (cdr (cdr k+v))])
        (printf "  ~a: ~a;\n" property (print-type type value)))
      (printf "}\n"))))

(define (print-type type value)
  (match type
    [(or 'Width 'Height 'Margin 'Padding)
     (match value
       [`(as auto ,_) 'auto]
       [`((as length ,_) ,x) (format "~apx" x)]
       [`((as percentage ,_) ,x) (format "~a%" x)])]))

(define *rules* (make-hash))

(define (make-rule elt-name rule-name)
  (let ([symb (string->symbol (symbol->string (gensym 'rule)))])
    (hash-set! *rules* elt-name (cons symb rule-name))
    `((declare-const ,symb Rules))))

(define (make-element e elt-name)
  (let ([re `(rules ,e)])
    (cons
     `(declare-const ,e Element)
     (map (curry list 'assert)
          `((not (is-nil (parent ,e)))
            (not (is-nil ,e))
            (= (rules ,e) ,(car (hash-ref *rules* elt-name (λ () (error "Invalid rule name" elt-name)))))
            (= (+ (ml ,e) (bl ,e) (pl ,e) (w ,e) (pr ,e) (br ,e) (mr ,e)) (w (parent ,e)))
            (=> (is-length (width ,re))
                (= (width-l (width ,re)) (w ,e)))
            (=> (is-percentage (width (rules ,e)))
                (= (* (width-p (width (rules ,e))) (w (parent ,e))) (w ,e)))
            (=> (is-length (padding-left ,re))
                (= (padding-l (padding-left ,re)) (pl ,e)))
            (=> (is-percentage (padding-left (rules ,e)))
                (= (* (padding-p (padding-left (rules ,e))) (w (parent ,e))) (pl ,e)))
            (=> (is-length (padding-right ,re))
                (= (padding-l (padding-right ,re)) (pr ,e)))
            (=> (is-percentage (padding-right (rules ,e)))
                (= (* (padding-p (padding-right (rules ,e))) (w (parent ,e))) (pr ,e)))
            (=> (is-length (margin-left (rules ,e)))
                (= (margin-l (margin-left (rules ,e))) (ml ,e)))
            (=> (is-percentage (margin-left (rules ,e)))
                (= (* (margin-p (margin-left (rules ,e))) (w (parent ,e))) (ml ,e)))
            (=> (and (or (is-auto (width ,re)) (is-auto (margin-left ,re)))
                     (is-length (margin-right (rules ,e))))
                (= (margin-l (margin-right (rules ,e))) (mr ,e)))
            (=> (and (or (is-auto (width ,re)) (is-auto (margin-left ,re)))
                     (is-percentage (margin-right (rules ,e))))
                (= (* (margin-p (margin-right (rules ,e))) (w (parent ,e))) (mr ,e)))
            (=> (and (not (is-auto (width ,re))) (is-auto (margin-left ,re)) (is-auto (margin-right ,re))
)
                (= (mr ,e) (ml ,e)))
            (=> (and (is-auto (width ,re)) (is-auto (margin-left ,re))) (= (ml ,e) 0))
            (=> (and (is-auto (width ,re)) (is-auto (margin-right ,re))) (= (mr ,e) 0))
            (>= (w ,e) 0)
            (= (x ,e) (+ (ml ,e) (pl (parent ,e))))
            ; Banned in CSS2
            (>= (pl ,e) 0)
            (>= (pr ,e) 0)
            (>= (pb ,e) 0)
            (>= (pt ,e) 0)
            ; This isn't true in CSS1; it is only true for "replaced elements"
            #;(=> (is-length (height (rules ,e))) (= (height-l (height (rules ,e))) (w ,e)))
            ; TODO : Add back borders
            (= (bl ,e) 0)
            (= (br ,e) 0)
            (= (bt ,e) 0)
            (= (bb ,e) 0))))))

(define (make-preamble)
  `((declare-datatypes ()
      ((Width   auto (length (width-l Real)) (percentage (width-p Real)))
      (Height  auto (length (height-l Real)) (percentage (height-p Real)))
      (Margin  auto (length (margin-l Real)) (percentage (margin-p Real)))
      (Border  (length (border-l Real)) (percentage (border-p Real)))
      (Padding (length (padding-l Real)) (percentage (padding-p Real)))))

    (declare-datatypes ()
      ((Rules (rules ,@css-property-pairs))))

    (declare-datatypes ()
      ((Element
        nil
        (element (rules Rules) (parent Element)
                 (x Real) (y Real) (w Real) (h Real)
                 (mt Real) (mb Real) (ml Real) (mr Real)
                 (bt Real) (bb Real) (bl Real) (br Real)
                 (pt Real) (pb Real) (pl Real) (pr Real)))))

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
(solve #:debug #f
 `(,@(make-preamble)
   ,@(make-rule 'body 'body)

   ,@(make-html 'html1)

   ,@(make-element 'body1 'body)
   (assert (= (parent body1) html1))

   (assert (= (w html1) 600))
   (assert (= (h html1) 400))

   (assert (= (x body1) 100))
   (assert (= (x- body1) 500))

   ,@(make-html 'html2)

   ,@(make-element 'body2 'body)
   (assert (= (parent body2) html2))

   (assert (= (w html2) 800))
   (assert (= (h html2) 400))

   (assert (= (x body2) 200))
   (assert (= (x- body2) 600)))))
