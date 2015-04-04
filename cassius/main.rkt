#lang racket
(require "z3.rkt")
(require "css-rules.rkt")
(require "elements.rkt")
(require unstable/sequence)
(require srfi/1)
(z3 "/opt/z3opt/bin/z3")
;(z3 "/usr/bin/z3")

(define maximize #f)

(define (println x)
  (pretty-print x)
  x)

(provide print-rules solve make-preamble vw vh
         (struct-out dom) dom-constraints
         (struct-out rendering-context) (struct-out stylesheet) stylesheet-constraints)

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

(define (make-preamble)
  `((set-option :produce-unsat-cores true)
    ,@css-types
    ,css-rule-types
    ,@css-score-ops
    ,@math-utilities
    ,@box-functions
    ,element-type))

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
  (define type (dom-type dom))
  (define map-name (dom-map dom))
  (define elt-get (curry dom-get dom))
  (define root (dom-root dom))

  (define (get-child children accessor)
    (if (null? children)
        `(as nil ,type)
        (cadar (accessor children))))

  (define constraints
    (for/list ([(elt children) (in-tree-subtrees (dom-tree dom))])
      (append
       ; Parent element
       (for/list ([child (sequence-map car children)])
         `(assert (= (parent ,(elt-get child)) ,(cadr elt))))
       ; Previous element
       (for/list ([child (sequence-map car children)]
                  [prev (sequence-append (in-value `(as nil ,type))
                                         (sequence-map cadar children))])
         `(assert (= (previous ,(elt-get child)) ,prev)))
       ; First/last child
       (list
        `(assert (= (first-child ,(elt-get elt)) ,(get-child children first)))
        `(assert (= (last-child ,(elt-get elt)) ,(get-child children last)))))))

  (define names (for/list ([elt (in-tree-values (dom-tree dom))]) (cadr elt)))
  
  (list*
   ; The type of element names
   `(declare-datatypes () ((,type ,@names ,root nil)))
   ; The element info for a name
   `(declare-fun ,map-name (,type) (Element ,type))
   ; Pointed map: nil goes to nil
   `(assert (= (,map-name (as nil ,type)) (as nil (Element ,type))))
   (apply append constraints)))

(define (dom-rendering-constraints dom)
  (apply append
         (for/list ([elt (in-tree-values (dom-tree dom))])
           (match elt
             [`(,tag ,name ,constraints ...)
              (append
               (element-constraints tag name (dom-map dom)))]))))

(define (dom-style-constraints dom)
  (apply append
         (for/list ([elt (in-tree-values (dom-tree dom))])
           (match elt
             [`(<> ,name ,constraints ...) '()]
             [`(,tag ,name ,constraints ...)
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
  (define b (list 'flow-box elt))
  (list
   `(assert (is-element ,elt))
   `(assert (= (placement-box ,elt) (flow-box ,elt)))
   `(assert (= (parent ,elt) (as nil ,(dom-type dom))))
   `(assert (= (tagname ,elt) <HTML>))
   `(assert (= (previous ,elt) (as nil ,(dom-type dom))))
   `(assert (= (x ,b) 0.0))
   `(assert (= (y ,b) 0.0))
   `(assert (= (pl ,b) 0.0))
   `(assert (= (pr ,b) 0.0))
   `(assert (= (pt ,b) 0.0))
   `(assert (= (pb ,b) 0.0))
   `(assert (= (bl ,b) 0.0))
   `(assert (= (br ,b) 0.0))
   `(assert (= (bt ,b) 0.0))
   `(assert (= (bb ,b) 0.0))
   `(assert (= (ml ,b) 0.0))
   `(assert (= (mr ,b) 0.0))
   `(assert (= (mt ,b) 0.0))
   `(assert (= (mb ,b) 0.0))
   `(assert (= (mtp ,b) 0.0))
   `(assert (= (mbp ,b) 0.0))
   `(assert (= (mtn ,b) 0.0))
   `(assert (= (mbn ,b) 0.0))
   `(assert (= (float ,elt) none))
   `(assert (! (= (w ,b) ,(rendering-context-width (dom-context dom)))
               :name ,(variable-append (dom-name dom) 'context-width)))
   `(assert (= (parent (,(dom-map dom) ,(cadar (dom-tree dom)))) ,(dom-root dom)))
   `(assert (= (previous (,(dom-map dom) ,(cadar (dom-tree dom)))) (as nil ,(dom-type dom))))
   `(assert (= (first-child ,elt) ,(cadar (dom-tree dom))))
   `(assert (= (parent ,elt) (as nil ,(dom-type dom))))
   `(assert (= (previous ,elt) (as nil ,(dom-type dom))))))

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

(define (dom-element-constraints dom)
  (define (interpret elt cmds k)
    (define name (cadr elt))
    (match cmds
      [(list ':print rest ...)
       (k `(declare-const ,(variable-append (cadr elt) 'placement) Box))
       (k `(assert (= ,(variable-append (cadr elt) 'placement) (placement-box (,(dom-map dom) ,(cadr elt))))))
       (interpret elt rest k)]
      [(list (and (or ':x ':y ':w ':h ':vw ':vh ':gap) field) value rest ...)
       (define fun
         (match field
           [':x 'x] [':y 'y] [':w 'w] [':h 'h] [':gap 'gap] [':vh 'box-height] [':vw 'box-width]))
       (k `(assert (! (= (,fun (placement-box ,(dom-get dom elt))) ,value) :name ,(variable-append name fun))))
       (interpret elt rest k)]
      [(list)
       (void)]))
  
  (reap [sow]
        (for ([elt (in-tree-values (dom-tree dom))])
          (match elt
            [`(,tag ,name ,cmds ...)
             (interpret elt cmds sow)]))))

(define (dom-constraints dom)
  (append
   (dom-tree-constraints dom)
   (dom-element-constraints dom)
   (dom-rendering-constraints dom)
   (dom-style-constraints dom)
   (dom-root-constraints dom)))
