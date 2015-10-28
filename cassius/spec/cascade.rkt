#lang racket
(require "../common.rkt")
(require "../dom.rkt")
(require "../css-properties.rkt")
(require unstable/sequence)

(provide cascade-rules selector->z3 selector)

(define (type->prefix type)
  (if (eq? (slower type) 'textalign) 'text-align (slower type)))

(define (cascade-rules rules elt)
  (define re `(rules (get/elt ,(element-name elt))))

  ;; Score of computed rule is >= any applicable stylesheet rule
  (append
   (for*/list ([(property type default) (in-css-properties)] [(name rule) (in-pairs rules)])
     `(assert
       (! (or (not (,(sformat "rule.~a?" property) ,name))
              (=> ,(selector-matches? (selector name rule) elt)
                  (score-ge (,(sformat "style.~a$" property) ,re) (score ,name))))
          :named ,(sformat "cascade-ge-~a-~a-~a" (element-name elt) name property))))
   
   ;; Score&value of computed rule is = some applicable stylesheet rule
   (for/list ([(property type default) (in-css-properties)])
     `(assert
       (! (or
           (and (is-useDefault (,(sformat "style.~a$" property) ,re))
                (= (,(sformat "style.~a" property) ,re) ,default))
           ,@(for/list ([(name rule) (in-pairs rules)])
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
          :named ,(sformat "cascade-~a-~a" (element-name elt) property))))))

(define (selector name rule)
  (match rule
    [`? `(selector ,name)]
    [`(? ,props ...) `(selector ,name)]
    [`(,sel ,props ...) sel]))

(define (selector->z3 sel)
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
    [`(tag ,tag) (if (equal? tag (element-get elt ':tag)) 'true 'false)]
    [`* 'true]
    [`(or ,sels ...) `(or ,@(map (curryr selector-matches? elt) sels))]
    [`(desc ,sel*) (selector-matches? sel* elt)]
    [`(desc ,ansc ... ,sel*)
     `(and ,(selector-matches? sel* elt)
           (or ,@(map (curry selector-matches? `(desc ,@ansc)) (element-anscestors elt))))]))
