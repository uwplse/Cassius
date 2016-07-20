#lang racket

(require "common.rkt" "dom.rkt" "css-properties.rkt" data/heap)
(module+ test (require rackunit))
(provide equivalence-classes
         make-enumeration-state step*! add-ineqs!)



(define (selector-matches? sel elt)
  "Given an element and a selector, returns whether the selector matches the element"
  (match sel
    [`* true]
    [`(id ,id)
     (define eid (and (element-get elt ':id) (slower (element-get elt ':id))))
     (when (equal? eid '?)
       (raise (make-exn:fail:unsupported "Holes in identifiers are not supported" (current-continuation-marks))))
     (equal? eid id)]
    [`(class ,cls)
     (define ecls (if (element-get elt ':class) (map slower (element-get elt ':class)) '()))
     (set-member? ecls cls)]
    [`(tag ,tag)
     (define etag (and (element-get elt ':tag) (slower (element-get elt ':tag))))
     (when (equal? etag '?)
       (raise (make-exn:fail:unsupported "Holes in tag names are not supported" (current-continuation-marks))))
     (equal? etag tag)]
    [(list 'and sels ...) (andmap (curryr selector-matches? elt) sels)]
    [(list 'desc sels ...)
     (match-define (cons sel rsels) (reverse sels))
     (and (selector-matches? sel elt)
          (let loop ([rsels rsels] [anscestors (element-anscestors elt)])
            (cond
             [(null? rsels) true]
             [(null? anscestors) false]
             [(selector-matches? (car rsels) (car anscestors))
              (loop (cdr rsels) (cdr anscestors))]
             [else
              (loop rsels (cdr anscestors))])))]
    [(list 'child sels ...)
     (match-define (cons sel rsels) (reverse sels))
     (and (selector-matches? sel elt)
          (let loop ([rsels rsels] [anscestors (element-anscestors elt)])
            (cond
             [(null? rsels) true]
             [(null? anscestors) false]
             [(selector-matches? (car rsels) (car anscestors))
              (loop (cdr rsels) (cdr anscestors))]
             [else
              false])))]))

(module+ test
  (define tree
    '([VIEW]
      ([BLOCK :tag html] ; 1
       ([BLOCK :tag body] ; 2
        ([BLOCK :tag div :id content] ; 3
         ([BLOCK :tag H1 :class (title)]) ; 4
         ([BLOCK :tag div :class (abstract)] ; 5
          ([BLOCK :tag blockquote] ; 6
           ([BLOCK :tag p]))) ; 7
         ([BLOCK :tag p]) ; 8
         ([BLOCK :tag div :class (aside)] ; 9
          ([BLOCK :tag p]))))))) ; 10
  (define ptree (parse-tree tree))
  (define (get-element elt n)
    "Gets the nth element, or returns the total number of elements seen"
    (if (= n 0)
        elt
        (let loop ([child (element-fchild elt)] [i 1])
          (if (not child)
              i
              (let ([out (get-element child (- n i))])
                (if (number? out)
                    (loop (element-next child) (+ i out))
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

(define (compute-score selector)
  "Given a selector, return a list (ids classes tags) of counts"
  (match selector
    [(list 'id id) '(1 0 0)]
    [(list 'class cls) '(0 1 0)]
    [(list 'tag tag) '(0 0 1)]
    ['* '(0 0 0)]
    [(list (or 'and 'desc 'child) sels ...)
     (map (curry apply +) (apply (curry map list) (map compute-score sels)))]))

(define (rule-scores rules)
  "Given a list of rules, return a list of cascade scores (io fromstyle ids classes tags idx)"
  (for/list ([rule rules] [i (in-naturals)])
    (match-define (list selector (? attribute? attrs) ... (? list? props) ...) rule)
    (define browser? (set-member? attrs ':browser))
    (define user? (set-member? attrs ':user))
    (define style? (set-member? attrs ':style))
    (match-define (list ids classes tags) (compute-score selector))
    (list (cond [browser? 'browser] [user? 'user] [else 'author]) style? ids classes tags i)))

(define/match (io<? io1 io2)
  [((or 'browser 'user) 'author) true]
  [('browser 'user) true]
  [(_ _) false])

(define (boolean<? b1 b2)
  (and (not b1) b2))

(define ((lex<? . <s) l1 l2)
  (when (not (= (length <s) (length l1) (length l2)))
    (raise
     (make-exn:fail:contract
      (format "(lex<? ~a): arguments must have length ~a; arguments were: ~a ~a"
              (~v <s) (length <s) (~v l1) (~v l2))
      (current-continuation-marks))))

  (let loop ([<s <s] [l1 l1] [l2 l2])
    (cond
     [(and (null? <s) (null? l1) (null? l2)) false] ; equal
     [((car <s) (car l1) (car l2)) true]
     [((car <s) (car l2) (car l1)) false]
     [else (loop (cdr <s) (cdr l1) (cdr l2))])))

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

(define (rule-matchlist rules elts)
  (define scores (rule-scores rules))
  (define matches (for/list ([rule rules]) (filter (curry selector-matches? (car rule)) elts)))
  (map cdr (sort
            (for/list ([s scores] [r rules] [m matches] [i (in-naturals)])
              (cons s (rulematch r m i)))
            score<? #:key car)))

(define (matchlist-find matchlist elt prop)
  (for/first ([rm matchlist] [i (in-naturals)]
              #:when (and (set-member? (rulematch-elts rm) elt)
                          (set-member? (map car (rulematch-props rm)) prop)))
    i))

(define (matchlist-equivalence-classes ml elts)
  (for/hash ([(prop type* default) (in-css-properties)])
    (define class-hash (make-hash))
    (define value-hash (make-hash))
    (for* ([elt elts])
      (define idx (matchlist-find ml elt prop))
      (define value
        (cond
         [(number? idx)
          (car (dict-ref (rulematch-props (list-ref ml idx)) prop))]
         [(not idx)
          (if (equal? prop 'text-align) 'left default)]))
      (dict-set! value-hash idx value)
      (dict-set! class-hash elt idx))
    (values prop (cons class-hash value-hash))))

(define (equivalence-classes rules elts)
  (define ml (rule-matchlist rules elts))
  (matchlist-equivalence-classes ml elts))

;; An inequality is either (prop elt1 elt2) or (prop elt1 '= val1)

(define (equivalence-classes-avoid? classes ineq)
  (match ineq
    [(list prop elt1 elt2)
     (define hash (car (dict-ref classes prop)))
     (not (equal? (dict-ref hash elt1) (dict-ref hash elt2)))]
    [(list prop elt1 '= val)
     (match-define (cons class-hash value-hash) (dict-ref classes prop))
     (not (equal? (dict-ref value-hash (dict-ref class-hash elt1)) val))]))

(define-syntax-rule (assume prop)
  (unless prop
    (error "Property ~a failed!" 'prop)))

;; We now move on to enumerating all selectors
;; We do this somewhat intelligently--we look at *which* selector
;; causes us to fail the inequality check.

(define (rule-append-property rule prop)
  (match-define (list selector (? attribute? attrs) ... (? list? props) ...) rule)
  `(,selector ,@attrs ,@(sort (cons `(,prop ?) props) symbol<? #:key car)))

;; TODO: Duplicate code
(define (step-ineq rules elts ineq)
  (define ml (rule-matchlist rules elts))
  (define classes (matchlist-equivalence-classes ml elts))
  (match-define (or (list prop elt1 _) (list prop elt1 '= _)) ineq)
  (define hash (car (dict-ref classes prop)))
  ;; We assume the ineq is NOT satisfied
  (define sidx (dict-ref hash elt1)) ;; sidx: index in sort order
  ;; So we must do one of two things: step that selector,
  ;; or enable that property earlier on
  (define change-property
    (for/list ([i (in-range (if sidx sidx (length ml)))])
      (define idx (rulematch-idx (list-ref ml i)))
      (define rule (list-ref rules idx))
      (and (not (dict-has-key? (filter list? (cdr rule)) prop))
           (list-set rules idx (rule-append-property rule prop)))))
  
  (define change-selector
    (if sidx
        (let* ([idx (rulematch-idx (list-ref ml sidx))]
               [rule (list-ref rules idx)])
          (for/list ([sel* (step-selector (car rule) elts)])
            (list-set rules idx
                      (cons sel* (cdr rule)))))
        (list (append rules '((*))))))

  (append (filter identity change-property) change-selector))

;; This steps selectors

(define (get-tcis elts)
  (define-values (tags classes ids)
    (for/reap [tag! class! id!] ([elt elts])
      (when (element-get elt ':tag)
        (tag! (slower (element-get elt ':tag))))
      (when (element-get elt ':class)
        (for-each (compose id! slower) (element-get elt ':class)))
      (when (element-get elt ':id)
        (id! (slower (element-get elt ':id))))))
  (values (remove-duplicates tags) (remove-duplicates classes) (remove-duplicates ids)))

(define (atomic-values elts)
  (define-values (tags classes ids) (get-tcis elts))
  (append (map (curry list 'tag) tags) (map (curry list 'class) classes) (map (curry list 'id) ids)))

(define (step-selector sel elts)
  (define atoms (atomic-values elts))
  (step-selector* sel atoms))

(define (step-and sel atoms)
  (match sel
    ['* atoms]
    [(? (curry set-member? atoms))
     (filter (compose not check-duplicates)
             (map (curry list 'and sel) atoms))]
    [(list 'and _ ...)
     (filter (compose not check-duplicates)
             (map (compose (curry append sel) list) atoms))]))

(define (step-selector* sel atoms)
  (match sel
    [(list (or 'child 'desc) subsels ...)
     (cons
      (list* (car sel) '* subsels)
      (for/list ([subsel subsels] [i (in-naturals 1)]
                 #:when true [subsel* (step-and subsel atoms)])
        (list-set sel i subsel*)))]
    [_
     (list* `(child * ,sel) `(desc * ,sel) (step-and sel atoms))]))

;; As a simple check, we throw out rules where a selector doesn't match anything
;; TODO: We'll need to reconsider this at some point, I guess
;; This must guarantee that stepping doesn't make invalid rules valid

(define (rules-valid? rules elts)
  (define ml (rule-matchlist rules elts))
  (for/and ([rm ml])
    (not (null? (rulematch-elts rm)))))

;; Here is a simple scoring function for rules.
;; The key is that every step must only increase the score,
;; so that the A* minimality guarantee holds.

(define (selector-score selector)
  (match selector
    ['* 10]
    [(list 'tag _) 20]
    [(list 'class _) 25]
    [(list 'id _) 30]
    [(list 'and subs ...)
     (apply + 10 (map selector-score subs))]
    [(list 'desc subs ...)
     (apply + 10 (map selector-score subs))]
    [(list 'child subs ...)
     (apply + 15 (map selector-score subs))]))

(define (rules-score rules)
  (apply +
         (for/list ([rule rules])
           (+ 100 (length (filter list? (cdr rule))) ;; 10 pts per rule, 1 pt per property
              (selector-score (car rule))))))

;; Now we can do the full enumeration state

(struct enumeration-state (elts ineqs pq seen) #:mutable)

(define (score&rules<? sr1 sr2)
  (<= (car sr1) (car sr2)))

(define (make-enumeration-state elts)
  (define heap (make-heap score&rules<?))
  (heap-add! heap (cons 0 '()))
  (enumeration-state elts '() heap (mutable-set)))

(define (step! es)
  (match-define (enumeration-state elts ineq-and pq seen) es)
  (match-define (cons _ rules) (heap-min pq))
  
  (define eqcls (equivalence-classes rules elts))
  (define bad-ineqs
    (let loop ([ineq-and ineq-and])
      (match ineq-and
        ['() '()]
        [(cons ineq-or ineq-and*)
         (define bad-ineqs (filter (curry equivalence-classes-avoid? eqcls) ineq-or))
         (if (null? bad-ineqs)
             ineq-or
             (loop ineq-and*))])))

  (cond
   [(null? bad-ineqs)
    rules]
   [else
    (heap-remove-min! pq)
    (when (rules-valid? rules elts) ;; Don't build on top of invalid rules
      (define opts (apply append (for/list ([ineq bad-ineqs]) (step-ineq rules elts ineq))))
      (for ([opt opts])
        (define ml (rule-matchlist opt elts))
        (unless (set-member? seen ml)
          (heap-add! pq (cons (rules-score opt) opt))
          (set-add! seen ml))))
    #f]))

(define (add-ineqs! es ineqs)
  (set-enumeration-state-ineqs! es (append (enumeration-state-ineqs es) (list ineqs))))

(define (step*! es)
  (define x (step! es))
  (pretty-print (heap-min (enumeration-state-pq es)))
  (or x (step*! es)))
