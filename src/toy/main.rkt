#lang racket
(require "../common.rkt" "../z3.rkt")

(module+ test
  (require rackunit)

  (define test1
    '(elt ([width . 8] [spec . (= (h ?) 14)])
      (elt ([width . 6] [height . 2] [spec . (= (h ?) 2)])
       (elt ([ratio . 1])))
      (elt ([spec . (=> (= (content-width (parent ?)) 8) (= (h ?) 12))])
       (elt ([width . 4])
        (elt ([ratio . 1])))
       (elt ()
        (elt ([ratio . 1]))))))

  (define test2
    '(elt ([spec . (>= (h ?) 6)])
      (elt ([width . 6] [height . 2] [spec . (= (h ?) 2)])
       (elt ([ratio . 1])))
      (elt ([spec . (>= (h ?) 4)])
       (elt ([width . 4])
        (elt ([ratio . 1])))
       (elt ()
        (elt ([ratio . 1])))))))

(define-syntax-rule (define-by-match v pat ...)
  (define (v x)
    (match x
      [pat true] ...
      [_ false])))

(define-syntax-rule (matches? v pat)
  (match v
    [pat true]
    [_ false]))

(define-by-match document?
  (list 'elt (list (cons (? symbol?) _) ...) (? document?) ...))

(define-by-match rendering?
  (list (list (? number?) (? number?) (? number?) (? number?)) rendering? ...))

(define/contract (layout doc #:width [screen-width 1000])
  (-> document? #:width number? rendering?)
  (let loop ([doc doc] [x 0] [y 0] [w screen-width])
    (match-define (list 'elt props subs ...) doc)
    (define w* (dict-ref props 'width w))
    (define padding (dict-ref props 'padding 0))
    (define-values (y* subrenders*)
      (for/fold ([y* (+ y padding)] [subrenders '()]) ([sub subs])
        (define subrender (loop sub (+ x padding) y* (- w* (* 2 padding))))
        (values (+ y* (fourth (car subrender)))
                (cons subrender subrenders))))
    (define h* (+ (dict-ref props 'height (- y* (+ y padding))) (* 2 padding)))
    (define h+ (if (dict-has-key? props 'ratio) w* 0))
    (cons (list x y w* (+ h* h+)) (reverse subrenders*))))

(module+ test
  (check-equal?
   (layout test1 #:width 10)
   '([0 0 8 14]
     ([0 0 6 2]
      ([0 0 6 6]))
     ([0 2 8 12]
      ([0 2 4 4]
       ([0 2 4 4]))
      ([0 6 8 8]
       ([0 6 8 8]))))))

(define (in-tree x)
  (apply sequence-append (in-value x) (map in-tree (cddr x))))

(define rendering-function
  '(define-fun renders ((b Box)) Bool
       (and
        (= (x b) (ite (is-box (parent b)) (+ (x (parent b)) (padding-value (parent b))) 0.0))
        (= (y b) (ite (is-box (previous b))
                      (+ (y (previous b)) (h (previous b)))
                      (ite (is-box (parent b))
                           (+ (y (parent b)) (padding-value (parent b)))
                           0.0)))
        (= (w b) (ite (is-value (width b))
                      (val (width b))
                      (ite (is-box (parent b))
                           (- (w (parent b)) (* 2 (padding-value (parent b))))
                           view-width)))
        (= (h b)
           (+
            (ite (is-value (height b))
                 (val (height b))
                 (ite (is-box (first b))
                      (+ (- (+ (y (last b)) (h (last b))) (y (first b)))
                         (* 2 (padding-value b)))
                      (* 2 (padding-value b))))
            (ite (is-value (ratio b))
                 (w b)
                 0))))))

(define-by-match template?
  (list 'elt (list (cons (? symbol?) _) ...) (? template?) ...)
  (list 'component (or (? list?) (? symbol?))))

(define/contract (layout->z3 doc #:width [screen-width '?] #:component [component? #f])
  (->* (template?)
       (#:width (or/c number? '?) #:component boolean?)
       (values (listof list?) (-> template? symbol?)))

  (define id
    (let ([ids
           (for/hasheq ([elt (in-tree doc)] [i (in-naturals)])
             (values elt i))])
      (λ (x) (sformat "box~a" (hash-ref ids x)))))

  (values
   `((set-option :produce-unsat-cores true)
     (declare-const view-width Real)

     ,(if (equal? screen-width '?)
          '(assert (> view-width 0))
          '(assert (= view-width ,screen-width)))

     (declare-datatypes () ((Box no-box (box (id Int) (x Real) (y Real) (w Real) (h Real)))))

     ,@(for/reap [sow] ([elt (in-tree doc)])
         (sow `(declare-const ,(id elt) Box))
         (sow `(assert (is-box ,(id elt))))
         (sow `(assert (= (id ,(id elt)) ,(string->number (string-replace (~a (id elt)) "box" ""))))))

     (declare-fun parent (Box) Box)
     (declare-fun next (Box) Box)
     (declare-fun previous (Box) Box)
     (declare-fun first (Box) Box)
     (declare-fun last (Box) Box)

     ,@(if component?
         `((assert (is-box (parent ,(id doc))))
           (assert (is-box (previous ,(id doc))))
           (assert (is-box (next ,(id doc)))))
         '())

     ,@(for/reap [sow] ([elt (in-tree doc)])
         (match-define (list (or 'elt 'component) props children ...) elt)
         (sow `(assert (= (first ,(id elt))
                          ,(if (null? children) 'no-box (id (first children))))))
         (sow `(assert (= (last ,(id elt))
                          ,(if (null? children) 'no-box (id (last children))))))
         (for ([child children] [previous (cons #f children)] [next (cdr (append children (list #f)))])
           (sow `(assert (= (parent ,(id child)) ,(id elt))))
           (sow `(assert (= (previous ,(id child)) ,(if previous (id previous) 'no-box))))
           (sow `(assert (= (next ,(id child)) ,(if next (id next) 'no-box))))))

     (declare-datatypes () ((PValue no-value (value (val Real)))))
     (declare-fun width (Box) PValue)
     (declare-fun height (Box) PValue)
     (declare-fun padding (Box) PValue)
     (declare-fun ratio (Box) PValue)

     ,@(for/reap [sow] ([elt (in-tree doc)])
         (match elt
           [(list 'component property) (void)]
           [(list 'elt props subs ...)
            (define (prop-value prop)
              (if (dict-has-key? props prop) `(value ,(dict-ref props prop)) 'no-value))
            (sow `(assert (= (ratio ,(id elt)) ,(prop-value 'ratio))))
            (sow `(assert (= (width ,(id elt)) ,(prop-value 'width))))
            (sow `(assert (= (height ,(id elt)) ,(prop-value 'height))))
            (sow `(assert (= (padding ,(id elt)) ,(prop-value 'padding))))]))

     (define-fun padding-value ((b Box)) Real
       (ite (is-value (padding b)) (val (padding b)) 0.0))

     (define-fun content-width ((b Box)) Real
       (- (w b) (* 2 (padding-value b))))

     (define-fun good-box ((b Box)) Bool
       (and (>= (w b) (* 2 (padding-value b))) (>= (h b) 0)))

     (assert (forall ((b Box)) (good-box b)))

     ,rendering-function

     ,@(for/list ([elt (in-tree doc)])
         (match elt
           [(list 'component property)
            `(assert (and (renders ,(id elt)) (let ([? ,(id elt)]) ,property)))]
           [(list 'elt props subs ...)
            `(assert (renders ,(id elt)))])))
   id))

(define/contract (model->rendering doc model id)
  (-> template? (hash/c symbol? any/c) (-> template? symbol?) rendering?)
  (let loop ([elt doc])
    (match-define (list 'box _ x y w h) (dict-ref model (id elt)))
    (cons (list x y w h) (map loop (cddr elt)))))

(define/contract (verify doc #:component [component? #f])
  (->* (template?)
       (#:component boolean?)
       (or/c #f rendering?))
  (define-values (query id) (layout->z3 doc #:width '? #:component component?))
  (define query*
    `(,@query
      (assert
       (or ,@(for/list ([elt (in-tree doc)])
               (match elt
                 [(list 'elt props subs ...)
                  (if (dict-has-key? props 'spec)
                      `(not (let ([? ,(id elt)]) ,(dict-ref props 'spec)))
                      'false)]
                 [(list 'component property)
                  'false]))))))
  (match (z3-solve query*)
    [(list 'model model)
     (model->rendering doc model id)]
    [(list 'core _)
     #f]))

(module+ test
  (check-false (verify test1))
  (check-false (verify test2)))

(module+ test
  (check-false
   (verify
    '(elt ([width . 6] [height . 2] [spec . (= (h ?) 2)])
      (elt ([ratio . 1])))
    #:component true))

  (check-false
   (verify
    '(elt ([spec . (=> (= (content-width (parent ?)) 8) (= (h ?) 12))])
       (elt ([width . 4])
        (elt ([ratio . 1])))
       (elt ()
        (elt ([ratio . 1]))))
    #:component true))

  (check-false
   (verify
    '(elt ([width . 8] [spec . (= (h ?) 14)])
      (component (= (h ?) 2))
      (component (=> (= (content-width (parent ?)) 8) (= (h ?) 12))))))

  (check-false
   (verify
    '(elt ([spec . (>= (h ?) 4)])
      (elt ([width . 4])
           (elt ([ratio . 1])))
      (elt ()
           (elt ([ratio . 1]))))
    #:component true))

  (check-false
   (verify
    '(elt ([spec . (>= (h ?) 6)])
      (component (= (h ?) 2))
      (component (>= (h ?) 4))))))

(define (verify/modular doc)
  (-> document? (or/c #f (cons/c template? rendering?)))
  (define parts
    (reap [sow]
          (let loop ([elt doc])
            (match-define (list 'elt props children ...) elt)
            (define elt* (list* 'elt props (map loop children)))
            (if (dict-has-key? props 'spec)
                (begin
                  (sow (cons (equal? elt doc) elt*))
                  (list 'component (dict-ref props 'spec)))
                elt*))))
  (for/or ([part parts])
    (match (verify (cdr part) #:component (not (car part)))
      [#f
       #f]
      [rendering
       (cons part rendering)])))

(module+ test
  (check-false (verify/modular test1))
  (check-false (verify/modular test2)))
