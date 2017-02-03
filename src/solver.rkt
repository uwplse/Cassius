#lang racket
(provide z3-prepare z3-clean z3-namelines cassius-check-sat)

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

(define (z3-prepare exprs)
  (define start (current-inexact-milliseconds))
  (for/fold ([exprs exprs]) ([action (flatten *emitter-passes*)])
    #;(eprintf "  [~a / ~a]\n~a" (- (current-inexact-milliseconds) start) (tree-size exprs) action)
    (action exprs)))

(define (z3-clean exprs)
  (append (z3-clean-no-opt (z3-strip-inner-names exprs)) '((check-sat))))

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
