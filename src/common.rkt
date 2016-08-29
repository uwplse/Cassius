#lang racket

(provide
 reap for/reap for*/reap
 sformat slower indent tree-size snoc dict-remove*
 flags all-flags supported-features
 xor ->number z3-path value=?
 attribute? attributes->dict dict->attributes
 split-symbol split-line-name
 assert)

(define flags (make-parameter '(z3o rules selectors)))
(define all-flags '(opt float z3o details rules selectors))

(define supported-features '(float % unknown-selector box-sizing min-width max-width position))

(define z3-path (find-executable-path "z3"))

(unless z3-path
  (error "Cannot find `z3` binary; please put a `z3` binary into your PATH."))

(define-syntax-rule (reap [sows ...] body ...)
  (let* ([sows (let ([store '()])
		 (λ (elt) (if elt
			      (begin (set! store (cons elt store))
				     elt)
			      store)))] ...)
    body ...
    (values (reverse (sows #f)) ...)))

(define-syntax-rule (for/reap [sows ...] (iters ...) body ...)
  (reap [sows ...] (for (iters ...) body ...)))

(define-syntax-rule (for*/reap [sows ...] (iters ...) body ...)
  (reap [sows ...] (for* (iters ...) body ...)))

(define (sformat templ . args)
  (string->symbol (apply format templ args)))

(define (slower sym)
  (string->symbol (string-foldcase (~a sym))))

(define (tree-size l)
  (if (list? l)
      (apply + (map tree-size l))
      1))

(define (xor a b) (not (equal? (not a) (not b))))

(define (->number n)
  (match n
    [(? number?) n]
    [`(/ ,a ,b) (/ a b)]))

(define (value=? prop a b)
  (or
   (equal? a b)
   (and (number? a) (number? b) (= a b))
   (match prop
     ['Border
      (define/match (lower val)
        [('border/thin) '(border/px 1.0)]
        [('border/medium) '(border/px 3.0)]
        [('border/thick) '(border/px 5.0)]
        [(_) val])
      (value=? #f (lower a) (lower b))]
     [_ #f])
   (equal?/recur a b (curry value=? prop))))

(define (attribute? s)
  (and (symbol? s) (string-prefix? (symbol->string s) ":")))

(define (attributes->dict attrs)
  (match attrs
    [(list (? attribute? k) (? (compose not attribute?) v) ... rest ...)
     (cons (cons k v) (attributes->dict rest))]
    [(list)
     (list)]))

(define (dict->attributes dict)
  (apply append (dict->list dict)))

(define (split-symbol s)
  (for/list ([part (string-split (~a s) "/")])
    (or (string->number part) (string->symbol part))))

(define (split-line-name var)
  (map split-symbol (string-split (~a var) "^")))

(define (assert x msg . args)
  (unless x
    (error (apply format msg args))))

(define (snoc lst x)
  (append lst (list x)))

(define (indent s [prefix "  "])
  (string-trim (string-replace (string-append prefix s) "\n" (string-append "\n" prefix)) prefix #:left? #f))

(define (dict-remove* dict keys)
  (for/fold ([dict dict]) ([key keys])
    (dict-remove dict key)))
