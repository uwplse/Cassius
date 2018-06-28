#lang racket
(require racket/hash
         "common.rkt" "dom.rkt" "smt.rkt" "z3.rkt" "encode.rkt" "registry.rkt" "tree.rkt" "dom.rkt"
         "selectors.rkt" "match.rkt" "solver.rkt")
(require "spec/css-properties.rkt" "spec/browser-style.rkt" "spec/tree.rkt"
         "spec/compute-style.rkt" "spec/layout.rkt" "spec/percentages.rkt"
         "spec/utils.rkt" "spec/float.rkt" "spec/colors.rkt" "spec/fonts.rkt"
         "spec/media-query.rkt" "assertions.rkt")
(module+ test (require rackunit))
(provide all-constraints add-test selector-constraints extract-core extract-counterexample! extract-tree!
         extract-ctx! model-sufficiency extract-model-sufficiency extract-model-lookback extract-test)

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

(define (extract-model-sufficiency smt-out trees)
  (for*/and ([tree trees] [elt (in-tree tree)])
    (dict-ref (extract-box (dict-ref smt-out (dump-box elt) #f)) 'ez.sufficient)))

(define (extract-model-lookback smt-out trees)
  (for*/and ([tree trees] [elt (in-tree tree)])
    (dict-ref (extract-box (dict-ref smt-out (dump-box elt) #f)) 'ez.lookback)))

(define (extract-box! z3-box box)
  (define data (curry dict-ref (extract-box z3-box)))
  (node-set! box ':x (+ (data 'x) (data 'xo)))
  (node-set! box ':y (+ (data 'y) (data 'yo)))
  (node-set! box ':w (+ (data 'bl) (data 'pl) (data 'w) (data 'pr) (data 'scroll-y) (data 'br)))
  (node-set! box ':h (+ (data 'bt) (data 'pt) (data 'h) (data 'pb) (data 'scroll-x) (data 'bb)))
  (node-set! box ':fg (data 'fg-color))
  (node-set! box ':bg (data 'bg-color)))

(define (extract-elt! result elt)
  (match-define (list 'elt spec-style comp-style is-replaced is-image intrinsic-width font) result)
  (node-set! elt ':style (extract-style spec-style)))

(define (extract-ctx! model d)
  (define ctx*
    (for/fold ([ctx (dom-properties d)]) ([(attr varname) #hash((:w . w) (:h . h) (:fs . font-size))])
      (define var (sformat "config/~a/~a" (name 'dom d) varname))
      (if (dict-has-key? model var)
          (dict-set ctx attr (list (dict-ref model var)))
          ctx)))
  (struct-copy dom d [properties ctx*]))

(define (extract-tree! tree smt-out)
  (for ([elt (in-tree tree)])
    (define box-model (dict-ref smt-out (dump-box elt) #f))
    (when (and box-model (list? box-model)) (extract-box! box-model elt))
    (define elt-model (dict-ref smt-out (dump-elt elt) #f))
    (when (and elt-model (list? elt-model)) (extract-elt! elt-model elt))))

(define (extract-test smt-out tests)
  (list-ref tests (hash-ref smt-out 'which-constraint)))

(define (extract-counterexample! smt-out bad-test)
  (define-values (bad-vars bad-body) (disassemble-forall bad-test))
  (for ([var bad-vars])
    (define smt-var (sformat "cex~a" (name 'cex (cons var bad-test))))
    (define node (by-name 'box (dict-ref (extract-box (dict-ref smt-out smt-var)) 'bid)))
    (node-add! node ':cex `(bad ,var))))

(define (tree-constraints dom emit elt)
  (emit `(assert (! (= (pelt ,(dump-elt elt)) ,(dump-elt (node-parent elt)))
                    :named ,(sformat "tree/~a" (dump-elt elt))))))

(define (rule-allows-property? rule prop)
  (match-define (list selector (? attribute? attrs) ... (and (or (? list?) '?) props) ...) rule)
  (or (set-member? props '?)
      (and (dict-has-key? props prop)
           (not (null? (dict-ref props prop))))))

(define (selector*-constraints media-params emit elts rules)
  (define ml (rule-matchlist rules elts))

  (for ([rm ml])
    (match-define (list selector (? attribute? attrs) ... (and (or (? list?) '?) props) ...) (rulematch-rule rm))
    (for ([(prop type default) (in-css-properties)] #:when (rule-allows-property? (rulematch-rule rm) prop))
      (define propname (sformat "value/~a/~a" (rulematch-idx rm) prop))
      (cond
       [(equal? '? (car (dict-ref (filter list? props) prop '(?))))
        (emit `(declare-const ,propname ,type))
        (emit `(declare-const ,(sformat "~a?" propname) Bool))]
       [else
        (emit `(define-const ,propname ,type ,(dump-value type (car (dict-ref (filter list? props) prop)))))
        (emit `(define-const ,(sformat "~a?" propname) Bool true))])))

  (define elt-classes ; Can replace `(map list elts)` below. Speeds up generating constraints, slows down solving them
    (group-by (λ (elt)
                ;; The `node-parent` here is for inheritable properties
                (cons (not (node-parent elt))
                      (for/list ([rm ml]) (set-member? (rulematch-elts rm) elt)))) elts))
  
  (for ([cls (map list elts)])
    (define elt (car cls))
    (define style `(specified-style ,(dump-elt elt)))
    (for ([elt (cdr cls)])
      (emit `(assert (= (specified-style ,(dump-elt elt)) ,style))))
    (for* ([(prop type default) (in-css-properties)])
      (define nonecond
        (for/fold ([no-match-so-far 'true])
            ([rm ml]
             #:when (set-member? (rulematch-elts rm) elt)
             #:when (rule-allows-property? (rulematch-rule rm) prop))
          (define propname (sformat "value/~a/~a" (rulematch-idx rm) prop))
          (define propname? (sformat "value/~a/~a?" (rulematch-idx rm) prop))

          (match (car (rulematch-rule rm))
            [`(media ,(? media-query? mq) ,_)
             (set! propname? `(and ,propname? ,(media-matches? media-params mq)))]
            [_ (void)])
          (emit `(assert (! (=> (and ,no-match-so-far ,propname?)
                                (= (,(sformat "style.~a" prop) ,style) ,propname))
                            :named ,(sformat "~a^~a" propname (dump-elt elt)))))
          `(and ,no-match-so-far (not ,propname?))))

      (define inheritable? (and (css-inheritable? prop) (node-parent elt)))
      (emit `(assert (! (=> ,nonecond (= (,(sformat "style.~a" prop) ,style)
                                         ,(dump-value type (if inheritable? 'inherit default))))
                        :named ,(sformat "value/none/~a^~a" prop (dump-elt elt))))))))

(define (selector-constraints emit eqs)
  (emit '(echo "Generating selector constraints"))
  (for ([(prop type default) (in-css-properties)])
    (match-define (cons class-hash value-hash) (dict-ref eqs prop))
    (for ([(class value) (in-dict value-hash)])
      (define const (sformat "value/~a/~a" prop (or class 'none)))
      (if (eq? value '?)
          (emit `(declare-const ,const ,type))
          (emit `(define-const ,const ,type ,(dump-value type value))))
      (define elts (for/list ([(elt class*) (in-dict class-hash)] #:when (equal? class class*)) elt))
      (when (eq? value '?)
        ;; Generates N^2 constraints, so only done when value unknown
        ;; When value known, these constraints would be trivial anyway, and never used
        (for* ([elt1 elts] [elt2 elts] #:when (< (name 'elt elt1) (name 'elt elt2)))
          (define assertname (sformat "~a^elt~a^elt~a" const (name 'elt elt1) (name 'elt elt2)))
          (emit `(assert (! (= (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt1)))
                               (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt2))))
                            :named ,assertname)))))
      (for ([elt elts])
        (define assertname (sformat "~a^elt~a" const (name 'elt elt)))
        (emit `(assert (! (= (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt))) ,const)
                          :named ,assertname)))))))

(define (box-element-constraints matchers doms)
  (reap [emit]
    (for ([dom doms] [matcher matchers]
          #:when true [box (in-boxes dom)])
      (match (matcher box)
        [#f
         (emit `(assert (! (match-anon-box ,(dump-box box))
                           :named ,(sformat "box-element/~a" (dump-box box)))))]
        [(list elt first? last?)
         (emit `(assert (! (match-element-box ,(dump-elt elt) ,(dump-box box) ,(if first? 'true 'false) ,(if last? 'true 'false))
                           :named ,(sformat "box-element/~a" (dump-box box)))))]))))

(define (model-sufficiency doms)
  (apply smt-and
         (for*/list ([dom doms] [box (in-boxes dom)])
           `(ez.sufficient ,(dump-box box)))))

(define (dom-define-elements doms emit)
  (for* ([dom doms] [elt (in-elements dom)])
    (emit `(declare-const ,(dump-elt elt) Element))
    (emit `(assert (= (eid ,(dump-elt elt)) ,(name 'elt elt))))
    (emit `(assert (is-elt ,(dump-elt elt))))))

(define (dom-define-boxes doms emit)
  (for* ([dom doms] [box (in-boxes dom)])
    (emit `(declare-const ,(dump-box box) Box))
    (emit `(assert (= (bid ,(dump-box box)) ,(name 'box box))))
    (emit `(assert (is-box ,(dump-box box))))))

(define (configuration-constraints params doms emit)
  (for ([dom doms])
    (define w (car (dom-context dom ':w #:default '(?))))
    (define h (car (dom-context dom ':h #:default '(?))))
    (define fs (car (dom-context dom ':fs #:default '(?))))
    (define scrollw (car (dom-context dom ':scrollw #:default '(?))))

    (define (param var) (sformat "config/~a/~a" (name 'dom dom) var))
    (define (emit-const name type value)
      (match value
        [(? number*?)
         (emit `(define-const ,name ,type ,(number->z3 value)))]
        ['?
         (emit `(declare-const ,name ,type))]
        [`(between ,(? number*? min) ,(? number*? max))
          (emit `(declare-const ,name ,type))
          (emit `(assert (<= ,(number->z3 min) ,name ,(number->z3 max))))]))

    (emit-const (param 'w) 'Real w)
    (emit-const (param 'h) 'Real h)
    (emit-const (param 'font-size) 'Real fs)
    (emit-const (param 'scrollbar-width) 'Real scrollw)
    (fs-name (param 'font-size))
    (view-width-name (param 'w))
    (view-height-name (param 'h))
    (scroll-width-name (param 'scrollbar-width))
    (dict-set! params ':fs (param 'font-size))
    (dict-set! params ':scrollbar-width (param 'scrollbar-width))
    (dict-set! params ':w (param 'w))
    (dict-set! params ':h (param 'h))))

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
        [(? number*?) (if (*fuzz*) `(< (- ,(number->z3 arg) ,(number->z3 (*fuzz*)))
                                       ,expr
                                       (+ ,(number->z3 arg) ,(number->z3 (*fuzz*))))
                          `(= ,expr ,(number->z3 arg)))]
        [`(not ,(? number*? value)) `(not (= ,expr ,(number->z3 value)))]
        [`(between ,(? number*? min) ,(? number*? max)) `(<= ,(number->z3 min) ,expr ,(number->z3 max))]))

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
         (define value (dump-value type (if (and (css-inheritable? prop) (node-parent elt)) 'inherit default)))
         (emit `(assert (! (= (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt))) ,value)
                           :named ,(sformat "style/~a/~a" (name 'elt elt) prop))))])))) 

(define (box-link-constraints dom emit box)
  (define link-function
    (if (dom-context dom ':component)
        'link-box-component
        (if (node-get* box ':component)
            'link-box-magic
            'link-box)))
  (define is-component (or (node-get* box ':component) (node-get* box ':spec)))
  (emit `(assert (= (is-component ,(dump-box box)) ,(if is-component 'true 'false))))
  (emit `(assert (! (,link-function
                     ,(dump-box box)
                     ,(dump-box (node-parent box))
                     ,(dump-box (node-prev box))
                     ,(dump-box (node-next box))
                     ,(dump-box (node-fchild box))
                     ,(dump-box (node-lchild box)))
                    :named ,(sformat "link-box/~a" (name 'box box))))))

(define (nodes-below node stop?)
  (reap [sow]
        (let loop ([node node])
          (sow node)
          (for ([child (node-children node)])
            (if (stop? child)
                (sow child)
                (loop child))))))

(define (get-node-names nodes)
  (for/hash ([node nodes] #:when (node-get node ':name #:default false))
    (values (node-get node ':name) (dump-box node))))

(define (spec-constraints fields dom emit box)
  (when (ormap (curry node-get* box) fields)
    (define nodes (nodes-below box (λ (x) (ormap (curry node-get* x) fields))))

    (for ([field fields] #:when (node-get* box field) [test (node-get* box field)] [i (in-naturals)])
      (define-values (vars body) (disassemble-forall test))

      (define ctx
        (hash-union
         (for/hash ([var vars]) (values var var))
         (hash '? (dump-box box))
         (get-node-names nodes)))
      (define spec (compile-assertion (list dom) body ctx))

      (emit `(assert (! (and
                         ,@(for/list ([vals (apply cartesian-product (map (const nodes) vars))])
                             `(let ,(map (λ (v x) (list v (dump-box x))) vars vals)
                                ,spec)))
                        :named ,(sformat "spec/~a/~a/~a" (name 'box box) (substring (~a field) 1) i)))))))

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

(define (compute-style-constraints dom emit elt)
  (emit `(assert (! (compute-style ,(dump-elt elt))
                    :named ,(sformat "compute-style/~a" (name 'elt elt))))))

(define (contents-constraints dom emit box)
  (if (set-member? '(#f " " "") (node-get box ':text))
      (emit `(assert (not (has-contents ,(dump-box box)))))
      (emit `(assert (has-contents ,(dump-box box))))))

(define (replaced-constraints dom emit elt)
  (define replaced? (set-member? '(img input iframe object textarea br) (node-type elt)))

  (if replaced?
      (emit `(assert (! (is-replaced ,(dump-elt elt)) :named ,(sformat "replaced/~a" (name 'elt elt)))))
      (emit `(assert (! (not (is-replaced ,(dump-elt elt))) :named ,(sformat "not-replaced/~a" (name 'elt elt))))))
  (when (equal? (slower (node-type elt)) 'br)
    (emit `(assert (= (intrinsic-width ,(dump-elt elt)) (intrinsic-height ,(dump-elt elt)) 0))))
  (if (equal? (slower (node-type elt)) 'img)
      (emit `(assert (! (is-image ,(dump-elt elt)) :named ,(sformat "image/~a" (name 'elt elt)))))
      (emit `(assert (! (not (is-image ,(dump-elt elt))) :named ,(sformat "not-image/~a" (name 'elt elt))))))
  (when (node-get elt ':w)
    (emit `(assert (! (= (intrinsic-width ,(dump-elt elt)) ,(node-get elt ':w))
                   :named ,(sformat "intrinsic-width/~a" (name 'elt elt))))))
  (when (node-get elt ':h)
    (emit `(assert (! (= (intrinsic-height ,(dump-elt elt)) ,(node-get elt ':h))
                   :named ,(sformat "intrinsic-height/~a" (name 'elt elt)))))))

(define (add-test doms constraints tests)
  `(,@constraints
    (declare-const which-constraint Real)
    ,@(for/reap [sow] ([(id value) (in-dict (all-by-name 'cex))])
        (define var (sformat "cex~a" value))
        (sow `(declare-const ,var Box))
        (sow `(assert ,(apply smt-or
                              (for*/list ([dom doms] [box (in-boxes dom)])
                                `(= ,var ,(dump-box box)))))))
    (assert ,(apply smt-or
                    (for/list ([test tests] [i (in-naturals)])
                      `(and (not ,test) (= which-constraint ,i)))))))

(define (sheet-constraints doms eqcls)
  (define elts (for*/list ([dom doms] [elt (in-elements dom)]) elt))
  (reap [emit] (selector-constraints emit eqcls)))

(define (sheet*-constraints params doms rules)
  (reap [emit] (for ([dom doms]) (selector*-constraints params emit (sequence->list (in-tree (dom-elements dom))) rules))))

(define (all-constraints sheets matcher doms fonts #:render? [render? true])
  (define (global f) (reap [sow] (f doms sow)))
  (define (per-element f)
    (reap [sow] (for* ([dom doms] [elt (in-elements dom)]) (f dom sow elt))))
  (define (per-box f)
    (reap [sow] (for* ([dom doms] [box (in-boxes dom)]) (f dom sow box))))
  (define media-params (make-hash '((:type . screen))))
  (define (for-render cns) (if render? cns '()))

  `((set-option :produce-unsat-cores true)
    ;(set-option :sat.minimize_core true) ;; TODO: Fix Z3 install
    (echo "Basic definitions")
    ,(make-%of)
    ,@(colors)
    ,@(make-font-datatype)
    (declare-datatypes
     ()
     (,@(for/list ([(type decl) (in-css-types)]) (cons type decl))
      (Style (style ,@(for/list ([(prop type default) (in-css-properties)])
                        `(,(sformat "style.~a" prop) ,type))))))
    (define-const border/thin Border (border/px 1))
    (define-const border/medium Border (border/px 3))
    (define-const border/thick Border (border/px 5))
    (define-const min-height/auto Min-Height (min-height/px 0))
    (define-const text-align/start Text-Align text-align/left)
    (define-const text-align/end Text-Align text-align/right)
    (define-const font-size/xx-small Font-Size (font-size/px 9))
    (define-const font-size/x-small Font-Size (font-size/px 10))
    (define-const font-size/small Font-Size (font-size/px 13))
    (define-const font-size/medium Font-Size (font-size/px 16))
    (define-const font-size/large Font-Size (font-size/px 18))
    (define-const font-size/x-large Font-Size (font-size/px 24))
    (define-const font-size/xx-large Font-Size (font-size/px 32))
    (define-const font-size/smaller Font-Size (font-size/em (/ 2.0 3.0)))
    (define-const font-size/larger Font-Size (font-size/em (/ 3.0 2.0)))
    (define-const font-weight/normal Font-Weight (font-weight/num 400))
    (define-const font-weight/bold Font-Weight (font-weight/num 700))
    (define-const color/undefined Color color/transparent)
    ,@(make-font-table fonts)
    ,(make-get-font fonts)
    ,@(for/list ([(name value) color-table])
        `(define-const ,(sformat "color/~a" name) Color ,(dump-value 'Color value)))
    ,@(common-definitions)
    ,@(exclusion-zones)
    ,@(tree-types)
    ,@(global dom-define-elements)
    ,@(global dom-define-boxes)
    ,@(global (curry configuration-constraints media-params))
    ,@(utility-definitions)
    ,@(link-definitions)
    ,@(for-render (style-computation))
    ,@(for-render (sheet*-constraints media-params doms (apply append sheets)))
    ,@(per-element tree-constraints)
    ,@(per-box box-link-constraints)
    ,@(per-box box-constraints)
    ,@(box-element-constraints matcher doms)
    ,@(for-render (per-element style-constraints))
    ,@(ez-fields)
    ,@(for-render (ez-field-compute))
    ,@(for-render (per-element compute-style-constraints))
    ,@(per-element replaced-constraints)
    ,@(per-box contents-constraints)
    ,@(font-computation)
    ,@(boxref-definitions)
    ,@(for-render (layout-definitions))
    ,@(per-box (curry spec-constraints (if render? '(:spec) '(:spec :assert :admit))))
    ,@(for-render (per-box layout-constraints))
    ))
