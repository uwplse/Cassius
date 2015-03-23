#lang racket
(require "z3.rkt")

(provide css-types math-utilities css-properties css-property-pairs css-is-applicable
         css-score-ops css-rule-types css-enabled-variable css-score-variable
         variable-append css-shorthand-properties)

(define css-types
  (list
   `(declare-datatypes ()
      ((Width   auto (length (width-l Real)) (percentage (width-p Real)))
       (Height  auto (length (height-l Real)))
       (Margin  auto (length (margin-l Real)) (percentage (margin-p Real)))
       #;(Border  (length (border-l Real)) (percentage (border-p Real)))
       (Padding (length (padding-l Real)) (percentage (padding-p Real)))
       (Color   transparent (color (color-c (_ BitVec 24))))
       (TagNames <HTML> <BODY> <DIV> <H1> <P> <PRE> <svg>)
       (Selector all (tag (tag-s TagNames)))
       (ImportanceOrigin UserAgent UserNormal AuthorNormal AuthorImportant UserImportant)
       (CascadeScore (cascadeScore (precedence ImportanceOrigin) (isFromStyle Bool)
                                   (idNum Int) (classNum Int) (elementNum Int)
                                   (positionNum Int)))))))

(define css-properties
  '([Width    width]
    [Height   height]
    [Margin   margin-top margin-bottom margin-left margin-right]
    [Padding  padding-top padding-bottom padding-left padding-right]
    #;[Border   border-top border-bottom border-left border-right]
    [Color    color background-color]))

(define (css-is-applicable sel elt)
  `(ite (is-all ,sel)
        true
   (ite (is-tag ,sel)
        (= (tag-s ,sel) (tagname ,elt))
   ; else
        false)))

(define css-score-ops
  (let ([sel `(selector rule)] [idx `(index rule)])
    `((define-fun score ((rule SpecifiedRule)) CascadeScore
       (ite (is-all ,sel)
            ; The last entry should be 0, but it is 1 since we write `html *`
            (cascadeScore AuthorNormal false 0 0 1 ,idx)
            (cascadeScore AuthorNormal false 0 0 1 ,idx)))

      (define-fun importanceOrigin-score ((io ImportanceOrigin)) Int
        (ite (is-UserAgent io)       0
        (ite (is-UserNormal io)      1
        (ite (is-AuthorNormal io)    2
        (ite (is-AuthorImportant io) 3
        #;else                       4)))))

      (define-fun score-ge ((a CascadeScore) (b CascadeScore)) Bool
        (or (> (importanceOrigin-score (precedence a)) (importanceOrigin-score (precedence b)))
        (and (= (importanceOrigin-score (precedence a)) (importanceOrigin-score (precedence b)))
             (or (and (isFromStyle a) (not (isFromStyle b)))
             (and (= (isFromStyle a) (isFromStyle b))
                  (or (> (idNum a) (idNum b))
                  (and (= (idNum a) (idNum b))
                       (or (> (classNum a) (classNum b))
                       (and (= (classNum a) (classNum b))
                            (or (> (elementNum a) (elementNum b))
                            (and (= (elementNum a) (elementNum b))
                                 (>= (positionNum a) (positionNum b))))))))))))))))

(define css-property-pairs
  (for*/list ([type css-properties] [prop (cdr type)])
    (cons prop (car type))))

(define (variable-append var end)
  (string->symbol (string-append (symbol->string var) "-" (symbol->string end))))
(define css-score-variable (curryr variable-append 'score))
(define css-enabled-variable (curryr variable-append 'enabled))

(define css-rule-types
  `(declare-datatypes ()
     ((ComputedRule
       (computedRules
        ,@(apply append
                 (for*/list ([cat css-properties] [property (cdr cat)])
                   `((,property ,(car cat))
                     (,(css-score-variable property) CascadeScore))))))
      (SpecifiedRule
       (specifiedRules
        (selector Selector)
        (index Int)
        ,@(apply append
                 (for*/list ([cat css-properties] [property (cdr cat)])
                   `((,(variable-append property 'specified) ,(car cat))
                     (,(css-enabled-variable property) Bool)))))))))

(define math-utilities
  (list `(define-fun max ((x Real) (y Real)) Real
           (ite (< x y) y x))
        `(define-fun min ((x Real) (y Real)) Real
           (ite (< x y) x y))))

(define css-shorthand-properties
  '((margin margin-top margin-right margin-bottom margin-left)
    (padding padding-top padding-right padding-bottom padding-left)
    #;(border border-top border-right border-bottom border-left)))
