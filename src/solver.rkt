#lang racket
(require "z3o.rkt" "common.rkt" "spec/utils.rkt")
(provide z3-prepare z3-clean z3-namelines cassius-check-sat)

(define to-resolve
  (append
   '(box-elt pelt velt nelt felt lelt)
   '(pbox vbox nbox fbox lbox)
   '(fflow lflow vflow nflow)
   '(ppflow pbflow rootbox)
   '(fid)))

(define to-expand
  (append
   '(link-element link-element-component link-box link-box-component)
   '(match-element-box match-anon-box)
   '(link-flow-root link-flow-simple link-flow-block)
   '(float position box-in-flow box-positioned)
   '(compute-style)
   '(pflow)
   '(box-elt)))

(define to-expand-2
  (append
   '(an-inline-box a-text-box a-line-box a-block-box)
   '(a-block-flow-box a-block-float-box a-block-positioned-box an-anon-block-box a-view-box)
   '(positioned-horizontal-layout positioned-vertical-layout)))

(define ((unless-debug f) cmds)
  (if (*debug*)
      cmds
      (f cmds)))

(define *emitter-passes*
  (list
   (z3-ground-quantifiers 'Box)
   z3-fix-rational
   z3-unlet ; LETs are weirdly slow for some reason
   (z3-expand to-expand)
   (z3-expand to-expand-2)
   z3-unlet
   z3-assert-and
   (unless-debug (apply z3-lift-arguments to-resolve))
   (apply z3-sink-fields-and 'is-box 'is-no-box 'is-elt 'is-no-elt to-resolve)
   (apply z3-resolve-fns to-resolve)
   z3-simplif
   ))

(define (z3-prepare exprs)
  (define start (current-inexact-milliseconds))
  (for/fold ([exprs exprs]) ([action (flatten *emitter-passes*)])
    #;(eprintf "  [~a / ~a]\n~a" (- (current-inexact-milliseconds) start) (tree-size exprs) action)
    (action exprs)))

(define (z3-clean exprs)
  (append (z3-strip-inner-names (z3-fix-rational exprs)) '((check-sat))))

(define (z3-namelines cmds)
  (for/list ([cmd cmds] [i (in-naturals)])
    (match cmd
      [`(assert (! ,expr :named ,name))
       cmd]
      [`(assert ,expr)
       `(assert (! ,expr :named ,(string->symbol (format "line$~a" i))))]
      [_ cmd])))

(define cassius-check-sat
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

(module+ main
  (command-line
   #:args (fname oname)
   (define cmds
     (z3-prepare
      (call-with-input-file fname
        (λ (p) (sequence->list (in-port read p))))))
   (call-with-output-file
       oname #:exists 'replace
       (λ (p)
         (for ([cmd cmds])
           (fprintf p "~a\n" cmd))))))
