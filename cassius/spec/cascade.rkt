#lang racket
(require "../common.rkt")
(require "../dom.rkt")
(require "../css-properties.rkt")
(require unstable/sequence)

(provide cascade-rules selector->z3 selector can-match?)

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
    [(? string?) 'false]
    [`(or ,sels ...) `(or ,@(map (curryr selector-matches? elt) sels))]
    [`(desc ,sel*) (selector-matches? sel* elt)]
    [`(desc ,ansc ... ,sel*)
     (define tail-sel `(desc ,@ansc))
     `(and ,(selector-matches? sel* elt)
           (or ,@(map (curry selector-matches? tail-sel) (element-anscestors elt))))]))

(define (selector-definitely-matches? sel elt)
  "Can the selector can be statically determined to match the element"
  (match (selector-matches? sel elt)
    ['true #t]
    [`(or ,selzs) (member 'true selzs)]
    [_ #f]))

(define (selector-possibly-matches? sel elt)
  "Can the selector can be statically determined to not match the element"
  (match (selector-matches? sel elt)
    ['false #f]
    [`(and ,selzs) (not (member 'false selzs))]
    [_ #t]))

(define (type->prefix type)
  (if (eq? (slower type) 'textalign) 'text-align (slower type)))

(define (cascade-rules rules elt)
  (define re `(rules (get/elt ,(element-name elt))))
  (define (name&rule->selector name&rule)
    (selector (car name&rule) (cdr name&rule)))

  (define matching-rules
    (filter (compose (curryr selector-possibly-matches? elt) name&rule->selector) rules))

  (reap [sow]
   (for ([(property type default) (in-css-properties)])
     (define applicable-rules (filter (curryr has-property? property) matching-rules))

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
    [`? `(selector ,name)]
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
    [(? string?) #f]
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
