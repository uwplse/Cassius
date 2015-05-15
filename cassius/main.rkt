#lang racket
(require "z3.rkt")
(require "dom.rkt")
(require "css-rules.rkt")
(require (rename-in "elements.rkt" [element-constraints element-constraints-core]))
(require "float.rkt")
(require unstable/sequence)
(require srfi/1)
(z3 "/opt/z3opt/bin/z3")
;(z3 "/usr/bin/z3")

(define maximize #f)

(provide cassius-solve (struct-out dom) (struct-out stylesheet) (struct-out rendering-context))

(define-syntax-rule (reap [sows ...] body ...)
  (let* ([sows (let ([store '()])
		 (λ (elt) (if elt
			      (begin (set! store (cons elt store))
				     elt)
			      store)))] ...)
    body ...
    (values (reverse (sows #f)) ...)))


(define (r2 x)
  (/ (round (* 100 x)) 100))

(define (groups-of-n l n)
  (if (null? l)
      '()
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
        (reverse (cons (reverse latest) all)))))

(define (print-rules #:stylesheet [stylesheet #f] #:header [header ""] smt-out)
  (with-output-to-file "test.css" #:exists 'replace
    (lambda ()
      (printf "/* Pre-generated header */\n\n~a\n\n/* Generated code below */\n\n" header)
      (for ([(key value) (in-hash smt-out)])
        (match value
          [`(box ,x ,y ,w ,h ,mt ,mr ,mb ,ml ,mtp ,mtn ,mbp ,mbn ,pt ,pr ,pb ,pl ,bt ,br ,bb ,bl ,gap)
           (eprintf "~a ~a×~a at (~a, ~a)\n" key (r2 (+ pl pr w)) (r2 (+ pt pb h)) (r2 y) (r2 x))
           (eprintf "margin:  ~a (+~a-~a) ~a ~a (+~a-~a) ~a\n"
                    (r2 mt) (r2 mtp) (r2 (abs mtn)) (r2 mr)
                    (r2 mb) (r2 mbp) (r2 (abs mbn)) (r2 ml))
           (eprintf "border:  ~a ~a ~a ~a\n" (r2 bt) (r2 br) (r2 bb) (r2 bl))
           (eprintf "padding: ~a ~a ~a ~a\n\n" (r2 pt) (r2 pr) (r2 pb) (r2 pl))]
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
           (printf "~a /* ~a */ {\n" (print-type 'Selector sel) idx)

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

(define (tree-constraints dom emit elt children)
  (define type (dom-type dom))
  (define map-name (dom-map dom))
  (define elt-get (curry dom-get dom))
  (define root (dom-root dom))

  (define (get-child children accessor)
    (if (null? children)
        `(as nil ,type)
        (cadar (accessor children))))

  ; Parent element
  (for/list ([child (sequence-map car children)])
    (emit `(assert (= (parent ,(elt-get child)) ,(cadr elt)))))
  ; Previous element
  (for/list ([child (sequence-map car children)]
             [prev (sequence-append (in-value `(as nil ,type))
                                    (sequence-map cadar children))])
    (emit `(assert (= (previous ,(elt-get child)) ,prev))))
  ; First/last child
  (emit `(assert (= (first-child ,(elt-get elt)) ,(get-child children first))))
  (emit `(assert (= (last-child ,(elt-get elt)) ,(get-child children last)))))

(define (style-constraints dom emit elt children)
  (define e (dom-get dom elt))
  (define re `(rules ,e))
              
  (when (not (eq? (car elt) '<>))
    ; Score of computed rule is >= any applicable stylesheet rule
    (for* ([type css-properties] [property (cdr type)]
           [rule (stylesheet-rules (dom-stylesheet dom))])
      (emit
       `(assert (=> (and (,(variable-append property 'enabled) ,rule)
                         ,(css-is-applicable `(selector ,rule) e))
                    (score-ge (,(variable-append property 'score) ,re) (score ,rule))))))
                   
    ; Score&value of computed rule is = some applicable stylesheet rule
    (for* ([type css-properties] [property (cdr type)])
      (emit `(assert (or
                      ,@(for/list ([rule (stylesheet-rules (dom-stylesheet dom))])
                          `(and
                            (,(variable-append property 'enabled) ,rule)
                            ,(css-is-applicable `(selector ,rule) e)
                            (= (,(variable-append property 'score) ,re) (score ,rule))
                            (= (,property ,re)
                               (,(variable-append property 'specified) ,rule))))))))))

(define (dom-root-constraints dom emit)
  (define type (dom-type dom))
  (define map-name (dom-map dom))
  (define elt (list map-name (dom-root dom)))
  (define b (list 'flow-box elt))

  (define names (for/list ([elt (in-tree-values (dom-tree dom))]) (cadr elt)))

  ; The type of element names
  (emit `(declare-datatypes () ((,type ,@names ,(dom-root dom) nil))))
  ; The element info for a name
  (emit `(declare-fun ,map-name (,type) (Element ,type)))
  ; Pointed map: nil goes to nil
  (emit `(assert (= (,map-name (as nil ,type)) (as nil (Element ,type)))))

  (emit `(assert (is-element ,elt)))
  (emit `(assert (= (placement-box ,elt) (flow-box ,elt))))
  (emit `(assert (= (parent ,elt) (as nil ,(dom-type dom)))))
  (emit `(assert (= (tagname ,elt) <HTML>)))
  (emit `(assert (= (previous ,elt) (as nil ,(dom-type dom)))))
  (emit `(assert (= (x ,b) 0.0)))
  (emit `(assert (= (y ,b) 0.0)))
  (emit `(assert (= (pl ,b) 0.0)))
  (emit `(assert (= (pr ,b) 0.0)))
  (emit `(assert (= (pt ,b) 0.0)))
  (emit `(assert (= (pb ,b) 0.0)))
  (emit `(assert (= (bl ,b) 0.0)))
  (emit `(assert (= (br ,b) 0.0)))
  (emit `(assert (= (bt ,b) 0.0)))
  (emit `(assert (= (bb ,b) 0.0)))
  (emit `(assert (= (ml ,b) 0.0)))
  (emit `(assert (= (mr ,b) 0.0)))
  (emit `(assert (= (mt ,b) 0.0)))
  (emit `(assert (= (mb ,b) 0.0)))
  (emit `(assert (= (mtp ,b) 0.0)))
  (emit `(assert (= (mbp ,b) 0.0)))
  (emit `(assert (= (mtn ,b) 0.0)))
  (emit `(assert (= (mbn ,b) 0.0)))
  (emit `(assert (= (float ,elt) none)))
  (emit `(assert (! (= (w ,b) ,(rendering-context-width (dom-context dom)))
                    :named ,(variable-append (dom-name dom) 'context-width))))
  (emit `(assert (= (parent (,(dom-map dom) ,(cadar (dom-tree dom)))) ,(dom-root dom))))
  (emit `(assert (= (previous (,(dom-map dom) ,(cadar (dom-tree dom)))) (as nil ,(dom-type dom)))))
  (emit `(assert (= (first-child ,elt) ,(cadar (dom-tree dom)))))
  (emit `(assert (= (parent ,elt) (as nil ,(dom-type dom)))))
  (emit `(assert (= (previous ,elt) (as nil ,(dom-type dom))))))

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
                     `(assert-soft (not (,(variable-append property 'enabled) ,name)) :weight 1))
                   '())

             ; Each block with an enabled property costs two line (open/selector and close brace)
             ,@(if maximize
                   `((assert-soft (and
                                   ,@(for*/list ([type css-properties] [property (cdr type)])
                                       `(not (,(variable-append property 'enabled) ,name))))
                                  :weight 2))
                   '())

             ; Each shorthand rule can save space if all its properties exist
             ,@(if maximize
                   (for/list ([(short-name subproperties) (in-pairs css-shorthand-properties)])
                     `(assert-soft (and ,@(for/list ([subprop subproperties])
                                            (list (variable-append subprop 'enabled) name)))
                                   :weight 3))
                   '())))))

(define (user-constraints dom emit elt children)
  (define name (cadr elt))
  (define cmds (cddr elt))

  (let interpret ([cmds cmds])
    (match cmds
      [(list ':print rest ...)
       (emit `(declare-const ,(variable-append name 'placement) Box))
       (emit `(assert (= ,(variable-append name 'placement) (placement-box (,(dom-map dom) ,name)))))
       (interpret rest)]
      [(list (and (or ':x ':y ':w ':h ':vw ':vh ':gap) field) value rest ...)
       (define fun
         (match field
           [':x 'x] [':y 'y] [':w 'w] [':h 'h] [':gap 'gap] [':vh 'box-height] [':vw 'box-width]))
       (emit `(assert (! (= (,fun (placement-box ,(dom-get dom elt))) ,value) :named ,(variable-append name fun))))
       (interpret rest)]
      [(list)
       (void)])))

(define (element-constraints dom emit elt children)
  (match elt
    [`(,tag ,name ,constraints ...)
     (for-each emit
              (element-constraints-core tag name (dom-map dom)))]))

(define (nofloat-constraints dom emit elt children)
  (when (not (equal? (car elt) '<>))
    (emit `(assert (= (float ,(dom-get dom elt)) none)))))

(define (all-constraints-of dom emit . types)
  (for* ([(elt children) (in-tree-subtrees (dom-tree dom))] [type types])
    (type dom emit elt children)))

(define (dom-constraints doms)
  (reap [sow]
        (for ([dom doms])
          (dom-root-constraints dom sow)
          (all-constraints-of dom sow tree-constraints)
          (all-constraints-of dom sow nofloat-constraints)
          (all-constraints-of dom sow user-constraints)
          (all-constraints-of dom sow style-constraints)
          (all-constraints-of dom sow element-constraints)
          #;(map sow (dom-element-float-constraints dom)))))

(define (cassius-solve #:debug [debug #f] #:sheet sheet #:header header . doms)
  (define problem
    `(; Preamble
      (set-option :produce-unsat-cores true)
      ,@css-types
      ,css-rule-types
      ,@css-score-ops
      ,@math-utilities
      ,@box-functions
      ,element-type
      ; Stylesheet
      ,@(stylesheet-constraints sheet)
      ; DOMs
      ,@(dom-constraints doms)
      (check-sat)
      ))

  
  (print-rules #:stylesheet sheet #:header header
               (solve #:debug debug problem)))
