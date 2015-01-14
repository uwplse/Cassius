#lang racket

(require "solver.rkt")
(z3 "/opt/z3/bin/z3")

(define css-properties
  '([(width) Width]
    [(height) Height]
    [(margin-top margin-bottom margin-left margin-right) Margin]
    [(border-top border-bottom border-left border-right) Border]
    [(padding-top padding-bottom padding-left padding-right) Padding]))
  
(define css-property-pairs
  (for*/list ([category css-properties] [rule-name (car category)])
    `(,rule-name ,(second category))))

(define (print-rules smt-out)
  (printf "\n~a\n\n" smt-out)
  (for ([k+v (in-hash-pairs smt-out)])
    (when (not (eq? (car k+v) 'html))
      (printf "~a {\n" (car k+v))
      (for ([property (map car css-property-pairs)]
            [type (map cadr css-property-pairs)]
            [value (cdr (second (cdr k+v)))])
        (printf "  ~a: ~a;\n" property (print-type type value)))
      (printf "}\n"))))

(define (print-type type value)
  (match type
    [(or 'Width 'Height 'Margin 'Border 'Padding)
     (match value
       [`(as auto ,_) 'auto]
       [`((as length ,_) ,x) (format "~apx" x)]
       [`((as percentage ,_) ,x) (format "~a%" x)])]))

(define (make-element e)
  (let ([re `(rules ,e)])
    (cons
     `(declare-const ,e Element)
     (map (curry list 'assert)
          `((not (is-nil (parent ,e)))
            (not (is-nil ,e))
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
            (=> (is-length (border-left ,re))
                (= (border-l (border-left ,re)) (bl ,e)))
            (=> (is-percentage (border-left (rules ,e)))
                (= (* (border-p (border-left (rules ,e))) (w (parent ,e))) (bl ,e)))
            (=> (is-length (border-right ,re))
                (= (border-l (border-right ,re)) (br ,e)))
            (=> (is-percentage (border-right (rules ,e)))
                (= (* (border-p (border-right (rules ,e))) (w (parent ,e))) (br ,e)))
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
            (> (w ,e) 0)
            ; This isn't true in CSS1; it is only true for "replaced elements"
            #;(=> (is-length (height (rules ,e))) (= (height-l (height (rules ,e))) (w ,e)))
            )))))

(print-rules
(solve
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

   (declare-const html Element)
   (assert (not (is-nil html)))
   (assert (= (x html) 0))
   (assert (= (y html) 0))
   (assert (= (parent html) nil))

   ,@(make-element 'body)
   (assert (= (parent body) html))

   (assert (= (w html) 709))
   (assert (= (h html) 1653)))))
