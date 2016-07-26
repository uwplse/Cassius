#lang racket
(require "common.rkt")
(require "z3.rkt")
(require "main.rkt")
(require "dom.rkt" "selectors.rkt" "spec/browser-style.rkt")
(provide constraints solve synthesize (struct-out success) (struct-out failure))

(define (sheet-constraints doms sheet)
  (reap [emit]
        (for/list ([dom doms])
          (define browser-style (get-sheet (dom-context dom ':browser)))
          (selector-constraints emit (append browser-style sheet) dom))))

(define (extract-ineqs eqcls core)
  (for/list ([var (map split-line-name core)] #:when (equal? (caar var) 'value))
    (match var
      [`((value ,prop ,cls) (,elt1) (,elt2))
       `(,prop ,(elt-from-name elt1) ,(elt-from-name elt2))]
      [`((value ,prop ,cls) (,elt1))
       (define cls* (if (equal? cls 'none) #f cls))
       (define value (dict-ref (cdr (dict-ref eqcls prop)) cls*))
       `(,prop ,(elt-from-name elt1) ,value)])))

(define cassius-check-sat
  '(check-sat-using
    (then
     (! propagate-values
        :push_ite_arith true
        :algebraic_number_evaluator false
        :bit2bool false
        :local_ctx true
        :hoist_mul true
        :flat false)
     nnf occf smt)))

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

  (define query (all-constraints doms))

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

  (append query (sheet-constraints doms (apply append sheets)) (list cassius-check-sat)))

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

  (define query (all-constraints doms))

  (log-phase "Produced ~a constraints of ~a terms"
             (length query) (tree-size query))

  (set! query (append query (sheet-constraints doms (car sheets))))
  (when test (set! query (add-test query test)))
  (if (memq 'z3o (flags))
      (set! query (z3-prepare query))
      (set! query (z3-clean query)))
  (when (memq 'debug (flags)) (set! query (z3-namelines query)))

  (log-phase "Prepared ~a constraints of ~a terms"
           (length query) (tree-size query))

  (define out
    (let ([z3 (z3-process)])
      (z3-send z3 query)
      (begin0 (z3-check-sat z3 #:strategy cassius-check-sat)
        (z3-kill z3))))
  (define res (solve-constraints (car sheets) doms out))

  (log-phase "Solved constraints")

  (reset-elt-names!)

  res)

(define (simplify-ineqs ineqs)
  (for/list ([group (group-by car ineqs)])
    (define endpoints
      (apply append (filter (λ (x) (= (length x) 1))
                            (group-by identity (append-map rest group)))))
    (cons (first (first group))
          (if (element? (car endpoints)) endpoints (reverse endpoints)))))

(define (synthesize docs [test #f] #:debug [debug? #f])
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

  (define query (all-constraints doms))

  (log-phase "Produced ~a constraints of ~a terms"
             (length query) (tree-size query))

  (when test (set! query (add-test query test)))
  (if (memq 'z3o (flags))
      (set! query (z3-prepare query))
      (set! query (z3-clean query)))
  (when (memq 'debug (flags)) (set! query (z3-namelines query)))

  (log-phase "Prepared ~a constraints of ~a terms"
           (length query) (tree-size query))

  (define elts (for*/list ([dom doms] [elt (in-elements dom)]) elt))
  (define selhash (all-selectors elts))
  (define z3 (z3-process))
  (z3-send z3 query)
  (z3-send z3 '((push)))

  (let loop ([ineqs '()])
    (define sheet (ineqs->stylesheet ineqs selhash))
    (define eqcls (equivalence-classes sheet elts))
    (log-phase "Chose new sketch (weight ~a)" (rules-score sheet))
    (z3-send z3 (append '((pop) (push)) (sheet-constraints doms sheet)))
    (match (z3-check-sat z3 #:strategy cassius-check-sat)
      [(list 'model m)
       (log-phase "Synthesized stylesheet!")
       (reset-elt-names!)
       ;; TODO - return (success _ _)
       ]
      [(list 'core c)
       (define new-ineqs (extract-ineqs eqcls c))
       #|
       (define good-props
         '(height width position left bottom float
                  padding-top padding-left padding-right padding-bottom
                  margin-left margin-right margin-top margin-bottom))
       (define ineqs* (filter (compose (curry set-member? good-props) car) ineqs))
       (for ([ineq ineqs*])
         (eprintf "~a: ~a ≠ ~a\n" (first ineq) (element-name (second ineq))
                  (if (element? (third ineq)) (element-name (third ineq)) (third ineq))))
       |#
       (log-phase "Found new set of ~a inequalities (~a total sets, ~a minimum hitting set)" (length new-ineqs) (+ 1 (length ineqs)) (length (hitting-set (cons new-ineqs ineqs))))
       (loop (cons new-ineqs ineqs))])))

(define (split-symbol s)
  (for/list ([part (string-split (~a s) "/")])
    (or (string->number part) (string->symbol part))))

(define (split-line-name var)
  (map split-symbol (string-split (~a var) "^")))
