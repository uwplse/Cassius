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

(provide all-constraints add-test solve-constraints (struct-out success) (struct-out failure) replace-ids-with-holes reset-replaced)

(define (dump-tag tag)
  (if tag
      (string->symbol (string-replace (format "tag/~a" (slower tag)) ":" ".."))
      'no-tag))

(define (dump-id id)
  (if id
      (sformat "id/~a" id)
      'no-id))

(define (dump-class class)
  (sformat "class/~a" class))

(define (dump-elt elt)
  (if elt
      (sformat "~a-elt" (element-name elt))
      'no-elt))

(define (dump-box box)
  (if box
      (sformat "~a-box" (box-name box))
      'no-box))

(define (dump-dom dom)
  (sformat "~a-doc" (dom-name dom)))

(define (extract-tag tag)
  (and (not (equal? tag 'no-tag))
       (string->symbol (string-replace (~a (second (split-symbol tag))) ".." ":"))))

(define (extract-id id)
  (and (not (equal? id 'no-id)) (second (split-symbol id))))

(define (extract-rules stylesheet trees smt-out)
  (for/list ([rule stylesheet] [i (in-naturals)])
    (define rule-name (sformat "user/~a" i))
    (if (not (hash-has-key? smt-out rule-name))
        rule
        (match (hash-ref smt-out rule-name)
          [(list 'rule sel idx origin is-from-style score rest ...)
           (cons (if (equal? '? (car rule))
                     (extract-selector sel)
                     (car rule))
                 (for/list ([(value enabled?) (in-groups 2 rest)]
                            [(prop type default) (in-css-properties)]
                            #:when enabled?)
                   (list prop (extract-value value))))]))))

(define (extract-style style-expr)
  (match-define (list 'style rec ...) style-expr)
  (for/list ([(prop type default) (in-css-properties)]
             [(value score) (in-groups 2 rec)]
             ;; TODO Hack on text-align
             #:unless (or (and (equal? prop 'text-align) (equal? value 'text-align/left)) (value=? type value default)))
    `[,prop ,(extract-value value)]))

(define (split-symbol s)
  (for/list ([part (string-split (~a s) "/")])
    (or (string->number part) (string->symbol part))))

(define ((css-type-ending? v) x)
  (match (split-symbol x)
    [(list _ ... (== v)) #t]
    [_ #f]))

(define (css-ex? x)
  (string-suffix? (~a (last (split-symbol x))) "ex"))

(define (css-em? x)
  (string-suffix? (~a (last (split-symbol x))) "em"))

(define (extract-selector sel)
  (match sel
    ['sel/all '*]
    [`(sel/id ,id) (list 'id (string->symbol (substring (~a id) 3)))]
    [`(sel/tag ,tag) (list 'tag (string->symbol (substring (~a tag) 4)))]))

(define (extract-value value)
  (match value
    [(list (? (css-type-ending? 'px)) x) (list 'px x)]
    [(list (? (css-type-ending? '%)) x)
     (if (ormap (curry = x) (*%*)) ; Percentages that aren't in the list are its first element
         (list '% x)
         (list '% (car (*%*))))]
    [(? symbol?) (last (split-symbol value))]))

(define (prop->prefix prop)
  (slower (css-type prop)))

(define (dump-value prop value)
  (define prefix (prop->prefix prop))
  (match value
    [(? symbol?) (sformat "~a/~a" prefix value)]
    [(list 'px n) (list (sformat "~a/px" prefix) n)]
    [(list '% n) (list (sformat "~a/%" prefix) n)]
    [0 (dump-value prop '(px 0))]))

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

(define (extract-tag-name constraint)
  (define cstyle (first constraint))
  (match cstyle
    [`(compute-style ,property ,elt-name tag ,tagname ,id)
     tagname]
    [_ (void)]))

(define (extract-id-name constraint)
  (define cstyle (first constraint))
  (match cstyle
    [`(compute-style ,property ,elt-name tag ,tagname ,id)
     id]
    [_ (void)]))

;; Does tagging of bad
(define (extract-core query stylesheet trees vars)
  (define stylesheet* (make-hash))
  (for ([name vars])
    (match (split-line-name name)
      [`((,(and (or 'box-x 'box-y 'box-width 'box-height 'mt 'mr 'mb 'ml) field) ,elt-name) ,_ ...)
       (define field-name
         (match field ['box-x ':x] ['box-y ':y] ['box-width ':w] ['box-height ':h]
           ['mt ':mt] ['mr ':mr] ['mb ':mb] ['ml ':ml]))
       (define elt (elt-from-name elt-name))
       (element-set! elt field-name `(bad ,(element-get elt field-name)))]
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
      [`((info ,elt-name) ,compute-style ...)
       (define tag-name (extract-tag-name compute-style))
       (define id-name (extract-id-name compute-style))
       (define elt (elt-from-name elt-name))
       (define fname (element-get elt ':tag))
       (define iname (element-get elt ':id))
       (define (no-bad field)
         (match field
           [`(bad ,tag) #f]
           [_ #t]))
       (when (no-bad fname)
         (element-set! elt ':tag `(bad ,fname)))
       (when (and (no-bad iname) iname)
         (element-set! elt ':id `(bad ,iname)))]
      [`((style ,elt-name ,prop) ,_ ...)
       (define elt (elt-from-name elt-name))
       (define old-style (element-get elt ':style))
       (element-set! elt ':style
                     (if (dict-has-key? old-style prop)
                         (dict-update old-style prop (λ (x) (list `(bad ,(car x)))))
                         (dict-set old-style prop '((bad)))))]
      [_ (void)]))
  (values (hash-values stylesheet*) trees))

; Replace all bad tags and ids with holes
; TODO: It is kind of strange & hacky to have this weird global variable thing, but I can't figure out how to avoid it currently.. Maybe Pavel can think of a better way
; with his wicked racket skills?
(define replaced #f)
(define (reset-replaced)
  (set! replaced #f))

(define (replace-ids-with-holes tree one)
  (define (match-attr attr)
    (match attr
      [`(bad ,val) val]
      [_ attr]))

  (for/list ([t tree])
    (match t
      [`((,block ...) ,rest ...)
       (replace-ids-with-holes t one)]
      [`(,block :tag (bad ,val) :id (bad ,idval) ,rest ...)
       (define vals (map (λ (t) (match-attr t)) rest))
       (define ret
         (cond
           [(and (not (equal? (slower (symbol->string val)) 'html))
                  (not (equal? (slower (symbol->string val)) 'body))
                  (not replaced)
                  (not (equal? idval '?)))
             (when (and one (not replaced))
               (set! replaced #t))
             (cond
               [(not one)
                 (list block ':tag '? ':id '?)]
               [else
                 (list block ':tag val ':id '?)])]
           [else
             (list block ':tag val ':id idval)]))
       (append ret vals)]
      [`(,block :tag (bad ,val) ,rest ...)
       (define vals (map (λ (t) (match-attr t)) rest))
       (define ret
         (cond
           [(and (not (equal? (slower (symbol->string val)) 'html))
                  (not (equal? (slower (symbol->string val)) 'body))
                  (not replaced)
                  (not (equal? val '?)))
            (when (and one (not replaced))
               (set! replaced #t))
             (list block ':tag '?)]
           [else
             (list block ':tag val)]))
       (append ret vals)]
      [`(,block ,attr (bad ,val) ,rest ...)
       (define vals (map (λ (t) (match-attr t)) rest))
       (define ret (list block attr val))
       (append ret vals)]
      [`(,block ,attr ,val ,rest ...)
       (define ret (list block attr val))
       (append ret rest)]
      [_ (replace-ids-with-holes t one)])))

(define (extract-box! box elt)
  (match-define
   (list 'box
         type x y w h xo yo mt mr mb ml mtp2 mtn2 mbp2 mbn2 mtp mtn mbp mbn
         pt pr pb pl bt br bb bl stfwidth w-from-stfwidth
         real-p-name real-n-name real-v-name real-f-name
         real-l-name width-set pb-name n-name v-name flt-name flt-up-name float
         textalign position element)
   box)
  (define box-width (+ bl pl w pr br))
  (define box-height (+ bt pt h pb bb))
  (define box-x (+ x xo))
  (define box-y (+ y yo))
  (element-set! elt ':w box-width)
  (element-set! elt ':h box-height)
  (element-set! elt ':x box-x)
  (element-set! elt ':y box-y))

(define (extract-elt! result elt)
  (match-define (list 'elt doc tag id spec-style comp-style &v &p &n &f &l &b) result)
  (when (equal?  (element-get elt ':tag) '?)
    (element-set! elt ':tag `(fixed ,(extract-tag tag))))
  (element-set! elt ':style (extract-style spec-style))
  (when (equal?  (element-get elt ':id) '?)
    (define new-id (extract-id id))
    (if (equal? new-id 'no-id)
        (element-remove! elt ':id)
        (element-set! elt ':id new-id))))

(define (extract-tree! tree smt-out)
  (for ([elt (in-tree tree)])
    (define box-model (dict-ref smt-out (dump-box elt) #f))
    (when (and box-model (list? box-model)) (extract-box! box-model elt))
    (define elt-model (dict-ref smt-out (dump-elt elt) #f))
    (when (and elt-model (list? elt-model)) (extract-elt! elt-model elt))))

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
        (link-element ,(dump-elt elt)
                      ,(dump-dom dom)
                      ,(either element-parent 'nil-elt)
                      ,(either element-prev 'nil-elt)
                      ,(either element-next 'nil-elt)
                      ,(either element-fchild 'nil-elt)
                      ,(either element-lchild 'nil-elt))
        :named ,(sformat "tree/~a" (element-name elt)))))))

(define ((cascade-constraints names rules) dom emit elt)
  (when (and (set-member? (flags) 'rules) (is-element? elt) (not (equal? (element-type elt) 'MAGIC)))
    (for-each emit (cascade-rules names rules elt))))

(define (compute-score rule)
  "Given a selector, return a list of counts (ids classes elts)"
  (match rule
    [`? #f]
    [`(id ,id) `(1 0 0)]
    [`(class ,cls) `(0 1 0)]
    [`(tag ,tag) `(0 0 1)]
    [`* '(0 0 0)]
    [(list (? string?) sub) (compute-score sub)]
    [(list 'or sels ...)
     (map (curry apply max) (apply (curry map list) (map compute-score sels)))]
    [(list (or 'and 'desc 'child) sels ...)
     (map (curry apply +) (apply (curry map list) (map compute-score sels)))]))

(define (rule-constraints emit name rule i #:browser? [browser? #f])
  (define from-style? (member ':style (cdr rule)))
  (emit `(declare-const ,name Rule))
  (emit `(assert (! (is-a-rule ,name ,(if browser? 'UserAgent 'AuthorNormal)
                               ,i ,(if from-style? 'true 'false))
                    :named ,(sformat "rule/~a/a-rule" name))))
  (cond
    [(or from-style? (and (not (equal? (car rule) '?)) (dump-selector (car rule))))
     (match-define (list ids classes tags) (compute-score (car rule)))
     (emit `(assert (= (score ,name) (cascadeScore (origin ,name) (isFromStyle ,name) ,ids ,classes ,tags (index ,name)))))]
    [else
     (emit `(assert (= (score ,name) (compute-score ,name))))
     (when (dump-selector (car rule))
       (emit `(assert (! (= (selector ,name) ,(dump-selector (car rule)))
                         :named ,(sformat "rule/~a/selector" name)))))])

  (define allow-new-properties? (member '? (cdr rule)))
  (define pairs
    (filter (λ (x) (or (not (symbol? (cadr x))) (not (or (css-ex? (cadr x)) (css-em? (cadr x))))))
            (filter list? (css-denormalize-body (cdr rule)))))

  (for ([(prop _t _d) (in-css-properties)])
    (match (assoc prop pairs)
      [(list _ '?)
       (emit `(assert (! (= (,(sformat "rule.~a?" prop) ,name) true)
                         :named ,(sformat "rule/~a/~a/?" name prop))))]
      [(list _ val)
       (emit `(assert (! (= (,(sformat "rule.~a?" prop) ,name) true)
                         :named ,(sformat "rule/~a/~a/?" name prop))))
       (emit `(assert (! (= (,(sformat "rule.~a" prop) ,name) ,(dump-value prop val))
                         :named ,(sformat "rule/~a/~a" name prop) :opt false)))]
      [#f
       (when (not allow-new-properties?)
         (emit `(assert (! (= (,(sformat "rule.~a?" prop) ,name) false)
                           :named ,(sformat "rule/~a/~a/?" name prop)))))])))

(define (minimizality-constraints emit names sheet)
  (for ([name names] [rule sheet] [i (in-naturals)] #:when name)
    ;; Optimize for short CSS
    (when (set-member? (flags) 'opt)
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
  (for* ([dom doms] [elt (in-tree (dom-tree dom))] #:when (is-element? elt))
    (emit `(declare-const ,(dump-elt elt) Element)))
  (define body
    (for*/fold ([body 'no-elt]) ([dom doms] [elt (in-tree (dom-tree dom))] #:when (is-element? elt))
      `(ite (,(sformat "is-~a" (element-name elt)) &elt) ,(dump-elt elt) ,body)))
  (emit `(define-fun get/elt ((&elt ElementName)) Element ,body)))

(define (dom-define-get/box doms emit)
  (for* ([dom doms] [box (in-tree (dom-tree dom))])
    (emit `(declare-const ,(dump-box box) Box)))
  (define body
    (for*/fold ([body 'no-box]) ([dom doms] [box (in-tree (dom-tree dom))])
      `(ite (,(sformat "is-~a" (box-name box)) &box) ,(dump-box box) ,body)))
  (emit `(define-fun get/box ((&box BoxName)) Box ,body)))

(define (number*? x)
  (match x
    [(? number?) #t]
    [`(/ ,(? number*?) ,(? number*?)) #t]
    [_ #f]))

(define (box-constraints dom emit elt)
  (for ([(cmd arg) (in-dict (element-get* elt '(:x :y :w :h)))])
    (define fun (dict-ref '((:x . box-x) (:y . box-y) (:h . box-height) (:w . box-width)) cmd))
    (define expr `(,fun ,(dump-box elt)))
    (define constraint
      (match arg
        [(? number*?) `(= ,expr ,arg)]
        [`(not ,(? number*? value)) `(not (= ,expr ,value))]
        [`(between ,(? number*? min) ,(? number*? max)) `(<= ,min ,expr ,max)]))

    (emit `(assert (! ,constraint :named ,(sformat "~a/~a" fun (element-name elt)))))))

(define (style-constraints dom emit elt)
  (when (element-get elt ':style)
    (define style (css-denormalize-body (element-get elt ':style)))
    (for ([(prop _t default) (in-css-properties)])
      (match (dict-ref style prop #f)
        ['(?) (void)]
        [(list val)
         (emit `(assert (! (= (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt)))
                              ,(dump-value prop val))
                           :named ,(sformat "style/~a/~a" (element-name elt) prop))))]
        [#f
         (define value (if (equal? prop 'text-align) 'text-align/left default))
         (emit `(assert (! (= (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt))) ,value)
                           :named ,(sformat "style/~a/~a" (element-name elt) prop))))])))) 

(define (box-link-constraints dom emit elt)
  (define cns
    (match (element-type elt)
      ['BLOCK 'link-block-box]
      ['VIEW  'link-block-box]
      ['ANON 'link-block-box]
      ['MAGIC 'link-block-box]
      ['LINE 'link-line-box]
      ['INLINE 'link-inline-box]
      ['TEXT 'link-text-box]))
  (emit `(assert (! (,cns ,(dump-box elt)
                          ,(box-name elt)
                          ,(box-name (box-parent elt))
                          ,(box-name (box-prev elt))
                          ,(box-name (box-next elt))
                          ,(box-name (box-fchild elt))
                          ,(box-name (box-lchild elt)))
                    :named ,(sformat "link-box/~a" (element-name elt))))))

(define (layout-constraints dom emit elt)
  (define cns
    (match (element-type elt)
      ['BLOCK 'a-block-box]
      ['VIEW 'a-view-box]
      ['ANON 'an-anon-block-box]
      ['MAGIC 'a-magic-box]
      ['LINE 'a-line-box]
      ['INLINE 'an-inline-box]
      ['TEXT 'a-text-box]))
  (when cns
    (emit `(assert (! (,cns ,(dump-box elt))
                      :named ,(sformat "box/~a/~a" (slower (element-type elt)) (element-name elt)))))))

(define (info-constraints dom emit elt)
  (when (is-element? elt)
    (define tagname
      (if (equal? (element-get elt ':tag) '?)
          `(tagname ,(dump-elt elt))
          (dump-tag (element-get elt ':tag))))

    (define idname
      (if (equal? (element-get elt ':id) '?)
          `(idname ,(dump-elt elt))
          (dump-id (element-get elt ':id))))

    (emit `(assert (! (element-info ,(dump-elt elt) ,tagname ,idname)
                      :named ,(sformat "info/~a" (element-name elt)))))))

(define (getter-definitions doms)
  (reap [sow]
        (dom-define-get/elt doms sow)
        (dom-define-get/box doms sow)))

(define (dfs-constraints doms . constraints)
  (reap [sow]
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
              (for-each (compose save-class dump-class) (element-get elt ':class))))

          ; TODO: Not dealing with saving browser style names currently because the logic was buggy for appending those to this list
          (for ([name user-style-names] [rule sheet])
            (when name
              ; add tags and ids into the list
              (match (car rule)
                [`(tag ,tagname) (save-tag (dump-tag tagname))]
                [`(id ,idname) (save-id (dump-id idname))]
                [`(class ,classname) (save-class (dump-class classname))]
                [_ (void)])))))

  (define element-names
    (for*/list ([dom doms] [elt (in-tree (dom-tree dom))] #:when (is-element? elt)) (element-name elt)))
  (define box-names
    (for*/list ([dom doms] [elt (in-tree (dom-tree dom))]) (box-name elt)))

  (define rule-names (filter identity (append browser-style-names user-style-names)))

  (eprintf ";; ~a rules, ~a elements, ~a boxes\n" (length rule-names) (length element-names) (length box-names))

  (define constraints
    (list
     tree-constraints
     box-constraints style-constraints
     (procedure-rename
      (cascade-constraints (append browser-style-names user-style-names) (append browser-style sheet))
      'cascade-constraints)
     box-link-constraints info-constraints box-element-constraints
     layout-constraints))

  `((set-option :produce-unsat-cores true)
    (echo "Basic definitions")
    (declare-datatypes
     () ; No parameters
     ((Id no-id ,@(remove-duplicates ids))
      (TagNames no-tag ,@(remove-duplicates tags))
      (Document ,@(for/list ([dom doms]) (dump-dom dom)))
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
    ,@(cond
       [(set-member? (flags) 'rules)
        (reap [emit]
          (emit '(echo "Browser stylesheet"))
          (for ([name browser-style-names] [rule browser-style] [i (in-naturals)] #:when name)
            (rule-constraints emit name rule i #:browser? #t))
          (emit '(echo "User stylesheet"))
          (for ([name user-style-names] [rule sheet] [i (in-naturals)] #:when name)
            (rule-constraints emit name rule i #:browser? #f)))]
       [else '()])
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
     (success (extract-rules stylesheet trees m) (map unparse-tree trees))]
    [(unsat-core c)
     (define-values (stylesheet* trees*) (extract-core constraints stylesheet trees c))
     (failure stylesheet* (map unparse-tree trees*))]))
