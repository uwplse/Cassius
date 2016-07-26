#lang racket

(require racket/runtime-path racket/path)
(require "common.rkt")
(require "z3o.rkt")

(provide z3-solve z3-prepare z3-namelines z3-clean z3-check-sat)

(define (z3-process #:flags [flags '("-st")])
  (define-values (process z3-out z3-in z3-err)
    (apply subprocess #f #f #f z3-path "-smt2" "-in" flags))

  (define soft? false)
  
  (define (send cmd)
    (with-handlers
        ([exn:break? (λ (e) (subprocess-kill process #t) (raise e))]
         [exn:fail:syntax? (λ (e) (raise-syntax-error 'Z3 (exn-message e) cmd))])
      (define response?
        (match cmd
          [(list 'echo s)
           (fprintf z3-in "; ~a\n" s)
           false]
          [(list 'assert-soft _ ...)
           (fprintf z3-in "~a\n" cmd)
           (set! soft? true)
           false]
          [_
           (fprintf z3-in "~a\n" cmd)
           true]))
      (flush-output z3-in)
      (define out
        (if response?
            (parse-output (read z3-out))
            'success))
      (if (and (equal? out 'sat) soft?)
          (parse-output (read z3-out))
          out)))

  (send '(set-option :print-success true))
  send)

(define (parse-output msg)
  (match msg
    [`(error ,description)
     (match-define (list line/col text) (string-split description ": "))
     (match-define (list "line" (app string->number line) "column" (app string->number column))
                   (string-split line/col))
     (raise-syntax-error 'Z3 "Z3 error (~a:~a)" line column text)]
    ['unsupported
     (error "Z3 unsupported\n")]
    [`(model (define-fun ,consts ,_ ,_ ,vals) ...)
     (for/hash ([c consts] [v vals]) (values c (de-z3ify v)))]
    [(? eof-object?)
     (error "Z3 error: premature EOF received")]
    [_ msg]))

(define (z3-solve encoding)
  (define z3 (z3-process))
  (let/ec return
    (for ([line encoding])
      (match (z3 line)
        ['unsat (return `(core ,(z3 '(get-unsat-core))))]
        ['sat (return `(model ,(z3 '(get-model))))]
        [(list 'objectives _) (return `(model ,(z3 '(get-model))))]
        ['success (void)]))))

(define (dict-remove* dict keys)
  (for/fold ([dict dict]) ([key keys])
    (dict-remove dict key)))

(define (replace-terms expr bindings)
  (match expr
    [(? (curry dict-has-key? bindings))
     (dict-ref bindings expr)]
    [`(let ((,vars ,vals) ...) ,body)
     `(let (,@(map list vars (map (curryr replace-terms bindings) vals)))
        ,(replace-terms body (dict-remove* bindings vars)))]
    [(? list?) (map (curryr replace-terms bindings) expr)]
    [_ expr]))

(define (de-z3ify v)
  (match v
    [(== 'true) #t]
    [(== 'false) #f]
    [`(- ,n) (- (de-z3ify n))]
    [`(/ ,n ,d) (/ (de-z3ify n) (de-z3ify d))]
    [`(let ((,names ,values) ...) ,body)
     (de-z3ify (replace-terms body (map cons names values)))]
    [(list args ...) (map de-z3ify args)]
    [else v]))

(define to-resolve
  (append
   '(get/elt flow-box first-child-name last-child-name parent-name previous-name next-name)
   '(get/box element pb-name v-name flt-name flt-up-name n-name)
   '(real-p-name real-v-name real-n-name real-f-name real-l-name)))

(define to-expand
  (append
   '(link-element link-block-box link-inline-box link-text-box link-line-box link-element-box link-root-element link-anon-box)
   '(an-element a-root-element element-info is-a-rule)
   '(float textalign box-in-flow)
   '(previous next parent fchild lchild)
   '(real-pbox real-fbox real-lbox real-vbox real-nbox)
   '(pbox pbbox vbox fbox lbox nbox vbox fltbox)
   ))

(define to-expand-2
  '(an-inline-box a-text-box a-line-box a-block-box a-block-flow-box a-block-float-box a-block-positioned-box an-anon-block-box a-view-box))

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
  (for/fold ([exprs exprs]) ([action (flatten *emitter-passes*)])
    #;(eprintf "  [~a / ~a]\n~a" (- (current-inexact-milliseconds) start) (tree-size exprs) action)
    (action exprs)))

(define z3-check-sat
  '(check-sat-using
    (then
     (! propagate-values
        :push_ite_arith true
        :algebraic_number_evaluator false
        :bit2bool false
        :local_ctx true
        :hoist_mul true
        :flat false)
     nnf occf smt)))

(define (z3-clean exprs)
  (append (z3-clean-no-opt (z3-strip-inner-names exprs)) '((check-sat))))
