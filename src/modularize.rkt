#lang racket

(require "common.rkt" "tree.rkt" "dom.rkt" "smt.rkt" "selectors.rkt")
(provide modularize)

(define (prune-elements boxes elts-stx) ; TODO: kind of weird here with the unparsing
  (define used-ids
    (for/set ([box (in-tree boxes)] #:when (node-get* box ':elt #:default false))
      (node-get box ':elt)))
  (match-define (cons ids node)
                (let loop ([elt (parse-tree elts-stx)])
                  (define child-res (map loop (node-children elt)))
                  (cons
                   (set-union
                    (if (null? child-res)
                        (set)
                        (apply set-union (map car child-res)))
                    (if (node-get* elt ':num #:default false)
                        (set (node-get elt ':num))
                        (set)))
                   (cons (car (unparse-tree elt))
                         (for/list ([(ids child) (in-dict child-res)]
                                            #:unless (set-empty? (set-intersect ids used-ids)))
                                   child)))))
  node)

(define (prune-sheets sheets elements)
  (for/list ([sheet sheets])
    (for/list ([rule sheet]
               #:when (for/or ([elt (in-tree (parse-tree elements))]) (selector-matches? (car rule) elt)))
      rule)))

(define (split-document doc)
  (reap [sow]
    (let loop ([tree (dom-boxes doc)])
      (define children* (map loop (rest tree)))
      (if (or (set-member? (first tree) ':spec) (set-member? (first tree) ':assert))
          (let* ([component (parse-tree (cons (first tree) children*))]
                 [spec (node-get component ':spec #:default 'true)]
                 [assert (node-get component ':assert #:default 'true)]
                 [admit? (node-get* component ':admit #:default false)]
                 [ctx (dom-properties doc)])
            (node-remove! component ':spec)
            (node-remove! component ':assert)
            (node-remove! component ':admit)
            (define props
              (if (eq? tree (dom-boxes doc)) ctx (dict-set ctx ':component '())))
            (unless admit?
                (sow (cons (struct-copy dom doc
                                        [name (node-get component ':name #:default false)]
                                        [boxes (unparse-tree component)]
                                        [elements (prune-elements component (dom-elements doc))]
                                        [properties props])
                           (and-assertions spec assert))))
            (unless (eq? tree (dom-boxes doc))
              (node-add! component ':component 'true))
            (node-add! component ':spec spec)
            (list (first (unparse-tree component))))
          (cons (first tree) children*)))))

(define (modularize problem)
  (cons
   (dict-set problem ':render false)
   (for/list ([(piece spec) (in-dict (append-map split-document (dict-ref problem ':documents)))])
     (define sheets* (prune-sheets (dict-ref problem ':sheets) (dom-elements piece)))
     (dict-set (dict-set (dict-set problem ':documents (list piece)) ':test (list spec)) ':sheets sheets*))))
