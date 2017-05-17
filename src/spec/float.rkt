#lang racket
(require "../common.rkt" "../smt.rkt" "utils.rkt")
(provide exclusion-zones)

(define *exclusion-zone-registers* (make-parameter 5))

(support-features!
 (for/list ([i (in-range (+ (*exclusion-zone-registers*) 1))])
   (sformat "float:~a" i)))

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
           (or
            (>= (ez.mark ez) bottom)
            ,@(for/list ([i (in-range (*exclusion-zone-registers*))])
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
                               (- (ite (,(sformat "ez.r~a?" i) ez) (min (,(sformat "ez.r~a" i) ez) pr) pr)
                                  (ite (,(sformat "ez.l~a?" i) ez) (max (,(sformat "ez.l~a" i) ez) pl) pl))))))]
          [results (cons '(ez.mark ez) (for/list ([i (in-range (*exclusion-zone-registers*))])
                                         `(,(sformat "ez.y~a" i) ez)))])
       (match* (conditions results)
        [('() (list else-branch)) else-branch]
        [((cons test conditions) (cons result results))
         `(ite ,test ,result ,(loop conditions results))])))

  ;; Checks if the given point is outside the exclusion zone
  (define-fun ez.out? ((ez EZone) (x Real) (y Real)) Bool
    (and
     ,@(for/list ([i (in-range (*exclusion-zone-registers*))])
         `(or
           (> y (,(sformat "ez.y~a" i) ez))
           (and
            (or (not (,(sformat "ez.r~a?" i) ez)) (< x (,(sformat "ez.r~a" i) ez)))
            (or (not (,(sformat "ez.l~a?" i) ez)) (> x (,(sformat "ez.l~a" i) ez))))))
    (> y (ez.mark ez))))

  (define-fun ez.out-inclusive? ((ez EZone) (x Real) (y Real)) Bool
    (and
     ,@(for/list ([i (in-range (*exclusion-zone-registers*))])
         `(or
           (>= y (,(sformat "ez.y~a" i) ez))
           (and
            (or (not (,(sformat "ez.r~a?" i) ez)) (<= x (,(sformat "ez.r~a" i) ez)))
            (or (not (,(sformat "ez.l~a?" i) ez)) (>= x (,(sformat "ez.l~a" i) ez))))))
    (>= y (ez.mark ez))))
  
  (define-fun ez.in? ((ez EZone) (x Real) (y Real)) Bool
    (not (ez.out? ez x y)))

  (define-fun ez.valid? ((ez EZone)) Bool
    (and
     (=> ,(line-exists? 0) (< (ez.mark ez) (ez.y0 ez)))
     (=> (ez.l0? ez) (ez.r0? ez)
         (<= (ez.l0 ez) (ez.r0 ez)))
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
    (or
     ,@(for/list ([i (in-range (*exclusion-zone-registers*))])
         `(and ,(line-exists? i) (= (,(sformat "ez.y~a" i) ez) bottom)))
     (not ,(line-exists? (- (*exclusion-zone-registers*) 1)))))

  (define-fun ez.test ((ez EZone) (y Real)) Bool
    ;; Assert this property with the normal-flow position of any line box
    (>= y (ez.mark ez)))

  (define-fun ez.in-rect? ((x Real) (y Real) (t Real) (r Real) (b Real) (l Real)) Bool
    (and (<= t y b) (<= l x r))))

(module+ test
  (require "test.rkt")

  (add-header! `((declare-datatypes () ((Float float/left float/right float/none)))))
  (add-header! common-definitions)
  (add-header! exclusion-zones)

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

  ;; ez.x and ez.level spec tests

  (check-sat #hash((pl . Real) (pr . Real) (width . Real) (dir . Float) (y . Real) (ez . EZone))
             `(=> (ez.valid? ez)  (<= pl pr) (>= (- pr pl) width) (not (is-float/none dir))
                  (let ([y* (max (ez.level ez width pl pr y) y)])
                    (<= width (- (ez.right-at ez y* pr) (ez.left-at ez y* pl))))))

  ;; End to end standards tests
  ;; Rule 1
  (check-sat #hash((pl . Real) (pr . Real) (width . Real) (height . Real)
                               (dir . Float) (y . Real) (ez . EZone))
             `(=> (ez.valid? ez) (<= pl pr) (>= (- pr pl) width) (not (is-float/none dir))
                  (let ([y* (max (ez.level ez width pl pr y) y)])
                    (let ([x* (ez.x ez y* dir pl pr)])
                     (ite (is-float/left dir)
                          (>= x* pl)
                          (<= x* pr))))))
  ;; Rule 2
  (check-sat #hash((pl . Real) (pr . Real) (width . Real) (height . Real)
                               (dir . Float) (y . Real) (ez . EZone))
             `(=> (ez.valid? ez) (<= pl pr) (>= (- pr pl) width) (not (is-float/none dir))
                  (let ([y* (max (ez.level ez width pl pr y) y)])
                    (let ([x* (ez.x ez y* dir pl pr)])
                      (=> (>= width 0) (ez.out-inclusive? ez x* y*))))))

  ;; Rule 3
  (check-sat #hash((pl . Real) (pr . Real) (width . Real) (height . Real)
                               (dir . Float) (y . Real) (ez . EZone))
             `(=> (ez.valid? ez) (<= pl pr) (>= (- pr pl) width) (not (is-float/none dir))
                  (let ([y* (max (ez.level ez width pl pr y) y)])
                    (let ([x* (ez.x ez y* dir pl pr)])
                      (=> (>= width 0)
                          (ite (is-float/left dir)
                               (ez.out-inclusive? ez (+ x* width) y*)
                               (ez.out-inclusive? ez (- x* width) y*)))))))

  ;; Rule 7
  (check-sat #hash((pl . Real) (pr . Real) (width . Real) (height . Real)
                               (dir . Float) (y . Real) (ez . EZone))
             `(=> (ez.valid? ez) (<= pl pr) (>= (- pr pl) width) (not (is-float/none dir))
                  (let ([y* (max (ez.level ez width pl pr y) y)])
                    (let ([x* (ez.x ez y* dir pl pr)])
                      (ite (is-float/left dir)
                           (=> (> (+ x* width) pr) (= x* pl))
                           (=> (< (- x* width) pl) (= x* pr)))))))

  )
