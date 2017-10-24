#lang racket
(require "../common.rkt" "../smt.rkt" "../encode.rkt")
(provide make-font-datatype make-font-table)

(define-constraints make-font-datatype
  (declare-datatypes () ((Font-Metric (font (font.ascent Real) (font.descent Real) (font.topoffset Real) (font.bottomoffset Real) (font.line-height Real))))))

(define-by-match font-info?
  (list fid a x d t b))

(define/contract (make-font-table fonts)
  (-> (listof font-info?) any/c)
  `(assert (and
            ,@(for/list ([font fonts])
               (match-define (list fid a d t b l) font)
               `(and
                 (< (- ,a 1.0) (font.ascent (get-metrics ,fid)) (+ ,a 1.0))
                 (< (- ,d 1.0) (font.descent (get-metrics ,fid)) (+ ,d 1.0))
                 (< (- ,t 1.0) (font.topoffset (get-metrics ,fid)) (+ ,t 1.0))
                 (< (- ,b 1.0) (font.bottomoffset (get-metrics ,fid)) (+ ,b 1.0))
                 (= (font.line-height (get-metrics ,fid)) ,l))))))
