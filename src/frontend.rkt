#lang racket
(require plot/no-gui "common.rkt" "z3.rkt" "main.rkt" "dom.rkt" "tree.rkt" "solver.rkt"
         "selectors.rkt" "spec/browser-style.rkt" "encode.rkt" "match.rkt" "smt.rkt" "spec/tree.rkt"
         "spec/percentages.rkt" "spec/float.rkt" "assertions.rkt" "registry.rkt")
(provide query solve (struct-out success) (struct-out failure))

(struct success (stylesheet elements doms))
(struct failure (stylesheet trees))

(define (constraints log-phase sheets docs [tests #f])
  (define doms (map parse-dom docs))

  (log-phase "Read ~a documents with ~a elements, ~a boxes, and ~a rules"
             (length doms)
             (length (append-map (compose sequence->list in-tree dom-elements) doms))
             (length (append-map (compose sequence->list in-tree dom-boxes) doms))
             (length (car sheets)))

  (define browser-styles (map (curryr dom-context ':browser) doms))
  (unless (= (length (remove-duplicates browser-styles)) 1)
    (error "Multiple documents with different browsers not supported"))
  (define browser-style (get-sheet (and (car browser-styles) (caar browser-styles))))

  (define %s
    (reap [sow]
          (for* ([sheet (cons browser-style sheets)] [rule sheet])
            (match-define (list _ (? attribute?) ... (? list? props) ...) rule)
            (for ([(prop value) (in-dict props)])
              (match (car value)
                [(list 'em v) (sow (* 100 (z3->number v)))]
                [(list '% v) (sow (z3->number v))]
                [_ (void)])))))
  (*%* (set-union (*%*) %s))

  (define matchers
    (for/list ([dom doms])
      (define linker
        (if (dom-context dom ':matched)
            link-matched-elts-boxes
            link-elts-boxes))
      (linker (append browser-style (car sheets)) (dom-elements dom) (dom-boxes dom))))

  (define tests*
    (for/list ([test (or tests '())])
      (define ctx
        (for/hash ([var (cadr test)])
          (values var (sformat "cex~a" (name 'cex (cons var test))))))
      `(forall ,(cadr test) ,(compile-assertion doms (caddr test) ctx))))

  (define query (all-constraints (cons browser-style sheets) matchers doms))

  (set! query (append query (list (model-sufficiency doms #:positive? (not tests)))))

  (when tests
    (set! query (add-test doms query tests*)))

  (log-phase "Produced ~a constraints of ~a terms"
             (length query) (tree-size query))

  (if (memq 'z3o (flags))
      (set! query (z3-prepare query))
      (set! query (z3-clean query)))
  (when (memq 'debug (flags)) (set! query (z3-namelines query)))

  (log-phase "Prepared ~a constraints of ~a terms"
           (length query) (tree-size query))
  
  (values doms query))

(define (query sheets docs [tests #f])
  (define-values (doms query) (constraints (make-log) sheets docs tests))
  (append query (list cassius-check-sat)))

(define (solve sheets docs [tests #f])
  (define log-phase (make-log))
  (define-values (doms query) (constraints log-phase sheets docs tests))

  (define out
    (let ([z3 (z3-process)])
      (with-handlers ([exn? (λ (e) (z3-kill z3) (raise e))])
        (z3-send z3 query)
        (begin0 (z3-check-sat z3 #:strategy cassius-check-sat)
          (z3-kill z3)))))

  (log-phase "Solved constraints")

  (define trees (map dom-boxes doms))
  (match out
    [(list 'model m)
     (log-phase "Found model with ~a variables" (dict-count m))
     (cond
      [(extract-model-sufficiency m trees)
       (for-each (curryr extract-tree! m) trees)
       (extract-counterexample! m)
       (define doms* (map (curry extract-ctx! m) doms))
       (define sheet* (car sheets)) ; (extract-rules (car sheets) trees m)
       (success sheet* (map unparse-tree trees) doms*)]
      [else
       (log-phase "Insufficient float registers, trying again with ~a"
                  (+ 1 (*exclusion-zone-registers*)))
       (parameterize ([*exclusion-zone-registers* (+ 1 (*exclusion-zone-registers*))])
         (solve sheets docs tests))])]
    [(list 'core c)
     (log-phase "Found core with ~a constraints" (length c))
     (cond
      [(ormap (λ (x) (string-prefix? (~a x) "ensure-model-sufficient")) c)
       (log-phase "Insufficient float registers, trying again with ~a"
                  (+ 1 (*exclusion-zone-registers*)))
       (parameterize ([*exclusion-zone-registers* (+ 1 (*exclusion-zone-registers*))])
         (solve sheets docs tests))]
      [else
       (define-values (stylesheet* trees*) (extract-core (car sheets) trees c))
       (failure stylesheet* (map unparse-tree trees*))])]))
