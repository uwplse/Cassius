#lang racket
(require srfi/13)
(require racket/set)
(require "common.rkt")
(require "ffi.rkt")
(require "../coq/z3o.rkt")
(provide z3-dco z3-unlet z3-expand z3-assert-and z3-lift-arguments z3-resolve-fns z3-sink-fields-and
         z3-if-and z3-simplif z3-check-trivial-calls z3-check-datatypes z3-check-functions
         z3-check-let z3-check-fields z3-print-all z3-ground-quantifiers
         z3-clean-no-opt)

(define (z3-dco cmds)
  (let ([store (make-hash)])
    (define (find-used expr)
      (match expr
        [`(let ((,_ ,vals) ...) ,body)
         (for-each find-used vals)
         (find-used body)]
        [(list f args ...)
         (for-each find-used expr)]
        [(? symbol? f)
         (when (hash-has-key? store f)
           (hash-set! store f #t))]
        [else 'ok]))

    (for ([cmd cmds])
      (match cmd
        [(list (or 'declare-fun 'declare-const 'define-fun 'define-const) name type ...)
         (hash-set! store name #f)]
        [_ 'ok]))

    (for ([cmd cmds])
      (match cmd
        [`(assert ,expr)
         (find-used expr)]
        [(list 'define-fun name (list types ...) rtype body)
         (list 'define-fun name types rtype (find-used body))]
        [(list 'define-const name rtype body)
         (list 'define-const name rtype (find-used body))]
        [_ 'ok]))

    (apply append
           (for/list ([cmd cmds])
             (match cmd
               [(list (or 'declare-fun 'declare-const 'define-fun 'define-const) name type ...)
                (if (hash-ref store name #t)
                    (list cmd)
                    empty)]
               [_ (list cmd)])))))

(define ((z3-resolve-fns . fns) cmds)
  (define resolutions (make-hash))
  (define finite-types (make-hash))
  
  (define finite-type? (curry hash-has-key? finite-types))
  (define ((constructor-tester? type) tester)
    (let ([name (constructor-tester-name tester)])
      (and name (member name (hash-ref finite-types type)))))

  (define (save input output)
    (when (and (hash-has-key? resolutions input) (not (equal? output (hash-ref resolutions input))))
      (eprintf "Z3: Double definitions of ~a\n  def: ~a\n  def: ~a\n"
               input (hash-ref resolutions input) output))
    (hash-set! resolutions input output))

  (define (resolve expr)
    (match expr
      [`(,f ,args ...)
       (define args* (map resolve args))
       (define expr* (cons f args*))
       (if (hash-has-key? resolutions expr*)
         (resolve (hash-ref resolutions expr*))
         expr*)]
      [_ expr]))

  (for/list ([cmd cmds] [i (in-naturals)])
    (match cmd
      [`(declare-datatypes () (,decls ...))
       (for ([decl decls])
         (match decl
           [`(,name ,(? symbol? constructors) ...)
            (hash-set! finite-types name constructors)]
           [_ (void)]))
       cmd]
      [`(define-fun ,name ((,var ,(? finite-type? type))) ,rtype ,body)
       (let loop ([body body] [values-set '()])
         (match body
           [`(ite (,(? (constructor-tester? type) tester) ,(== var)) ,value ,body*)
            (hash-set! resolutions `(,name ,(constructor-tester-name tester)) value)
            (loop body* (cons (constructor-tester-name tester) values-set))]
           [_
            (match (set-subtract (hash-ref finite-types type) values-set)
              [(list default-name)
               (hash-set! resolutions `(,name ,default-name) body)]
              [_ (void)])]))
       cmd]
      [`(assert (= (,(? (curryr member fns) fn) ,args ...) ,value))
       (define input (cons fn (map resolve args)))
       (define output (resolve value))
       (save input output)
       `(assert (= ,input ,output))]
      [`(assert (! (= (,(? (curryr member fns) fn) ,args ...) ,value) :named ,name))
       (define input (cons fn (map resolve args)))
       (define output (resolve value))
       (save input output)
       `(assert (= ,input ,output))]
      [`(assert ,expr)
       `(assert ,(resolve expr))]
      [_ cmd])))

(define (z3-check-functions cmds)
  "Check that we have no uninterpreted functions"
  (for ([cmd cmds] [i (in-naturals)])
    (match cmd
      [`(declare-fun ,name (,itypes ...) ,otype)
       (eprintf "Z3: Uninterpreted function ~a on line ~a\n  line: ~a\n" name i cmd)]
      [_ (void)]))
  cmds)

(define (z3-check-datatypes cmds)
  "Check that no two records have identically-named fields or variants."
  (define all-names (make-hash))
  (for ([cmd cmds] [i (in-naturals 1)])
    (match cmd
      [`(declare-datatypes (,params ...) ((,names ,varss ...) ...))
       (when (not (null? params))
         (eprintf "Z3: Parameters on types ~a on line ~a\n  line: ~a\n" names i cmd))
       (for ([name names] [vars varss])
         (when (hash-has-key? all-names name)
           (eprintf "Z3: Reused name ~a on line ~a\n  line: ~a\n" name i cmd))
         (hash-set! all-names name #t)
         (for ([var vars])
           (define var-names
             (match var
               [(? symbol?) (list var)]
               [(list var (list fields types) ...) (cons var fields)]))
           (for ([name var-names])
             (when (hash-has-key? all-names name)
               (eprintf "Z3: Reused name ~a on line ~a\n  line: ~a\n" name i cmd))
             (hash-set! all-names name #t))))]
      [_ (void)]))
  cmds)

(define-syntax-rule (reap-problems [problem name] body ...)
  (let ((problems (make-hash)))
    (define (problem i expr line)
      (hash-set! problems expr (cons (cons i line) (hash-ref problems expr '()))))
    body ...
    (for ([(key vals) (in-hash problems)])
      (eprintf "Z3: ~a in ~a on ~a lines\n" name key (length vals))
      (when (memq 'details (flags))
        (eprintf "  line ~a: ~a\n" (caar vals) (cdar vals))))))

(define (z3-check-fields cmds)
  "Check that no fields of a function output are taken (fields of fields allowed)."
  (define all-names (make-hash))
  (for ([cmd cmds])
    (match cmd
      [`(declare-datatypes (,params ...) ((,names ,varss ...) ...))
       (for ([name names] [vars varss] #:when #t [var vars])
         (match var
           [(? symbol?) (void)]
           [(list name (list fields types) ...)
            (for ([field fields]) (hash-set! all-names field #t))]))]
      [else (void)]))
  (define (only-fields? expr fail)
    (match expr
      [(? symbol?) #t]
      [(list f arg)
       (if (hash-has-key? all-names f)
           (only-fields? arg fail)
           (fail expr))]
      [_ #f]))
  (define (valid-expr? expr fail)
    (match expr
      [(list f arg) (if (hash-has-key? all-names f) (only-fields? arg fail) (valid-expr? arg fail))]
      [(list f args ...)
       (and (not (hash-has-key? all-names f)) (andmap (curryr valid-expr? fail) args))]
      [_ #t]))
  (reap-problems [problem "Improperly guarded field reference"]
    (for ([cmd cmds] [i (in-naturals 1)])
      (match cmd
        [(list 'assert expr)
         (valid-expr? expr (lambda (expr) (problem i expr cmd)))]
        [_ (void)])))
  cmds)

(define ((z3-sink-functions . fns) cmds)
  "Turn (fn (ite c x y)) into (ite c (fn x) (fn y))."
  (define (field? x) (member x fns))
  (define (sink-field expr)
    (match expr
      [`(,(? field? fld) (ite ,c ,x ,y))
       `(ite ,(sink-field c) ,(sink-field (list fld x)) ,(sink-field (list fld y)))]
      [`(,(? field? fld) ,arg)
       (define arg* (sink-field arg))
       (match arg*
         [`(ite ,c ,x ,y) (sink-field `(,fld ,arg*))]
         [_ (list fld arg*)])]
      [(? list?) (cons (car expr) (map sink-field (cdr expr)))]
      [_ expr]))
  (for/list ([cmd cmds] [i (in-naturals 1)])
    (match cmd
      [`(assert ,expr) `(assert ,(sink-field expr))]
      [_ cmd])))

(define ((z3-sink-fields-and . fns) cmds)
  "Turn (fld (ite c x y)) into (ite c (fld x) (fld y))."
  (define all-names (make-hash))
  (for ([cmd cmds])
    (match cmd
      [`(declare-datatypes (,params ...) ((,names ,varss ...) ...))
       (for ([name names] [vars varss] #:when #t [var vars])
         (match var
           [(? symbol?) (void)]
           [(list _ (list fields _) ...)
            (for ([field fields]) (hash-set! all-names field #t))]))]
      [_ (void)]))
  ((apply z3-sink-functions (append fns (hash-keys all-names))) cmds))

(define (z3-movedefs cmds)
  "Move each definition to be right before first use."
  (define (contains-var expr var)
    (match expr
      [(? number?) #f]
      [(? symbol?) (eq? expr var)]
      [(? list?) (ormap (curryr contains-var var) expr)]))
  (define (def? cmd)
    (match cmd
      [`(declare-const ,var ,type) #t]
      [_ #f]))
  (define (split-first-use var cmds)
    (splitf-at cmds (λ (cmd) (cond [(eq? (car cmd) 'assert) (not (contains-var (cadr cmd) var))] [else #t]))))
  (define-values (defs not-defs) (partition def? cmds))
  (for/fold ([not-defs not-defs]) ([def defs])
    (let-values ([(head tail) (split-first-use (second def) not-defs)])
      (append head (cons def tail)))))

(define ctr 1)
(define (gensym name)
  (begin0 (sformat "~a$~a" name ctr)
    (set! ctr (+ ctr 1))))

(define (capture-avoiding-substitute body bindings)
  (match body
    [(? symbol?) (cdr (or (assoc body bindings) (cons body body)))]
    [`(! ,expr :named ,name)
     (define (rename head)
       (match bindings
         [`((,names . ,(? symbol? vals)) ...) (sformat "~a/~a" head (string-join (map ~a vals) "/"))]
         [_ head]))
     `(! ,(capture-avoiding-substitute expr bindings) :named ,(rename name))]
    [`(let ((,names ,vals) ...) ,body)
     (define body*
       (capture-avoiding-substitute body (filter (lambda (v) (not (member (car v) names))) bindings)))
     `(let (,@(for/list ([name names] [val vals])
                `(,name ,(capture-avoiding-substitute val bindings)))) ,body*)]
    [(? list?)
     (map (curryr capture-avoiding-substitute bindings) body)]
    [_ body]))

(define ((z3-expand . fn-names) cmds)
  (define fns (make-hash))

  (define (expand-term expr)
    (match expr
      [`(let ((,vars ,vals) ...) ,body)
       `(let (,@(for/list ([var vars] [val vals]) `(,var ,(expand-term val)))) ,(expand-term body))]
      [(list (? (curry hash-has-key? fns) name) args ...)
       (match-define (list names body) (hash-ref fns name))
       (expand-term (capture-avoiding-substitute body (map cons names args)))]
      [(? list?)
       (map expand-term expr)]
      [_ expr]))

  (for/list ([cmd cmds])
    (match cmd
      [`(define-fun ,(? (curryr memq fn-names) name) ((,names ,types) ...) ,rtype ,body)
       (hash-set! fns name (list names (expand-term body)))
       `(define-fun ,name (,@(map list names types)) ,rtype ,(expand-term body))]
      [`(define-fun ,name ((,names ,types) ...) ,rtype ,body)
       `(define-fun ,name (,@(map list names types)) ,rtype ,(expand-term body))]
      [(list 'assert expr)
       (list 'assert (expand-term expr))]
      [_ cmd])))

(define (z3-unlet cmds)
  (define (de-let expr)
    (match expr
      [`(let ([,vars ,vals] ...) ,body)
       (de-let (capture-avoiding-substitute body (map cons vars vals)))]
      [(? list?) (cons (car expr) (map de-let (cdr expr)))]
      [_ expr]))

  (for/list ([cmd cmds] [i (in-naturals)])
    (match cmd
      [`(define-fun ,name (,signature) ,rtype ,body)
       `(define-fun ,name (,signature) ,rtype ,(de-let body))]
      [(list 'assert expr)
       (list 'assert (de-let expr))]
      [_ cmd])))

(define (z3-check-let cmds)
  (for ([cmd cmds] [i (in-naturals)])
    (match cmd
      [(list 'assert expr)
       (let loop ([expr expr])
         (match expr
           [`(let ,_ ,_) (eprintf "Z3: Let found\n  line ~a: ~a\n" i cmd)]
           [`(f ,args ...) (for-each loop args)]
           [_ (void)]))]
      [_ (void)]))
  cmds)

(define (z3-assert-and cmds)
  (define (sow-rename sow head)
    (define ctr 0)
    (λ (expr)
      (set! ctr (+ ctr 1))
      (match expr
        [`(! ,expr :named ,name)
         (sow `(! ,expr :named ,(sformat "~a^~a" head name)))]
        [`(=> ,c (! ,expr :named ,name))
         (sow `(! (=> ,c ,expr) :named ,(sformat "~a^~a" head name)))]
        [_
         (sow `(! ,expr :named ,(sformat "~a^~a" head ctr)))])))
  
  (define (gather-ands expr)
    (match expr
      [`(! ,expr :named ,name)
       (reap [sow] (for-each (sow-rename sow name) (gather-ands expr)))]
      [`(and ,exprs ...)
       (append-map gather-ands exprs)]
      [`(ite (! ,c :named ,testname) ,ift ,iff)
       (define exprs1 (gather-ands ift))
       (define exprs2 (gather-ands iff))
       (define both (set-intersect exprs1 exprs2))
       (define left (set-subtract exprs1 both))
       (define right (set-subtract exprs2 both))
       (reap [sow]
             (for-each sow both)
             (for-each (sow-rename sow (sformat "because/~a" testname))
                       (map (λ (x) `(=> ,c ,x)) left))
             (for-each (sow-rename sow (sformat "because/!~a" testname))
                       (map (λ (x) `(=> (not ,c) ,x)) right)))]
      [`(ite ,c ,ift ,iff)
       (define exprs1 (gather-ands ift))
       (define exprs2 (gather-ands iff))
       (define both (set-intersect exprs1 exprs2))
       (define left (set-subtract exprs1 both))
       (define right (set-subtract exprs2 both))
       (reap [sow]
             (for ([expr both]) (sow expr))
             (for ([expr left]) (sow `(=> ,c ,expr)))
             (for ([expr right]) (sow `(=> (not ,c) ,expr))))]
      [_ (list expr)]))

  (for/reap (sow) ([cmd cmds] [i (in-naturals)])
    (match cmd
      [`(assert ,expr)
       (for ([expr* (gather-ands expr)])
         (sow `(assert ,expr*)))]
      [_ (sow cmd)])))

(define ((z3-lift-arguments . fn-names) cmds)
  (define lifted (make-hash))
  (define fns (make-hash))

  (define (fn? x) (memq x fn-names))

  (define (find-funs expr sow)
    (match expr
      [`(let ((,vars ,vals) ...) ,body)
       (for-each (curryr find-funs sow) vals)
       (find-funs body sow)]
      [`(,(? fn? f) ,args ...)
       (sow expr)]
      [(? list?) (for-each (curryr find-funs sow) (cdr expr))]
      [_ (void)]))

  (define (replace-terms expr bindings)
    (match expr
      [(? (curryr assoc bindings))
       (cdr (assoc expr bindings))]
      [`(let ((,vars ,vals) ...) ,body)
       `(let (,@(map list vars (map (curryr replace-terms bindings) vals)))
          ,(replace-terms body bindings))]
      [(? list?) (map (curryr replace-terms bindings) expr)]
      [_ expr]))

  (define (expand-calls expr)
    (match expr
      [`(,(? (curry hash-has-key? lifted) f) ,args ...)
       `(,f ,@args ,@(apply (hash-ref lifted f) args))]
      [(? list?) (map expand-calls expr)]
      [_ expr]))

  (for/list([cmd cmds] [i (in-naturals)])
    (match cmd
      [`(declare-datatypes (,params ...) ((,names ,varss ...) ...))
       (for ([name names] [vars varss] #:when #t [var vars])
         (match var
           [(? symbol?) (void)]
           [(list _ (list fields types) ...)
            (for ([field fields] [type types])
              (hash-set! fns field type))]))
       cmd]
      [`(define-fun ,(? fn? name) ((,args ,types) ...) ,rtype ,body)
       (hash-set! fns name rtype)
       cmd]
      [`(define-fun ,name ((,args ,types) ...) ,rtype ,body)
       ; TODO: Doesn't do capture avoidance
       (define insts (remove-duplicates (reap [sow] (find-funs body sow))))
       (define-values (eargs etypes)
         (for/lists (args types) ([inst insts])
           (define fn (car inst))
           (values (gensym fn) (hash-ref fns fn))))
       (hash-set! lifted name
                  (lambda oargs
                    (for/list ([inst insts])
                      (replace-terms inst (map cons args oargs)))))
       `(define-fun ,name (,@(map list args types) ,@(map list eargs etypes)) ,rtype
          ,(replace-terms (expand-calls body) (map cons insts eargs)))]
      [`(assert ,expr)
       `(assert ,(expand-calls expr))]
      [_ cmd])))

(define ((z3-check-trivial-calls . fns) cmds)
  (define (check-no-calls expr sow)
    (cond
     [(and (list? expr) (member (car expr) fns)) (sow expr)]
     [(list? expr) (for-each (curryr check-no-calls sow) expr)]
     [else #f]))

  (define (check-trivial-calls expr sow)
    (cond
     [(and (list? expr) (member (car expr) fns) (not (andmap symbol? (cdr expr)))) (sow expr)]
     [(list? expr) (for-each (curryr check-trivial-calls sow) expr)]
     [else #f]))

  (reap-problems [problem "Nontrivial forbidden call"]
    (for/list([cmd cmds] [i (in-naturals)])
      (match cmd
        [`(define-fun ,name ((,args ,types) ...) ,rtype ,body)
         (check-no-calls body (lambda (expr) (problem i expr cmd)))]
        [`(assert ,expr)
         (check-trivial-calls expr (lambda (expr) (problem i expr cmd)))]
        [_ (void)])))
  cmds)

(define (z3-print-all cmds)
  (for ([cmd cmds] [i (in-naturals)])
    (eprintf "  ~a: ~a\n" i cmd))
  cmds)

(define ((z3-print-line text n) cmds)
  (eprintf "~a: ~a\n" text (list-ref cmds n))
  cmds)

(define (constructor-tester-name name)
  (define parts (string-split (~a name) "-"))
  (and (not (null? parts))
       (string=? (first parts) "is")
       (string->symbol (string-join (rest parts) "-"))))

(define (z3-simplif cmds)
  (define constructors (make-hash '((Bool true false))))
  (define types (make-hash '((true . Bool) (false . Bool))))
  (define known-constructors (make-hash))

  (define (constructor? name)
    (hash-has-key? types name))
  
  (define (constructor-tester? name)
    (let ([constructor (constructor-tester-name name)])
      (and constructor (constructor? constructor))))

  (define (simpl expr)
    (match expr
      [(? list?) (simpl1 (map simpl expr))]
      [_ expr]))

  (define (simpl1 expr)
    (match expr
      [`(,(? constructor-tester? tester)
         ,(or (list (? constructor? constructor) _ ...) (? constructor? constructor)))
       (define test-variant (string->symbol (string-join (rest (string-split (~a tester) "-")) "-")))
       (unless (member test-variant (hash-ref constructors (hash-ref types constructor)))
         (error "Invalid tester/constructor combination" tester constructor))
       (if (equal? test-variant constructor) 'true 'false)]
      [`(,(? constructor-tester? tester) ,(? (curry hash-has-key? known-constructors) var))
       (if (equal? tester (hash-ref known-constructors var)) 'true 'false)]
      [(? (curry hash-has-key? known-constructors) var)
       (match (hash-ref known-constructors var)
         ['is-true 'true]
         ['is-false 'false]
         [_ var])]
      [`(ite false ,a ,b) b]
      [`(ite true ,a ,b) a]
      [`(ite ,c ,a ,a) a]
      [`(ite ,c false true) `(not ,c)]
      [`(ite ,c true false) c]
      [`(=> false ,a) 'true]
      [`(=> true ,a) a]
      [`(=> ,a true) 'true]
      [`(=> (not ,a) false) a]
      [`(=> ,a false) `(not ,a)]
      [`(not (not ,a)) a]
      [`(not false) 'true]
      [`(not true) 'false]
      [`(and) `true]
      [(list 'and rest ...)
       (if (member 'false rest)
           'false
           (let ([rest* (filter (lambda (x) (not (equal? x 'true))) rest)])
             (match rest* [`() 'true] [`(,x) x] [`(,x ...) `(and ,@x)])))]
      [(list 'or rest ...)
       (if (member 'true rest)
           'true
           (let ([rest* (filter (lambda (x) (not (equal? x 'false))) rest)])
             (match rest* [`() 'false] [`(,x) x] [`(,x ...) `(or ,@x)])))]
      [`(or) `false]
      [(list '= a a) 'true]
      [_ expr]))

  (for/reap [sow] ([i (in-naturals)] [cmd cmds])
    (match cmd
      [`(declare-datatypes (,params ...) ((,names ,varss ...) ...))
       (for ([name names] [vars varss])
         (hash-set! constructors name
                    (for/list ([var vars])
                      (define constructor (match var [(? symbol?) var] [(list name _ ...) name]))
                      (hash-set! types constructor name)
                      constructor)))
       (sow cmd)]
      [`(define-fun ,names ((,args ,atypes)) ,rtype ,body)
       (sow `(define-fun ,names ((,args ,atypes)) ,rtype ,(simpl body)))]
      [(or
        `(assert (! (,(? constructor-tester? tester) ,tested) :named ,_))
        `(assert (,(? constructor-tester? tester) ,tested)))
       (define s (simpl tested))
       (hash-set! known-constructors (simpl tested) tester)
       (sow cmd)]
      [(or
        `(assert (= ,(or (? constructor? name) (list (? constructor? name) _ ...)) ,tested))
        `(assert (! (= ,(or (? constructor? name) (list (? constructor? name) _ ...)) ,tested) :named ,_))
        `(assert (= ,tested ,(or (? constructor? name) (list (? constructor? name) _ ...))))
        `(assert (! (= ,tested ,(or (? constructor? name) (list (? constructor? name) _ ...))) :named ,_)))
       (hash-set! known-constructors (simpl tested) (sformat "is-~a" name))
       (sow cmd)]
      [`(assert ,expr)
       (define s (simpl expr))
       (unless (or (equal? s 'true) (and (list? s) (equal? (car s) '!) (equal? (cadr s) 'true)))
         (sow `(assert ,s)))]
      [_ (sow cmd)])))

(define (z3-if-and cmds)
  (define (if-and-old expr)
    (match expr
      [`(and (ite ,c ,a1 ,b1) (ite ,c ,a2, b2))
       `(ite ,c ,(if-and `(and ,a1 ,a2)) ,(if-and `(and ,b1 ,b2)))]
      [(? list?)
       (map if-and expr)]
      [_ expr]))
  (define (if-and expr) (coq->sexpr (ifAnd (sexpr->coq expr))))
  (for/list ([i (in-naturals)] [cmd cmds])
    (match cmd
      [`(assert ,expr)
       `(assert ,(if-and expr))]
      [_ cmd])))

(define (z3-ground-quantifiers cmds)
  (define finite-types (make-hash))
  
  (define finite-type? (curry hash-has-key? finite-types))
  (define ((constructor-tester? type) tester)
    (let ([name (constructor-tester-name tester)])
      (and name (member name (hash-ref finite-types type)))))

  (define (ground expr)
    (match expr
      [`(forall ((,vars ,(? finite-type? types)) ...) ,body)
       (cons 'and
             (for/list ([vals (cartesian-product (map (curry hash-ref finite-types) types))])
               (capture-avoiding-substitute body (map cons vars vals))))]
      [(? list?)
       (map ground expr)]
      [_ expr]))

  (for/list ([cmd cmds] [i (in-naturals)])
    (match cmd
      [`(declare-datatypes () (,decls ...))
       (for ([decl decls])
         (match decl
           [`(,name ,(? symbol? constructors) ...)
            (hash-set! finite-types name constructors)]
           [_ (void)]))
       cmd]
      [`(assert ,expr)
       `(assert ,(ground expr))]
      [_
       cmd])))

(define (z3-clean-no-opt cmds)
  (for/list ([cmd cmds])
    (match cmd
      [`(assert (! ,terms ... :opt _)) `(assert (! ,@terms))]
      [_ cmd])))