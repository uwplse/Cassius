#lang racket
(require "common.rkt" "tree.rkt")

(provide (struct-out dom) dom-context in-elements in-boxes elements-difference parse-dom
         dom-strip-positions dom-set-range)

(struct dom (name properties elements boxes) #:prefab)
(struct element (type attrs parent* children)
        #:mutable
        #:methods gen:custom-write
        [(define (write-proc elt port mode)
           (fprintf port "[~a ~a]"
                    (element-type elt)
                    (string-join (map ~a (element-attrs elt)) " ")))])

(define (dom-context dom key #:default [default #f])
  (dict-ref (dom-properties dom) key default))

(define in-elements (compose in-tree dom-elements))
(define in-boxes    (compose in-tree dom-boxes))

(define (elements-difference from to)
  (let/ec return
    (let loop ([from from] [to to])
      (for ([cls (set-subtract (node-get to ':class #:default '()) (node-get from ':class #:default '()))])
        (return (list 'add-class from cls)))
      (for ([cls (set-subtract (node-get from ':class #:default '()) (node-get to ':class #:default '()))])
        (return (list 'remove-class from cls)))
      (unless (equal? (node-get from ':id) (node-get to ':id))
        (return (list 'set-id from (node-get to ':id))))
      (unless (= (length (node-children from)) (length (node-children to)))
        (return (list 'children from to)))
      (for-each loop (node-children from) (node-children to)))
    (return #f)))

(define (parse-dom doc)
  (match-define (dom name ctx elts boxes) doc)
  (dom name ctx (parse-tree elts) (parse-tree boxes)))

(define (dom-strip-positions d)
  (define boxes*
    (let loop ([tree (dom-boxes d)])
      (match-define (list (list type cmds ...) children ...) tree)
      (cons
       (match type
         [(or 'BLOCK 'INLINE 'VIEW 'LINE 'ANON)
             (cons type (dict->attributes (filter (compose not (curry set-member? '(:x :y :w :h)) car) (attributes->dict cmds))))]
         ['TEXT
          (cons type (dict->attributes (filter (compose not (curry set-member? '(:x :y :h)) car) (attributes->dict cmds))))]
         [_ (cons type cmds)])
       (map loop children))))
  (struct-copy dom d [boxes boxes*]))

(define (dom-set-range d)
  (define ctx*
    (for/fold ([ctx (dom-properties d)])
        ([(field value)
          #hash([:w . ((between 1024 1920))]
                [:h . ((between 800 1080))]
                [:fs . ((between 16 32))])])
      (dict-set ctx field value)))
  (struct-copy dom d [properties ctx*]))
