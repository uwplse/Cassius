#lang racket
(require "../common.rkt" "../smt.rkt" "../encode.rkt")
(provide make-font-datatype make-font-table font-computation)

(define-constraints make-font-datatype
  (declare-datatypes () ((Font-Metric (font (font.ascent Real) (font.descent Real) (font.topoffset Real)
                                            (font.bottomoffset Real) (font.line-height Real) (font.selection-height Real))))))

(define-by-match font-info?
  (list fid a x d t b))

(define (fuzzy-=-constraint var val [fuzz *font-fuzz*])
  (if (fuzz)
      `(< (- ,val ,(*font-fuzz*)) ,var (+ ,val ,(fuzz)))
      `(= ,val ,var)))

(define/contract (make-font-table fonts)
  (-> (listof font-info?) any/c)
  `(,@(for/reap [sow] ([font fonts])
        (match-define (list fid a d t b l) font)
        (define name (sformat "font~a" fid))
        (sow `(declare-const ,name Font-Metric))
        (sow `(assert
               (and
                ,(fuzzy-=-constraint `(font.ascent ,name) a)
                ,(fuzzy-=-constraint `(font.descent ,name) d)
                ,(fuzzy-=-constraint `(font.topoffset ,name) t)
                ,(fuzzy-=-constraint `(font.bottomoffset ,name) b)
                ,(fuzzy-=-constraint `(font.selection-height ,name) (+ a d t b) *fuzz*)
                ,(fuzzy-=-constraint `(font.line-height ,name) l *fuzz*)))))
    (define-fun get-metrics ((n Int)) Font-Metric
      ,(for/fold ([expr `(font 0 0 0 0 0 0)]) ([font fonts])
         (match-define (list fid a d t b l) font)
         `(ite (= n ,fid) ,(sformat "font~a" fid) ,expr)))))

(define-constraints font-computation
  (declare-fun font-info (Box) Font-Metric)
  (assert (forall ((b Box))
                  (= (font-info b)
                     (ite (is-elt (box-elt b))
                          (get-metrics (fid (box-elt b)))
                          (ite (is-box (pbox b))
                               (font-info (pbox b))
                               (font 0 0 0 0 0 0)))))))
