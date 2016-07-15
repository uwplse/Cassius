#lang racket

(require "common.rkt")
(require "dom.rkt")
(require "css-properties.rkt")

(module+ test
  (require rackunit))

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

(define (rule-matchlist rules elts)
  (define scores (rule-scores rules))
  (define matches (for/list ([rule rules]) (filter (curry selector-matches? (car rule)) elts)))
  (define props (for/list ([rule rules]) (map car (filter list? (cdr rule)))))
  (map cdr (sort (map list* scores props matches) score<? #:key car)))

(define (matchlist-find matchlist elt prop)
  (for/first ([(props matchset) (in-dict matchlist)] [i (in-naturals)]
              #:when (and (set-member? matchset elt) (set-member? props prop)))
    i))

(define (equivalence-classes rules elts)
  (define ml (rule-matchlist rules elts))
  (for/hash ([(type _) (in-css-types)])
    (define hash (make-hash))
    (for* ([(prop type* _) (in-css-properties)] [elt elts] #:when (equal? type type*))
      (dict-set! hash (cons prop elt) (matchlist-find ml elt prop)))
    (values type hash)))

;; An inequality is a list (and AND) of lists (and OR) of atoms (type elt1 prop1 elt2 prop2)

(define (equivalence-classes-avoid? classes ineq-or-and)
  (for/and ([ineq-or ineq-or-and])
    (for/or ([ineq ineq-or])
      (match-define (list type elt1 prop1 elt2 prop2) ineq)
      (define hash (dict-ref classes type))
      (not (equal? (dict-ref hash (cons prop1 elt1)) (dict-ref hash (cons prop2 elt2)))))))
