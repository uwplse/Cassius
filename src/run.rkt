#lang racket

(require racket/cmdline (only-in xml write-xexpr)
         "common.rkt" "input.rkt" "tree.rkt" "dom.rkt"
         "frontend.rkt" "actions.rkt"
         "print/tree.rkt" "print/css.rkt" "print/html.rkt" "print/smt.rkt")

(define (dom-strip-positions d)
  (match-define (dom name ctx elts boxes) d)
  (define boxes*
    (let loop ([tree boxes])
      (match-define (list (list type cmds ...) children ...) tree)
      (cons
       (match type
         [(or 'BLOCK 'INLINE)
             (cons type (dict->attributes (filter (compose not (curry set-member? '(:x :y :w :h)) car) (attributes->dict cmds))))]
         ['TEXT
          (cons type (dict->attributes (filter (compose not (curry set-member? '(:x :y)) car) (attributes->dict cmds))))]
         [_ (cons type cmds)])
       (map loop children))))
  (dom name ctx elts boxes*))

;; TODO: Not currently used
(define (test-actions problem)
  (for ([action (dict-ref problem ':actions '())])
    (match-define (list target act (cons froms tos) ...) action)
    (for ([from froms] [to tos])
      (define from* (parse-tree from))
      (interpret-action target act (apply append (dict-ref problem ':scripts '())) from*)
      (define diff (elements-difference (parse-tree to) from*))
      (when diff
        (eprintf "Failed ~a on ~a\n  " act target)
        (pretty-print diff)))))

(define (wrapped-solve sheets documents #:debug debug)
  (with-handlers
      ([exn:break? (λ (e) 'break)]
       [exn:fail? (λ (e) (list 'error e))])
    (solve sheets documents #:debug debug)))

(define (do-accept problem #:debug [debug '()])
  (match (wrapped-solve (dict-ref problem ':sheets) (dict-ref problem ':documents) #:debug debug)
    [(success stylesheet trees)
     (eprintf "Accepted!\n")]
    [(failure stylesheet trees)
     (displayln (stylesheet->string stylesheet))
     (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h :style))))
     (eprintf "Rejected.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")]))

(define (do-debug problem #:debug [debug '()])
  (match (wrapped-solve (dict-ref problem ':sheets) (dict-ref problem ':documents) #:debug debug)
    [(success stylesheet trees)
     (eprintf "Different renderings possible.\n")
     (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h))))]
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

(define (do-export problem)
  (display
   (elements->string
    (parse-tree (dom-elements (car (dict-ref problem ':documents))))
    #:sheets (dict-ref problem ':sheets '())
    #:scripts (dict-ref problem ':scripts '())
    #:title (dict-ref problem ':title #f))))

(define (do-render problem #:debug [debug '()] #:truncate truncate)
  (define documents (map dom-strip-positions (dict-ref problem ':documents)))
  (match (wrapped-solve (dict-ref problem ':sheets) documents #:debug debug)
    [(success stylesheet trees)
     (eprintf "Rendered the following layout:\n")
     (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h))))]
    [(failure stylesheet trees)
     (eprintf "Unable to render.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Rendering terminated.\n")]))

(define (do-sketch problem #:debug [debug '()])
  (match (wrapped-solve (dict-ref problem ':sheets) (dict-ref problem ':documents) #:debug debug)
    [(success stylesheet trees)
     (displayln (stylesheet->string stylesheet))]
    [(failure stylesheet trees)
     (eprintf "Rejected.\n")]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")]))

(define (do-smt2 problem)
  (displayln (smt->string (constraints (dict-ref problem ':sheets) (dict-ref problem ':documents)))))

(define (do-verify problem #:debug debug)
  (match (wrapped-solve (dict-ref problem ':sheets) (dict-ref problem ':documents) #:debug debug)
    [(success stylesheet trees)
     (eprintf "Counterexample found!\n")
     (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h :cex))))]
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
   [("-d" "--debug") type "Turn on debug information"
    (set! debug (cons (string->symbol type) debug))]
   [("+x") name "Set an option" (flags (cons (string->symbol name) (flags)))]
   [("-x") name "Unset an option" (flags (cons (string->symbol name) (flags)))]

   #:subcommands
   ["accept"
    #:args (fname problem)
    (do-accept (get-problem fname problem) #:debug debug)]
   ["debug"
    #:args (fname problem)
    (do-debug (get-problem fname problem) #:debug debug)]
   ["dump"
    #:once-each
    [("--screenshot") sname "File with a web page screenshot"
     (set! screenshot sname)]
    #:args (fname problem)
    (do-debug (get-problem fname problem) #:debug debug)]
   ["export"
    #:args (fname problem)
    (do-export (get-problem fname problem))]
   ["render"
    #:args (fname problem)
    (do-render (get-problem fname problem) #:debug debug)]
   ["sketch"
    #:args (fname problem)
    (do-sketch (get-problem fname problem) #:debug debug)]
   ["smt2"
    #:args (fname problem)
    (do-smt2 (get-problem fname problem))]
   ["verify"
    #:args (fname problem)
    (do-verify (get-problem fname problem) #:debug debug)]))