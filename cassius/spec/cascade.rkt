#lang racket
(require "../common.rkt")
(require "../dom.rkt")
(require "../css-rules.rkt")
(require "../css-properties.rkt")
(require unstable/sequence)

(provide cascade-rules selector->z3 selector can-match? name-rules)

(define (selector-matches? sel elt)
  "Given an element and a selector, returns a Z3 expression for when that element matches"
  (match sel
    [`(selector ,name) `(selector-applies? ,sel (get/elt ,(element-name elt)))]
    [`(id ,id) (if (equal? id (element-get elt ':id)) 'true 'false)]
    [`(class ,cls)
     (if (and (element-get elt ':class) (member cls (element-get elt ':class))) 'true 'false)]
    [`(tag ,tag)
     (if (and (element-get elt ':tag) (equal? (slower tag) (slower (element-get elt ':tag))))
         'true
         'false)]
    [`* 'true]
    [(list (? string?) sub) (selector-matches? sub elt)]
    [`(or ,sels ...) `(or ,@(map (curryr selector-matches? elt) sels))]
    [`(desc ,sel*) (selector-matches? sel* elt)]
    [`(desc ,ansc ... ,sel*)
     (define tail-sel `(desc ,@ansc))
     `(and ,(selector-matches? sel* elt)
           (or ,@(map (curry selector-matches? tail-sel) (element-anscestors elt))))]))

(define (prop->prefix prop)
  (slower (css-type prop)))

(define (dump-value prop value)
  (define prefix (prop->prefix prop))
  (match value
    [(? symbol?) (sformat "~a/~a" prefix value)]
    [(list 'px n) (list (sformat "~a/px" prefix) n)]
    [(list '% n) (sformat "~a/~a%" prefix n)]))

(define (selector-definitely-matches? sel elt)
  "Can the selector can be statically determined to match the element"
  (match (selector-matches? sel elt)
    ['true #t]
    [`(or ,selzs) (member 'true selzs)]
    [(list (? string?) sub) (selector-definitely-matches? sub elt)]
    [_ #f]))

(define (selector-possibly-matches? sel elt)
  "Can the selector can be statically determined to not match the element"
  (match (selector-matches? sel elt)
    ['false #f]
    [`(and ,selzs) (not (member 'false selzs))]
    [(list (? string?) sub) (selector-possibly-matches? sub elt)]
    [_ #t]))

(define (type->prefix type)
  (if (eq? (slower type) 'textalign) 'text-align (slower type)))

(define (cascade-rules names rules elt)
  (define re `(rules (get/elt ,(element-name elt))))

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
                                (rules (parent (get/elt ,(element-name elt)))))
                               ,default)
                          (,(sformat "rule.~a" property) ,name))))))
           :named ,(sformat "cascade/eq/~a/~a" (element-name elt) property)))))))

(define (selector name rule)
  (match rule
    [`(? ,props ...) `(selector ,name)]
    [`(,sel ,props ...) sel]))

(define (can-match? sel ids tags classes)
  (match sel
    [`(id ,id) (member (slower (sformat "id/~a" id)) ids)]
    [`(tag ,tag) (member (slower (sformat "tag/~a" tag)) tags)]
    [`(class ,class) (member (slower (sformat "class/~a" class)) classes)]
    [`(desc ,sub ...) (andmap (curryr can-match? ids tags classes) sub)]
    [`(or ,sub ...) (ormap (curryr can-match? ids tags classes) sub)]
    [`(selector ,name) #t]
    [(list (? string?) sub) (can-match? sub ids tags classes)]
    [`* #t]
    [_ #t]))

(define (has-property? rule prop)
  (or (equal? '? rule) (member '? (cdr rule)) (assoc prop (cdr rule))))

(define (selector->z3 sel [ids #f] [tags #f])
  (match sel
    [`(id ,id) `(sel/id ,(sformat "id/~a" id))]
    [`(tag ,tag) `(sel/tag ,(sformat "tag/~a" tag))]
    [`(selector ,name) sel]
    [`* `sel/any]
    [_ #f]))

(define (stylesheet-constraints sname sheet save-rule ids tags classes #:browser [browser? #f])
  (for/reap [emit] ([i (in-naturals)] [rule sheet])
            (define name (sformat "~a/~a" sname i))
            (when (can-match? (selector name rule) ids tags classes)
            (save-rule name rule)

            (emit `(declare-const ,name Rule))
            (emit `(assert (! (is-a-rule ,name ,(if browser? 'UserAgent 'AuthorNormal) ,i)
                              :named ,(sformat "rule/~a/a-rule" name))))

            (define sel (selector->z3 (selector name rule)))
            (when sel (emit `(assert (! (= (selector ,name) ,sel)
                                        :named ,(sformat "rule/~a/selector" name)))))
            
            (define allow-new-properties? (member '? rule))
            (define pairs (filter list? (cdr rule)))

            (for ([(a-prop type default) (in-css-properties)])
              (match (assoc a-prop pairs)
                [(list _ '?)
                 (emit `(assert (! (= (,(sformat "rule.~a?" a-prop) ,name) true)
                                   :named ,(sformat "rule/~a/~a/?" name a-prop))))]
                [(list _ val)
                 (emit `(assert (! (= (,(sformat "rule.~a?" a-prop) ,name) true)
                                   :named ,(sformat "rule/~a/~a/?" name a-prop))))
                 (emit `(assert (! (= (,(sformat "rule.~a" a-prop) ,name) ,(dump-value a-prop val))
                                   :named ,(sformat "rule/~a/~a" name a-prop) :opt false)))]
                [#f
                 (when (not allow-new-properties?)
                   (emit `(assert (! (= (,(sformat "rule.~a?" a-prop) ,name) false)
                                     :named ,(sformat "rule/~a/~a/?" name a-prop)))))]))

              ; Optimize for short CSS
            (when (memq 'opt (flags))
              ; Each enabled property costs one line
              (for* ([type css-properties] [property (cdr type)])
                (emit `(assert-soft (not (,(sformat "rule.~a?" property) ,name)) :weight 1)))
              ; Each block with an enabled property costs two line (open/selector and close brace)
              (emit
               `(assert-soft
                 (and ,@(for*/list ([type css-properties] [property (cdr type)])
                          `(not (,(sformat "rule.~a?" property) ,name))))
                 :weight 2))
              ; Each shorthand rule can save space if all its properties exist
              (for ([(short-name subproperties) (in-pairs css-shorthand-properties)])
                (emit `(assert-soft
                        (and ,@(for/list ([subprop subproperties])
                                 (list (sformat "rule.~a?" subprop) name)))
                        :weight 3)))))))

(define (name-rules name sheet eltss)
  (for/list ([rule sheet] [i (in-naturals)])
    (define rname (sformat "~a/~a" name i))
    (and
     (for*/or ([elts eltss] [elt (in-tree elts)])
       (selector-possibly-matches? (selector rname rule) elt))
     rname)))
