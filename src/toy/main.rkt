#lang racket
(require "common.rkt" "z3.rkt")

(module+ test
  (require rackunit)
  (define-syntax-rule (check-forall (vars ...) property)
    (void)))

(define-syntax-rule (define-by-match v pat ...)
  (define (v x)
    (match x
      [pat true] ...
      [_ false])))

(define-by-match document?
  (list (? number?))
  (list (list (list (? symbol?) (? number?)) ...) (? document?) ...))

(define-by-match rendering?
  (list (list (? number?) (? number?) (? number?) (? number?)) rendering? ...))

(define/contract (layout doc #:width [screen-width 1000])
  (-> document? #:width number? rendering?)
  (let loop ([doc doc] [x 0] [y 0] [w screen-width])
    (match doc
      [(list (? number? area)) (list (list x y w (/ area w)))]
      [(list (list (list key val) ...) subs ...)
       (define props (map cons key val))
       (define w* (dict-ref props 'width w))
       (define padding (dict-ref props 'padding 0))
       (define-values (y* subrenders*)
         (for/fold ([y* (+ y padding)] [subrenders '()]) ([sub subs])
           (define subrender (loop sub (+ x padding) y* (- w* (* 2 padding))))
           (values (+ y* (fourth (car subrender)))
                   (cons subrender subrenders))))
       (define h* (+ (dict-ref props 'height (- y* (+ y padding))) (* 2 padding)))
       (cons (list x y w* h*) (reverse subrenders*))])))

(module+ test
  (check-equal?
   (layout '(([width 8])
             (([width 6] [height 2])
              (18))
             (()
              (([width 4])
               (12))
              (()
               (32))))
           #:width 10)
   '([0 0 8 9]
     ([0 0 6 2]
      ([0 0 6 3]))
     ([0 2 8 7]
      ([0 2 4 3]
       ([0 2 4 3]))
      ([0 5 8 4]
       ([0 5 8 4])))))

  (check-equal?
   (layout '(([width 8])
             (([width 6] [height 2])
              (18))
             (([padding 1])
              (([width 4])
               (12))
              (()
               (32))))
           #:width 10)
   `([0 0 8 ,(+ 12 1/3)]
     ([0 0 6 2]
      ([0 0 6 3]))
     ([0 2 8 ,(+ 10 1/3)]
      ([1 3 4 3]
       ([1 3 4 3]))
      ([1 6 6 ,(+ 5 1/3)]
       ([1 6 6 ,(+ 5 1/3)]))))))

(define (in-tree x)
  (apply sequence-append (in-value x) (map in-tree (cdr x))))

(define/contract (layout->z3 doc #:width [screen-width '?])
  (-> document? #:width (or/c number? '?) (values (listof list?) (-> document? symbol?)))

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

     (assert (= (parent ,(id doc)) no-box))
     (assert (= (previous ,(id doc)) no-box))
     (assert (= (next ,(id doc)) no-box))

     ,@(for/reap [sow] ([elt (in-tree doc)])
         (sow `(assert (= (first ,(id elt)) ,(if (null? (cdr elt)) 'no-box (id (cadr elt))))))
         (sow `(assert (= (last ,(id elt)) ,(if (null? (cdr elt)) 'no-box (id (last (cdr elt)))))))
         (for ([child (cdr elt)] [previous (cons #f (cdr elt))] [next (cdr (append (cdr elt) (list #f)))])
           (sow `(assert (= (parent ,(id child)) ,(id elt))))
           (sow `(assert (= (previous ,(id child)) ,(if previous (id previous) 'no-box))))
           (sow `(assert (= (next ,(id child)) ,(if next (id next) 'no-box))))))
    
     (declare-datatypes () ((PValue no-value (value (val Real)))))
     (declare-fun width (Box) PValue)
     (declare-fun height (Box) PValue)
     (declare-fun padding (Box) PValue)
     (declare-fun area (Box) PValue)

     ,@(for/reap [sow] ([elt (in-tree doc)])
        (match elt
          [(list (? number? area))
           (sow `(assert (= (area ,(id elt)) (value ,area))))
           (sow `(assert (= (width ,(id elt)) no-value)))
           (sow `(assert (= (height ,(id elt)) no-value)))
           (sow `(assert (= (padding ,(id elt)) no-value)))]
          [(list (list (list key val) ...) subs ...)
           (define prop-value
             (let ([props (map cons key val)])
               (λ (prop) (if (dict-has-key? props prop) `(value ,(dict-ref props prop)) 'no-value))))
           (sow `(assert (= (area ,(id elt)) no-value)))
           (sow `(assert (= (width ,(id elt)) ,(prop-value 'width))))
           (sow `(assert (= (height ,(id elt)) ,(prop-value 'height))))
           (sow `(assert (= (padding ,(id elt)) ,(prop-value 'padding))))]))

     (define-fun padding-value ((b Box)) Real
       (ite (is-value (padding b)) (val (padding b)) 0.0))
     
     (define-fun renders ((b Box)) Bool
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
        (= (h b) (ite (is-value (height b))
                      (val (height b))
                      (ite (is-value (area b))
                           (/ (val (area b)) (w b))
                           (ite (is-box (first b))
                                (+ (- (+ (y (last b)) (h (last b))) (y (first b)))
                                   (* 2 (padding-value b)))
                                (* 2 (padding-value b))))))))

     ,@(for/list ([elt (in-tree doc)])
         `(assert (renders ,(id elt)))))
   id))

(define/contract (model->rendering doc model id)
  (-> document? any/c (-> document? symbol?) rendering?)
  (let loop ([elt doc])
    (match-define (list 'box _ x y w h) (dict-ref model (id elt)))
    (cons (list x y w h) (map loop (cdr elt)))))

(define/contract (layout/z3 doc #:width [screen-width '?])
  (-> document? #:width number? (listof list?))
  (define-values (query id) (layout->z3 doc #:width screen-width))
  (match-define (list 'model model) (z3-solve query))
  (model->rendering doc model id))

(module+ test
  (check-forall ([x document?] [w real?])
    (equal? (layout doc #:width w) (layout/z3 doc #:width w))))

(define/contract (verify doc property)
  (-> document? (or/c list? symbol?) (or/c #f (list/c (or/c real? #f) (or/c integer? #f) rendering?)))
  (define-values (query id) (layout->z3 doc #:width '?))
  (define query*
    `(,@query
      (declare-const elt-id Int)
      (assert
       (or ,@(for/list ([elt (in-tree doc)])
               `(and (not (let ([? ,(id elt)]) ,property))
                     (= elt-id (id ,(id elt)))))))))
  (match (z3-solve query*)
    [(list 'model model)
     (list (dict-ref model 'view-width #f) (dict-ref model 'elt-id #f) (model->rendering doc model id))]
    [(list 'core _)
     #f]))

(module+ test
  (check-false
   (verify '(([width 8])
             (([width 6] [height 2])
              (18))
             (()
              (([width 4])
               (12))
              (()
               (32))))
           '(= (h box0) 9)))

  (check-false
   (verify '(()
             (([width 6] [height 2])
              (18))
             (()
              (([width 4])
               (12))
              (()
               (32))))
           '(> (h box0) 5))))

(define/contract (component->z3 doc)
  (-> document? (values (listof list?) (-> document? symbol?)))

  (define id
    (let ([ids
           (for/hasheq ([elt (in-tree doc)] [i (in-naturals)])
             (values elt i))])
      (λ (x) (sformat "box~a" (hash-ref ids x)))))

  (values
   `((set-option :produce-unsat-cores true)
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

     (assert (is-box (parent ,(id doc))))
     (assert (is-box (previous ,(id doc))))
     (assert (is-box (next ,(id doc))))

     ,@(for/reap [sow] ([elt (in-tree doc)])
         (sow `(assert (= (first ,(id elt)) ,(if (null? (cdr elt)) 'no-box (id (cadr elt))))))
         (sow `(assert (= (last ,(id elt)) ,(if (null? (cdr elt)) 'no-box (id (last (cdr elt)))))))
         (for ([child (cdr elt)] [previous (cons #f (cdr elt))] [next (cdr (append (cdr elt) (list #f)))])
           (sow `(assert (= (parent ,(id child)) ,(id elt))))
           (sow `(assert (= (previous ,(id child)) ,(if previous (id previous) 'no-box))))
           (sow `(assert (= (next ,(id child)) ,(if next (id next) 'no-box))))))

     ,@(for/list ([elt (in-tree doc)])
         `(assert (= (is-box (last ,(id elt))) (is-box (first ,(id elt))))))
    
     (declare-datatypes () ((PValue no-value (value (val Real)))))
     (declare-fun width (Box) PValue)
     (declare-fun height (Box) PValue)
     (declare-fun padding (Box) PValue)
     (declare-fun area (Box) PValue)

     ,@(for/reap [sow] ([elt (in-tree doc)])
        (match elt
          [(list (? number? area))
           (sow `(assert (= (area ,(id elt)) (value ,area))))
           (sow `(assert (= (width ,(id elt)) no-value)))
           (sow `(assert (= (height ,(id elt)) no-value)))
           (sow `(assert (= (padding ,(id elt)) no-value)))]
          [(list (list (list key val) ...) subs ...)
           (define prop-value
             (let ([props (map cons key val)])
               (λ (prop) (if (dict-has-key? props prop) `(value ,(dict-ref props prop)) 'no-value))))
           (sow `(assert (= (area ,(id elt)) no-value)))
           (sow `(assert (= (width ,(id elt)) ,(prop-value 'width))))
           (sow `(assert (= (height ,(id elt)) ,(prop-value 'height))))
           (sow `(assert (= (padding ,(id elt)) ,(prop-value 'padding))))]))

     (define-fun padding-value ((b Box)) Real
       (ite (is-value (padding b)) (val (padding b)) 0.0))
     
     (define-fun renders ((b Box)) Bool
       (and
        (= (x b) (ite (is-box (parent b)) (+ (x (parent b)) (padding-value (parent b))) 0.0))
        (= (y b) (ite (is-box (previous b))
                      (+ (y (previous b)) (h (previous b)))
                      (+ (y (parent b)) (padding-value (parent b)))))
        (= (w b) (ite (is-value (width b))
                      (val (width b))
                      (- (w (parent b)) (* 2 (padding-value (parent b))))))
        (= (h b) (ite (is-value (height b))
                      (val (height b))
                      (ite (is-value (area b))
                           (/ (val (area b)) (w b))
                           (ite (is-box (first b))
                                (+ (- (+ (y (last b)) (h (last b))) (y (first b)))
                                   (* 2 (padding-value b)))
                                (* 2 (padding-value b))))))))

     ,@(for/list ([elt (in-tree doc)])
         `(assert (renders ,(id elt)))))
   id))

(define/contract (verify/component doc property)
  (-> document? (or/c list? symbol?) (or/c #f (list/c (or/c real? #f) (or/c integer? #f) rendering?)))
  (define-values (query id) (component->z3 doc))
  (define query*
    `(,@query
      (declare-const elt-id Int)
      (assert
       (or ,@(for/list ([elt (in-tree doc)])
               `(and (not (let ([? ,(id elt)]) ,property))
                     (= elt-id (id ,(id elt)))))))))
  (match (z3-solve query*)
    [(list 'model model)
     (list (dict-ref model 'view-width #f) (dict-ref model 'elt-id #f) (model->rendering doc model id))]
    [(list 'core _)
     #f]))

(define-by-match template?
  (list (? number?))
  (list (list (list (? symbol?) (? number?)) ...) (? template?) ...)
  (list (list 'component (or (? list?) (? symbol?)))))

(define/contract (model->rendering/template doc model id)
  (-> template? any/c (-> template? symbol?) rendering?)
  (let loop ([elt doc])
    (match-define (list 'box _ x y w h) (dict-ref model (id elt)))
    (cons (list x y w h) (map loop (cdr elt)))))

(define/contract (template->z3 doc #:width [screen-width '?])
  (-> template? #:width (or/c '? real?) (values (listof list?) (-> template? symbol?)))

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

     (assert (is-box (parent ,(id doc))))
     (assert (is-box (previous ,(id doc))))
     (assert (is-box (next ,(id doc))))

     ,@(for/reap [sow] ([elt (in-tree doc)])
         (sow `(assert (= (first ,(id elt)) ,(if (null? (cdr elt)) 'no-box (id (cadr elt))))))
         (sow `(assert (= (last ,(id elt)) ,(if (null? (cdr elt)) 'no-box (id (last (cdr elt)))))))
         (for ([child (cdr elt)] [previous (cons #f (cdr elt))] [next (cdr (append (cdr elt) (list #f)))])
           (sow `(assert (= (parent ,(id child)) ,(id elt))))
           (sow `(assert (= (previous ,(id child)) ,(if previous (id previous) 'no-box))))
           (sow `(assert (= (next ,(id child)) ,(if next (id next) 'no-box))))))
    
     (declare-datatypes () ((PValue no-value (value (val Real)))))
     (declare-fun width (Box) PValue)
     (declare-fun height (Box) PValue)
     (declare-fun padding (Box) PValue)
     (declare-fun area (Box) PValue)

     ,@(for/reap [sow] ([elt (in-tree doc)])
        (match elt
          [(list (? number? area))
           (sow `(assert (= (area ,(id elt)) (value ,area))))
           (sow `(assert (= (width ,(id elt)) no-value)))
           (sow `(assert (= (height ,(id elt)) no-value)))
           (sow `(assert (= (padding ,(id elt)) no-value)))]
          [(list (list (list key val) ...) subs ...)
           (define prop-value
             (let ([props (map cons key val)])
               (λ (prop) (if (dict-has-key? props prop) `(value ,(dict-ref props prop)) 'no-value))))
           (sow `(assert (= (area ,(id elt)) no-value)))
           (sow `(assert (= (width ,(id elt)) ,(prop-value 'width))))
           (sow `(assert (= (height ,(id elt)) ,(prop-value 'height))))
           (sow `(assert (= (padding ,(id elt)) ,(prop-value 'padding))))]
          [(list (list 'component property))
           (void)]))

     (define-fun padding-value ((b Box)) Real
       (ite (is-value (padding b)) (val (padding b)) 0.0))

     (define-fun renders ((b Box)) Bool
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
        (= (h b) (ite (is-value (height b))
                      (val (height b))
                      (ite (is-value (area b))
                           (/ (val (area b)) (w b))
                           (ite (is-box (first b))
                                (+ (- (+ (y (last b)) (h (last b))) (y (first b)))
                                   (* 2 (padding-value b)))
                                (* 2 (padding-value b))))))))

     ,@(for/reap [sow] ([elt (in-tree doc)])
         (match elt
           [(list (list 'component property))
            (sow `(assert (let ([? ,(id elt)]) ,property)))]
           [_ (void)])
         (sow `(assert (renders ,(id elt))))))
   id))

(define/contract (verify/template doc property)
  (-> template? (or/c list? symbol?) (or/c #f (list/c (or/c real? #f) (or/c integer? #f) rendering?)))
  (define-values (query id) (template->z3 doc #:width '?))
  (define query*
    `(,@query
      (declare-const elt-id Int)
      (assert
       (or ,@(for/list ([elt (in-tree doc)])
               `(and (not (let ([? ,(id elt)]) ,property))
                     (= elt-id (id ,(id elt)))))))))
  (match (z3-solve query*)
    [(list 'model model)
     (list (dict-ref model 'view-width #f) (dict-ref model 'elt-id #f) (model->rendering/template doc model id))]
    [(list 'core _)
     #f]))

(module+ test
  (check-false
   (verify/component
    '(([width 6] [height 2])
      (18))
    '(= (h box0) 2)))

  (check-false
   (verify/component
    '(()
      (([width 4])
       (12))
      (()
       (32)))
    '(=> (= (- (w (parent box0)) (* 2 (padding-value (parent box0)))) 8) (= (h box0) 7))))
  
  (check-false
   (verify/template
    '(([width 8])
      ((component (= (h ?) 2)))
      ((component (=> (= (- (w (parent ?)) (* 2 (padding-value (parent ?)))) 8) (= (h ?) 7)))))
    '(= (h box0) 9))))

(module+ test
  (check-false
   (verify/component
    '(([width 6] [height 2])
      (18))
    '(= (h box0) 2)))

  (check-false
   (verify/component
    '(()
      (([width 4])
       (12))
      (()
       (32)))
    '(=> (> (- (w (parent box0)) (* 2 (padding-value (parent box0)))) 0) (> (h box0) 3))))
  
  (check-false
   (verify/template
    '(()
      ((component (= (h ?) 2)))
      ((component (=> (> (- (w (parent ?)) (* 2 (padding-value (parent ?)))) 0) (> (h ?) 3)))))
    '(> (h box0) 5))))
