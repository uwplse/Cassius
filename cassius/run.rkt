#lang racket

(require racket/runtime-path racket/path)
(require racket/cmdline)
(require "common.rkt")
(require "dom.rkt")
(require "z3.rkt")
(require "main.rkt")
(require "modify-dom.rkt")

(provide parse-file run-file (struct-out problem))

(struct problem (desc url header sheet documents features))

(define (parse-file port)
  (define problems (make-hash))
  (define headers (make-hash))
  (define sheets (make-hash))
  (define docs (make-hash))

  (define (parse-document name)
    (match name
      [`(strip-positions ,x) (dom-strip-positions (parse-document x))]
      [`(print-all ,x) (dom-print-all (parse-document x))]
      [(? symbol?) (hash-ref docs name)]))

  (for ([expr (in-port read port)])
    (match expr
      [`(define-stylesheet ,name ,rules ...)
       (hash-set! sheets name rules)]
      [`(define-document (,name #:width ,width #:browser ,browser) ,tree)
       (hash-set! docs name (dom name (rendering-context width browser) (parse-tree tree)))]
      [`(define-document (,name #:width ,width) ,tree)
       (hash-set! docs name (dom name (rendering-context width #f) (parse-tree tree)))]
      [`(define-header ,name ,header)
       (hash-set! headers name header)]
      [`(define-problem ,name #:header ,header #:sheet ,sheet #:documents ,documents ...)
       (hash-set! problems name
                  (problem #f #f (hash-ref headers header) (hash-ref sheets sheet)
                           (map parse-document documents) '()))]
      [`(define-problem ,name ,desc #:url ,url #:header ,header #:sheet ,sheet #:documents ,documents ... #:features ,feats)
       (hash-set! problems name
                  (problem desc url (hash-ref headers header) (hash-ref sheets sheet)
                           (map parse-document documents) feats))]))
  problems)

(define (run-file fname pname #:debug [debug '()] #:output [outname #f] #:solve [solve #t])
  (match-define (problem desc url header sheet documents features)
    (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))

  (reset!)
  (define out (if outname (open-output-file outname #:exists 'replace) (current-output-port)))
  (define time-start (current-inexact-milliseconds))
  (define query (all-constraints sheet documents))
  (define time-constraints (current-inexact-milliseconds))
  (eprintf "[~as] Produced ~a constraints of ~a terms\n"
           (~r #:precision '(= 3) #:min-width 8 (/ (- time-constraints time-start) 1000))
           (length query) (tree-size query))

  (when (memq 'z3o (flags))
    (set! query (z3-prepare query)))

  (when (memq 'debug (flags))
    (set! query (z3-namelines query)))

  (define time-prepare (current-inexact-milliseconds))
  (eprintf "[~as] Prepared ~a constraints of ~a terms\n"
           (~r #:precision '(= 3) #:min-width 8 (/ (- time-prepare time-constraints) 1000))
           (length query) (tree-size query))
  
  (define res
   (parameterize ([current-output-port out])
     (match solve
       [#f
        (for ([cmd query])
          (match cmd
            [(list 'echo comment) (printf "; ~a\n" comment)]
            [_ (printf "~a\n" cmd)]))
        #t]
       [#t
        (define z3-result
          (with-handlers ([exn:break? (lambda (e) 'break)] [exn:fail? (λ (e) (list 'error e))])
            (list 'solved
                  (z3-solve query #:debug debug #:get-unsat unsat-constraint-info))))
        (define time-solve (current-inexact-milliseconds))
           
        (match z3-result
          [(list 'solved model)
           (print-rules #:stylesheet sheet #:header header model)
           (eprintf "[~as] Solved for ~a variables\nSuccess!\n"
                    (~r #:precision '(= 3) #:min-width 8 (/ (- time-solve time-prepare) 1000))
                    (hash-count model))
           #t]
          [(list 'error e)
           (eprintf "[~as] ~a\n"
                    (~r #:precision '(= 3) #:min-width 8 (/ (- time-solve time-prepare) 1000))
                    (exn-message e))
           #f]
          ['break
           (eprintf "[~as] Query terminated\nFailure.\n"
                    (~r #:precision '(= 3) #:min-width 8 (/ (- time-solve time-prepare) 1000)))
           #f])])))

  (when outname (close-output-port out))
  res)

(module+ main
  (define solve? #t)
  (define debug '())
  (define out-file #f)

  (command-line
   #:program "cassius"
   #:multi
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
   (exit (if (run-file fname problem #:output out-file #:debug debug #:solve solve?) 0 1))))
