#lang racket

(require racket/cmdline (only-in xml write-xexpr) json
         "common.rkt" "input.rkt" "tree.rkt" "dom.rkt"
         "frontend.rkt" "solver.rkt" "modularize.rkt"
         "print/tree.rkt" "print/css.rkt" "print/smt.rkt"
         "minimize.rkt" "assertions.rkt" "smt.rkt" "selectors.rkt" "match.rkt")

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

(define (dom-run-proof problem cmds)
  (define theorem-context (make-hash))
  (for/reap [sow] ([cmd cmds])
    (match cmd
      [`(define (,name ,args ...) ,body)
       (hash-set! assertion-helpers name
                  (procedure-reduce-arity
                   (λ vals (smt-replace-terms body (map cons args vals)))
                   (length args)))]
      [`(theorem (,name ,args ...) ,body)
       (hash-set! theorem-context name `(forall ,args ,body))]
      [`(proof (,name ,theorem) ,subcmds ...)
       (define the-dom (first (dict-ref problem ':documents)))
       (define elts (parse-tree (dom-elements the-dom)))
       (define boxes (parse-tree (dom-boxes the-dom)))

       (match (dom-context the-dom ':matched) ['(true) (void)])
       (define matcher
         (let ([linker (link-matched-elts-boxes #f elts boxes)])
           (λ (x) (match (linker x) [#f #f] [(list a b c) a]))))

       (define box-context (make-hash (list (cons 'root boxes))))
       (define components (hash-values box-context))
       (for ([cmd subcmds])
         (match cmd
           [`(spec * ,spec)
            (for ([box components])
              (node-set! box ':spec (and-assertions (node-get box ':spec #:default 'true) spec)))]
           [`(spec! * ,spec)
            (for ([box components])
              (node-set! box ':spec spec))]
           [`(spec! ,name ,spec)
            (define box (dict-ref box-context name))
            (when (eq? box boxes) (node-set! box ':name 'root))
            (node-set! box ':spec spec)]
           [`(spec ,name ,spec)
            (define box (dict-ref box-context name))
            (when (eq? box boxes) (node-set! box ':name 'root))
            (node-set! box ':spec (and-assertions (node-get box ':spec #:default 'true) spec))]
           [`(assert * ,assert)
            (for ([box components])
              (node-set! box ':assert (and-assertions (node-get box ':assert #:default 'true) assert)))]
           [`(assert! * ,assert)
            (for ([box components])
              (node-set! box ':assert assert))]
           [`(assert! ,name ,assert)
            (define box (dict-ref box-context name))
            (when (eq? box boxes) (node-set! box ':name 'root))
            (node-set! box ':assert assert)]
           [`(assert ,name ,assert)
            (define box (dict-ref box-context name))
            (when (eq? box boxes) (node-set! box ':name 'root))
            (node-set! box ':assert (and-assertions (node-get box ':assert #:default 'true) assert))]
           [`(admit ,name)
            (define box (dict-ref box-context name))
            (when (eq? box boxes) (node-set! box ':name 'root))
            (node-set! box ':admit true)]
           [`(component ,name ,sel)
            (define selected-boxes
              (for/list ([box (in-tree boxes)] #:when (and (matcher box) (selector-matches? sel (matcher box))))
                box))
            (define box
              (match selected-boxes
                [(list) (raise (format "Could not find any elements matching ~a" sel))]
                [(list box) box]
                [(list boxes ...) (raise (format "~a matches multiple elements ~a" (string-join (map ~a boxes) ", ")))]))
            (hash-set! box-context name box)
            (set! components (cons box components))
            (node-set! box ':name name)
            (node-set! box ':spec 'true)]
           [`(components ,sels ...)
            (define selected-boxes
              (filter identity
                      (for/list ([box (in-tree boxes)] #:when (matcher box))
                        (define elt (matcher box))
                        (and elt (ormap (curryr selector-matches? elt) sels) box))))
            (when (null? selected-boxes)
              (eprintf "Warning: Could not find any elements matching ~a\n" (string-join (map ~a sels) ", ")))
            (for ([box selected-boxes])
                 (node-set! box ':spec 'true)
                 (set! components (cons box components)))]))
       (define problem* (dict-set problem ':documents (list (struct-copy dom the-dom [boxes (unparse-tree boxes)]))))
       (define problem** (dict-set problem* ':test (list (dict-ref theorem-context theorem))))
       (sow problem**)])))

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
    (solve (dict-ref problem ':sheets) (dict-ref problem ':documents) (dict-ref problem ':test #f)
           (dict-ref problem ':fonts) #:render? (equal? (dict-ref problem ':render 'true) 'true))))

(define (do-accept problem)
  (match (solve-problem problem)
    [(success stylesheet trees doms)
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

(define (do-minimize problem)
  (match (solve-problem problem)
    [(success stylesheet trees doms)
     (eprintf "Accepted\n")]
    [(failure stylesheet trees)
     (define to-remove (get-box-to-remove trees (dict-ref problem ':documents)))
     (when to-remove
       (eprintf "Rejected\n")
       (match-define (cons (list removed total efficiency) (cons tag index)) to-remove)
       ;; TODO: Make two JSON outputs into one JSON output
       (write-json (make-hash (list (cons 'removed removed)
                                    (cons 'total total)
                                    (cons 'efficiency efficiency))))
       (newline)
       (write-json (make-hash (list (cons 'tag (symbol->string tag)) (cons 'index index)))))
     (unless to-remove
       (eprintf "Minimized\n")
       (define doms (map parse-dom (dict-ref problem ':documents)))
       (define total-boxes (length (append-map (compose sequence->list in-tree dom-boxes) doms)))
       (eprintf "~s\n" total-boxes))]
    [(list 'error e)
     (eprintf "Error\n") ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")]))

(define (do-debug problem)
  (match (solve-problem problem)
    [(success stylesheet trees doms)
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
    [(success stylesheet trees doms)
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
    [(success stylesheet trees doms)
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
    [(success stylesheet trees doms)
     (eprintf "Counterexample found!\n")
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

(define (do-verify/modular problem proof-file #:component [subcomponent #f])
  (define problem* (dict-update problem ':documents (curry map dom-strip-positions)))
  (define proof-cmds (call-with-input-file proof-file (λ (p) (sequence->list (in-port read p)))))
  (define problem** (dom-run-proof problem* proof-cmds))
  (match-define (list check components ...) (append-map modularize problem**))
  (for ([component components] [i (in-naturals 1)]
        #:when (or (not subcomponent)
                   (equal? subcomponent (dom-name (first (dict-ref component ':documents))))))
    (eprintf "Verifying ~a.\n" (or (dom-name (first (dict-ref component ':documents))) i))
    (match (parameterize ([*fuzz* #f]) (solve-problem component))
      [(success stylesheet trees doms)
       (eprintf "Counterexample found in component ~a!\n" (or (dom-name (first doms)) i))
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
  (eprintf "Verifying proof correctness.\n")
  (match (parameterize ([*fuzz* #f]) (solve-problem check))
    [(success stylesheet trees doms)
     (eprintf "Counterexample found in final check!\n")
     (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h :cex :fs :elt :name :spec :assert))))
     (printf "\n\nConfiguration:\n")
     (for* ([dom doms] [(k v) (in-dict (dom-properties dom))])
       (printf "\t~a:\t~a\n" k (string-join (map ~a v) " ")))]
    [(failure stylesheet trees)
     (eprintf "Verified modularly.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")]))

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

   #:subcommands
   ["accept"
    #:args (fname problem)
    (do-accept (get-problem fname problem))]
   ["minimize"
    #:args (fname problem)
    (begin (minimize-mode!) (do-minimize (get-problem fname problem)))]
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
     (set! subcomponent (string->symbol component))]
    #:args (fname problem proof-file)
    (do-verify/modular (get-problem fname problem) proof-file #:component subcomponent)]
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
