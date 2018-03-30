#lang racket
(require "../common.rkt" "../smt.rkt" "../encode.rkt" "../registry.rkt")
(provide make-font-datatype make-font-table make-get-font font-computation)

(define-constraints make-font-datatype
  (declare-datatypes () ((Font-Metric (font-metric (font.ascent Real) (font.descent Real) (font.topoffset Real)
                                                   (font.bottomoffset Real) (font.line-height Real) (font.selection-height Real))))))

(define-by-match font-info?
  (list size n s w a d t b lh))

(define (fuzzy-=-constraint var val [fuzz *fuzz*])
  (if (fuzz)
      `(< (- ,val ,(fuzz)) ,var (+ ,val ,(fuzz)))
      `(= ,val ,var)))

(define/contract (make-font-mapping fonts)
  (-> (listof font-info?) any/c)
  (define/contract font-map (hash/c (list/c string? (or/c symbol? number?) symbol?) (listof (cons/c number? symbol?))) (make-hash))
  (for ([font fonts])
    (match-define (list size n w s a d t b l) font)
    (define font-name (list n w s))
    (define font-list (dict-ref! font-map font-name '()))
    (dict-set! font-map font-name (cons (cons size (sformat "font~a-~a" (name 'font font-name) (name 'fs size))) font-list)))
  font-map)

(define/contract (make-font-table fonts)
  (-> (listof font-info?) any/c)
  `(,@(for/reap [sow] ([font fonts])
        (match-define (list size n s w a d t b l) font)
        (match-define (list a* d* t* b*) (list (z3->number a) (z3->number d) (z3->number t) (z3->number b)))
        (define var (sformat "font~a-~a" (name 'font (list n s w)) (name 'fs size)))
        (sow `(declare-const ,var Font-Metric))
        (sow `(assert
               (and
                (<= 0 (font.ascent ,var))
                (<= 0 (font.descent ,var))
                ,(fuzzy-=-constraint `(+ (font.ascent ,var) (font.descent ,var)) (+ a* d*) *font-fuzz*)
                ;; These are commented out because Firefox does not get the metrics correctly
                #;,(fuzzy-=-constraint `(font.ascent ,var) a* *font-fuzz*)
                #;,(fuzzy-=-constraint `(font.descent ,var) d* *font-fuzz*)
                ,(fuzzy-=-constraint `(font.topoffset ,var) t*)
                ,(fuzzy-=-constraint `(font.bottomoffset ,var) b*)
                ,(fuzzy-=-constraint `(font.selection-height ,var) (+ a* d* t* b*))
                ,(fuzzy-=-constraint `(font.line-height ,var) l)))))))

(define/contract (make-get-font fonts)
  (-> (listof font-info?) any/c)
  (define font-map (make-font-mapping fonts))
  `(define-fun get-font ((family Font-Family) (weight Font-Weight) (style Font-Style) (font-size Real)) Font-Metric
     ,(for/fold ([outer `(font-metric 0 0 0 0 0 0)]) ([font (dict-keys font-map)])
        (for/fold ([inner outer]) ([size->metric (dict-ref font-map font)])
          (match-define (list family weight style) font)
          (match-define (cons size metric) size->metric)
          `(ite (and (= family ,(dump-value 'font-family family))
                     (= weight  ,(if (number? weight) `(font-weight/num ,weight) (sformat "font-weight/~a" weight)))
                     (= style ,(sformat "font-style/~a" style))
                     ,(fuzzy-=-constraint 'font-size size *fuzz*))
                ,metric
                ,inner)))))

(define-constraints font-computation
  (declare-fun font-info (Box) Font-Metric)

  (define-fun font ((e Element)) Font-Metric
    (let ([style (computed-style e)])
      (get-font (style.font-family style)
                (style.font-weight style)
                (style.font-style style)
                (font-size.px (style.font-size style)))))

  (assert (forall ((b Box))
                  (= (font-info b)
                     (ite (is-elt (box-elt b))
                          (font (box-elt b))
                          (ite (is-box (pbox b))
                               (font-info (pbox b))
                               (font-metric 0 0 0 0 0 0)))))) ; TODO: should be default font

  (define-fun height-text ((b Box)) Real
    (+ (font.ascent (font-info b)) (font.descent (font-info b))))

  (define-fun horizontally-overlapping ((box1 Box) (box2 Box)) Bool
    (let ([m1 (font-info box1)]
          [m2 (font-info box2)])
      (or (> (- (bottom-outer box1) (+ 1 (font.bottomoffset m1)))
             (+ (top-outer box2) (font.topoffset m2))
             (+ (top-outer box1) 1 (font.topoffset m1)))
          (> (- (bottom-outer box2) (+ 1 (font.bottomoffset m2)))
             (+ (top-outer box1) (font.topoffset m1))
             (+ (top-outer box2) 1 (font.topoffset m2)))
          (< (- 1) (- (+ (top-outer box1) (font.topoffset m1)) (+ (top-outer box2) (font.topoffset m2))) 1))))

  (define-fun vertically-overlapping ((box1 Box) (box2 Box)) Bool
    (or (> (right-outer box1) (left-outer box2) (left-outer box1))
        (> (right-outer box2) (left-outer box1) (left-outer box2))
        (= (left-outer box1) (left-outer box2))))

  (define-fun overlaps ((b1 Box) (b2 Box)) Bool
    (and (horizontally-overlapping b1 b2) (vertically-overlapping b1 b2))))
