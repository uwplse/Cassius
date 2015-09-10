#lang racket

(require racket/runtime-path racket/path)
(require srfi/13)
(require "common.rkt")

(provide z3-solve z3-prepare)

(define-runtime-path bin "..")
(define z3 (make-parameter (build-path bin "z3.sh")))

; Invokes Z3 and returns #f if unsatisfiable
; or a map from constant names to values if satisfiable.
(define (z3-solve encoding #:debug [debug? #f] #:get-unsat [get-unsat identity])
  (define-values (process out in err)
    (subprocess #f #f #f (z3) "-st" "-smt2" "-in"))

  (define lines (inexact->exact (ceiling (/ (log (+ 1 (length encoding))) (log 10)))))
  (define asserts (make-hash))

  (define line 1)

  (define (debug #:tag [tag #f] fmt . args)
    (when (or (not tag) (eq? debug? #t) (and (list? debug?) (member tag debug?)))
      (apply eprintf fmt args)))

  (define (write val)
    (debug #:tag 'input "~a ~a\n" (~r line #:min-width (+ 1 lines)) val)
    (set! line (+ 1 line))
    (fprintf in (format "~a\n" val))
    (flush-output in))

  (with-handlers ([exn:break? (lambda (e) (subprocess-kill process #t) (raise e))])
    (let loop ([rest encoding] [paused? #f])
      (cond
       [(byte-ready? out)
        (cond
         [(char-whitespace? (peek-char out))
          (read-char out)
          (loop rest paused?)]
         [(char=? (peek-char out) #\|)
          (debug #:tag 'optimality "<- ~a" (read-line))
          (loop rest paused?)]
         [else
          (let ([msg (read out)])
            (when paused?
              (debug #:tag 'timing "... ~ams\n"
                     (inexact->exact (round (- (current-inexact-milliseconds) paused?)))))
            (debug #:tag 'output "<- ~a\n" msg)
            (match msg
              [`(error ,text)
               (match (map string-split (string-split text ":"))
                 [`(("line" ,l "column" ,c) ,rest)
                  (error (format "Z3 error: ~a\n  line:" text) (list-ref encoding (- (string->number l) 1)))])]
              ['unsupported
               (error "Z3 error: unsupported\n")]
              ['unsat
               (write "(get-unsat-core)")
               (let ([msg2 (read out)])
                 (debug #:tag 'output "<- ~a\n" msg2)
                 (error (format "Z3 unsatisfiable (core is ~a constraints)\n~a" (length msg2)
                                (string-join
                                 (for/list ([var msg2])
                                           (format "  ~a: ~a" var (or (get-unsat var) (hash-ref asserts var)))) "\n"))))]
              ['sat
               (if (null? rest)
                   (begin
                     (debug #:tag 'sat ">>> get-model\n")
                     (write "(get-model)")
                     (loop rest (current-inexact-milliseconds)))
                   (loop rest #f))]
              [`(model (define-fun ,consts ,_ ,_ ,vals) ...)
               (begin0 (for/hash ([c consts] [v vals]) (values c (de-z3ify v)))
                 (for ([cmd rest])
                   (write (~a cmd))
                   (debug #:tag 'eval ">>> ~a → ~a\n" cmd (read out)))
                 (close-output-port in)
                 (when (or (eq? debug? #t) (and (list? debug?) (member 'stats debug?)))
                   (copy-port out (current-error-port))))]
              [`(goals (goal ,args ...) ...)
               (loop rest #f)]
              [(? eof-object?)
               (error "Premature EOF received")]))])]
       [paused?
        (sync/enable-break out)
        (loop rest paused?)]
       [(null? rest)
        (sync/enable-break out)
        (loop rest (current-inexact-milliseconds))]
       [#t
        (match (car rest)
          [`(echo ,x)
           (write (format "; ~a" x))
           (loop (cdr rest) paused?)]
          [`(check-sat)
           (write "(check-sat)")
           (debug #:tag 'tactic ">>> sat\n")
           (loop (cdr rest) (current-inexact-milliseconds))]
          [`(apply ,args ...)
           (write (~a (car rest)))
           (debug #:tag 'tactic ">>> ~a\n" (string-join (map ~a args) " "))
           (loop (cdr rest) (current-inexact-milliseconds))]
          [`(assert (! ,expr :named ,name))
           (write (~a (car rest)))
           (hash-set! asserts name expr)
           (loop (cdr rest) paused?)]
          [_
           (write (~a (car rest)))
           (loop (cdr rest) paused?)])]))))

; Writes the given encoding to the specified port.
(define (write-encoding encoding port #:debug [debug #f])
  (define line 0)
  (define (write . args)
    (set! line (+ line 1))
    (apply fprintf port args)
    (when debug
      (printf "~a " (~a line #:width 4))
      (apply printf args)))

  (write "(set-option :produce-unsat-cores true)\n")
  (for ([expr encoding])
    (write "~a\n" expr))
  (flush-output port))

; Reads the SMT solution from the given input port.
; The solution consist of 'sat or 'unsat, followed by
; followed by a suitably formatted s-expression.  The
; output of this procedure is a hashtable from constant
; identifiers to their values (if the solution is 'sat);
; a non-empty list of assertion identifiers that form an
; unsatisfiable core (if the solution is 'unsat and a
; core was extracted); or #f (if the solution is
; 'unsat and no core was extracted).
(define (de-z3ify v)
  (match v
    [(== 'true) #t]
    [(== 'false) #f]
    [`(- ,n) (- (de-z3ify n))]
    [`(/ ,n ,d) (/ (de-z3ify n) (de-z3ify d))]
    [(list args ...) (map de-z3ify args)]
    [else v]))

(define (z3-simplifier cmds)
  "Simplify expressions using assertions of the form (= a b)."
  (let* ([*store* (make-hash)])
    (define (store a b) (hash-set! *store* a b))
    (define (lookup a) (hash-ref *store* a a))
    (define (simpl expr)
      (lookup
       (match expr
         [(? number?) expr]
         [(? symbol?) expr]
         [(? list?) (map simpl expr)])))

    (for ([cmd cmds])
      (match cmd
        [`(assert (= ,a ,b))
         (let ([a* (simpl a)] [b* (simpl b)])
           (cond
            [(and (z3-literal? a*) (not (eq? a* b*)))
             (store b* a*)]
            [(and (z3-literal? b*) (not (eq? a* b*)))
             (store a* b*)]))]
        [_ 'ok]))

    (define cmds*
      (for/list ([cmd cmds])
        (match cmd
          [`(assert ,e)
           `(assert ,(simpl e))]
          [_ cmd])))

    (define cleared-assertions 0)

    (reap [sow]
          (for ([cmd cmds*])
            (match cmd
              [`(assert (= ,e ,e)) (set! cleared-assertions (+ 1 cleared-assertions))]
              [_ (sow cmd)]))
          (printf "Cleared ~a assertions\n" cleared-assertions))))

(define (z3-literal? expr)
  (match expr
    [(? number?) #t]
    [(? symbol?) #t]
    [`(as ,val ,sort) #t]
    [_ #f]))

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
      [`(assert (= (,(? (curryr member fns) fn) ,args ...) ,value))
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
      (eprintf "  line ~a: ~a\n" (caar vals) (cdar vals)))))

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
  (for/reap (sow) ([cmd cmds] [i (in-naturals)])
    (match cmd
      [`(assert (ite ,c (and ,exprs1 ...) (and ,exprs2 ...)))
       (let loop ([exprs1 exprs1] [exprs2 exprs2])
         (unless (and (null? exprs1) (null? exprs2))
           (sow `(assert
                  (ite ,c
                       ,(if (null? exprs1) 'true (car exprs1))
                       ,(if (null? exprs2) 'true (car exprs2)))))
           (loop (if (null? exprs1) exprs1 (cdr exprs1))
                 (if (null? exprs2) exprs2 (cdr exprs2)))))]
      [`(assert (and ,exprs ...))
       (for ([expr exprs])
         (sow `(assert ,expr)))]
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

(define (z3-debughelp cmds)
  (if (memq 'debug (flags))
      (for/list ([cmd cmds] [i (in-naturals)])
        (match cmd
          [`(assert (! ,expr :named ,name))
           cmd]
          [`(assert ,expr)
           `(assert (! ,expr :named ,(string->symbol (format "line$~a" i))))]
          [_ cmd]))
      cmds))

(define (z3-simplif cmds)
  (define constructors (make-hash))
  (define types (make-hash))

  (define (constructor? name)
    (hash-has-key? types name))

  (define (constructor-tester? name)
    (define parts (string-split (~a name) "-"))
    (and (string=? (first parts) "is")
         (constructor? (string->symbol (string-join (rest parts) "-")))))

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
      [`(ite false ,a ,b) b]
      [`(ite true ,a ,b) a]
      [`(=> false ,a) 'true]
      [`(=> true ,a) a]
      [(list 'and rest ... )
       (if (member 'false rest)
           'false
           (filter (lambda (x) (not (equal? x 'true))) (cons 'and rest)))]
      [(list 'or rest ... )
       (if (member 'true rest)
           'true
           (filter (lambda (x) (not (equal? x 'false))) (cons 'or rest)))]
      [(list '= a a) 'true]
      [_ expr]))

  (for/reap [sow] ([cmd cmds])
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
      [`(assert ,expr)
       (define s (simpl expr))
       (when (not (eq? s 'true)) (sow `(assert ,s)))]
      [_ (sow cmd)])))

(define to-resolve
  (append
   '(get/elt flow-box first-child-name last-child-name parent-name previous-name next-name)
   '(get/box element p-name vnf-name vff-name f-name l-name n-name)))

(define *emitter-passes*
  (list
   z3-unlet ; z3-expand handles LETs incorrectly, so we need to get rid of them first
   (z3-expand 'an-element 'an-inline-box 'a-text-box 'a-line-box 'a-block-box
              'a-block-flow-box 'a-block-float-box 'margin-collapse 'flow-compute-y)
   (z3-expand 'previous 'next 'parent 'fchild 'lchild 'pbox 'vbox 'fbox 'lbox 'nbox 'vnfbox 'vffbox)
   z3-assert-and
   (apply z3-lift-arguments to-resolve)
   (apply z3-resolve-fns to-resolve)
   (z3-sink-fields-and 'get/box 'get/elt)
   (apply z3-resolve-fns to-resolve)
   ;; It's important to lift and expand earlier up to make these passes fast.
   z3-simplif
   (z3-check-trivial-calls 'get/box 'get/elt)
   (z3-expand 'get/box 'get/elt)
   z3-simplif
   z3-dco
   z3-check-datatypes z3-check-functions z3-check-let z3-check-fields
   z3-debughelp))

(define (z3-prepare exprs)
  (define start (current-inexact-milliseconds))
  (for/fold ([exprs exprs]) ([action (flatten *emitter-passes*)])
    #;(eprintf "  [~a / ~a]\n~a" (- (current-inexact-milliseconds) start) (tree-size exprs) action)
    (action exprs)))
