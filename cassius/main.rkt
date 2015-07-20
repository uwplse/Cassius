#lang racket
(require "dom.rkt")
(require "smt.rkt")
(require "css-rules.rkt")
(require "elements.rkt")
(require "float.rkt")
(require "common.rkt")
(require "css-properties.rkt")
(require unstable/sequence)
(require srfi/1)

(define maximize #f)

(provide all-constraints unsat-constraint-info print-rules)

(define (in-empty) (in-list empty))

(define (in-groups n s)
  (if (null? s)
      (in-empty)
      (let-values ([(hd tail) (split-at s n)])
        (in-sequences
         (apply in-parallel (map in-value hd))
         (in-groups n tail)))))

(define (r2 x) (~r x #:precision 2))

(define boxes-to-print (hash))

(define (print-rules #:stylesheet [stylesheet #f] #:header [header ""] smt-out)
  (for ([key (in-hash-keys boxes-to-print)])
    (eprintf "~a ~a" key (print-type 'Box (hash-ref smt-out (sformat "~a-real-box" key)))))

  (printf "/* Pre-generated header */\n\n~a\n\n/* Generated code below */\n" header)

  (for ([rule-value (map (curry hash-ref smt-out)
                         (for/list ([i (in-naturals)] [rule stylesheet]) (sformat "rule-~a" i)))])
    (printf "\n~a\n" (print-type 'Rule rule-value))))

(define (css-type-ending? v)
  (lambda (x) (string=? (last (string-split (~a x) "/")) v)))

(define/match (print-type type value)
  [((or 'Width 'Height 'Margin 'Padding 'Border) (? (css-type-ending? "auto"))) "auto"]
  [((or 'Width 'Height 'Margin 'Padding 'Border) (list _ 0.0)) "0"]
  [((or 'Width 'Height 'Margin 'Padding 'Border) (list (? (css-type-ending? "px")) x)) (format "~apx" x)]
  [((or 'Width 'Height 'Margin 'Padding 'Border) (list (? (css-type-ending? "pct")) x)) (format "~a%" x)]
  [('Float _) (last (string-split (~a value) "/"))]
  [('TextAlign _) (last (string-split (~a value) "/"))]
  [('Selector 'sel/all) "*"]
  [('Selector `(sel/id ,id)) (format "#~a" (substring (~a id) 3))]
  [('Selector `(sel/tag ,tag)) (substring (~a tag) 5 (- (string-length (~a tag)) 1))]
  [('Box `(box ,x ,y ,w ,h ,mt ,mr ,mb ,ml ,mtp ,mtn ,mbp ,mbn ,pt ,pr ,pb ,pl ,bt ,br ,bb ,bl ,_))
   (with-output-to-string
     (lambda ()
       (eprintf "~a×~a at (~a, ~a)\n" (r2 (+ pl pr w)) (r2 (+ pt pb h)) (r2 y) (r2 x))
       (eprintf "margin:  ~a (+~a-~a) ~a ~a (+~a-~a) ~a\n"
                (r2 mt) (r2 mtp) (r2 (abs mtn)) (r2 mr)
                (r2 mb) (r2 mbp) (r2 (abs mbn)) (r2 ml))
       (eprintf "border:  ~a ~a ~a ~a\n" (r2 bt) (r2 br) (r2 bb) (r2 bl))
       (eprintf "padding: ~a ~a ~a ~a\n\n" (r2 pt) (r2 pr) (r2 pb) (r2 pl))))]
  [('Style (list 'style rest ...))
   (with-output-to-string
     (lambda ()
       (eprintf " {\n")
       (for ([(value score) (in-groups 2 rest)] [(prop type default) (in-css-properties)])
         (eprintf "  ~a: ~a; /* ~a */ \n" prop (print-type type value) score))
       (eprintf "}\n")))]
  [('Rule (list 'rule sel idx rest ...))
   (define props
     (for/hash ([(value enabled?) (in-groups 2 rest)] [(prop type default) (in-css-properties)]
                #:when enabled?)
       (values prop (list type value))))
   (with-output-to-string
     (lambda ()
       (unless (hash-empty? props)
         (printf "~a {\n" (print-type 'Selector sel))
         (define short-printed
           (apply append
                  (for/list ([(short parts) (in-pairs css-shorthand-properties)]
                             #:when (andmap (curry hash-has-key? props) parts))
                    (define values (map (curry hash-ref props) parts))
                    (printf "  ~a: ~a;\n" short (string-join (map (curry apply print-type) values) " "))
                    parts)))
         (for ([(prop value) (in-hash props)] #:when (not (member prop short-printed)))
           (printf "  ~a: ~a;\n" prop (apply print-type value)))
         (printf "}"))))])

(define (tree-constraints dom emit elt children)
  (define elt-get (curry dom-get dom))
  (define root (dom-root dom))

  (define (get-child children accessor)
    (if (null? children) 'nil-elt (elt-name (car (accessor children)))))

  ; Parent element
  (for ([child (sequence-map car children)])
    (emit `(assert (= (parent-name ,(elt-get child)) ,(elt-name elt)))))
  ; Previous element
  (for ([child (sequence-map car children)]
        [prev (sequence-append (in-value 'nil-elt) (sequence-map (compose elt-name car) children))])
    (emit `(assert (= (previous-name ,(elt-get child)) ,prev))))

  ; First/last child
  (emit `(assert (= (first-child-name ,(elt-get elt)) ,(get-child children first))))
  (emit `(assert (= (last-child-name ,(elt-get elt)) ,(get-child children last)))))

(define ((style-constraints sheet) dom emit elt children)
  (define e (dom-get dom elt))
  (define re `(rules ,e))

  (when (member (car elt) '(INLINE BLOCK))
    ; Score of computed rule is >= any applicable stylesheet rule
    (for* ([type css-properties] [property (cdr type)]
           [rule
            (for/list ([i (in-naturals)] [rule sheet]) (sformat "rule-~a" i))])
      (emit
       `(assert
         (or (not (,(sformat "rule.~a?" property) ,rule))
             (=> (selector-applies? (selector ,rule) ,e)
                 (score-ge (,(sformat "style.~a$" property) ,re) (score ,rule)))))))

    ; Score&value of computed rule is = some applicable stylesheet rule
    (for* ([type css-properties] [property (cdr type)])
      (emit `(assert (or
                      (and (is-useDefault (,(sformat "style.~a$" property) ,re))
                           (= (,(sformat "style.~a" property) ,re) ,(hash-ref css-defaults property)))
                      ,@(for/list ([rule
                                    (for/list ([i (in-naturals)] [rule sheet])
                                      (sformat "rule-~a" i))])
                          `(and
                            (,(sformat "rule.~a?" property) ,rule)
                            (selector-applies? (selector ,rule) ,e)
                            (= (,(sformat "style.~a$" property) ,re) (score ,rule))
                            (= (,(sformat "style.~a" property) ,re)
                               (,(sformat "rule.~a" property) ,rule))))))))))

(define (dom-define-get/elt doms emit)
  (define dom-names
    (for/list ([dom doms])
      (cons (dom-root dom) (for/list ([elt (in-tree-values (dom-tree dom))]) (elt-name elt)))))

  ; The type of element names
  (for ([dom doms] [names dom-names] #:when #t [name names])
    (emit `(declare-const ,(sformat "~a-elt" name) Element))
    (emit `(assert (= (document ,(sformat "~a-elt" name)) ,(sformat "~a-doc" (dom-name dom))))))
  ; The element info for a name
  (define body
    (for*/fold ([body 'no-elt]) ([names dom-names] [name names])
      `(ite (= x ,name) ,(sformat "~a-elt" name) ,body)))
  (emit `(define-fun get/elt ((x ElementName)) Element ,body))
  (for* ([names dom-names] [name names])
    (emit `(assert (not (is-no-elt (get/elt ,name)))))
    (emit `(assert (= (get/elt ,name) ,(sformat "~a-elt" name)))))
  ; Pointed map: nil goes to nil
  (emit `(assert (= (get/elt nil-elt) no-elt))))

(define (dom-define-get/box doms emit)
  (define dom-names
    (for/list ([dom doms])
      (cons (dom-root dom) (for/list ([elt (in-tree-values (dom-tree dom))]) (elt-name elt)))))

  (for ([dom doms] [names dom-names] #:when #t [name names])
    (emit `(declare-const ,(sformat "~a-flow-box" name) Box))
    (emit `(declare-const ,(sformat "~a-real-box" name) Box))
    (emit `(assert (= (element ,(sformat "~a-flow-box" name)) ,name)))
    (emit `(assert (= (element ,(sformat "~a-real-box" name)) ,name))))
  (define body
    (for*/fold ([body 'no-box]) ([names dom-names] [name names])
      (smt-cond
       [(= x ,(sformat "~a-real" name)) ,(sformat "~a-real-box" name)]
       [(= x ,(sformat "~a-flow" name)) ,(sformat "~a-flow-box" name)]
       [else ,body])))
  (emit `(define-fun get/box ((x BoxName)) Box ,body))
  (for* ([names dom-names] [name names])
    (emit `(assert (not (is-no-box ,(sformat "~a-flow-box" name)))))
    (emit `(assert (not (is-no-box ,(sformat "~a-real-box" name)))))
    (emit `(assert (= (get/box ,(sformat "~a-flow" name)) ,(sformat "~a-flow-box" name))))
    (emit `(assert (= (get/box ,(sformat "~a-real" name)) ,(sformat "~a-real-box" name)))))
  (emit `(assert (= (get/box nil-box) no-box)))
  (emit `(assert (= (flow-box no-elt) nil-box)))
  (emit `(assert (= (placement-box no-elt) nil-box))))

(define (dom-root-constraints dom emit)
  (define elt `(get/elt ,(dom-root dom)))
  (define b `(flow-box ,elt))

  (emit `(assert (= ,elt ,(sformat "~a-elt" (dom-root dom)))))
  (emit `(assert (= (flow-box ,(sformat "~a-elt" (dom-root dom))) ,(sformat "~a-flow" (dom-root dom)))))
  (emit `(assert (= (placement-box ,(sformat "~a-elt" (dom-root dom))) ,(sformat "~a-real" (dom-root dom)))))
  (emit `(assert (= (tagname ,elt) box/viewport)))
  (for ([field '(x y pl pr pt pb bl br bt bb ml mr mt mb mtp mbp mtn mbn)])
    (emit `(assert (= (,field ,b) 0.0))))
  (emit `(assert (= (float ,elt) float/none)))
  (emit `(assert (= (textalign ,elt) text-align/left)))
  (emit `(assert (! (= (w ,b) ,(rendering-context-width (dom-context dom)))
                    :named ,(sformat "~a-context-width" (dom-name dom)))))
  (emit `(assert (= (parent-name (get/elt ,(elt-name (car (dom-tree dom))))) ,(dom-root dom))))
  (emit `(assert (= (previous-name (get/elt ,(elt-name (car (dom-tree dom))))) nil-elt)))
  (emit `(assert (= (first-child-name ,elt) ,(elt-name (car (dom-tree dom))))))
  (emit `(assert (= (parent-name ,elt) nil-elt)))
  (emit `(assert (= (previous-name ,elt) nil-elt))))

(define (stylesheet-constraints sheet)
  (append
   (apply append
          (for/list ([i (in-naturals)] [rule sheet])
            (define name (sformat "rule-~a" i))
            `((declare-const ,name Rule)
              (assert (= (index ,name) ,i))
              (assert (=> (is-sel/id (selector ,name)) (not (= (sel.id (selector ,name)) NoID))))

              ,@(reap [emit]
                      (match rule
                        ['? (void)]
                        [(list sel pairs ...)
                         (emit `(assert (= (selector ,name) ,sel)))
                         (for ([(a-prop type default) (in-css-properties)])
                           (cond
                             [(assoc a-prop pairs)
                              (emit `(assert (= (,(sformat "rule.~a?" a-prop) ,name) true)))
                              (match (cadr (assoc a-prop pairs))
                                ['? (void)]
                                [val (emit `(assert (= (,(sformat "rule.~a" a-prop) ,name) ,val)))])]
                             [(not (member '? pairs))
                              (emit `(assert (= (,(sformat "rule.~a?" a-prop) ,name) false)))]
                             [else (void)]))]))

              ; Optimize for short CSS

              ; Each enabled property costs one line
              ,@(if maximize
                    (for*/list ([type css-properties] [property (cdr type)])
                      `(assert-soft (not (,(sformat "rule.~a?" property) ,name)) :weight 1))
                    '())

              ; Each block with an enabled property costs two line (open/selector and close brace)
              ,@(if maximize
                    `((assert-soft (and
                                    ,@(for*/list ([type css-properties] [property (cdr type)])
                                        `(not (,(sformat "rule.~a?" property) ,name))))
                                   :weight 2))
                    '())

              ; Each shorthand rule can save space if all its properties exist
              ,@(if maximize
                    (for/list ([(short-name subproperties) (in-pairs css-shorthand-properties)])
                      `(assert-soft (and ,@(for/list ([subprop subproperties])
                                             (list (sformat "rule.~a?" subprop) name)))
                                    :weight 3))
                    '()))))))

(define (user-constraints dom emit elt children)
  (define name (elt-name elt))
  (define cmds
    (match elt
      [(list 'BLOCK tag cmds ...) cmds]
      [(list 'INLINE tag cmds ...) cmds]
      [(list 'LINE cmds ...) cmds]
      [(list 'TEXT cmds ...) cmds]))

  (let interpret ([cmds cmds])
    (match cmds
      [(list ':print rest ...)
       (hash-set! boxes-to-print name #t)
       (interpret rest)]
      [(list ':id id rest ...)
       (interpret rest)]
      [(list (and (or ':x ':y ':w ':h) field) value rest ...)
       (define fun (match field [':x 'x] [':y 'y] [':h 'box-height] [':w 'box-width]))
       (when (memq (car elt) '(LINE TEXT INLINE BLOCK))
         (emit `(assert (! (= (,fun (get/box (placement-box ,(dom-get dom elt)))) ,value) :named ,(sformat "~a-~a" name fun)))))
       (interpret rest)]
      [(list)
       (void)])))

(define (element-constraints dom emit elt children)
  (for-each emit (element-general-constraints (elt-name elt)))
  (for-each emit
            ((match elt
               [(list 'BLOCK tag constraints ...) element-block-constraints]
               [(list 'LINE constraints ...) element-line-constraints]
               [(list 'INLINE tag constraints ...) element-inline-constraints]
               [(list 'TEXT constraints ...) element-inline-constraints])
             (sformat "~a-flow-box" (elt-name elt)))))

(define (info-constraints dom emit elt children)
  (define-values (tagname idname display)
    (match elt
      [(list 'BLOCK tagname ':id idname _ ...)
       (values (sformat "tag/~a" tagname) (sformat "ID-~a" idname) 'display/block)]
      [(list 'INLINE tagname ':id idname _ ...)
       (values (sformat "tag/~a" tagname) (sformat "ID-~a" idname) 'display/inline)]
      [(list 'BLOCK tagname _ ...) (values (sformat "tag/~a" tagname) 'NoID 'display/block)]
      [(list 'INLINE tagname _ ...) (values (sformat "tag/~a" tagname) 'NoID 'display/inline)]
      [(list 'LINE _ ...) (values 'box/line 'NoID 'display/block)]
      [(list 'TEXT _ ...) (values 'box/text 'NoID 'display/inline)]))

  (emit `(assert (= (tagname ,(dom-get dom elt)) ,tagname)))
  (emit `(assert (= (id ,(dom-get dom elt)) ,idname)))
  (emit `(assert (= (display ,(dom-get dom elt)) ,display))))

(define (all-constraints-of dom emit . types)
  (for* ([(elt children) (in-tree-subtrees (dom-tree dom))] [type types])
    (type dom emit elt children)))

(define (dfs-constraints doms . constraints)
  (reap [sow]
        (dom-define-get/elt doms sow)
        (dom-define-get/box doms sow)
        (for ([dom doms]) (dom-root-constraints dom sow))
        (for ([cns constraints])
          (for* ([dom doms] [(elt children) (in-tree-subtrees (dom-tree dom))])
            (cns dom sow elt children)))))

(define (all-constraints sheet doms)
  (define-values (tags ids)
    (reap [save-tag save-id]
          (for* ([dom doms] [elt (in-tree-values (dom-tree dom))])
            (when (memq ':id elt) (save-id (sformat "ID-~a" (cadr (memq ':id elt)))))
            (match elt
              [(list 'BLOCK tag cmds ...) (save-tag (sformat "tag/~a" tag))]
              [(list 'INLINE tag cmds ...) (save-tag (sformat "tag/~a" tag))]
              [(list 'LINE tag cmds ...) (void)]
              [(list 'TEXT cmds ...) (void)]))
          (for ([rule sheet])
            (match rule
              ['? (void)]
              [`((sel/tag ,tag) ,_ ...) (save-tag tag)]
              [`((sel/id ,id) ,_ ...) (save-id id)]))))

  (define elt-names
    (append
     (for*/list ([dom doms] [elt (in-tree-values (dom-tree dom))]) (elt-name elt))
     (for/list ([dom doms]) (dom-root dom))))

  (define constraints
    (list tree-constraints info-constraints user-constraints element-constraints
          (style-constraints sheet)))

  `((set-option :produce-unsat-cores true)
    (declare-datatypes ()
                       ((Id NoID ,@(remove-duplicates ids))
                        (TagNames box/viewport box/text box/inline box/block box/line
                                  ,@(remove-duplicates tags))
                        (Document ,@(for/list ([dom doms]) (sformat "~a-doc" (dom-name dom))))
                        (ElementName ,@elt-names nil-elt)
                        (BoxName
                         ,@(map (curry sformat "~a-flow") elt-names)
                         ,@(map (curry sformat "~a-real") elt-names)
                         nil-box)))
    ,@css-declarations
    ,@dom-definitions
    ,@css-functions

    ; Stylesheet
    ,@(stylesheet-constraints sheet)
    ; DOMs
    ,@(apply dfs-constraints doms constraints)
    (check-sat)))

(define (unsat-constraint-info constraint)
  (elt-from-name (string->symbol (first (string-split (~a constraint) "-")))))
