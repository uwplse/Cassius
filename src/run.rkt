#lang racket

(require racket/cmdline (only-in xml write-xexpr) json
         "common.rkt" "input.rkt" "tree.rkt" "dom.rkt"
         "frontend.rkt" "solver.rkt" "modularize.rkt"
         "print/tree.rkt" "print/css.rkt" "print/smt.rkt"
         "assertions.rkt" "smt.rkt" "selectors.rkt" "match.rkt"
         "minimizer.rkt" "proofs.rkt")

(provide dom-strip-positions dom-set-range)

(define (dom-strip-positions d)
  (define boxes*
    (let loop ([tree (dom-boxes d)])
      (match-define (list (list type cmds ...) children ...) tree)
      (cons
       (match type
         [(or 'BLOCK 'INLINE 'VIEW 'LINE 'ANON)
             (cons type (dict->attributes (filter (compose not (curry set-member? '(:x :y :w :h)) car) (attributes->dict cmds))))]
         ['TEXT
          (cons type (dict->attributes (filter (compose not (curry set-member? '(:x :y :h)) car) (attributes->dict cmds))))]
         [_ (cons type cmds)])
       (map loop children))))
  (struct-copy dom d [boxes boxes*]))

(define (dom-set-range d)
  (define ctx*
    (for/fold ([ctx (dom-properties d)])
        ([(field value)
          #hash([:w . ((between 1024 1920))]
                [:h . ((between 800 1080))]
                [:fs . ((between 16 32))])])
      (dict-set ctx field value)))
  (struct-copy dom d [properties ctx*]))

(define (solve-problem problem)
  (with-handlers
      ([exn:break? (λ (e) 'break)]
       [exn:fail? (λ (e) (list 'error e))])
    (solve-cached (dict-ref problem ':sheets) (dict-ref problem ':documents)
                  (dict-ref problem ':fonts) (dict-ref problem ':test #f)
                  #:render? (equal? (dict-ref problem ':render 'true) 'true))))

(define (do-accept problem)
  (match (solve-problem problem)
    [(success stylesheet trees doms test)
     (when (*debug*)
       (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h :fs :elt)))))
     (eprintf "Accepted!\n")]
    [(failure stylesheet trees)
     (displayln (stylesheet->string stylesheet))
     (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h :fs :elt :style))))
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
    [(success stylesheet trees doms test)
     (printf "Accepted\n")]
    [(failure stylesheet trees)
     (match (get-box-to-remove trees (dict-ref problem ':documents) backtracked-elts)
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

(define (do-debug problem)
  (match (solve-problem problem)
    [(success stylesheet trees doms test)
     (eprintf "Different renderings possible.\n")
     (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h :fs))))]
    [(failure stylesheet trees)
     (displayln (stylesheet->string stylesheet))]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")]))

(define (do-dump problem #:screenshot [screenshot #f])
  (match-define (list (dom _ _ _ tree)) (dict-ref problem ':documents))
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
                                                  (/ (* (->number (cadr (member attr attrs))) w) 100)))))))
            (append-map loop (cdr tree)))]))))))

(define (do-render problem)
  (define problem* (dict-update problem ':documents (curry map dom-strip-positions)))
  (match (solve-problem problem*)
    [(success stylesheet trees doms test)
     (eprintf "Rendered the following layout:\n")
     (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h :fs :elt))))]
    [(failure stylesheet trees)
     (eprintf "Unable to render.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Rendering terminated.\n")]))

(define (do-sketch problem)
  (match (solve-problem problem)
    [(success stylesheet trees doms test)
     (displayln (stylesheet->string stylesheet))]
    [(failure stylesheet trees)
     (eprintf "Rejected.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")]))

(define (do-smt2 problem output #:render? [render? false])
  (when render?
    (set! problem (dict-update problem ':documents (curry map dom-strip-positions))))
  (define out (smt->string (query (dict-ref problem ':sheets) (dict-ref problem ':documents) (dict-ref problem ':fonts))))
  (call-with-output-file output #:exists 'replace (curry displayln out)))

(define (do-verify problem)
  (define problem* (dict-update problem ':documents (curry map dom-strip-positions)))
  (match (parameterize ([*fuzz* #f]) (solve-problem problem*))
    [(success stylesheet trees doms test)
     (eprintf "Counterexample found to ~a!\n" test)
     (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h :cex :fs :elt))))
     (printf "\n\nConfiguration:\n")
     (for* ([dom doms] [(k v) (in-dict (dom-properties dom))])
       (printf "\t~a:\t~a\n" k (string-join (map ~a v) " ")))]
    [(failure stylesheet trees)
     (eprintf "Verified.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")]))

(define (do-minimize-assertion problem cache)
  (define problem* (dict-update problem ':documents (curry map dom-strip-positions)))
  (match (parameterize ([*fuzz* #f]) (solve-problem problem*))
    [(success stylesheet trees doms test)
     (eprintf "Counterexample found!\n")
     ;(for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h :cex :fs :elt))))
     ;(printf "\n\nConfiguration:\n")
     (for* ([dom doms] [(k v) (in-dict (dom-properties dom))])
       (eprintf "\t~a:\t~a\n" k (string-join (map ~a v) " ")))
     (with-output-to-file cache #:exists 'replace
       (lambda ()
         (printf "(define-tree ~s)\n" trees)
         (printf "(define-document ~s)\n" (dict-ref problem ':documents))
         (printf "(define-config ~s)\n" (dom-properties (apply append doms)))))]
    [(failure stylesheet trees)
     (eprintf "Verified.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")]))

(define (do-verify/modular problem proof #:component [subcomponent #f])
  (define problem* (dict-update problem ':documents (curry map dom-strip-positions)))
  (define problem** (proof problem*))
  (match-define (list check components ...) (modularize problem**))
  (for ([component components] [i (in-naturals 1)]
        #:when (or (not subcomponent)
                   (equal? subcomponent (or (dom-name (first (dict-ref component ':documents))) i))))
    (eprintf "Verifying ~a.\n" (or (dom-name (first (dict-ref component ':documents))) i))
    (match (parameterize ([*fuzz* #f]) (solve-problem component))
      [(success stylesheet trees doms test)
       (eprintf "Counterexample found in component ~a to ~a!\n" (or (dom-name (first doms)) i) test)
       (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h :cex :fs :elt :component :spec :name))))
       (printf "\n\nConfiguration:\n")
       (for* ([dom doms] [(k v) (in-dict (dom-properties dom))])
         (printf "\t~a:\t~a\n" k (string-join (map ~a v) " ")))
       (exit i)]
      [(failure stylesheet trees)
       (eprintf "Verified ~a.\n" (or (dom-name (first (dict-ref component ':documents))) i))]
      [(list 'error e)
       ((error-display-handler) (exn-message e) e)
       (exit 127)]
      ['break
       (eprintf "Terminated.\n")
       (exit 127)]))
  (when (or (not subcomponent) (equal? subcomponent '<check>))
    (eprintf "Verifying proof correctness.\n")
    (match (parameterize ([*fuzz* #f]) (solve-problem check))
      [(success stylesheet trees doms test)
       (eprintf "Counterexample found in final check to ~a!\n" test)
       (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h :cex :fs :elt :name :spec :assert :admit))))
       (printf "\n\nConfiguration:\n")
       (for* ([dom doms] [(k v) (in-dict (dom-properties dom))])
         (printf "\t~a:\t~a\n" k (string-join (map ~a v) " ")))]
      [(failure stylesheet trees)
       (eprintf "Verified modularly.\n")]
      [(list 'error e)
       ((error-display-handler) (exn-message e) e)]
      ['break
       (eprintf "Terminated.\n")])))

(define (get-problem fname pname)
  (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))

(module+ main
  (define debug '())
  (define screenshot #f)

  (define subcomponent #f)
  (define render? #f)

  (multi-command-line
   #:program "cassius"

   #:multi
   [("-d" "--debug") "Turn on debug mode"
    (debug-mode!)]
   [("+x") name "Set an option" (flags (set-add (flags) (string->symbol name)))]
   [("-x") name "Unset an option" (flags (set-remove (flags) (string->symbol name)))]
   [("--cache") file-name "Cache for Z3 results"
    (*cache-file* file-name)
    (when (file-exists? file-name)
      (call-with-input-file file-name
        (λ (p)
          (define cache (read p))
          (for ([(k v) (in-hash cache)])
            (hash-set! *cache* k v)))))]

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
      ':test (list (dict-ref assertions (string->symbol assertion))))
     cache)]
   ["debug"
    #:args (fname problem)
    (do-debug (get-problem fname problem))]
   ["dump"
    #:once-each
    [("--screenshot") sname "File with a web page screenshot"
     (set! screenshot sname)]
    #:args (fname problem)
    (do-debug (get-problem fname problem))]
   ["render"
    #:args (fname problem)
    (do-render (get-problem fname problem))]
   ["sketch"
    #:args (fname problem)
    (do-sketch (get-problem fname problem))]
   ["smt2"
    #:once-each
    [("--render") "Dumps the SMT-LIB2 for the `render` action"
     (set! render? #t)]
    #:args (fname problem output)
    (do-smt2 (get-problem fname problem) output #:render? render?)]
   ["verify"
    #:args (fname problem)
    (do-verify (get-problem fname problem))]
   ["check-proof"
    #:once-each
    [("--component") component "Only verify a subcomponent (for debugging)"
     (set! subcomponent (or (string->number component) (string->symbol component)))]
    #:args (fname problem proof-file proof-name)
    (define proof (dict-ref (read-proofs proof-file) (string->symbol proof-name)))
    (do-verify/modular (get-problem fname problem) proof #:component subcomponent)]
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
      ':test (list (dict-ref assertions (string->symbol assertion)))))]))
