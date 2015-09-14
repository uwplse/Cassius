#lang racket
(require "dom.rkt")
(require "smt.rkt")
(require "css-rules.rkt")
(require "spec/tree.rkt")
(require "spec/link.rkt")
(require "spec/layout.rkt")
(require "common.rkt")
(require "css-properties.rkt")
(require "browser-style.rkt")
(require unstable/sequence)
(require srfi/1)

(provide all-constraints unsat-constraint-info print-rules)

(define (in-empty) (in-list empty))

(define (in-groups n s)
  (if (null? s)
      (in-empty)
      (let-values ([(hd tail) (split-at s n)])
        (in-sequences
         (apply in-parallel (map in-value hd))
         (in-groups n tail)))))

(define (r2 x) (~r x #:precision 2))

(define boxes-to-print (make-hash))

(define (print-rules #:stylesheet [stylesheet #f] #:header [header ""] smt-out)
  (for ([(name type) (in-hash boxes-to-print)])
    (eprintf "~a ~a" name (print-type type (hash-ref smt-out name))))

  (printf "/* Pre-generated header */\n\n~a\n\n/* Generated code below */\n" header)

  (for ([rule-value (map (curry hash-ref smt-out)
                         (for/list ([i (in-naturals)] [rule stylesheet]) (sformat "rule-user-~a" i)))])
    (printf "\n~a\n" (print-type 'Rule rule-value))))

(define (css-type-ending? v)
  (lambda (x) (string=? (last (string-split (~a x) "/")) v)))

(define/match (print-type type value)
  [((or 'Width 'Height 'Margin 'Padding 'Border) (? (css-type-ending? "auto"))) "auto"]
  [((or 'Width 'Height 'Margin 'Padding 'Border) (list _ 0.0)) "0"]
  [((or 'Width 'Height 'Margin 'Padding 'Border) (list (? (css-type-ending? "px")) x)) (format "~apx" x)]
  [((or 'Width 'Height 'Margin 'Padding 'Border) (list (? (css-type-ending? "pct")) x)) (format "~a%" x)]
  [('Float _) (last (string-split (~a value) "/"))]
  [('TextAlign _) (last (string-split (~a value) "/"))]
  [('Selector 'sel/all) "*"]
  [('Selector `(sel/id ,id)) (format "#~a" (substring (~a id) 3))]
  [('Selector `(sel/tag ,tag)) (substring (~a tag) 4)]
  [('Box `(box ,type ,x ,y ,w ,h ,mt ,mr ,mb ,ml ,mtp ,mtn ,mbp ,mbn ,pt ,pr ,pb ,pl ,bt ,br ,bb ,bl ,p ,f ,l ,n ,vnf ,vff ,e))
   (with-output-to-string
     (lambda ()
       (printf "~a ~a×~a at (y ~a, x ~a)\n" type (r2 (+ pl pr w)) (r2 (+ pt pb h)) (r2 y) (r2 x))
       (printf "margin:  ~a (+~a-~a) ~a ~a (+~a-~a) ~a\n"
                (r2 mt) (r2 mtp) (r2 (abs mtn)) (r2 mr)
                (r2 mb) (r2 mbp) (r2 (abs mbn)) (r2 ml))
       (printf "border:  ~a ~a ~a ~a\n" (r2 bt) (r2 br) (r2 bb) (r2 bl))
       (printf "padding: ~a ~a ~a ~a\n" (r2 pt) (r2 pr) (r2 pb) (r2 pl))))]
  [('Style (list 'style rest ...))
   (with-output-to-string
     (lambda ()
       (printf " {\n")
       (for ([(value score) (in-groups 2 rest)] [(prop type default) (in-css-properties)])
         (printf "  ~a: ~a; /* ~a */ \n" prop (print-type type value) score))
       (printf "}\n")))]
  [('Rule (list 'rule sel idx origin rest ...))
   (define props
     (for/hash ([(value enabled?) (in-groups 2 rest)] [(prop type default) (in-css-properties)]
                #:when enabled?)
       (values prop (list type value))))
   (with-output-to-string
     (lambda ()
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
         (printf "}"))))])

(define (tree-constraints dom emit elt children)
  (define elt-get (curry dom-get dom))
  (define root (dom-root dom))

  (define (get-child children accessor)
    (if (null? children) 'nil-elt (elt-name (car (accessor children)))))

  ; Parent element
  (for ([child (sequence-map car children)])
    (emit `(assert (= (parent-name ,(elt-get child)) ,(elt-name elt)))))
  ; Previous element
  (for ([child (sequence-map car children)]
        [prev (sequence-append (in-value 'nil-elt) (sequence-map (compose elt-name car) children))]
        [next (sequence-tail (sequence-append (sequence-map (compose elt-name car) children) (in-value 'nil-elt)) 1)])
    (emit `(assert (= (previous-name ,(elt-get child)) ,prev)))
    (emit `(assert (= (next-name ,(elt-get child)) ,next))))

  ; First/last child
  (emit `(assert (= (first-child-name ,(elt-get elt)) ,(get-child children first))))
  (emit `(assert (= (last-child-name ,(elt-get elt)) ,(get-child children last)))))

(define ((style-constraints rules) dom emit elt children)
  (define e (dom-get dom elt))
  (define re `(rules ,e))

  (when (member (car elt) '(INLINE BLOCK))
    ; Score of computed rule is >= any applicable stylesheet rule
    (for* ([type css-properties] [property (cdr type)]
           [rule (rules)])
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
                      ,@(for/list ([rule (rules)])
                          `(and
                            (,(sformat "rule.~a?" property) ,rule)
                            (selector-applies? (selector ,rule) ,e)
                            (= (,(sformat "style.~a$" property) ,re) (score ,rule))
                            (= (,(sformat "style.~a" property) ,re)
                               (,(sformat "rule.~a" property) ,rule))))))))))

(define (dom-define-get/elt doms emit)
  (define dom-names
    (for/list ([dom doms])
      (cons (dom-root dom) (for/list ([elt (in-tree-values (dom-tree dom))]) (elt-name elt)))))

  ; The type of element names
  (for ([dom doms] [names dom-names] #:when #t [name names])
    (emit `(declare-const ,(sformat "~a-elt" name) Element))
    (emit `(assert (= (document ,(sformat "~a-elt" name)) ,(sformat "~a-doc" (dom-name dom))))))
  ; The element info for a name
  (define body
    (for*/fold ([body 'no-elt]) ([names dom-names] [name names])
      `(ite (,(sformat "is-~a" name) x) ,(sformat "~a-elt" name) ,body)))
  (emit `(define-fun get/elt ((x ElementName)) Element ,body))
  (for* ([names dom-names] [name names])
    (emit `(assert (not (is-no-elt (get/elt ,name)))))
    (emit `(assert (= (get/elt ,name) ,(sformat "~a-elt" name)))))
  ; Pointed map: nil goes to nil
  (emit `(assert (= (get/elt nil-elt) no-elt))))

(define (dom-define-get/box doms emit)
  (define dom-names
    (for/list ([dom doms])
      (cons (dom-root dom) (for/list ([elt (in-tree-values (dom-tree dom))]) (elt-name elt)))))

  (for ([dom doms] [names dom-names] #:when #t [name names])
    (emit `(declare-const ,(sformat "~a-flow-box" name) Box))
    (emit `(assert (= (element ,(sformat "~a-flow-box" name)) ,name)))
    (emit `(assert (= (flow-box  ,(sformat "~a-elt" name)) ,(sformat "~a-flow" name)))))
  (emit `(assert (= (element no-box) nil-elt)))

  (define body
    (for*/fold ([body 'no-box]) ([names dom-names] [name names])
      `(ite (,(sformat "is-~a-flow" name) x) ,(sformat "~a-flow-box" name) ,body)))
  (emit `(define-fun get/box ((x BoxName)) Box ,body))
  (for* ([names dom-names] [name names])
    (emit `(assert (not (is-no-box ,(sformat "~a-flow-box" name)))))
    (emit `(assert (= (get/box ,(sformat "~a-flow" name)) ,(sformat "~a-flow-box" name)))))
  (emit `(assert (= (get/box nil-box) no-box)))
  (emit `(assert (= (flow-box no-elt) nil-box))))

(define (dom-root-constraints dom emit)
  (define elt `(get/elt ,(dom-root dom)))
  (define b `(get/box (flow-box ,elt)))

  (emit `(echo ,(format "Defining the ~a root element" (dom-name dom))))
  (emit `(assert (= ,elt ,(sformat "~a-elt" (dom-root dom)))))
  (emit `(assert (= (flow-box ,(sformat "~a-elt" (dom-root dom))) ,(sformat "~a-flow" (dom-root dom)))))
  (emit `(assert (= (float ,elt) float/none)))
  (emit `(assert (! (= (w ,b) ,(rendering-context-width (dom-context dom)))
                    :named ,(sformat "~a-context-width" (dom-name dom)))))
  (emit `(assert (= (parent-name (get/elt ,(elt-name (car (dom-tree dom))))) ,(dom-root dom))))
  (emit `(assert (= (previous-name (get/elt ,(elt-name (car (dom-tree dom))))) nil-elt)))
  (emit `(assert (= (next-name (get/elt ,(elt-name (car (dom-tree dom))))) nil-elt)))
  (emit `(assert (= (first-child-name ,elt) ,(elt-name (car (dom-tree dom))))))
  (emit `(assert (= (parent-name ,elt) nil-elt)))
  (emit `(assert (= (previous-name ,elt) nil-elt)))
  (emit `(assert (= (next-name ,elt) nil-elt)))
  (emit `(assert (a-root-element ,elt))))

(define (stylesheet-constraints sname sheet save-rule #:browser [browser? #f])
  (for/reap [emit] ([i (in-naturals)] [rule sheet])
            (define name (sformat "rule-~a-~a" sname i))
            (save-rule name)

            (emit `(declare-const ,name Rule))
            (emit `(assert (is-a-rule ,name ,(if browser? 'UserAgent 'AuthorNormal) ,i)))

            (match rule
              ['? (void)]
              [(list sel pairs ... '?)
               (emit `(assert (= (selector ,name) ,sel)))
               (for ([(a-prop type default) (in-css-properties)])
                 (match (assoc a-prop pairs)
                   [(list _ '?)
                    (emit `(assert (= (,(sformat "rule.~a?" a-prop) ,name) true)))]
                   [(list _ val)
                    (emit `(assert (= (,(sformat "rule.~a?" a-prop) ,name) true)))
                    (emit `(assert (= (,(sformat "rule.~a" a-prop) ,name) ,val)))]
                   [#f (void)]))]
              [(list sel pairs ...)
               (emit `(assert (= (selector ,name) ,sel)))
               (for ([(a-prop type default) (in-css-properties)])
                 (match (assoc a-prop pairs)
                   [(list _ '?)
                    (emit `(assert (= (,(sformat "rule.~a?" a-prop) ,name) true)))]
                   [(list _ val)
                    (emit `(assert (= (,(sformat "rule.~a?" a-prop) ,name) true)))
                    (emit `(assert (= (,(sformat "rule.~a" a-prop) ,name) ,val)))]
                   [#f
                    (emit `(assert (= (,(sformat "rule.~a?" a-prop) ,name) false)))]))])

              ; Optimize for short CSS
            (when (memq 'opt (flags))
              ; Each enabled property costs one line
              (for* ([type css-properties] [property (cdr type)])
                (emit `(assert-soft (not (,(sformat "rule.~a?" property) ,name)) :weight 1)))
              ; Each block with an enabled property costs two line (open/selector and close brace)
              (emit
               `(assert-soft
                 (and ,@(for*/list ([type css-properties] [property (cdr type)])
                          `(not (,(sformat "rule.~a?" property) ,name))))
                 :weight 2))
              ; Each shorthand rule can save space if all its properties exist
              (for ([(short-name subproperties) (in-pairs css-shorthand-properties)])
                (emit `(assert-soft
                        (and ,@(for/list ([subprop subproperties])
                                 (list (sformat "rule.~a?" subprop) name)))
                        :weight 3))))))

(define (user-constraints dom emit elt children)
  (define name (elt-name elt))
  (define cmds (cdr elt))

  (let interpret ([cmds cmds])
    (match cmds
      [(list ':print rest ...)
       (hash-set! boxes-to-print (sformat "~a-flow-box" name) 'Box)
       (interpret rest)]
      [(list ':style rest ...)
       (hash-set! boxes-to-print (sformat "~a.style" name) 'Style)
       (emit `(declare-const ,(sformat "~a.style" name) Style))
       (emit `(assert (= ,(sformat "~a.style" name) (rules ,(dom-get dom elt)))))
       (interpret rest)]
      [(list (and (or ':x ':y ':w ':h ':ml ':mr ':mt ':mb) field) value rest ...)
       (define mapping
         '((:x x) (:y y) (:h box-height) (:w box-width)
           (:ml ml) (:mr mr) (:mt mt) (:mb mb)))
       (define fun (cadr (assoc field mapping)))
       (when (or true (memq (car elt) '(TEXT MAGIC)))
         (emit `(assert (! (= (,fun (get/box (flow-box ,(dom-get dom elt)))) ,value) :named ,(sformat "~a-~a" name fun)))))
       (interpret rest)]
      [(list ':id id rest ...) (interpret rest)]
      [(list ':tag tag rest ...) (interpret rest)]
      [(list ':text txt rest ...) (interpret rest)]
      [(list) (void)])))

(define (element-constraints dom emit elt children)
  (emit `(assert (an-element ,(dom-get dom elt)))))

(define (box-link-constraints dom emit elt children)
  (define cns
    (match (car elt)
      ['BLOCK 'link-block-box]
      ['MAGIC 'link-block-box]
      ['LINE 'link-line-box]
      ['INLINE 'link-inline-box]
      ['TEXT 'link-text-box]))
  (emit `(assert (,cns (get/box (flow-box ,(dom-get dom elt)))))))

(define (box-constraints dom emit elt children)
  (define cns
    (match (car elt)
      ['BLOCK 'a-block-box]
      ['MAGIC 'a-block-box]
      ['LINE 'a-line-box]
      ['INLINE 'an-inline-box]
      ['TEXT 'a-text-box]))
  (emit `(assert (,cns ,(sformat "~a-flow-box" (elt-name elt))))))

(define (info-constraints dom emit elt children)
  (define tagname
    (if (memq ':tag elt) (sformat "tag/~a" (slower (cadr (memq ':tag elt)))) 'no-tag))
  (define idname
    (if (memq ':id elt) (sformat "id/~a" (slower (cadr (memq ':id elt)))) 'no-id))
  (define display
    (match (car elt)
      ['BLOCK 'display/block]
      ['MAGIC 'display/block]
      ['INLINE 'display/inline]
      ['TEXT 'display/inline]
      ['LINE 'display/block]))

  (emit `(assert (= (tagname ,(dom-get dom elt)) ,tagname)))
  (emit `(assert (= (id ,(dom-get dom elt)) ,idname)))
  (emit `(assert (= (display ,(dom-get dom elt)) ,display))))

(define (getter-definitions doms)
  (reap [sow]
        (dom-define-get/elt doms sow)
        (dom-define-get/box doms sow)))

(define (dfs-constraints doms . constraints)
  (reap [sow]
        (for ([dom doms]) (dom-root-constraints dom sow))
        (for ([cns constraints])
          (sow `(echo ,(format "Generating ~a" (object-name cns))))
          (for* ([dom doms] [(elt children) (in-tree-subtrees (dom-tree dom))])
            (cns dom sow elt children)))))

(define (all-constraints sheet doms)
  (define-values (tags ids)
    (reap [save-tag save-id]
          (for* ([dom doms] [elt (in-tree-values (dom-tree dom))])
            (when (memq ':id elt) (save-id (sformat "id/~a" (slower (cadr (memq ':id elt))))))
            (when (memq ':tag elt) (save-tag (sformat "tag/~a" (slower (cadr (memq ':tag elt)))))))
          (for ([rule sheet])
            (match rule
              ['? (void)]
              [`((sel/tag ,tag) ,_ ...) (save-tag (slower tag))]
              [`((sel/id ,id) ,_ ...) (save-id (slower id))]))))

  (define browsers (remove-duplicates (map (compose rendering-context-browser dom-context) doms)))
  (unless (= (length browsers) 1)
    (error "Different browsers on different documents not yet supported"))

  (define browser-style
    (for/reap [save] ([(sel props) (in-pairs (get-sheet (car browsers)))])
              (match sel
                ['sel/any (save (cons sel props))]
                [`(sel/tag ,tag)
                 (when (memq (slower tag) tags) (save (cons sel props)))])))

  (define elt-names
    (append
     (for*/list ([dom doms] [elt (in-tree-values (dom-tree dom))]) (elt-name elt))
     (for/list ([dom doms]) (dom-root dom))))

  (define rules '())
  (define (save-rule x) (set! rules (cons x rules)))

  (define constraints
    (list tree-constraints info-constraints user-constraints element-constraints
          box-link-constraints box-constraints
          (procedure-rename (style-constraints (lambda () rules)) 'cascade-constraints)))

  `((set-option :produce-unsat-cores true)
    (echo "Basic definitions")
    (declare-datatypes
     () ; No parameters
     ((Id no-id ,@(remove-duplicates ids))
      (TagNames no-tag ,@(remove-duplicates tags))
      (Document ,@(for/list ([dom doms]) (sformat "~a-doc" (dom-name dom))))
      (ElementName ,@elt-names nil-elt)
      (BoxName
       ,@(map (curry sformat "~a-flow") elt-names)
       nil-box)))
    ,@css-declarations
    ,@dom-declarations
    ,@(getter-definitions doms)
    ,@tree-helpers
    ,@css-functions
    ,@link-definitions
    ,@layout-definitions

    ; Stylesheet
    (echo "Browser stylesheet")
    ,@(stylesheet-constraints (car browsers) browser-style save-rule #:browser #t)
    (echo "Defining the stylesheet")
    ,@(stylesheet-constraints 'user sheet save-rule)
    ; DOMs
    ,@(apply dfs-constraints doms constraints)

    (check-sat)))

(define (unsat-constraint-info constraint)
  (elt-from-name (string->symbol (first (string-split (~a constraint) "-")))))
