#lang racket
(require "common.rkt")
(require "z3.rkt")
(require "main.rkt")
(require "dom.rkt")
(provide constraints solve (struct-out success) (struct-out failure))

(define (constraints sheets docs [test #f] #:debug [debug? #f])
  (define time-start (current-inexact-milliseconds))
  (define (log-phase fmt . args)
    (let* ([now (current-inexact-milliseconds)]
           [delta (- now time-start)])
      (set! time-start now)
      (apply eprintf (string-append "[~as] " fmt "\n")
             (~r #:precision '(= 3) #:min-width 8 (/ delta 1000))
             args)))

  (define doms
    (for/list ([d docs])
      (match-define (dom name ctx tree) d)
      (dom name ctx (parse-tree tree))))

  (define query (all-constraints (car sheets) doms))

  (log-phase "Produced ~a constraints of ~a terms"
             (length query) (tree-size query))

  (when test (set! query (add-test query test)))
  (if (memq 'z3o (flags))
      (set! query (z3-prepare query))
      (set! query (z3-clean query)))
  (when (memq 'debug (flags)) (set! query (z3-namelines query)))

  (log-phase "Prepared ~a constraints of ~a terms"
           (length query) (tree-size query))

  (reset-elt-names!)

  query)

(define (solve sheets docs [test #f] #:debug [debug? #f])
  (define time-start (current-inexact-milliseconds))
  (define (log-phase fmt . args)
    (let* ([now (current-inexact-milliseconds)]
           [delta (- now time-start)])
      (set! time-start now)
      (apply eprintf (string-append "[~as] " fmt "\n")
             (~r #:precision '(= 3) #:min-width 8 (/ delta 1000))
             args)))

  (define doms
    (for/list ([d docs])
      (match-define (dom name ctx tree) d)
      (dom name ctx (parse-tree tree))))

  (define query (all-constraints (car sheets) doms))

  (log-phase "Produced ~a constraints of ~a terms"
             (length query) (tree-size query))

  (when test (set! query (add-test query test)))
  (if (memq 'z3o (flags))
      (set! query (z3-prepare query))
      (set! query (z3-clean query)))
  (when (memq 'debug (flags)) (set! query (z3-namelines query)))

  (log-phase "Prepared ~a constraints of ~a terms"
           (length query) (tree-size query))

  (define res (solve-constraints (car sheets) (map dom-tree doms) query))

  (log-phase "Solved constraints")

  (reset-elt-names!)

  res)
