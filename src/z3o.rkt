#lang racket
(require "common.rkt")
(provide z3-dco z3-unlet z3-expand z3-assert-and z3-lift-arguments z3-resolve-fns z3-sink-fields-and
         z3-if-and z3-simplif z3-check-trivial-calls z3-check-datatypes z3-check-functions
         z3-check-let z3-check-fields z3-print-all z3-ground-quantifiers
         z3-clean-no-opt z3-strip-inner-names z3-fix-rational)

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
        [(list (or 'declare-fun 'declare-const 'define-fun 'define-const) name type _ ...)
         (hash-set! store name #f)]
        [_ 'ok]))

    (for ([name '(border/medium border/thin border/thick text-align/start text-align/end)])
      (hash-set! store name #t))

    (for ([cmd cmds])
      (match cmd
        [`(,(or 'assert 'assert-soft) ,expr)
         (find-used expr)]
        [(list 'define-fun name (list types ...) rtype body)
         (list 'define-fun name types rtype (find-used body))]
        [(list 'define-const name rtype body)
         (list 'define-const name rtype (find-used body))]
        [_ 'ok]))

    (apply append
           (for/list ([cmd cmds])
             (match cmd
               [(list (or 'declare-fun 'declare-const 'define-fun 'define-const) name type _ ...)
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

(define (sink-functions expr fields)
  "Turn (fn (ite c x y)) into (ite c (fn x) (fn y))."

  (match expr
    [`(,(? (curry set-member? fields) fld) (ite ,c ,x ,y))
     `(ite ,(sink-functions c fields) ,(sink-functions (list fld x) fields) ,(sink-functions (list fld y) fields))]
    [`(,(? (curry set-member? fields) fld) ,arg)
     (define arg* (sink-functions arg fields))
     (match arg*
       [`(ite ,c ,x ,y) (sink-functions `(,fld ,arg*) fields)]
       [_ (list fld arg*)])]
    [(? list?) (cons (car expr) (map (curryr sink-functions fields) (cdr expr)))]
    [_ expr]))

(define ((z3-sink-fields-and . fns) cmds)
  "Turn (fld (ite c x y)) into (ite c (fld x) (fld y))."
  (define to-sink fns)
  (for/list ([cmd cmds])
    (match cmd
      [`(declare-datatypes (,params ...) ((,names ,varss ...) ...))
       (for ([name names] [vars varss] #:when true [var vars])
         (match var
           [(? symbol?) (void)]
           [(list _ (list fields _) ...)
            (for ([field fields]) (set! to-sink (cons field to-sink)))]))
       cmd]
      [`(assert ,expr) `(assert ,(sink-functions expr to-sink))]
      [_ cmd])))

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
(define/contract (gensym name)
  (-> symbol? symbol?)
  (begin0 (sformat "~a$~a" name ctr)
    (set! ctr (+ ctr 1))))

(define-by-match smt-expr?
  (? symbol?)
  (? number?)
  (? list?))

(define (capture-avoiding-substitute body bindings)
  (capture-avoiding-substitute*
   body
   (if (list? bindings) (make-immutable-hash bindings) bindings)))

(define (capture-avoiding-substitute* body bindings)
  (match body
    [(? symbol?) (dict-ref bindings body body)]
    [`(! ,expr :named ,name)
     (define (rename head)
       (match bindings
         [`((,names . ,(? symbol? vals)) ...) (sformat "~a/~a" head (string-join (map ~a vals) "/"))]
         [_ head]))
     `(! ,(capture-avoiding-substitute* expr bindings) :named ,(rename name))]
    [`(let ((,names ,vals) ...) ,body)
     (define body*
       (capture-avoiding-substitute* body (dict-remove* bindings names)))
     `(let (,@(for/list ([name names] [val vals])
                `(,name ,(capture-avoiding-substitute* val bindings)))) ,body*)]
    [(? list?)
     (map (curryr capture-avoiding-substitute* bindings) body)]
    [_ body]))

(define/contract (expand-function expr fns)
  (-> smt-expr? (hash/c symbol? (list/c (listof symbol?) smt-expr?)) smt-expr?)
  (match expr
    [`(let ((,vars ,vals) ...) ,body)
     `(let (,@(for/list ([var vars] [val vals]) `(,var ,(expand-function val fns)))) ,(expand-function body fns))]
    [(list (and (? symbol?) (? (curry hash-has-key? fns)) name) args ...)
     (match-define (list names body) (hash-ref fns name))
     (expand-function (capture-avoiding-substitute body (map cons names args)) fns)]
    [(? list?)
     (map (curryr expand-function fns) expr)]
    [_ expr]))

(define ((z3-expand fn-names #:clear [clear? false]) cmds)
  (define fns (make-hash))

  (for/list ([cmd cmds])
    (match cmd
      [`(define-fun ,(? (curry set-member? fn-names) name) ((,names ,types) ...) ,rtype ,body)
       (hash-set! fns name (list names (expand-function body fns)))
       (if clear?
           `(echo ,(format "(define-fun ~a ...)" name))
           `(define-fun ,name (,@(map list names types)) ,rtype ,(expand-function body fns)))]
      [`(define-fun ,name ((,names ,types) ...) ,rtype ,body)
       `(define-fun ,name (,@(map list names types)) ,rtype ,(expand-function body fns))]
      [(list 'assert expr)
       (list 'assert (expand-function expr fns))]
      [_ cmd])))

(define (expand-let expr)
  (match expr
    [`(let* () ,body)
     body]
    [`(let* ([,var ,val] ,rest ...) ,body)
     (expand-let
      (capture-avoiding-substitute
       `(let* (,@rest) ,body)
       (list (cons var val))))]
    [`(let ([,vars ,vals] ...) ,body)
     (expand-let (capture-avoiding-substitute body (map cons vars vals)))]
    [(? list?) (cons (car expr) (map expand-let (cdr expr)))]
    [_ expr]))

(define (z3-unlet cmds)
  (for/list ([cmd cmds] [i (in-naturals)])
    (match cmd
      [`(define-fun ,name (,signature) ,rtype ,body)
       `(define-fun ,name (,signature) ,rtype ,(expand-let body))]
      [(list 'assert expr)
       (list 'assert (expand-let expr))]
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
       `(,f ,@(map expand-calls args) ,@(apply (hash-ref lifted f) (map expand-calls args)))]
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
       (define body* (expand-calls body))
       ; TODO: Doesn't do capture avoidance
       (define insts (remove-duplicates (reap [sow] (find-funs body* sow))))
       (define-values (eargs etypes)
         (for/lists (args types) ([inst insts])
           (define fn (car inst))
           (values (gensym fn) (hash-ref fns fn))))
       (when insts
         (hash-set! lifted name
                    (lambda oargs
                      (for/list ([inst insts])
                        (replace-terms inst (map cons args oargs))))))
       `(define-fun ,name (,@(map list args types) ,@(map list eargs etypes)) ,rtype
          ,(replace-terms body* (map cons insts eargs)))]
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
      [`(ite ,a ,b ,c)
       (match (simpl a)
         ['true (simpl b)]
         ['false (simpl c)]
         [expr (simpl1 `(ite ,expr ,(simpl b) ,(simpl c)))])]
      [`(=> ,a ,b)
       (match (simpl a)
         ['false 'true]
         [expr (simpl1 `(=> ,expr ,(simpl b)))])]
      [`(and ,exprs ...)
       (let loop ([exprs exprs] [rest '()])
         (if (null? exprs)
             (match rest
               ['() 'true]
               [(list x) x]
               [_ (cons 'and rest)])
             (match (simpl (car exprs))
               ['true (loop (cdr exprs) rest)]
               ['false 'false]
               [expr (loop (cdr exprs) (cons expr rest))])))]
      [`(or ,exprs ...)
       (let loop ([exprs exprs] [rest '()])
         (if (null? exprs)
             (match rest
               ['() 'false]
               [(list x) x]
               [_ (cons 'or rest)])
             (match (simpl (car exprs))
               ['true 'true]
               ['false (loop (cdr exprs) rest)]
               [expr (loop (cdr exprs) (cons expr rest))])))]
      [(? list?) (simpl1 (map simpl expr))]
      [_ expr]))

  (define (simpl1 expr)
    (match expr
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
      ;; DOMAIN SPECIFIC
      [`(is-no-box (get/box nil-box)) 'true]
      [`(is-box ,(? (λ (x) (and (symbol? x) (string-prefix? (~a x) "box"))))) 'true]
      [`(is-no-elt (get/elt nil-elt)) 'true]
      [`(is-elt ,(? (λ (x) (and (symbol? x) (string-prefix? (~a x) "elt"))))) 'true]
      ;; END DOMAIN SPECIFIC
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
  (define (if-and expr)
    (match expr
      [`(and (ite ,c ,a1 ,b1) (ite ,c ,a2, b2))
       `(ite ,c ,(if-and `(and ,a1 ,a2)) ,(if-and `(and ,b1 ,b2)))]
      [(? list?)
       (map if-and expr)]
      [_ expr]))
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
      [`(assert (=> ,c (! ,terms ... :opt ,_)))
       `(assert (=> ,c (! ,@terms)))]
      [`(assert (! (! ,terms ...  :opt ,_) ,rest ...))
       `(assert (! ,@terms ,@rest))]
      [`(assert (! ,terms ... :opt ,_))
       `(assert (! ,@terms))]
      [_ cmd])))

(define (fix-rational expr)
  (match expr
    [`(! ,term :named ,n)
     `(! ,(fix-rational term) :named ,n)]
    [(? list?) (map fix-rational expr)]
    [(? (and/c rational? exact? (not/c integer?)))
     `(/ ,(exact->inexact (numerator expr)) ,(exact->inexact (denominator expr)))]
    [_ expr]))

(define (z3-fix-rational cmds)
  (for/list ([cmd cmds])
    (match cmd
      [`(define-fun ,name (,vars ...) ,rtype ,body)
       `(define-fun ,name (,@vars) ,rtype ,(fix-rational body))]
      [`(assert ,body)
       `(assert ,(fix-rational body))]
      [_ cmd])))

(define (strip-names expr)
  (match expr
    [`(! ,term :named ,_)
     (strip-names term)]
    [(? list?) (map strip-names expr)]
    [_ expr]))

(define (z3-strip-inner-names cmds)
  (for/list ([cmd cmds])
    (match cmd
      [`(define-fun ,name (,vars ...) ,rtype ,body)
       `(define-fun ,name (,@vars) ,rtype ,(strip-names body))]
      [`(assert (forall (,vars ...) ,body))
       `(assert (forall (,@vars) ,(strip-names body)))]
      [_ cmd])))

(module+ main
  (define inl (sequence->list (in-port read (current-input-port))))
  (z3-print-all ((z3-lift-arguments 'get/box 'get/elt) inl)))
