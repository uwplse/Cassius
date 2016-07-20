#lang racket
(require "../common.rkt")
(require "../dom.rkt")
(require "../css-rules.rkt")
(require "css-properties.rkt")

(provide cascade-rules name-rules)

(define (dump-tag tag)
  (if tag
      (string->symbol (string-replace (format "tag/~a" (slower tag)) ":" ".."))
      'no-tag))

(define (dump-id id)
  (if id
      (sformat "id/~a" id)
      'no-id))

(define (dump-value type value)
  (define prefix (slower type))
  (match value
    [(? symbol?) (sformat "~a/~a" prefix value)]
    [(list 'px n) (list (sformat "~a/px" prefix) n)]
    [(list '% n) (list (sformat "~a/%" prefix) n)]
    [0 (dump-value type '(px 0))]))

(define (selector-matches? sel elt)
  "Given an element and a selector, returns a Z3 expression for when that element matches"
  (match sel
    [`? #f]
    [#f #f]
    [`(id ,id)
      (cond
       [(and (element-get elt ':id) (equal? (slower id) (slower (element-get elt ':id))))
        'true]
       [(and (element-get elt ':id) (equal? '? (slower (element-get elt ':id))))
        `(,(sformat "is-~a" (dump-id id)) (idname (get/elt ,(element-name elt))))]
       [else
        'false]) ]
    [`(class ,cls)
     (if (and (element-get elt ':class) (member cls (element-get elt ':class))) 'true 'false)]
    [`(tag ,tag)
     (cond
        [(and (element-get elt ':tag) (equal? (slower tag) (slower (element-get elt ':tag))))
         'true]
        [(and (element-get elt ':tag) (equal? '? (slower (element-get elt ':tag))))
         `(,(sformat "is-~a" (dump-tag tag)) (tagname (get/elt ,(element-name elt))))]
        [else
         'false])]
    [`* 'true]
    [(list (? string?) sub) (selector-matches? sub elt)]
    [`(and ,sels ...) `(and ,@(map (curryr selector-matches? elt) sels))]
    [`(or ,sels ...) `(or ,@(map (curryr selector-matches? elt) sels))]
    [`(match ,elts ...)
     (if (set-member? elts elt) 'true 'false)]
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
  (define expr (and sel (selector-matches? sel elt)))
  (and expr (eq? (reduce-bool (selector-matches? sel elt)) #t)))

(define (selector-possibly-matches? sel elt)
  "Can the selector can be statically determined to not match the element"
  (define expr (and sel (selector-matches? sel elt)))
  (or (not expr) (reduce-bool expr)))

(define (type->prefix type)
  (if (eq? (slower type) 'textalign) 'text-align (slower type)))

(define (cascade-rules names rules elt)
  (define re `(specified-style (get/elt ,(element-name elt))))
  (define matching-rules
    (for/list ([name names] [rule rules] #:when (selector-possibly-matches? (selector name rule) elt))
      (cons name rule)))

  (reap [sow]
   (for ([(property type default) (in-css-properties)])
     (define applicable-rules (filter (compose (curryr has-property? property) cdr) matching-rules))
     (define could-be-different?
       (for/or ([name names] [rule rules])
         (has-property? rule property)))

    (define could-inherit-different?
      (for/or ([name names] [rule rules])
        (and (has-property? rule property) (if (and (not (equal? rule (list '? '?))) (or (equal? (caar rule) 'child)) (equal? (caar rule) 'desc)) (selector-matches? (car rule) elt) true)))) ;; need to be able to handle inheriting tags/ids

     ; Make sure the tag name is one of the applicable rules or the tag name that is already specified
     (when (and (not (dict-empty? applicable-rules)) (equal? (element-get elt ':tag) '?))
       (sow
        `(assert
          (! (or
              (,(sformat "is-~a" (dump-tag (element-get elt ':tag))) (tagname (get/elt ,(element-name elt))))
              ,@(for/list ([(name rule) (in-dict applicable-rules)])
                  (or (selector-matches? (selector name rule) elt)
                      `(selector-applies? (selector ,name) (get/elt ,(element-name elt))))))))))

    ; Mirror above
    (when (and (not (dict-empty? applicable-rules)) (equal? (element-get elt ':id) '?))
      (sow
       `(assert
         (! (or
             (,(sformat "is-~a" (dump-id (element-get elt ':id))) (idname (get/elt ,(element-name elt))))
             ,@(for/list ([(name rule) (in-dict applicable-rules)])
                  (or (selector-matches? (selector name rule) elt)
                      `(selector-applies? (selector ,name) (get/elt ,(element-name elt))))))))))

     ;; Score of computed rule is >= any applicable stylesheet rule
     (for ([(name rule) (in-dict applicable-rules)])
       (sow
        `(assert
          (! (or (not (,(sformat "rule.~a?" property) ,name))
                 (=> ,(or (selector-matches? (selector name rule) elt)
                      `(selector-applies? (selector ,name) (get/elt ,(element-name elt))))
                     (score-ge (,(sformat "style.~a$" property) ,re) (score ,name))))
             :named ,(sformat "cascade/ge/~a/~a/~a" (element-name elt) name property)))))

     ;; Score&value of computed rule is = some applicable stylesheet rule
     (sow
      `(assert
        (! (=>
            ,(if (and could-be-different? could-inherit-different? (or (dict-empty? applicable-rules) (not (equal? (cdar applicable-rules) (list '? '?)))))
                 (cond
                   [ (and (not (dict-empty? applicable-rules)) (equal?  (caadar applicable-rules) 'id) (not (equal? (element-get elt ':id) '?)))
                     `(,(sformat "is-~a" (dump-id (element-get elt ':id))) (idname (get/elt ,(element-name elt))))]
                   [ (and (or (dict-empty? applicable-rules) (equal?  (caadar applicable-rules) 'tag)) (not (equal? (element-get elt ':tag) '?)))
                     `(,(sformat "is-~a" (dump-tag (element-get elt ':tag))) (tagname (get/elt ,(element-name elt))))];  (printf "APPLICABLERULESTAG: ~a\n" applicable-rules)] ;; Apply to all rules (not just first) & add others
                   [else 'true]) ;; Is this a good default value?

                 ;; TODO: trying to get pattern matching to work instead
                 ;(match applicable-rules
                 ;  [,(list (list _ ('tag ,...) ...) ...) `(,(sformat "is-tag/~a" (slower (element-get elt ':tag))) (tagname (get/elt ,(element-name elt))))]
                 ;  [_ (void)])
                 'true)
          (or
            (and (is-useDefault (,(sformat "style.~a$" property) ,re))
                 (= (,(sformat "style.~a" property) ,re)
                    (ite (,(sformat "is-~a/inherit" (type->prefix type)) ,(dump-value type default))
                         ;; TODO: Assumes property is not inherited, which is false for text-align
                         (,(sformat "style.~a" property)
                          (computed-style (parent (get/elt ,(element-name elt)))))
                         ,(dump-value type default))))
            ,@(for/list ([(name rule) (in-dict applicable-rules)])
                `(and
                  (,(sformat "rule.~a?" property) ,name)
                  ,(or (selector-matches? (selector name rule) elt)
                      `(selector-applies? (selector ,name) (get/elt ,(element-name elt))))
                  (= (,(sformat "style.~a$" property) ,re) (score ,name))
                  (= (,(sformat "style.~a" property) ,re)
                     (ite (,(sformat "is-~a/inherit" (type->prefix type))
                           (,(sformat "rule.~a" property) ,name))
                          (ite (is-elt (parent (get/elt ,(element-name elt))))
                               (,(sformat "style.~a" property)
                                (computed-style (parent (get/elt ,(element-name elt)))))
                               ,(dump-value type default))
                          (,(sformat "rule.~a" property) ,name)))))))
           :named ,(sformat "cascade/eq/~a/~a" (element-name elt) property)))))))

(define (selector name rule)
  (match rule
    [`(? ,props ...) #f]
    [`(,sel ,props ...) sel]))

(define (has-property? rule prop)
  (or (equal? '? rule)
      (member '? (cdr rule)) (assoc prop (filter list? (cdr rule)))))

(define (can-match ids tags classes rule)
  (let loop ([sel (car rule)])
    (match sel
      [`? #t]
      [`(id ,id) (or (member '? ids) (member id ids))]
      [`(class ,cls) (member cls classes)]
      [`(tag ,tag) (or (member '? tags) (member (slower tag) (map slower tags)))]
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
