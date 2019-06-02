#lang racket
(require racket/hash "common.rkt" "z3.rkt" "main.rkt" "dom.rkt" "tree.rkt" "solver.rkt"
         "selectors.rkt" "encode.rkt" "smt.rkt" "spec/tree.rkt"
         "spec/percentages.rkt" "spec/float.rkt" "assertions.rkt"
         "assertion2js.rkt")
(provide (struct-out success) (struct-out failure) solve-problem *exit-early*)

(define *exit-early* (make-parameter #f))

(struct success (stylesheet elements doms test) #:prefab)
(struct failure (stylesheet trees) #:prefab)

(define (constraints log-phase sheets docs fonts
                     #:tests [tests #f] #:render? [render? #t]
                     #:component [cname #f])
  (define doms (map parse-dom docs))
  (log-phase "Read ~a documents with ~a elements, ~a boxes, ~a rules, and ~a fonts"
             (length doms)
             (length (append-map (compose sequence->list in-tree dom-elements) doms))
             (length (append-map (compose sequence->list in-tree dom-boxes) doms))
             (length (apply append sheets))
             (length fonts))

  (define %s
    (reap [sow]
          (for* ([sheet sheets] [rule sheet])
            (match-define (list _ (? attribute?) ... (? list? props) ...) rule)
            (for ([(prop value) (in-dict props)])
              (match (car value)
                [(list 'rem v) (sow (* 100 (z3->number v)))]
                [(list 'em v) (sow (* 100 (z3->number v)))]
                [(list '% v) (sow (z3->number v))]
                [(? number? v) (sow (* v 100))]
                [_ (void)])))))
  (*%* (set-union (*%*) %s))

  (define tests*
    (for/list ([test (or tests '())] [id (in-naturals)])
      (define-values (test-vars test-body) (disassemble-forall test))
      (define varmap
        (for/hash ([var test-vars])
          (values var (sformat "cex~a~a" id var))))
      (define ctx
        (hash-union
         varmap
         (hash '? (dump-box (dom-boxes (first doms))))
         (if (andmap (curryr dom-context ':component) doms)
             (hash)
             (hash 'root (dump-box (dom-boxes (first doms)))))
         (for*/hash ([dom doms] [node (in-boxes dom)]
                     #:when (node-get node ':name #:default false))
           (values (node-get node ':name) (dump-box node)))
         #:combine/key (λ (k a b) (if (equal? a b) a (raise "Different bindings for ~a: ~a and ~a" k a b)))))
      (cons varmap (compile-assertion doms test-body ctx))))

  (define query (all-constraints sheets doms fonts #:render? render?))

  (define ms (model-sufficiency doms))

  (when tests
    (define tests**
      (for/list ([test tests*])
        (cons (car test)
              (let loop ([expr (cdr test)])
                (match expr
                  [`(forall ,vars ,body)
                   `(forall ,vars ,(loop body))]
                  [`(=> ,as ... ,body)
                   `(=> ,@as ,(loop body))]
                  [body
                   (if render?
                       `(and ,ms ,body)
                       body)])))))
    (set! query (add-test doms (append query (auxiliary-definitions)) tests**
                          #:render? render?
                          #:component
                          (and cname
                               (for/first ([dom doms] [box (in-boxes dom)])
                                 (equal? (node-get box ':name) cname))))))

  (log-phase "Produced ~a constraints of ~a terms" (length query) (tree-size query))
  (set! query (z3-prepare query))

  (log-phase "Prepared ~a constraints of ~a terms" (length query) (tree-size query))
  
  (values doms query))

(define (solve sheets docs fonts #:tests [tests #f] #:render? [render? #t]
               #:component [name #f])
  (define log-phase (make-log))
  (reset!)
  (define-values (doms query) (constraints log-phase sheets docs fonts #:tests tests #:render? render?))

  (when (*exit-early*)
    ((*exit-early*) (append query (list cassius-check-sat))))

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
      [(or (not render?) ; Don't do loop in proof checking
           (ormap (curryr dom-context ':component) doms) ; Don't do loop for components
           (extract-model-sufficiency m trees))
       (when (extract-model-lookback m trees)
         (log-phase "Found violation of float restrictions"))
       (for-each (curryr extract-tree! m) trees)
       (define test
         (if tests
             (let ([bad-test (extract-test m tests)])
               (when bad-test (extract-counterexample! m doms bad-test))
               bad-test)
             #f))
       (define doms* (map (curry extract-ctx! m) doms))
       (define sheet* (apply append sheets)) ; (extract-rules (car sheets) trees m)
       (success sheet* (map unparse-tree trees) doms* test)]
      [else
       (log-phase "Insufficient float registers, trying again with ~a"
                  (+ 1 (*exclusion-zone-registers*)))
       (parameterize ([*exclusion-zone-registers* (+ 1 (*exclusion-zone-registers*))])
         (solve sheets docs fonts #:tests tests #:component name))])]
    [(list 'core c)
     (log-phase "Found core with ~a constraints" (length c))
     (extract-core! c doms)
     (failure '() (map unparse-tree trees))]))

(define (solve-problem* problem)
  (match (dict-ref problem ':tool '(assert))
    ['(assert)
     (with-handlers
         ([exn:break? (λ (e) 'break)]
          [exn:fail? (λ (e) (list 'error e))])
       (solve (dict-ref problem ':sheets) (dict-ref problem ':documents)
              (dict-ref problem ':fonts)
              #:tests (dict-ref problem ':test #f)))]
    ['(admit)
     (failure (dict-ref problem ':sheets) (map dom-boxes (dict-ref problem ':documents)))]
    ['(modular)
     (with-handlers
         ([exn:break? (λ (e) 'break)]
          [exn:fail? (λ (e) (list 'error e))])
       (solve (dict-ref problem ':sheets) (dict-ref problem ':documents)
              (dict-ref problem ':fonts)
              #:tests (dict-ref problem ':test #f)
              #:render? false))]
    ['(page)
     (with-handlers
         ([exn:break? (λ (e) 'break)]
          [exn:fail? (λ (e) (list 'error e))])
       (solve (dict-ref problem ':sheets) (dict-ref problem ':documents)
              (dict-ref problem ':fonts)
              #:tests (dict-ref problem ':test #f)
              #:component (first (dict-ref problem ':component))))]
    [(list (and (or 'exhaustive (list 'random _)) tool))
     (define log (make-log))
     (define named-components (dict-ref problem ':named-selectors))
     (define anon-components (dict-ref problem ':selectors))

     (define num-samples
       (match tool
         ['exhaustive
          (apply * (for/list ([f '(:w :h :fs)])
                     (match (first (dom-context (first (dict-ref problem ':documents)) f))
                       [(? number? n) 1]
                       [`(between ,a ,b) (+ (- b a) 1)])))]
         [(list 'random n)
          n]))

     (log "Launching Firefox to do ~a sample~a" num-samples (if (= num-samples 1) "" "s"))
     (match (test-assertion (first (dict-ref problem ':url))
                            (apply and-assertions (dict-ref problem ':test))
                            (if (equal? tool 'exhaustive) 0 num-samples)
                            named-components
                            anon-components
                            (dom-properties (first (dict-ref problem ':documents))))
       [`(counterexample ,props)
        (log "Counterexample found")
        (success (dict-ref problem ':sheets)
                 (map dom-boxes (dict-ref problem ':documents))
                 (dict-update problem ':documents
                              (λ (x)
                                (for/list ([doc x])
                                  (define ctx*
                                    (for/fold ([ctx (dom-properties doc)])
                                        ([(k v) (in-dict props)])
                                      (dict-set ctx k v)))
                                  (struct-copy dom doc [properties ctx*]))))
                  (apply smt-and (dict-ref problem ':test)))]
       ['(success)
        (log "No counterexamples found")
         (failure (dict-ref problem ':sheets)
                  (map dom-boxes (dict-ref problem ':documents)))])]))

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
