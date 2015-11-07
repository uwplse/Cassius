#lang racket
(require "../common.rkt")
(require "../dom.rkt")
(require "../css-properties.rkt")
(require unstable/sequence)

(provide cascade-rules selector->z3 selector can-match?)

(define (type->prefix type)
  (if (eq? (slower type) 'textalign) 'text-align (slower type)))

(define (cascade-rules rules elt)
  (define re `(rules (get/elt ,(element-name elt))))

  (define matching-rules
    (filter (λ (x) (not (equal? (selector-matches? (selector (car x) (cdr x)) elt) 'false))) rules))

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
                          (,(sformat "style.~a" property)
                           (rules (parent (get/elt ,(element-name elt)))))
                          (,(sformat "rule.~a" property) ,name))))))
           :named ,(sformat "cascade/eq/~a/~a" (element-name elt) property)))))))

(define (selector name rule)
  (match rule
    [`? `(selector ,name)]
    [`(? ,props ...) `(selector ,name)]
    [`(,sel ,props ...) sel]))

(define (p . args)
  (apply eprintf args)
  (last args))

(define (can-match? sel ids tags classes)
  (match sel
    [`(id ,id) (member (sformat "id/~a" id) ids)]
    [`(tag ,tag) (member (sformat "tag/~a" tag) tags)]
    [`(class ,class) (member (sformat "class/~a" class) classes)]
    [`(desc ,sub ...) (andmap (curryr can-match? ids tags classes) sub)]
    [`(or ,sub ...) (ormap (curryr can-match? ids tags classes) sub)]
    [`(selector ,name) #t]
    [(? string?) #f]
    [`* #t]
    [_ #t]))

(define (has-property? rule prop)
  (or (member '? (cdr rule)) (assoc prop (cdr rule))))

(define (selector->z3 sel [ids #f] [tags #f])
  (match sel
    [`(id ,id) `(sel/id ,(sformat "id/~a" id))]
    [`(tag ,tag) `(sel/tag ,(sformat "tag/~a" tag))]
    [`(selector ,name) sel]
    [`* `sel/any]
    [_ #f]))

(define (selector-matches? sel elt)
  (match sel
    [`(selector ,name) `(selector-applies? ,sel (get/elt ,(element-name elt)))]
    [`(id ,id) (if (equal? id (element-get elt ':id)) 'true 'false)]
    [`(tag ,tag) (if (and (element-get elt ':tag) (equal? (slower tag) (slower (element-get elt ':tag)))) 'true 'false)]
    [`(class ,cls) (if (and (element-get elt ':class) (member (slower cls) (map slower (element-get elt ':class)))) 'true 'false)]
    [`* 'true]
    [(? string?) 'false]
    [`(or ,sels ...) `(or ,@(map (curryr selector-matches? elt) sels))]
    [`(desc ,sel*) (selector-matches? sel* elt)]
    [`(desc ,ansc ... ,sel*)
     `(and ,(selector-matches? sel* elt)
           (or ,@(map (curry selector-matches? `(desc ,@ansc)) (element-anscestors elt))))]))
