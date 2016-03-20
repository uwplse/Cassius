#lang racket

(require math)
(require racket/cmdline)
(require "../common.rkt")
(require "../input.rkt")
(require "../dom.rkt")
(require "../spec/cascade.rkt")
(require "../print/css.rkt")
(require "../frontend.rkt")
(require "../modify-dom.rkt")
(require (only-in unstable/list list-update))

(define (run-file fname pname #:debug [debug '()] #:truncate truncate #:holes holes)
  (match-define
   (problem desc url header sheet documents features test)
   (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))

  (define documents*
    (if truncate (map (curry dom-limit-depth truncate) documents) documents))
  
  (define names (name-rules 'user sheet (map (compose parse-tree dom-tree) documents*)))
  (reset-elt-names!)
  (define sheet* (for/list ([rule sheet] [name names] #:when name) rule))

  (define sheet**
    (for/fold ([sheet sheet*]) ([j (in-range holes)])
      (define rule-id (random-integer 0 (length sheet)))
      (list-update sheet rule-id (λ (r) (list (car r) '?)))))

  (define res
    (with-handlers
        ([exn:break? (λ (e) 'break)]
         [exn:fail? (λ (e) (list 'error e))])
      (solve (list sheet**) documents* #:debug debug)))

  (match res
    [(success stylesheet trees)
     (eprintf "Success.\n")]
    [(failure stylesheet trees)
     (eprintf "Rejected.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")
     (exit 2)])

  (exit (if (success? res) 0 1)))

(module+ main
  (define debug '())
  (define truncate #f)
  (define holes 0)
  (define times 1)

  (command-line
   #:program "cassius sketch"
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
   [("-n" "--repeat") n "How many times to repeat the experiment"
    (set! times (string->number n))]
   [("--holes") n "Add N random holes into the stylesheet"
    (set! holes (string->number n))]
   [("--truncate") level "Truncate the tree to this level"
    (set! truncate (string->number level))]
   #:args (fname problem)
   (exit (if (andmap identity
                     (for/list ([i (in-range times)])
                       (run-file fname problem #:holes holes #:debug debug #:truncate truncate)))
             0 1))))
