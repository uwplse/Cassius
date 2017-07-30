#lang racket

(require "common.rkt" "dom.rkt" "registry.rkt" "selectors.rkt" "spec/tree.rkt" "encode.rkt" "smt.rkt" "spec/tree.rkt")
(provide compile-assertion)

(define (expand-match doms e sel)
  (define &e
    (match e
      [`(box-elt ,b) `(&elt ,b)]
      [`(get/elt ,&e) &e]))
  (apply smt-or
         (for*/list ([dom doms] [elt (in-elements dom)]
                     #:when (selector-matches? sel elt))
           `(= ,&e ,(name 'elt elt)))))

(define (find-extra-pointers expr)
  (match expr
    [`(forall (,vars ...) ,body) (find-extra-pointers body)]
    [`(let ([,vars ,vals] ...) ,body)
     (append (append-map find-extra-pointers vals) (find-extra-pointers body))]
    [`(ancestor ,thing ,test)
     (cons (cons test
                 (λ (&b id)
                   `(ite ,(smt-replace-terms test (list (cons '? `(get/box ,&b))))
                         ,&b
                         (,id (pbox (get/box ,&b))))))
           (find-extra-pointers thing))]
    [(? list?) (append-map find-extra-pointers (cdr expr))]
    [_ '()]))

(define (compile-assertion doms test)
  (extra-pointers (append (extra-pointers) (find-extra-pointers test)))
  (compile-assertion-expr doms test))

(define (compile-assertion-expr doms body)
  (smt-replace body
    [`(matches ,e ,sel) (expand-match doms e sel)]
    [`(descends ,e ,sel)
     `(or ,(expand-match doms e sel)
          ,(expand-match doms e `(desc ,sel *)))]
    [`(is-interactive ,e)
     `(or ,(expand-match doms e '(tag a))
          ,(expand-match doms e '(tag input))
          ,(expand-match doms e '(tag button)))]
    [`(viewable ,b)
     (match-define (list dom) doms)
     `(not (or (<= (right-border ,b) (left-content ,(dump-box (dom-boxes dom))))
               (<= (bottom-border ,b) (top-content ,(dump-box (dom-boxes dom))))))]
    [`(onscreen ,b)
     (match-define (list dom) doms)
     `(and (>= (left-border ,b) (left-content ,(dump-box (dom-boxes dom))))
           (>= (top-border ,b) (top-content ,(dump-box (dom-boxes dom)))))]
    [`(ancestor ,thing ,test)
     (define idx
       (for/first ([(name p) (in-dict (extra-pointers))] [i (in-naturals)]
                   #:when (equal? name test))
         i))
     `(get/box (,(sformat "&~a" idx) ,thing))]
    ['root-box
     (match-define (list dom) doms)
     (dump-box (dom-boxes dom))]
    ['root-elt
     (match-define (list dom) doms)
     (dump-box (dom-elements dom))]))
