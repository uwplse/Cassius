#lang racket
(require "z3.rkt")
(require "dom.rkt")
(require "css-rules.rkt")
(require "elements.rkt")
(require "float.rkt")
(require "common.rkt")
(require "css-properties.rkt")
(require unstable/sequence)
(require srfi/1)
(z3 "./z3.sh")
;(z3 "/usr/bin/z3")

(define maximize #f)

(provide cassius-solve define-stylesheet define-document)

(define-syntax-rule (define-stylesheet name rules ...)
  (define name '(rules ...)))

(define-syntax define-document
  (syntax-rules ()
    [(define-document (name #:sheet sheet #:width width) tree)
     (define name (dom 'name sheet (rendering-context width) 'tree))]))

(define (in-empty) (in-list empty))

(define (in-groups n s)
  (if (null? s)
      (in-empty)
      (let-values ([(hd tail) (split-at s n)])
        (in-sequences
         (apply in-parallel (map in-value hd))
         (in-groups n tail)))))

(define (print-rules #:stylesheet [stylesheet #f] #:header [header ""] smt-out)
  (define (r2 x) (~r x #:precision 2))
  (with-output-to-file "test.css" #:exists 'replace
    (lambda ()
      (printf "/* Pre-generated header */\n\n~a\n\n/* Generated code below */\n\n" header)
      (for ([(key value) (in-hash smt-out)])
        (match value
          [`(box ,x ,y ,w ,h ,mt ,mr ,mb ,ml ,mtp ,mtn ,mbp ,mbn ,pt ,pr ,pb ,pl ,bt ,br ,bb ,bl)
           (eprintf "~a ~a×~a at (~a, ~a)\n" key (r2 (+ pl pr w)) (r2 (+ pt pb h)) (r2 y) (r2 x))
           (eprintf "margin:  ~a (+~a-~a) ~a ~a (+~a-~a) ~a\n"
                    (r2 mt) (r2 mtp) (r2 (abs mtn)) (r2 mr)
                    (r2 mb) (r2 mbp) (r2 (abs mbn)) (r2 ml))
           (eprintf "border:  ~a ~a ~a ~a\n" (r2 bt) (r2 br) (r2 bb) (r2 bl))
           (eprintf "padding: ~a ~a ~a ~a\n\n" (r2 pt) (r2 pr) (r2 pb) (r2 pl))]
          [(list 'style rest ...)
           (eprintf "{~a} " key)
           (print-type 'Style value)]
          [else '#f]))

      (for ([rule-value (map (curry hash-ref smt-out)
                             (for/list ([i (in-naturals)] [rule stylesheet]) (sformat "rule-~a" i)))])
        (print-type 'Rule rule-value)))))

(define (css-type-ending? v)
  (lambda (x) (string=? (last (string-split (~a x) "/")) v)))

(define (print-type type value)
  (match type
    [(or 'Width 'Height 'Margin 'Padding 'Border)
     (match value
       [(? (css-type-ending? "auto")) "auto"]
       [(list _ 0.0) "0"]
       [(list (? (css-type-ending? "px")) x) (format "~apx" x)]
       [(list (? (css-type-ending? "pct")) x) (format "~a%" x)])]
    ['Color
     (match value
       ['transparent "transparent"]
       [`(color ,n)
        (string-append "#" (~a (format "~x" n) #:width 6 #:align 'right #:pad-string "0"))])]
    ['Float (last (string-split (~a value) "/"))]
    ['TextAlign (last (string-split (~a value) "/"))]
    ['Selector
     (match value
       ['sel/all "*"]
       [`(sel/id ,id) (string-append "#" (substring (symbol->string id) 3))]
       [`(sel/tag ,name)
        (substring (symbol->string name) 5 (- (string-length (symbol->string name)) 1))])]
    ['Style
     (match-define (list 'style rest ...) value)
     (eprintf " {\n")
     (for ([(value score) (in-groups 2 rest)] [(prop type default) (in-css-properties)])
       (eprintf "  ~a: ~a; /* ~a */ \n" prop (print-type type value) score))
     (eprintf "}\n")]
    ['Rule
     (match-define (list 'rule sel idx rest ...) value)
     (define props
       (for/hash ([(value enabled?) (in-groups 2 rest)] [(prop type default) (in-css-properties)]
                  #:when enabled?)
         (values prop (list type value))))
     (unless (hash-empty? props)
       (printf "~a {\n" (print-type 'Selector sel))
       (define short-printed
         (apply append
                (for/list ([(short parts) (in-pairs css-shorthand-properties)]
                           #:when (andmap (curry hash-has-key? props) parts))
                  (define values (map (curry hash-ref props) parts))
                  (printf "  ~a: ~a;\n" short (string-join (map (curry apply print-type) values) " "))
                  parts)))
       (for ([(prop value) (in-hash props)] #:when (not (member prop short-printed)))
         (printf "  ~a: ~a;\n" prop (apply print-type value)))
       (printf "}\n"))]))

(define (tree-constraints dom emit elt children)
  (define elt-get (curry dom-get dom))
  (define root (dom-root dom))

  (define (get-child children accessor)
    (if (null? children)
        '(as nil ElementName)
        (elt-name (car (accessor children)))))

  ; Parent element
  (for ([child (sequence-map car children)])
    (emit `(assert (= (parent ,(elt-get child)) ,(elt-name elt)))))
  ; Previous element
  (for ([child (sequence-map car children)]
        [prev (sequence-append (in-value '(as nil ElementName))
                               (sequence-map (compose elt-name car) children))])
    (emit `(assert (= (previous ,(elt-get child)) ,prev))))

  ; First/last child
  (emit `(assert (= (first-child ,(elt-get elt)) ,(get-child children first))))
  (emit `(assert (= (last-child ,(elt-get elt)) ,(get-child children last)))))

(define (style-constraints dom emit elt children)
  (define e (dom-get dom elt))
  (define re `(rules ,e))

  (when (member (car elt) '(INLINE BLOCK))
    ; Score of computed rule is >= any applicable stylesheet rule
    (for* ([type css-properties] [property (cdr type)]
           [rule
            (for/list ([i (in-naturals)] [rule (dom-stylesheet dom)]) (sformat "rule-~a" i))])
      (emit
       `(assert
         (or (not (,(sformat "rule.~a?" property) ,rule))
             (=> (selector-applies? (selector ,rule) ,e)
                 (score-ge (,(sformat "style.~a$" property) ,re) (score ,rule)))))))

    ; Score&value of computed rule is = some applicable stylesheet rule
    (for* ([type css-properties] [property (cdr type)])
      (emit `(assert (or
                      (and (is-useDefault (,(sformat "style.~a$" property) ,re))
                           (= (,(sformat "style.~a" property) ,re) ,(hash-ref css-defaults property)))
                      ,@(for/list ([rule
                                    (for/list ([i (in-naturals)] [rule (dom-stylesheet dom)])
                                      (sformat "rule-~a" i))])
                          `(and
                            (,(sformat "rule.~a?" property) ,rule)
                            (selector-applies? (selector ,rule) ,e)
                            (= (,(sformat "style.~a$" property) ,re) (score ,rule))
                            (= (,(sformat "style.~a" property) ,re)
                               (,(sformat "rule.~a" property) ,rule))))))))))

(define (dom-define-get doms emit)
  (define dom-names
    (for/list ([dom doms])
      (cons (dom-root dom) (for/list ([elt (in-tree-values (dom-tree dom))]) (elt-name elt)))))

  ; The type of element names
  (for ([dom doms] [names dom-names] #:when #t [name names])
    (emit `(declare-const ,(sformat "~a-elt" name) Element))
    (emit `(assert (= (document ,(sformat "~a-elt" name)) ,(sformat "~a-doc" (dom-name dom))))))
  ; The element info for a name
  (define body
    (for*/fold ([body '(as nil Element)]) ([names dom-names] [name names])
      `(ite (= x ,name) ,(sformat "~a-elt" name) ,body)))
  (emit `(define-fun get/elt ((x ElementName)) Element ,body))
  (for* ([names dom-names] [name names])
    (emit `(assert (not (is-nil (get/elt ,name)))))
    (emit `(assert (= (get/elt ,name) ,(sformat "~a-elt" name)))))
  ; Pointed map: nil goes to nil
  (emit `(assert (= (get/elt (as nil ElementName)) (as nil Element)))))

(define (dom-root-constraints dom emit)
  (define elt `(get/elt ,(dom-root dom)))
  (define b (list 'flow-box elt))

  (emit `(assert (= ,elt ,(sformat "~a-elt" (dom-root dom)))))
  (emit `(assert (= (placement-box ,elt) (flow-box ,elt))))
  (emit `(assert (= (parent ,elt) (as nil ElementName))))
  (emit `(assert (= (tagname ,elt) box/viewport)))
  (emit `(assert (= (previous ,elt) (as nil ElementName))))
  (for ([field '(x y pl pr pt pb bl br bt bb ml mr mt mb mtp mbp mtn mbn)])
    (emit `(assert (= (,field ,b) 0.0))))
  (emit `(assert (= (float ,elt) float/none)))
  (emit `(assert (= (textalign ,elt) text-align/left)))
  (emit `(assert (! (= (w ,b) ,(rendering-context-width (dom-context dom)))
                    :named ,(sformat "~a-context-width" (dom-name dom)))))
  (emit `(assert (= (parent (get/elt ,(elt-name (car (dom-tree dom))))) ,(dom-root dom))))
  (emit `(assert (= (previous (get/elt ,(elt-name (car (dom-tree dom))))) (as nil ElementName))))
  (emit `(assert (= (first-child ,elt) ,(elt-name (car (dom-tree dom))))))
  (emit `(assert (= (parent ,elt) (as nil ElementName))))
  (emit `(assert (= (previous ,elt) (as nil ElementName)))))

(define (stylesheet-constraints sheet)
  (append
   (apply append
          (for/list ([i (in-naturals)] [rule sheet])
            (define name (sformat "rule-~a" i))
            `((declare-const ,name Rule)
              (assert (= (index ,name) ,i))
              (assert (=> (is-sel/id (selector ,name)) (not (= (sel.id (selector ,name)) NoID))))

              ,@(reap [emit]
                      (match rule
                        ['? (void)]
                        [(list sel pairs ...)
                         (emit `(assert (= (selector ,name) ,sel)))
                         (for ([(a-prop type default) (in-css-properties)])
                           (cond
                             [(assoc a-prop pairs)
                              (emit `(assert (= (,(sformat "rule.~a?" a-prop) ,name) true)))
                              (match (cadr (assoc a-prop pairs))
                                ['? (void)]
                                [val (emit `(assert (= (,(sformat "rule.~a" a-prop) ,name) ,val)))])]
                             [(not (member '? pairs))
                              (emit `(assert (= (,(sformat "rule.~a?" a-prop) ,name) false)))]
                             [else (void)]))]))

              ; Optimize for short CSS

              ; Each enabled property costs one line
              ,@(if maximize
                    (for*/list ([type css-properties] [property (cdr type)])
                      `(assert-soft (not (,(sformat "rule.~a?" property) ,name)) :weight 1))
                    '())

              ; Each block with an enabled property costs two line (open/selector and close brace)
              ,@(if maximize
                    `((assert-soft (and
                                    ,@(for*/list ([type css-properties] [property (cdr type)])
                                        `(not (,(sformat "rule.~a?" property) ,name))))
                                   :weight 2))
                    '())

              ; Each shorthand rule can save space if all its properties exist
              ,@(if maximize
                    (for/list ([(short-name subproperties) (in-pairs css-shorthand-properties)])
                      `(assert-soft (and ,@(for/list ([subprop subproperties])
                                             (list (sformat "rule.~a?" subprop) name)))
                                    :weight 3))
                    '()))))))

(define (user-constraints dom emit elt children)
  (define name (elt-name elt))
  (define cmds
    (match elt
      [(list 'BLOCK tag cmds ...) cmds]
      [(list 'INLINE tag cmds ...) cmds]
      [(list 'LINE cmds ...) cmds]
      [(list 'TEXT cmds ...) cmds]))

  (let interpret ([cmds cmds])
    (match cmds
      [(list ':print rest ...)
       (emit `(declare-const ,(sformat "~a-placement" name) Box))
       (emit `(assert (= ,(sformat "~a-placement" name) (placement-box (get/elt ,name)))))
       (emit `(declare-const ,(sformat "~a-style" name) Style))
       (emit `(assert (= ,(sformat "~a-style" name) (rules (get/elt ,name)))))
       (interpret rest)]
      [(list ':id id rest ...)
       (interpret rest)]
      [(list (and (or ':x ':y ':w ':h) field) value rest ...)
       (define fun (match field [':x 'x] [':y 'y] [':h 'box-height] [':w 'box-width]))
       (when (memq (car elt) '(LINE TEXT INLINE BLOCK))
         (emit `(assert (! (= (,fun (placement-box ,(dom-get dom elt))) ,value) :named ,(sformat "~a-~a" name fun)))))
       (interpret rest)]
      [(list)
       (void)])))

(define (element-constraints dom emit elt children)
  (match elt
    [(list 'BLOCK tag constraints ...)
     (for-each emit (element-block-constraints (sformat "box/~a" tag) (elt-name elt)))]
    [(list 'LINE constraints ...)
     (for-each emit (element-line-constraints "box/line" (elt-name elt)))]
    [(list 'INLINE tag constraints ...)
     (for-each emit (element-inline-constraints (sformat "box/~a" tag) (elt-name elt)))]
    [(list 'TEXT constraints ...)
     (for-each emit (element-inline-constraints 'box/text (elt-name elt)))]))

(define (id-constraints dom emit elt children)
  (if (memq ':id elt)
      (emit `(assert (= (id ,(dom-get dom elt)) ,(sformat "ID-~a" (cadr (memq ':id elt))))))
      (emit `(assert (= (id ,(dom-get dom elt)) NoID)))))

(define (all-constraints-of dom emit . types)
  (for* ([(elt children) (in-tree-subtrees (dom-tree dom))] [type types])
    (type dom emit elt children)))

(define (dfs-constraints doms . constraints)
  (reap [sow]
        (dom-define-get doms sow)
        (for ([dom doms]) (dom-root-constraints dom sow))
        (for ([cns constraints])
          (for* ([dom doms] [(elt children) (in-tree-subtrees (dom-tree dom))])
            (cns dom sow elt children)))))

(define (cassius-solve #:debug [debug #f] #:sheet sheet #:header header . doms)
  (define ids
    (for*/reap [id] ([dom doms] [elt (in-tree-values (dom-tree dom))] #:when (memq ':id elt))
               (id (cadr (memq ':id elt)))))
  (define tags
    (for*/reap [save] ([dom doms] [elt (in-tree-values (dom-tree dom))])
               (match elt
                 [(list 'BLOCK tag cmds ...) (save tag)]
                 [(list 'INLINE tag cmds ...) (save tag)]
                 [(list 'LINE tag cmds ...) (void)]
                 [(list 'TEXT cmds ...) (void)])))

  (define constraints
    (list tree-constraints id-constraints user-constraints element-constraints style-constraints))

  (define problem
    `(; Preamble
      (set-option :produce-unsat-cores true)
      (declare-datatypes ()
        ((Id NoID ,@(map (curry sformat "ID-~a") (remove-duplicates ids)))
         (TagNames box/viewport box/text box/inline box/block box/line
                   ,@(map (curry sformat "box/~a") (remove-duplicates tags)))
         (Document ,@(for/list ([dom doms]) (sformat "~a-doc" (dom-name dom))))
         (ElementName
          ,@(for*/list ([dom doms] [elt (in-tree-values (dom-tree dom))]) (elt-name elt))
          ,@(for/list ([dom doms]) (dom-root dom))
          nil)))
      ,@css-declarations

      ; Defining some terms
      ,@box-functions
      ,element-type
      ,@css-functions

      ; Stylesheet
      ,@(stylesheet-constraints sheet)
      ; DOMs
      ,@(apply dfs-constraints doms constraints)
      (apply propagate-values)
      (check-sat :data solve)))

  (print-rules #:stylesheet sheet #:header header
               (solve
                (z3-prepare problem)
                #:get-unsat
                (lambda (v)
                  (elt-from-name (string->symbol (first (string-split (~a v) "-")))))
                #:debug debug)))
