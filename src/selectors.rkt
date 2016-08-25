#lang racket

(require "common.rkt" "tree.rkt" "spec/css-properties.rkt" data/heap "z3.rkt")
(module+ test (require rackunit))
(provide equivalence-classes equivalence-classes-avoid?
         selector-matches?
         all-selectors ineqs->stylesheet hitting-set)



(define (selector-matches? sel elt)
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
     (define ecls (map slower (node-get* elt ':class #:default '())))
     (set-member? ecls cls)]
    [`(tag ,tag)
     (define etag (node-type elt))
     (when (equal? etag '?)
       (raise (make-exn:fail:unsupported "Holes in tag names are not supported" (current-continuation-marks))))
     (equal? etag tag)]
    [(list 'and sels ...) (andmap (curryr selector-matches? elt) sels)]
    [(list 'desc sels ...)
     (match-define (cons sel rsels) (reverse sels))
     (and (selector-matches? sel elt)
          (let loop ([rsels rsels] [elt elt])
            (cond
             [(null? rsels) true]
             [(not (node-parent elt)) false]
             [(selector-matches? (car rsels) elt)
              (loop (cdr rsels) (node-parent elt))]
             [else
              (loop rsels (node-parent elt))])))]
    [(list 'child sels ...)
     (match-define (cons sel rsels) (reverse sels))
     (and (selector-matches? sel elt)
          (let loop ([rsels rsels] [elt elt])
            (cond
             [(null? rsels) true]
             [(not (node-parent elt)) false]
             [(selector-matches? (car rsels) elt)
              (loop (cdr rsels) (node-parent elt))]
             [else false])))]))

(module+ test
  (define tree
    '([html] ; 0
      ([body] ; 1
       ([div :id content] ; 2
        ([H1 :class title]) ; 3
        ([div :class abstract] ; 4
         ([blockquote] ; 5
          ([p]))) ; 6
        ([p]) ; 7
        ([div :class aside] ; 8
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

(define (compute-score selector)
  "Given a selector, return a list (ids classes tags) of counts"
  (match selector
    [(list 'id id) '(1 0 0)]
    [(list 'class cls) '(0 1 0)]
    [(list 'tag tag) '(0 0 1)]
    ['* '(0 0 0)]
    [(list 'fake _ ...) '(0 0 1)] ; TODO: Should it be 0 0 0 ?
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
  (for/first ([rm matchlist]
              #:when (and (set-member? (rulematch-elts rm) elt)
                          (set-member? (map car (rulematch-props rm)) prop)))
    rm))

(define (matchlist-equivalence-classes ml elts)
  (for/hash ([(prop type* default) (in-css-properties)])
    (define class-hash (make-hash))
    (define value-hash (make-hash))
    (for* ([elt elts])
      (define rm (matchlist-find ml elt prop))
      (define idx (and rm (rulematch-idx rm)))
      (define value
        (cond
         [(number? idx)
          (car (dict-ref (rulematch-props rm) prop))]
         [(not idx)
          (if (equal? prop 'text-align) 'left default)]))
      (dict-set! value-hash idx value)
      (dict-set! class-hash elt idx))
    (values prop (cons class-hash value-hash))))

(define (equivalence-classes rules elts)
  (define ml (rule-matchlist rules elts))
  (matchlist-equivalence-classes ml elts))

(define (equivalence-classes-avoid? classes ineq)
  (match ineq
    [(list prop (? node? elt1) (? node? elt2))
     (define hash (car (dict-ref classes prop)))
     (not (equal? (dict-ref hash elt1) (dict-ref hash elt2)))]
    [(list prop (? node? elt1) val)
     (match-define (cons class-hash value-hash) (dict-ref classes prop))
     (not (equal? (dict-ref value-hash (dict-ref class-hash elt1)) val))]))

;; This steps selectors

(define (get-tcis elts)
  (define-values (tags classes ids)
    (for/reap [tag! class! id!] ([elt elts])
      (tag! (slower (node-type elt)))
      (for-each (compose class! slower) (node-get* elt ':class #:default '()))
      (when (node-get elt ':id)
        (id! (slower (node-get elt ':id))))))
  (values (remove-duplicates tags) (remove-duplicates classes) (remove-duplicates ids)))

(define (atomic-values elts)
  (define-values (tags classes ids) (get-tcis elts))
  (append (map (curry list 'tag) tags) (map (curry list 'class) classes) (map (curry list 'id) ids)))

(define (hitting-set xss #:extra [extra 0])
  (define atom-names
    (for/hash ([atom (remove-duplicates (apply append xss))] [i (in-naturals)])
      (values atom (sformat "atom/~a" i))))
  (define constraints
    (append
     (for/list ([name (in-hash-values atom-names)])
       `(declare-const ,name Bool))
     #;(for/list ([name (in-hash-values atom-names)])
       `(assert-soft (not ,name)))
     (for/list ([xs xss])
       `(assert (or ,@(for/list ([x xs]) (dict-ref atom-names x)))))
     (for/list ([xs xss])
       `(assert-soft (< ,extra (+ ,@(for/list ([x xs]) `(ite ,(dict-ref atom-names x) 1 0))))))))
  (match-define (list 'model out) (z3-solve constraints))
  (for/list ([(atom name) (in-hash atom-names)] #:when (dict-ref out name #f))
    atom))

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
                (define new-sel (list head tail old-sel))
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
    (if (node? val)
        (xor (set-member? elts elt1) (set-member? elts val))
        (set-member? elts elt1)))
  (for/list ([(elts sel) (in-hash selhash)] #:when (elts-good? elts))
    sel))

(define (ineqs-rules ineqss selhash)
  (hitting-set
   #:extra 1
   (for/list ([ineqs ineqss])
     (remove-duplicates (append-map (curryr ineq-selectors selhash) ineqs)))))

(define (ineq-rules->z3 ineq rules elts)
  (match-define (list prop elt1 val) ineq)
  (define scores (rule-scores (map list rules)))

  (cond
   [(not (node? val))
    `(or
      false
      ,@(for/list ([rule rules] [i (in-naturals)]
                   #:when (selector-matches? rule elt1))
          (sformat "property/~a/~a" prop i)))]
   [(node? val)
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
   #;(for/list ([prop props] #:when true [rule rules] [i (in-naturals)])
     `(assert-soft (not ,(sformat "property/~a/~a" prop i))))
   (for/list ([ineqs ineqss])
     `(assert
       (or ,@(map (curryr ineq-rules->z3 rules elts) ineqs))))
   (for/list ([xs ineqss])
     `(assert-soft (< 1 (+ ,@(for/list ([x xs]) `(ite ,(ineq-rules->z3 x rules elts) 1 0))))))))

(define (ineqs-rules->properties ineqs rules elts)
  (define z3 (ineqs-rules->z3 ineqs rules elts))
  (match-define (list 'model out) (z3-solve z3))
  (for/list ([selector rules] [i (in-naturals)])
    (cons selector
          (for/list ([(prop _t _d) (in-css-properties)]
                     #:when (dict-ref out (sformat "property/~a/~a" prop i) #f))
            `[,prop ?]))))

(define (ineqs->stylesheet ineqs selhash)
  (define elts (for/first ([(elts sel) (in-hash selhash)] #:when (equal? sel '*)) elts))
  (define rules (ineqs-rules ineqs selhash))
  (ineqs-rules->properties ineqs rules elts))
