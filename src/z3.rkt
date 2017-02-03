#lang racket

(require racket/runtime-path racket/path)
(require "common.rkt" "z3o.rkt" "smt.rkt")

(provide make-z3 z3-process z3-send z3-check-sat z3-kill z3-solve z3-prepare z3-namelines z3-clean z3-try-solve)

(define (z3-process #:flags [flags '("-st")])
  (define-values (process z3-out z3-in z3-err)
    (apply subprocess #f #f #f z3-path "-smt2" "-in" flags))

  (define soft? false)

  (define (kill)
    (close-output-port z3-in)
    (close-input-port z3-out)
    (close-input-port z3-err)
    (subprocess-kill process true))

  (define (ffprintf port fmt . vs)
    (apply fprintf port fmt vs)
    (flush-output port))
  
  (define (send cmd)
    (with-handlers
        ([exn:break? (λ (e) (kill) (raise e))]
         [exn:fail:syntax? (λ (e) (raise-syntax-error 'Z3 (exn-message e) cmd))])
      (define out
        (match cmd
          [(list 'kill)
           (kill)
           'success]
          [(list 'echo s)
           (ffprintf z3-in "; ~a\n" s)
           'success]
          [(list 'assert-soft _ ...)
           (ffprintf z3-in "~a\n" cmd)
           (set! soft? true)
           'success]
          [_
           (ffprintf z3-in "~a\n" cmd)
           (parse-output (read z3-out) cmd)]))
      (if (and (equal? out 'sat) soft?)
          (parse-output (read z3-out) cmd)
          out)))

  (send '(set-option :print-success true))
  send)

(define (make-z3 #:flags [flags '("-st")] . cmdss)
  (define proc (z3-process #:flags flags))
  (for-each (curry z3-send proc) cmdss)
  proc)

(define (parse-output msg input)
  (match msg
    [`(error ,description)
     (match-define (list line/col text) (string-split description ": "))
     (match-define (list "line" (app string->number line) "column" (app string->number column))
                   (string-split line/col))
     (raise-syntax-error 'Z3 (format "Z3 error (~a:~a)" line column) text)]
    ['unsupported
     (error "Z3 unsupported:" input)]
    [`(model (define-fun ,consts ,_ ,_ ,vals) ...)
     (for/hash ([c consts] [v vals]) (values c (de-z3ify v)))]
    [(? eof-object?)
     (error "Z3 error: premature EOF received")]
    [_ msg]))

(define (z3-send process cmds)
  (for ([line cmds])
    (define out (process line))
    (unless (equal? 'success out)
      (raise (make-exn:fail (format "~a;\n  ~a" out line) (current-continuation-marks))))))

(define (z3-try-solve process cmds #:strategy [strategy '(check-sat)])
  (z3-send process '((push)))
  (z3-send process cmds)
  (let ([out (z3-check-sat process #:strategy strategy)])
    (when (equal? (first out) 'core)
      (z3-send process '((pop))))
    out))

(define (z3-check-sat process #:strategy [strategy '(check-sat)])
  (match (process strategy)
    ['unsat `(core ,(process '(get-unsat-core)))]
    [(or 'sat (list 'objectives _)) `(model ,(process '(get-model)))]))

(define (z3-kill process)
  (z3-send process '((kill)))
  (void))

(define (z3-solve encoding)
  (define z3 (z3-process))
  (z3-send z3 encoding)
  (define out (z3-check-sat z3))
  (z3-kill z3)
  out)

(define (de-z3ify v)
  (match v
    [(== 'true) #t]
    [(== 'false) #f]
    [`(- ,n) (- (de-z3ify n))]
    [`(/ ,n ,d) (/ (de-z3ify n) (de-z3ify d))]
    [`(let ((,names ,values) ...) ,body)
     (de-z3ify (smt-replace-terms body (map cons names values)))]
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
   #;z3-dco
   (z3-expand to-expand)
   z3-unlet
   z3-simplif
   z3-assert-and
   (apply z3-resolve-fns to-resolve)
   (z3-sink-fields-and 'get/box 'get/elt 'is-box 'is-no-box 'is-elt 'is-no-elt)
   (apply z3-resolve-fns to-resolve)
   (z3-expand to-expand-2 #:clear true)
   z3-simplif
   z3-assert-and
   (apply z3-lift-arguments to-resolve)
   (apply z3-resolve-fns to-resolve)
   (z3-sink-fields-and 'get/box 'get/elt 'is-box 'is-no-box 'is-elt 'is-no-elt)
   (apply z3-resolve-fns to-resolve)
   ;; It's important to lift and expand earlier up to make these passes fast.
   z3-if-and
   z3-simplif
   #;z3-dco
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

(define (z3-clean exprs)
  (append (z3-clean-no-opt (z3-strip-inner-names exprs)) '((check-sat))))
