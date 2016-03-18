#lang racket

(require racket/runtime-path racket/path)
(require racket/cmdline)
(require "../common.rkt")
(require "../dom.rkt")
(require "../main.rkt")
(require "../frontend.rkt")
(require "../input.rkt")
(require "../modify-dom.rkt")
(require "../model-check.rkt")
(require "../print/core.rkt")
(require "../print/css.rkt")
(require "../print/smt.rkt")
(require "../print/tree.rkt")
(require math/base)
(require (only-in unstable/list list-update))

(provide run-file)

(define num-holes 5)

(define (run-file fname pname #:debug [debug '()] #:output [outname #f] #:truncate truncate)
  (match-define
   (problem desc url header sheet documents features test)
   (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))

  (define documents* (if truncate (map (curry dom-limit-depth truncate) documents) documents))
  (if outname
      (print-problem sheet documents* outname debug test)
      (solve-problem sheet documents* debug test)))

(define (print-problem sheet documents out debug test)
  (define constraints (smt->string (constraints (list sheet) documents test)))
  (call-with-output-file out (curry displayln constraints out) #:exists 'replace)
  #t)

(define (solve-problem sheet documents debug test)
  (define res
    (with-handlers
        ([exn:break? (λ (e) 'break)]
         [exn:fail? (λ (e) (list 'error e))])
      (solve (list sheet) documents test #:debug debug)))

  (match res
    [(success stylesheet trees)
     (eprintf "Counterexample found!\n")
     (for-each (compose displayln tree->string) trees)]
    [(failure core)
     (eprintf "Verified.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")])

  (failure? res))

(module+ main
  (define debug '())
  (define out-file #f)
  (define truncate #f)

  (command-line
   #:program "cassius accept"
   #:multi
   [("-d" "--debug") type "Turn on debug information"
    (set! debug (cons (string->symbol type) debug))]
   [("-f" "--feature") name "Toggle a feature; use -name and +name to unset or set"
    (cond
      [(equal? (substring name 0 1) "+") (flags (cons (string->symbol (substring name 1)) (flags)))]
      [(equal? (substring name 0 1) "-") (flags (remove (string->symbol (substring name 1)) (flags)))]
      [else
       (define name* (string->symbol name))
       (flags (if (memq name* (flags)) (remove name* (flags)) (cons name* (flags))))])]
   #:once-each
   [("-c" "--constraints") fname "Don't solve the constraints, just output them"
    (set! out-file fname)]
   [("--truncate") level "Truncate the tree to this level"
    (set! truncate (string->number level))]
   #:args (fname problem)
   (exit (if (run-file fname problem #:output out-file #:debug debug #:truncate truncate) 0 1))))
