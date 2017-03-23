#lang racket
(require "../common.rkt" "../smt.rkt" "utils.rkt")
(provide exclusion-zones)

(define *exclusion-zone-registers* (make-parameter 3))

(support-features!
 (for/list ([i (in-range (*exclusion-zone-registers*))])
   (sformat "float:~a" (+ i 1))))

(define (line-exists? i)
  `(or (,(sformat "ez.l~a?" i) ez) (,(sformat "ez.r~a?" i) ez)))

(define-constraints exclusion-zones
  (declare-datatypes ()
     ((EZone (ezone (ez.mark Real)
                    ,@(for/reap [sow] ([i (in-range (*exclusion-zone-registers*))])
                        (sow (list (sformat "ez.y~a" i) 'Real))
                        (sow (list (sformat "ez.l~a" i) 'Real))
                        (sow (list (sformat "ez.r~a" i) 'Real))
                        (sow (list (sformat "ez.l~a?" i) 'Bool))
                        (sow (list (sformat "ez.r~a?" i) 'Bool)))))))

  (define-fun ez.init ((y Real)) EZone
    (ezone y
           ,@(for/reap [sow] ([i (in-range (*exclusion-zone-registers*))])
               (sow 0.0)
               (sow 0.0)
               (sow 0.0)
               (sow 'false)
               (sow 'false))))

  (define-fun ez.add ((ez EZone) (dir Float) (top Real) (right Real) (bottom Real) (left Real)) EZone
    ;; Only call if `ez` has already had `ez.advance` called on it.
    (let ([overwrites?
           (or ,@(for/list ([i (in-range (*exclusion-zone-registers*))])
                   `(and ,(line-exists? i) (= (,(sformat "ez.y~a" i) ez) bottom))))])
      (ezone
       (ez.mark ez)
       ,@(for/reap [sow] ([i (in-range (*exclusion-zone-registers*))])
           (define (copy-register tpl #:merge merge #:new new)
             (smt-cond
              [(and (<= (,(sformat "ez.y~a" i) ez) bottom) ,(line-exists? i))
               ,merge]
              [overwrites?
               (,(sformat tpl i) ez)]
              [else
               ,(if (= i 0)
                    new
                    `(ite (and (< (,(sformat "ez.y~a" (- i 1)) ez) bottom) ,(line-exists? (- i 1)))
                         ,new
                         (,(sformat tpl (- i 1)) ez)))]))

           (sow (copy-register "ez.y~a" #:merge `(,(sformat "ez.y~a" i) ez) #:new `bottom))
           (sow (copy-register "ez.l~a" #:new `right
                               #:merge `(max-if (,(sformat "ez.l~a" i) ez) (is-float/left dir) right)))
           (sow (copy-register "ez.r~a" #:new `left
                               #:merge `(min-if (,(sformat "ez.r~a" i) ez) (is-float/right dir) left)))
           (sow (copy-register "ez.l~a?" #:new `(is-float/left dir)
                               #:merge `(or (,(sformat "ez.l~a?" i) ez) (is-float/left dir))))
           (sow (copy-register "ez.r~a?" #:new `(is-float/right dir)
                               #:merge `(or (,(sformat "ez.r~a?" i) ez) (is-float/right dir))))))))

  (define-fun ez.advance ((ez EZone) (y Real)) EZone
    (ezone
     (max (ez.mark ez) y)
     ,@(let ([transfer (λ (i tpl default)
                   (for/fold ([expr `(,(sformat tpl i) ez)])
                       ([j (in-range (*exclusion-zone-registers*))])
                     `(ite (and (<= (,(sformat "ez.y~a" j) ez) y) ,(line-exists? j))
                          ,(if (< (+ i j 1) (*exclusion-zone-registers*))
                               `(,(sformat tpl (+ i j 1)) ez)
                               default)
                          ,expr)))])
         (for/reap [sow] ([i (in-range (*exclusion-zone-registers*))])
           (sow (transfer i "ez.y~a" 0.0))
           (sow (transfer i "ez.l~a" 0.0))
           (sow (transfer i "ez.r~a" 0.0))
           (sow (transfer i "ez.l~a?" 'false))
           (sow (transfer i "ez.r~a?" 'false))))))

  (define-fun ez.x ((ez EZone) (y Real) (dir Float) (pl Real) (pr Real)) Real
    ;; y is the y-position of the box
    ;; dir is the float direction
    ;; pl and pr are the parent's content left and right
    ,(for/fold ([x `(ite (is-float/left dir) pl pr)]) ([i (in-range (*exclusion-zone-registers*))])
       `(ite (and (< y (,(sformat "ez.y~a" i) ez)) ,(line-exists? i))
            (ite (is-float/left dir)
                (ite (,(sformat "ez.l~a?" i) ez) (,(sformat "ez.l~a" i) ez) pl)
                (ite (,(sformat "ez.r~a?" i) ez) (,(sformat "ez.r~a" i) ez) pr))
            ,x)))

  (define-fun ez.level ((ez EZone) (width Real) (pl Real) (pr Real) (y Real)) Real
    ;; width is the dimensions of the box
    ;; y is the normal-flow y-position of the box
    ;; pl and pr are the parent's content left and right
    ;; The returned value is a y* such that the box should be placed at (max y y*)
    ,(let loop
         ([conditions (for/list ([i (in-range (*exclusion-zone-registers*))])
                        `(or 
                          (and (not (,(sformat "ez.l~a?" i) ez)) (not (,(sformat "ez.r~a?" i) ez)))
                          (and
                           (< y (,(sformat "ez.y~a" i) ez))
                           (<= width
                               (- (ite (,(sformat "ez.r~a?" i) ez) (,(sformat "ez.r~a" i) ez) pr)
                                  (ite (,(sformat "ez.l~a?" i) ez) (,(sformat "ez.l~a" i) ez) pl))))))]
          [results (cons '(ez.mark ez) (for/list ([i (in-range (*exclusion-zone-registers*))])
                                         `(,(sformat "ez.y~a" i) ez)))])
       (match* (conditions results)
        [('() (list else-branch)) else-branch]
        [((cons test conditions) (cons result results))
         `(ite ,test ,result ,(loop conditions results))])))

  (define-fun ez.max ((ez EZone)) Real
    ,(for/fold ([expr '(ez.mark ez)]) ([i (in-range (*exclusion-zone-registers*))])
       `(ite ,(line-exists? i)
             (,(sformat "ez.y~a" i) ez)
             ,expr)))

  (define-fun ez.can-add ((ez EZone) (bottom Real)) Bool
    ;; Assert this property after advancing an ezone but before adding to it.
    (or
     ,@(for/list ([i (in-range (*exclusion-zone-registers*))])
         `(and ,(line-exists? i) (= (,(sformat "ez.y~a" i) ez) bottom)))
     (not ,(line-exists? (- (*exclusion-zone-registers*) 1)))))

  (define-fun ez.test ((ez EZone) (y Real)) Bool
    ;; Assert this property with the normal-flow position of any line box
    (>= y (ez.mark ez))))

(module+ test
  (require "../z3.rkt")
  (require rackunit)

  (define (check-sat expr)
    (check-match
     (z3-solve
      `((set-option :produce-unsat-cores true)
        (declare-datatypes () ((Float float/left float/right float/none)))
        ,@common-definitions
        ,@exclusion-zones
       
       
        (assert ,expr)))
     (list 'model _)))

  (check-sat
   `(= (ez.add (ez.init 0.0) float/left 0.0 240.0 824.0 0.0)
       (ezone 0.0
              824.0 240.0 0.0 true false
              ,@(for/reap [sow] ([i (in-range 1 (*exclusion-zone-registers*))])
                  (for-each sow '(0.0 0.0 0.0 false false))))))

  (check-sat
    `(= (ez.level (ez.add (ez.init 0.0) float/left 0.0 240.0 824.0 0.0) 240.0 0.0 960.0 0.0) 0.0))

  (check-sat
   `(= (ez.x (ez.add (ez.init 0.0) float/left 0.0 240.0 824.0 0.0) 0.0 float/left 0.0 960.0) 240.0))

  (check-sat
   `(= (ez.advance (ez.add (ez.init 30.0) float/left 30.0 500.0 84.0 0.0) 30.0)
       (ez.add (ez.init 30.0) float/left 30.0 500.0 84.0 0.0))))
