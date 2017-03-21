#lang racket
(require (for-syntax syntax/parse))

(provide
 reap for/reap for*/reap for/append
 sformat slower indent tree-size snoc dict-remove*
 flags all-flags supported-features
 xor ->number z3-path value=?
 attribute? attributes->dict dict->attributes
 split-symbol split-line-name
 assert make-log
 boolean<? lex<? output<?
 define-by-match
 list-intersect multi-command-line)

(define flags (make-parameter '(z3o rules selectors)))
(define all-flags '(opt float z3o details rules selectors))

(define supported-features
  '(css:float css:box-sizing
    css:min-width css:max-width css:max-height css:min-height
    css:position css:font-size css:overflow-x css:overflow-y 
    css:text-indent
    unit:% unit:em
    unknown-selector tag:img tag:input))

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

(define-syntax-rule (for/append (iters ...) body ...)
  (apply append (for/list (iters ...) body ...)))

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

(define (make-log)
  (define time-start (current-inexact-milliseconds))
  (lambda (fmt . args)
    (let* ([now (current-inexact-milliseconds)]
           [delta (- now time-start)])
      (set! time-start now)
      (apply eprintf (string-append "[~as] " fmt "\n")
             (~r #:precision '(= 3) #:min-width 8 (/ delta 1000))
             args))))

(define (boolean<? b1 b2)
  (and (not b1) b2))

(define ((lex<? . <s) l1 l2)
  (when (not (= (length <s) (length l1) (length l2)))
    (raise
     (make-exn:fail:contract
      (format "(lex<? ~a): arguments must have length ~a; arguments were: ~a ~a"
              (~v <s) (length <s) (~v l1) (~v l2))
      (current-continuation-marks))))

  (let loop ([<s <s] [l1 l1] [l2 l2])
    (cond
     [(and (null? <s) (null? l1) (null? l2)) false] ; equal
     [((car <s) (car l1) (car l2)) true]
     [((car <s) (car l2) (car l1)) false]
     [else (loop (cdr <s) (cdr l1) (cdr l2))])))

(define ((output<? f <?) a b)
  (<? (f a) (f b)))

(define-syntax-rule (define-by-match name patterns ...)
  (define name
    (flat-named-contract
     'name
     (λ (var)
       (let name ([var var])
         (match var
           [patterns true] ...
           [_ false]))))))

(define/contract (list-intersect l1 l2)
  (-> (list/c any/c) (list/c any/c) (list/c any/c))
  "Intersect two lists, maintaining the order of the first list."
  (filter (curry set-member? (apply set l1)) l2))

(define-syntax (multi-command-line stx)
  (syntax-parse stx
   [(_ #:program big-name args ... #:subcommands [name:str subargs ...] ...)
    #'(let ([true-name big-name])
        (command-line
         #:program true-name
         args ...
         #:args (type . rest)
         (match type
           [name
            (multi-command-line
             #:program (format "~a ~a" true-name name)
             #:argv rest
             args ...
             subargs ...)] ...)))]
   [(_ args ... #:subcommands [name:str subargs ...] ...)
    #'(command-line
       args ...
       #:args (type . rest)
       (match type
         [name
          (multi-command-line
           #:argv rest
           args ...
           subargs ...)] ...))]
   [(_ args ...)
    #'(command-line args ...)]))
