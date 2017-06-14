#lang racket

(require "common.rkt" "tree.rkt" "spec/css-properties.rkt" "z3.rkt" "smt.rkt" "modular-synthesis.rkt" "dom.rkt")
(module+ test (require rackunit))
(provide equivalence-classes equivalence-classes-avoid?
         selector-matches? all-selectors synthesize-css-sketch
         css-sketch-solver rule-matchlist (struct-out rulematch))



(define (property? sym)
  (and (symbol? sym)
       (for/first ([(property type default) (in-css-properties)] #:when (equal? property sym)) true)))

(define-by-match selector?
  `*
  `(id ,(? symbol?))
  `(class ,(? symbol?))
  `(tag ,(? symbol?))
  `(and ,(? selector?) ...)
  `(desc ,(? selector?) ...)
  `(child ,(? selector?) ...)
  `(pseudo-class ,(or 'first-child 'last-child 'hover))
  `(type ,(? symbol?))
  `(media ,(? media-query?) ,(? selector?))
  `(fake ,(? string?) ,(? selector?) ...))

(define-by-match media-query?
  `(or ,(? media-query?) ...)
  `(and ,(? media-query?) ...)
  `(only ,(? media-query?))
  `(not ,(? media-query?))
  `(min-width (px ,(? number?)))
  `(max-width (px ,(? number?)))
  `(orientation landscape)
  `(orientation portrait)
  (or 'all 'screen 'print))

(define-by-match rule?
  (list (? selector?) (? attribute?) ... (list (? property?) _ (? attribute?) ...) ...))

(define-by-match partial-rule?
  (list (? selector?) (? attribute?) ... (or (list (? property?) _ (? attribute?) ...) '?) ...))

(define/contract (selector-matches? sel elt)
  (-> selector? node? boolean?)
  "Given an element and a selector, returns whether the selector matches the element"
  (match sel
    [`(fake ,true ,subsels ...)
     (ormap (curryr selector-matches? elt) subsels)]
    [`* true]
    [`(id ,id)
     (define eid (and (node-get elt ':id) (slower (node-get elt ':id))))
     (when (equal? eid '?)
       (raise (make-exn:fail:unsupported "Holes in identifiers are not supported" (current-continuation-marks))))
     (equal? eid id)]
    [`(class ,cls)
     (define ecls (map slower (node-get elt ':class #:default '())))
     (set-member? ecls cls)]
    [`(tag ,tag)
     (define etag (node-type elt))
     (when (equal? etag '?)
       (raise (make-exn:fail:unsupported "Holes in tag names are not supported" (current-continuation-marks))))
     (equal? etag tag)]
    [`(pseudo-class first-child) (not (node-prev elt))]
    [`(pseudo-class last-child) (not (node-next elt))]
    [`(pseudo-class hover) false] ; We're never modeling hovering
    [`(type ,type)
     (and (node-get elt ':type) (equal? (slower (node-get elt ':type)) type))]
    [`(media ,query ,sel)
     (and (media-matches? query) (selector-matches? sel elt))]
    [(list 'and sels ...) (andmap (curryr selector-matches? elt) sels)]
    [(list 'desc sels ...)
     (match-define (cons sel rsels) (reverse sels))
     (and (selector-matches? sel elt)
          (let loop ([rsels rsels] [elt (node-parent elt)])
            (cond
             [(null? rsels) true]
             [(not (node-parent elt)) false]
             [(selector-matches? (car rsels) elt)
              (loop (cdr rsels) (node-parent elt))]
             [else
              (loop rsels (node-parent elt))])))]
    [(list 'child sels ...)
     (let loop ([rsels (reverse sels)] [elt elt])
       (cond
        [(null? rsels) true]
        [(not (node-parent elt)) false]
        [(selector-matches? (car rsels) elt)
         (loop (cdr rsels) (node-parent elt))]
        [else false]))]))

(define (media-matches? query)
  (match query
    [`(or ,qs ...)
     (ormap media-matches? qs)]
    [`(and ,qs ...)
     (andmap media-matches? qs)]
    [`(only ,q)
     (media-matches? q)]
    [`(not ,q)
     (not (media-matches? q))]
    ['screen true]
    ['all true]
    ['print false]
    ['(orientation landscape) true] ; TODO: Actually check viewport width and height
    ['(orientation portrait) false]
    [`(max-width (px ,mw))
     false]
    [`(min-width (px ,mw))
     false]))

(module+ test
  (define tree
    '([html] ; 0
      ([body] ; 1
       ([div :id content] ; 2
        ([H1 :class (title)]) ; 3
        ([div :class (abstract)] ; 4
         ([blockquote] ; 5
          ([p]))) ; 6
        ([p]) ; 7
        ([div :class (aside)] ; 8
         ([p])))))) ; 9
  (define ptree (parse-tree tree))
  (define (get-element elt n)
    "Gets the nth element, or returns the total number of elements seen"
    (if (= n 0)
        elt
        (let loop ([child (node-fchild elt)] [i 1])
          (if (not child)
              i
              (let ([out (get-element child (- n i))])
                (if (number? out)
                    (loop (node-next child) (+ i out))
                    out))))))
  (define (check-selector sel ns)
    (for ([n (in-range 1 11)])
      ((if (set-member? ns n) check-true check-false)
       (selector-matches? sel (get-element ptree n)))))

  (check-selector '* '(1 2 3 4 5 6 7 8 9 10))
  (check-selector '(id content) '(3))
  (check-selector '(tag html) '(1))
  (check-selector '(tag p) '(7 8 10))
  (check-selector '(class title) '(4))
  (check-selector '(class aside) '(9))
  (check-selector '(and (tag div) (class aside)) '(9))
  (check-selector '(and (tag p) (class aside)) '())
  (check-selector '(desc (tag div) (tag p)) '(7 8 10))
  (check-selector '(child (tag div) (tag p)) '(8 10))
  (check-selector '(child (and (tag div) (id content)) (tag p)) '(8)))

(define-by-match partial-selector-score?
  (list (? number?) (? number?) (? number?)))

(define-by-match selector-score?
  (list (or 'browser 'user 'author) (? boolean?) (? number?) (? number?) (? number?) (? number?)))

(define/contract (compute-score selector)
  (-> selector? partial-selector-score?)
  "Given a selector, return a list (ids classes tags) of counts"
  (match selector
    [(list 'id id) '(1 0 0)]
    [(list 'class cls) '(0 1 0)]
    [(list 'tag tag) '(0 0 1)]
    [(list 'pseudo-class _) '(0 1 0)]
    [(list 'type _) '(0 0 0)]
    [(list 'media _ sel) (compute-score sel)]
    ['* '(0 0 0)]
    [(list 'fake _ ...) '(100 0 0)] ; TODO: Should it be 0 0 0 ?
    [(list (or 'and 'desc 'child) sels ...)
     (map (curry apply +) (apply (curry map list) (map compute-score sels)))]))

(define/contract (rule-scores rules)
  (-> (listof partial-rule?) (listof selector-score?))
  "Given a list of rules, return a list of cascade scores (io fromstyle ids classes tags idx)"
  (for/list ([rule rules] [i (in-naturals)])
    (match-define (list (? selector? selector) (? attribute? attrs) ... _ ...) rule)
    (define browser? (set-member? attrs ':browser))
    (define user? (set-member? attrs ':user))
    (define style? (set-member? attrs ':style))
    (match-define (list ids classes tags) (compute-score selector))
    (list (cond [browser? 'browser] [user? 'user] [else 'author]) style? ids classes tags i)))

(define/match (io<? io1 io2)
  [((or 'browser 'user) 'author) true]
  [('browser 'user) true]
  [(_ _) false])

(define score<? (lex<? io<? boolean<? < < < <))

(struct rulematch (rule elts idx)
        #:methods gen:equal+hash
        [(define (equal-proc a b equal?)
           (and (equal? (rulematch-rule a) (rulematch-rule b))
                (equal? (rulematch-elts a) (rulematch-elts b))))
         (define (hash-proc a hash)
           (hash (list (rulematch-rule a) (rulematch-elts a))))
         (define (hash2-proc a hash)
           (hash (list (rulematch-rule a) (rulematch-elts a) 'secondary)))])

(define (rulematch-props rm)
  (filter list? (cdr (rulematch-rule rm))))

(define (rulematch-important? rm prop)
  (set-member? (dict-ref (rulematch-props rm) prop '()) ':important))

(define/contract (rule-matchlist rules elts)
  (-> (listof partial-rule?) (listof node?) (listof rulematch?))
  (define scores (rule-scores rules))
  (define matches (for/list ([rule rules]) (filter (curry selector-matches? (car rule)) elts)))
  (map cdr
       (reverse ; Reverse so that HIGHEST score comes first
        (sort
         (for/list ([s scores] [r rules] [m matches] [i (in-naturals)])
           (cons s (rulematch r m i)))
         score<? #:key car))))

(define/contract (matchlist-find matchlist elt prop)
  (-> (listof rulematch?) node? property? (or/c rulematch? #f))
  (define valid-rms
    (filter
     (λ (rm)
       (and (set-member? (rulematch-elts rm) elt)
            (dict-has-key? (rulematch-props rm) prop)))
     matchlist))
  (or
   (for/first ([rm valid-rms] #:when (rulematch-important? rm prop))
     rm)
   (for/first ([rm valid-rms])
     rm)))

(define equivalence-classes?
  (hash/c property? (cons/c (hash/c node? (or/c integer? #f)) (hash/c (or/c integer? #f) any/c))))

(define/contract (matchlist-equivalence-classes ml elts)
  (-> (listof rulematch?) (listof node?) equivalence-classes?)
  (for/hash ([(prop type* default) (in-css-properties)])
    (define class-hash (make-hash))
    (define value-hash (make-hash))
    (for* ([elt elts])
      (define rm (matchlist-find ml elt prop))
      (define idx (and rm (rulematch-idx rm)))
      (define value
        (match idx
         [(? number?)
          (car (dict-ref (rulematch-props rm) prop))]
         [#f
          (if (and (css-inheritable? prop) (node-parent elt)) 'inherit default)]))
      (dict-set! value-hash idx value)
      (dict-set! class-hash elt idx))
    (values prop (cons class-hash value-hash))))

(define/contract (equivalence-classes rules elts)
  (-> (listof rule?) (listof node?) equivalence-classes?)
  (define ml (rule-matchlist rules elts))
  (matchlist-equivalence-classes ml elts))

(define-by-match inequality?
  `(not (= (,(? property?) ,(? node?)) (,(? property?) ,(? node?))))
  `(not (= (,(? property?) ,(? node?)) ,_)))

(define/contract (equivalence-classes-avoid? classes ineq)
  (-> equivalence-classes? inequality? boolean?)
  "Whether a set of equivalence classes satisfies a particular inequality"
  (match ineq
    [`(not (= (,prop ,(? node? elt1)) (,prop ,(? node? elt2))))
     (define hash (car (dict-ref classes prop)))
     (not (equal? (dict-ref hash elt1) (dict-ref hash elt2)))]
    [`(not (= (,prop ,(? node? elt1)) ,val))
     (match-define (cons class-hash value-hash) (dict-ref classes prop))
     (not (equal? (dict-ref value-hash (dict-ref class-hash elt1)) val))]))

(define (get-tcis elts)
  (define-values (tags classes ids)
    (for/reap [tag! class! id!] ([elt elts])
      (tag! (slower (node-type elt)))
      (for-each (compose class! slower) (node-get elt ':class #:default '()))
      (when (node-get elt ':id)
        (id! (slower (node-get elt ':id))))))
  (values (remove-duplicates tags) (remove-duplicates classes) (remove-duplicates ids)))

(define/contract (atomic-values elts)
  (-> (listof node?) (listof selector?))
  "Constructs all atomic selectors allowed for a set of elements."
  (define-values (tags classes ids) (get-tcis elts))
  (append (map (curry list 'tag) tags) (map (curry list 'class) classes) (map (curry list 'id) ids)))

(define selhash? (hash/c (listof node?) selector?))

(define/contract (all-selectors elts)
  (-> (listof node?) selhash?)
  "Constructs, from a set of nodes, the set of all distinct selectors.
Selectors with the same specificity and elements are not considered distinct."

  (define atoms
    (for/hash ([a (atomic-values elts)])
      (values (filter (curry selector-matches? a) elts) a)))

  (define ands (make-hash (list (cons elts '*))))

  (let loop ([changes (hash-keys ands)])
    (unless (null? changes)
      (define new-changes
        (reap [sow]
              (for* ([elts changes] [(elts* a) atoms])
                (define new-elts (list-intersect elts elts*))
                (unless (or (dict-has-key? ands new-elts) (null? new-elts))
                  (define old-sel (dict-ref ands elts))
                  (define new-sel
                    (match old-sel
                      ['* a]
                      [(list 'and rest ...) `(and ,@rest ,a)]
                      [_ `(and ,old-sel ,a)]))
                  (dict-set! ands new-elts new-sel)
                  (sow new-elts)))))
      (loop new-changes)))

  (define descs (hash-copy ands))

  (let loop ([changes (hash-keys descs)])
    (unless (null? changes)
      (define new-changes
        (reap [sow]
              (for* ([elts changes] [(elts* tail) ands] [head '(child desc)])
                (define old-sel (dict-ref descs elts))
                (define new-sel (list head tail old-sel))
                ;; The sort is because set-intersect doesn't keep sorted lists sorted
                (define new-elts (filter (curry selector-matches? new-sel) elts))
                (unless (or (dict-has-key? descs new-elts) (null? new-elts))
                  (dict-set! descs new-elts new-sel)
                  (sow new-elts)))))
      (loop new-changes)))

  descs)

(define/contract (ineq-selectors ineq selhash)
  (-> inequality? selhash? (listof selector?))
  "Finds all selectors that match one side of an inequality"
  (match-define (list prop elt1 val) ineq)
  (define (elts-good? elts)
    (if (node? val)
        (xor (set-member? elts elt1) (set-member? elts val))
        (set-member? elts elt1)))
  (for/list ([(elts sel) (in-hash selhash)] #:when (elts-good? elts))
    sel))

;; Interpreted as an AND of ORs of inequalities

(define constraints? (listof (listof inequality?)))

(define/contract (synthesize-selectors constraints selhash)
  (-> constraints? selhash? (listof selector?))

  (define selectors (make-hash))
  (define constraints*
    (for/list ([constraint constraints])
      (smt-replace constraint
        [`(not (= (,prop ,(? node? elt1)) (,prop ,(? node? elt2))))
         (apply smt-or
                (for/list ([(elts sel) (in-hash selhash)]
                           #:when (xor (set-member? elts elt1) (set-member? elts elt2)))
                  (dict-ref! selectors sel (λ () (sformat "sel/~a" (dict-count selectors))))))]
        [`(not (= (,prop ,(? node? elt)) ,value))
         (apply smt-or
                (for/list ([(elts sel) (in-hash selhash)]
                           #:when (set-member? elts elt))
                  (dict-ref! selectors sel (λ () (sformat "sel/~a" (dict-count selectors))))))])))

  (define query
    `(,@(for/list ([(sel name) selectors])
          `(declare-const ,name Bool))
      ,@(map (curry list 'assert) constraints*)
      ,@(for/list ([constraint constraints*])
          `(assert-soft
            ,(smt-replace constraint
               [`(or ,a ,b ,c ...)
                `(< 1 (+ ,@(for/list ([x (list* a b c)]) `(ite ,x 1 0))))])))))

  (match-define (list 'model out) (z3-solve query))
  (for/list ([(sel name) selectors] #:when (dict-ref out name #f))
    sel))

(define/contract (synthesize-properties constraints rules)
  (-> constraints? selhash? (listof selector?))

  (define props (for/list ([(prop _t _d) (in-css-properties)]) prop))
  (define scores (rule-scores (map list rules)))
  (define sorted-rules
    (sort (map cons (range (length rules)) scores) score<? #:key cdr))

  (define constraints*
    (for/list ([constraint constraints])
      (smt-replace constraint
        [`(not (= (,prop ,(? node? elt1)) (,prop ,(? node? elt2))))
         (for/fold ([expr 'false])
             ([(i score) (in-dict sorted-rules)]
              #:when (or (selector-matches? (list-ref rules i) elt1)
                         (selector-matches? (list-ref rules i) elt2)))
           (define sel (list-ref rules i))
           (if (and (selector-matches? sel elt1) (selector-matches? sel elt2))
               (smt-and `(not ,(sformat "property/~a/~a" prop i)) expr)
               (smt-or (sformat "property/~a/~a" prop i) expr)))]
        [`(not (= (,prop ,(? node? elt1)) ,value))
         (apply
          smt-or
          (for/list ([rule rules] [i (in-naturals)]
                     #:when (selector-matches? rule elt1))
            (sformat "property/~a/~a" prop i)))])))

  (define query
    (append
     (for/list ([prop props] #:when true [rule rules] [i (in-naturals)])
       `(declare-const ,(sformat "property/~a/~a" prop i) Bool))
     (map (curry list 'assert) constraints*)
     (for/list ([constraint constraints*])
       `(assert-soft
         ,(smt-replace constraint
            [`(or ,a ,b ,c ...)
             `(< 1 (+ ,@(for/list ([x (list* a b c)]) `(ite ,x 1 0))))])))))
    
  (match-define (list 'model out) (z3-solve query))
  (for/list ([selector rules] [i (in-naturals)])
    (cons selector
          (for/list ([(prop _t _d) (in-css-properties)]
                     #:when (dict-ref out (sformat "property/~a/~a" prop i) #f))
            `[,prop ?]))))

(define (synthesize-css-sketch constraints selhash)
  (define rules (synthesize-selectors constraints selhash))
  (synthesize-properties constraints rules))

(define selhash-cache (make-parameter (make-hash)))

(define (css-sketch-solver inputs constraints)
  (match-define (list doms matchings) inputs)
  (define selhash (hash-ref! (selhash-cache) doms (λ () (map all-selectors (dom-elements doms)))))
  (define rules (synthesize-selectors constraints selhash))
  (list 'fwd doms matchings (synthesize-properties constraints rules)))
