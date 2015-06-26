#lang racket

(provide reap symbol-append)

(define-syntax-rule (reap [sows ...] body ...)
  (let* ([sows (let ([store '()])
		 (λ (elt) (if elt
			      (begin (set! store (cons elt store))
				     elt)
			      store)))] ...)
    body ...
    (values (reverse (sows #f)) ...)))

(define (symbol-append var end #:join [join "-"])
  (string->symbol (format "~a~a~a" var join end)))
