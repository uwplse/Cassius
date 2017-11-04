#lang racket
(require "common.rkt" "dom.rkt" "smt.rkt" "z3.rkt" "encode.rkt" "registry.rkt" "tree.rkt" "dom.rkt"
         "selectors.rkt" "match.rkt" "solver.rkt")
(require "spec/css-properties.rkt" "spec/browser-style.rkt" "spec/tree.rkt"
         "spec/compute-style.rkt" "spec/layout.rkt" "spec/percentages.rkt"
         "spec/utils.rkt" "spec/float.rkt" "spec/colors.rkt")
(module+ test (require rackunit))
(provide all-constraints add-test selector-constraints extract-core extract-counterexample! extract-tree!
         extract-ctx! model-sufficiency extract-model-sufficiency extract-model-lookback)

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
  (node-set! box ':w (+ (data 'bl) (data 'pl) (data 'w) (data 'pr) (data 'br)))
  (node-set! box ':h (+ (data 'bt) (data 'pt) (data 'h) (data 'pb) (data 'bb)))
  (node-set! box ':fs (data 'font-size))
  (node-set! box ':fg (data 'fg-color))
  (node-set! box ':bg (data 'bg-color))
  (node-set! box ':l (data 'leading))
  (when (>= (data '&elt) 0) (node-set! box ':elt (data '&elt))))

(define (extract-elt! result elt)
  (match-define (list 'elt spec-style comp-style &pelt &velt &nelt &felt &lelt) result)
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

(define (extract-counterexample! smt-out)
  (for ([(name value) (in-hash smt-out)] #:when (string-prefix? (~a name) "cex"))
    (define node (by-name 'box value))
    (define var (car (by-name 'cex (string->number (substring (~a name) 3)))))
    (node-add! node ':cex `(bad ,var))))

(define (tree-constraints dom emit elt)
  (emit
   `(assert
     (!
      (link-element ,(dump-elt elt)
                    ,(name 'elt (node-parent elt) -1)
                    ,(name 'elt (node-prev   elt) -1)
                    ,(name 'elt (node-next   elt) -1)
                    ,(name 'elt (node-fchild elt) -1)
                    ,(name 'elt (node-lchild elt) -1))
      :named ,(sformat "tree/~a" (dump-elt elt))))))

(define (rule-allows-property? rule prop)
  (match-define (list selector (? attribute? attrs) ... (and (or (? list?) '?) props) ...) rule)
  (or (set-member? props '?)
      (and (dict-has-key? props prop)
           (not (null? (dict-ref props prop))))))

(define (selector*-constraints emit elts rules)
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

  (define elt-classes
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
             #:when (rule-allows-property? (rulematch-rule rm) prop)
             #:when (selector-matches? (car (rulematch-rule rm)) elt))
          (define propname (sformat "value/~a/~a" (rulematch-idx rm) prop))
          (define propname? (sformat "value/~a/~a?" (rulematch-idx rm) prop))
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
         (emit `(assert (! (match-anon-box ,(name 'box box))
                           :named ,(sformat "box-element/~a" (dump-box box)))))]
        [(list elt first? last?)
         (emit `(assert (! (match-element-box ,(name 'elt elt) ,(name 'box box) ,(if first? 'true 'false) ,(if last? 'true 'false))
                           :named ,(sformat "box-element/~a" (dump-box box)))))]))))

(define (model-sufficiency doms)
  (apply smt-and
         (for*/list ([dom doms] [box (in-boxes dom)])
           `(ez.sufficient ,(dump-box box)))))

(define (dom-define-get/elt doms emit)
  (for* ([dom doms] [elt (in-elements dom)])
    (emit `(declare-const ,(dump-elt elt) Element))
    (emit `(assert (is-elt ,(dump-elt elt)))))
  (define body
    (for*/fold ([body '(ite (= &elt -1) no-elt no-elt)]) ([dom doms] [elt (in-elements dom)])
      `(ite (= &elt ,(name 'elt elt)) ,(dump-elt elt) ,body)))
  (emit `(define-fun get/elt ((&elt Int)) Element ,body)))

(define (dom-define-get/box doms emit)
  (for* ([dom doms] [box (in-boxes dom)])
    (emit `(declare-const ,(dump-box box) Box))
    (emit `(assert (is-box ,(dump-box box)))))
  (define body
    (for*/fold ([body '(ite (= &box -1) no-box no-box)]) ([dom doms] [box (in-boxes dom)])
      `(ite (= &box ,(name 'box box)) ,(dump-box box) ,body)))
  (emit `(define-fun get/box ((&box Int)) Box ,body)))

(define (configuration-constraints doms emit)
  (for ([dom doms])
    (define w (car (dom-context dom ':w #:default '(?))))
    (define h (car (dom-context dom ':h #:default '(?))))
    (define fs (car (dom-context dom ':fs #:default '(?))))

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
    (fs-name (param 'font-size))

    (emit `(assert (= (w ,(dump-box (dom-boxes dom))) ,(param 'w))))
    (emit `(assert (= (h ,(dump-box (dom-boxes dom))) ,(param 'h))))
    (emit `(assert (= (font-size ,(dump-box (dom-boxes dom))) ,(param 'font-size))))))

(define (number*? x)
  (match x
    [(? number?) #t]
    [`(/ ,(? number*?) ,(? number*?)) #t]
    [_ #f]))

(define (box-constraints dom emit elt)
  (for ([cmd '(:x :y :w :h :mtp :mbp)] #:when (node-get* elt cmd #:default #f))
    (define arg (node-get elt cmd))
    (define fun (dict-ref '((:x . box-x) (:y . box-y) (:h . box-height) (:w . box-width) (:mbp . mbp) (:mtp . mtp)) cmd))
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

(define (box-link-constraints dom emit elt)
  (emit `(assert (! (link-box
                     ,(dump-box elt)
                     ,(name 'box (node-parent elt) -1)
                     ,(name 'box (node-prev elt) -1)
                     ,(name 'box (node-next elt) -1)
                     ,(name 'box (node-fchild elt) -1)
                     ,(name 'box (node-lchild elt) -1))
                    :named ,(sformat "link-box/~a" (name 'box elt))))))

(define (box-flow-constraints dom emit elt)
  (define (flow-linker b e)
    (match (node-type elt)
      [(or 'BLOCK 'MAGIC 'ANON) `(link-flow-block ,b ,e)]
      ['VIEW `(link-flow-root ,b ,e)]
      [(or 'LINE 'INLINE 'TEXT) `(link-flow-simple ,b ,e)]))

  (emit `(assert (! ,(flow-linker (dump-box elt) (name 'box elt))
                    :named ,(sformat "link-flow/~a" (name 'box elt))))))

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
  (define replaced? (set-member? '(img input iframe object textarea) (node-type elt)))

  (if replaced?
      (emit `(assert (! (is-replaced ,(dump-elt elt)) :named ,(sformat "replaced/~a" (name 'elt elt)))))
      (emit `(assert (! (not (is-replaced ,(dump-elt elt))) :named ,(sformat "not-replaced/~a" (name 'elt elt))))))
  (when (node-get elt ':w)
    (emit `(assert (! (= (intrinsic-width ,(dump-elt elt)) ,(node-get elt ':w))
                   :named ,(sformat "intrinsic-width/~a" (name 'elt elt))))))
  (when (node-get elt ':h)
    (emit `(assert (! (= (intrinsic-height ,(dump-elt elt)) ,(node-get elt ':h))
                   :named ,(sformat "intrinsic-height/~a" (name 'elt elt)))))))

(define (add-test doms constraints tests)
  `(,@constraints
    ,@(for/reap [sow] ([(id value) (in-dict (all-by-name 'cex))])
        (define var (sformat "cex~a" value))
        (sow `(declare-const ,var Int))
        (sow `(assert ,(apply smt-or
                              (for*/list ([dom doms] [box (in-boxes dom)])
                                `(= ,var ,(name 'box box)))))))
    (assert ,(apply smt-or (map (curry list 'not) tests)))))

(define (sheet-constraints doms eqcls)
  (define elts (for*/list ([dom doms] [elt (in-elements dom)]) elt))
  (reap [emit] (selector-constraints emit eqcls)))

(define (sheet*-constraints doms rules)
  (reap [emit] (for ([dom doms]) (selector*-constraints emit (sequence->list (in-tree (dom-elements dom))) rules))))

(define (all-constraints sheets matcher doms fonts)
  (define (global f) (reap [sow] (f doms sow)))
  (define (per-element f)
    (reap [sow] (for* ([dom doms] [elt (in-elements dom)]) (f dom sow elt))))
  (define (per-box f)
    (reap [sow] (for* ([dom doms] [box (in-boxes dom)]) (f dom sow box))))


  `((set-option :produce-unsat-cores true)
    ;(set-option :sat.minimize_core true) ;; TODO: Fix Z3 install
    (echo "Basic definitions")
    ,(make-%of)
    ,@(colors)
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
    (define-const color/undefined Color color/transparent)
    ,@(for/list ([(name value) color-table])
        `(define-const ,(sformat "color/~a" name) Color ,(dump-value 'Color value)))
    ,@(common-definitions)
    ,@(exclusion-zones)
    ,@(tree-types)
    ,@(global dom-define-get/elt)
    ,@(global dom-define-get/box)
    ,@(global configuration-constraints)
    ,@(utility-definitions)
    ,@(link-definitions)
    ,@(style-computation)
    ,@(layout-definitions)
    ,@(sheet*-constraints doms (apply append sheets))
    ,@(per-element tree-constraints)
    ,@(per-box box-link-constraints)
    ,@(per-box box-constraints)
    ,@(box-element-constraints matcher doms)
    ,@(per-element style-constraints)
    ,@(per-box box-flow-constraints)
    ,@(per-element compute-style-constraints)
    ,@(per-element replaced-constraints)
    ,@(per-box contents-constraints)
    ,@(per-box layout-constraints)
    ))
