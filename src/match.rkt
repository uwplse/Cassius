#lang racket

(require "common.rkt" "tree.rkt" "selectors.rkt" "smt.rkt" "registry.rkt" "z3.rkt")
(provide link-elts-boxes link/root/c synthesize-displayed synthesize-dom)

(define (sheet->display? elts sheet)
  (if (ormap (curryr set-member? '?) sheet)
      (λ (elt) (not (equal? (node-type elt) 'head)))
      (let ([eqs (equivalence-classes sheet (sequence->list (in-tree elts)))])
        (λ (elt)
          (match-define (cons class-hash value-hash) (dict-ref eqs 'display))
          (and (not (equal? (node-type elt) 'head))
               (not (equal? 'none (dict-ref value-hash (dict-ref class-hash elt)))))))))

(define (link-elts-boxes sheet elts boxes)
  (define elt->box (make-hasheq))
  (define box->elt (make-hasheq))
  (define (match! elt box)
    (dict-set! elt->box elt box)
    (dict-set! box->elt box elt))
  (link/root match! (sheet->display? elts sheet) elts boxes)
  (λ (x) (dict-ref elt->box x (λ () (dict-ref box->elt x #f)))))

(define (link/root match! display? elt box)
  (assert (equal? (node-type box) 'VIEW)
          "At root, box must be a VIEW box")
  (when (display? elt)
    (link/block match! display? elt (node-fchild box))))

(define (link/block match! display? elt box)
  (define child-types (map node-type (node-children box)))
  (match* ((node-type box) (or (set-member? child-types 'LINE) (set-member? child-types 'ANON)))
    [('MAGIC _)
     (match! elt box)]
    [('BLOCK #t)
     (match! elt box)
     (for-each (curry link/inline match! display?)
               (node-children elt)
               (filter (λ (x) (not (equal? (node-type x) 'TEXT)))
                       (apply append (map node-children (node-children box)))))]
    [('BLOCK #f)
     (match! elt box)
     (for-each (curry link/block match! display?)
               (filter display? (node-children elt))
               (node-children box))]
    [('ANON #t)
     (for-each (curry link/inline match! display?)
               (node-children elt)
               (filter (λ (x) (not (equal? (node-type x) 'TEXT)))
                       (apply append (map node-children (node-children box)))))]))

(define (link/inline match! display? elt box)
  (match! elt box)
  (for-each (curry link/inline match! display?)
            (node-children elt)
            (filter (λ (x) (not (equal? (node-type x) 'TEXT))) (node-children box))))

(define (link/root/c elt box)
  (smt-and `(displayed ,elt) (link/block/c elt (node-fchild box))))

(define (link/block/c elt box)
  (match* ((node-type box) (set-member? (map node-type (node-children box)) 'LINE))
    [('MAGIC _) 'true]
    [('BLOCK #t)
     (apply smt-and
            (map (λ (e b) (smt-and `(displayed ,e) (link/inline/c e b)))
                 (node-children elt)
                 (filter (λ (x) (not (equal? (node-type x) 'TEXT)))
                         (apply append (map node-children (node-children box))))))]
    [('BLOCK #f)
     (let loop ([elts (node-children elt)] [boxes (node-children box)])
       (match* (elts boxes)
         [('() '()) 'true]
         [('() _) 'false]
         [(_ _)
          (define match-heads
            (with-handlers ([(const true) (λ (e) #f)])
              (link/block/c (car elts) (car boxes))))
          (if match-heads
              `(ite (displayed ,(car elts))
                    ,(smt-and match-heads (loop (cdr elts) (cdr boxes)))
                    ,(loop (cdr elts) boxes))
              (smt-and `(not (displayed ,(car elts))) (loop (cdr elts) boxes)))]))]
    [('ANON #t)
     (apply smt-and
            (map (λ (e b) (smt-and `(displayed ,e) (link/inline/c e b)))
                 (node-children elt)
                 (filter (λ (x) (not (equal? (node-type x) 'TEXT)))
                         (apply append (map node-children (node-children box))))))]))

(define (link/inline/c elt box)
  (apply smt-and
         (map (λ (e b) (smt-and `(displayed ,e) (link/inline/c e b)))
              (node-children elt)
              (filter (λ (x) (not (equal? (node-type x) 'TEXT))) (node-children box)))))

(define (synthesize-displayed elts1 boxes1 boxes2)
  (define match1-constraints
    (smt-replace (link/root/c elts1 boxes1)
      [`(displayed ,elt) (sformat "d1/~a" (name 'elt elt))]))
  (define match2-constraints
    (smt-replace (link/root/c elts1 boxes2)
      [`(displayed ,elt) (sformat "d2/~a" (name 'elt elt))]))

  (define problem
    `(,@(for/list ([elt (in-tree elts1)]) `(declare-const ,(sformat "d1/~a" (name 'elt elt)) Bool))
       ,@(for/list ([elt (in-tree elts1)]) `(declare-const ,(sformat "d2/~a" (name 'elt elt)) Bool))
       (assert ,match1-constraints)
       (assert ,match2-constraints)
       ,@(for/list ([elt (in-tree elts1)])
           `(assert-soft ,(sformat "d1/~a" (name 'elt elt))))
       ,@(for/list ([elt (in-tree elts1)])
           `(assert-soft (= ,(sformat "d1/~a" (name 'elt elt)) ,(sformat "d2/~a" (name 'elt elt)))))))
  (z3-solve problem))

(define (synthesize-dom elts1 boxes1 boxes2)
  (match-define (list 'model out) (synthesize-displayed elts1 boxes1 boxes2))

  (define elts2 (tree-copy elts1))
  (for ([elt (in-tree elts1)] [elt* (in-tree elts2)])
    (let ([d1 (dict-ref out (sformat "d1/~a" (name 'elt elt)))]
          [d2 (dict-ref out (sformat "d2/~a" (name 'elt elt)))])
      (unless (equal? d1 d2)
        (node-add! elt* ':class 'new-class))))
  (define out*
    (let ([h (make-hash)])
      (for ([elt (in-tree elts1)] [elt* (in-tree elts2)])
        (dict-set! h elt (dict-ref out (sformat "d1/~a" (name 'elt elt))))
        (dict-set! h elt* (dict-ref out (sformat "d2/~a" (name 'elt elt)))))
      h))

  (define (display? elt) (dict-ref out* elt))

  (define matches (make-hasheq))
  (define (match! elt box)
    (dict-set! matches elt box)
    (dict-set! matches box elt))

  (link/root match! display? elts1 boxes1)
  (define (matcher x) (dict-ref matches x #f))

  (values display? matcher elts2))

(module+ test
  (require rackunit)

  (define test-html
    '([html :n 1]
      ([body :n 2]
       ([div :id page :n 3]
        ([div :id header :n 4]
         ([a :class (logo) :n 5]
          ([img :n 7]))
         ([div :class (navigation) :n 8]
          ([ul :class (primary) :n 9]
           ([li :class (selected) :n 10]
            ([a :n 11] "home"))
           ([li :n 14]
            ([a :n 15] "about")))
          ([ul :class (secondary) :n 18]
           ([li :n 19]
            ([a :n 20] "books"))
           ([li :n 23]
            ([a :n 24] "blog")))))
        ([div :id body :n 27]
         ([div :class (header) :n 28]
          ([img :n 29]))
         ([div :class (body) :n 30]
          ([h2 :n 31]
           ([a :n 33] "books"))
          ([ul :n 35]
           ([li :n 36]
            ([a :n 37]
             ([img :n 39])))
           ([li :n 40]
            ([a :n 41]
             ([img :n 43])))
           ([li :n 44]
            ([a :n 45]
             ([img :n 47])))
           ([li :n 48]
            ([a :n 49]
             ([img :n 51])))))
         ([div :class (footer) :n 52]
          ([div :id e10001 :n 53]
           ([h3 :n 54]
            ([a :n 56] "about"))
           ([img :n 58])
           ([p :n 59]
            "This is just a place holder, so"
            "you can see what the site"
            "would look like. This is just a"
            "place holder."
            ([a :class (more) :n 68]
             "(more)")))
          ([div :n 70]
           ([h3 :n 71]
            ([a :n 73] "blog"))
           ([p :n 75]
            "This is just a place holder, so you can see what the"
            "site would look like. This is just a place holder."
            ([a :class (more) :n 82] "(more)")
            ([span :n 84] "- Leah, Apr. 1 2012")))))
        ([div :id footer :n 87]
         ([ul :n 88]
          ([li :class (twitter) :n 89]
           ([a :n 90] "twitter"))
          ([li :class (facebook) :n 93]
           ([a :n 94] "facebook"))
          ([li :class (googleplus) :n 97]
           ([a :n 98] "googleplus")))
         ([p :n 101] "© Copyright 2012. All rights reserved"))))))
  
  (define test-boxes
    '([VIEW :w 1267]
      ([BLOCK :x 0 :y 0 :w 1267 :h 1443]
       ([BLOCK :x 0 :y 0 :w 1267 :h 1443]
        ([BLOCK :x 153.5 :y 0 :w 960 :h 1443]
         ([BLOCK :x 153.5 :y 0 :w 960 :h 188]
          ([BLOCK :x 543.5 :y 55 :w 180 :h 180]
           ([LINE]
            ([INLINE])))
          ([BLOCK :x 153.5 :y 0 :w 960 :h 150]
           ([BLOCK :x 153.5 :y 0 :w 480 :h 150]
            ([MAGIC :x 303.5 :y 128 :w 100 :h 22 :mt 0 :mr 20 :mb 0 :ml 0]
             ([BLOCK :x 303.5 :y 128 :w 100 :h 22]
              ([LINE]
               ([TEXT :x 322.5 :y 128 :w 62 :h 22]))))
            ([MAGIC :x 423.5 :y 128 :w 100 :h 22 :mt 0 :mr 20 :mb 0 :ml 0]
             ([BLOCK :x 423.5 :y 128 :w 100 :h 22]
              ([LINE]
               ([TEXT :x 440.5 :y 128 :w 66 :h 22])))))
           ([BLOCK :x 633.5 :y 0 :w 480 :h 150]
            ([MAGIC :x 743.5 :y 128 :w 100 :h 22 :mt 0 :mr 20 :mb 0 :ml 0]
             ([BLOCK :x 743.5 :y 128 :w 100 :h 22]
              ([LINE]
               ([TEXT :x 760.5 :y 128 :w 66 :h 22]))))
            ([MAGIC :x 863.5 :y 128 :w 100 :h 22 :mt 0 :mr 20 :mb 0 :ml 0]
             ([BLOCK :x 863.5 :y 128 :w 100 :h 22]
              ([LINE]
               ([TEXT :x 887.5 :y 128 :w 52 :h 22])))))))
         ([BLOCK :x 153.5 :y 188 :w 960 :h 1137]
          ([BLOCK :x 153.5 :y 188 :w 960 :h 399]
           ([BLOCK :x 183.5 :y 193 :w 900 :h 361]))
          ([BLOCK :x 153.5 :y 627 :w 960 :h 409]
           ([BLOCK :x 153.5 :y 627 :w 960 :h 62]
            ([LINE]
             ([INLINE]
              ([TEXT :x 566.5 :y 638.5 :w 134 :h 39]))))
           ([BLOCK :x 153.5 :y 689 :w 960 :h 347]
            ([MAGIC :x 153.5 :y 719 :w 240 :h 255 :mt 0 :mr 0 :mb 0 :ml 0]
             ([BLOCK :x 172.5 :y 719 :w 202 :h 255]
              ([LINE]
               ([INLINE]))))
            ([MAGIC :x 393.5 :y 719 :w 240 :h 255 :mt 0 :mr 0 :mb 0 :ml 0]
             ([BLOCK :x 412.5 :y 719 :w 202 :h 255]
              ([LINE]
               ([INLINE]))))
            ([MAGIC :x 633.5 :y 719 :w 240 :h 255 :mt 0 :mr 0 :mb 0 :ml 0]
             ([BLOCK :x 652.5 :y 719 :w 202 :h 255]
              ([LINE]
               ([INLINE]))))
            ([MAGIC :x 873.5 :y 719 :w 240 :h 255 :mt 0 :mr 0 :mb 0 :ml 0]
             ([BLOCK :x 892.5 :y 719 :w 202 :h 255]
              ([LINE]
               ([INLINE]))))))
          ([BLOCK :x 153.5 :y 1036 :w 960 :h 289]
           ([BLOCK :x 153.5 :y 1116 :w 460 :h 209]
            ([BLOCK :x 203.5 :y 1116 :w 360 :h 44]
             ([LINE]
              ([INLINE]
               ([TEXT :x 334.5 :y 1123.5 :w 98 :h 27]))))
            ([BLOCK :x 215.5 :y 1186 :w 119 :h 103])
            ([BLOCK :x 203.5 :y 1178 :w 360 :h 120]
             ([LINE]
              ([TEXT :x 354.5 :y 1183.5 :w 200 :h 19]))
             ([LINE]
              ([TEXT :x 354.5 :y 1213.5 :w 176 :h 19]))
             ([LINE]
              ([TEXT :x 354.5 :y 1243.5 :w 200 :h 19]))
             ([LINE]
              ([TEXT :x 354.5 :y 1273.5 :w 89 :h 19])
              ([INLINE]
               ([TEXT :x 443.5 :y 1273.5 :w 49 :h 19])))))
           ([BLOCK :x 652.5 :y 1116 :w 460 :h 209]
            ([BLOCK :x 702.5 :y 1116 :w 360 :h 44]
             ([LINE]
              ([INLINE]
               ([TEXT :x 842.5 :y 1123.5 :w 80 :h 27]))))
            ([BLOCK :x 702.5 :y 1178 :w 360 :h 120]
             ([ANON]
              ([LINE]
               ([TEXT :x 702.5 :y 1183.5 :w 351 :h 19]))
              ([LINE]
               ([TEXT :x 702.5 :y 1213.5 :w 322 :h 19]))
              ([LINE]
               ([INLINE]
                ([TEXT :x 702.5 :y 1243.5 :w 49 :h 19]))))
             ([BLOCK :x 702.5 :y 1268 :w 360 :h 30]
              ([LINE]
               ([TEXT :x 702.5 :y 1273.5 :w 137 :h 19])))))))
         ([BLOCK :x 153.5 :y 1325 :w 960 :h 118]
          ([BLOCK :x 153.5 :y 1369 :w 150 :h 24]
           ([MAGIC :x 163.5 :y 1369 :w 30 :h 24 :mt 0 :mr 10 :mb 0 :ml 10]
            ([BLOCK :x 163.5 :y 1369 :w 30 :h 24]
             ([LINE]
              ([TEXT :x -9835.5 :y 1369 :w 49 :h 19]))))
           ([MAGIC :x 213.5 :y 1369 :w 30 :h 24 :mt 0 :mr 10 :mb 0 :ml 10]
            ([BLOCK :x 213.5 :y 1369 :w 30 :h 24]
             ([LINE]
              ([TEXT :x -9785.5 :y 1369 :w 62 :h 19]))))
           ([MAGIC :x 263.5 :y 1369 :w 30 :h 24 :mt 0 :mr 10 :mb 0 :ml 10]
            ([BLOCK :x 263.5 :y 1369 :w 30 :h 24]
             ([LINE]
              ([TEXT :x -9735.5 :y 1369 :w 73 :h 19])))))
          ([BLOCK :x 904.5 :y 1369 :w 209 :h 14]
           ([LINE]
            ([TEXT :x 904.5 :y 1369 :w 199 :h 14])))))))))

  (define parsed-html (parse-tree test-html))
  (define parsed-boxes (parse-tree test-boxes))

  (define link (link-elts-boxes '() parsed-html parsed-boxes))
  (define list-boxes (sequence->list (in-tree parsed-boxes)))
  (for ([elt (in-tree parsed-html)])
    (define box (link elt))
    (define box* (list-ref list-boxes (node-get elt ':n)))
    (with-check-info (['elt elt])
      (check-equal? box box*))))