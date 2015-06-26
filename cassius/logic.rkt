#lang racket

(require unstable/sequence)
(require "common.rkt")
(require "z3.rkt")

(provide Int Real Bool
         l/solve l/sub
         l/bool l/real l/struct l/var l/type l/label l/match
         l/and l/or l/=> l/not l/if
         l/- l/+ l/* l// l/= l/< l/> l/>= l/<= l/min l/max)

(define (same . exprs)
  (if (null? exprs)
      #t
      (andmap (curry equal? (car exprs)) (cdr exprs))))

; From Herbie, herbie/common.rkt
(define (assoc-merge . args)
  (remove-duplicates (apply append args)))

(define l/types '())
(define-syntax-rule (l/type name)
  (begin
    (define name 'name)
    (set! l/types (cons 'name l/types))))

(l/type Real)
(l/type Bool)
(l/type Int)

(struct formula (expr concrete? context t))

(define (l/bool bool)
  (formula (if bool 'true 'false) #t '() 'Bool))

(define (l/real rat)
  (formula
   (cond
    [(integer? rat) (exact->inexact rat)]
    [(rational? rat) (list '/ (exact->inexact (numerator rat)) (exact->inexact (denominator rat)))]
    [(real? rat) rat]
    [else (error "Not a real value" rat)])
   #t
   '()
   'Real))

(define (l/and . exprs)
  (when (not (andmap (compose (curry eq? 'Bool) formula-t) exprs))
    (error "Invalid types to AND" (map formula-t exprs) exprs))

  (let-values ([(concrete symbolic) (partition formula-concrete? exprs)])
    (cond
     [(and (andmap identity concrete) (not (null? symbolic)))
      (formula (cons 'and symbolic) #f (apply assoc-merge (map formula-context symbolic)) 'Bool)]
     [(and (andmap identity concrete) (null? symbolic))
      (l/bool #t)]
     [(not (andmap identity concrete))
      (l/bool #f)])))

(define (l/or . exprs)
  (when (not (andmap (compose (curry eq? 'Bool) formula-t) exprs))
    (error "Invalid types to OR" (map formula-t exprs) exprs))
  (let-values ([(concrete symbolic) (partition formula-concrete? exprs)])
    (cond
     [(and (not (ormap identity concrete)) (not (null? symbolic)))
      (formula (cons 'or symbolic) #f (apply assoc-merge (map formula-context symbolic)) 'Bool)]
     [(and (not (ormap identity concrete)) (null? symbolic))
      (l/bool #f)]
     [(ormap identity concrete)
      (l/bool #t)])))

(define (l/not expr)
  (when (not (eq? 'Bool (formula-t expr)))
    (error "Invalid type to not" (map formula-t expr) expr))
  (cond
   [(formula-concrete? expr)
    (formula (not (formula-get expr)) #t '() 'Bool)]
   [else
    (formula (list 'not expr) #f (formula-context expr) 'Bool)]))

(define (l/=> from to)
  (when (not (and (eq? 'Bool (formula-t from)) (eq? 'Bool (formula-t to))))
    (error "Invalid types to =>" (list (formula-t from) (formula-t to)) (list from to)))
  (cond
   [(and (formula-concrete? from) (formula-get from))
    to]
   [(and (formula-concrete? from) (not (formula-get from)))
    (l/bool #t)]
   [(and (formula-concrete? to) (formula-get to))
    (l/bool #t)]
   [(and (formula-concrete? to) (not (formula-get to)))
    (l/not from)]
   [else
    (formula (list '=> from to) #f (assoc-merge (formula-context from) (formula-context to)) 'Bool)]))

(define (l/if c x y)
  (when (not (eq? 'Bool (formula-t c)))
    (error "Invalid type to IF: condition is not boolean" c))
  (when (not (eq? (formula-t x) (formula-t y)))
    (error "Invalid type to IF: branches have different types" (list (formula-t x) (formula-t y)) (list x y)))
  (cond
   [(formula-concrete? c)
    (if (formula-get c) x y)]
   [(equal? (formula-get x) (formula-get y))
    x]
   [else
    (formula (list 'ite c x y) #f (assoc-merge (formula-context c) (formula-context x) (formula-context y)) (formula-t x))]))

(define (l/= . exprs)
  (when (not (same (map formula-t exprs)))
    (error "Invalid types to =" (map formula-t exprs) exprs))
  (let-values ([(concrete symbolic) (partition formula-concrete? exprs)])
    (cond
     [(not (apply same (map formula-get concrete)))
      (l/bool #f)]
     [(and (apply same (map formula-get concrete)) (null? symbolic))
      (l/bool #t)]
     [else
      (formula (cons '= exprs) #f (apply assoc-merge (map formula-context exprs)) 'Bool)])))

(define makef-table (make-hash))

(define (l/makef f name int outt)
  (define (l/f . args)
    (when (not (andmap (compose (curry eq? outt) formula-t) args))
      (error (format "Invalid input to ~a; should be ~a" name int) (map formula-t args) args))
    (if (andmap formula-concrete? args)
        (formula (apply f (map formula-get args)) #t '() outt)
        (formula (cons name args) #f (apply assoc-merge (map formula-context args)) outt)))
  (hash-set! makef-table name l/f)
  l/f)

(define (l/label f name)
  (formula `(! ,f :named ,name) (formula-concrete? f) (formula-context f) (formula-t f)))

(define l/+ (l/makef + '+ 'Real 'Real))
(define l/- (l/makef - '- 'Real 'Real))
(define l/* (l/makef * '* 'Real 'Real))
(define l// (l/makef / '/ 'Real 'Real))
(define l/< (l/makef < '< 'Real 'Bool))
(define l/> (l/makef > '> 'Real 'Bool))
(define l/>= (l/makef >= '>= 'Real 'Bool))
(define l/<= (l/makef <= '<= 'Real 'Bool))

(define (l/min a b)
  (l/if (l/< a b) a b))

(define (l/max a b)
  (l/if (l/< a b) a b))

(define variable-count 0)
(define (l/var type)
  (let ([new-var (string->symbol (format "var-~a" variable-count))])
    (set! variable-count (+ 1 variable-count))
    (match type
      [(? symbol?)
       (formula new-var #f (list (list new-var type)) type)]
      [(l/struct* name (list (list cname (list dnames dtypes) ...)))
       (cons cname
             (for/list ([dname dnames] [dtype dtypes])
               (cons dname (l/var dtype))))]
      [(l/struct* name (list cs ...))
       (cons
        (formula new-var #f (list (list new-var type)) type)
        (for*/list ([c cs] [(dname dtype) (in-pairs (cdr c))])
          (cons dname (l/var (car dtype)))))])))

(define-syntax-rule (l/match term [(head field ...) result] ...)
  (match (first term)
    ['head (apply (lambda (field ...) result) (map cdr (cdr term)))] ...
    [(formula var _ _ t)
     (l/and
      (l/=> (l/= (first term) (formula 'head #t '() t))
            (apply (lambda (field ...) result)
                   (map (lambda (fld) (cdr (assoc fld (cdr term))))
                        (map car (cdr (assoc 'head (l/struct*-variants t))))))) ...)]))

(struct l/struct* (name variants))
(define-syntax-rule (l/struct name (cname (dname dtype) ...) ...)
  (begin
    (define (cname dname ...)
      (list 'cname (cons 'dname dname) ...)) ...
    (define (dname f)
      (cdr (assoc 'dname (cdr f)))) ... ...
    (define name (l/struct* 'name (list `(cname (dname ,dtype) ...) ...)))))

(define (formula-get f)
  (cond
   [(and (list? (formula-expr f)) (eq? (car (formula-expr f)) '!))
    (formula-get (second (formula-expr f)))]
   [(and (formula-concrete? f) (eq? (formula-t f) 'Real)
         (list? (formula-expr f)) (eq? (car (formula-expr f)) '/))
    (/ (second (formula-expr f)) (second (formula-expr f)))]
   [(and (formula-concrete? f) (eq? (formula-t f) 'Bool))
    (eq? (formula-expr f) 'true)]
   [else (formula-expr f)]))

(define (l->smt2 formula)
  (when (not (eq? (formula-t formula) 'Bool))
    (error "Cannot convert non-boolean formulas to SMT2"))
  (reap [sow]
        ; Create enumerations for every variant type
        (for ([type (remove-duplicates (map second (formula-context formula)))])
          (match type
            [(l/struct* name (list (list cnames _ ...) ...))
             (sow `(declare-datatypes () ((,name ,@cnames))))]
            [_ (void)]))
        ; Declare every constant
        (for ([var (formula-context formula)])
           (match (second var)
             [(? symbol?)
              (sow `(declare-const ,(car var) ,(second var)))]
             [(l/struct* name _)
              (sow `(declare-const ,(car var) ,name))]))
        ; Output every term
        (let recurse ([f formula])
          (match (formula-expr f)
            [(list 'and terms ...)
             (for-each recurse terms)]
            [else
             (sow (list 'assert
                        (let clean ([term f])
                          (cond
                            [(formula? term)
                             (clean (formula-expr term))]
                            [(list? term)
                             (map clean term)]
                            [else
                             term]))))]))))

(define (l/sub f ctx)
  (let recurse ([expr f])
    (match (formula-expr expr)
      [(? real?) expr]
      [(? symbol? v)
       (if (hash-has-key? ctx v)
           (formula (hash-ref ctx v) #t '() (formula-t expr))
           expr)]
      [(list 'and fs ...)
       (apply l/and (map recurse fs))]
      [(list 'or fs ...)
       (apply l/and (map recurse fs))]
      [(list '=> a b)
       (l/=> (recurse a) (recurse b))]
      [(list 'not f)
       (l/not (recurse f))]
      [(list 'if a b c)
       (l/if (recurse a) (recurse b) (recurse c))]
      [(list f args ...)
       (apply (hash-ref makef-table f) (map recurse args))]
      [(list '! a ':named n)
       (l/label (recurse a) n)])))

(define (l/solve formula #:debug [debug? #f])
  (solve (append (l->smt2 formula) '((check-sat) (get-model))) #:debug debug?))
