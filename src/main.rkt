#lang racket
(require "common.rkt" "dom.rkt" "smt.rkt" "z3.rkt" "encode.rkt"
         "selectors.rkt"
         "spec/css-properties.rkt" "spec/browser-style.rkt" "spec/tree.rkt" "spec/layout.rkt")

(provide all-constraints add-test solve-constraints (struct-out success) (struct-out failure) replace-ids-with-holes reset-replaced)

(define (css-normalize-body body)
  (for/fold ([body body]) ([(prop parts) (in-dict css-shorthand-properties)])
    (if (andmap (curry dict-has-key? body) parts)
        (dict-set
         (for/fold ([body body]) ([part parts])
           (dict-remove body part))
         prop
         (for/list ([part parts]) (car (dict-ref body part))))
        body)))

(define (css-denormalize-body body)
  (for/fold ([body body]) ([(prop parts) (in-dict css-shorthand-properties)])
    (if (dict-has-key? body prop)
        (for/fold ([body (dict-remove body prop)]) ([part parts] [value (dict-ref body prop)])
           (dict-set body part (list value)))
        body)))

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

(define (split-line-name var)
  (map split-symbol (string-split (~a var) "^")))

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
      [`((style ,elt-name ,prop) ,_ ...)
       (define elt (elt-from-name elt-name))
       (define old-style (css-denormalize-body (element-get elt ':style)))
       (element-set! elt ':style
                     (css-normalize-body
                      (if (dict-has-key? old-style prop)
                          (dict-update old-style prop (λ (x) (list `(bad ,(car x)))))
                          (dict-set old-style prop '((bad))))))]
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
         type x y w h xo yo mt mr mb ml mtp mtn mbp mbn
         pt pr pb pl bt br bb bl stfwidth w-from-stfwidth
         real-p-name real-n-name real-v-name real-f-name
         real-l-name width-set pb-name pp-name n-name v-name flt-name flt-up-name float
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

(define (selector-constraints emit rules dom)
  (emit '(echo "Generating selector constraints"))
  (define elts
    (for/list ([elt (in-tree (dom-tree dom))] #:when (is-element? elt)) elt))
  (define eqs (equivalence-classes rules elts))
  (for ([(prop type default) (in-css-properties)])
    (match-define (cons class-hash value-hash) (dict-ref eqs prop))
    (for ([(class value) (in-dict value-hash)])
      (define const (sformat "value/~a/~a" prop (or class 'none)))
      (if (eq? value '?)
          (emit `(declare-const ,const ,type))
          (emit `(define-const ,const ,type ,(dump-value type value))))
      (define elts (for/list ([(elt class*) (in-dict class-hash)] #:when (equal? class class*)) elt))
      (for ([elt1 elts] [elt2 elts])
        (define assertname (sformat "~a^~a^~a" const (element-name elt1) (element-name elt2)))
        (emit `(assert (! (= (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt1)))
                            (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt2))))
                          :named ,assertname))))
      (for ([elt elts])
        (define assertname (sformat "~a^~a" const (element-name elt)))
        (emit `(assert (! (= (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt))) ,const)
                          :named ,assertname)))))))

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
    (for ([(prop type default) (in-css-properties)])
      (match (dict-ref style prop #f)
        ['(?) (void)]
        [(list val)
         (emit `(assert (! (= (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt)))
                              ,(dump-value type val))
                           :named ,(sformat "style/~a/~a" (element-name elt) prop))))]
        [#f
         (define value (dump-value type (if (equal? prop 'text-align) 'left default)))
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

(define (collect-tags-ids-classes doms)
  (reap [save-tag save-id save-class]
    (for* ([dom doms] [elt (in-tree (dom-tree dom))])
      (when (element-get elt ':id) (save-id (dump-id (element-get elt ':id))))
      (when (element-get elt ':tag) (save-tag (dump-tag (element-get elt ':tag))))
      (when (element-get elt ':class)
        (for-each (compose save-class dump-class) (element-get elt ':class))))))

(define (all-constraints sheet doms)
  (define-values (tags ids classes) (collect-tags-ids-classes doms))
  (define element-names (for*/list ([dom doms] [elt (in-elements dom)]) (element-name elt)))
  (define box-names (for*/list ([dom doms] [elt (in-boxes dom)]) (box-name elt)))

  (eprintf ";; ~a elements, ~a boxes\n" (length element-names) (length box-names))

  (define (global f) (reap [sow] (f doms sow)))
  (define (per-element f)
    (reap [sow] (for* ([dom doms] [elt (in-elements dom)]) (f dom sow elt))))
  (define (per-box f)
    (reap [sow] (for* ([dom doms] [box (in-boxes dom)]) (f dom sow box))))

  `((set-option :produce-unsat-cores true)
    (echo "Basic definitions")
    (declare-datatypes
     () ; No parameters
     ((Id no-id ,@(remove-duplicates ids))
      (TagNames no-tag ,@(remove-duplicates tags))
      (Document ,@(for/list ([dom doms]) (dump-dom dom)))
      (ElementName ,@element-names nil-elt)
      (BoxName ,@box-names nil-box)))
    ;,@css-declarations
    (declare-datatypes ()
      (,@(for/list ([(type decl) (in-css-types)]) (cons type decl))
       (Style (style ,@(for/list ([(prop type default) (in-css-properties)])
                         `(,(sformat "style.~a" prop) ,type))))))
    (define-const border/thin Border (border/px 1))
    (define-const border/medium Border (border/px 3))
    (define-const border/thick Border (border/px 5))
    (define-const text-align/start Text-Align text-align/left)
    (define-const text-align/end Text-Align text-align/right)
    ,@tree-types
    ,@(global dom-define-get/elt)
    ,@(global dom-define-get/box)
    ;,@css-functions
    ,@link-definitions
    ,@layout-definitions
    (assert (and (= (element no-box) nil-elt) (= (flow-box no-elt) nil-box)))

    ; DOMs
    (echo "Elements must be initialized")
    (assert (forall ((e ElementName)) (! (an-element (get/elt e)) :named element)))
    ,@(per-element tree-constraints)
    ,@(per-box box-constraints)
    ,@(per-box style-constraints)
    ,@(per-box box-link-constraints)
    ,@(per-box info-constraints)
    ,@(per-box box-element-constraints)
    ,@(per-box layout-constraints)
    ; Selectors
    ,@(reap [emit]
            (when (set-member? (flags) 'rules)
              (for/list ([dom doms])
                (define browser-style (get-sheet (rendering-context-browser (dom-context dom))))
                (selector-constraints emit (append browser-style sheet) dom))))
    ))

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
