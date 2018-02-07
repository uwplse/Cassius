#lang racket
(require "../common.rkt" "../smt.rkt" "utils.rkt")
(provide exclusion-zones ez-fields *exclusion-zone-registers*)

(define *exclusion-zone-registers* (make-parameter 5))

(support-features!
 (for/list ([i (in-range (+ (*exclusion-zone-registers*) 1))])
   (sformat "float:~a" i)))

(define (line-exists? i)
  `(or (,(sformat "ez.l~a?" i) ez) (,(sformat "ez.r~a?" i) ez)))

(define-constraints exclusion-zones
  (declare-datatypes ()
     ((EZone (ezone (ez.mark Real) (ez.mark? Bool)
                    ,@(for/reap [sow] ([i (in-range (*exclusion-zone-registers*))])
                        (sow (list (sformat "ez.y~a" i) 'Real))
                        (sow (list (sformat "ez.l~a" i) 'Real))
                        (sow (list (sformat "ez.r~a" i) 'Real))
                        (sow (list (sformat "ez.l~a?" i) 'Bool))
                        (sow (list (sformat "ez.r~a?" i) 'Bool)))))))

  (define-fun ez.init () EZone
    (ezone 0.0 false
           ,@(for/reap [sow] ([i (in-range (*exclusion-zone-registers*))])
               (sow 0.0)
               (sow 0.0)
               (sow 0.0)
               (sow 'false)
               (sow 'false))))

  (define-fun ez.init-at ((mark Real)) EZone
    (ezone mark true
           ,@(for/reap [sow] ([i (in-range (*exclusion-zone-registers*))])
               (sow 0.0)
               (sow 0.0)
               (sow 0.0)
               (sow 'false)
               (sow 'false))))

  (define-fun ez.add ((ez EZone) (dir Float) (top Real) (right Real) (bottom Real) (left Real)) EZone
    ;; Only call if `ez` has already had `ez.advance` called on it.
    (let ([overwrites?
           (or
            (and (ez.mark? ez) (>= (ez.mark ez) bottom))
            ,@(for/list ([i (in-range (*exclusion-zone-registers*))])
                `(and ,(line-exists? i) (= (,(sformat "ez.y~a" i) ez) bottom))))])
      (ezone
       (ez.mark ez) (ez.mark? ez)
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
           (sow (copy-register "ez.l~a" #:new `(ite (is-float/left dir)
                                                    (ite (,(sformat "ez.l~a?" i) ez)
                                                         (max (,(sformat "ez.l~a" i) ez) right)
                                                         right)
                                                    (,(sformat "ez.l~a" i) ez))
                               #:merge `(ite (is-float/left dir) 
                                             (ite (,(sformat "ez.l~a?" i) ez)
                                                  (max (,(sformat "ez.l~a" i) ez) right)
                                                  right)
                                             (,(sformat "ez.l~a" i) ez))))
           (sow (copy-register "ez.r~a" #:new `(ite (is-float/right dir)
                                                    (ite  (,(sformat "ez.r~a?" i) ez)
                                                          (min (,(sformat "ez.r~a" i) ez) left)
                                                          left)
                                                    (,(sformat "ez.r~a" i) ez))
                               #:merge `(ite (is-float/right dir)
                                             (ite (,(sformat "ez.r~a?" i) ez)
                                                  (min (,(sformat "ez.r~a" i) ez) left)
                                                  left)
                                             (,(sformat "ez.r~a" i) ez))))
           (sow (copy-register "ez.l~a?" #:new `(or (,(sformat "ez.l~a?" i) ez) (is-float/left dir))
                               #:merge `(or (,(sformat "ez.l~a?" i) ez)
                                            (and
                                             (is-float/left dir)
                                             (<= (,(sformat "ez.y~a" i) ez) bottom)))))
           (sow (copy-register "ez.r~a?" #:new `(or (,(sformat "ez.r~a?" i) ez) (is-float/right dir))
                               #:merge `(or (,(sformat "ez.r~a?" i) ez)
                                            (and
                                             (is-float/right dir)
                                             (<= (,(sformat "ez.y~a" i) ez) bottom)))))))))

  (define-fun ez.advance ((ez EZone) (y Real)) EZone
    (ezone
     (ite (ez.mark? ez) (max (ez.mark ez) y) y)
     true
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

  (define-fun ez.left-at ((ez EZone) (y Real) (pl Real)) Real
    ,(for/fold ([expr `pl]) ([i (in-range (- (*exclusion-zone-registers*) 1) -1 -1)])
       `(ite (< y (,(sformat "ez.y~a" i) ez))
             (ite (,(sformat "ez.l~a?" i) ez)
                  (max (,(sformat "ez.l~a" i) ez) pl)
                  pl)
             ,expr)))

  (define-fun ez.right-at ((ez EZone) (y Real) (pr Real)) Real
    ,(for/fold ([expr `pr]) ([i (in-range (- (*exclusion-zone-registers*) 1) -1 -1)])
       `(ite (< y (,(sformat "ez.y~a" i) ez))
             (ite (,(sformat "ez.r~a?" i) ez)
                  (min (,(sformat "ez.r~a" i) ez) pr)
                  pr)
             ,expr)))

  (define-fun ez.x ((ez EZone) (y Real) (dir Float) (pl Real) (pr Real)) Real
    ;; y is the y-position of the box
    ;; dir is the float direction
    ;; pl and pr are the parent's content left and right
    (ite (is-float/left dir) (ez.left-at ez y pl) (ez.right-at ez y pr)))

  (define-fun ez.left-max ((ez EZone)) Real
    ,(for/fold ([expr `(ez.mark ez)]) ([i (in-range (*exclusion-zone-registers*))])
       `(ite (,(sformat "ez.l~a?" i) ez)
             (,(sformat "ez.y~a" i) ez)
             ,expr)))

  (define-fun ez.right-max ((ez EZone)) Real
    ,(for/fold ([expr `(ez.mark ez)]) ([i (in-range (*exclusion-zone-registers*))])
       `(ite (,(sformat "ez.r~a?" i) ez)
             (,(sformat "ez.y~a" i) ez)
             ,expr)))

  (define-fun ez.level ((ez EZone) (width Real) (pl Real) (pr Real) (y Real) (dir Float)) Real
    ;; width is the dimensions of the box
    ;; y is the normal-flow y-position of the box
    ;; pl and pr are the parent's content left and right
    ;; The returned value is a y* such that the box should be placed at (max y y*)
    (max-if y
            (ez.mark? ez)
            ,(let loop
               ([conditions (for/list ([i (in-range (*exclusion-zone-registers*))])
                              `(or
                                (and (not (,(sformat "ez.l~a?" i) ez)) (not (,(sformat "ez.r~a?" i) ez)))
                                (and
                                 (< y (,(sformat "ez.y~a" i) ez))
                                 (ite (< (- pr pl) width)
                                      (ite (is-float/left dir)
                                           (and
                                            (=> (,(sformat "ez.r~a?" i) ez)
                                                (<= (max (+ pl width) pl) (,(sformat "ez.r~a" i) ez)))
                                            (not (,(sformat "ez.l~a?" i) ez)))
                                           (and
                                            (=> (,(sformat "ez.l~a?" i) ez)
                                                (>= (min (- pr width) pr) (,(sformat "ez.l~a" i) ez)))
                                            (not (,(sformat "ez.r~a?" i) ez))))
                                      (<= (max width 0.0)
                                          (- (ite (,(sformat "ez.r~a?" i) ez) (min (,(sformat "ez.r~a" i) ez) pr) pr)
                                             (ite (,(sformat "ez.l~a?" i) ez) (max (,(sformat "ez.l~a" i) ez) pl) pl)))))))]
                [results (cons '(ez.mark ez) (for/list ([i (in-range (*exclusion-zone-registers*))])
                                               `(,(sformat "ez.y~a" i) ez)))])
               (match* (conditions results)
                 [('() (list else-branch)) else-branch]
                 [((cons test conditions) (cons result results))
                  `(ite ,test ,result ,(loop conditions results))]))))

  ;; Checks if the given point is outside the exclusion zone
  (define-fun ez.out? ((ez EZone) (x Real) (y Real)) Bool
    (and
     ,@(for/list ([i (in-range (*exclusion-zone-registers*))])
         `(or
           (> y (,(sformat "ez.y~a" i) ez))
           (and
            (or (not (,(sformat "ez.r~a?" i) ez)) (< x (,(sformat "ez.r~a" i) ez)))
            (or (not (,(sformat "ez.l~a?" i) ez)) (> x (,(sformat "ez.l~a" i) ez))))))
    (=> (ez.mark? ez) (> y (ez.mark ez)))))

  (define-fun ez.out-inclusive? ((ez EZone) (x Real) (y Real)) Bool
    (and
     ,@(for/list ([i (in-range (*exclusion-zone-registers*))])
         `(or
           (>= y (,(sformat "ez.y~a" i) ez))
           (and
            (or (not (,(sformat "ez.r~a?" i) ez)) (<= x (,(sformat "ez.r~a" i) ez)))
            (or (not (,(sformat "ez.l~a?" i) ez)) (>= x (,(sformat "ez.l~a" i) ez))))))
    (=> (ez.mark? ez) (>= y (ez.mark ez)))))
  
  (define-fun ez.in? ((ez EZone) (x Real) (y Real)) Bool
    (not (ez.out? ez x y)))

  (define-fun ez.valid? ((ez EZone)) Bool
    (and
     ,(if (> (*exclusion-zone-registers*) 0)
          `(and
            (=> ,(line-exists? 0) (and (ez.mark? ez) (< (ez.mark ez) (ez.y0 ez))))
            (=> (ez.l0? ez) (ez.r0? ez) (<= (ez.l0 ez) (ez.r0 ez))))
          `true)
     ,@(for/list ([i (in-range 1 (*exclusion-zone-registers*))])
         `(and
           (=> (,(sformat "ez.l~a?" i) ez)
               (and
                (,(sformat "ez.l~a?" (- i 1)) ez)
                (>= (,(sformat "ez.l~a" (- i 1)) ez) (,(sformat "ez.l~a" i) ez))))
           (=> (,(sformat "ez.r~a?" i) ez)
               (and
                (,(sformat "ez.r~a?" (- i 1)) ez)
                (<= (,(sformat "ez.r~a" (- i 1)) ez) (,(sformat "ez.r~a" i) ez))))
           (=> ,(line-exists? i)
             (< (,(sformat "ez.y~a" (- i 1)) ez) (,(sformat "ez.y~a" i) ez)))
           (=> (,(sformat "ez.l~a?" i) ez) (,(sformat "ez.r~a?" i) ez)
               (<= (,(sformat "ez.l~a" i) ez) (,(sformat "ez.r~a" i) ez)))))))
  
  (define-fun ez.max ((ez EZone)) Real
    ,(for/fold ([expr '(ez.mark ez)]) ([i (in-range (*exclusion-zone-registers*))])
       `(ite ,(line-exists? i)
             (,(sformat "ez.y~a" i) ez)
             ,expr)))

  (define-fun ez.can-add ((ez EZone) (bottom Real)) Bool
    ;; Assert this property after advancing an ezone but before adding to it.
    ,(if (> (*exclusion-zone-registers*) 0)
         `(or
           ,@(for/list ([i (in-range (*exclusion-zone-registers*))])
               `(and ,(line-exists? i) (= (,(sformat "ez.y~a" i) ez) bottom)))
           (not ,(line-exists? (- (*exclusion-zone-registers*) 1))))
         'false))

  (define-fun ez.test ((ez EZone) (y Real)) Bool
    ;; Assert this property with the normal-flow position of any line box
    (or (>= y (ez.mark ez)) (not (ez.mark? ez))))

  (define-fun ez.in-rect? ((x Real) (y Real) (t Real) (r Real) (b Real) (l Real)) Bool
    (and (<= t y b) (<= l x r))))

(module+ test
  (require "test.rkt")

  (add-header! `((declare-datatypes () ((Float float/left float/right float/none)))))
  (add-header! (common-definitions))
  (add-header! (exclusion-zones))

  ;; ez.add spec tests
  (check-sat #hash((x . Real) (y . Real) (t . Real) (r . Real)
                   (b . Real) (l . Real) (dir . Float) (ez . EZone))
             `(=> (not (is-float/none dir)) (ez.can-add ez b) (ez.valid? ez)
                  (= (ez.in? (ez.add ez dir t r b l) x y)
                     (or 
                      (ez.in? ez x y)
                      (ite (is-float/left dir)
                           (and (<= x r) (<= y b))
                           (and (>= x l) (<= y b)))))))

  (check-sat #hash((x . Real) (y . Real) (t . Real) (r . Real)
                   (b . Real) (l . Real) (dir . Float) (ez . EZone))
             `(=> (not (is-float/none dir)) (ez.can-add ez b) (ez.valid? ez)
                  (ez.out-inclusive? ez l b) (ez.out-inclusive? ez r b)
                  (ez.out-inclusive? ez l t) (ez.out-inclusive? ez r t)
                  
                  (ez.valid? (ez.add (ez.advance ez t) dir t r b l))))
  
  ;; ez.advance spec tests
  (check-sat #hash((x . Real) (y . Real) (h . Real) (ez . EZone))
             `(=> (ez.valid? ez)
                  (= (ez.in? (ez.advance ez h) x y)
                     (or (ez.in? ez x y) (<= y h)))))

  (check-sat #hash((x . Real) (y . Real) (h . Real) (ez . EZone))
             `(=> (ez.valid? ez) (ez.valid? (ez.advance ez h))))

  ;; ez.level spec tests

  (check-sat #hash((pl . Real) (pr . Real) (width . Real) (dir . Float) (y . Real) (ez . EZone))
             `(=> (ez.valid? ez)  (<= pl pr) (>= (- pr pl) width) (not (is-float/none dir))
                  (let ([y* (ez.level ez width pl pr y dir)])
                    (<= width (- (ez.right-at ez y* pr) (ez.left-at ez y* pl))))))

  ;; End to end standards tests
  ;; Rule 1
  (check-sat #hash((pl . Real) (pr . Real) (width . Real) (height . Real)
                               (dir . Float) (y . Real) (ez . EZone))
             `(=> (ez.valid? ez) (<= pl pr) (not (is-float/none dir))
                  (let ([y* (ez.level ez width pl pr y dir)])
                    (let ([x* (ez.x ez y* dir pl pr)])
                     (ite (is-float/left dir)
                          (>= x* pl)
                          (<= x* pr))))))
  ;; Rule 2
  (check-sat #hash((pl . Real) (pr . Real) (width . Real) (height . Real)
                               (dir . Float) (y . Real) (ez . EZone))
             `(=> (ez.valid? ez) (<= pl pr) (not (is-float/none dir))
                  (let ([y* (ez.level ez width pl pr y dir)])
                    (let ([x* (ez.x ez y* dir pl pr)])
                      (ez.out-inclusive? ez x* y*)))))

  ;; Rule 3
  (check-sat #hash((pl . Real) (pr . Real) (width . Real) (height . Real)
                               (dir . Float) (y . Real) (ez . EZone))
             `(=> (ez.valid? ez) (<= pl pr) (not (is-float/none dir))
                  (let ([y* (ez.level ez width pl pr y dir)])
                    (let ([x* (ez.x ez y* dir pl pr)])
                      (=> (>= width 0.0)
                          (ite (is-float/left dir)
                               (ez.out-inclusive? ez (+ x* width) y*)
                               (ez.out-inclusive? ez (- x* width) y*)))))))

  ;; Rule 7
  (check-sat #hash((pl . Real) (pr . Real) (width . Real) (height . Real)
                               (dir . Float) (y . Real) (ez . EZone))
             `(=> (ez.valid? ez) (<= pl pr) (< (- pr pl) width) (not (is-float/none dir))
                  (let ([y* (ez.level ez width pl pr y dir)])
                    (let ([x* (ez.x ez y* dir pl pr)])
                      (ite (is-float/left dir)
                           (=> (> (+ x* width) pr) (= x* pl))
                           (=> (< (- x* width) pl) (= x* pr)))))))

  ;; ez.left-at
  (check-sat #hash((pl . Real) (width . Real) (height . Real) (y . Real) (mark . Real))
             `(=> (> height mark)
                  (let ([ez (ez.add (ez.init-at mark) float/left mark width height 0.0)])
                    (ite (>= y height)
                     (= (ez.left-at ez y pl) pl)
                     (= (ez.left-at ez y pl) (max width pl))))))

  (check-sat #hash((pl . Real) (x . Real) (y . Real) (ez . EZone))
             `(=> (ez.valid? ez) (>= y (ez.mark ez))
                  (< x (ez.left-at ez y pl))
                  (or (ez.in? ez x y) (< x pl))))

  ;; ez.right-at
  (check-sat #hash((pr . Real) (width . Real) (height . Real) (y . Real) (mark . Real))
             `(=> (> height mark)
                  (let ([ez (ez.add (ez.init-at mark) float/right mark 0.0 height width)])
                    (ite (>= y height)
                     (= (ez.right-at ez y pr) pr)
                     (= (ez.right-at ez y pr) (min width pr))))))

  (check-sat #hash((pr . Real) (x . Real) (y . Real) (ez . EZone))
             `(=> (ez.valid? ez) (>= y (ez.mark ez))
                  (> x (ez.right-at ez y pr))

                  (or (ez.in? ez x y) (> x pr))))

  ;; Both ez.left-at and ez.right-at
  (check-sat #hash((pl . Real) (pr . Real) (x . Real) (y . Real) (ez . EZone))
             `(=> (or (not (ez.mark? ez)) (>= y (ez.mark ez))) (ez.valid? ez) (<= pl pr)
                  (< (ez.left-at ez y pl) x (ez.right-at ez y pr))

                  (ez.out-inclusive? ez x y)))

  ;; Rule 8 & 9 together
  (check-sat #hash((pl . Real) (pr . Real) (y-normal . Real) (width . Real) (y . Real) (x . Real) (ez . EZone) (dir . Float))
             `(=> (<= pl pr) (ez.valid? ez) (not (is-float/none dir))
                  (let ([y* (ez.level ez width pl pr y-normal dir)])
                    (let ([x* (ez.x ez y* dir pl pr)])
                      (=> (and ; (x, y) a valid place to put the box
                           (>= y y-normal)
                           (ez.out-inclusive? ez x y)
                           (<= pl x pr)
                           (=> (>= width 0.0)
                               (let ([xo (ite (is-float/left dir) (+ x width) (- x width))])
                                 (and (ez.out-inclusive? ez xo y)
                                      (ite (> (+ width pl) pr)
                                           (and (>= y (ite (is-float/left dir) (ez.left-max ez) (ez.right-max ez)))
                                                (= x (ite (is-float/left dir) pl pr)))
                                           (<= pl xo pr))))))
                          (or (> y y*) ; below
                              (and (= y y*) ; or at least further from the side
                                   (ite (is-float/left dir)
                                        (>= x x*)
                                        (<= x x*)))))))))

  ;; ez.left-max
  (check-sat #hash((pl . Real) (y . Real) (ez . EZone))
             `(=> (ez.valid? ez) (>= y (ez.left-max ez))
                  (= (ez.left-at ez y pl) pl)))

  ;; ez.right-max
  (check-sat #hash((pr . Real) (y . Real) (ez . EZone))
             `(=> (ez.valid? ez) (>= y (ez.right-max ez))
                  (= (ez.right-at ez y pr) pr)))

  ;; Pavel's test
  (check-sat #hash((pl . Real) (pr . Real) (y-normal . Real) (width . Real) (ez . EZone) (dir . Float))
             `(=> (<= pl pr) (ez.valid? ez) (not (is-float/none dir))
                  (let ([y (ez.level ez width pl pr y-normal dir)])
                    (let ([x (ez.x ez y dir pl pr)])
                      (and ; (x, y) a valid place to put the box
                       (>= y y-normal)
                       (ez.out-inclusive? ez x y)
                       (<= pl x pr)
                       (=> (>= width 0.0)
                           (let ([xo (ite (is-float/left dir) (+ x width) (- x width))])
                             (and (ez.out-inclusive? ez xo y)
                                  (ite (> (+ width pl) pr)
                                       (and (=> (ez.mark? ez)
                                             (>= y (ite (is-float/left dir) (ez.left-max ez) (ez.right-max ez))))
                                            (= x (ite (is-float/left dir) pl pr)))
                                       (<= pl xo pr))))))))))

  ;; Regression test for floats-rule3-outside-left-001
  (check-sat #hash((y . Real))
             `(=> (= y (ez.level (ez.add (ez.init-at 8.0) float/right 8.0 508.0 308.0 458.0) 425.0 8.0 408.0 8.0 float/left))
                  (= y 8.0))))

(define-constraints ez-fields

  ;; The "in" and "out" EZones track EZones in-order through the tree
  (declare-fun ez.in (Box) EZone)
  (declare-fun ez.out (Box) EZone)

  (assert
   (forall ((b Box))
           (= (ez.in b)
              (ite (is-no-box (vbox b))
                   (ite (or (is-no-box (pbox b)) (is-flow-root (pbox b)))
                        ez.init
                        (ez.in (pbox b)))
                   (ez.out (vbox b))))))

  ;; "sufficient" determines whether we there's room to add to an EZone
  ;; The idea here is that if there are not enough registers,
  ;; so that you can *not* add, then we want to provide
  ;; maximum freedom to ez.out, to try to ensure SAT, so we
  ;; can look inside the model, see that it's not sufficient,
  ;; and then restart with more registers.
  (assert
   (forall ((b Box))
           (= (ez.sufficient b)
              (=>
               (and (is-box/block (type b)) (not (or (is-position/absolute (position b)) (is-position/fixed (position b)))) (not (is-float/none (float b))))
               (ez.can-add (ez.advance (ez.in b) (top-outer b)) (bottom-outer b))))))

  (assert
   (forall ((b Box))
           (=> (ez.sufficient b)
               (= (ez.out b)
                  (ite (and (is-box/block (type b)) (not (or (is-position/absolute (position b)) (is-position/fixed (position b)))) (not (is-float/none (float b))))
                       (ez.add (ez.advance (ez.in b) (top-outer b)) (float b) (top-outer b) (right-outer b) (bottom-outer b) (left-outer b))
                       ,(smt-cond
                         [(is-box/root (type b)) (ez.out (lbox b))]
                         [(is-flow-root b) (ez.in b)]
                         [(is-box (lbox b)) (ez.out (lbox b))]
                         [else (ez.in b)])))))))
