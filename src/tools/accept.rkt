#lang racket

(require racket/cmdline
         "../common.rkt" "../input.rkt" "../tree.rkt" "../dom.rkt" "../modify-dom.rkt"
         "../frontend.rkt" "../actions.rkt" "../print/tree.rkt" "../print/css.rkt")

(define (run-file fname pname #:debug [debug '()] #:truncate truncate)
  (define problem (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))
  (define documents (dict-ref problem ':documents))
  (define sheets (dict-ref problem ':sheets))

  (define documents*
    (if truncate (map (curry dom-limit-depth truncate) documents) documents))

  (for ([action (dict-ref problem ':actions '())])
    (match-define (list act (cons froms tos) ...) action)
    (for ([from froms] [to tos])
      (define from* (parse-tree from))
      (interpret-action act (dict-ref problem ':handlers '()) from*)
      (unless (tree=? (parse-tree to) from*)
        (eprintf "Failed action: ~a\n" act))))

  (define res
    (with-handlers
        ([exn:break? (λ (e) 'break)]
         [exn:fail? (λ (e) (list 'error e))])
      (solve sheets documents* #:debug debug)))

  (match res
    [(success stylesheet trees)
     (eprintf "Accepted!\n")]
    [(failure stylesheet trees)
     (displayln (stylesheet->string stylesheet))
     (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h :style))))
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
