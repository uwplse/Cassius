#lang racket

(require "../input.rkt")
(require "../frontend.rkt")
(require "../modify-dom.rkt")
(require "../print/core.rkt")
(require "../print/tree.rkt")

(provide run-file)

(define num-holes 5)

(define (run-file fname pname #:debug [debug '()] #:truncate truncate)
  (match-define
   (problem desc url header sheet documents features test)
   (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))

  (define documents*
    (map (compose dom-strip-positions
                  (if truncate (curry dom-limit-depth truncate) identity))
         documents))

  (define res
    (with-handlers
        ([exn:break? (λ (e) 'break)]
         [exn:fail? (λ (e) (list 'error e))])
      (solve (list sheet) documents* #:debug debug)))

  (match res
    [(success stylesheet trees)
     (eprintf "Rendered the following layout:\n")
     (for-each (compose displayln tree->string) trees)]
    [(failure stylesheet trees)
     (eprintf "Unable to render.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Rendering terminated.\n")])

  (exit (if (success? res) 0 1)))

(module+ main
  (define debug '())
  (define truncate #f)

  (command-line
   #:program "cassius render"
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