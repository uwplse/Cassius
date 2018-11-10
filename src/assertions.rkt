#lang racket

(require "common.rkt" "dom.rkt" "registry.rkt" "selectors.rkt" "encode.rkt" "smt.rkt" "spec/utils.rkt")
(provide compile-assertion auxiliary-definitions assertion-helpers helper-dict)

(define auxiliary-definitions (make-parameter '()))

;; The strange duplication of `helper-dict` and `assertion-helpers` is
;; temporary, waiting on a better way to define optional or variary
;; arguments in `define` blocks. The main issue is that
;; `assertion-helpers` contains functions, and thus can't easily be
;; shipped to a different thread, while `helper-dict` has no optional
;; argument mechanism.
(define helper-dict (make-hash))

(define assertion-helpers
  (make-hash
   `((descends . ,(λ (b . sels) `(!= (ancestor ,b (matches ? ,@sels)) null)))
     (is-interactive . ,(λ (b) `(matches ,b (tag a) (tag input) (tag button))))
     (viewable . ,(λ (b) `(and (> (right ,b) (left root)) (> (bottom ,b) (top root)))))
     (onscreen . ,(λ (b) `(and (>= (left ,b) (left root)) (>= (top ,b) (top root)))))
     (!= . ,(λ (a b) `(not (= ,a ,b))))
     (width . ,(λ (b [dir 'border]) `(- (right ,b ,dir) (left ,b ,dir))))
     (height . ,(λ (b [dir 'border]) `(- (bottom ,b ,dir) (top ,b ,dir))))

     (no-floats-enter . ,(λ (b) `(let ([b ,b]) (raw (ez.outside (ez.in b) b)))))
     (no-floats-exit . ,(λ (b) `(let ([b ,b]) (raw (ez.inside (ez.out b) b)))))
     (no-floats-exit* . ,(λ (b) `(let ([b ,b]) (raw (ez.inside* (ez.out b) b)))))

     (float-flow-in . ,(λ (b1 b2) `(raw (and (= (ez.in ,b1) (ez.in ,b2)) (<= (top-border ,b1) (top-border ,b2))))))
     (float-flow-out . ,(λ (b1 b2) `(raw (and (= (ez.out ,b2) (ez.out ,b1)) (<= (bottom-border ,b1) (bottom-border ,b2))))))
     (float-flow-across . ,(λ bs (apply smt-and
                                        (for/list ([b bs] [b* (cdr bs)])
                                          `(raw (and (= (ez.out ,b) (ez.in ,b*))
                                                     (<= (bottom-border ,b) (top-border ,b*))))))))
     (float-flow-skip . ,(λ (b) `(raw (= (ez.out ,b) (ez.in ,b)))))
     (floats-tracked . ,(λ (b) `(raw (- ez.registers (ez.free-registers (ez.in ,b))))))
     (non-negative-margins . ,(λ (b) `(let ([b ,b]) (raw (non-negative-margins b)))))

     (luminance . ,(λ (color) `(let ([color ,color]) (raw (lum (color.rgb color))))))
     (overlaps . ,(λ (b1 b2) `(let ([b1 ,b1] [b2 ,b2]) (raw (overlaps b1 b2)))))
     (within . ,(λ (b1 b2) `(let ([b1 ,b1] [b2 ,b2]) (raw (within-outer b1 b2))))))))

(define (compile-assertion doms body ctx)
  (match-define (list dom) doms)
  (let loop ([expr body] [ctx ctx])
    (match expr
      ;; Booleans
      [(or 'true 'false) expr]
      [`(and ,parts ...) `(and ,@(map (curryr loop ctx) parts))]
      [`(or ,parts ...) `(or ,@(map (curryr loop ctx) parts))]
      [`(,(or '=> '=>*) ,as ... ,b)
       `(=> ,@(map (curryr loop ctx) as) ,(loop b ctx))]
      [`(not ,part) `(not ,(loop part ctx))]

      ;; Real numbers
      [(? number?) expr]
      [(list (and (or '= '< '> '<= '>=) op) parts ...)
       (cons op (map (curryr loop ctx) parts))]
      [(list (and (or '+ '- '* '/) op) parts ...)
       (cons op (map (curryr loop ctx) parts))]
      [`(max ,a ,b)
       `(max ,(loop a ctx) ,(loop b ctx))]

      ;; Boxes
      ['null 'no-box]
      [(list (and (or 'parent 'next 'prev 'first 'last) field) box)
       (define function
         (match field ['parent 'pflow] ['next  'nflow] ['prev  'vflow] ['first 'fflow] ['last  'lflow]))
       `(,function ,(loop box ctx))]
      [`(ancestor ,box ,cond*)
       (define cond (loop cond* #hash((? . b))))
       (define aux (sformat "aux~a" (name 'aux cond)))
       (define aux-def
         `((declare-fun ,aux (Box) Box)
           (assert (forall ((b Box)) (= (,aux b) (ite ,cond b (,aux (pflow b))))))
           (assert (= (,aux no-box) no-box))))
       (auxiliary-definitions (remove-duplicates (append (auxiliary-definitions) aux-def)))
       `(,aux ,(loop box ctx))]
      [`(has-contents ,box) `(has-contents ,(loop box ctx))]
      [`(is-component ,box) `(is-component ,(loop box ctx))]
      [`(has-type ,box ,(and (or 'root 'text 'inline 'block 'line) boxtype))
       (define function (sformat "is-box/~a" boxtype))
       `(,function (type ,(loop box ctx)))]
      [(list-rest (and (or 'top 'right 'bottom 'left) dir) box edge*)
       (define edge
         (match edge* [(list edge) edge] [(list) 'border]))
       (define adjustment
         (match dir [(or 'top 'bottom) 'yo] [(or 'left 'right) 'xo]))
       (define function (sformat "~a-~a" dir edge))
       `(+ (,function ,(loop box ctx)) (,adjustment ,(loop box ctx)))]
      [`(text-height ,box)
       `(let ([b ,(loop box ctx)]) (height-text b))]

      ;; Colors
      [`(fg ,box) `(fg-color ,(loop box ctx))]
      [`(bg ,box) `(bg-color ,(loop box ctx))]
      ['transparent 'color/transparent]
      [`(color ,name) (sformat "color/~a" name)]
      [`(rgb ,(? number? r) ,(? number? g) ,(? number? b))
       (dump-value (list 'rgb r g b))]
      [(list (and (or 'r 'g 'b) component) `(gamma ,color))
       (define function (sformat "color.~a-corr" component))
       `(,function (color.rgb ,(loop color ctx)))]
      [(list (and (or 'r 'g 'b) component) color)
       (define function (sformat "color.~a" component))
       `(,function (color.rgb ,(loop color ctx)))]

      ;; Elements
      [`(anonymous? ,b)
       `(is-no-elt (box-elt ,(loop b ctx)))]
      [`(matches ,b ,sels ...)
       (define b* (loop b ctx))
       (apply smt-or
              (for*/list ([dom doms] [elt (in-elements dom)]
                          #:when (ormap (curryr selector-matches? elt) sels))
                `(= (box-elt ,b*) ,(dump-elt elt))))]

      ;; Extra syntax
      [`(if ,c ,t ,f)
       `(if ,(loop c ctx) ,(loop t ctx) ,(loop f ctx))]
      [`(let ([,vars ,vals] ...) ,body)
       (define vals* (for/list ([val vals]) (loop val ctx)))
       (define ctx*
         (for/fold ([ctx ctx]) ([var vars])
           (dict-set ctx var var)))
       `(let (,@(map list vars vals*)) ,(loop body ctx*))]

      ;; Expandable
      [(list (? (curry dict-has-key? assertion-helpers) fname) args ...)
       (loop (apply (dict-ref assertion-helpers fname) args) ctx)]
      [`(luminance ,color)
       `(lum (color.rgb ,(loop color ctx)))]
      [`(overlaps ,b1 ,b2)
       `(overlaps ,(loop b1 ctx) ,(loop b2 ctx))]
      [`(within ,b1 ,b2)
       `(within-outer ,(loop b1 ctx) ,(loop b2 ctx))]

      [`(raw ,expr)
       `(let (,@(for/list ([(var expr) (in-dict ctx)]) (list var expr)))
          ,expr)]

      ;; Variables
      [(? symbol?)
       (with-handlers ([exn:fail:contract? (λ (e) (raise-user-error 'visual-logic "Could not find ~a (context includes ~a)\n\t~a\n" expr (dict-keys ctx) body))])
           (dict-ref ctx expr))])))
