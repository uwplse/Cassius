#lang racket

(require racket/cmdline)
(require "../common.rkt")
(require "../input.rkt")
(require "../frontend.rkt")
(require "../modify-dom.rkt")
(require "../print/core.rkt")

(define (run-file fname pname #:debug [debug '()] #:truncate truncate)
  (match-define
   (problem desc url header sheet documents features test)
   (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))

  (define documents*
    (if truncate (map (curry dom-limit-depth truncate) documents) documents))

  (define res
    (with-handlers
        ([exn:break? (λ (e) 'break)]
         [exn:fail? (λ (e) (list 'error e))])
      (solve (list sheet) documents* #:debug debug)))

  (match res
    [(success stylesheet trees)
     (eprintf "Accepted!\n")]
    [(failure core)
     (print-unsat-core core sheet)
     (eprintf "Rejected.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")])

  (exit (if (success? res) 0 1)))

(module+ main
  (define debug '())
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
   [("--truncate") level "Truncate the tree to this level"
    (set! truncate (string->number level))]
   #:args (fname problem)
   (run-file fname problem #:debug debug #:truncate truncate)))
