#lang racket

(require racket/runtime-path racket/path)
(require "common.rkt")
(require "z3o.rkt")

(provide z3-solve z3-prepare z3-namelines (struct-out model) (struct-out unsat-core))

(struct model (bindings))
(struct unsat-core (bad-lines))

(define-runtime-path bin "..")
(define z3 (make-parameter (build-path bin "z3.sh")))

; Invokes Z3 and returns #f if unsatisfiable
; or a map from constant names to values if satisfiable.
(define (z3-solve encoding #:debug [debug? #f])
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

  (dynamic-wind
    (λ () (void))
    (λ ()
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
                     (unsat-core msg2))]
                  ['sat
                   (if (null? rest)
                       (begin
                         (debug #:tag 'sat ">>> get-model\n")
                         (write "(get-model)")
                         (loop rest (current-inexact-milliseconds)))
                       (loop rest #f))]
                  [`(model (define-fun ,consts ,_ ,_ ,vals) ...)
                   (begin0 (model (for/hash ([c consts] [v vals]) (values c (de-z3ify v))))
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
    (λ ()
      (close-output-port in)
      (close-input-port out)
      (close-input-port err)
      (subprocess-kill process #t))))

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

(define (z3-literal? expr)
  (match expr
    [(? number?) #t]
    [(? symbol?) #t]
    [`(as ,val ,sort) #t]
    [_ #f]))

(define to-resolve
  (append
   '(get/elt flow-box first-child-name last-child-name parent-name previous-name next-name)
   '(get/box element pb-name v-name flt-name flt-up-name n-name)
   '(real-p-name real-v-name real-n-name real-f-name real-l-name)))

(define to-expand
  (append
   '(link-element link-block-box link-inline-box link-text-box link-line-box link-element-box link-root-element link-anon-box)
   '(an-element a-root-element element-info)
   '(float textalign)
   '(previous next parent fchild lchild)
   '(real-pbox real-fbox real-lbox real-vbox real-nbox)
   '(pbox pbbox vbox fbox lbox nbox vbox fltbox)
   ))

(define to-expand-2
  '(an-inline-box a-text-box a-line-box a-block-box a-block-flow-box a-block-float-box an-anon-block-box))

(define *emitter-passes*
  (list
   z3-ground-quantifiers
   z3-unlet ; z3-expand handles LETs incorrectly, so we need to get rid of them first
   (z3-resolve-fns)
   z3-dco
   (apply z3-expand to-expand)
   z3-unlet
   z3-simplif
   z3-assert-and
   (apply z3-resolve-fns to-resolve)
   (z3-sink-fields-and 'get/box 'get/elt 'is-box 'is-no-box 'is-elt 'is-no-elt)
   (apply z3-resolve-fns to-resolve)
   (apply z3-expand to-expand-2)
   z3-simplif
   z3-assert-and
   (apply z3-lift-arguments to-resolve)
   (apply z3-resolve-fns to-resolve)
   (z3-sink-fields-and 'get/box 'get/elt 'is-box 'is-no-box 'is-elt 'is-no-elt)
   (apply z3-resolve-fns to-resolve)
   ;; It's important to lift and expand earlier up to make these passes fast.
   z3-if-and
   z3-simplif
   z3-dco
   #;(z3-check-trivial-calls 'get/box 'get/elt)
   z3-check-datatypes z3-check-functions z3-check-let #;z3-check-fields
   z3-clean-no-opt
   ))

(define (z3-namelines cmds)
  (for/list ([cmd cmds] [i (in-naturals)])
    (match cmd
      [`(assert (! ,expr :named ,name))
       cmd]
      [`(assert ,expr)
       `(assert (! ,expr :named ,(string->symbol (format "line$~a" i))))]
      [_ cmd])))

(define (z3-prepare exprs)
  (define start (current-inexact-milliseconds))
  (append
   (for/fold ([exprs exprs]) ([action (flatten *emitter-passes*)])
     #;(eprintf "  [~a / ~a]\n~a" (- (current-inexact-milliseconds) start) (tree-size exprs) action)
     (action exprs))
   '((check-sat))))
