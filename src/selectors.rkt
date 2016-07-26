#lang racket

(require "common.rkt" "dom.rkt" "spec/css-properties.rkt" data/heap "z3.rkt")
(module+ test (require rackunit))
(provide equivalence-classes
         make-enumeration-state step*! add-ineqs!
         rules-score all-selectors ineqs->stylesheet hitting-set)



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

(define ((output<? f <?) a b)
  (<? (f a) (f b)))

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
  (map cdr
       (reverse ; Reverse so that HIGHEST score comes first
        (sort
         (for/list ([s scores] [r rules] [m matches] [i (in-naturals)])
           (cons s (rulematch r m i)))
         score<? #:key car))))

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

;; An inequality is either (prop elt1 elt2) or (prop elt1 val1)

(define (equivalence-classes-avoid? classes ineq)
  (match ineq
    [(list prop (? element? elt1) (? element? elt2))
     (define hash (car (dict-ref classes prop)))
     (not (equal? (dict-ref hash elt1) (dict-ref hash elt2)))]
    [(list prop (? element? elt1) val)
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
  (match-define (list prop (? element? elt1) val) ineq)
  (define hash (car (dict-ref classes prop)))
  ;; We assume the ineq is NOT satisfied
  (define sidx (dict-ref hash elt1)) ;; sidx: index in sort order
  ;; So we must do one of two things: step that selector,
  ;; or enable that property earlier on
  (define change-property
    (for/list ([i (in-range (if sidx sidx (length ml)))])
      (define rm (list-ref ml i))
      (define idx (rulematch-idx rm))
      (define rule (list-ref rules idx))
      (and (not (dict-has-key? (filter list? (cdr rule)) prop))
           (or (set-member? (rulematch-elts rm) elt1)
               (and (element? val) (set-member? (rulematch-elts rm) val)))
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

;; Here is a simple scoring function for rules.
;; The key is that every step must only increase the score,
;; so that the A* minimality guarantee holds.

(define (selector-score selector)
  (match selector
    ['* 10]
    [(list 'tag _) 10]
    [(list 'class _) 15]
    [(list 'id _) 30]
    [(list 'and subs ...)
     (apply + 1 (map selector-score subs))]
    [(list 'desc subs ...)
     (apply + 2 (map selector-score subs))]
    [(list 'child subs ...)
     (apply + 10 (map selector-score subs))]))

(define (rules-score rules)
  (apply +
         (for/list ([rule rules])
           (+ 100 (length (filter list? (cdr rule))) ;; 10 pts per rule, 1 pt per property
              (selector-score (car rule))))))

;; Now we can do the full enumeration state

(struct enumeration-state (elts ineqs pq seen hs hs-when) #:mutable)

(define (score&rules<? sr1 sr2)
  ((lex<? (output<? length <) < (const true)) sr1 sr2))

(define (make-enumeration-state elts)
  (define heap (make-heap score&rules<?))
  (heap-add! heap (list '() 0 '()))
  (enumeration-state elts '() heap (mutable-set) '() 0))

(define (step! es)
  (match-define (enumeration-state elts ineq-and pq seen hs hs-when) es)
  (match-define (list bad-ineqs score rules) (heap-min pq))
  (eprintf "~a ~a ~a\n" (length bad-ineqs) score rules)
  (heap-remove-min! pq)

  (let/ec return
    (when (null? bad-ineqs) (return rules))
    (define opts (step-ineq rules elts (car bad-ineqs)))
    (for ([opt opts])
      (define ml (rule-matchlist opt elts))
      (unless (or (ormap (compose null? rulematch-elts) ml) (set-member? seen ml) (check-duplicates ml #:key rulematch-elts))
        (define eqcls (matchlist-equivalence-classes ml elts))
        (define ineqs* (filter (compose not (curry equivalence-classes-avoid? eqcls)) hs))
        (define score (rules-score opt))
        (eprintf "-> ~a ~a ~a\n" (length ineqs*) score opt)
        (cond
         [(null? ineqs*)
          (return opt)]
         [else
          (heap-add! pq (list ineqs* score opt))
          (set-add! seen ml)])))
    (return #f)))

(define (add-ineqs! es ineqs)
  (define new-ineqs (cons ineqs (enumeration-state-ineqs es)))
  (set-enumeration-state-ineqs! es new-ineqs)
  (set-enumeration-state-hs-when! es (length new-ineqs))
  (define hs (hitting-set new-ineqs))
  (pretty-print hs)
  (set-enumeration-state-hs! es hs)
  (set-enumeration-state-seen! es (mutable-set))
  (define heap (make-heap score&rules<?))
  (heap-add! heap (list hs 0 '()))
  (set-enumeration-state-pq! es heap))

(define (hitting-set xss)
  (define atom-names
    (for/hash ([atom (remove-duplicates (apply append xss))] [i (in-naturals)])
      (values atom (sformat "atom/~a" i))))
  (define constraints
    (append
     (for/list ([name (in-hash-values atom-names)])
       `(declare-const ,name Bool))
     (for/list ([name (in-hash-values atom-names)])
       `(assert-soft (not ,name)))
     (for/list ([xs xss])
       `(assert (or ,@(for/list ([x xs]) (dict-ref atom-names x)))))))
  (match-define (list 'model out) (z3-solve constraints))
  (for/list ([(atom name) (in-hash atom-names)] #:when (dict-ref out name))
    atom))

(define (step*! es [n 0])
  (define x (step! es))
  (when x
    (eprintf "Skipped ~a stylesheets of ~a options\n" n
             (heap-count (enumeration-state-pq es)))
    (eprintf "Producing ~a\n" x))
  (or x (step*! es (+ n 1))))

(define (set-intersect-sorted l1 l2)
  (define s1 (apply set l1))
  (filter (curry set-member? s1) l2))

(define (all-selectors elts)
  (define atoms
    (for/hash ([a (atomic-values elts)])
      (values (filter (curry selector-matches? a) elts) a)))

  (define ands (make-hash (list (cons elts '*))))

  (let loop ([changes (hash-keys ands)])
    (unless (null? changes)
      (define new-changes
        (reap [sow]
              (for* ([elts changes] [(elts* a) atoms])
                ;; The sort is because set-intersect doesn't keep sorted lists sorted
                (define new-elts (set-intersect-sorted elts elts*))
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
                (define new-sel (list head old-sel tail))
                ;; The sort is because set-intersect doesn't keep sorted lists sorted
                (define new-elts (filter (curry selector-matches? new-sel) elts))
                (unless (or (dict-has-key? descs new-elts) (null? new-elts))
                  (dict-set! descs new-elts new-sel)
                  (sow new-elts)))))
      (loop new-changes)))

  descs)

(define (ineq-selectors ineq selhash)
  (match-define (list prop elt1 val) ineq)
  (define (elts-good? elts)
    (if (element? val)
        (xor (set-member? elts elt1) (set-member? elts val))
        (set-member? elts elt1)))
  (for/list ([(elts sel) (in-hash selhash)] #:when (elts-good? elts))
    sel))

(define (ineqs-rules ineqs selhash)
  (hitting-set (map (compose remove-duplicates (curry append-map (curryr ineq-selectors selhash))) ineqs)))

(define (ineq-rules->z3 ineq rules elts)
  (match-define (list prop elt1 val) ineq)
  (define scores (rule-scores (map list rules)))

  (cond
   [(not (element? val))
    `(or
      false
      ,@(for/list ([rule rules] [i (in-naturals)]
                   #:when (selector-matches? rule elt1))
          (sformat "property/~a/~a" prop i)))]
   [(element? val)
    (define sorted-rules
      (sort (map cons (range (length rules)) scores) score<? #:key cdr))
    (for/fold ([expr 'false])
        ([(i score) (in-dict sorted-rules)]
         #:when (or (selector-matches? (list-ref rules i) elt1)
                    (selector-matches? (list-ref rules i) val)))
      (define sel (list-ref rules i))
      (if (and (selector-matches? sel elt1) (selector-matches? sel val))
          `(and (not ,(sformat "property/~a/~a" prop i)) ,expr)
          `(or ,(sformat "property/~a/~a" prop i) ,expr)))]))

(define (ineqs-rules->z3 ineqss rules elts)
  (define props (for/list ([(prop _t _d) (in-css-properties)]) prop))
  (append
   (for/list ([prop props] #:when true [rule rules] [i (in-naturals)])
     `(declare-const ,(sformat "property/~a/~a" prop i) Bool))
   (for/list ([prop props] #:when true [rule rules] [i (in-naturals)])
     `(assert-soft (not ,(sformat "property/~a/~a" prop i))))
   (for/list ([ineqs ineqss])
     `(assert
       (or ,@(map (curryr ineq-rules->z3 rules elts) ineqs))))))

(define (ineqs-rules->properties ineqs rules elts)
  (define z3 (ineqs-rules->z3 ineqs rules elts))
  (match-define (list 'model out) (z3-solve z3))
  (for/list ([selector rules] [i (in-naturals)])
    (cons selector
          (for/list ([(prop _t _d) (in-css-properties)]
                     #:when (dict-ref out (sformat "property/~a/~a" prop i)))
            `[,prop ?]))))

(define (ineqs->stylesheet ineqs selhash)
  (define elts (for/first ([(elts sel) (in-hash selhash)] #:when (equal? sel '*)) elts))
  (define rules (ineqs-rules ineqs selhash))
  (ineqs-rules->properties ineqs rules elts))
