#lang racket

(require racket/cmdline (only-in xml write-xexpr) json
         "common.rkt" "input.rkt" "tree.rkt" "dom.rkt"
         "frontend.rkt" "solver.rkt"
         "print/tree.rkt" "print/css.rkt" "print/smt.rkt")

(provide dom-strip-positions)

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

(define (wrapped-solve sheets documents fonts #:test [test #f])
  (with-handlers
      ([exn:break? (λ (e) 'break)]
       [exn:fail? (λ (e) (list 'error e))])
    (solve sheets documents test fonts)))

(define (do-accept problem)
  (match (wrapped-solve (dict-ref problem ':sheets) (dict-ref problem ':documents) (dict-ref problem ':fonts))
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

(define (has-elt? node)
  (if (and node (dict-ref (node-attrs node) ':elt #f))
      node
      #f))

;; Returns the elt of a child, from the highest ancestor in the hierarchy with multiple children, that is not an ancestor of the original node
(define (choose-to-remove node)
  (define parent (and node (node-parent node)))
  (if parent
      (let ([fromparent (choose-to-remove parent)]
            [next (node-next node)]
            [prev (node-prev node)])
        (or (has-elt? fromparent) (has-elt? next) (has-elt? prev)))
      #f))

(define (get-last-json new old)
  (define tagcounts (make-hash))
  (define last #f)
  (define result #f)
  (for* ([dom new] [node (in-tree (parse-tree dom))]
                   #:when node
                   [(key value) (in-dict (node-attrs node))]
                   #:break last)
    (match value
      [(list (list 'bad prop)) (set! last node)]
      [_ '()]))
  (define to-remove (choose-to-remove last))
  (if to-remove
      (begin
        (let ([elt-to-remove (dict-ref (node-attrs to-remove) ':elt #f)])
          (for* ([doc old] [html (in-elements (parse-dom doc))] #:when html #:final (equal? elt-to-remove (dict-ref (node-attrs html) ':num #f)))
            (define tag (node-type html))
            (set! result (cons tag (dict-ref! tagcounts tag 0)))
            (dict-set! tagcounts tag (+ 1 (dict-ref tagcounts tag)))))
        result)
      to-remove))

(define (do-minimize problem)
  (match (wrapped-solve (dict-ref problem ':sheets) (dict-ref problem ':documents) (dict-ref problem ':fonts))
    [(success stylesheet trees doms)
     (eprintf "Accepted\n")]
    [(failure stylesheet trees)
     (define to-remove (get-last-json trees (dict-ref problem ':documents)))
     (when to-remove
       (eprintf "Rejected\n")
       (match-define (cons tag index) to-remove)
       (write-json (make-hash (list (cons 'tag (symbol->string tag)) (cons 'index index)))))
     (unless to-remove
       (eprintf "Minimized\n"))]
    [(list 'error e)
     (eprintf "Error\n") ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")]))

(define (do-debug problem)
  (match (wrapped-solve (dict-ref problem ':sheets) (dict-ref problem ':documents) (dict-ref problem ':fonts))
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
  (define documents (map dom-strip-positions (dict-ref problem ':documents)))
  (match (wrapped-solve (dict-ref problem ':sheets) documents (dict-ref problem ':fonts))
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
  (match (wrapped-solve (dict-ref problem ':sheets) (dict-ref problem ':documents) (dict-ref problem ':fonts))
    [(success stylesheet trees doms)
     (displayln (stylesheet->string stylesheet))]
    [(failure stylesheet trees)
     (eprintf "Rejected.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")]))

(define (do-smt2 problem output)
  (define out (smt->string (query (dict-ref problem ':sheets) (dict-ref problem ':documents) (dict-ref problem ':fonts))))
  (call-with-output-file output #:exists 'replace (curry displayln out)))

(define (do-verify problem)
  (define documents (map dom-strip-positions (dict-ref problem ':documents)))
  (match
      (parameterize ([*fuzz* #f])
        (wrapped-solve (dict-ref problem ':sheets) documents (dict-ref problem ':fonts)
                       #:test (dict-ref problem ':test)))
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

(define (get-problem fname pname)
  (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))

(module+ main
  (define debug '())
  (define screenshot #f)

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
    #:args (fname problem output)
    (do-smt2 (get-problem fname problem) output)]
   ["verify"
    #:args (fname problem)
    (do-verify (get-problem fname problem))]
   ["assertions"
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
