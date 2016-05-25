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
(require srfi/1)

(provide all-constraints add-test solve-constraints (struct-out success) (struct-out failure))

(define (dump-tag tag)
  (if tag
      (string->symbol (string-replace (format "tag/~a" (slower tag)) ":" ".."))
      'no-tag))

(define (dump-id id)
  (if id
      (sformat "id/~a" id)
      'no-id))

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

(define (css-em? x)
  (string-suffix? "em" (~a (last (split-symbol x)))))

(define (extract-selector sel)
  (match sel
    ['sel/all '*]
    [`(sel/id ,id) (list 'id (string->symbol (substring (~a id) 3)))]
    [`(sel/tag ,tag) (list 'tag (string->symbol (substring (~a tag) 4)))]))

(define (extract-value value)
  (match value
    [(list (? (css-type-ending? 'px)) x) (list 'px x)]
    [(? css-%?) (list '% (string->number (string-trim (~a (last (split-symbol value))) "%" #:left? #f)))]
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
    [`(id ,id) `(sel/id ,(dump-id id))]
    [`(tag ,tag) `(sel/tag ,(dump-tag tag))]
    [`* `sel/all]
    [_ #f]))

(define (split-line-name var)
  (for/list ([part (string-split (~a var) "^")])
    (match (string-split part "/")
      [(list _) part]
      [(list parts ...) (map (curryr with-input-from-string read) parts)])))

(define (extract-core query stylesheet trees vars)
  (define stylesheet* (make-hash))
  (for ([name vars])
    (match (split-line-name name)
      [`((,(and (or 'box-x 'box-y 'box-width 'box-height 'mt 'mr 'mb 'ml) field) ,elt-name) ,_ ...)
       (define field-name
         (match field ['box-x ':x] ['box-y ':y] ['box-width ':w] ['box-height ':h]
                ['mt ':mt] ['mr ':mr] ['mb ':mb] ['ml ':ml]))
       (define elt (elt-from-name elt-name))
       (set-element-attrs! elt (plist-merge (element-attrs elt) `(,field-name (bad ,(element-get elt field-name)))))]
      [`((rule user ,idx ,prop) ,_ ...) ; TODO: Update to include browser styles
       (define rule (hash-ref! stylesheet* idx (list-ref stylesheet idx)))
       (define rule*
         (cons (car rule)
               (for/list ([line (cdr rule)])
                 (cond 
                  [(not (list? line))
                   line]
                  [(equal? (car line) prop)
                   `(,prop (bad ,(cadr line)))]
                  [else
                   line]))))
       (hash-set! stylesheet* idx rule*)]
      [_ (void)]))
  (values (hash-values stylesheet*) trees)) ; stylesheet* is the one with just bad rules

(define (plist-add plist key value)
  (let loop ([plist plist])
    (cond
     [(null? plist)
      (list key value)]
     [(equal? (car plist) key)
      (list* (car plist) value (cddr plist))]
     [else
      (list* (car plist) (cadr plist) (loop (cddr plist)))])))

(define (plist-merge plist1 plist2)
  (for/fold ([plist plist1]) ([(k v) (in-groups 2 plist2)])
    (plist-add plist k v)))

(define (extract-box! box elt)
  (match box
    [(list 'box type x y w h xo yo mt mr mb ml mtp2 mtn2 mbp2 mbn2 mtp mtn mbp mbn
           pt pr pb pl bt br bb bl stfwidth real-p-name real-n-name real-v-name real-f-name
           real-l-name width-set pb-name n-name v-name flt-name flt-up-name float
           textalign position element)
     (define box-width (+ bl pl w pr br))
     (define box-height (+ bt pt h pb bb))
     (define box-x (+ x xo))
     (define box-y (+ y yo))
     (define props
       `(:w ,box-width :h ,box-height :x ,box-x :y ,box-y #|:bl ,bl :bb ,bb :br ,br :bt ,bt|#))

     (set-element-attrs! elt (plist-merge (element-attrs elt) props))]))

(define (extract-tree! tree smt-out)
  (for ([elt (in-tree tree)])
    (define box-name (sformat "~a-flow-box" (element-name elt)))
    (extract-box! (hash-ref smt-out box-name) elt)))

(define (extract-counterexample! smt-out)
  (for ([(name value) (in-hash smt-out)])
    (when (equal? (car (split-symbol name)) 'counterexample)
      (define elt (elt-from-name (string->symbol (car (string-split (~a value) "-")))))
      (set-element-attrs! elt (list* ':cex `(bad ,(string-join (cdr (string-split (~a name) "/")) "/")) (element-attrs elt))))))

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
  (when (and (is-element? elt) (not (equal? (element-type elt) 'MAGIC)))
    (for-each emit (cascade-rules names rules elt))))

(define (stylesheet-constraints emit names sheet #:browser [browser? #f])
  (for ([name names] [rule sheet] [i (in-naturals)] #:when name)
    (selector-constraints emit name rule i #:browser browser?)

    (define allow-new-properties? (member '? rule))
    (define pairs
      (filter (λ (x) (or (not (symbol? (cadr x))) (not (css-em? (cadr x)))))
              (filter list? (cdr rule))))

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
      (for ([(short-name subproperties) (in-dict css-shorthand-properties)])
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
  (emit `(assert (! (link-block-box ,(sformat "~a-flow-box" (dom-root dom))
                                    ,(sformat "~a-flow" (dom-root dom))
                                    nil-box nil-box nil-box
                                    ,(sformat "~a-flow" (element-name (dom-tree dom)))
                                    ,(sformat "~a-flow" (element-name (dom-tree dom))))
                    :named ,(sformat "link-box/~a" (dom-root dom)))))
  (emit `(assert (! (link-anon-box ,(sformat "~a-flow" (dom-root dom)))
                    :named ,(sformat "link/~a" (dom-root dom)))))
  (emit `(assert (! (a-view-box ,(sformat "~a-flow-box" (dom-root dom)))
                    :named ,(sformat "box/view/~a" (dom-name dom)))))
  (match (rendering-context-width (dom-context dom))
    [(? number? w)
     (emit `(assert (! (= (w ,b) ,w) :named ,(sformat "width/~a" (dom-name dom)))))]
    [`(between ,l ,r)
     (emit `(assert (! (<= ,l (w ,b) ,r) :named ,(sformat "width/~a" (dom-name dom)))))]))

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
         '((:x box-x) (:y box-y) (:h box-height) (:w box-width)
           (:ml ml) (:mr mr) (:mt mt) (:mb mb)))
       (define fun (cadr (assoc cmd mapping)))
       (match arg
         [(? number*?)
          (emit `(assert (! (= (,fun (get/box ,(sformat "~a-flow" name))) ,arg) :named ,(sformat "~a/~a" fun name))))]
         [`(not ,(? number*? value))
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
                          ,(if (box-parent elt) (box-name (box-parent elt)) (sformat "~a-flow" (dom-root dom)))
                          ,(box-name (box-prev elt))
                          ,(box-name (box-next elt))
                          ,(box-name (box-fchild elt))
                          ,(box-name (box-lchild elt)))
                    :named ,(sformat "link-box/~a" (element-name elt))))))

(define (box-constraints dom emit elt)
  (define cns
    (match (element-type elt)
      ['BLOCK 'a-block-box]
      ['ANON 'an-anon-block-box]
      ['MAGIC 'a-magic-box]
      ['LINE 'a-line-box]
      ['INLINE 'an-inline-box]
      ['TEXT 'a-text-box]))
  (when cns
    (emit `(assert (! (,cns ,(sformat "~a-flow-box" (element-name elt)))
                      :named ,(sformat "box/~a/~a" (slower (element-type elt)) (element-name elt)))))))

(define (info-constraints dom emit elt)
  (when (is-element? elt)
    (define tagname (dump-tag (element-get elt ':tag)))
    (define idname (dump-id (element-get elt ':id)))

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

(define (all-constraints sheet doms)

  (define browsers (remove-duplicates (map (compose rendering-context-browser dom-context) doms)))
  (unless (= (length browsers) 1)
    (error "Different browsers on different documents not yet supported"))
  (define browser-style (get-sheet (car browsers)))
  
  (define browser-style-names (name-rules (car browsers) browser-style (map dom-tree doms)))
  (define user-style-names (name-rules 'user sheet (map dom-tree doms)))

  (define-values (tags ids classes)
    (reap [save-tag save-id save-class]
          (for* ([dom doms] [elt (in-tree (dom-tree dom))])
            (when (element-get elt ':id) (save-id (dump-id (element-get elt ':id))))
            (when (element-get elt ':tag) (save-tag (dump-tag (element-get elt ':tag))))
            (when (element-get elt ':class)
              (for ([c (element-get elt ':class)])
               (save-class (sformat "class/~a" c)))))))

  (define element-names
    (for*/list ([dom doms] [elt (in-tree (dom-tree dom))] #:when (is-element? elt)) (element-name elt)))
  (define box-names
    (append
     (for*/list ([dom doms] [elt (in-tree (dom-tree dom))]) (box-name elt))
     (for/list ([dom doms]) (sformat "~a-flow" (dom-root dom)))))

  (define rule-names (filter identity (append browser-style-names user-style-names)))
  
  (eprintf ";; ~a rules, ~a elements, ~a boxes\n" (length rule-names) (length element-names) (length box-names))

  (define constraints
    (list
     tree-constraints 
     (procedure-rename
      (style-constraints (append browser-style-names user-style-names)
                         (append browser-style sheet))
      'cascade-constraints)
     user-constraints box-link-constraints
     info-constraints box-element-constraints
     box-constraints))

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

(struct success (stylesheet elements))
(struct failure (stylesheet trees))

(define (solve-constraints stylesheet trees constraints #:debug [debug? #f])
  (match (z3-solve constraints #:debug debug?)
    [(model m)
     (for-each (curryr extract-tree! m) trees)
     (extract-counterexample! m)
     (success (extract-stylesheet stylesheet m) (map unparse-tree trees))]
    [(unsat-core c)
     (define-values (stylesheet* trees*) (extract-core constraints stylesheet trees c))
     (failure stylesheet* (map unparse-tree trees*))]))
