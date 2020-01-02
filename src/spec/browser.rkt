#lang racket
(require "../common.rkt" "../smt.rkt")
(provide browser-fields browser-definition the-browser)

(define browser-fields
  #hash((:w . w) (:h . h)
        (:fs . fs.serif) (:fsm . fs.mono)
        (:scrollw . scrollbar-width)))

(define the-browser (make-parameter false))

(define-constraints (browser-definition)
  (declare-datatypes ()
    ((Browser (browser
               ,@(for/list ([(_ field) (in-hash browser-fields)])
                   `(,(sformat "browser.~a" field) Real)))))))
