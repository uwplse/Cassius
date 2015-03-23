#lang racket

(require racket/runtime-path racket/path)
(require srfi/13)

(provide solve z3)

; We assume that the solver is in the ../bin/ folder.
(define-runtime-path bin (build-path ".." "bin"))
(define z3 (make-parameter (build-path bin "z3")))

; Invokes Z3 and returns #f if unsatisfiable
; or a map from constant names to values if satisfiable.
(define (solve encoding #:debug [debug #f] #:model [model #f])
  (define-values (process out in err) 
    (subprocess #f #f #f (z3) "-smt2" "-in"))
  (with-handlers ([exn:break? (lambda (e) 
                                (subprocess-kill process #t)
                                (error 'solve "user break"))])
    (write-encoding encoding in #:debug debug)
    (define sol (read-solution in out))
    (subprocess-kill process #t)
    (when model
      (printf "\n~a\n\n" sol))
    sol))

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

(define (read-solution in out)
  (define (get-line)
    (let ([line (read-line out)])
      (if (string-contains line "|->")
          (get-line)
          (call-with-input-string line read))))
  (match (get-line)
    [(== 'sat) 
     (fprintf in "(get-model)\n")
     (flush-output in)
     (match (de-z3ify (read out))
       [(list (== 'model) (list (== 'define-fun) const _ _ val) ...)
        (for/hash ([c const] [v val]) 
          (values c v))]
       [other (error 'solution "expected model, given ~a" other)])]
    [(== 'unsat)
     (fprintf in "(get-unsat-core)\n")
     (flush-output in)
     (error "No solution found; conflicting constraints:\n" (read out))] 
    [other (error 'smt-solution "unrecognized solver output: ~a" other)]))
