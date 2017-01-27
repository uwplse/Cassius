#lang racket
(require "common.rkt" "dom.rkt" "smt.rkt" "z3.rkt" "encode.rkt" "registry.rkt" "tree.rkt"
         "selectors.rkt" "match.rkt"
         "spec/css-properties.rkt" "spec/browser-style.rkt" "spec/tree.rkt" "spec/layout.rkt")
(module+ test (require rackunit))
(provide all-constraints add-test selector-constraints extract-core extract-counterexample! extract-tree!
         css-values-solver)



(define cassius-check-sat
  '(check-sat-using
    (then
     (! propagate-values
        :push_ite_arith true
        :algebraic_number_evaluator false
        :bit2bool false
        :local_ctx true
        :hoist_mul true
        :flat false)
     nnf occf smt)))

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
                    ,(name 'elt (node-parent elt) 'nil-elt)
                    ,(name 'elt (node-prev   elt) 'nil-elt)
                    ,(name 'elt (node-next   elt) 'nil-elt)
                    ,(name 'elt (node-fchild elt) 'nil-elt)
                    ,(name 'elt (node-lchild elt) 'nil-elt))
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
                                       ,(dump-value type (if (equal? type 'Text-Align) 'left default))))
                      :named ,(sformat "value/none/~a^~a" prop (dump-elt elt)))))))

(define (selector-constraints emit eqs)
  (emit '(echo "Generating selector constraints"))
  ;; There are a lot of display values we don't support, which is why we ignore them.
  (for ([(prop type default) (in-css-properties)] #:unless (equal? prop 'display))
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

(define (box-element-constraints matchers doms)
  (reap [emit]
    (for ([dom doms] [matcher matchers])
      (for ([elt (in-elements dom)])
        (define ename (name 'elt elt))
        (match (matcher elt)
          [#f
           (emit `(assert (! (link-anon-element ,ename) :named ,(sformat "box-element/~a" ename))))]
          [box
           (define bname (name 'box box))
           (emit `(assert (! (link-element-box ,ename ,bname) :named ,(sformat "box-element/~a" ename))))]))
      (for ([box (in-boxes dom)] #:when (not (matcher box)))
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

  (emit `(assert (! (element-info ,(dump-elt elt))
                    :named ,(sformat "info/~a" (name 'elt elt))))))

(define (collect-tags-ids-classes doms)
  (reap [save-tag save-id save-class]
    (for* ([dom doms] [elt (in-elements dom)])
      (when (node-get elt ':id) (save-id (dump-id (node-get elt ':id))))
      (save-tag (dump-tag (node-type elt)))
      (when (node-get* elt ':class)
        (for-each (compose save-class dump-class) (node-get* elt ':class))))))

(define (all-constraints matcher doms)
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
    ;(set-option :sat.minimize_core true) ;; TODO: Fix Z3 install
    (echo "Basic definitions")
    (declare-datatypes
     () ; No parameters
     ((ElementName ,@element-names nil-elt)
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
    ,@(per-element tree-constraints)
    ,@(per-box box-constraints)
    ,@(per-element style-constraints)
    ,@(per-box box-link-constraints)
    ,@(per-element info-constraints)
    ,@(box-element-constraints matcher doms)
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
