#lang racket

(require racket/cmdline (only-in xml write-xexpr) json)
(require "common.rkt" "input.rkt" "tree.rkt" "dom.rkt" "frontend.rkt"
         "print/tree.rkt" "assertions.rkt" "minimizer.rkt" "proofs.rkt")

(define (do-accept problem)
  (match (solve-problem problem)
    [(success doms test)
     (when (*debug*)
       (for ([tree (map dom-boxes doms)])
         (displayln (tree->string tree #:attrs '(:x :y :w :h :fs :elt)))))
     (eprintf "Accepted!\n")]
    [(failure doms)
     (for ([tree (map dom-boxes doms)]) (displayln (tree->string tree #:attrs '(:x :y :w :h :fs :elt :style))))
     (eprintf "Rejected.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")]))

(define (do-minimize problem backtracked)
  (define backtracked-elts
    (for/list ([node (string->jsexpr backtracked)])
      (cons (string->symbol (dict-ref node 'tag #f))
            (dict-ref node 'index #f))))

  (match (solve-problem problem)
    [(success doms test)
     (printf "Accepted\n")]
    [(failure doms)
     (match (get-box-to-remove (map dom-boxes doms) (dict-ref problem ':documents) backtracked-elts)
       [(list (cons tag index) removed total)
        (printf "Rejected\n")
        ;; TODO: Make two JSON outputs into one JSON output
        (define efficiency (real->decimal-string (* (/ removed total) 100) 2))
        (write-json (make-hash (list (cons 'removed removed)
                                     (cons 'total total)
                                     (cons 'efficiency efficiency))))
        (newline)
        (write-json (make-hash (list (cons 'tag (symbol->string tag)) (cons 'index index))))
        (newline)]
       [#f
        (printf "Minimized\n")
        (define total-boxes (length (append-map (compose sequence->list in-tree dom-boxes) (map parse-dom (dict-ref problem ':documents)))))
        (printf "~s\n" total-boxes)])]
    [(list 'error e)
     (printf "Error\n") ((error-display-handler) (exn-message e) e)]
    ['break
     (printf "Terminated.\n")]))

(define (do-dump problem #:screenshot [screenshot #f])
  (match-define (list (dom _ _ _ tree _)) (dict-ref problem ':documents))
  (define w (node-get tree ':w))
  (write-xexpr
   `(html ()
     (body ()
      ,@(if screenshot
            `((img ((src ,screenshot) (w ,w) (style "opacity:.4;position:absolute;top:0;left:0;"))))
            '())
      ,@
      (let loop ([tree tree])
        (match (car tree)
          [(list (or 'LINE 'VIEW 'ANON) _ ...) (append-map loop (cdr tree))]
          [(list (or 'BLOCK 'INLINE 'MAGIC) attrs ...)
           (define box-style "display: block; box-sizing: border-box; position: absolute; border: 2px solid black;")
           (cons
            `(div ((style ,box-style)
                   ,@
                   (for/list ([attr '(:w :h :x :y)] #:when (member attr attrs))
                     (define property (match attr [':w 'width] [':h 'height] [':x 'left] [':y 'top]))
                     `(,property ,(format "~avw" (real->double-flonum
                                                  (/ (* (cadr (member attr attrs)) w) 100)))))))
            (append-map loop (cdr tree)))]))))))

(define (do-render problem)
  (define problem* (dict-update problem ':documents (curry map dom-strip-positions)))
  (match (solve-problem problem*)
    [(success doms test)
     (eprintf "Rendered the following layout:\n")
     (for ([tree (map dom-boxes doms)])
       (displayln (tree->string tree #:attrs '(:x :y :w :h :fs :elt))))]
    [(failure doms)
     (eprintf "Unable to render.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Rendering terminated.\n")]))

(define (do-verify problem)
  (define problem* (dict-update problem ':documents (curry map dom-strip-positions)))
  (match (parameterize ([*fuzz* #f]) (solve-problem problem*))
    [(success doms test)
     (eprintf "Counterexample found to ~a!\n" test)
     (for ([tree (map dom-boxes doms)])
       (displayln (tree->string tree #:attrs '(:x :y :w :h :cex :fs :elt))))
     (printf "\n\nConfiguration:\n")
     (for* ([dom doms] [(k v) (in-dict (dom-properties dom))])
       (printf "\t~a:\t~a\n" k (string-join (map ~a v) " ")))]
    [(failure doms)
     (eprintf "Verified.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")]))

(define (do-minimize-assertion problem cache)
  (define problem* (dict-update problem ':documents (curry map dom-strip-positions)))
  (match (parameterize ([*fuzz* #f]) (solve-problem problem*))
    [(success doms test)
     (eprintf "Counterexample found!\n")
     (for* ([dom doms] [(k v) (in-dict (dom-properties dom))])
       (eprintf "\t~a:\t~a\n" k (string-join (map ~a v) " ")))
     (with-output-to-file cache #:exists 'replace
       (lambda ()
         (printf "(define-tree ~s)\n" (map dom-boxes doms))
         (printf "(define-document ~s)\n" (dict-ref problem ':documents))
         (printf "(define-config ~s)\n" (dom-properties (apply append doms)))))]
    [(failure doms)
     (eprintf "Verified.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")]))

(define (do-check-proof proof)
  (for ([component proof] [i (in-naturals 1)])
    (eprintf "Verifying ~a with ~a.\n"
             (first (dict-ref component ':name (list i)))
             (first (dict-ref component ':tool '(assert))))
    (match (parameterize ([*fuzz* #f]) (solve-problem component))
      [(success doms test)
       (eprintf "Counterexample found in component ~a to ~a!\n" (or (dom-name (first doms)) i) test)
       (for ([tree (map dom-boxes doms)])
         (displayln (tree->string tree #:attrs '(:x :y :w :h :cex :fs :elt :component :spec :name))))
       (printf "\n\nConfiguration:\n")
       (for* ([dom doms] [(k v) (in-dict (dom-properties dom))])
         (printf "\t~a:\t~a\n" k (string-join (map ~a v) " ")))
       (exit i)]
      [(failure doms)
       (eprintf "Verified ~a.\n" (first (dict-ref component ':name (list i))))]
      [(list 'error e)
       ((error-display-handler) (exn-message e) e)
       (exit 127)]
      ['break
       (eprintf "Terminated.\n")
       (exit 127)])))

(define (get-problem fname pname)
  (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))

(define (get-proof fname pname gname cname)
  (define files
    (call-with-input-file fname
      (λ (p) 
        (parameterize ([current-directory (path-tail fname)])
          (list (read-proofs p))))))
  (define proofs (append-map (if pname (compose list (curryr hash-ref pname)) hash-values) files))
  (define pages (append-map (if gname (compose list (curryr hash-ref gname)) hash-values) proofs))
  (define components
    (for/list ([page pages] #:when true
               [c page] [i (in-naturals 1)]
               #:when (or (not cname) (equal? (list cname) (dict-ref c ':name (list i)))))
      c))
  components)

(module+ main
  (define screenshot #f)
  (define render? #f)

  (multi-command-line
   #:program "cassius"

   #:multi
   [("-d" "--debug") "Turn on debug mode" (debug-mode!)]
   [("--cache") file-name "Cache for Z3 results"
    (*cache-file* file-name)
    (when (file-exists? file-name)
      (call-with-input-file file-name
        (λ (p)
          (define cache (read p))
          (for ([(k v) (in-hash cache)])
            (hash-set! *cache* k v)))))]
   [("--smt2") file-name "Instead of solving SMT2 query, write it to a file and exit"
     (*exit-early*
      (λ (query)
        (call-with-output-file
            file-name #:exists 'replace
            (λ (p)
              (for ([cmd query])
                (match cmd
                  [(list 'echo comment) (fprintf p "; ~a\n" comment)]
                  [_ (fprintf p "~a\n" cmd)]))))
        (exit)))]

   #:subcommands
   ["accept"
    #:args (fname problem)
    (do-accept (get-problem fname problem))]
   ["minimize"
    #:args (fname problem [backtracked "[]"])
    (do-minimize (get-problem fname problem) backtracked)]
   ["minimize-assertion"
    #:args (aname assertion fname problem cache)
    (define prob (get-problem fname problem))
    (define assertions
      (call-with-input-file aname
        (λ (p)
          (for/hash ([assertion (in-port read p)])
            (match-define `(define-test (,name ,vars ...) ,body) assertion)
            (values name `(forall ,vars ,body))))))
    (define documents
      (map (compose dom-set-range dom-strip-positions)
           (dict-ref prob ':documents)))
    (do-minimize-assertion
     (dict-set
      (dict-set prob ':documents documents)
      ':tests (list (dict-ref assertions (string->symbol assertion))))
     cache)]
   ["dump"
    #:once-each
    [("--screenshot") sname "File with a web page screenshot"
     (set! screenshot sname)]
    #:args (fname problem)
    (do-dump (get-problem fname problem) #:screenshot screenshot)]
   ["render"
    #:args (fname problem)
    (do-render (get-problem fname problem))]
   ["check-proof"
    #:args (proof-file [proof-name #f] [page-name #f] [component-name #f])
    (do-check-proof
     (get-proof proof-file
                (and proof-name (string->symbol proof-name))
                (and page-name (string->symbol page-name))
                (and component-name (or (string->number component-name) (string->symbol component-name)))))]
   ["assertion"
    #:args (aname assertion fname problem)
    (define prob (get-problem fname problem))
    (define assertions
      (call-with-input-file aname
        (λ (p)
          (for/hash ([assertion (in-port read p)])
            (match-define `(define-test (,name ,vars ...) ,body) assertion)
            (values name `(forall ,vars ,body))))))
    (define documents
      (map (compose dom-set-range dom-strip-positions)
           (dict-ref prob ':documents)))
    (do-verify
     (dict-set
      (dict-set prob ':documents documents)
      ':tests (list (dict-ref assertions (string->symbol assertion)))))]))
