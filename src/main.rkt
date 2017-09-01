#lang racket
(require "common.rkt" "dom.rkt" "smt.rkt" "z3.rkt" "encode.rkt" "registry.rkt" "tree.rkt" "dom.rkt"
         "selectors.rkt" "match.rkt" "solver.rkt")
(require "spec/css-properties.rkt" "spec/browser-style.rkt" "spec/tree.rkt"
         "spec/compute-style.rkt" "spec/layout.rkt" "spec/percentages.rkt"
         "spec/utils.rkt" "spec/float.rkt" "spec/colors.rkt" "spec/fonts.rkt")
(module+ test (require rackunit))
(provide all-constraints add-test selector-constraints extract-core extract-counterexample! extract-tree!
         css-values-solver extract-ctx! model-sufficiency extract-model-sufficiency)

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
    (define box-model (dict-ref smt-out (dump-box elt) #f))

    (match-define
     (list 'box
           type x y w h xo yo mt mr mb ml mtp mtn mbp mbn
           pt pr pb pl bt br bb bl stfwidth stfmax fstfmax w-from-stfwidth
           &pbox &vbox &nbox &fbox &lbox
           width-set font-sizev leading min-top max-bottom text-top text-bottom clh
           &nflow &vflow &ppflow &pbflow &anc-elt ez.in ez.out ez.sufficient
           has-contents? lh textalign &elt first? last?
           extra ...
           color background-color ancestor)
     box-model)
    (unless (= (length extra) (length (extra-pointers)))
      (error "You forgot to add your new Box field to L66 in src/main.rkt"))
    ez.sufficient))

(define (extract-box! z3-box box)
  (match-define
   (list 'box
         type x y w h xo yo mt mr mb ml mtp mtn mbp mbn
         pt pr pb pl bt br bb bl stfwidth stfmax fstfmax w-from-stfwidth
         &pbox &vbox &nbox &fbox &lbox
         width-set font-size leading min-top max-bottom text-top text-bottom clh
         &nflow &vflow &ppflow &pbflow &anc-elt ez.in ez.out ez.sufficient
         has-contents? lh textalign &elt first? last?
         extra ...
         color background-color ancestor)
   z3-box)
  (unless (= (length extra) (length (extra-pointers)))
    (error "You forgot to add your new Box field to L82 in src/main.rkt"))
  (define box-width (+ bl pl w pr br))
  (define box-height (+ bt pt h pb bb))
  (define box-x (+ x xo))
  (define box-y (+ y yo))
  (node-set! box ':x box-x)
  (node-set! box ':y box-y)
  (node-set! box ':w box-width)
  (node-set! box ':h box-height)
  (node-set! box ':fs font-size)
  (node-set! box ':fg (extract-value color))
  (node-set! box ':bg (extract-value background-color))
  (node-set! box ':l leading)
  (node-set! box ':fs font-size)
  (when (>= &elt 0) (node-set! box ':elt &elt)))

(define (extract-elt! result elt)
  (match-define (list 'elt spec-style comp-style &pelt &velt &nelt &felt &lelt fid) result)
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

  (for* ([(prop type default) (in-css-properties)] [elt elts])
    (define nonecond
      (for/fold ([no-match-so-far 'true])
          ([rm ml]
           #:when (selector-matches? (car (rulematch-rule rm)) elt)
           #:when (rule-allows-property? (rulematch-rule rm) prop))
        (define propname (sformat "value/~a/~a" (rulematch-idx rm) prop))
        (define propname? (sformat "value/~a/~a?" (rulematch-idx rm) prop))
        (emit `(assert (! (=> (and ,no-match-so-far ,propname?)
                              (= (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt))) ,propname))
                          :named ,(sformat "~a^~a" propname (dump-elt elt)))))
        `(and ,no-match-so-far (not ,propname?))))
    (emit `(assert (! (=> ,nonecond (= (,(sformat "style.~a" prop) (specified-style ,(dump-elt elt)))
                                       ,(dump-value type (if (and (css-inheritable? prop) (node-parent elt)) 'inherit default))))
                      :named ,(sformat "value/none/~a^~a" prop (dump-elt elt)))))))

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
  (apply
   smt-and
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

    (emit `(assert (= (w ,(dump-box (dom-boxes dom))) ,(param 'w))))
    (emit `(assert (= (h ,(dump-box (dom-boxes dom))) ,(param 'w))))
    (emit `(assert (= (font-size ,(dump-box (dom-boxes dom))) ,(param 'font-size))))))

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

(define (font-constraints dom emit elt)
  (when (node-get elt ':fid)
    (emit `(assert (= (fid ,(dump-elt elt)) ,(node-get elt ':fid))))))

(define (replaced-constraints dom emit elt)
  (define replaced? (set-member? '(img input object) (node-type elt)))

  (if replaced?
      (emit `(assert (! (is-replaced ,(dump-elt elt)) :named ,(sformat "replaced/~a" (name 'elt elt)))))
      (emit `(assert (! (not (is-replaced ,(dump-elt elt))) :named ,(sformat "not-replaced/~a" (name 'elt elt))))))
  (when (node-get elt ':w)
    (emit `(assert (! (= (intrinsic-width ,(dump-elt elt)) ,(node-get elt ':w))
                   :named ,(sformat "intrinsic-width/~a" (name 'elt elt))))))
  (when (node-get elt ':h)
    (emit `(assert (! (= (intrinsic-height ,(dump-elt elt)) ,(node-get elt ':h))
                   :named ,(sformat "intrinsic-height/~a" (name 'elt elt)))))))

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
    (define-const color/undefined Color color/transparent)
    ,(make-font-table fonts)
    ,@(for/list ([(name value) color-table])
        `(define-const ,(sformat "color/~a" name) Color ,(dump-value 'Color value)))
    ,@(common-definitions)
    ,@(exclusion-zones)
    ,@(tree-types)
    ,@(utility-definitions)
    ,@(global dom-define-get/elt)
    ,@(global dom-define-get/box)
    ,@(global configuration-constraints)
    ;,@css-functions
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
    ,@(per-element font-constraints)
    ,@(per-box contents-constraints)
    ,@(per-box layout-constraints)
    ))

(define (add-test doms constraints tests)
  (match-define (list (list 'forall varss bodies) ...) tests)
  (when (check-duplicates (apply append varss))
    (error "Duplicate variable names in assertions!"))
  (define max-ptr (apply max (dict-values (all-by-name 'box))))

  `(,@constraints
    ,@(for/reap [sow] ([(id value) (in-dict (all-by-name 'cex))])
        (define var (sformat "cex~a" value))
        (sow `(declare-const ,var Int))
        (sow `(assert (<= 0 ,var ,max-ptr))))
    (assert ,(apply smt-or (map (curry list 'not) bodies)))))

(define z3-process-cache (make-parameter (make-hash)))

(define (css-values-solver inputs constraints)
  (match-define (list doms matchings sketch) inputs)
  ;; constraints is empty, all that is contained in boxes

  ;; TODO Print progress & phases
  (define z3 (hash-ref! (z3-process-cache) (list doms matchings)
                        (λ () (let* ([query ((if (set-member? (flags) 'z3o) z3-prepare z3-clean)
                                             (all-constraints matchings doms))]
                                     [z3p (z3-process)])
                                (z3-send z3p query)
                                (z3-send z3p '((push)))
                                z3p))))

  (define browser-style (get-sheet (and (dom-context (car doms) ':browser) (car (dom-context  (car doms) ':browser)))))

  ;(define elts (append-map (compose sequence->list in-tree dom-elements) doms))
  ;(define eqcls (equivalence-classes (append browser-style sketch) elts))
  (z3-send z3 (append '((pop) (push)) (sheet*-constraints doms (append browser-style sketch))))

  (match (z3-check-sat z3 #:strategy cassius-check-sat)
    [(list 'model m)
     (list 'fwd doms matchings (drop (extract-sheet (append browser-style sketch) m) (length browser-style)))]
    [(list 'core c)
     (pretty-print c)
     (list 'bwd #;(extract-ineqs eqcls c)
           )]))

(define (sheet-constraints doms eqcls)
  (define elts (for*/list ([dom doms] [elt (in-elements dom)]) elt))
  (reap [emit] (selector-constraints emit eqcls)))

(define (sheet*-constraints doms rules)
  (reap [emit] (for ([dom doms]) (selector*-constraints emit (sequence->list (in-tree (dom-elements dom))) rules))))

(define (extract-sheet sheet m)
  (for/list ([rule sheet] [idx (in-naturals)])
    (match-define (list selector (? attribute? attrs) ... (and (or (? list?) '?) props) ...) rule)
    `(,selector
      ,@attrs
      ,@
      (filter (λ (x) (and (list? x) (= (length x) 2) (not (equal? (second x) '?))))
              (for/fold ([props props])
                  ([(prop type default) (in-css-properties)]
                   #:when (dict-ref m (sformat "value/~a/~a?" idx prop) #f))
                (define value (extract-value (dict-ref m (sformat "value/~a/~a" idx prop))))
                (let loop ([props props])
                  (cond
                   [(equal? '(?) props)
                    (cons (list prop value) props)]
                   [(equal? (caar props) prop)
                    (cons (list prop value) (cdr props))]
                   [else
                    (cons (car props) (loop (cdr props)))])))))))

(define (extract-ineqs eqcls core)
  (for/list ([var (map split-line-name core)] #:when (equal? (caar var) 'value))
    (match var
      [`((value ,prop ,cls) (,elt1) (,elt2))
       `(not (= (,prop ,(by-name 'elt elt1)) (,prop ,(by-name 'elt elt2))))]
      [`((value ,prop ,cls) (,elt1))
       (define cls* (if (equal? cls 'none) #f cls))
       (define value (dict-ref (cdr (dict-ref eqcls prop)) cls*))
       `(not (= (,prop ,(by-name 'elt elt1)) ,value))])))

(module+ test
  (require "match.rkt")

  (define elts
    '([html] ; 0
      ([body] ; 1
       ([div])))) ; 2

  (define boxes
    '([VIEW :w 400 :h 400]
      ([BLOCK :w 400 :h 105 :x 0 :y 0]
       ([BLOCK :w 400 :h 100 :x 0 :y 5]
        ([BLOCK :w 200 :h 100 :x 100 :y 5])))))

  (define css-sketch
    '(((tag div) [width ?] [margin-left ?] [height ?])
      ((tag body) [margin-top ?])))

  (define dom* (dom 'test '() (parse-tree elts) (parse-tree boxes)))
  (define matching (link-elts-boxes css-sketch (dom-elements dom*) (dom-boxes dom*)))

  (define input (list (list dom*) (list matching) css-sketch))

  (check-match (css-values-solver input #f)
               (list 'fwd (list (== dom*)) (list (== matching))
                     `(((tag div) [width (px ,(== 200 =))] [margin-left (px ,(== 100 =))] [height (px ,(== 100 =))])
                       ((tag body) [margin-top (px ,(== 5 =))])))))
