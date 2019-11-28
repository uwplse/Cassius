#lang racket
(require racket/hash)
(require "common.rkt" "dom.rkt" "smt.rkt" "encode.rkt" "tree.rkt" "selectors.rkt" "modularize.rkt")
(require "spec/css-properties.rkt" "spec/tree.rkt" "spec/compute-style.rkt" "spec/layout.rkt"
         "spec/percentages.rkt" "spec/utils.rkt" "spec/float.rkt" "spec/colors.rkt" "spec/fonts.rkt"
         "spec/media-query.rkt" "assertions.rkt" "spec/replaced-elements.rkt")
(provide add-test model-valid/z3 model-valid?)

;; Is the model valid?

(define (model-valid/z3 doms)
  (apply smt-and
         (for*/list ([dom doms] [box (in-boxes dom)])
           `(ez.sufficient ,(dump-box box)))))

(define (model-valid? doms m)
  (define out
    (for*/and ([dom doms] [box (in-boxes dom)])
      (extract-field m box 'ez.sufficient)))
  (when (for*/or ([dom doms] [box (in-boxes dom)])
          (extract-field m box 'ez.lookback))
     (warn "Ignoring the exclusion zome assumptions"))
  out)

(define (add-test doms tests #:component [component #f] #:render? [render? true])
  (match-define (list dom) doms)
  (define possible-boxes
    (if component
        (nodes-below component  '(:pre :spec :assert :admit))
        (for/list ([box (in-boxes dom)]) box)))
  `((declare-const which-constraint Real)
    ,@(for/reap [sow] ([test tests] [id (in-naturals)]
                       #:when true
                       [(var cexvar) (in-dict (car test))])
        (define var-values
          (or (not-true-inputs (cdr test) (list var) dom)
              (map dump-box possible-boxes)))
        (sow `(declare-const ,cexvar Box))
        (sow `(assert ,(apply smt-or (for/list ([boxvar var-values]) `(= ,cexvar ,boxvar))))))
    (assert ,(apply smt-or
                    (for/list ([test tests] [i (in-naturals)])
                      `(and (not ,(cdr test)) (= which-constraint ,i)))))
    ,@(reap [sow]
         (for ([box (in-boxes dom)])
           (spec-constraints (if render? '(:spec) '(:spec :assert :admit)) dom sow box)))))

(define (nodes-below node stop?)
  (reap [sow]
        (let loop ([node node])
          (sow node)
          (for ([child (node-children node)])
            (if (stop? child)
                (sow child)
                (loop child))))))

(define (get-node-names nodes)
  (for/hash ([node nodes] #:when (node-get node ':name #:default false))
    (values (node-get node ':name) (dump-box node))))

(define (my-set-intersect . as)
  (foldl (λ (set acc) (if set (if acc (set-intersect set acc) set) acc)) #f as))

(define (my-set-union . as)
  (foldl (λ (set acc) (if set (if acc (set-union set acc) #f) #f)) '() as))

(define (not-true-inputs body ctx dom)
  (match body
    [`(=> ,conds ... ,post)
     (apply my-set-union (not-true-inputs post ctx dom)
            (map (curryr not-false-inputs ctx dom) conds))]
    [`(and ,bits ...)
     (apply my-set-union (map (curryr not-true-inputs ctx dom) bits))]
    [_ '()]))

(define (not-false-inputs body ctx dom)
  (match body
    [`(or ,bits ...)
     (apply my-set-union (map (curryr not-false-inputs ctx dom) bits))]
    [`(= ,(? (curry set-member? ctx) b)
         ,(app ~a (regexp #rx"^box([0-9]+)$" (list bname _))))
     (list (cons b bname))]
    [_ #f]))

(define (massage-body body ctx dom)
  (match body
    [`(=> ,conds ... ,post)
     (define conds*
       (filter (λ (x) (not (equal? x 'true)))
               (map (curryr massage-body ctx dom) conds)))
     (cond
      [(set-member? conds* 'false) 'true]
      [(null? conds*) (massage-body post ctx dom)]
      [else `(=> ,@conds* ,(massage-body post ctx dom))])]
    [`(or ,bits ...)
     (apply smt-or (map (curryr massage-body ctx dom) bits))]
    [`(= ,(? (curry dict-has-key? ctx) b)
         ,(app ~a (regexp #rx"^box([0-9]+)$" (list bname _))))
     (define rec (dict-ref ctx b))
     (if (equal? (~a (dump-box rec)) bname) 'true 'false)]
    [`(is-component ,(? (curry dict-has-key? ctx) b))
     (if (is-component (dict-ref ctx b)) 'true 'false)]
    [_ body]))

(define (spec-constraints fields dom emit box)
  (when (ormap (curry node-get* box) fields)
    (define nodes (nodes-below box (λ (x) (ormap (curry node-get* x) fields))))
    (define pres (node-get* box ':pre #:default '()))

    (for ([field fields] #:when (node-get* box field) [test (node-get* box field)] [i (in-naturals)])
      (define-values (vars body) (disassemble-forall test))

      (define ctx
        (hash-union
         (for/hash ([var vars]) (values var var))
         (hash '? (dump-box box))
         (get-node-names nodes)))
      (define spec (compile-assertion (list dom) `(=> ,@pres ,body) ctx))

      (for ([vals (apply cartesian-product (map (const nodes) vars))] [j (in-naturals)])
        (define body* (massage-body spec (map cons vars vals) dom))
        (unless (equal? body* 'true)
          (emit `(assert (let ,(map (λ (v x) (list v (dump-box x))) vars vals) ,body*))))))))

