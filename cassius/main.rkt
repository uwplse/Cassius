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
(require srfi/13)

(provide all-constraints add-test print-rules print-unsat-core reset!)

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
                         (for/list ([i (in-naturals)] [rule stylesheet]) (sformat "user/~a" i)))])
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
  [((or 'Width 'Height 'Margin 'Padding 'Border) (? (css-type-ending? "inherit"))) "inherit"]
  [('Float _) (last (string-split (~a value) "/"))]
  [('TextAlign _) (last (string-split (~a value) "/"))]
  [('Selector 'sel/all) "*"]
  [('Selector `(sel/id ,id)) (format "#~a" (substring (~a id) 3))]
  [('Selector `(sel/tag ,tag)) (substring (~a tag) 4)]
  [('Box `(box ,type ,x ,y ,w ,h ,mt ,mr ,mb ,ml ,mtp ,mtn ,mbp ,mbn ,pt ,pr ,pb ,pl ,bt ,br ,bb ,bl ,stfw ,pbname ,n ,v ,flt ,flt-up ,e))
   (with-output-to-string
     (lambda ()
       (printf "~a ~a×~a at x ~a / y ~a\n" type (r2 (+ bl br pl pr w)) (r2 (+ bt bb pt pb h)) (r2 x) (r2 y))
       (printf "margin:  ~a (+~a-~a) ~a ~a (+~a-~a) ~a\n"
                (r2 mt) (r2 mtp) (r2 (abs mtn)) (r2 mr)
                (r2 mb) (r2 mbp) (r2 (abs mbn)) (r2 ml))
       (printf "border:  ~a ~a ~a ~a\n" (r2 bt) (r2 br) (r2 bb) (r2 bl))
       (printf "padding: ~a ~a ~a ~a\n" (r2 pt) (r2 pr) (r2 pb) (r2 pl))
       (printf "stw ~a\n" stfw)))]
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

(define (print-unsat-core query vars doms stylesheet)
  (define (parse-var var)
    (for/list ([part (string-split (~a var) "^")])
      (match (string-split part "/")
        [(list _) part]
        [(list parts ...) (map (curryr with-input-from-string read) parts)])))

  (define (parsed->elt parsed)
    (for/first ([part parsed] #:when (list? part) [symbol part]
                #:when (string-prefix? "elt$" (~a symbol)))
      (elt-from-name (string->symbol (car (string-split (~a symbol) "-"))))))

  (define asserts (make-hash))
  (for ([cmd query])
    (match cmd
      [`(assert (! ,expr ,_ ... :named ,name ,_ ...)) (hash-set! asserts name expr)]
      [_ (void)]))

  (define elts (make-hash))

  (for ([var vars])
    (define parsed (parse-var var))
    (define elt (parsed->elt parsed))
    (hash-set! elts elt (cons (cons var parsed) (hash-ref elts elt '()))))

  (define (describe-line var line elt)
    (match line
      [`((,(and (or 'x 'y 'box-width 'box-height 'mt 'mr 'mb 'ml) field) ,_))
       (define field-name
         (match field ['x ':x] ['y ':y] ['box-width ':w] ['box-height ':h]
           ['mt ':mt] ['mr ':mr] ['mb ':mb] ['ml ':ml]))
       (format "You gave ~a ~a" field-name (element-get elt field-name))]
      [`((y ,_)) (format "You gave :y ~a" (element-get elt ':y))]
      [`((box-width ,_)) (format "You gave :w ~a" (element-get elt ':w))]
      [`((box-height ,_)) (format "You gave :h ~a" (element-get elt ':h))]
      [`((box root ,_) (zero-xybpm ,_)) (void)]
      [`((box block ,_) (positive-bpwh ,_ ,_))
       "Borders, paddings, width, and height must all be non-negative"]
      [`((box block ,_) (flow ,_) (flow-width-overflow ,_ ,_))
       (format "If the given L/R margins and width overflow, ignore the right margin")]
      [`((box block ,_) (flow ,_) (flow-width-wauto ,_ ,_))
       (format "If { width: auto } and the margins don't overflow, expand the element to fill the available width")]
      [`((box block ,_) (flow ,_) (flow-width-center ,_ ,_))
       (format "If { margin-left: auto; margin-right: auto } and the width doesn't overflow, center the element")]
      [`((box block ,_) (flow ,_) (flow-width-ordinary ,_ ,_))
       (format "If the width is given, ignore auto margins and the right margin if necessary")]
      [`((box block ,_) (flow ,_) (flow-x ,_ ,_))
       (format "The X-position is the parent's left content edge plus the left margin")]
      [`((box block ,_) (flow ,_) (flow-fill-width ,_ ,_))
       (format "In-flow block boxes fill the horizontal width")]
      [`((box block ,_) (flow ,_) (flow-mt-auto ,_ ,_))
       (format "{ margin-top: auto } means no top margin")]
      [`((box block ,_) (flow ,_) (flow-mb-auto ,_ ,_))
       (format "{ margin-bottom: auto } means no top margin")]
      [`((box block ,_) (flow ,_) (from-style ,prop ,_ ,_))
       (format "~a is used straight from the computed style" prop)]
      [`((box block ,_) (flow ,_) (auto-height ,prop ,_ ,_))
       (format "Since height is auto, height is computed based on the children" prop)]
      [`((box block ,_) (!flow ,_) (no-collapse ,_ ,_))
       (format "Margins of floating boxes don't collapse")]
      [`((box line ,_) (line-no-mbp ,_))
       (format "Line boxes do not have margins, padding, or borders")]
      [`((box line ,_) (lines-dont-float ,_))
       (format "Line boxes do not float")]
      [`((box line ,_) (skip-float ,_))
       (format "Y position after preceding floats")]
      [`((box line ,_) (top-of-parent ,_))
       (format "Y position at the top of the parent block")]
      [`((box line ,_) (follow-previous-line ,_))
       (format "Y position after previous line")]
      [`((cascade eq ,_ ,prop) ,num)
       (match (hash-ref asserts var)
         [`(= (,_ (rules ,_)) ,val)
          (format "Default style is { ~a: ~a; }" prop (print-type (css-type prop) val))]
         [line (format "Computed style with, ~a" line)])]
      [`((root ,prop ,_))
       (for/first ([(prop* type default) (in-css-properties)] #:when (eq? prop prop*))
         (format "The root box has { ~a: ~a; }" prop (print-type type default)))]
      [_ (format "~a: ~a" line (hash-ref asserts var))]))

  (define (print-rule-core rules)
    (for ([(sheet-name rules) (in-hash (trieify (map cdadr rules)))])
      (printf "~a.css:\n" sheet-name)
      (define sheet* (or (get-sheet sheet-name) stylesheet))
      (for ([(rule-id props) (in-hash rules)])
        (define rule* (list-ref sheet* rule-id))
        (printf "  ~a {" (print-type 'Selector (selector->z3 (car rule*))))
        (for ([prop props] #:when (not (member prop '(selector a-rule))))
          (define val (cadr (assoc prop (cdr rule*))))
          (printf " ~a: ~a;" prop (print-type (css-type prop) val)))
        (printf " }\n"))
      (printf "\n")))

  (define keys (hash-keys elts))
  (define (key<? x y)
    (cond [(not x) #t]
          [(not y) #f]
          [else (symbol<? (element-name x) (element-name y))]))
  (printf "\n")
  (for ([elt (sort keys key<?)])
    (cond
     [elt
      (printf "~a:\n" elt)
      (for ([(var parsed) (in-pairs (hash-ref elts elt))])
        (printf "  ~a\n" (describe-line var parsed elt)))
      (printf "\n")]
     [(not elt)
      (define-values (rules root)
        (for/reap [rule root] ([(var parsed) (in-pairs (hash-ref elts elt))])
          (match parsed
            [`((rule ,_ ...)) (rule (cons var parsed))]
            [_ (root (cons var parsed))])))
      (print-rule-core rules)
      (printf "[VIEW]:\n")
      (for ([(var parsed) (in-pairs root)])
        (printf "  ~a\n" (describe-line var parsed elt)))
      (printf "\n")])))

(define (tree-constraints dom emit elt)
  (define (either field default)
    (let ([e (field elt)])
      (if e (element-name e) default)))
  (emit
   `(assert
     (!
      (link-element (get/elt ,(element-name elt))
                    ,(sformat "~a-doc" (dom-name dom))
                    ,(either element-parent (dom-root dom)) ; TODO: Kill the root element
                    ,(either element-prev 'nil-elt)
                    ,(either element-next 'nil-elt)
                    ,(either element-fchild 'nil-elt)
                    ,(either element-lchild 'nil-elt))
      :named ,(sformat "tree/~a" (element-name elt))))))

(define ((style-constraints rules) dom emit elt)
  (when (member (element-type elt) '(INLINE BLOCK))
    (for-each emit (cascade-rules (rules) elt))))

(define (box-element-constraints dom emit elt)
  (define ename (element-name elt))
  (emit `(assert (! (link-element-box ,ename ,(sformat "~a-flow" ename))
                    :named ,(sformat "box-element/~a" ename)))))

(define (dom-define-get/elt doms emit)
  (define dom-names
    (for/list ([dom doms])
      (cons (dom-root dom) (for/list ([elt (in-tree (dom-tree dom))]) (element-name elt)))))

  ; Instantiate each element
  (for ([dom doms] [names dom-names] #:when #t [name names])
    (emit `(declare-const ,(sformat "~a-elt" name) Element)))

  ; Define the mapping
  (define body
    (for*/fold ([body 'no-elt]) ([names dom-names] [name names])
      `(ite (,(sformat "is-~a" name) x) ,(sformat "~a-elt" name) ,body)))
  (emit `(define-fun get/elt ((x ElementName)) Element ,body)))

(define (dom-define-get/box doms emit)
  (define dom-names
    (for/list ([dom doms])
      (cons (dom-root dom) (for/list ([elt (in-tree (dom-tree dom))]) (element-name elt)))))

  ; Instantiate each box
  (for ([dom doms] [names dom-names] #:when #t [name names])
    (emit `(declare-const ,(sformat "~a-flow-box" name) Box)))

  ; Define the mapping
  (define body
    (for*/fold ([body 'no-box]) ([names dom-names] [name names])
      `(ite (,(sformat "is-~a-flow" name) x) ,(sformat "~a-flow-box" name) ,body)))
  (emit `(define-fun get/box ((x BoxName)) Box ,body)))

(define (dom-root-constraints dom emit)
  (define elt `(get/elt ,(dom-root dom)))
  (define b `(get/box (flow-box ,elt)))

  (emit `(echo ,(format "Defining the ~a root element" (dom-name dom))))
  (emit `(assert (! (link-element-box ,(dom-root dom) ,(sformat "~a-flow" (dom-root dom)))
                    :named ,(sformat "link/~a" (dom-root dom)))))
  (for ([(prop type default) (in-css-properties)])
    (emit `(assert (! (= (,(sformat "style.~a" prop) (rules ,elt)) ,default)
                      :named ,(sformat "root/~a/~a" prop (dom-root dom))))))
  (emit `(assert (! (= (w ,b) ,(rendering-context-width (dom-context dom)))
                    :named ,(sformat "width/~a" (dom-name dom)))))
  (emit `(assert (! (link-root-element ,elt ,(element-name (dom-tree dom)))
                    :named ,(sformat "element/~a" (dom-root dom)))))
  (emit `(assert (! (a-root-element ,elt) :named ,(sformat "box/root/~a" (dom-root dom))))))

(define (stylesheet-constraints sname sheet save-rule #:browser [browser? #f])
  (for/reap [emit] ([i (in-naturals)] [rule sheet])
            (define name (sformat "~a/~a" sname i))
            (save-rule name rule)

            (emit `(declare-const ,name Rule))
            (emit `(assert (! (is-a-rule ,name ,(if browser? 'UserAgent 'AuthorNormal) ,i)
                              :named ,(sformat "rule/~a/a-rule" name))))

            (define sel (selector->z3 (selector name rule)))
            (when sel (emit `(assert (! (= (selector ,name) ,sel)
                                        :named ,(sformat "rule/~a/selector" name)))))

            (match rule
              ['? (void)]
              [(list _ pairs ... '?)
               (for ([(a-prop type default) (in-css-properties)])
                 (match (assoc a-prop pairs)
                   [(list _ '?)
                    (emit `(assert (! (= (,(sformat "rule.~a?" a-prop) ,name) true)
                                      :named ,(sformat "rule/~a/~a/?" name a-prop))))]
                   [(list _ val)
                    (emit `(assert (! (= (,(sformat "rule.~a?" a-prop) ,name) true)
                                      :named ,(sformat "rule/~a/~a/?" name a-prop))))
                    (emit `(assert (! (= (,(sformat "rule.~a" a-prop) ,name) ,val)
                                      :named ,(sformat "rule/~a/~a" name a-prop) :opt false)))]
                   [#f (void)]))]
              [(list _ pairs ...)
               (for ([(a-prop type default) (in-css-properties)])
                 (match (assoc a-prop pairs)
                   [(list _ '?)
                    (emit `(assert (! (= (,(sformat "rule.~a?" a-prop) ,name) true)
                                      :named ,(sformat "rule/~a/~a/?" name a-prop))))]
                   [(list _ val)
                    (emit `(assert (! (= (,(sformat "rule.~a?" a-prop) ,name) true)
                                      :named ,(sformat "rule/~a/~a/?" name a-prop))))
                    (emit `(assert (! (= (,(sformat "rule.~a" a-prop) ,name) ,val)
                                      :named ,(sformat "rule/~a/~a" name a-prop) :opt false)))]
                   [#f
                    (emit `(assert (! (= (,(sformat "rule.~a?" a-prop) ,name) false)
                                      :named ,(sformat "rule/~a/~a/?" name a-prop))))]))])

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

(define (element-constraints dom emit elt)
  (emit `(assert (! (an-element (get/elt ,(element-name elt))) :named ,(sformat "element/~a" (element-name elt))))))

(define (number*? x)
  (match x
    [(? number?) #t]
    [`(/ ,(? number*?) ,(? number*?)) #t]
    [_ #f]))

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
       (match arg
         [(? number*?)
          (when ;; HTML elements have weird heights
              (not (and (equal? cmd ':h) (equal? (element-get elt ':tag) 'html)))
            (emit `(assert (! (= (,fun (get/box (flow-box (get/elt ,name)))) ,arg) :named ,(sformat "~a/~a" fun name)))))]
         [`(explain ,(? number*? value))
          (emit `(assert (! (not (= (,fun (get/box (flow-box (get/elt ,name)))) ,value)) :named ,(sformat "~a/~a" fun name))))]
         [`(between ,(? number*? min) ,(? number*? max))
          (emit `(assert (! (<= ,min (,fun (get/box (flow-box (get/elt ,name)))) ,max) :named ,(sformat "~a/~a" fun name))))])]
      [':id (void)]
      [':tag (void)]
      [':text (void)])))

(define (box-link-constraints dom emit elt)
  (define cns
    (match (element-type elt)
      ['BLOCK 'link-block-box]
      ['ANON 'link-block-box]
      ['MAGIC 'link-block-box]
      ['LINE 'link-line-box]
      ['INLINE 'link-inline-box]
      ['TEXT 'link-text-box]))
  (emit `(assert (! (,cns (get/box (flow-box (get/elt ,(element-name elt)))))
                    :named ,(sformat "link-box/~a" (element-name elt))))))

(define (box-constraints dom emit elt)
  (define cns
    (match (element-type elt)
      ['BLOCK 'a-block-box]
      ['ANON 'a-block-box]
      ['MAGIC 'a-block-box]
      ['LINE 'a-line-box]
      ['INLINE 'an-inline-box]
      ['TEXT 'a-text-box]))
  (emit `(assert (! (,cns ,(sformat "~a-flow-box" (element-name elt)))
                    :named ,(sformat "box/~a/~a" (slower (element-type elt)) (element-name elt))))))

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

  (emit `(assert (! (element-info (get/elt ,(element-name elt)) ,tagname ,idname ,display)
                    :named ,(sformat "info/~a" (element-name elt))))))

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

  (define browsers (remove-duplicates (map (compose rendering-context-browser dom-context) doms)))
  (unless (= (length browsers) 1)
    (error "Different browsers on different documents not yet supported"))
  (define browser-style (get-sheet (car browsers)))

  (define-values (tags ids)
    (reap [save-tag save-id]
          (for* ([dom doms] [elt (in-tree (dom-tree dom))])
            (when (element-get elt ':id) (save-id (sformat "id/~a" (slower (element-get elt ':id)))))
            (when (element-get elt ':tag) (save-tag (sformat "tag/~a" (slower (element-get elt ':tag))))))
          (for* ([sheet* (list browser-style sheet)] [rule sheet*])
            (match rule
              ['? (void)]
              [`((tag ,tag) ,_ ...) (save-tag (sformat "tag/~a" (slower tag)))]
              [`((id ,id) ,_ ...) (save-id (sformat "id/~a" (slower id)))]
              [_ (void)]))))

  (define element-names
    (append
     (for*/list ([dom doms] [elt (in-tree (dom-tree dom))]) (element-name elt))
     (for/list ([dom doms]) (dom-root dom))))
  (define box-names (map (curry sformat "~a-flow") element-names))

  (define rules '())
  (define (save-rule x rule) (set! rules (cons (cons x rule) rules)))

  (define constraints
    (list tree-constraints box-element-constraints
          info-constraints user-constraints #;element-constraints
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
    (assert (! (and (= (element no-box) nil-elt) (= (flow-box no-elt) nil-box))
               :named no-element-no-box))

    ; Stylesheet
    (echo "Browser stylesheet")
    ,@(stylesheet-constraints (car browsers) browser-style save-rule #:browser #t)
    (echo "Defining the stylesheet")
    ,@(stylesheet-constraints 'user sheet save-rule)
    ; DOMs
    (echo "Elements must be initialized")
    (assert (forall ((e ElementName)) (! (an-element (get/elt e)) :named element)))
    ,@(apply dfs-constraints doms constraints)))

(define (add-test constraints test)
  (match-define `(forall (,vars ...) ,body) test)
  (define &vars (map (curry sformat "counterexample/~a") vars))
  `(,@constraints
    ,@(for/list ([&var &vars])
        `(declare-const ,&var BoxName))
    (assert (not (let (,@(map list vars (map (curry list 'get/box) &vars))) ,body)))))
