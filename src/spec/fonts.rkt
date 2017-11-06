#lang racket
(require "../common.rkt" "../smt.rkt" "../encode.rkt" "../registry.rkt")
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
        (define var (sformat "font~a" (name 'font fid)))
        (sow `(declare-const ,var Font-Metric))
        (sow `(assert
               (and
                ,(fuzzy-=-constraint `(font.ascent ,var) a)
                ,(fuzzy-=-constraint `(font.descent ,var) d)
                ,(fuzzy-=-constraint `(font.topoffset ,var) t)
                ,(fuzzy-=-constraint `(font.bottomoffset ,var) b)
                ,(fuzzy-=-constraint `(font.selection-height ,var) (+ a d t b) *fuzz*)
                ,(fuzzy-=-constraint `(font.line-height ,var) l *fuzz*)))))))

(define-constraints font-computation
  (declare-fun font-info (Box) Font-Metric)
  (assert (forall ((b Box))
                  (= (font-info b)
                     (ite (is-elt (box-elt b))
                          (fid (box-elt b))
                          (ite (is-box (pbox b))
                               (font-info (pbox b))
                               (font 0 0 0 0 0 0)))))))
