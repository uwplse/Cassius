#lang racket

(require racket/runtime-path racket/path)
(require racket/cmdline)
(require "common.rkt")
(require "dom.rkt")
(require "z3.rkt")
(require "main.rkt")
(require "modify-dom.rkt")
(require "model-check.rkt")
(require math/base)
(require (only-in unstable/list list-update))

(provide parse-file run-file (struct-out problem))

(struct problem (desc url header sheet documents features test))

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
       (hash-set! docs name (dom name (rendering-context width browser) tree))]
      [`(define-document (,name #:width ,width) ,tree)
       (hash-set! docs name (dom name (rendering-context width #f) tree))]
      [`(define-header ,name ,header)
       (hash-set! headers name header)]
      [`(define-problem ,name #:test ,test #:sheet ,sheet #:documents ,documents ...)
       (hash-set! problems name
                  (problem #f #f #f (hash-ref sheets sheet)
                           (map parse-document documents) '() test))]
      [`(define-problem ,name #:header ,header #:sheet ,sheet #:documents ,documents ...)
       (hash-set! problems name
                  (problem #f #f (hash-ref headers header) (hash-ref sheets sheet)
                           (map parse-document documents) '() #f))]
      [`(define-problem ,name ,desc #:url ,url #:header ,header #:sheet ,sheet #:documents ,documents ... #:features ,feats)
       (hash-set! problems name
                  (problem desc url (hash-ref headers header) (hash-ref sheets sheet)
                           (map parse-document documents) feats #f))]))
  problems)

(define num-holes 5)

(define (run-file fname pname #:debug [debug '()] #:output [outname #f] #:solve [solve #t])
  (define out (if outname (open-output-file outname #:exists 'replace) (current-output-port)))
  (define res
    (match (hash-ref (call-with-input-file fname parse-file) (string->symbol pname))
      [(problem desc url header sheet documents features #f)
       (solve-problem header sheet documents out solve debug #f)
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
                  (solve-problem "" sheet (list (dom name ctx tree)) port solve debug test))
           [#t (printf ". ")]
           [#f
            (when (not (member 'solver debug))
              (printf "~a\n" (get-output-string port)))
            (pretty-print tree)])
         (when (not solve) (stop #t)))
         #;(for* ([i (in-naturals)] [concrete (generate-from-template tree i)])
           (define port (if (member 'solver debug) out (open-output-string)))
           (parameterize ([current-output-port port] [current-error-port port])
             (match (solve-problem "" sheet (list (dom name ctx concrete)) port solve debug test)
               [#t (printf ". ")]
               [#f
                (newline)
                (when (not (member 'solver debug))
                  (write (get-output-string port)))
                (pretty-print concrete)]))
           (when (not solve) (stop #t)))]))
  (when outname (close-output-port out))
  res)

(define (solve-problem header sheet documents out solve debug test)
  (define documents*
    (for/list ([d documents])
      (match-define (dom name ctx tree) d)
      (if (element? tree)
          d
          (dom name ctx (parse-tree tree)))))
  (reset!)
  (define time-start (current-inexact-milliseconds))
  (define query (all-constraints sheet documents*))
  (define time-constraints (current-inexact-milliseconds))
  (eprintf "[~as] Produced ~a constraints of ~a terms\n"
           (~r #:precision '(= 3) #:min-width 8 (/ (- time-constraints time-start) 1000))
           (length query) (tree-size query))
  
  (when test
    (set! query (add-test query test)))

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
     (cond
       [(not solve)
        (for ([cmd query])
          (match cmd
            [(list 'echo comment) (printf "; ~a\n" comment)]
            [_ (printf "~a\n" cmd)]))
        #t]
       [else
        (define z3-result
          (with-handlers ([exn:break? (lambda (e) 'break)] [exn:fail? (λ (e) (list 'error e))])
            (z3-solve query #:debug debug)))
        (define time-solve (current-inexact-milliseconds))
           
        (match* (test z3-result)
          [(#f (model model))
           (print-rules #:stylesheet sheet #:header header model)
           (eprintf "[~as] Solved for ~a variables\nSuccess!\n"
                    (~r #:precision '(= 3) #:min-width 8 (/ (- time-solve time-prepare) 1000))
                    (hash-count model))
           #t]
          [(#f (unsat-core core))
           (print-unsat-core query core documents* sheet)
           (eprintf "[~as] Unsatisfiable, core of ~a constraints\nFailure.\n"
                    (~r #:precision '(= 3) #:min-width 8 (/ (- time-solve time-prepare) 1000))
                    (length core))
           #f]
          [(`(forall (,vars ...) ,query) (model model))
           #;(print-counterexample model documents* sheet)
           (for ([var vars])
             (define boxname (hash-ref model (sformat "counterexample/~a" var)))
             (printf "~a ~a\n" var (print-type 'Box (hash-ref model (sformat "~a-box" boxname)))))
           (eprintf "[~as] Counterexample found!\nFailure.\n"
                    (~r #:precision '(= 3) #:min-width 8 (/ (- time-solve time-prepare) 1000)))
           #f]
          [(`(forall (,vars ...) ,query) (unsat-core core))
           (eprintf "[~as] No counterexamples found\nSuccess!\n"
                    (~r #:precision '(= 3) #:min-width 8 (/ (- time-solve time-prepare) 1000)))
           #t]
          [(_ (list 'error e))
           (eprintf "[~as] ~a\n"
                    (~r #:precision '(= 3) #:min-width 8 (/ (- time-solve time-prepare) 1000))
                    (exn-message e))
           #f]
          [(_ 'break)
           (eprintf "[~as] Query terminated\nFailure.\n"
                    (~r #:precision '(= 3) #:min-width 8 (/ (- time-solve time-prepare) 1000)))
           #f])])))
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
