#lang racket

(require racket/runtime-path racket/path)
(require "common.rkt" "smt.rkt")

(provide make-z3 z3-process z3-send z3-check-sat z3-kill z3-solve z3-try-solve)

(define (z3-process #:flags [flags '("-st")])
  (define-values (process z3-out z3-in z3-err)
    (apply subprocess #f #f #f z3-path "-smt2" "-in" flags))
  
  (define side-channel
    (if (and (*debug*) (directory-exists? "/tmp"))
        (open-output-file "/tmp/out.z3" #:exists 'replace)
        #f))

  (define soft? false)

  (define (kill)
    (close-output-port z3-in)
    (close-input-port z3-out)
    (close-input-port z3-err)
    (when side-channel (close-output-port side-channel))
    (subprocess-kill process true))

  (define (ffprintf port fmt . vs)
    (apply fprintf port fmt vs)
    (when side-channel (apply fprintf side-channel fmt vs))
    (flush-output port))
  
  (define (send cmd)
    (parameterize ([read-decimal-as-inexact #f])
      (with-handlers
          ([exn:break? (λ (e) (kill) (raise e))]
           [exn:fail:syntax? (λ (e) (raise-syntax-error 'Z3 (exn-message e) cmd))])
        (define out
          (match cmd
            [(list 'kill)
             (kill)
             'success]
            [(list 'echo s)
             (ffprintf z3-in "; ~a\n" s)
             'success]
            [(list 'assert-soft _ ...)
             (ffprintf z3-in "~a\n" cmd)
             (set! soft? true)
             'success]
            [_
             (ffprintf z3-in "~a\n" cmd)
             (parse-output (read z3-out) cmd)]))
        (if (and (equal? out 'sat) soft?)
            (parse-output (read z3-out) cmd)
            out))))

  (send '(set-option :print-success true))
  send)

(define (make-z3 #:flags [flags '("-st")] . cmdss)
  (define proc (z3-process #:flags flags))
  (for-each (curry z3-send proc) cmdss)
  proc)

(define (parse-output msg input)
  (match msg
    [`(error ,description)
     (match-define (list line/col parts ...) (string-split description ": "))
     (define text (string-join parts ": "))
     (match-define (list "line" (app string->number line) "column" (app string->number column))
                   (string-split line/col))
     (raise-cassius-error (format "~a (~a:~a)" text line column))]
    ['unsupported
     (error "Z3 unsupported:" input)]
    [`(model ,entries ...)
     (for/hash ([entry entries]
                #:when (equal? (first entry) 'define-fun)
                #:when (null? (third entry)))
       (match-define `(define-fun ,const ,_ ,_ ,val) entry)
       (values const (deserialize val)))]
    [(? eof-object?)
     (error "Z3 error: premature EOF received")]
    [_ msg]))

(define (z3-send process cmds)
  (for ([line cmds])
    (define out (process line))
    (unless (equal? 'success out)
      (raise (make-exn:fail (format "~a;\n  ~a" out line) (current-continuation-marks))))))

(define (z3-try-solve process cmds #:strategy [strategy '(check-sat)])
  (z3-send process '((push)))
  (z3-send process cmds)
  (let ([out (z3-check-sat process #:strategy strategy)])
    (when (equal? (first out) 'core)
      (z3-send process '((pop))))
    out))

(define (z3-check-sat process #:strategy [strategy '(check-sat)])
  (match (process strategy)
    ['unsat `(core ,(process '(get-unsat-core)))]
    [(or 'sat (list 'objectives _)) `(model ,(process '(get-model)))]
    ['unknown (error "Z3 returned 'unknown'")]))

(define (z3-kill process)
  (z3-send process '((kill)))
  (void))

(define (z3-solve encoding)
  (define z3 (z3-process))
  (z3-send z3 encoding)
  (define out (z3-check-sat z3))
  (z3-kill z3)
  out)

(define (deserialize v)
  (match v
    [(== 'true) #t]
    [(== 'false) #f]
    [`(- ,n) (- (deserialize n))]
    [`(/ ,n ,d) (exact->inexact (/ (deserialize n) (deserialize d)))]
    [`(let ((,names ,values) ...) ,body)
     (deserialize (smt-replace-terms body (map cons names values)))]
    [(list args ...) (map deserialize args)]
    [else v]))

