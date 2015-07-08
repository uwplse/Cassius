#lang racket
(require "z3.rkt")
(require "dom.rkt")
(require "css-rules.rkt")
(require (rename-in "elements.rkt" [element-constraints element-constraints-core]))
(require "float.rkt")
(require "common.rkt")
(require "css-properties.rkt")
(require unstable/sequence)
(require srfi/1)
(z3 "/opt/z3opt/bin/z3")
;(z3 "/usr/bin/z3")

(define maximize #f)

(provide cassius-solve (struct-out dom) (struct-out stylesheet) (struct-out rendering-context))

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
          [`(box ,x ,y ,w ,h ,mt ,mr ,mb ,ml ,mtp ,mtn ,mbp ,mbn ,pt ,pr ,pb ,pl ,bt ,br ,bb ,bl ,gap)
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

      (for ([rule-value (map (curry hash-ref smt-out) (stylesheet-rules stylesheet))])
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

  (when (not (eq? (car elt) 'text))
    ; Score of computed rule is >= any applicable stylesheet rule
    (for* ([type css-properties] [property (cdr type)]
           [rule (stylesheet-rules (dom-stylesheet dom))])
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
                      ,@(for/list ([rule (stylesheet-rules (dom-stylesheet dom))])
                          `(and
                            (,(sformat "rule.~a?" property) ,rule)
                            (selector-applies? (selector ,rule) ,e)
                            (= (,(sformat "style.~a$" property) ,re) (score ,rule))
                            (= (,(sformat "style.~a" property) ,re)
                               (,(sformat "rule.~a" property) ,rule))))))))))

(define (dom-root-constraints dom emit)
  (define elt (list (dom-map dom) (dom-root dom)))
  (define b (list 'flow-box elt))

  (define names (cons (dom-root dom) (for/list ([elt (in-tree-values (dom-tree dom))]) (elt-name elt))))

  ; The type of element names
  (for ([name names])
    (emit `(declare-const ,(sformat "~a-elt" name) Element))
    (emit `(assert (= (document ,(sformat "~a-elt" name)) ,(sformat "~a-doc" (dom-name dom))))))
  ; The element info for a name
  (define body
    (for/fold ([body '(as nil Element)]) ([name names])
      `(ite (= x ,name) ,(sformat "~a-elt" name) ,body)))
  (emit `(define-fun ,(dom-map dom) ((x ElementName)) Element ,body))
  (for ([name names])
    (emit `(assert (not (is-nil (,(dom-map dom) ,name)))))
    (emit `(assert (= (,(dom-map dom) ,name) ,(sformat "~a-elt" name)))))
  ; Pointed map: nil goes to nil
  (emit `(assert (= (,(dom-map dom) (as nil ElementName)) (as nil Element))))
  (emit `(assert (= ,elt ,(sformat "~a-elt" (dom-root dom)))))

  (emit `(assert (= (placement-box ,elt) (flow-box ,elt))))
  (emit `(assert (= (parent ,elt) (as nil ElementName))))
  (emit `(assert (= (tagname ,elt) box/viewport)))
  (emit `(assert (= (previous ,elt) (as nil ElementName))))
  (for ([field '(x y pl pr pt pb bl br bt bb ml mr mt mb mtp mbp mtn mbn)])
    (emit `(assert (= (,field ,b) 0.0))))
  (emit `(assert (= (float ,elt) float/none)))
  (emit `(assert (! (= (w ,b) ,(rendering-context-width (dom-context dom)))
                    :named ,(sformat "~a-context-width" (dom-name dom)))))
  (emit `(assert (= (parent (,(dom-map dom) ,(elt-name (car (dom-tree dom))))) ,(dom-root dom))))
  (emit `(assert (= (previous (,(dom-map dom) ,(elt-name (car (dom-tree dom))))) (as nil ElementName))))
  (emit `(assert (= (first-child ,elt) ,(elt-name (car (dom-tree dom))))))
  (emit `(assert (= (parent ,elt) (as nil ElementName))))
  (emit `(assert (= (previous ,elt) (as nil ElementName)))))

(define (stylesheet-rules sheet)
  (for/list ([i (in-range (stylesheet-count sheet))])
    (string->symbol (format "~a-rule-~a" (stylesheet-name sheet) i))))

(define (stylesheet-constraints sheet)
  (append
   (apply append
          (for/list ([i (in-naturals)] [name (stylesheet-rules sheet)])
            `((declare-const ,name Rule)
              (assert (= (index ,name) ,i))
              (assert (=> (is-sel/id (selector ,name)) (not (= (sel.id (selector ,name)) NoID))))

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
  (define cmds (match elt [(list 'BLOCK _ cmds ...) cmds] [(list 'TEXT cmds ...) cmds]))

  (let interpret ([cmds cmds])
    (match cmds
      [(list ':print rest ...)
       (emit `(declare-const ,(sformat "~a-placement" name) Box))
       (emit `(assert (= ,(sformat "~a-placement" name) (placement-box (,(dom-map dom) ,name)))))
       (emit `(declare-const ,(sformat "~a-style" name) Style))
       (emit `(assert (= ,(sformat "~a-style" name) (rules (,(dom-map dom) ,name)))))
       (interpret rest)]
      [(list ':id id rest ...)
       (interpret rest)]
      [(list (and (or ':x ':y ':w ':h ':vw ':vh ':gap) field) value rest ...)
       (define fun
         (match field
           [':x 'x] [':y 'y] [':w 'w] [':h 'h] [':gap 'gap] [':vh 'box-height] [':vw 'box-width]))
       (emit `(assert (! (= (,fun (placement-box ,(dom-get dom elt))) ,value) :named ,(sformat "~a-~a" name fun))))
       (interpret rest)]
      [(list)
       (void)])))

(define (element-constraints dom emit elt children)
  (match elt
    [(list 'BLOCK tag constraints ...)
     (for-each emit (element-constraints-core (sformat "box/~a" tag) (elt-name elt) (dom-map dom)))]
    [(list 'TEXT constraints ...)
     (for-each emit (element-constraints-core 'box/text (elt-name elt) (dom-map dom)))]))

(define (id-constraints dom emit elt children)
  (if (memq ':id elt)
      (emit `(assert (= (id ,(dom-get dom elt)) ,(sformat "ID-~a" (cadr (memq ':id elt))))))
      (emit `(assert (= (id ,(dom-get dom elt)) NoID)))))

(define (all-constraints-of dom emit . types)
  (for* ([(elt children) (in-tree-subtrees (dom-tree dom))] [type types])
    (type dom emit elt children)))

(define (bfs*-constraints doms #:per-dom-check [pdc? #f] #:per-level-check [plc? #f] . constraints)
  (reap [sow]
        (for ([dom doms])
          (dom-root-constraints dom sow)
          (for ([level (in-dom-levels (list dom))] [id (in-naturals)])
            (for ([rec level])
              (match-define (list dom elt children) rec)
              (for ([cns constraints])
                (cns dom sow elt children)))
            (when plc?
              (sow (check-sat ':level id ':width (length level) ':heads (map caadr level)))))
          (when pdc?
            (sow (check-sat ':height (length (in-dom-levels (list dom)))
                            ':nodes (apply + (map length (in-dom-levels (list dom))))))))))


(define (bfs-constraints doms #:stop-at [n* #f] #:per-level-check [plc? #f] . constraints)
  (reap [sow]
        (for ([dom doms]) (dom-root-constraints dom sow))
        (eprintf "Levels: ~a\n" (length (in-dom-levels doms)))
        (for ([level (in-dom-levels doms)] [id (in-naturals)])
          (for ([rec level] [n (in-naturals)] #:break (and n* (> n n*)))
            (match-define (list dom elt children) rec)
            (for ([cns constraints])
              (cns dom sow elt children)))
          (when plc?
            (sow (check-sat ':level id ':width (length level) ':heads (map caadr level)))))))

(define (dfs-constraints doms . constraints)
  (reap [sow]
        (for ([dom doms]) (dom-root-constraints dom sow))
        (for* ([dom doms] [(elt children) (in-tree-subtrees (dom-tree dom))])
          (for ([cns constraints])
            (cns dom sow elt children)))))

(define (cassius-solve #:debug [debug #f] #:sheet sheet #:header header . doms)
  (define ids
    (for*/reap [id] ([dom doms] [elt (in-tree-values (dom-tree dom))] #:when (memq ':id elt))
               (id (cadr (memq ':id elt)))))
  (define tags
    (for*/reap [save] ([dom doms] [elt (in-tree-values (dom-tree dom))])
               (match elt
                 [(list 'BLOCK tag cmds ...) (save tag)]
                 [(list 'TEXT cmds ...) (void)])))

  (define problem
    `(; Preamble
      (set-option :produce-unsat-cores true)
      (declare-datatypes ()
        ((Id NoID ,@(map (curry sformat "ID-~a") (remove-duplicates ids)))
         (TagNames box/viewport box/text box/inline box/block
                   ,@(map (curry sformat "box/~a") (remove-duplicates tags)))
         (Document ,@(for/list ([dom doms]) (sformat "~a-doc" (dom-name dom))))
         (ElementName
          ,@(for*/list ([dom doms] [elt (in-tree-values (dom-tree dom))]) (elt-name elt))
          ,@(for/list ([dom doms]) (dom-root dom))
          nil)))
      ,@css-declarations

      ,@box-functions
      ; Defining some terms
      ,element-type
      ,@css-functions

      ; Stylesheet
      ,@(stylesheet-constraints sheet)
      ; DOMs
      ,@(dfs-constraints
         doms
         tree-constraints id-constraints user-constraints element-constraints style-constraints)
      (apply propagate-values)
      (check-sat :data 1)))

  (print-rules #:stylesheet sheet #:header header
               (solve #:debug debug (z3-prepare problem))))
