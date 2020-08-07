#lang racket

(require "common.rkt" "tree.rkt" "dom.rkt" "smt.rkt" "selectors.rkt" "assertions.rkt")
(provide pruning-functions prune-for-caching)

(define (prune-elements problem) ; TODO: kind of weird here with the unparsing
  (define doc (first (dict-ref problem ':documents)))
  (define elts-stx (dom-elements doc))
  (define boxes (parse-tree (dom-boxes doc)))
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
  (dict-set problem ':documents (list (struct-copy dom doc [elements node]))))

(define (prune-sheets problem)
  (define sheets (dict-ref problem ':sheets))
  (define elementss (map (compose parse-tree dom-elements) (dict-ref problem ':documents)))
  (define sheets*
    (for/list ([sheet sheets])
      (for/list ([rule sheet]
                 [i (in-naturals)]
                 #:when (for*/or ([elements elementss] [elt (in-tree elements)])
                          (selector-matches? (car rule) elt)))
        rule)))
  (dict-set problem ':sheets sheets*))

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

(define (prune-attrs problem)
  (define tests (dict-ref problem ':tests))
  (define sheets (dict-ref problem ':sheets))
  (define doc (first (dict-ref problem ':documents)))
  (define elts (parse-tree (dom-elements doc)))

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
    (node-remove! elt ':split)
    (define old-classes (node-get elt ':class #:default '()))
    (node-set! elt ':class (set-intersect old-classes used-classes))
    (define old-id (node-get elt ':id))
    (when (and old-id (not (set-member? used-ids old-id)))
      (node-remove! elt ':id)))
  (dict-set problem ':documents (list (struct-copy dom doc [elements (unparse-tree elts)]))))

(define (prune-box-attrs problem)
  (define doc (first (dict-ref problem ':documents)))
  (define boxes (parse-tree (dom-boxes doc)))
  (for ([box (in-tree boxes)])
    (node-remove! box ':split))
  (dict-set problem ':documents (list (struct-copy dom doc [boxes (unparse-tree boxes)]))))

(define (prune-fonts problem)
  (define fonts (dict-ref problem ':fonts))
  (define sheets (dict-ref problem ':sheets))
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
  (define fonts*
    (for/reap [sow] ([font fonts])
      (match-define (list size family weight style metrics ...) font)
      (when (and (set-member? families family)
                 (set-member? weights weight)
                 (set-member? styles style))
        (sow font))))
  (dict-set problem ':fonts fonts*))

(define (prune-renumber problem)
  (define doc (first (dict-ref problem ':documents)))
  (define elts (parse-tree (dom-elements doc)))
  (define boxes (parse-tree (dom-boxes doc)))

  (define mapping (make-hash))
  (for ([box (in-tree boxes)] #:when (node-get box ':elt))
    (node-set! box ':elt (hash-ref! mapping (node-get box ':elt) (hash-count mapping))))
  (for ([elt (in-tree elts)] #:when (node-get elt ':num))
    (node-set! elt ':num (hash-ref! mapping (node-get elt ':num) (hash-count mapping))))

  (dict-set problem ':documents
            (list (struct-copy dom doc [elements (unparse-tree elts)]
                               [boxes (unparse-tree boxes)]))))

(define pruning-functions
  (list prune-elements
        prune-sheets
        prune-attrs
        prune-fonts
        prune-renumber
        prune-box-attrs))

(define (prune-for-caching problem)
  (define doc (first (dict-ref problem ':documents)))
  (dict-set* problem
             ':name '("[removed for caching]")
             ':title '("[removed for caching]")
             ':url '("[removed for caching]")
             ':documents (list (struct-copy dom doc [name 'removed-for-caching]))
             ':features '()))
