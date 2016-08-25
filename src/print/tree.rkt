#lang racket

(require "../common.rkt")
(require "css.rkt")
(provide tree->string)

(define (tree->string tree #:indent [indent 0] #:attrs [attrs '()])
  (format "~a([~a]~a~a)"
          (build-string indent (const #\space))
          (string-join
           (cons (~a (caar tree))
                 (for/list ([(cmd value) (in-dict (attributes->dict (cdar tree)))]
                            #:when (set-member? attrs cmd))
                   (measure->string cmd value)))
           " ")
          (if (null? (cdr tree)) "" "\n")
          (string-join (map (λ (t) (tree->string t #:indent (+ indent 1) #:attrs attrs)) (cdr tree)) "\n")))

(define/match (measure->string cmd value)
  [(':style (list value))
   (format ":style \"~a\""
           (string-join
            (for/list ([(property value) (in-dict value)])
              (if (equal? value '((bad)))
                  (format "\33[9;31m~a\33[0m" property)
                   (format "~a: ~a"
                           property
                           (string-join
                            (for/list ([value values])
                              (match value
                                [`(bad ,val)
                            (format "\33[1;31m~a\33[0m" (value->string val))]
                                [val
                                 (format "~a" (value->string val))]))
                            " "))))
            "; "))]
  [(_ (list `(bad ,value))) (format "\33[1;31m~a ~a\33[0m" cmd value)]
  [(_ (list `(fixed ,value))) (format "\33[1;32m~a ~a\33[0m" cmd value)]
  [(_ value) (format "~a ~a" cmd (string-join (map ~a value) " "))])
