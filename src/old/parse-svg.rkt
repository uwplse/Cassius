#lang racket

(require xml)
(require "common.rkt")

(define (get-rects save elt #:x-offset [xo 0] #:y-offset [yo 0])
  (match elt
    [(? string?) (void)]
    [(list 'rect attrs)
     (define (attr name) (string->number (car (dict-ref attrs name))))
      (save (box 'rect (round (+ (attr 'x) xo)) (round (+ (attr 'y) yo)) (attr 'width) (attr 'height) '()))]
    [(list 'g attrs children ...)
     (define transform (car (dict-ref attrs 'transform '(#f))))
     (define translate-rx #rx"^translate\\(([-+0-9\\.]+),([-+0-9\\.]+)\\)$")
     (define-values (xo* yo*)
       (match (and transform (regexp-match translate-rx transform))
         [(list _ (app string->number xo*) (app string->number yo*))
          (values (+ xo xo*) (+ yo yo*))]
         [#f (values xo yo)]))
     (define out
       (reap [save*]
         (for-each (λ (e) (get-rects save* e #:x-offset xo* #:y-offset yo*)) children)))

     (if (and (= (length out) 2) (equal? (box-tag (first out)) 'rect)
              (box-contains (first out) (second out)))
         (let ([b (first out)])
           (save (box (box-tag b) (box-x b) (box-y b) (box-w b) (box-h b) (list (second out)))))
         (let* ([out-x (apply min (map box-x out))]
                [out-y (apply min (map box-y out))]
                [out-w (- (apply max (map box-right out)) out-x)]
                [out-h (- (apply max (map box-bottom out)) out-y)])
           (save (box 'g out-x out-y out-w out-h out))))]
     [(list _ _ children ...)
      (for-each (λ (e) (get-rects save e #:x-offset xo #:y-offset yo)) children)]))

(struct box (tag x y w h children))
(define (box-right box) (+ (box-x box) (box-w box)))
(define (box-bottom box) (+ (box-y box) (box-h box)))

(define (box-contains p b)
  (and (<= (box-x p) (box-x b))
       (<= (box-y p) (box-y b))
       (>= (box-right p) (box-right b))
       (>= (box-bottom p) (box-bottom b))))

(define (dump-box box)
  `([BLOCK :tag ,(box-tag box) :w ,(box-w box) :h ,(box-h box) :x ,(box-x box) :y ,(box-y box)]
    ,@(map dump-box (box-children box))))

(define (read-svg in)
  (define doc (read-xml/document in))
  (define xexpr (xml->xexpr (document-element doc)))
  (match-define `(svg ,attrs ,children ...) xexpr)
  (define width (string->number (car (dict-ref attrs 'width))))
  (define rects (reap [save] (for-each (curry get-rects save) children)))
  `([VIEW :w ,width]
    ,@(map dump-box rects)))
