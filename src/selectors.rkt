#lang racket

(require "common.rkt" "tree.rkt" "spec/css-properties.rkt" "spec/media-query.rkt")
(module+ test (require rackunit))
(provide equivalence-classes selector-matches?
         rule-matchlist (struct-out rulematch) rule-allows-property?)



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
  `(pseudo-class ,(or 'first-child 'last-child 'hover 'last-of-type 'first-of-type))
  `(type ,(? symbol?))
  `(media ,(? media-query?) ,(? selector?))
  `(fake ,(? string?) ,(? selector?) ...))

(define-by-match rule?
  (list (? selector?) (? attribute?) ... (list (? property?) _ (? attribute?) ...) ...))

(define-by-match partial-rule?
  (list (? selector?) (? attribute?) ... (or (list (? property?) _ (? attribute?) ...) '?) ...))

(define/contract (rule-allows-property? rule prop)
  (-> partial-rule? property? boolean?)
  (match-define (list selector (? attribute? attrs) ... (and (or (? list?) '?) props) ...) rule)
  (or (set-member? props '?)
      (and (dict-has-key? props prop)
           (not (null? (dict-ref props prop))))))

(define/contract (selector-matches? sel elt)
  (-> selector? node? boolean?)
  "Given an element and a selector, returns whether the selector matches the element"
  (match sel
    [`(fake ,true ,subsels ...)
     (ormap (curryr selector-matches? elt) subsels)]
    [`* true]
    [`(id ,id) ; IDs are case-sensitive
     (equal? (node-get elt ':id) id)]
    [`(class ,cls) ; CLASSes are case-insensitive
     (define ecls (map slower (node-get elt ':class #:default '())))
     (set-member? ecls (slower cls))]
    [`(tag ,tag)
     (equal? (slower (node-type elt)) (slower tag))]
    [`(pseudo-class first-child) (not (node-prev elt))]
    [`(pseudo-class last-child) (not (node-next elt))]
    [`(pseudo-class first-of-type)
     (let loop ([sib (node-prev elt)])
       (cond
        [(not sib) true]
        [(equal? (slower (node-type sib)) (slower (node-type elt)))
         false]
        [else (loop (node-prev sib))]))]
    [`(pseudo-class last-of-type)
     (let loop ([sib (node-next elt)])
       (cond
        [(not sib) true]
        [(equal? (slower (node-type sib)) (slower (node-type elt)))
         false]
        [else (loop (node-next sib))]))]
    [`(pseudo-class hover) (node-get* elt ':hover #:default #f)]
    [`(type ,type)
     (and (node-get elt ':type) (equal? (node-get elt ':type) type))]
    [`(media ,query ,sel)
     ;; TODO: Subtle
     (selector-matches? sel elt)]
    [(list 'and sels ...) (andmap (curryr selector-matches? elt) sels)]
    [(list 'desc sels ...)
     (match-define (cons sel rsels) (reverse sels))
     (and (selector-matches? sel elt)
          (or (node-parent elt) (null? rsels))
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

(module+ test
  (define tree
    (parse-tree
     '([html] ; 0
       ([body] ; 1
        ([div :id content] ; 2
         ([h1 :class (title)]) ; 3
         ([div :class (abstract)] ; 4
          ([blockquote] ; 5
           ([p]))) ; 6
         ([p]) ; 7
         ([div :class (aside)] ; 8
          ([p]))))))) ; 9

  (define (check-selector sel ns)
    (for ([n (in-naturals)] [elt (in-tree tree)])
      ((if (set-member? ns n) check-true check-false)
       (selector-matches? sel elt))))

  (check-selector '* (range 10))
  (check-selector '(id content) '(2))
  (check-selector '(tag html) '(0))
  (check-selector '(tag p) '(6 7 9))
  (check-selector '(class title) '(3))
  (check-selector '(class aside) '(8))
  (check-selector '(and (tag div) (class aside)) '(8))
  (check-selector '(and (tag p) (class aside)) '())
  (check-selector '(desc (tag div) (tag p)) '(6 7 9))
  (check-selector '(child (tag div) (tag p)) '(7 9))
  (check-selector '(child (and (tag div) (id content)) (tag p)) '(7)))

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

(define (split-rule rule)
  (match-define (list (? selector? selector) (? attribute? attrs) ...
                      (list (? property? properties) values (? attribute? propattrs) ...) ...) rule)
  (define-values (important unimportant)
    (partition (λ (x) (set-member? (third x) ':important))
               (map list properties values propattrs)))
  (list
   (if (null? important) #f `(,selector ,@attrs ,@important))
   (if (null? unimportant) #f `(,selector ,@attrs ,@unimportant))))

(define (split-rm rm)
  (for/list ([r* (split-rule (rulematch-rule rm))])
    (and r* (struct-copy rulematch rm [rule r*]))))

(define/contract (rule-matchlist rules elts)
  (-> (listof partial-rule?) (listof node?) (listof rulematch?))
  (define scores (rule-scores rules))
  (define matches (for/list ([rule rules]) (for/set ([elt (in-list elts)] #:when (selector-matches? (car rule) elt)) elt)))
  (define presort
    (map cdr
         (reverse ; Reverse so that HIGHEST score comes first
          (sort
           (for/list ([s scores] [r rules] [m matches] [i (in-naturals)])
             (cons s (rulematch r m i)))
           score<? #:key car))))
  (define split (map split-rm presort))
  (filter identity (append (map first split) (map second split))))

(define/contract (matchlist-find matchlist elt prop)
  (-> (listof rulematch?) node? property? (or/c rulematch? #f))
  (define valid-rms
    (filter
     (λ (rm)
       (and (set-member? (rulematch-elts rm) elt)
            (dict-has-key? (rulematch-props rm) prop)))
     matchlist))
  (for/first ([rm valid-rms])
    rm))

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
