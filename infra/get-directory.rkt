#lang racket

(require json)
(require "../src/common.rkt")


(define (resolve-dir)
  (define result #f)
  (for ([sexp (in-port)] #:break (eq? result #t))
    (match sexp
      [`(define-problem ,name ,rest ...)
       (define properties (attributes->dict rest))
       (define url (car (dict-ref properties ':url)))
       (define url-path (string->path url))
       (define path-list (explode-path url-path))
       (define res (build-path (string->path "/") (cadr path-list) (caddr path-list)))
       (print (path->string res))
       (set! result true)]
      [_ '()])))

(module+ main
  (command-line
   #:program "get-directory.rkt"
   #:args ()
   (resolve-dir)))
