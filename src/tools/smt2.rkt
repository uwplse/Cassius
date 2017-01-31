#lang racket

(require racket/cmdline)
(require "../common.rkt")
(require "../input.rkt")
(require "../frontend.rkt")
(require "../dom.rkt")
(require "../print/smt.rkt")

(define (run-file fname pname #:output [outname #f] #:truncate truncate)
  (define problem (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))
  (define documents (dict-ref problem ':documents))
  (define sheets (dict-ref problem ':sheets))

  (define documents*
    (if truncate (map (curry dom-limit-depth truncate) documents) documents))

  (displayln (smt->string (constraints sheets documents*))))

(module+ main
  (define out-file #f)
  (define truncate #f)

  (command-line
   #:program "cassius smt2"
   #:multi
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
   (run-file fname problem #:output out-file #:truncate truncate)))
