#lang racket
(require "common.rkt")
(require "dom.rkt")
(require "smt.rkt")
(require "z3.rkt")
(require "css-rules.rkt")
(require "css-properties.rkt")
(require "browser-style.rkt")
(require "spec/tree.rkt")
(require "spec/layout.rkt")
(require "spec/cascade.rkt")
(require unstable/sequence)
(require srfi/1)
(require srfi/13)

(provide all-constraints add-test solve-constraints)

(define (extract-stylesheet stylesheet smt-out)
  (for/list ([rule stylesheet] [i (in-naturals)])
    (define rule-name (sformat "user/~a" i))
    (if (not (hash-has-key? smt-out rule-name))
        rule
        (match (hash-ref smt-out rule-name)
          [(list 'rule sel idx origin is-from-style score rest ...)
           (cons (extract-selector sel)
                 (for/list ([(value enabled?) (in-groups 2 rest)]
                            [(prop type default) (in-css-properties)]
                            #:when enabled?)
                   (list prop (extract-value value))))]))))

(define (split-symbol s)
  (for/list ([part (string-split (~a s) "/")])
    (or (string->number part) (string->symbol part))))

(define ((css-type-ending? v) x)
  (match (split-symbol x)
    [(list _ ... (== v)) #t]
    [_ #f]))

(define (css-%? x)
  (string-suffix? "%" (~a (last (split-symbol x)))))

(define (extract-selector sel)
  (match sel
    ['sel/all '*]
    [`(sel/id ,id) (list 'id (string->symbol (substring (~a id) 3)))]
    [`(sel/tag ,tag) (list 'tag (string->symbol (substring (~a tag) 4)))]))

(define (extract-value value)
  (match value
    [(list (? (css-type-ending? 'px)) x) (list 'px x)]
    [(? css-%?) (list '% (string->number (string-trim (~a (last (split-symbol value))) #\%)))]
    [(? symbol?) (last (split-symbol value))]))

(define (prop->prefix prop)
  (slower (css-type prop)))

(define (dump-value prop value)
  (define prefix (prop->prefix prop))
  (match value
    [(? symbol?) (sformat "~a/~a" prefix value)]
    [(list 'px n) (list (sformat "~a/px" prefix) n)]
    [(list '% n) (sformat "~a/~a%" prefix n)]))

(define (dump-selector selector)
  (match selector
    [`(id ,id) `(sel/id ,(sformat "id/~a" id))]
    [`(tag ,tag) `(sel/tag ,(sformat "tag/~a" tag))]
    [`* `sel/any]
    [_ #f]))

(define (split-line-name var)
  (for/list ([part (string-split (~a var) "^")])
    (match (string-split part "/")
      [(list _) part]
      [(list parts ...) (map (curryr with-input-from-string read) parts)])))

(define (extract-core query vars)
  (define asserts
    (for/hash ([cmd query] #:when (and (equal? (car cmd) 'assert) (member ':named (cadr cmd))))
      (match-define `(assert (! ,expr ,_ ... :named ,name ,_ ...)) cmd)
      (values name expr)))

  (for/list ([var vars])
    (cons (split-line-name var) (hash-ref asserts var))))

(define (tree-constraints dom emit elt)
  (when (is-element? elt)
    (define (either field default)
      (let ([e (field elt)])
        (if e (element-name e) default)))
    (emit
     `(assert
       (!
        (link-element (get/elt ,(element-name elt))
                      ,(sformat "~a-doc" (dom-name dom))
                      ,(either element-parent 'nil-elt)
                      ,(either element-prev 'nil-elt)
                      ,(either element-next 'nil-elt)
                      ,(either element-fchild 'nil-elt)
                      ,(either element-lchild 'nil-elt))
        :named ,(sformat "tree/~a" (element-name elt)))))))

(define ((style-constraints names rules) dom emit elt)
  (when (is-element? elt)
    (for-each emit (cascade-rules names rules elt))))

(define (stylesheet-constraints emit names sheet #:browser [browser? #f])
  (for ([name names] [rule sheet] [i (in-naturals)] #:when name)
    (selector-constraints emit name rule i #:browser browser?)

    (define allow-new-properties? (member '? rule))
    (define pairs (filter list? (cdr rule)))

    (for ([(a-prop type default) (in-css-properties)])
      (match (assoc a-prop pairs)
        [(list _ '?)
         (emit `(assert (! (= (,(sformat "rule.~a?" a-prop) ,name) true)
                           :named ,(sformat "rule/~a/~a/?" name a-prop))))]
        [(list _ val)
         (emit `(assert (! (= (,(sformat "rule.~a?" a-prop) ,name) true)
                           :named ,(sformat "rule/~a/~a/?" name a-prop))))
         (emit `(assert (! (= (,(sformat "rule.~a" a-prop) ,name) ,(dump-value a-prop val))
                           :named ,(sformat "rule/~a/~a" name a-prop) :opt false)))]
        [#f
         (when (not allow-new-properties?)
           (emit `(assert (! (= (,(sformat "rule.~a?" a-prop) ,name) false)
                             :named ,(sformat "rule/~a/~a/?" name a-prop)))))]))))

(define (minimizality-constraints emit names sheet)
  (for ([name names] [rule sheet] [i (in-naturals)] #:when name)
    ;; Optimize for short CSS
    (when (memq 'opt (flags))
      ;; Each enabled property costs one line
      (for* ([type css-properties] [property (cdr type)])
        (emit `(assert-soft (not (,(sformat "rule.~a?" property) ,name)) :weight 1)))
      ;; Each block with an enabled property costs two line (open/selector and close brace)
      (emit
       `(assert-soft
         (and ,@(for*/list ([type css-properties] [property (cdr type)])
                  `(not (,(sformat "rule.~a?" property) ,name))))
         :weight 2))
      ;; Each shorthand rule can save space if all its properties exist
      (for ([(short-name subproperties) (in-pairs css-shorthand-properties)])
        (emit `(assert-soft
                (and ,@(for/list ([subprop subproperties])
                         (list (sformat "rule.~a?" subprop) name)))
                :weight 3))))))

(define (box-element-constraints dom emit elt)
  (define bname (box-name elt))
  (define ename (element-name elt))
  (if (is-element? elt)
      (emit `(assert (! (link-element-box ,ename ,bname) :named ,(sformat "box-element/~a" ename))))
      (emit `(assert (! (link-anon-box ,bname) :named ,(sformat "box-element/~a" ename))))))

(define (dom-define-get/elt doms emit)
  (define dom-names
    (for/list ([dom doms])
      (for/list ([elt (in-tree (dom-tree dom))] #:when (is-element? elt)) (element-name elt))))

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
  (define b `(get/box ,(sformat "~a-flow" (dom-root dom))))

  (emit `(echo ,(format "Defining the ~a root box" (dom-name dom))))
  (emit `(assert (! (link-anon-box ,(sformat "~a-flow" (dom-root dom)))
                    :named ,(sformat "link/~a" (dom-root dom)))))
  (match (rendering-context-width (dom-context dom))
    [(? number? w)
     (emit `(assert (! (= (w ,b) ,w) :named ,(sformat "width/~a" (dom-name dom)))))]
    [`(between ,l ,r)
     (emit `(assert (! (<= ,l (w ,b) ,r) :named ,(sformat "width/~a" (dom-name dom)))))])
  #;(emit `(assert (! (a-root-element ,b) :named ,(sformat "box/root/~a" (dom-root dom))))))

(define (number*? x)
  (match x
    [(? number?) #t]
    [`(/ ,(? number*?) ,(? number*?)) #t]
    [_ #f]))

(define (user-constraints dom emit elt)
  (define name (element-name elt))
  (for ([(cmd arg) (in-groups 2 (element-attrs elt))])
    (match cmd
      [(or ':x ':y ':w ':h ':ml ':mr ':mt ':mb)
       (define mapping
         '((:x x) (:y y) (:h box-height) (:w box-width)
           (:ml ml) (:mr mr) (:mt mt) (:mb mb)))
       (define fun (cadr (assoc cmd mapping)))
       (match arg
         [(? number*?)
          (emit `(assert (! (= (,fun (get/box ,(sformat "~a-flow" name))) ,arg) :named ,(sformat "~a/~a" fun name))))]
         [`(explain ,(? number*? value))
          (emit `(assert (! (not (= (,fun (get/box ,(sformat "~a-flow" name))) ,value)) :named ,(sformat "~a/~a" fun name))))]
         [`(between ,(? number*? min) ,(? number*? max))
          (emit `(assert (! (<= ,min (,fun (get/box ,(sformat "~a-flow" name))) ,max) :named ,(sformat "~a/~a" fun name))))])]
      [':id (void)]
      [':tag (void)]
      [':class (void)]
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
  (emit `(assert (! (,cns (get/box ,(box-name elt))
                          ,(box-name elt)
                          ,(box-name (box-parent elt))
                          ,(box-name (box-prev elt))
                          ,(box-name (box-next elt))
                          ,(box-name (box-fchild elt))
                          ,(box-name (box-lchild elt)))
                    :named ,(sformat "link-box/~a" (element-name elt))))))

(define (box-constraints dom emit elt)
  (define cns
    (match (element-type elt)
      ['BLOCK 'a-block-box]
      ['ANON 'a-block-flow-box]
      ['MAGIC 'a-magic-box]
      ['LINE 'a-line-box]
      ['INLINE 'an-inline-box]
      ['TEXT 'a-text-box]))
  (when cns
    (emit `(assert (! (,cns ,(sformat "~a-flow-box" (element-name elt)))
                      :named ,(sformat "box/~a/~a" (slower (element-type elt)) (element-name elt)))))))

(define (info-constraints dom emit elt)
  (when (is-element? elt)
    (define tagname
      (if (element-get elt ':tag) (sformat "tag/~a" (slower (element-get elt ':tag))) 'no-tag))
    (define idname
      (if (element-get elt ':id) (sformat "id/~a" (slower (element-get elt ':id))) 'no-id))

    (emit `(assert (! (element-info (get/elt ,(element-name elt)) ,tagname ,idname)
                      :named ,(sformat "info/~a" (element-name elt)))))))

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

(define (all-constraints sheet documents)
  (define doms
    (for/list ([d documents])
      (match-define (dom name ctx tree) d)
      (dom name ctx (parse-tree tree))))

  (define browsers (remove-duplicates (map (compose rendering-context-browser dom-context) doms)))
  (unless (= (length browsers) 1)
    (error "Different browsers on different documents not yet supported"))
  (define browser-style (get-sheet (car browsers)))
  
  (define browser-style-names (name-rules (car browsers) browser-style (map dom-tree doms)))
  (define user-style-names (name-rules 'user sheet (map dom-tree doms)))

  (define-values (tags ids classes)
    (reap [save-tag save-id save-class]
          (for* ([dom doms] [elt (in-tree (dom-tree dom))])
            (when (element-get elt ':id) (save-id (sformat "id/~a" (slower (element-get elt ':id)))))
            (when (element-get elt ':tag) (save-tag (sformat "tag/~a" (slower (element-get elt ':tag)))))
            (when (element-get elt ':class)
              (for ([c (element-get elt ':class)])
               (save-class (sformat "class/~a" (slower c))))))))

  (define element-names
    (for*/list ([dom doms] [elt (in-tree (dom-tree dom))] #:when (is-element? elt)) (element-name elt)))
  (define box-names
    (append
     (for*/list ([dom doms] [elt (in-tree (dom-tree dom))]) (box-name elt))
     (for/list ([dom doms]) (sformat "~a-flow" (dom-root dom)))))

  (define rule-names (filter identity (append browser-style-names user-style-names)))

  (define constraints
    (list
     tree-constraints box-element-constraints
     (procedure-rename
      (style-constraints (append browser-style-names user-style-names)
                         (append browser-style sheet))
      'cascade-constraints)
     info-constraints user-constraints
     box-link-constraints box-constraints))

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
    ,@(reap [emit] (stylesheet-constraints emit browser-style-names browser-style #:browser #t))
    (echo "Defining the stylesheet")
    ,@(reap [emit] (stylesheet-constraints emit user-style-names sheet))
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
    (assert (! (and ,@(for/list ([&var &vars]) `(is-box (get/box ,&var)))
                    (not (let (,@(map list vars (map (curry list 'get/box) &vars))) ,body)))
               :named test))))

(define (solve-constraints stylesheet constraints #:debug [debug? #f])
  (match (z3-solve constraints #:debug debug?)
    [(model m)
     (model (extract-stylesheet stylesheet m))]
    [(unsat-core c)
     (unsat-core (extract-core constraints c))]))
