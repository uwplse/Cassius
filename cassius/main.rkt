#lang racket
(require "z3.rkt")
(require "css-rules.rkt")
(z3 "/opt/z3/bin/z3")

(provide print-rules solve make-preamble make-rule make-dom vw vh)

(define (r2 x)
  (/ (round (* 100 x)) 100))

(define (print-rules smt-out)
  (with-output-to-file "test.css" #:exists 'replace
    (lambda ()
      (eprintf "\n")
      (for ([k+v (in-hash-pairs smt-out)])
        (when (and (list? (cdr k+v)) (or (eq? (cadr k+v) 'element) (eq? (cadr k+v) 'let)))
          (let ([elt (if (eq? (cadr k+v) 'element) (cddr k+v) (cdr (cadddr k+v)))])
            (match elt
              [`(,tag ,rules ,previous ,parent ,first-child ,fgc ,bgc ,x ,y ,w ,h
                      ,mt ,mb ,ml ,mr ,mtp ,mtn ,mbp ,mbn ,_ ,bt ,bb ,bl ,br ,pt ,pb ,pl ,pr)
               (eprintf "~a (~a) ~a×~a at (~a, ~a)\n" tag (car k+v) (r2 (+ pl pr w)) (r2 (+ pt pb h)) (r2 y) (r2 x))
               (eprintf "margin:  ~a (+~a-~a) ~a ~a (+~a-~a) ~a\n"
                        (r2 mt) (r2 mtp) (r2 (abs mtn)) (r2 mr)
                        (r2 mb) (r2 mbp) (r2 (abs mbn)) (r2 ml))
               (eprintf "border:  ~a ~a ~a ~a\n" (r2 bt) (r2 br) (r2 bb) (r2 bl))
               (eprintf "padding: ~a ~a ~a ~a\n\n" (r2 pt) (r2 pr) (r2 pb) (r2 pl))])))
        (when (member (car k+v) (map car (hash-values *rules*)))
          (printf "~a {\n" (cdr (car (memf (λ (x) (eq? (car x) (car k+v))) (hash-values *rules*)))))
          (for ([property (map car css-property-pairs)]
                [type (map cdr css-property-pairs)]
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

(define (make-element type map-name tag-name e-name rule-name)
  (let* ([e `(,map-name ,e-name)]
         [re `(rules ,e)]
         [pe `(,map-name (parent ,e))]
         [le `(,map-name (previous ,e))]
         [fe `(,map-name (first-child ,e))])
    (map (curry list 'assert)
          `((not (is-nil ,pe))
            (not (is-nil ,e))
            (not (is-html ,e))
            (= ,re ,(car (hash-ref *rules* rule-name (λ () (error "Invalid rule name" rule-name)))))
            (= (tagname ,e) ,tag-name)
            (=> (is-length (width ,re))
                (= (width-l (width ,re)) (w ,e)))
            (not (is-percentage (width ,re)))
            #;(=> (is-percentage (width ,re))
                (= (* (width-p (width ,re)) (w ,pe)) (w ,e)))
            (=> (is-length (height ,re))
                (= (height-l (height ,re)) (h ,e)))
            ; TODO : Figure out what height:auto actually means
            (not (is-auto (height ,re)))

            (=> (is-length (padding-top ,re))
                (= (padding-l (padding-top ,re)) (pt ,e)))
            (not (is-percentage (padding-top ,re)))
            #;(=> (is-percentage (padding-top ,re))
                (= (* (padding-p (padding-top ,re)) (w ,pe)) (pt ,e)))
            (not (is-percentage (padding-right ,re)))
            (=> (is-length (padding-right ,re))
                (= (padding-l (padding-right ,re)) (pr ,e)))
            (=> (is-percentage (padding-right ,re))
                (= (* (padding-p (padding-right ,re)) (w ,pe)) (pr ,e)))
            (not (is-percentage (padding-bottom ,re)))
            (=> (is-length (padding-bottom ,re))
                (= (padding-l (padding-bottom ,re)) (pb ,e)))
            #;(=> (is-percentage (padding-bottom ,re))
                (= (* (padding-p (padding-bottom ,re)) (w ,pe)) (pb ,e)))
            (not (is-percentage (padding-left ,re)))
            (=> (is-length (padding-left ,re))
                (= (padding-l (padding-left ,re)) (pl ,e)))
            #;(=> (is-percentage (padding-left ,re))
                (= (* (padding-p (padding-left ,re)) (w ,pe)) (pl ,e)))

            (not (is-percentage (margin-top ,re)))
            (=> (is-length (margin-top ,re))
                (= (margin-l (margin-top ,re)) (mt ,e)))
            #;(=> (is-percentage (margin-top ,re))
                (= (* (margin-p (margin-top ,re)) (w ,pe)) (mt ,e)))
            (=> (is-auto (margin-top ,re)) (= (mt ,e) 0.0))

            ; These are the horrid rules for the right-margin; see CSS2 §10.3.3
            (= (+ (ml ,e) (bl ,e) (pl ,e) (w ,e) (pr ,e) (br ,e) (mr ,e)) (w ,pe))
            ; TODO: If the 'direction' property of the containing block has the value
            ; 'ltr', the specified value of 'margin-right' is ignored and the
            ; value is calculated so as to make the equality true. If the value of
            ; 'direction' is 'rtl', this happens to 'margin-left' instead.
            (=> (and (not (is-auto (width ,re)))
                     (> (+ (bl ,e) (pl ,e) (w ,e) (pr ,e) (br ,e)
                           (ite (not (is-auto (margin-left ,re)))
                                (ite (is-length (margin-left ,re))
                                     (margin-l (margin-left ,re))
                                     (* (margin-p (margin-left ,re)) (w ,pe)))
                                0.0)
                           (ite (not (is-auto (margin-right ,re)))
                                (ite (is-length (margin-right ,re))
                                     (margin-l (margin-right ,re))
                                     (* (margin-p (margin-right ,re)) (w ,pe)))
                                0.0))
                        (w ,pe)))
                (and
                 (=> (is-auto (margin-right ,re)) (= 0.0 (mr ,e)))
                 (=> (is-auto (margin-left ,re)) (= 0.0 (ml ,e)))))
            (=> (and (is-auto (width ,re)) (is-auto (margin-left ,re))) (= (ml ,e) 0.0))
            (=> (and (is-auto (width ,re)) (is-auto (margin-right ,re))) (= (mr ,e) 0.0))
            (=> (and (is-auto (margin-left ,re)) (is-auto (margin-right ,re)))
                (= (mr ,e) (ml ,e)))

            (not (is-percentage (margin-right ,re)))
            (=> (is-length (margin-right ,re)) (= (margin-l (margin-right ,re)) (mr ,e)))
            #;(=> (is-percentage (margin-right ,re)) (= (* (margin-p (margin-right ,re)) (w ,pe)) (mr ,e)))

            (not (is-percentage (margin-bottom ,re)))
            (=> (is-length (margin-bottom ,re))
                (= (margin-l (margin-bottom ,re)) (mb ,e)))
            #;(=> (is-percentage (margin-bottom ,re))
                (= (* (margin-p (margin-bottom ,re)) (w ,pe)) (mb ,e)))
            (=> (is-auto (margin-bottom ,re)) (= (mb ,e) 0.0))

            (not (is-percentage (margin-left ,re)))
            (=> (is-length (margin-left ,re))
                (= (margin-l (margin-left ,re)) (ml ,e)))
            #;(=> (is-percentage (margin-left ,re))
                (= (* (margin-p (margin-left ,re)) (w ,pe)) (ml ,e)))
            (=> (and (is-auto (width ,re)) (is-auto (margin-left ,re))) (= (ml ,e) 0.0))

            (= (x ,e) (+ (x ,pe) (pl ,pe) (ml ,e)))

            (=> (not (is-nil ,fe))
                (and
                 (= (mtp ,e) (max (ite (> (mt ,e) 0.0) (mt ,e) 0.0)
                                  (ite (and (= (pt ,e) 0.0) (= (bt ,e) 0.0)) (mtp ,fe) 0.0)))
                 (= (mtn ,e) (min (ite (< (mt ,e) 0.0) (mt ,e) 0.0)
                                  (ite (and (= (pt ,e) 0.0) (= (bt ,e) 0.0)) (mtn ,fe) 0.0)))))
            (=> (is-nil ,fe)
                (and
                 (= (mtp ,e) (ite (> (mt ,e) 0.0) (mt ,e) 0.0))
                 (= (mtn ,e) (ite (< (mt ,e) 0.0) (mt ,e) 0.0))))

            (=> (not (is-nil ,fe))
                (and
                 (= (mbp ,e) (max (ite (> (mb ,e) 0.0) (mb ,e) 0.0)
                                  (ite (and (= (pb ,e) 0.0) (= (bb ,e) 0.0)) (mbp ,fe) 0.0)))
                 (= (mbn ,e) (min (ite (< (mb ,e) 0.0) (mb ,e) 0)
                                  (ite (and (= (pb ,e) 0.0) (= (bb ,e) 0.0)) (mbn ,fe) 0.0)))))
            (=> (is-nil ,fe)
                (and
                 (= (mbp ,e) (ite (> (mb ,e) 0) (mb ,e) 0))
                 (= (mbn ,e) (ite (< (mb ,e) 0) (mb ,e) 0))))

            (= (y ,e)
               (ite (is-nil ,le)
                    (ite (and (not (is-html ,pe)) (= (pt ,pe) 0.0) (= (bt ,pe) 0.0))
                         (y ,pe) ; Margins collapse if the borders and padding are zero.
                         (+ (mtp ,e) (mtn ,e) (pt ,pe) (y ,pe)))
                    (+ (y ,le) (pt ,le) (h ,le)  (pb ,le)
                       (+ (max (mbp ,le) (mtp ,e)) (min (mbn ,le) (mtn ,le))))))

            (>= (w ,e) 0.0)
            (>= (h ,e) 0.0)
            (>= (pl ,e) 0.0)
            (>= (pr ,e) 0.0)
            (>= (pb ,e) 0.0)
            (>= (pt ,e) 0.0)
            (= (bgc ,e) (background-color ,re))
            (= (fgc ,e) (color ,re))

            ; TODO : Add back borders
            (= (bl ,e) 0)
            (= (br ,e) 0)
            (= (bt ,e) 0)
            (= (bb ,e) 0)))))

(define (make-preamble)
  `((set-option :produce-unsat-cores true)
    ,@css-types
    ,html-tag-type
    ,css-rule-type
    ,@math-utilities

    (declare-datatypes (T)
      ((Element
        nil
        (element (tagname TagNames) (rules Rules)
                 ; The DOM tree pointers
                 (previous T) (parent T) (first-child T)
                 ; Foreground and Background Colors
                 (bgc Color) (fgc Color)
                 ; X Y position, width and height
                 (x Real) (y Real) (w Real) (h Real)
                 ; Margins
                 (mt Real) (mb Real) (ml Real) (mr Real)
                 ; Collecting the most-negative and most-positive margins
                 (mtp Real) (mtn Real) (mbp Real) (mbn Real) (is-html Bool)
                 ; Borders
                 (bt Real) (bb Real) (bl Real) (br Real)
                 ; Padding
                 (pt Real) (pb Real) (pl Real) (pr Real)))))))

(define (vw e) `(+ (pl ,e) (w ,e) (pr ,e)))
(define (vh e) `(+ (pt ,e) (h ,e) (pb ,e)))

(define (make-html name map-name type-name)
  (define elt `(,map-name ,name))
  `((assert (not (is-nil ,elt)))
    (assert (= (x ,elt) 0))
    (assert (= (y ,elt) 0))
    (assert (= (parent ,elt) (as nil ,type-name)))
    (assert (= (tagname ,elt) <HTML>))
    (assert (= (previous ,elt) (as nil ,type-name)))
    (assert (= (pl ,elt) 0))
    (assert (= (pr ,elt) 0))
    (assert (= (pt ,elt) 0))
    (assert (= (pb ,elt) 0))
    (assert (= (bl ,elt) 0))
    (assert (= (br ,elt) 0))
    (assert (= (bt ,elt) 0))
    (assert (= (bb ,elt) 0))
    (assert (= (ml ,elt) 0))
    (assert (= (mr ,elt) 0))
    (assert (= (mt ,elt) 0))
    (assert (= (mb ,elt) 0))
    (assert (is-html ,elt))))

(define (make-dom root type q)
  (define elts `(,root nil))
  (define map-name (string->symbol (string-append (symbol->string type) "f")))

  (define (draw-elts q)
    (define pname (cadar q))
    (define first-child
      (if (null? (cdr q))
          `(as nil ,type)
          (cadar (cadr q))))

    (set! elts (cons pname elts))

    `(,@(apply make-element type map-name (car q))
      ,@(let ([prev `(as nil ,type)])
          (apply append
                 (for/list ([child (cdr q)])
                   (let ([cname (cadar child)])
                     (begin0 
                         `(,@(draw-elts child)
                           (assert (= (parent (,map-name ,cname)) ,pname))
                           (assert (= (previous (,map-name ,cname)) ,prev)))
                       (set! prev cname))))))
      (assert (= (first-child (,map-name ,pname)) ,first-child))))
  
  (define root-name (cadar q))
  (define constraints (draw-elts q))

  `((declare-datatypes () ((,type ,@elts)))
    (declare-fun ,map-name (,type) (Element ,type))
    (assert (= (,map-name (as nil ,type)) (as nil (Element ,type))))
    ,@(make-html root map-name type)
    ,@constraints
    (assert (= (first-child (,map-name ,root)) ,root-name))
    (assert (= (parent (,map-name ,root-name)) ,root))
    (assert (= (previous (,map-name ,root-name)) (as nil ,type)))))
