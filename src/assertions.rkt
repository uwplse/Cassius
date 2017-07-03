#lang racket

(require "common.rkt" "dom.rkt" "registry.rkt" "selectors.rkt" "spec/tree.rkt" "encode.rkt" "smt.rkt")
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

(define (compile-assertion doms body)
  (smt-replace body
    [`(matches ,e ,sel) (expand-match doms e sel)]
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
