#lang racket
(require "../common.rkt" "../smt.rkt" "../encode.rkt")
(provide make-font-datatype make-font-table)

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
  `(assert (and
            ,@(for/list ([font fonts])
               (match-define (list fid a d t b l) font)
               `(and
                 ,(fuzzy-=-constraint `(font.ascent (get-metrics ,fid)) a)
                 ,(fuzzy-=-constraint `(font.descent (get-metrics ,fid)) d)
                 ,(fuzzy-=-constraint `(font.topoffset (get-metrics ,fid)) t)
                 ,(fuzzy-=-constraint `(font.bottomoffset (get-metrics ,fid)) b)
                 ,(fuzzy-=-constraint `(font.selection-height (get-metrics ,fid)) (+ a d t b) *fuzz*)
                 ,(fuzzy-=-constraint `(font.line-height (get-metrics ,fid)) l *fuzz*))))))
