#lang racket
(require racket/hash)
(require "common.rkt" "z3.rkt" "dom.rkt" "tree.rkt" "solver.rkt" "encode.rkt" "smt.rkt")
(require "main.rkt" "spec/float.rkt")
(require "assertions.rkt" "verify.rkt" "assertion2js.rkt")
(provide (struct-out success) (struct-out failure) solve-problem *exit-early*)

(define *exit-early* (make-parameter void))

(define (solve sheets doms fonts #:tests [tests #f] #:render? [render? #t]
               #:component [name #f])
  (define log-phase (make-log))
  (reset!)
  (log-phase "Read ~a documents with ~a elements, ~a boxes, ~a rules, and ~a fonts"
             (length doms)
             (length (append-map (compose sequence->list in-tree dom-elements) doms))
             (length (append-map (compose sequence->list in-tree dom-boxes) doms))
             (length (apply append sheets))
             (length fonts))

  (define layout (all-constraints sheets doms fonts #:render? render?))
  (define verify 
    (add-test doms (or tests '()) #:render? render?
              #:component (and name (for/first ([dom doms] [box (in-boxes dom)])
                                      (equal? (node-get box ':name) name)))))
  (define raw-query (if tests (append layout verify) layout))

  (log-phase "Produced ~a constraints of ~a terms" (length query) (tree-size query))
  (define query (z3-prepare query))
  (log-phase "Prepared ~a constraints of ~a terms" (length query) (tree-size query))

  ((*exit-early*) (append query (list cassius-check-sat)))

  (with-handlers
      ([exn:break? (λ (e) 'break)]
       [exn:fail? (λ (e) (list 'error e))])
    (match (z3-solve query #:check cassius-check-sat)
      [(list 'model m)
       (log-phase "Found model with ~a variables" (dict-count m))
       (cond
        [(or (not render?) ; Don't loop when proof checking
             (ormap (curryr dom-context ':component) doms) ; Don't loop when components
             (model-valid? doms m))
         (list 'model m)]
        [else
         (log-phase "Insufficient float registers, trying again with ~a"
                    (+ 1 (*exclusion-zone-registers*)))
         (parameterize ([*exclusion-zone-registers* (+ 1 (*exclusion-zone-registers*))])
           (solve sheets doms fonts #:tests tests #:component name))])]
      [(list 'core c)
       (log-phase "Found core with ~a constraints" (length c))
       (list 'core c)])))

(struct success (doms test) #:prefab)
(struct failure (doms) #:prefab)

(define (parse-solve-result doms tests out)
  (match out
    [(list 'model m)
     (for ([dom doms]) (extract-tree! (dom-boxes dom) m))
     (define test
       (if tests
           (let ([bad-test (extract-test m tests)])
             (when bad-test (extract-counterexample! m doms bad-test))
             bad-test)
           #f))
     (define doms* (map (curry extract-ctx! m) doms))
     (success (map unparse-dom doms*) test)]
    [(list 'core c)
     (extract-core! c doms)
     (failure (map unparse-dom doms))]
    [(list 'error e)
     (list 'error e)]
    ['break 'break]))

(define (parse-check-result doms tests out)
  (match out
    [(list 'counterexample props)
     (define doms
       (for/list ([doc doms])
         (define ctx*
           (for/fold ([ctx (dom-properties doc)])
               ([(k v) (in-dict props)])
             (dict-set ctx k v)))
         (struct-copy dom doc [properties ctx*])))
     (success (map unparse-dom doms) (apply and-assertions tests))]
    [(list 'success)
     (failure (map unparse-dom doms))]))

(define (solve-problem* problem)
  (dict-ref-define problem [sheets ':sheets] [docs ':documents] [fonts ':fonts])
  (define tests (dict-ref problem ':tests #f))
  (define doms (map parse-dom docs))
  (match (dict-ref problem ':tool '(assert))
    ['(assert)
     (parse-solve-result doms tests (solve sheets doms fonts #:tests tests))]
    ['(admit)
     (failure docs)]
    ['(modular)
     (parse-solve-result doms tests (solve sheets doms fonts #:tests tests #:render? false))]
    ['(page)
     (parse-solve-result doms tests (solve sheets doms fonts #:tests tests
                                     #:component (first (dict-ref problem ':component))))]
    ['(exhaustive)
     (parse-check-result doms tests (test-problem problem))]
    [`((random ,n))
     (parse-check-result doms tests (test-problem problem #:samples n))]))

(define (solve-problem problem)
  (cond
   [(*cache-file*)
    (define out
      (cond
       [(hash-has-key? *cache* problem)
        ((make-log) "Retrieved result from cache")
        (hash-ref *cache* problem)]
       [else
        (solve-problem* problem)]))
    (unless (match out [(list 'error _) true] ['break true] [_ false])
      (hash-set! *cache* problem out)
      (call-with-output-file (*cache-file*) #:exists 'replace (λ (p) (write *cache* p))))
    out]
   [else
    (solve-problem* problem)]))
