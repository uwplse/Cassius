#lang racket

(require racket/cmdline)
(require "../common.rkt")
(require "../input.rkt")
(require "../frontend.rkt")
(require "../dom.rkt")
(require "../modify-dom.rkt")
(require "../print/tree.rkt")
(require "../print/css.rkt")

(define (run-file fname pname #:debug [debug '()] #:truncate truncate)
  (match-define
   (problem desc url header sheet documents features test)
   (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))

   ;; problem = procedure -- ?
   ;; desc = #t/#f value
   ;; url = #t/#f value
   ;; header = straight HTML code
   ;; documents = (#<dom> #<dom>) -- looks like list of #<dom> args
   ;; features = () ?
   ;; test = #t/#f value
   ;; sheet = parsed css code in the format as follows:
   ;;
   ;; (((tag html) (margin-top (px 0)) (margin-right (px 0)) (margin-bottom (px 0))
   ;; (margin-left (px 0)) (padding-top (px 0)) (padding-right (px 0))
   ;; (padding-bottom (px 0)) (padding-left (px 0))) ((tag body) (margin-top (px 0))
   ;; (margin-right auto) (margin-bottom (px 0)) (margin-left auto) (padding-top (px 0)) (padding-right (px 10)) (padding-bottom (px 90)) (padding-left (px 10)) (width (px 630))) ((tag pre) (margin-top (px 21.6)) (margin-right (px 0)) (margin-bottom (px 30.6)) (margin-left (px 0)) (padding-top (px 9)) (padding-right (px 9)) (padding-bottom (px 9)) (padding-left (px 9))) ((tag h1) (margin-top (px 36)) (margin-bottom (px 0))) ((tag p) (text-align inherit) (margin-top (px 18)) (margin-right (px 0)) (margin-bottom (px 18)) (margin-left (px 0))) ((id postamble) (text-align center) (margin-top (px 18))))



  (define documents*
    (if truncate (map (curry dom-limit-depth truncate) documents) documents))

  (define res
    (with-handlers
        ([exn:break? (λ (e) 'break)]
         [exn:fail? (λ (e) (list 'error e))])
      (solve (list sheet) documents* #:debug debug)))

  (match res
    [(success stylesheet trees)
     (eprintf "Different renderings possible.\n")
     (for-each (compose displayln tree->string) trees)]
    [(failure stylesheet trees)
     (displayln (stylesheet->string stylesheet))
     (for-each (compose displayln tree->string) trees)
     (eprintf "Rejected.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")])

  (exit (if (failure? res) 0 1)))

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
