#lang racket

(require "common.rkt" "selectors.rkt" "tree.rkt" "dom.rkt")
(provide interpret-action synthesize-script synthesize-handler)

(define (interpret-action-core target-expr act tree)
  (match-define (list target)
    (for/list ([elt (in-tree tree)] #:when (selector-matches? target-expr elt)) elt))
  (define type (car act))
  (define vals
    (match act
      [`(click) (list)]))

  (list* type target vals))

(define (interpret-action target-expr act handlers tree)
  (match-define (list type target vals ...) (interpret-action-core target-expr act tree))

  (define handler
    (for/first ([handler handlers]
                #:when (equal? (second handler) type)
                #:when (selector-matches? (first handler) target))
      handler))

  (when handler
    (match-define (list sel evt vars script ...) handler)
    (interpret-script tree script (cons (cons 'this (list target)) (map cons vars vals)))))

(define (interpret-script tree script env)
  (for ([line script])
    (interpret-line tree line env)))

(define (interpret-line tree line env)
  (match line
    [(list 'add-class eltexpr cls)
     (define elts (interpret-eltexpr tree eltexpr env))
     (for ([elt elts])
       (node-set! elt ':class (remove-duplicates (append (node-get elt ':class #:default '()) (list cls)))))]
    [(list 'remove-class eltexpr cls)
     (define elts (interpret-eltexpr tree eltexpr env))
     (for ([elt elts])
       (node-set! elt ':class (filter (λ (x) (not (equal? x cls))) (node-get elt ':class #:default '()))))]))

(define (interpret-eltexpr tree eltexpr env)
  (match eltexpr
    [(list 'select sel)
     (for/list ([elt (in-tree tree)] #:when (selector-matches? sel elt)) elt)]
    [(list 'parent expr)
     (map node-parent (interpret-eltexpr tree expr env))]
    [(? symbol?)
     (dict-ref env eltexpr)]))

(define (synthesize-handler target-expr act tree1 tree2)
  (match-define (list type target vals ...) (interpret-action-core target-expr act tree1))
  (define env (cons (cons 'this target)
                    (for/list ([v vals] [i (in-naturals 1)]) (sformat "x~a" i))))
  (define selhash (all-selectors tree1))
  (define sel
    (let ([good-sels (filter (curryr set-member? target) (hash-keys selhash))])
      (dict-ref selhash (argmin set-count target))))
  (list sel type (map car (cdr env)) (synthesize-script env tree1 tree2)))

(define (synthesize-script env tree1 tree2)
  (define (sort-queue queue)
    (sort queue < #:key length))
  (let/ec return
    (let loop ([queue '(())])
      (match-define (cons candidate queue*) queue)
      (define (enqueue new)
        (loop (sort-queue (append new queue*))))

      (define result (tree-copy tree1))
      (interpret-script result candidate env)
      (match (elements-difference result tree2)
        [#f (return candidate)]
        [(list 'add-class elt cls)
         (define eltexprs (synthesize-eltexprs env elt result))
         (enqueue (for/list ([ee eltexprs]) (snoc candidate `(add-class ,ee ,cls))))]
        [(list 'remove-class elt cls)
         (define eltexprs (synthesize-eltexprs env elt result))
         (enqueue (for/list ([ee eltexprs]) (snoc candidate `(remove-class ,ee ,cls))))]))))

(define (synthesize-eltexprs env elt tree)
  (define selhash (all-selectors (sequence->list (in-tree tree))))
  (append
   (for/list ([(elts sel) selhash] #:when (set-member? elts elt))
     (list 'select sel))
   (reap [sow]
     (for ([(var val) (in-dict env)])
       (let loop ([elt* val] [k sow])
         (cond
          [(equal? elt* elt) (k var)]
          [(node-parent elt*)
           (loop (node-parent elt*) (λ (x) (k (list 'parent x))))]
          [else (void)]))))))
