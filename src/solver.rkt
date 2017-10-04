#lang racket
(require "z3o.rkt" "common.rkt" "spec/utils.rkt")
(provide z3-prepare z3-clean z3-namelines cassius-check-sat)

(define to-resolve
  (append
   '(get/elt &box &pelt &velt &nelt &felt &lelt)
   '(get/box &elt &pbox &vbox &nbox &fbox &lbox)
   '(&pbflow &ppflow &vflow &nflow &flt &flt-up)
   (for/list ([(name p) (in-dict (extra-pointers))] [i (in-naturals)])
     (sformat "&~a" i))))

(define to-expand
  (append
   '(link-element link-box)
   '(match-element-box match-anon-box match-anon-element)
   '(link-flow-simple link-flow-root link-flow-block)
   '(float position box-in-flow box-positioned)
   '(compute-style)
   '(pelt velt nelt felt lelt)
   '(pbox fbox lbox vbox nbox)
   '(pflow fflow lflow nflow vflow)
   '(ppflow pbflow flt)
   '(box-elt elt-box)))

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
   z3-fix-rational
   z3-ground-quantifiers
   z3-unlet ; LETs are weirdly slow for some reason
   (z3-resolve-fns)
   #;z3-dco
   (z3-expand to-expand)
   (z3-expand to-expand-2)
   z3-unlet
   ;z3-simplif
   z3-assert-and
   ;(apply z3-resolve-fns to-resolve)
   ;(z3-sink-fields-and 'get/box 'get/elt 'is-box 'is-no-box 'is-elt 'is-no-elt)
   ;(z3-expand to-expand-2 #:clear true)
   ;z3-simplif
   ;z3-assert-and
   (unless-debug (apply z3-lift-arguments to-resolve))
   ;(apply z3-resolve-fns to-resolve)
   (z3-sink-fields-and 'get/box 'get/elt 'is-box 'is-no-box 'is-elt 'is-no-elt)
   ;(apply z3-resolve-fns to-resolve)
   ;;; It's important to lift and expand earlier up to make these passes fast.
   ;z3-if-and
   (apply z3-resolve-fns to-resolve)
   z3-simplif
   #;z3-dco
   #;(z3-check-trivial-calls 'get/box 'get/elt)
   ;z3-check-datatypes z3-check-functions z3-check-let #;z3-check-fields
   z3-clean-no-opt
   ))

(define (z3-prepare exprs)
  (define start (current-inexact-milliseconds))
  (for/fold ([exprs exprs]) ([action (flatten *emitter-passes*)])
    #;(eprintf "  [~a / ~a]\n~a" (- (current-inexact-milliseconds) start) (tree-size exprs) action)
    (action exprs)))

(define (z3-clean exprs)
  (append (z3-clean-no-opt (z3-strip-inner-names (z3-fix-rational exprs))) '((check-sat))))

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
