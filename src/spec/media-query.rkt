#lang racket

(require "../smt.rkt" "../common.rkt")
(provide media-query? media-matches?)

(define-by-match media-query?
  `(or ,(? media-query?) ...)
  `(and ,(? media-query?) ...)
  `(only ,(? media-query?))
  `(not ,(? media-query?))
  `(min-width  ,(? length?))
  `(max-width  ,(? length?))
  `(min-height ,(? length?))
  `(max-height ,(? length?))
  `(orientation landscape)
  `(orientation portrait)
  `(-webkit-min-device-pixel-ratio ,_)
  (or 'all 'screen 'print 'handheld 'projection 'tty 'tv))

(define-by-match length?
  `(px ,(? number?))
  `(em ,(? number?)))

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
  (define (mk-length l)
    (match l
      [`(px ,l) l]
      [`(em ,l) `(%of (* 100 ,l) ,(dict-ref params ':fs))]))

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
      [`(-webkit-min-device-pixel-ratio ,_) 'true]
      [`(max-width  ,l) `(<= ,(dict-ref params ':w) ,(mk-length l))]
      [`(min-width  ,l) `(>= ,(dict-ref params ':w) ,(mk-length l))]
      [`(min-height ,l) `(<= ,(dict-ref params ':h) ,(mk-length l))]
      [`(max-height ,l) `(>= ,(dict-ref params ':h) ,(mk-length l))])))
