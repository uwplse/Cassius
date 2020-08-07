#lang racket

(require "common.rkt" "tree.rkt" "dom.rkt" "smt.rkt" "selectors.rkt" "assertions.rkt")
(provide prune-elements prune-sheets prune-attrs prune-fonts prune-box-attrs prune-renumber)

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
               [i (in-naturals)]
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

(define (prune-attrs elts-stx sheets tests)
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
    (node-remove! elt ':split)
    (define old-classes (node-get elt ':class #:default '()))
    (node-set! elt ':class (set-intersect old-classes used-classes))
    (define old-id (node-get elt ':id))
    (when (and old-id (not (set-member? used-ids old-id)))
      (node-remove! elt ':id)))
  (unparse-tree elts))

(define (prune-box-attrs box-stx)
  (define boxes (parse-tree box-stx))
  (for ([box (in-tree boxes)])
    (node-remove! box ':split))
  (unparse-tree boxes))

(define (prune-renumber boxes-stx elts-stx)
  (define boxes (parse-tree boxes-stx))
  (define elts (parse-tree elts-stx))
  (define mapping (make-hash))
  (for ([box (in-tree boxes)] #:when (node-get box ':elt))
    (node-set! box ':elt (hash-ref! mapping (node-get box ':elt) (hash-count mapping))))
  (for ([elt (in-tree elts)] #:when (node-get elt ':num))
    (node-set! elt ':num (hash-ref! mapping (node-get elt ':num) (hash-count mapping))))
  (values (unparse-tree boxes) (unparse-tree elts)))

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

