#lang racket
(require plot/no-gui "common.rkt" "z3.rkt" "main.rkt" "dom.rkt" "tree.rkt"
         "selectors.rkt" "spec/browser-style.rkt" "encode.rkt" "registry.rkt")
(provide constraints solve synthesize (struct-out success) (struct-out failure))

(struct success (stylesheet elements))
(struct failure (stylesheet trees))

(define (sheet-constraints doms sheet)
  (reap [emit]
        (define browser-styles (map (curryr dom-context ':browser) doms))
        (unless (= (length (remove-duplicates browser-styles)) 1)
          (error "Multiple documents with different browsers not supported"))
        (define browser-style (get-sheet (and (car browser-styles) (caar browser-styles))))
        (define elts
          (for*/list ([dom doms] [elt (in-elements dom)]) elt))
        (define eqs (equivalence-classes (append browser-style sheet) elts))
        (selector-constraints emit eqs dom)))

(define (extract-ineqs eqcls core)
  (for/list ([var (map split-line-name core)] #:when (equal? (caar var) 'value))
    (match var
      [`((value ,prop ,cls) (,elt1) (,elt2))
       `(,prop ,(by-name 'elt elt1) ,(by-name 'elt elt2))]
      [`((value ,prop ,cls) (,elt1))
       (define cls* (if (equal? cls 'none) #f cls))
       (define value (dict-ref (cdr (dict-ref eqcls prop)) cls*))
       `(,prop ,(by-name 'elt elt1) ,value)])))

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
      (match-define (dom name ctx elts boxes) d)
      (dom name ctx (parse-tree elts) (parse-tree boxes))))

  (define query (all-constraints (car sheets) doms))
  (set! query (append query (sheet-constraints doms (car sheets))))
  (when test (set! query (add-test query test)))

  (log-phase "Produced ~a constraints of ~a terms"
             (length query) (tree-size query))

  (if (memq 'z3o (flags))
      (set! query (z3-prepare query))
      (set! query (z3-clean query)))
  (when (memq 'debug (flags)) (set! query (z3-namelines query)))

  (log-phase "Prepared ~a constraints of ~a terms"
           (length query) (tree-size query))

  (append query (list cassius-check-sat)))

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
      (match-define (dom name ctx elts boxes) d)
      (dom name ctx (parse-tree elts) (parse-tree boxes))))

  (define query (all-constraints (car sheets) doms))
  (set! query (append query (sheet-constraints doms (car sheets))))
  (when test (set! query (add-test query test)))

  (log-phase "Produced ~a constraints of ~a terms"
             (length query) (tree-size query))

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

  (define trees (map dom-boxes doms))
  (define res
    (match out
      [(list 'model m)
       (for-each (curryr extract-tree! m) trees)
       (extract-counterexample! m)
       (success (extract-rules (car sheets) trees m) (map unparse-tree trees))]
      [(list 'core c)
       (define-values (stylesheet* trees*) (extract-core (car sheets) trees c))
       (failure stylesheet* (map unparse-tree trees*))]))

  (log-phase "Solved constraints")

  res)

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
      (match-define (dom name ctx elts boxes) d)
      (dom name ctx (parse-tree elts) (parse-tree boxes))))

  (define query (all-constraints '() doms)) ; TODO: What to do about sheets?

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
  (define browser-style (get-sheet (and (dom-context (car doms) ':browser) (car (dom-context  (car doms) ':browser)))))

  (define ineq-ids (make-hash))
  (define avoid-ids (box (list)))
  (define core-ids (box (list)))

  (let loop ([ineqs '()])
    (define sheet (ineqs->stylesheet ineqs selhash))
    (define eqcls (equivalence-classes (append browser-style sheet) elts))

    (set-box! avoid-ids
              (cons
               (for/list ([(ineq id) ineq-ids] #:when (equivalence-classes-avoid? eqcls ineq)) id)
               (unbox avoid-ids)))
    (when (set-member? (flags) 'core-img)
      (draw-cores (reverse (unbox core-ids)) (reverse (unbox avoid-ids)) #:to "/tmp/status.png"))

    (log-phase "Chose new sketch ~a" sheet)
    (z3-send z3 (append '((pop) (push)) (sheet-constraints doms sheet)))
    (match (z3-check-sat z3 #:strategy cassius-check-sat)
      [(list 'model m)
       (define sheet*
         (for/list ([rule (append browser-style sheet)] [idx (in-naturals)])
           (append (list (car rule)) (filter symbol? (cdr rule))
                   (for/list ([(prop value) (in-dict (filter list? (cdr rule)))]
                              #:when (dict-has-key? m (sformat "value/~a/~a" prop idx)))
                     (match value
                       [(list '?)
                        (list prop (extract-value (dict-ref m (sformat "value/~a/~a" prop idx))))]
                       [(list _) (cons prop value)])))))
       (log-phase "Synthesized stylesheet!")
       ;; TODO - return (success _ _)
       (success (drop sheet* (length browser-style)) (map (compose unparse-tree dom-elements) doms))]
      [(list 'core c)
       (define new-ineqs (extract-ineqs eqcls c))
       (set-box! core-ids
                 (cons
                  (for/list ([ineq new-ineqs])
                    (unless (dict-has-key? ineq-ids ineq)
                      (dict-set! ineq-ids ineq (dict-count ineq-ids)))
                    (dict-ref ineq-ids ineq))
                  (unbox core-ids)))

       (when (set-member? (flags) 'core-img)
         (draw-cores (reverse (unbox core-ids)) (reverse (unbox avoid-ids)) #:to "/tmp/status.png"))

       (log-phase "Found new set of ~a inequalities (~a total sets)" (length new-ineqs) (+ 1 (length ineqs)))
       (loop (cons new-ineqs ineqs))])))

(define (draw-cores core-ids avoid-ids #:to file)
  (define num-steps (max (length core-ids) (length avoid-ids)))
  (define num-elts (if (null? core-ids) 0 (apply max (map (curry apply max) core-ids))))
  (parameterize
      ([plot-width (+ (* 5 num-steps) 5)] [plot-height (+ (* 5 num-elts) 10)]
       [plot-x-axis? #f] [plot-y-axis? #f] [plot-x-far-axis? #f] [plot-y-far-axis? #f]
       [plot-x-label #f] [plot-y-label #f])
    (plot-file
     #:x-min -1 #:x-max num-steps #:y-min -1 #:y-max (+ num-elts 1)
     (list
      (points (for/list ([i (in-naturals)] [core core-ids] #:when true [id core])
                (vector i id)) #:sym 'bullet #:color "Gray")
      (points (for/list ([i (in-naturals)] [avoids avoid-ids] #:when true [id avoids])
                (vector i id)) #:sym 'bullet #:color "PowderBlue"))
     file)))
