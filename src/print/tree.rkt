#lang racket

(require "../common.rkt")
(provide tree->string)

(define (tree->string tree #:indent [indent 0] #:attrs [attrs '(:tag :id :class)])
  (format "~a([~a ~a]~a~a)"
          (build-string indent (const #\space))
          (caar tree)
          (string-join
           (for/list ([(cmd value) (in-groups 2 (cdar tree))] #:when (set-member? attrs cmd))
             (match value
               [`(bad ,value) (format "\33[1;31m~a ~a\33[0m" cmd value)]
               [`(fixed ,value) (format "\33[1;32m~a ~a\33[0m" cmd value)]
               [value (format "~a ~a" cmd value)]))
           " ")
          (if (null? (cdr tree)) "" "\n")
          (string-join (map (λ (t) (tree->string t #:indent (+ indent 1) #:attrs attrs)) (cdr tree)) "\n")))
