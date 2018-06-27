#lang racket

(require "common.rkt" "tree.rkt" "dom.rkt" "smt.rkt" "selectors.rkt" "assertions.rkt")
(provide modularize)

(define/contract (prune-elements box-stx elts-stx) ; TODO: kind of weird here with the unparsing
  (-> node-stx? node-stx? node-stx?)
  (define boxes (parse-tree box-stx))
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

(define (prune-sheets sheets elements-stxs)
  (define elementss (map parse-tree elements-stxs))
  (for/list ([sheet sheets])
    (for/list ([rule sheet]
               #:when (for*/or ([elements elementss] [elt (in-tree elements)])
                        (selector-matches? (car rule) elt)))
      rule)))

(define (classes-ids-used selector)
  (reap [class! id!]
        (let loop ([selector selector])
          (match selector
            [(list 'class cls)
             (class! cls)]
            [(list 'id cls)
             (id! cls)]
            [(or (list (or 'and 'desc 'child) args ...) (list (or 'media 'fake) _ args ...))
             (for-each loop args)]
            [_ (void)]))))

(define (selectors-in-test test)
  (match test
    [`(forall (,vars ...) ,body) (selectors-in-test body)]
    [`(matches ,b ,sels ...)
     (append (selectors-in-test b) sels)]
    [(list (? (curry dict-has-key? assertion-helpers) fname) args ...)
     (selectors-in-test (apply (dict-ref assertion-helpers fname) args))]
    [(list head args ...)
     (append-map selectors-in-test args)]
    [_ '()]))

(define (prune-classes elts-stx sheets tests)
  (define elts (parse-tree elts-stx))
  (define asserts
    (append
     tests
     (for/append ([elt (in-tree elts)] #:when (or (node-get* elt ':spec) (node-get* elt ':assert)))
       (append (node-get* elt ':spec #:default '()) (node-get* elt ':assert #:default '())))))
  (define selectors (append (append-map (curry map car) sheets) asserts))
  (define-values (used-classes* used-ids*)
    (for*/lists (classes ids) ([sel selectors]) (classes-ids-used sel)))
  (define used-classes (apply set-union used-classes*))
  (define used-ids (apply set-union used-ids*))
  (for ([elt (in-tree elts)])
    (define old-classes (node-get elt ':class #:default '()))
    (node-set! elt ':class (set-intersect old-classes used-classes))
    (define old-id (node-get elt ':id))
    (when (and old-id (not (set-member? used-ids old-id)))
      (node-remove! elt ':id)))
  (unparse-tree elts))

(define (prune-fonts fonts sheets)
  (define-values (families weights styles)
    (reap [f! w! s!]
      (f! "serif")
      (w! 400)
      [s! 'normal]
      (for* ([sheet sheets] [rule sheet])
        (define p&vs (filter list? (cdr rule)))
        (for ([prop (map first p&vs)] [val (map second p&vs)])
          (match prop
            ['font-family (f! val)]
            ['font-weight (w! val)]
            ['font-style (s! val)]
            [_ (void)])))))
  (filter
   identity
   (for/list ([font fonts])
     (match-define (list size family weight style metrics ...) font)
     (if (and (set-member? families family) (set-member? weights weight) (set-member? styles style))
         font
         #f))))

(define (split-document doc)
  (reap [sow]
    (let loop ([tree (dom-boxes doc)])
      (define children* (map loop (rest tree)))
      (if (or (set-member? (first tree) ':spec) (set-member? (first tree) ':assert) (set-member? (first tree) ':admit))
          (let* ([component (parse-tree (cons (first tree) children*))]
                 [specs (node-get* component ':spec #:default '())]
                 [asserts (node-get* component ':assert #:default '())]
                 [ctx (dom-properties doc)])
            (node-remove! component ':spec)
            (node-remove! component ':assert)
            (node-remove! component ':admit)
            (define props
              (if (eq? tree (dom-boxes doc)) ctx (dict-set ctx ':component '())))
            (sow (cons (struct-copy dom doc
                                    [name (node-get component ':name #:default false)]
                                    [boxes (unparse-tree component)]
                                    [properties props])
                       (append specs asserts)))
            (unless (eq? tree (dom-boxes doc))
              (node-add! component ':component 'true))
            (node-set*! component ':spec specs)
            (list (first (unparse-tree component))))
          (cons (first tree) children*)))))

(define (modularize problem)
  (define fonts (dict-ref problem ':fonts))
  (define sheets (dict-ref problem ':sheets))
  (define sheets* (prune-sheets sheets (map dom-elements (dict-ref problem ':documents))))
  (cons
   (dict-set (dict-set problem ':render false) ':sheets sheets*)
   (for/list ([(piece specs) (in-dict (append-map split-document (dict-ref problem ':documents)))])
     (define elements* (prune-elements (dom-boxes piece) (dom-elements piece)))
     (define sheets** (prune-sheets sheets* (list elements*)))
     (define elements** (prune-classes elements* sheets** specs))
     (define fonts* (prune-fonts fonts sheets**))
     (dict-set* problem
                ':documents (list (struct-copy dom piece [elements elements**]))
                ':test specs
                ':sheets sheets**
                ':fonts fonts*))))
