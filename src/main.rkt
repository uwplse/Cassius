#lang racket
(require "common.rkt" "dom.rkt" "smt.rkt" "z3.rkt" "encode.rkt" "registry.rkt" "tree.rkt"
         "selectors.rkt" "match.rkt"
         "spec/css-properties.rkt" "spec/browser-style.rkt" "spec/tree.rkt" "spec/layout.rkt")

(provide all-constraints add-test selector-constraints extract-core extract-counterexample! extract-tree!)

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

(define (css-ex? x)
  (string-suffix? (~a (last (split-symbol x))) "ex"))

(define (css-em? x)
  (string-suffix? (~a (last (split-symbol x))) "em"))

;; Does tagging of bad
(define (extract-core stylesheet trees vars)
  (define stylesheet* (make-hash))
  (for ([name vars])
    (match (split-line-name name)
      [`((,(and (or 'box-x 'box-y 'box-width 'box-height 'mt 'mr 'mb 'ml) field) ,box-name) ,_ ...)
       (define field-name
         (match field ['box-x ':x] ['box-y ':y] ['box-width ':w] ['box-height ':h]
           ['mt ':mt] ['mr ':mr] ['mb ':mb] ['ml ':ml]))
       (define box (by-name 'box box-name))
       (node-set! box field-name `(bad ,(node-get box field-name)))]
      [`((style ,elt-name ,prop) ,_ ...)
       (define elt (by-name 'elt elt-name))
       (define old-style (css-denormalize-body (node-get elt ':style '())))
       (node-set! elt ':style
                     (css-normalize-body
                      (if (dict-has-key? old-style prop)
                          (dict-update old-style prop (λ (x) (list `(bad ,(car x)))))
                          (dict-set old-style prop '((bad))))))]
      [_ (void)]))
  (values (hash-values stylesheet*) trees))

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
  (node-set! elt ':w box-width)
  (node-set! elt ':h box-height)
  (node-set! elt ':x box-x)
  (node-set! elt ':y box-y))

(define (extract-elt! result elt)
  (match-define (list 'elt doc tag id spec-style comp-style &v &p &n &f &l &b) result)
  (node-set! elt ':style (extract-style spec-style))
  (when (equal?  (node-get elt ':id) '?)
    (define new-id (extract-id id))
    (if (equal? new-id 'no-id)
        (node-remove! elt ':id)
        (node-set! elt ':id new-id))))

(define (extract-tree! tree smt-out)
  (for ([elt (in-tree tree)])
    (define box-model (dict-ref smt-out (dump-box elt) #f))
    (when (and box-model (list? box-model)) (extract-box! box-model elt))
    (define elt-model (dict-ref smt-out (dump-elt elt) #f))
    (when (and elt-model (list? elt-model)) (extract-elt! elt-model elt))))

(define (extract-counterexample! smt-out)
  (for ([(name value) (in-hash smt-out)])
    (when (equal? (car (split-symbol name)) 'counterexample)
      (define elt (by-name 'elt (string->symbol (car (string-split (~a value) "-")))))
      (define var (string-join (cdr (string-split (~a name) "/")) "/"))
      (node-add! elt ':cex `(bad ,var)))))

(define (tree-constraints dom emit elt)
  (emit
   `(assert
     (!
      (link-element ,(dump-elt elt)
                    ,(dump-dom dom)
                    ,(name 'elt (node-parent elt) 'nil-elt)
                    ,(name 'elt (node-prev   elt) 'nil-elt)
                    ,(name 'elt (node-next   elt) 'nil-elt)
                    ,(name 'elt (node-fchild elt) 'nil-elt)
                    ,(name 'elt (node-lchild elt) 'nil-elt))
      :named ,(sformat "tree/~a" (dump-elt elt))))))

(define (selector-constraints emit eqs)
  (emit '(echo "Generating selector constraints"))
  (for ([(prop type default) (in-css-properties)])
    (match-define (cons class-hash value-hash) (dict-ref eqs prop))
    (for ([(class value) (in-dict value-hash)])
      (define const (sformat "value/~a/~a" prop (or class 'none)))
      (if (or (eq? value '?) (css-ex? value) (css-em? value))
          (emit `(declare-const ,const ,type))
          (emit `(define-const ,const ,type ,(dump-value type value))))
      (define elts (for/list ([(elt class*) (in-dict class-hash)] #:when (equal? class class*)) elt))
      (for* ([elt1 elts] [elt2 elts] #:when (symbol<? (name 'elt elt1) (name 'elt elt2)))
        (define assertname (sformat "~a^~a^~a" const (name 'elt elt1) (name 'elt elt2)))
        (emit `(assert (! (= (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt1)))
                            (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt2))))
                          :named ,assertname))))
      (for ([elt elts])
        (define assertname (sformat "~a^~a" const (name 'elt elt)))
        (emit `(assert (! (= (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt))) ,const)
                          :named ,assertname)))))))

(define (box-element-constraints sheet doms)
  (reap [emit]
    (for ([dom doms])
      (define other (link-elts-boxes sheet (dom-elements dom) (dom-boxes dom)))
      (for ([elt (in-elements dom)])
        (define ename (name 'elt elt))
        (match (other elt)
          [#f
           (emit `(assert (! (link-anon-element ,ename) :named ,(sformat "box-element/~a" ename))))]
          [box
           (define bname (name 'box box))
           (emit `(assert (! (link-element-box ,ename ,bname) :named ,(sformat "box-element/~a" ename))))]))
      (for ([box (in-boxes dom)] #:when (not (other box)))
        (define bname (name 'box box))
        (emit `(assert (! (link-anon-box ,bname) :named ,(sformat "box-element/~a" bname))))))))

(define (dom-define-get/elt doms emit)
  (for* ([dom doms] [elt (in-elements dom)])
    (emit `(declare-const ,(dump-elt elt) Element)))
  (define body
    (for*/fold ([body 'no-elt]) ([dom doms] [elt (in-elements dom)])
      `(ite (,(sformat "is-~a" (name 'elt elt)) &elt) ,(dump-elt elt) ,body)))
  (emit `(define-fun get/elt ((&elt ElementName)) Element ,body)))

(define (dom-define-get/box doms emit)
  (for* ([dom doms] [box (in-boxes dom)])
    (emit `(declare-const ,(dump-box box) Box)))
  (define body
    (for*/fold ([body 'no-box]) ([dom doms] [box (in-boxes dom)])
      `(ite (,(sformat "is-~a" (name 'box box)) &box) ,(dump-box box) ,body)))
  (emit `(define-fun get/box ((&box BoxName)) Box ,body)))

(define (number*? x)
  (match x
    [(? number?) #t]
    [`(/ ,(? number*?) ,(? number*?)) #t]
    [_ #f]))

(define (box-constraints dom emit elt)
  (for ([cmd '(:x :y :w :h)] #:when (node-get* elt cmd #:default #f))
    (define arg (node-get elt cmd))
    (define fun (dict-ref '((:x . box-x) (:y . box-y) (:h . box-height) (:w . box-width)) cmd))
    (define expr `(,fun ,(dump-box elt)))
    (define constraint
      (match arg
        [(? number*?) `(= ,expr ,arg)]
        [`(not ,(? number*? value)) `(not (= ,expr ,value))]
        [`(between ,(? number*? min) ,(? number*? max)) `(<= ,min ,expr ,max)]))

    (emit `(assert (! ,constraint :named ,(sformat "~a/~a" fun (name 'box elt)))))))

(define (style-constraints dom emit elt)
  (when (node-get elt ':style)
    (define style (css-denormalize-body (node-get elt ':style)))
    (for ([(prop type default) (in-css-properties)])
      (match (dict-ref style prop #f)
        ['(?) (void)]
        [(list val)
         (emit `(assert (! (= (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt)))
                              ,(dump-value type val))
                           :named ,(sformat "style/~a/~a" (name 'elt elt) prop))))]
        [#f
         (define value (dump-value type (if (equal? prop 'text-align) 'left default)))
         (emit `(assert (! (= (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt))) ,value)
                           :named ,(sformat "style/~a/~a" (name 'elt elt) prop))))])))) 

(define (box-link-constraints dom emit elt)
  (define cns
    (match (node-type elt)
      ['BLOCK 'link-block-box]
      ['VIEW  'link-block-box]
      ['ANON 'link-block-box]
      ['MAGIC 'link-block-box]
      ['LINE 'link-line-box]
      ['INLINE 'link-inline-box]
      ['TEXT 'link-text-box]))
  (emit `(assert (! (,cns ,(dump-box elt)
                          ,(name 'box elt)
                          ,(name 'box (node-parent elt) 'nil-box)
                          ,(name 'box (node-prev elt) 'nil-box)
                          ,(name 'box (node-next elt) 'nil-box)
                          ,(name 'box (node-fchild elt) 'nil-box)
                          ,(name 'box (node-lchild elt) 'nil-box))
                    :named ,(sformat "link-box/~a" (name 'box elt))))))

(define (layout-constraints dom emit elt)
  (define cns
    (match (node-type elt)
      ['BLOCK 'a-block-box]
      ['VIEW 'a-view-box]
      ['ANON 'an-anon-block-box]
      ['MAGIC 'a-magic-box]
      ['LINE 'a-line-box]
      ['INLINE 'an-inline-box]
      ['TEXT 'a-text-box]))
  (when cns
    (emit `(assert (! (,cns ,(dump-box elt))
                      :named ,(sformat "box/~a/~a" (slower (node-type elt)) (name 'box elt)))))))

(define (info-constraints dom emit elt)
  (define tagname (dump-tag (node-type elt)))
  (define idname
    (if (equal? (node-get elt ':id) '?)
        `(idname ,(dump-elt elt))
        (dump-id (node-get elt ':id))))

  (emit `(assert (! (element-info ,(dump-elt elt) ,tagname ,idname)
                    :named ,(sformat "info/~a" (name 'elt elt))))))

(define (collect-tags-ids-classes doms)
  (reap [save-tag save-id save-class]
    (for* ([dom doms] [elt (in-elements dom)])
      (when (node-get elt ':id) (save-id (dump-id (node-get elt ':id))))
      (save-tag (dump-tag (node-type elt)))
      (when (node-get* elt ':class)
        (for-each (compose save-class dump-class) (node-get* elt ':class))))))

(define (all-constraints sheet doms)
  (define-values (tags ids classes) (collect-tags-ids-classes doms))
  (define element-names (for*/list ([dom doms] [elt (in-elements dom)]) (name 'elt elt)))
  (define box-names (for*/list ([dom doms] [elt (in-boxes dom)]) (name 'box elt)))

  (eprintf ";; ~a elements, ~a boxes\n" (length element-names) (length box-names))

  (define (global f) (reap [sow] (f doms sow)))
  (define (per-element f)
    (reap [sow] (for* ([dom doms] [elt (in-elements dom)]) (f dom sow elt))))
  (define (per-box f)
    (reap [sow] (for* ([dom doms] [box (in-boxes dom)]) (f dom sow box))))

  `((set-option :produce-unsat-cores true)
    (set-option :sat.minimize_core true)
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
    ,@(per-element style-constraints)
    ,@(per-box box-link-constraints)
    ,@(per-element info-constraints)
    ,@(box-element-constraints sheet doms)
    ,@(per-box layout-constraints)
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
