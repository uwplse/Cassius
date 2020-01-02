#lang racket

(require "../smt.rkt" "../common.rkt" "browser.rkt")
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

(define (media-type? p)
  (or/c 'screen 'print 'handheld 'projection 'tty 'tv))

(define/contract (media-matches? type query)
  (-> media-type? media-query? smt?)
  (define (mk-length l)
    (match l
      [`(px ,l) l]
      [`(em ,l) `(%of (* 100 ,l) (browser.fs.serif ,(the-browser)))]))

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
       (if (equal? type query) 'true 'false)]
      ['(orientation landscape)
       `(< (browser.w ,(the-browser)) (browser.h ,(the-browser)))]
      ['(orientation portrait)
       `(< (browser.h ,(the-browser)) (browser.w ,(the-browser)))]
      [`(-webkit-min-device-pixel-ratio ,_) 'true]
      [`(max-width  ,l) `(<= (browser.w ,(the-browser)) ,(mk-length l))]
      [`(min-width  ,l) `(>= (browser.w ,(the-browser)) ,(mk-length l))]
      [`(min-height ,l) `(<= (browser.h ,(the-browser)) ,(mk-length l))]
      [`(max-height ,l) `(>= (browser.h ,(the-browser)) ,(mk-length l))])))
