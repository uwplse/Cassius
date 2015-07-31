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
              ['unsat
               (write "(get-unsat-core)")
               (let ([msg2 (read out)])
                 (debug #:tag 'output "<- ~a\n" msg2)
                 (error (format "Z3 unsatisfiable: ~a\n~a" msg2
                                (string-join
                                 (for/list ([var msg2])
                                   (format "  ~a: ~a" var (get-unsat var))) "\n"))))]
              ['sat
               (if (null? rest)
                   (begin
                     (debug #:tag 'sat ">>> get-model\n")
                     (write "(get-model)")
                     (loop rest (current-inexact-milliseconds)))
                   (loop rest #f))]
              [`(model (define-fun ,consts ,_ ,_ ,vals) ...)
               (begin0 (for/hash ([c consts] [v vals]) (values c (de-z3ify v)))
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
          [`(check-sat)
           (write "(check-sat)")
           (debug #:tag 'tactic ">>> sat\n")
           (loop (cdr rest) (current-inexact-milliseconds))]
          [`(apply ,args ...)
           (write (~a (car rest)))
           (debug #:tag 'tactic ">>> ~a\n" (string-join (map ~a args) " "))
           (loop (cdr rest) (current-inexact-milliseconds))]
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

(define ((fixpoint-1 f) x)
  (let ([x* (f x)])
    (if (equal? x* x) x ((fixpoint f) x*))))

(define (fixpoint . fs) (fixpoint-1 (apply compose fs)))

(define ((z3-resolve-fn f) cmds)
  "Resolve applications of a function f using asserted equalities"
  (define values (make-hash))
  (for ([cmd cmds] [i (in-naturals)])
    (match cmd
      [`(assert (= (,(== f) ,input) ,output))
       (hash-set! values input output)]
      [_ (void)]))
  (for/list ([cmd cmds] [i (in-naturals)])
    (match cmd
      [(list 'assert expr)
       (list 'assert
             (let loop ([expr expr])
               (match expr
                 [`(let ((,vars ,vals) ...) ,body)
                  `(let (,@(for/list ([var vars] [val vals]) `(,var ,(loop val)))) ,(loop body))]
                 [`(= (,(== f) ,input) ,output) expr]
                 [(list (== f) arg)
                  (hash-ref values arg (lambda () `(,f ,(loop arg))))]
                 [(list fn args ...) (cons fn (map loop args))]
                 [_ expr])))]
      [_ cmd])))

(define (z3-resolve-fns . fs)
  (apply fixpoint (map z3-resolve-fn fs)))

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
  (define problems (make-hash))
  (for ([cmd cmds] [i (in-naturals 1)])
    (match cmd
      [(list 'assert expr)
       (define failures (reap [fail] (valid-expr? expr fail)))
       (unless (null? failures)
         (for ([err failures])
           (hash-set! problems err (cons (cons i cmd) (hash-ref problems err '())))))]
      [_ (void)]))
  (for ([(key vals) (in-hash problems)])
    (eprintf "Z3: Improperly guarded field reference ~a on ~a lines\n" key (length vals))
    (eprintf "  line ~a: ~a\n" (caar vals) (cdar vals)))
  cmds)

(define ((z3-sink-functions . fns ) cmds)
  "Turn (fld (ite c x y)) into (ite c (fld x) (fld y))."
  (define (field? x) (member x fns))
  (define (sink-field expr)
    (match expr
      [`(,(? field? fld) (ite ,c ,x ,y))
       `(ite ,(sink-field c) ,(sink-field (list fld x)) ,(sink-field (list fld x)))]
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

(define-syntax-rule (matches? expr pattern)
  (match expr [pattern #t] [_ #f]))

(define ((z3-expand name) cmds)
  (match-define `((,names ,body))
    (for/reap [save] ([line cmds])
              (match line
                [`(define-fun ,(== name) ((,names ,types) ...) ,rtype ,body)
                 (save (list names body))]
                [_ (void)])))

  (for/list ([cmd cmds] [i (in-naturals)])
    (match cmd
      [(list 'assert expr)
       (list 'assert
             (let loop ([expr expr])
               (match expr
                 [`(let ((,vars ,vals) ...) ,body)
                  `(let (,@(for/list ([var vars] [val vals]) `(,var ,(loop val)))) ,(loop body))]
                 [(list (== name) args ...)
                  (capture-avoiding-substitute body (map cons names args))]
                 [(? list?)
                  (map loop expr)]
                 [_ expr])))]
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
      [`(assert (and ,exprs ...))
       (for ([expr exprs])
         (sow `(assert ,expr)))]
      [_ (sow cmd)])))

(define (z3-print-all cmds)
  (for ([cmd cmds] [i (in-naturals)])
    (eprintf "  ~a: ~a\n" i cmd)))

(define *emitter-passes*
  (list
   z3-assert-and
   (map z3-expand '(is-an-element))
   (map z3-expand '(previous parent fchild lchild pbox vbox fbox lbox))
   z3-unlet
   z3-assert-and
   (z3-resolve-fns
    'flow-box 'float-box 'child-box 'element
    'get/elt 'first-child-name 'last-child-name 'parent-name 'previous-name
    'get/box 'p-name 'v-name 'f-name 'l-name)
   #;z3-print-all
   #;z3-simplifier
   (z3-sink-fields-and 'get/box 'get/elt)
   (z3-resolve-fns
    'flow-box 'float-box 'child-box 'element
    'get/elt 'first-child-name 'last-child-name 'parent-name 'previous-name
    'get/box 'p-name 'v-name 'f-name 'l-name)
   z3-dco z3-movedefs
   z3-check-datatypes z3-check-functions z3-check-let z3-check-fields))

(define (z3-prepare exprs)
  (foldl (λ (action exprs*) (action exprs*)) exprs (flatten *emitter-passes*)))
