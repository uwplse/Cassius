#lang racket
(require racket/hash "common.rkt" "z3.rkt" "main.rkt" "dom.rkt" "tree.rkt" "solver.rkt"
         "selectors.rkt" "spec/browser-style.rkt" "encode.rkt" "match.rkt" "smt.rkt" "spec/tree.rkt"
         "spec/percentages.rkt" "spec/float.rkt" "assertions.rkt" "registry.rkt")
(provide query solve (struct-out success) (struct-out failure))

(struct success (stylesheet elements doms))
(struct failure (stylesheet trees))

(define (constraints log-phase sheets docs fonts [tests #f] #:render? [render? #t])
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
                [(list 'rem v) (sow (* 100 (z3->number v)))]
                [(list 'em v) (sow (* 100 (z3->number v)))]
                [(list '% v) (sow (z3->number v))]
                [(? number? v) (sow (* v 100))]
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
      (define-values (test-vars test-body) (disassemble-forall test))
      (define ctx
        (hash-union
         (for/hash ([var test-vars])
           (values var (sformat "cex~a" (name 'cex (cons var test)))))
         (hash '? (dump-box (dom-boxes (first doms))))
         (for*/hash ([dom doms] [node (in-boxes dom)] #:when (node-get node ':name #:default false))
           (values (node-get node ':name) (dump-box node)))))
      (compile-assertion doms test-body ctx)))

  (define query (all-constraints (cons browser-style sheets) matchers doms fonts #:render? render?))

  (define ms (model-sufficiency doms))
  (when tests (set! query (add-test doms (append query (auxiliary-definitions))
                                    (if render?
                                        (cons `(forall () ,ms) tests*)
                                        tests*))))

  (log-phase "Produced ~a constraints of ~a terms" (length query) (tree-size query))

  (if (memq 'z3o (flags))
      (set! query (z3-prepare query))
      (set! query (z3-clean query)))
  (when (memq 'debug (flags)) (set! query (z3-namelines query)))

    (log-phase "Prepared ~a constraints of ~a terms" (length query) (tree-size query))
  
  (values doms query))

(define (query sheets docs fonts [tests #f])
  (define-values (doms query) (constraints (make-log) sheets docs fonts tests))
  (append query (list cassius-check-sat)))

(define (solve sheets docs fonts [tests #f] #:render? [render? #t])
  (define log-phase (make-log))
  (reset-names!)
  (define-values (doms query) (constraints log-phase sheets docs tests fonts #:render? render?))

  (define out
    (let ([z3 (z3-process)])
      (with-handlers ([exn? (λ (e) (z3-kill z3) (raise e))])
        (z3-send z3 query)
        (begin0 (z3-check-sat z3 #:strategy cassius-check-sat)
          (z3-kill z3)))))

  (define trees (map dom-boxes doms))
  (match out
    [(list 'model m)
       (log-phase "Found model with ~a variables" (dict-count m))
     (cond
      [(or (not render?) (extract-model-sufficiency m trees))
       (unless (extract-model-lookback m trees)
         (log-phase "Found violation of float restrictions"))
       (for-each (curryr extract-tree! m) trees)
       (extract-counterexample! m)
       (define doms* (map (curry extract-ctx! m) doms))
       (define sheet* (car sheets)) ; (extract-rules (car sheets) trees m)
       (success sheet* (map unparse-tree trees) doms*)]
      [else
       (log-phase "Insufficient float registers, trying again with ~a"
                  (+ 1 (*exclusion-zone-registers*)))
       (parameterize ([*exclusion-zone-registers* (+ 1 (*exclusion-zone-registers*))])
         (solve sheets docs fonts tests))])]
    [(list 'core c)
     (log-phase "Found core with ~a constraints" (length c))
     (define-values (stylesheet* trees*) (extract-core (car sheets) trees c))
     (failure stylesheet* (map unparse-tree trees*))]))
