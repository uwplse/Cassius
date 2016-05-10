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
  (when (memq 'z3o (flags)) (set! query (z3-prepare query)))
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
    (for/list ([d docs]) ;; d = <#dom>
      (match-define (dom name ctx tree) d)
      ;; dom = dom procedure
      ;; name = actual name i.e. domb
      ; ctx = rendering context
      ;; tree has the form of syntax:
      ; ((BLOCK :tag HTML :x 0 :y 0 :w 945)
      ; ((BLOCK :tag BODY :x 147.5 :y 36 :w 650)
      ; ((BLOCK :tag DIV :id content :x 157.5 :y 36 :w 630 :h 978.5))))
      (dom name ctx (parse-tree tree))))

  (define query (all-constraints (car sheets) doms))

  (log-phase "Produced ~a constraints of ~a terms"
             (length query) (tree-size query))

  (when test (set! query (add-test query test)))
  (when (memq 'z3o (flags)) (set! query (z3-prepare query)))
  (when (memq 'debug (flags)) (set! query (z3-namelines query)))

  (log-phase "Prepared ~a constraints of ~a terms"
           (length query) (tree-size query))

  (define res (solve-constraints (car sheets) (map dom-tree doms) query))

  (log-phase "Solved constraints")

  (reset-elt-names!)

  res)
