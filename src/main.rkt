#lang racket
(require racket/hash)
(require "common.rkt" "dom.rkt" "smt.rkt" "encode.rkt" "tree.rkt" "selectors.rkt")
(require "spec/css-properties.rkt" "spec/tree.rkt" "spec/compute-style.rkt" "spec/layout.rkt"
         "spec/percentages.rkt" "spec/utils.rkt" "spec/float.rkt" "spec/colors.rkt" "spec/fonts.rkt"
         "spec/media-query.rkt" "assertions.rkt" "spec/replaced-elements.rkt" "spec/browser.rkt" "modularize.rkt")
(provide all-constraints)

;; The constraints

(define (tree-constraints dom emit elt)
  (emit `(assert (= (pelt ,(dump-elt elt)) ,(dump-elt (node-parent elt))))))

(define (selector-constraints emit elts rules)
  (define ml (rule-matchlist rules elts))

  (for ([rm ml])
    (match-define (list selector (? attribute? attrs) ... (and (or (? list?) '?) props) ...) (rulematch-rule rm))
    (for ([(prop type default) (in-css-properties)]
          #:when (rule-allows-property? (rulematch-rule rm) prop))
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
             (set! propname? `(and ,propname? ,(media-matches? 'screen mq)))]
            [_ (void)])
          (emit `(assert (=> (and ,no-match-so-far ,propname?)
                             (= (,(sformat "style.~a" prop) ,style) ,propname))))
          `(and ,no-match-so-far (not ,propname?))))

      (define inheritable? (and (css-inheritable? prop) (node-parent elt)))
      (emit `(assert (=> ,nonecond (= (,(sformat "style.~a" prop) ,style)
                                      ,(dump-value type (if inheritable? 'inherit default)))))))))

(define (box-element-constraints doms)
  (reap [emit]
    (for* ([dom doms] [box (in-boxes dom)])
      (emit `(assert (= (box-elt ,(dump-box box)) ,(dump-elt (dom-box->elt dom box))))))))

(define (box-first-last-constraints doms)
  (reap [emit]
    (for* ([dom doms] [box (in-boxes dom)])
      (emit `(assert (= (first-box? ,(dump-box box))
                           ,(if (dom-first-box? dom box) 'true 'false))))
      (emit `(assert (= (last-box? ,(dump-box box))
                           ,(if (dom-last-box? dom box) 'true 'false)))))))

(define (dom-define-elements doms emit)
  (for* ([dom doms] [elt (in-elements dom)])
    (emit `(declare-const ,(dump-elt elt) Element))
    (emit `(assert (= (eid ,(dump-elt elt)) ,(node-id elt))))
    (emit `(assert (is-elt ,(dump-elt elt))))))

(define (dom-define-boxes doms emit)
  (for* ([dom doms] [box (in-boxes dom)])
    (emit `(declare-const ,(dump-box box) Box))
    (emit `(assert (= (bid ,(dump-box box)) ,(node-id box))))
    (emit `(assert (is-box ,(dump-box box))))))

(define (configuration-constraints doms emit)
  (for ([dom doms])
    (define browser (sformat "browser/~a" (dom-name dom)))
    (the-browser browser)
    (emit `(declare-const ,browser Browser))
    (for ([(key field) (in-hash browser-fields)])
      (define const `(,(sformat "browser.~a" field) ,browser))
      (match (car (dom-context dom key #:default '(?)))
        [(? number? value)
         (emit `(assert (= ,const ,value)))]
        ['?
         (void)]
        [`(between ,(? number? min) ,(? number? max))
          (emit `(assert (<= ,min ,const ,max)))]))))

(define (position-constraints dom emit elt)
  (for ([cmd '(:x :y :w :h)] #:when (node-get* elt cmd #:default #f))
    (define arg (node-get elt cmd))
    (define fun (dict-ref '((:x . box-x) (:y . box-y) (:h . box-height) (:w . box-width)) cmd))
    (define expr `(,fun ,(dump-box elt)))
    (define constraint
      (match arg
        [(? number?)
         (if (*fuzz*)
             `(< (- ,arg ,(*fuzz*)) ,expr (+ ,arg ,(*fuzz*)))
             `(= ,expr ,arg))]
        [`(not ,(? number? value)) `(not (= ,expr ,value))]
        [`(between ,(? number? min) ,(? number? max)) `(<= ,min ,expr ,max)]))

    (emit `(assert (! ,constraint :named ,(sformat "~a/~a" fun (node-id elt)))))))

;Sets up the special constraints needed to do a proof by induction on a given list
(define (inductive-list-constraints dom emit box)
  ;Note the header and footer of the list
  (define header (node-fchild box))
  (define footer (node-lchild box))
  ;Note the box after the header and before the footer
  (define leftbox (node-next header))
  (define rightbox (node-prev footer))
  ;Explicitely say what the neighbors and parent of the header are
  (emit `(assert (and (= (pbox (dump-box header)) (dump-box box)) (= (vbox (dump-box header)) 0) (= (nbox (dump-box header)) (dump-box leftbox)))))
  ;Explicitly state what the neighbors and parent of the footer are
  (emit `(assert (and (= (pbox (dump-box footer)) (dump-box box)) (= (vbox (dump-box footer)) (dump-box rightbox)) (= (nbox (dump-box footer)) 0))))
  ;Explicity state leftbox's neighbors and parent, leaving its next up to z3
  (emit `(assert (and (= (pbox (dump-box leftbox)) (dump-box box)) (= (vbox (dump-box leftbox)) (dump-box header)))))
  ;Explicitely state rightbox's neighbors and parent, leaving its previous up to z3
  (emit `(addert (and (= (pbox (dump-box rightbox)) (dump-box box)) (= (nbox (dump-box rightbox)) (dump-box footer))))))

(define (box-tree-constraints dom emit box)
  (define link-function
    (if (dom-context dom ':component)
        'link-box-component
        (if (node-get* box ':component)
            'link-box-magic
            'link-box)))
  (emit `(assert (= (is-component ,(dump-box box)) ,(if (is-component box) 'true 'false))))
  (emit `(assert (,link-function
                  ,(dump-box box)
                  ,(dump-box (node-parent box))
                  ,(dump-box (node-prev box))
                  ,(dump-box (node-next box))
                  ,(dump-box (node-fchild box))
                  ,(dump-box (node-lchild box))))))


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
    (emit `(assert (,cns ,(dump-box elt))))))

(define (compute-style-constraints dom emit elt)
  (emit `(assert (compute-style ,(dump-elt elt)))))

(define (contents-constraints dom emit box)
  (if (set-member? '(#f " " "") (node-get box ':text))
      (emit `(assert (not (has-contents ,(dump-box box)))))
      (emit `(assert (has-contents ,(dump-box box))))))

(define (replaced-constraints dom emit elt)
  (emit `(assert (= (is-replaced ,(dump-elt elt)) ,(if (element-replaced? elt) 'true 'false))))
  (emit `(assert (= (is-image ,(dump-elt elt)) ,(if (element-image? elt) 'true 'false))))

  (when (element-br? elt)
    ;; The height is drawn from font information but we ignore that here
    (emit `(assert (= (/ 1 60) (intrinsic-width ,(dump-elt elt))))))
  (when (node-get elt ':w)
    (emit `(assert (= (intrinsic-width ,(dump-elt elt)) ,(node-get elt ':w)))))
  (when (node-get elt ':h)
    (emit `(assert (= (intrinsic-height ,(dump-elt elt)) ,(node-get elt ':h))))))

(define (declare-constants)
  (reap [sow]
    (for ([(type consts*) (in-dict css-constants)])
      ;; The CSS constants can use other constants, so we do a little loop here
      (define consts (hash-copy consts*))
      (let loop ()
        (unless (hash-empty? consts)
          (define to-do
            (for/list ([(const value) (in-hash consts)] #:unless (hash-has-key? consts value))
              const))
          (for ([(const value) (in-hash consts)] #:when (set-member? to-do const))
            (sow `(define-const ,(dump-value type const) ,type ,(dump-value type value))))
          (for ([key to-do]) (hash-remove! consts key))
          (loop))))))

(define (sheet-constraints doms rules)
  (reap [emit]
        (for ([dom doms])
          (selector-constraints emit (sequence->list (in-tree (dom-elements dom))) rules))))

(define (all-constraints sheets doms fonts #:render? [render? true])
  (define (global f) (reap [sow] (f doms sow)))
  (define (per-element f)
    (reap [sow] (for* ([dom doms] [elt (in-elements dom)]) (f dom sow elt))))
  (define (per-box f)
    (reap [sow] (for* ([dom doms] [box (in-boxes dom)]) (f dom sow box))))
  (define (for-render f . args) (if render? (apply f args) '()))

  (*%* (set-union (*%*) (gather-percentages sheets)))

  `((set-option :produce-unsat-cores true)
    ;(set-option :sat.minimize_core true) ;; TODO: Fix Z3 install
    (echo "Basic definitions")
    ,@(for-render make-%of)
    ,@(browser-definition)
    ,@(colors)
    (declare-datatypes
     ()
     (,@(for/list ([(type decl) (in-css-types)]
                   #:when (or render? (set-member? '(Color Float) type)))
          (cons type decl))
      (Style 
       ,(if render?
            `(style ,@(for/list ([(prop type default) (in-css-properties)])
                        `(,(sformat "style.~a" prop) ,type)))
            'style))))
    ,@(for-render declare-constants)
    ,@(for/list ([(name value) color-table])
        `(define-const ,(dump-value 'Color name) Color ,(dump-value 'Color value)))
    ,@(common-definitions)
    ,@(exclusion-zones)
    ,@(tree-types)
    ,@(font-datatype)
    ,@(for-render make-get-font fonts)
    ,@(for-render global dom-define-elements)
    ,@(global dom-define-boxes)
    ,@(global configuration-constraints)
    ,@(for-render element-definitions)
    ,@(utility-definitions)
    ,@(link-common)
    ,@(for-render link-definitions)
    ,@(for-render style-computation)
    ,@(for-render sheet-constraints doms (apply append sheets))
    ,@(for-render per-element tree-constraints)
    ,@(per-box box-tree-constraints)
    ,@(per-box position-constraints)
    ,@(for-render box-element-constraints doms)
    ,@(box-first-last-constraints doms)
    ,@(ez-fields)
    ,@(for-render ez-field-compute)
    ,@(for-render per-element compute-style-constraints)
    ,@(for-render per-element replaced-constraints)
    ,@(per-box contents-constraints)
    ,@(for-render font-computation)
    ,@(boxref-definitions)
    ,@(for-render layout-definitions)
    ,@(for-render per-box layout-constraints)
    ;; Handle invalid initial EZones for component verification
    ,@(if render? (for/list ([dom doms]) `(assert (ez.valid? (ez.in ,(dump-box (dom-boxes dom)))))) '())
    ))
