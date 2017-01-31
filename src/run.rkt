#lang racket

(require racket/runtime-path racket/path)
(require racket/cmdline)
(require "common.rkt")
(require "dom.rkt")
(require "main.rkt")
(require "frontend.rkt")
(require "input.rkt")
(require "dom.rkt")
(require "print/css.rkt")
(require "print/smt.rkt")
(require math/base)

(provide run-file)

(define num-holes 5)

(define (run-file fname pname #:debug [debug '()] #:output [outname #f] #:solve [solve? #t] #:truncate truncate)
  (define out (if outname (open-output-file outname #:exists 'replace) (current-output-port)))
  (define res
    (match (hash-ref (call-with-input-file fname parse-file) (string->symbol pname))
      [(problem desc url header sheet documents features #f)
       (define documents*
         (if truncate
             (map (curry dom-limit-depth truncate) documents)
             documents))
       (parameterize ([current-output-port out])
         (if solve?
             (solve-problem header sheet documents* out debug #f)
             (print-problem sheet documents* out debug #f)))
       #;(for ([i (in-range 10)])
         (define sheet*
           (for/fold ([sheet sheet]) ([j (in-range num-holes)])
             (let ([k (random-integer 0 (length sheet))])
               (list-update sheet k (λ (r) (cons (car r) '(?)))))))
         (solve-problem header sheet* documents out solve debug #f))]
      [(problem desc url header sheet (list document) features test)
       (match-define (dom name ctx tree) document)
       (let/ec stop
         (define port (if (member 'solver debug) out (open-output-string)))
         (match (parameterize ([current-output-port port] [current-error-port port])
                  (solve-problem "" sheet (list (dom name ctx tree)) port solve? debug test))
           [#t (printf ". ")]
           [#f
            (when (not (member 'solver debug))
              (printf "~a\n" (get-output-string port)))
            (pretty-print tree)])
         (when (not solve?) (stop #t)))]))
  (when outname (close-output-port out))
  res)

(define (print-problem sheet documents out debug test)
  (display (smt->string (constraints (list sheet) documents test)))
  #t)

(define (solve-problem header sheet documents out debug test)
  (define res
    (with-handlers
        ([exn:break? (λ (e) 'break)]
         [exn:fail? (λ (e) (list 'error e))])
      (solve (list sheet) documents test #:debug debug)))

  (match* (test res)
    [(#f (success stylesheet tree))
     #;(printf "~a~a" (header->string header) (stylesheet->string model))
     (eprintf "Synthesized a stylesheet. Success!\n")]
    [(#f (failure stylesheet trees))
     #;(eprintf "Unsatisfiable, core of ~a constraints\n" (length core))]
    [(`(forall (,vars ...) ,query) (success stylesheet tree))
     #;(print-counterexample model documents sheet)
     #;(for ([var vars])
     (define boxname (hash-ref model (sformat "counterexample/~a" var)))
     (printf "~a ~a\n" var (print-type 'Box (hash-ref model (sformat "~a-box" boxname)))))
     (eprintf "Counterexample found! Failure.\n")]
    [(`(forall (,vars ...) ,query) (failure core))
     (eprintf "No counterexamples found. Success!\n")]
    [(_ (list 'error e))
     ((error-display-handler) (exn-message e) e)]
    [(_ 'break)
     (eprintf "Query terminated. Failure.\n")])

  (and (or (success? res) (failure? res)) (xor test (success? res))))

(module+ main
  (define solve? #t)
  (define debug '())
  (define out-file #f)
  (define truncate #f)

  (command-line
   #:program "cassius"
   #:multi
   [("--truncate") level "Truncate the tree to this level"
    (set! truncate (string->number level))]
   [("-d" "--debug") type "Turn on debug information"
    (set! debug (cons (string->symbol type) debug))]
   [("-c" "--constraints") "Don't solve the constraints, just output them"
    (set! solve? #f)]
   [("-f" "--feature") name "Toggle a feature; use -name and +name to unset or set"
    (cond
      [(equal? (substring name 0 1) "+") (flags (cons (string->symbol (substring name 1)) (flags)))]
      [(equal? (substring name 0 1) "-") (flags (remove (string->symbol (substring name 1)) (flags)))]
      [else
       (define name* (string->symbol name))
       (flags (if (memq name* (flags)) (remove name* (flags)) (cons name* (flags))))])]
   #:once-each
   [("-o" "--output") fname "File name for final CSS file"
    (set! out-file fname)]
   #:args (fname problem)
   (exit (if (run-file fname problem #:output out-file #:debug debug #:solve solve? #:truncate truncate) 0 1))))
