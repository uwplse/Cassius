#lang racket
(require "z3.rkt")
(require "css-rules.rkt")
(require unstable/sequence)
(require srfi/1)
(z3 "/opt/z3opt/bin/z3")
;(z3 "/usr/bin/z3")

(define maximize #t)

(provide print-rules solve make-preamble vw vh
         (struct-out dom) dom-constraints
         (struct-out rendering-context) (struct-out stylesheet) stylesheet-constraints)

(define (r2 x)
  (/ (round (* 100 x)) 100))

(define (groups-of-n l n)
  (let-values
      ([[latest all i]
        (for/fold
            ([latest '()]
             [all '()]
             [i n])
            ([item l])
          (if (= i 0)
              (values (list item) (cons (reverse latest) all) (- n 1))
              (values (cons item latest) all (- i 1))))])
    (reverse (cons (reverse latest) all))))

(define (print-rules #:stylesheet [stylesheet #f] #:header [header ""] smt-out)
  (with-output-to-file "test.css" #:exists 'replace
    (lambda ()
      (printf "/* Pre-generated header */\n\n~a\n\n/* Generated code below */\n\n" header)
      (for ([(key value) (in-hash smt-out)])
        (match value
          [(or `(element ,element-parts ...)
               `(let ,_ ,element-parts ...))
            (match element-parts
              [`(,tag ,rules ,previous ,parent ,first-child ,last-child ,fgc ,bgc ,x ,y ,w ,h
                      ,mt ,mb ,ml ,mr ,mtp ,mtn ,mbp ,mbn ,_ ,bt ,bb ,bl ,br ,pt ,pb ,pl ,pr)
               (eprintf "~a (~a) ~a×~a at (~a, ~a)\n" tag key (r2 (+ pl pr w)) (r2 (+ pt pb h)) (r2 y) (r2 x))
               (eprintf "margin:  ~a (+~a-~a) ~a ~a (+~a-~a) ~a\n"
                        (r2 mt) (r2 mtp) (r2 (abs mtn)) (r2 mr)
                        (r2 mb) (r2 mbp) (r2 (abs mbn)) (r2 ml))
               (eprintf "border:  ~a ~a ~a ~a\n" (r2 bt) (r2 br) (r2 bb) (r2 bl))
               (eprintf "padding: ~a ~a ~a ~a\n\n" (r2 pt) (r2 pr) (r2 pb) (r2 pl))])]
          [(list 'computedRules rest ...)
           (let ([properties (groups-of-n rest 2)])
             (when (ormap cadr properties)
               (eprintf "<~a> {\n" key)
               (for ([property (map append properties css-property-pairs)])
                 (match property
                   [`(,value ,score ,name . ,type)
                    (eprintf "  ~a: ~a;\n" name (print-type type value))]))
               (eprintf "}\n")))]
          [else '#f]))

      (for ([rule-value (map (curry hash-ref smt-out) (stylesheet-rules stylesheet))])
        (match rule-value
          [(list 'specifiedRules sel idx rest ...)
           (printf "~a {\n" (print-type 'Selector sel))

           (define hash (make-hash))

           (for ([property (groups-of-n rest 2)] [(name type) (in-pairs css-property-pairs)])
             (when (second property)
               (hash-set! hash name (cons type (first property)))))

           (for ([(name subproperties) (in-pairs css-shorthand-properties)])
             (when (every (curry hash-has-key? hash) subproperties)
               (define vals
                 (for/list ([subprop subproperties])
                   (begin0
                       (hash-ref hash subprop)
                     (hash-remove! hash subprop))))
               (printf "  ~a: ~a;\n" name
                       (string-join (map print-type (map car vals) (map cdr vals)) " "))))
           
           (for ([(name value) (in-hash hash)])
             (printf "  ~a: ~a;\n" name (print-type (car value) (cdr value))))

           (printf "}\n")])))))

(define (print-type type value)
  (match type
    [(or 'Width 'Height 'Margin 'Padding)
     (match value
       [`(as auto ,_) "auto"]
       [`(,_ 0.0) "0"]
       [`((as length ,_) ,x) (format "~apx" x)]
       [`((as percentage ,_) ,x) (format "~a%" (* 100 x))])]
    ['Color
     (match value
       ['transparent "transparent"]
       [`(color ,n)
        (string-append "#" (~a (format "~x" n) #:width 6 #:align 'right #:pad-string "0"))])]
    ['Float (~a value)]
    ['Selector
     (match value
       ['all "html *"]
       [`(tag ,name) (substring (symbol->string name)
                                1 (- (string-length (symbol->string name)) 1))])]))

(define (make-linebox type map-name e-name)
  (let* ([e `(,map-name ,e-name)]
         [pe `(,map-name (parent-l ,e))]
         [ve `(,map-name (previous-l ,e))])
    (map (curry list 'assert)
         `((is-element ,pe)
           (is-linebox ,e)
           (or (is-nil ,ve) (is-linebox ,ve))
           (<= (w-l ,e) (w-e ,pe)) ; Not true if the line box cannot be broken...
           (ite (is-linebox ,ve)
                (or
                 ; Do we need to break line? We allow it to go either way.
                 (and ; we break line
                  (= (x-l ,e) (+ (x-e ,pe) (pl ,pe)))
                  (= (y-l ,e)
                     (+ (y-l ,ve) (h-l ,pe) (/ (+ (gap-l ,e) (gap-l ,ve)) 2))))
                 (and ; we do not
                  (= (x-l ,e) (+ (x-l ,ve) (w-l ,ve)))
                  (= (- (y-l ,e) (/ (gap-l ,e) 2)) (- (y-l ,ve) (/ (gap-l ,e) 2)))))
                ; If no previous line box
                (and
                 (= (x-l ,e) (+ (x-e ,pe) (pl ,pe)))
                 (= (y-l ,e) (+ (y-e ,pe) (pt ,pe) (/ (gap-l ,e) 2)))))))))

(define (make-element doc-type map-name tag-name e-name)
  (let* ([e `(,map-name ,e-name)]
         [re `(rules ,e)]
         [pe `(,map-name (parent-e ,e))]
         [ve `(,map-name (previous-e ,e))]
         [fe `(,map-name (first-child ,e))]
         [le `(,map-name (last-child ,e))])
    (map (curry list 'assert)
         `(; Trivial constraints

           (is-element ,pe)
           (is-element ,e)
           (= (tagname ,e) ,tag-name)

           ; Length and width

           (=> (is-length (width ,re))
               (= (width-l (width ,re)) (w-e ,e)))
           (not (is-percentage (width ,re)))
           #;(=> (is-percentage (width ,re))
               (= (* (width-p (width ,re)) (w-e ,pe)) (w-e ,e)))
           (=> (is-length (height ,re))
               (= (height-l (height ,re)) (h-e ,e)))
           ; TODO : Figure out what height:auto actually means

           ; Padding

           (=> (is-length (padding-top ,re))
               (= (padding-l (padding-top ,re)) (pt ,e)))
           (not (is-percentage (padding-top ,re)))
           #;(=> (is-percentage (padding-top ,re))
               (= (* (padding-p (padding-top ,re)) (w-e ,pe)) (pt ,e)))
           (not (is-percentage (padding-right ,re)))
           (=> (is-length (padding-right ,re))
               (= (padding-l (padding-right ,re)) (pr ,e)))
           (=> (is-percentage (padding-right ,re))
               (= (* (padding-p (padding-right ,re)) (w-e ,pe)) (pr ,e)))
           (not (is-percentage (padding-bottom ,re)))
           (=> (is-length (padding-bottom ,re))
               (= (padding-l (padding-bottom ,re)) (pb ,e)))
           #;(=> (is-percentage (padding-bottom ,re))
               (= (* (padding-p (padding-bottom ,re)) (w-e ,pe)) (pb ,e)))
           (not (is-percentage (padding-left ,re)))
           (=> (is-length (padding-left ,re))
               (= (padding-l (padding-left ,re)) (pl ,e)))
           #;(=> (is-percentage (padding-left ,re))
               (= (* (padding-p (padding-left ,re)) (w-e ,pe)) (pl ,e)))

           ; Margin

           (not (is-percentage (margin-top ,re)))
           (=> (is-length (margin-top ,re))
               (= (margin-l (margin-top ,re)) (mt ,e)))
           #;(=> (is-percentage (margin-top ,re))
               (= (* (margin-p (margin-top ,re)) (w-e ,pe)) (mt ,e)))
           (=> (is-auto (margin-top ,re))
               (= (mt ,e) (ite (is-linebox ,fe) (max (/ (gap-l ,fe) 2) 0.0) 0.0)))

           ; These are the horrid rules for the right-margin; see CSS2 §10.3.3
           (= (+ (ml ,e) (bl ,e) (pl ,e) (w-e ,e) (pr ,e) (br ,e) (mr ,e)) (w-e ,pe))
           (=> (and (not (is-auto (width ,re)))
                    (> (+ (bl ,e) (pl ,e) (w-e ,e) (pr ,e) (br ,e)
                          (ite (not (is-auto (margin-left ,re)))
                               (ite (is-length (margin-left ,re))
                                    (margin-l (margin-left ,re))
                                    (* (margin-p (margin-left ,re)) (w-e ,pe)))
                               0.0)
                          (ite (not (is-auto (margin-right ,re)))
                               (ite (is-length (margin-right ,re))
                                    (margin-l (margin-right ,re))
                                    (* (margin-p (margin-right ,re)) (w-e ,pe)))
                               0.0))
                       (w-e ,pe)))
               (and
                (=> (is-auto (margin-right ,re)) (= 0.0 (mr ,e)))
                (=> (is-auto (margin-left ,re)) (= 0.0 (ml ,e)))))
           (=> (and (is-auto (width ,re)) (is-auto (margin-left ,re))) (= (ml ,e) 0.0))
           (=> (and (is-auto (width ,re)) (is-auto (margin-right ,re))) (= (mr ,e) 0.0))
           (=> (and (is-auto (margin-left ,re)) (is-auto (margin-right ,re)))
               (= (mr ,e) (ml ,e)))

           (not (is-percentage (margin-right ,re)))
           (=> (is-length (margin-right ,re)) (= (margin-l (margin-right ,re)) (mr ,e)))
           #;(=> (is-percentage (margin-right ,re)) (= (* (margin-p (margin-right ,re)) (w-e ,pe)) (mr ,e)))

           (not (is-percentage (margin-bottom ,re)))
           (=> (is-length (margin-bottom ,re))
               (= (margin-l (margin-bottom ,re)) (mb ,e)))
           #;(=> (is-percentage (margin-bottom ,re))
               (= (* (margin-p (margin-bottom ,re)) (w-e ,pe)) (mb ,e)))
           (=> (is-auto (margin-bottom ,re))
               (= (mb ,e) (ite (is-linebox ,fe) (max (/ (gap-l ,fe) 2) 0.0) 0.0)))

           (not (is-percentage (margin-left ,re)))
           (=> (is-length (margin-left ,re))
               (= (margin-l (margin-left ,re)) (ml ,e)))
           #;(=> (is-percentage (margin-left ,re))
               (= (* (margin-p (margin-left ,re)) (w-e ,pe)) (ml ,e)))
           (=> (and (is-auto (width ,re)) (is-auto (margin-left ,re))) (= (ml ,e) 0.0))

           (is-none (float ,re))

           ; Computing maximum collapsed positive and negative margin

           (=> (is-element ,fe)
               (and
                (= (mtp ,e) (max (ite (> (mt ,e) 0.0) (mt ,e) 0.0)
                                 (ite (and (= (pt ,e) 0.0) (= (bt ,e) 0.0)) (mtp ,fe) 0.0)))
                (= (mtn ,e) (min (ite (< (mt ,e) 0.0) (mt ,e) 0.0)
                                 (ite (and (= (pt ,e) 0.0) (= (bt ,e) 0.0)) (mtn ,fe) 0.0)))))
           (=> (not (is-element ,fe))
               (and
                (= (mtp ,e) (ite (> (mt ,e) 0.0) (mt ,e) 0.0))
                (= (mtn ,e) (ite (< (mt ,e) 0.0) (mt ,e) 0.0))))

           (=> (is-element ,fe)
               (and
                (= (mbp ,e) (max (ite (> (mb ,e) 0.0) (mb ,e) 0.0)
                                 (ite (and (= (pb ,e) 0.0) (= (bb ,e) 0.0)) (mbp ,fe) 0.0)))
                (= (mbn ,e) (min (ite (< (mb ,e) 0.0) (mb ,e) 0)
                                 (ite (and (= (pb ,e) 0.0) (= (bb ,e) 0.0)) (mbn ,fe) 0.0)))))
           (=> (not (is-element ,fe))
               (and
                (= (mbp ,e) (ite (> (mb ,e) 0) (mb ,e) 0))
                (= (mbn ,e) (ite (< (mb ,e) 0) (mb ,e) 0))))

           ; Computing height

           (=> (is-auto (height ,re))
               (= (h-e ,e)
                  (ite (is-nil ,le)
                       0.0
                       (ite (is-element ,le)
                            (ite (and (not (= (tagname ,e) <HTML>)) (= (pt ,e) 0.0) (= (bt ,e) 0.0))
                                 (- (+ (y-e ,le) ,(vh le)) (+ (y-e ,e) (pt ,e)))
                                 (+ (- (+ (y-e ,le) ,(vh le)) (+ (y-e ,e) (pt ,e))) (mb ,le)))
                            (- (+ (y-l ,le) ,(vh le) (/ (gap-l ,le) 2)) (+ (y-e ,e) (pt ,e)))))))

           ; Computing X and Y position

           (=> (is-none (float ,re)) (= (x-e ,e) (+ (x-e ,pe) (pl ,pe) (ml ,e))))

           (=> (is-none (float ,re))
               (= (y-e ,e)
                  (ite (is-element ,ve)
                       (+ (y-e ,ve) ,(vh ve)
                          (max (mbp ,ve) (mtp ,e)) (min (mbn ,ve) (mtn ,e)))
                       (ite (and (not (= (tagname ,pe) <HTML>)) (= (pt ,pe) 0.0) (= (bt ,pe) 0.0))
                            (y-e ,pe) ; Margins collapse if the borders and padding are zero.
                            (+ (mtp ,e) (mtn ,e) (pt ,pe) (y-e ,pe))))))

           ; Positivity constraint

           (>= (w-e ,e) 0.0)
           (>= (h-e ,e) 0.0)
           (>= (pl ,e) 0.0)
           (>= (pr ,e) 0.0)
           (>= (pb ,e) 0.0)
           (>= (pt ,e) 0.0)

           ; TODO : Add back borders
           (= (bl ,e) 0)
           (= (br ,e) 0)
           (= (bt ,e) 0)
           (= (bb ,e) 0)))))

(define (make-preamble)
  `((set-option :produce-unsat-cores true)
    ,@css-types
    ,css-rule-types
    ,@css-score-ops
    ,@math-utilities

    (declare-datatypes (T)
      ((Element
        nil
        (linebox
         ; For now, these have no rule, no margins, no padding, no nothing.
         (previous-l T) (parent-l T)
         (x-l Real) (y-l Real) (w-l Real) (h-l Real) (gap-l Real))
        (element
            (tagname TagNames) (rules ComputedRule)
            ; The DOM tree pointers
            (previous-e T) (parent-e T) (first-child T) (last-child T)
            ; X Y position, width and height
            (x-e Real) (y-e Real) (w-e Real) (h-e Real)
            ; Margins
            (mt Real) (mb Real) (ml Real) (mr Real)
            ; Collecting the most-negative and most-positive margins
            (mtp Real) (mtn Real) (mbp Real) (mbn Real)
            ; Borders
            (bt Real) (bb Real) (bl Real) (br Real)
            ; Padding
            (pt Real) (pb Real) (pl Real) (pr Real)))))))

(define (vw e)
  `(ite (is-element ,e)
        (+ (pl ,e) (w-e ,e) (pr ,e))
        (w-l ,e)))
(define (vh e)
  `(ite (is-element ,e)
        (+ (pt ,e) (h-e ,e) (pb ,e))
        (h-l ,e)))

(struct dom (name stylesheet context tree))
(struct rendering-context (width))
(struct stylesheet (name count))

(define (inline-element? elt)
  (eq? (car elt) '<>))

(define (in-tree-subtrees tree)
  (apply sequence-append
         (in-parallel (in-value (car tree)) (in-value (cdr tree)))
         (map in-tree-subtrees (cdr tree))))

(define (in-tree-values tree)
  (apply sequence-append
         (in-value (car tree))
         (map in-tree-values (cdr tree))))

(define (dom-type dom) (dom-name dom))
(define (dom-map dom) (variable-append (dom-name dom) 'map))
(define (dom-root dom) (variable-append (dom-name dom) 'root))
(define (dom-get dom elt) `(,(dom-map dom) ,(second elt)))

(define (dom-tree-constraints dom)
  (define type (dom-name dom))
  (define map-name (dom-map dom))
  (define elt-get (curry dom-get dom))
  (define root (dom-root dom))

  (define (get-child children accessor)
    (if (null? children)
        `(as nil ,type)
        (car (accessor children))))

  (define constraints
    (for/list ([(elt children) (in-tree-subtrees (dom-tree dom))])
      (append
       ; Parent element
       (for/list ([child (sequence-map car children)])
         `(assert (= (,(if (inline-element? child) 'parent-l 'parent-e)
                      ,(elt-get child)) ,(cadr elt))))
       ; Previous element
       (for/list ([child (sequence-map car children)]
                  [prev (sequence-append (in-value `(as nil ,(dom-type dom)))
                                         (sequence-map cadar children))])
         `(assert (= (,(if (inline-element? child) 'previous-l 'previous-e)
                      ,(elt-get child)) ,prev)))
       ; First/last child
       (if (inline-element? elt)
           '()
           (list
            `(assert (= (first-child ,(elt-get elt)) ,(cadr (get-child children first))))
            `(assert (= (last-child ,(elt-get elt)) ,(cadr (get-child children last)))))))))

  (define names (for/list ([elt (in-tree-values (dom-tree dom))]) (cadr elt)))
  
  (list*
   ; The type of element names
   `(declare-datatypes () ((,type ,@names ,root nil)))
   ; The element info for a name
   `(declare-fun ,map-name (,type) (Element ,type))
   ; Pointed map: nil goes to nil
   `(assert (= (,map-name (as nil ,type)) (as nil (Element ,type))))
   (apply append constraints)))

(define (dom-element-constraints dom)
  (apply append
         (for/list ([elt (in-tree-values (dom-tree dom))])
           (match elt
             [`(<> ,name)
              (make-linebox (dom-type dom) (dom-map dom) name)]
             [`(,tag ,name)
              (make-element (dom-type dom) (dom-map dom) tag name)]))))

(define (dom-style-constraints dom)
  (apply append
         (for/list ([elt (in-tree-values (dom-tree dom))])
           (match elt
             [`(<> ,name) '()]
             [`(,tag ,name)
              (define e (dom-get dom elt))
              (define re `(rules ,e))
              
              (append
               ; Score of computed rule is >= any applicable stylesheet rule
               (for*/list ([type css-properties] [property (cdr type)]
                           [rule (stylesheet-rules (dom-stylesheet dom))])
                 `(assert (=> (and (,(css-enabled-variable property) ,rule)
                           ,(css-is-applicable `(selector ,rule) e))
                      (score-ge (,(css-score-variable property) ,re) (score ,rule)))))
               
               ; Score&value of computed rule is = some applicable stylesheet rule
               (for*/list ([type css-properties] [property (cdr type)])
                 `(assert (or
                   ,@(for/list ([rule (stylesheet-rules (dom-stylesheet dom))])
                       `(and
                         (,(css-enabled-variable property) ,rule)
                         ,(css-is-applicable `(selector ,rule) e)
                         (= (,(css-score-variable property) ,re) (score ,rule))
                         (= (,property ,re)
                            (,(variable-append property 'specified) ,rule))))))))]))))

(define (dom-root-constraints dom)
  (define elt (list (dom-map dom) (dom-root dom)))
  (list
   `(assert (is-element ,elt))
   `(assert (= (x-e ,elt) 0))
   `(assert (= (y-e ,elt) 0))
   `(assert (= (parent-e ,elt) (as nil ,(dom-type dom))))
   `(assert (= (tagname ,elt) <HTML>))
   `(assert (= (previous-e ,elt) (as nil ,(dom-type dom))))
   `(assert (= (pl ,elt) 0))
   `(assert (= (pr ,elt) 0))
   `(assert (= (pt ,elt) 0))
   `(assert (= (pb ,elt) 0))
   `(assert (= (bl ,elt) 0))
   `(assert (= (br ,elt) 0))
   `(assert (= (bt ,elt) 0))
   `(assert (= (bb ,elt) 0))
   `(assert (= (ml ,elt) 0))
   `(assert (= (mr ,elt) 0))
   `(assert (= (mt ,elt) 0))
   `(assert (= (mb ,elt) 0))
   `(assert (! (= (w-e ,elt) ,(rendering-context-width (dom-context dom)))
               :name ,(variable-append (dom-name dom) 'context-width)))
   `(assert (= (parent-e (,(dom-map dom) ,(cadar (dom-tree dom)))) ,(dom-root dom)))
   `(assert (= (previous-e (,(dom-map dom) ,(cadar (dom-tree dom)))) (as nil ,(dom-type dom))))
   `(assert (= (first-child ,elt) ,(cadar (dom-tree dom))))
   `(assert (= (parent-e ,elt) (as nil ,(dom-type dom))))
   `(assert (= (previous-e ,elt) (as nil ,(dom-type dom))))))

(define (stylesheet-rules sheet)
  (for/list ([i (in-range (stylesheet-count sheet))])
    (string->symbol (format "~a-rule-~a" (stylesheet-name sheet) i))))

(define (stylesheet-constraints sheet)
  (apply append
         (for/list ([i (in-naturals)] [name (stylesheet-rules sheet)])
           `((declare-const ,name SpecifiedRule)
             (assert (= (index ,name) ,i))

             ; Optimize for short CSS

             ; Each enabled property costs one line
             ,@(if maximize
                   (for*/list ([type css-properties] [property (cdr type)])
                     `(assert-soft (not (,(css-enabled-variable property) ,name)) :weight 1))
                   '())

             ; Each block with an enabled property costs two line (open/selector and close brace)
             ,@(if maximize
                   `((assert-soft (and
                                   ,@(for*/list ([type css-properties] [property (cdr type)])
                                       `(not (,(css-enabled-variable property) ,name))))
                                  :weight 2))
                   '())

             ; Each shorthand rule can save space if all its properties exist
             ,@(if maximize
                   (for/list ([(short-name subproperties) (in-pairs css-shorthand-properties)])
                     `(assert-soft (and ,@(for/list ([subprop subproperties])
                                            (list (css-enabled-variable subprop) name)))
                                   :weight 3))
                   '())))))

(define (dom-constraints dom)
  (append
   (dom-tree-constraints dom)
   (dom-element-constraints dom)
   (dom-style-constraints dom)
   (dom-root-constraints dom)))
