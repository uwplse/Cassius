#lang racket

(require racket/runtime-path racket/path)

(provide solve z3 z3!)

(define z3-lib (make-parameter '()))

(define-syntax-rule (z3! cmd args ...)
  (z3-lib (cons '(cmd args ...) (z3-lib))))

; We assume that the solver is in the ../bin/ folder.
(define-runtime-path bin (build-path ".." "bin"))

(define z3 (make-parameter (build-path bin "z3")))

; Invokes Z3 on the given QF_BV formula, represented as a list 
; of symbols (see examples.rkt). It returns #f if the formula 
; is unsatisfiable or a map from constant names to values if the 
; formula is satisfiable.
(define (solve encoding #:debug [debug #f])
  (define-values (process out in err) 
    (subprocess #f #f #f (z3) "-smt2" "-in"))
  (with-handlers ([exn:break? (lambda (e) 
                                (subprocess-kill process #t)
                                (error 'solve "user break"))])
    (write-encoding encoding in #:debug debug)
    ; uncomment this to see what is being sent to the solver
    ;(write-encoding encoding (current-output-port))
    (define sol (read-solution out))
    (subprocess-kill process #t)
    (when debug
      (printf "\n~a\n\n" sol))
    sol))

; Writes the given encoding to the specified port.
(define (write-encoding encoding port #:debug [debug #f])
  (define line 0)
  (define (write . args)
    (set! line (+ line 1))
    (apply fprintf port args)
    (when debug
      (printf "~a " (~a line #:width 2))
      (apply printf args)))

  (for ([expr (z3-lib)])
    (write "~a\n" expr))
  (for ([expr encoding])
    (write "~a\n" expr))
  (write "(check-sat)\n")
  (write "(get-model)\n")
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
    [`(- ,n) (- n)]
    [`(/ ,n ,d) (/ n d)]
    [(list args ...) (map de-z3ify args)]
    [else v]))

(define (read-solution port)
  (match (read port)
    [(== 'sat) 
     (match (read port)
       [(list (== 'model) (list (== 'define-fun) const _ _ val) ...)
        (for/hash ([c const] [v val]) 
          (values c (de-z3ify v)))]
       [other (error 'solution "expected model, given ~a" other)])]
    [(== 'unsat) (read port) #f] 
    
    [other other #;(error 'smt-solution "unrecognized solver output: ~a" other)]))
