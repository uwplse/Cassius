#lang racket

(require racket/runtime-path racket/path)
(require srfi/13)

(provide solve z3)

; We assume that the solver is in the ../bin/ folder.
(define-runtime-path bin (build-path ".." "bin"))
(define z3 (make-parameter (build-path bin "z3")))

; Invokes Z3 and returns #f if unsatisfiable
; or a map from constant names to values if satisfiable.
(define (solve encoding #:debug [debug #f])
  (define-values (process out in err) 
    (subprocess #f #f #f (z3) "-smt2" "-in"))

  (define lines (inexact->exact (ceiling (/ (log (+ 1 (length encoding))) (log 10)))))

  (define line 0)
  (define (write val)
    (when debug (eprintf "~a ~a\n" (~r line #:min-width (+ 1 lines)) val))
    (set! line (+ 1 line))
    (fprintf in (format "~a\n" val))
    (flush-output in))

  (with-handlers ([exn:break? (lambda (e) (subprocess-kill process #t) (error 'solve "user break"))])
    (let loop ([rest encoding])
      (cond
       [(byte-ready? out)
        (if (char=? (peek-char out) #\|)
            (begin (when debug (eprintf "<- ~a" (read-line))) (loop rest))
            (let ([msg (read out)])
              (when debug (eprintf "<- ~a\n" msg))
              (match msg
                [`(error line ,line column ,column ,text ...)
                 (error (format "Z3 error: ~a" (string-join (map ~a text) " ")) (list-ref encoding line))]
                ['unsat
                 (write "(get-unsat-core)\n")
                 (let ([msg2 (read out)])
                   (when debug (eprintf "<- ~a\n" msg2))
                   (error "Z3 unsatisfiable" msg2))]
                ['sat
                 (if (null? rest)
                     (begin
                       (write "(get-model)\n")
                       (loop rest))
                     (loop rest))]
                [`(model (define-fun ,consts ,_ ,_ ,vals) ...)
                 (for/hash ([c consts] [v vals]) (values c (de-z3ify v)))]
                [(? eof-object?)
                 (error "Premature EOF received")])))]
       [(null? rest)
        (sync out)
        (loop rest)]
       [#t
        (write (~a (car rest)))
        (loop (cdr rest))]))))

; Writes the given encoding to the specified port.
(define (write-encoding encoding port #:debug [debug #f])
  (define line 0)
  (define (write . args)
    (set! line (+ line 1))
    (apply fprintf port args)
    (when debug
      (printf "~a " (~a line #:width 4))
      (apply printf args)))

  (write "(set-option :produce-unsat-cores true)\n")
  (for ([expr encoding])
    (write "~a\n" expr))
  (flush-output port))

; Reads the SMT solution from the given input port.
; The solution consist of 'sat or 'unsat, followed by  
; followed by a suitably formatted s-expression.  The 
; output of this procedure is a hashtable from constant 
; identifiers to their values (if the solution is 'sat);
; a non-empty list of assertion identifiers that form an
; unsatisfiable core (if the solution is 'unsat and a 
; core was extracted); or #f (if the solution is 
; 'unsat and no core was extracted).
(define (de-z3ify v)
  (match v
    [(== 'true) #t]
    [(== 'false) #f]
    [`(- ,n) (- (de-z3ify n))]
    [`(/ ,n ,d) (/ (de-z3ify n) (de-z3ify d))]
    [(list args ...) (map de-z3ify args)]
    [else v]))
