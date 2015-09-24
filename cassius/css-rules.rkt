#lang racket

(require "common.rkt")
(require "smt.rkt")
(require "dom.rkt")
(require "css-properties.rkt")

(provide css-declarations css-functions
         css-properties css-property-pairs css-defaults
         css-shorthand-properties)

(define css-declarations
  `((declare-datatypes () (,@(for/list ([(type decl) (in-css-types)]) (cons type decl))))

    (declare-datatypes ()
      ((Selector sel/all (sel/tag (sel.tag TagNames)) (sel/id (sel.id Id)))
       (ImportanceOrigin UserAgent UserNormal AuthorNormal AuthorImportant UserImportant)
       (CascadeScore (cascadeScore (precedence ImportanceOrigin) (isFromStyle Bool)
                                   (idNum Int) (classNum Int) (elementNum Int)
                                   (positionNum Int)) useDefault)
       (Style (style ,@(for/reap [field] ([(prop type default) (in-css-properties)])
                                 (field `(,(sformat "style.~a" prop) ,type))
                                 (field `(,(sformat "style.~a$" prop) CascadeScore)))))
       (Rule (rule (selector Selector) (index Int) (origin ImportanceOrigin)
                   ,@(for/reap [field] ([(prop type default) (in-css-properties)])
                               (field `(,(sformat "rule.~a" prop) ,type))
                               (field `(,(sformat "rule.~a?" prop) Bool)))))))

    (define-const border/thin (border/px 1))
    (define-const border/medium (border/px 3))
    (define-const border/thick (border/px 5))
    ))

(define css-functions
  `((define-fun selector-applies? ((sel Selector) (elt Element)) Bool
      ,(smt-cond
        [(is-sel/all sel) true]
        [(is-sel/tag sel) (= (sel.tag sel) (tagname elt))]
        [(is-sel/id sel) (= (sel.id sel) (id elt))]
        [else false]))

    (define-fun score ((rule Rule)) CascadeScore
      ,(smt-cond
        [(is-sel/all (selector rule)) (cascadeScore (origin rule) false 0 0 0 (index rule))]
        [(is-sel/tag (selector rule)) (cascadeScore (origin rule) false 0 0 1 (index rule))]
        [(is-sel/id  (selector rule)) (cascadeScore (origin rule) false 1 0 0 (index rule))]
        [else (cascadeScore AuthorNormal false 0 0 0 0)]))

    (define-fun importanceOrigin-score ((io ImportanceOrigin)) Int
      ,(smt-cond
        [(is-UserAgent io)       0]
        [(is-UserNormal io)      1]
        [(is-AuthorNormal io)    2]
        [(is-AuthorImportant io) 3]
        [else                    4]))

    (define-fun score-ge ((a CascadeScore) (b CascadeScore)) Bool
      ,(smt-cond
        [(is-useDefault b) true]
        [(is-useDefault a) false]
        [(> (importanceOrigin-score (precedence a)) (importanceOrigin-score (precedence b))) true]
        [(< (importanceOrigin-score (precedence a)) (importanceOrigin-score (precedence b))) false]
        [(and (isFromStyle a) (not (isFromStyle b))) true]
        [(and (not (isFromStyle a)) (isFromStyle b)) false]
        [(> (idNum a) (idNum b)) true]
        [(< (idNum a) (idNum b)) false]
        [(> (classNum a) (classNum b)) true]
        [(< (classNum a) (classNum b)) false]
        [(> (elementNum a) (elementNum b)) true]
        [(< (elementNum a) (elementNum b)) false]
        [(> (positionNum a) (positionNum b)) true]
        [(< (positionNum a) (positionNum b)) false]
        [else true]))

    (define-fun is-a-rule ((r Rule) (o ImportanceOrigin) (i Int)) Bool
      (and
       (= (origin r) o)
       (= (index r) i)
       (=> (is-sel/id (selector r)) (not (is-no-id (sel.id (selector r)))))
       (=> (is-sel/tag (selector r)) (not (is-no-tag (sel.tag (selector r)))))))))

(define css-properties
  (for/list ([(type decl) (in-css-types)])
    (cons type
          (for/list ([(prop ptype default) (in-css-properties)] #:when (eq? type ptype))
            prop))))

(define css-defaults
  (for/hash ([(prop name default) (in-css-properties)])
    (values prop default)))

(define css-property-pairs
  (for*/list ([type css-properties] [prop (cdr type)])
    (cons prop (car type))))

(define css-shorthand-properties
  '((margin margin-top margin-right margin-bottom margin-left)
    (padding padding-top padding-right padding-bottom padding-left)
    (border-width border-top-width border-right-width border-bottom-width border-left-width)))
