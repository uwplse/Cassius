#lang racket
(require "common.rkt")
(require "dom.rkt")
(require "smt.rkt")
(require "css-rules.rkt")
(require "css-properties.rkt")
(require "browser-style.rkt")
(require "spec/tree.rkt")
(require "spec/layout.rkt")
(require "spec/cascade.rkt")
(require unstable/sequence)
(require srfi/1)

(provide all-constraints unsat-constraint-info print-rules reset!)

(define (in-empty) (in-list empty))

(define (r2 x) (~r x #:precision 2))

(define boxes-to-print (make-hash))

(define (reset!)
  (set! boxes-to-print (make-hash))
  (reset-elt-names!))

(define (print-rules #:stylesheet [stylesheet #f] #:header [header ""] smt-out)
  (for ([(name type) (in-pairs (sort (hash->list boxes-to-print) symbol<? #:key car))])
    (eprintf "~a ~a" name (print-type type (hash-ref smt-out name))))

  (when (> (string-length header) 0)
    (printf "/* Pre-generated header */\n\n~a\n\n/* Generated code below */\n" header))

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
  [((or 'Width 'Height 'Margin 'Padding 'Border) (? (css-type-ending? "0%"))) "0%"]
  [((or 'Width 'Height 'Margin 'Padding 'Border) (? (css-type-ending? "1%"))) "1%"]
  [((or 'Width 'Height 'Margin 'Padding 'Border) (? (css-type-ending? "2%"))) "2%"]
  [((or 'Width 'Height 'Margin 'Padding 'Border) (? (css-type-ending? "50%"))) "50%"]
  [((or 'Width 'Height 'Margin 'Padding 'Border) (? (css-type-ending? "100%"))) "100%"]
  [('Float _) (last (string-split (~a value) "/"))]
  [('TextAlign _) (last (string-split (~a value) "/"))]
  [('Selector 'sel/all) "*"]
  [('Selector `(sel/id ,id)) (format "#~a" (substring (~a id) 3))]
  [('Selector `(sel/tag ,tag)) (substring (~a tag) 4)]
  [('Box `(box ,type ,x ,y ,w ,h ,mt ,mr ,mb ,ml ,mtp ,mtn ,mbp ,mbn ,pt ,pr ,pb ,pl ,bt ,br ,bb ,bl ,stfw ,pbname ,n ,v ,flt ,flt-up ,e))
   (with-output-to-string
     (lambda ()
       (printf "~a ~a×~a at x ~a / y ~a\n" type (r2 (+ pl pr w)) (r2 (+ pt pb h)) (r2 x) (r2 y))
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

(define (tree-constraints dom emit elt)
  (define root (dom-root dom))

  (define fields
    `((parent-name . ,element-parent)
      (previous-name . ,element-prev)
      (next-name . ,element-next)
      (first-child-name . ,element-fchild)
      (last-child-name . ,element-lchild)))

  ;; TODO: This is a hack--the root element isn't actually part of the tree.
  ;; We should eliminate the root element, and things will be better.
  (when (not (element-parent elt)) (set! fields (cdr fields)))

  (for ([(field fn) (in-pairs fields)])
    (emit `(assert (= (,field (get/elt ,(element-name elt)))
                      ,(let ([elt* (fn elt)]) (if elt* (element-name elt*) 'nil-elt)))))))

(define ((style-constraints rules) dom emit elt)
  (when (member (element-type elt) '(INLINE BLOCK))
    (for-each emit (cascade-rules (rules) elt))))

(define (dom-define-get/elt doms emit)
  (define dom-names
    (for/list ([dom doms])
      (cons (dom-root dom) (for/list ([elt (in-tree (dom-tree dom))]) (element-name elt)))))

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
    (emit `(assert (= (get/elt ,name) ,(sformat "~a-elt" name))))
    (emit `(assert (is-elt (get/elt ,name)))))
  ; Pointed map: nil goes to nil
  (emit `(assert (= (get/elt nil-elt) no-elt))))

(define (dom-define-get/box doms emit)
  (define dom-names
    (for/list ([dom doms])
      (cons (dom-root dom) (for/list ([elt (in-tree (dom-tree dom))]) (element-name elt)))))

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
    (emit `(assert (= (get/box ,(sformat "~a-flow" name)) ,(sformat "~a-flow-box" name))))
    (emit `(assert (is-box ,(sformat "~a-flow-box" name)))))
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
  (emit `(assert (= (parent-name (get/elt ,(element-name (dom-tree dom)))) ,(dom-root dom))))
  (emit `(assert (= (previous-name (get/elt ,(element-name (dom-tree dom)))) nil-elt)))
  (emit `(assert (= (next-name (get/elt ,(element-name (dom-tree dom)))) nil-elt)))
  (emit `(assert (= (first-child-name ,elt) ,(element-name (dom-tree dom)))))
  (emit `(assert (= (parent-name ,elt) nil-elt)))
  (emit `(assert (= (previous-name ,elt) nil-elt)))
  (emit `(assert (= (next-name ,elt) nil-elt)))
  (emit `(assert (a-root-element ,elt))))

(define (stylesheet-constraints sname sheet save-rule #:browser [browser? #f])
  (for/reap [emit] ([i (in-naturals)] [rule sheet])
            (define name (sformat "rule-~a-~a" sname i))
            (save-rule name rule)

            (emit `(declare-const ,name Rule))
            (emit `(assert (is-a-rule ,name ,(if browser? 'UserAgent 'AuthorNormal) ,i)))

            (define sel (selector->z3 (selector name rule)))
            (when sel (emit `(assert (= (selector ,name) ,sel))))

            (match rule
              ['? (void)]
              [(list _ pairs ... '?)
               (for ([(a-prop type default) (in-css-properties)])
                 (match (assoc a-prop pairs)
                   [(list _ '?)
                    (emit `(assert (! (= (,(sformat "rule.~a?" a-prop) ,name) true)
                                      :named ,(sformat "rule-~a-~a-~a-?" name i a-prop))))]
                   [(list _ val)
                    (emit `(assert (! (= (,(sformat "rule.~a?" a-prop) ,name) true)
                                      :named ,(sformat "rule-~a-~a-~a-?" name i a-prop))))
                    (emit `(assert (! (= (,(sformat "rule.~a" a-prop) ,name) ,val)
                                      :named ,(sformat "rule-~a-~a-~a-val" name i a-prop))))]
                   [#f (void)]))]
              [(list _ pairs ...)
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

(define (user-constraints dom emit elt)
  (define name (element-name elt))
  (for ([(cmd arg) (in-groups 2 (element-attrs elt))])
    (match cmd
      [':print
       (hash-set! boxes-to-print (sformat "~a-flow-box" name) 'Box)]
      [':style
       (hash-set! boxes-to-print (sformat "~a.style" name) 'Style)
       (emit `(declare-const ,(sformat "~a.style" name) Style))
       (emit `(assert (= ,(sformat "~a.style" name) (rules (get/elt ,(element-name elt))))))]
      [(or ':x ':y ':w ':h ':ml ':mr ':mt ':mb)
       (define mapping
         '((:x x) (:y y) (:h box-height) (:w box-width)
           (:ml ml) (:mr mr) (:mt mt) (:mb mb)))
       (define fun (cadr (assoc cmd mapping)))
       (when ;; HTML elements have weird heights
           (not (and (equal? cmd ':h) (equal? (element-get elt ':tag) 'html)))
         (emit `(assert (! (= (,fun (get/box (flow-box (get/elt ,name)))) ,arg) :named ,(sformat "~a-~a" name fun)))))]
      [':id (void)]
      [':tag (void)]
      [':text (void)])))

(define (element-constraints dom emit elt)
  (emit `(assert (an-element (get/elt ,(element-name elt))))))

(define (box-link-constraints dom emit elt)
  (define cns
    (match (element-type elt)
      ['BLOCK 'link-block-box]
      ['ANON 'link-block-box]
      ['MAGIC 'link-block-box]
      ['LINE 'link-line-box]
      ['INLINE 'link-inline-box]
      ['TEXT 'link-text-box]))
  (emit `(assert (,cns (get/box (flow-box (get/elt ,(element-name elt))))))))

(define (box-constraints dom emit elt)
  (define cns
    (match (element-type elt)
      ['BLOCK 'a-block-box]
      ['ANON 'a-block-box]
      ['MAGIC 'a-block-box]
      ['LINE 'a-line-box]
      ['INLINE 'an-inline-box]
      ['TEXT 'a-text-box]))
  (emit `(assert (,cns ,(sformat "~a-flow-box" (element-name elt))))))

(define (info-constraints dom emit elt)
  (define tagname
    (if (element-get elt ':tag) (sformat "tag/~a" (slower (element-get elt ':tag))) 'no-tag))
  (define idname
    (if (element-get elt ':id) (sformat "id/~a" (slower (element-get elt ':id))) 'no-id))
  (define display
    (match (element-type elt)
      ['BLOCK 'display/block]
      ['ANON 'display/block]
      ['MAGIC 'display/block]
      ['INLINE 'display/inline]
      ['TEXT 'display/inline]
      ['LINE 'display/block]))

  (emit `(assert (= (tagname (get/elt ,(element-name elt))) ,tagname)))
  (emit `(assert (= (id (get/elt ,(element-name elt))) ,idname)))
  (emit `(assert (= (display (get/elt ,(element-name elt))) ,display))))

(define (getter-definitions doms)
  (reap [sow]
        (dom-define-get/elt doms sow)
        (dom-define-get/box doms sow)))

(define (dfs-constraints doms . constraints)
  (reap [sow]
        (for ([dom doms]) (dom-root-constraints dom sow))
        (for ([cns constraints])
          (sow `(echo ,(format "Generating ~a" (object-name cns))))
          (for* ([dom doms] [elt (in-tree (dom-tree dom))])
            (cns dom sow elt)))))

(define (all-constraints sheet doms)
  (define-values (tags ids)
    (reap [save-tag save-id]
          (for* ([dom doms] [elt (in-tree (dom-tree dom))])
            (when (element-get elt ':id) (save-id (sformat "id/~a" (slower (element-get elt ':id)))))
            (when (element-get elt ':tag) (save-tag (sformat "tag/~a" (slower (element-get elt ':tag))))))
          (for ([rule sheet])
            (match rule
              ['? (void)]
              [`((tag ,tag) ,_ ...) (save-tag (sformat "tag/~a" (slower tag)))]
              [`((id ,id) ,_ ...) (save-id (sformat "id/~a" (slower id)))]
              [_ (void)]))))

  (define browsers (remove-duplicates (map (compose rendering-context-browser dom-context) doms)))
  (unless (= (length browsers) 1)
    (error "Different browsers on different documents not yet supported"))

  (define browser-style
    (for/reap [save] ([(sel props) (in-pairs (get-sheet (car browsers)))])
              (match sel
                ['any (save (cons sel props))]
                [`(tag ,tag)
                 (when (memq (sformat "tag/~a" (slower tag)) tags) (save (cons sel props)))])))

  (define element-names
    (append
     (for*/list ([dom doms] [elt (in-tree (dom-tree dom))]) (element-name elt))
     (for/list ([dom doms]) (dom-root dom))))
  (define box-names (map (curry sformat "~a-flow") element-names))

  (define rules '())
  (define (save-rule x rule) (set! rules (cons (cons x rule) rules)))

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
      (ElementName ,@element-names nil-elt)
      (BoxName ,@box-names nil-box)))
    ,@css-declarations
    ,@tree-types
    ,@(getter-definitions doms)
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
