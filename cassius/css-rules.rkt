#lang racket
(require "z3.rkt")

(provide css-types css-rule-type html-tag-type math-utilities css-property-pairs)

(define css-types
  (list
   `(declare-datatypes ()
      ((Width   auto (length (width-l Real)) (percentage (width-p Real)))
       (Height  auto (length (height-l Real)))
       (Margin  auto (length (margin-l Real)) (percentage (margin-p Real)))
       (Border  (length (border-l Real)) (percentage (border-p Real)))
       (Padding (length (padding-l Real)) (percentage (padding-p Real)))))
   `(define-sort Color () (_ BitVec 24))))

(define css-properties
  '([Width    width]
    [Height   height]
    [Margin   margin-top margin-bottom margin-left margin-right]
    [Padding  padding-top padding-bottom padding-left padding-right]
    [Color    color background-color]))

(define css-property-pairs
  (for*/list ([type css-properties] [prop (cdr type)])
    (cons prop (car type))))

(define css-rule-type
  `(declare-datatypes ()
     ((Rules (rules ,@(for*/list ([cat css-properties] [rule (cdr cat)])
                        `(,rule ,(car cat))))))))

(define html-tag-type
  `(declare-datatypes () ((TagNames <HTML> <BODY> <DIV>))))

(define math-utilities
  (list `(define-fun max ((x Real) (y Real)) Real
           (ite (< x y) y x))
        `(define-fun min ((x Real) (y Real)) Real
           (ite (< x y) x y))))
