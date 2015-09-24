#lang racket

(provide
 reap for/reap for*/reap
 sformat slower
 flags all-flags
 tree-size sdiff)

(define flags (make-parameter '(z3o)))
(define all-flags '(opt float z3o details))

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
  (string->symbol (string-foldcase (symbol->string sym))))

(define (tree-size l)
  (if (list? l)
      (apply + (map tree-size l))
      1))

(define (sdiff a b sow)
  (cond
   [(and (not (list? a)) (not (list? b)))
    (when (not (equal? a b)) (sow a b))]
   [(and (list? a) (list? b))
    (if (not (equal? (car a) (car b)))
        (sow a b)
        (map (curryr sdiff sow) a b))]
   [else
    (sow a b)]))
