#lang racket

(require "../smt.rkt" "../common.rkt")
(provide media-query? media-matches?)

(define-by-match media-query?
  `(or ,(? media-query?) ...)
  `(and ,(? media-query?) ...)
  `(only ,(? media-query?))
  `(not ,(? media-query?))
  `(min-width (px ,(? number?)))
  `(max-width (px ,(? number?)))
  `(min-height (px ,(? number?)))
  `(max-height (px ,(? number?)))
  `(orientation landscape)
  `(orientation portrait)
  (or 'all 'screen 'print 'handheld 'projection 'tty 'tv))

(define (media-parameters? p)
  (and (dict? p)
       (dict-has-key? p ':type)
       (set-member? '(screen print handheld projection tty tv) (dict-ref p ':type))
       (dict-has-key? p ':w)
       (smt? (dict-ref p ':w))
       (dict-has-key? p ':h)
       (smt? (dict-ref p ':h))))

(define/contract (media-matches? params query)
  (-> media-parameters? media-query? smt?)
  (let loop ([query query])
    (match query
      [`(or ,qs ...)
       (apply smt-or (map loop qs))]
      [`(and ,qs ...)
       (apply smt-and (map loop qs))]
      [`(only ,q)
       (loop q)]
      [`(not ,q)
       (smt-not (loop q))]
      ['all 'true]
      [(or 'screen 'print 'handheld 'projection 'tty 'tv)
       (if (equal? (dict-ref params ':type) query) 'true 'false)]
      ['(orientation landscape)
       `(< ,(dict-ref params ':w) ,(dict-ref params ':h))]
      ['(orientation portrait)
       `(< ,(dict-ref params ':h) ,(dict-ref params ':w))]
      [`(max-width (px ,mw)) `(<= ,(dict-ref params ':w) ,mw)]
      [`(min-width (px ,mw)) `(>= ,(dict-ref params ':w) ,mw)]
      [`(min-height (px ,mh)) `(<= ,(dict-ref params ':h) ,mh)]
      [`(max-height (px ,mh)) `(>= ,(dict-ref params ':h) ,mh)])))
