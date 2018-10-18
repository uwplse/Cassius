#lang racket

(require "common.rkt")
(provide define-constraints smt? smt-cond smt-let smt-let* smt-not smt-and smt-or smt-replace smt-replace-terms
         and-assertions disassemble-forall)

(define smt? any/c)

(define-syntax smt-cond
  (syntax-rules (else)
    [(smt-cond [else body])
     `body]
    [(smt-cond [else body ...])
     `(and body ...)]
    [(smt-cond [test body] rest ...)
     `(ite test body ,(smt-cond rest ...))]
    [(smt-cond [test body ...] rest ...)
     `(ite test (and body ...) ,(smt-cond rest ...))]))

(define-syntax-rule (define-constraints name body ...)
  (define name `(body ...)))

(define-syntax-rule (smt-let bindings constraints ...)
  `(let bindings (and constraints ...)))

(define-syntax smt-let*
  (syntax-rules ()
    [(smt-let* () constraints ...)
     '(and constraints ...)]
    [(smt-let* ([a b] rest ...) constraints ...)
     `(let ([a b]) ,(smt-let* (rest ...) constraints ...))]))

(define (smt-not x)
  (match x
    ['true 'false]
    ['false 'true]
    [_ (list 'not x)]))

(define (smt-and . pieces)
  (define pieces* (filter (λ (x) (not (equal? x 'true))) pieces))
  (if (ormap (curry equal? 'false) pieces*)
      'false
      (match pieces*
        ['() 'true]
        [(list x) x]
        [xs (cons 'and xs)])))

(define (smt-or . pieces)
  (define pieces* (filter (λ (x) (not (equal? x 'false))) pieces))
  (if (ormap (curry equal? 'true) pieces*)
      'true
      (match pieces*
        ['() 'false]
        [(list x) x]
        [xs (cons 'or xs)])))

(define (smt-replace-terms expr bindings)
  (match expr
    [(? (curry dict-has-key? bindings)) (dict-ref bindings expr)]
    [`(let ((,vars ,vals) ...) ,body)
     `(let (,@(map list vars (map (curryr smt-replace-terms bindings) vals)))
        ,(smt-replace-terms body (dict-remove* bindings vars)))]
    [(? list?) (map (curryr smt-replace-terms bindings) expr)]
    [_ expr]))

(define-syntax-rule (smt-replace expr [pattern body ...] ...)
  (let loop ([e expr])
    (match e
      [(list 'let bindings body2)
       (define bindings* (for/list ([b bindings]) (list (car b) (loop (cadr b)))))
       (list 'let bindings* (loop body2))]
      [pattern body ...] ...
      [x
       (if (list? x)
           (cons (car x) (map loop (cdr x)))
           x)])))

(define/match (disassemble-forall a)
  [(`(forall (,vars ...) ,body))
   (values vars body)]
  [(body)
   (values '() body)])

(define (and-assertions . as)
  (define-values (vars body)
    (let loop ([as as])
      (match as
        ['() (values '() 'true)]
        [(cons a as)
         (define-values (avars abody) (disassemble-forall a))
         (define-values (bvars bbody) (loop as))
         (values (set-union avars bvars) (smt-and abody bbody))])))
  `(forall ,vars ,body))
