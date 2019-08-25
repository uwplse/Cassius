#lang racket
(require "common.rkt" "tree.rkt")

(provide (struct-out dom) dom-context in-elements in-boxes parse-dom unparse-dom
         dom-box->elt dom-elt->box dom-first-box? dom-last-box?
         dom-strip-positions dom-set-range)

(struct dom (name properties elements boxes match) #:prefab)
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

(define (parse-dom doc)
  (define elts* (parse-tree (dom-elements doc)))
  (define boxes* (parse-tree (dom-boxes doc)))
  (unless (dom-context doc ':matched)
    (error "Unmatched trees (without :elt and :num) no longer supported"))
  (struct-copy dom doc [elements elts*] [boxes boxes*] [match (build-match elts* boxes*)]))

(define (unparse-dom doc)
  (struct-copy dom doc
               [elements (unparse-tree (dom-elements doc))]
               [boxes (unparse-tree (dom-boxes doc))]
               [match #f]))

(define (build-match elts boxes)
  (define num->elt (make-hasheq))
  (define box->elt (make-hasheq))
  (define elt->box (make-hasheq))
  (define first-box (make-hasheq))
  (define last-box (make-hasheq))
  (for ([elt (in-tree elts)] #:when (node-get elt ':num))
    (dict-set! num->elt (node-get elt ':num) elt))
  (for ([box (in-tree boxes)] #:when (node-get box ':elt))
    (define num (node-get box ':elt))
    (define elt (dict-ref num->elt num (λ () (raise-cassius-error "Unknown :elt ~a" num))))
    (dict-set! box->elt box elt)
    (dict-update! elt->box elt (curry cons box) '())
    (unless (dict-has-key? first-box elt)
      (dict-set! first-box elt box))
    (dict-set! last-box elt box))
  (list box->elt elt->box first-box last-box))

(define (dom-box->elt dom box)
  (dict-ref (first (dom-match dom)) box #f))

(define (dom-elt->box dom elt)
  (dict-ref (second (dom-match dom)) elt #f))

(define (dom-first-box? dom box)
  (define elt (dict-ref (first (dom-match dom)) box #f))
  (or (not elt) (equal? box (dict-ref (third (dom-match dom)) elt #f))))

(define (dom-last-box? dom box)
  (define elt (dict-ref (first (dom-match dom)) box #f))
  (or (not elt) (equal? box (dict-ref (fourth (dom-match dom)) elt #f))))

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
