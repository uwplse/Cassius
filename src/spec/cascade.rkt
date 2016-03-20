#lang racket
(require "../common.rkt")
(require "../dom.rkt")
(require "../css-rules.rkt")
(require "../css-properties.rkt")
(require unstable/sequence)

(provide selector-constraints cascade-rules name-rules)

(define (selector-matches? sel elt)
  "Given an element and a selector, returns a Z3 expression for when that element matches"
  (match sel
    [`? #f]
    [`(id ,id) (if (equal? id (element-get elt ':id)) 'true 'false)]
    [`(class ,cls)
     (if (and (element-get elt ':class) (member cls (element-get elt ':class))) 'true 'false)]
    [`(tag ,tag)
     (if (and (element-get elt ':tag) (equal? (slower tag) (slower (element-get elt ':tag))))
         'true
         'false)]
    [`* 'true]
    [(list (? string?) sub) (selector-matches? sub elt)]
    [`(and ,sels ...) `(and ,@(map (curryr selector-matches? elt) sels))]
    [`(or ,sels ...) `(or ,@(map (curryr selector-matches? elt) sels))]
    [`(desc ,sel*) (selector-matches? sel* elt)]
    [`(desc ,ansc ... ,sel*)
     (define tail-sel `(desc ,@ansc))
     `(and ,(selector-matches? sel* elt)
           (or ,@(map (curry selector-matches? tail-sel) (element-anscestors elt))))]
    [`(child ,sel*)
     (selector-matches? sel* elt)]
    [`(child ,ancestors ... ,sel*)

     `(and ,(if (element-parent elt) (selector-matches? `(child ,@ancestors) (element-parent elt)) 'false)
           ,(selector-matches? sel* elt))]))

(define (reduce-bool bool)
  (match bool
    ['true #t]
    ['false #f]
    [`(or ,sels ...)
     (define-values (ok weird) (partition boolean? (map reduce-bool sels)))
     (cond
      [(ormap identity ok) #t]
      [(null? weird) #f]
      [(= (length weird) 1) (car weird)]
      [else (cons 'or weird)])]
    [`(and ,sels ...)
     (define-values (ok weird) (partition boolean? (map reduce-bool sels)))
     (cond
      [(andmap identity ok) #t]
      [(null? weird) #f]
      [(= (length weird) 1) (car weird)]
      [else (cons 'and weird)])]
    [_ bool]))

(define (selector-definitely-matches? sel elt)
  "Can the selector can be statically determined to match the element"
  (eq? (reduce-bool (selector-matches? sel elt)) #t))

(define (selector-possibly-matches? sel elt)
  "Can the selector can be statically determined to not match the element"
  (reduce-bool (selector-matches? sel elt)))

(define (compute-score rule)
  "Given a selector, return a list of counts (ids classes elts)"
  (match rule
    [`? #f]
    [`(id ,id) `(1 0 0)]
    [`(class ,cls) `(0 1 0)]
    [`(tag ,tag) `(0 0 1)]
    [`* '(0 0 0)]
    [(list (? string?) sub) (compute-score sub)]
    [(list 'or sels ...)
     (map (curry apply max) (apply (curry map list) (map compute-score sels)))]
    [(list (or 'and 'desc 'child) sels ...)
     (map (curry apply +) (apply (curry map list) (map compute-score sels)))]))

(define (type->prefix type)
  (if (eq? (slower type) 'textalign) 'text-align (slower type)))

(define (selector-constraints emit name rule i #:browser [browser? #f])
  (define is-from-style? (member ':style (cdr rule)))

  (emit `(declare-const ,name Rule))
  (emit `(assert (! (is-a-rule ,name ,(if browser? 'UserAgent 'AuthorNormal)
                               ,i ,(if is-from-style? 'true 'false))
                    :named ,(sformat "rule/~a/a-rule" name))))

  (match (and (not is-from-style?) (selector->z3 (car rule)))
    [#f
     (match-define (list ids classes tags) (compute-score (car rule)))
     (emit `(assert (= (score ,name) (cascadeScore (origin ,name) (isFromStyle ,name) ,ids ,classes ,tags (index ,name)))))]
    [sel
     (emit `(assert (= (score ,name) (compute-score ,name))))
     (emit `(assert (! (= (selector ,name) ,sel) :named ,(sformat "rule/~a/selector" name))))]))

(define (cascade-rules names rules elt)
  (define re `(specified-style (get/elt ,(element-name elt))))

  (define matching-rules
    (for/list ([name names] [rule rules] #:when (selector-possibly-matches? (selector name rule) elt))
      (cons name rule)))

  (reap [sow]
   (for ([(property type default) (in-css-properties)])
     (define applicable-rules (filter (compose (curryr has-property? property) cdr) matching-rules))

     ;; Score of computed rule is >= any applicable stylesheet rule
     (for ([(name rule) (in-pairs applicable-rules)])
       (sow
        `(assert
          (! (or (not (,(sformat "rule.~a?" property) ,name))
                 (=> ,(selector-matches? (selector name rule) elt)
                     (score-ge (,(sformat "style.~a$" property) ,re) (score ,name))))
             :named ,(sformat "cascade/ge/~a/~a/~a" (element-name elt) name property)))))

     ;; Score&value of computed rule is = some applicable stylesheet rule
     (sow
      `(assert
        (! (or
            (and (is-useDefault (,(sformat "style.~a$" property) ,re))
                 (= (,(sformat "style.~a" property) ,re) ,default))
            ,@(for/list ([(name rule) (in-pairs applicable-rules)])
                `(and
                  (,(sformat "rule.~a?" property) ,name)
                  ,(selector-matches? (selector name rule) elt)
                  (= (,(sformat "style.~a$" property) ,re) (score ,name))
                  (= (,(sformat "style.~a" property) ,re)
                     (ite (,(sformat "is-~a/inherit" (type->prefix type))
                           (,(sformat "rule.~a" property) ,name))
                          (ite (is-elt (parent (get/elt ,(element-name elt))))
                               (,(sformat "style.~a" property)
                                (computed-style (parent (get/elt ,(element-name elt)))))
                               ,default)
                          (,(sformat "rule.~a" property) ,name))))))
           :named ,(sformat "cascade/eq/~a/~a" (element-name elt) property)))))))

(define (selector name rule)
  (match rule
    [`(? ,props ...) #f]
    [`(,sel ,props ...) sel]))

(define (has-property? rule prop)
  (or (equal? '? rule)
      (member '? (cdr rule)) (assoc prop (filter list? (cdr rule)))))

(define (selector->z3 sel [ids #f] [tags #f])
  (match sel
    [`(id ,id) `(sel/id ,(sformat "id/~a" id))]
    [`(tag ,tag) `(sel/tag ,(sformat "tag/~a" tag))]
    [`* `sel/all]
    [_ #f]))

(define (can-match ids tags classes rule)
  (let loop ([sel (car rule)])
    (match sel
      [`? #t]
      [`(id ,id) (member id ids)]
      [`(class ,cls) (member cls classes)]
      [`(tag ,tag) (member (slower tag) (map slower tags))]
      [`* #t]
      [(list (? string?) sub) (loop sub)]
      [`(and ,sels ...) (andmap loop sels)]
      [`(or ,sels ...) (ormap loop sels)]
      [`(desc ,sels ...) (andmap loop sels)]
      [`(child ,sels ...) (andmap loop sels)])))

(define (name-rules name sheet eltss)
  (define-values (ids tags classes)
    (for/reap [id tag class] ([elts eltss] #:when #t [elt (in-tree elts)])
      (when (element-get elt ':id) (id (element-get elt ':id)))
      (when (element-get elt ':tag) (tag (slower (element-get elt ':tag))))
      (when (element-get elt ':class) (for-each class (element-get elt ':class)))))

  (for/list ([rule sheet] [i (in-naturals)])
    (and
     (can-match ids tags classes rule)
     (for*/or ([elts eltss] [elt (in-tree elts)])
       (and (is-element? elt) (not (equal? (element-type elt) 'MAGIC))
            (selector-possibly-matches? (car rule) elt)))
     (sformat "~a/~a" name i))))
