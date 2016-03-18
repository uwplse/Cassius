#lang racket

(require racket/cmdline)
(require "../common.rkt")
(require "../input.rkt")
(require "../frontend.rkt")
(require "../modify-dom.rkt")
(require "../dom.rkt")
(require "../print/tree.rkt")

(define (run-file fname pname #:debug [debug '()] #:repeat [n 1])
  (match-define
   (problem desc url header sheet documents features test)
   (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))

  (for-each (curry for-each (compose displayln tree->string dom-tree))
            (remove-duplicates #:key (curry map dom-tree)
             (filter identity
                     (for/list ([i (in-range n)])
                       (define documents* (map dom-not-something documents))
                       (solve-problem sheet documents* debug))))))

(define (solve-problem sheet documents debug)
  (define out (open-output-string))
  (define res
    (parameterize ([current-output-port out] [current-error-port out])
      (with-handlers
          ([exn:break? (λ (e) 'break)]
           [exn:fail? (λ (e) (list 'error e))])
        (solve (list sheet) documents #:debug debug))))

  (match res
    [(success stylesheet trees)
     documents]
    [(failure core) #f]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)
     documents]
    ['break
     #f]))

(module+ main
  (define debug '())
  (define repeat 1)

  (command-line
   #:program "cassius accept"
   #:multi
   [("-d" "--debug") type "Turn on debug information"
    (set! debug (cons (string->symbol type) debug))]
   [("-f" "--feature") name "Toggle a feature; use -name and +name to unset or set"
    (cond
      [(equal? (substring name 0 1) "+") (flags (cons (string->symbol (substring name 1)) (flags)))]
      [(equal? (substring name 0 1) "-") (flags (remove (string->symbol (substring name 1)) (flags)))]
      [else
       (define name* (string->symbol name))
       (flags (if (memq name* (flags)) (remove name* (flags)) (cons name* (flags))))])]
   #:once-each
   [("-n" "--repeat") times "Don't solve the constraints, just output them"
    (set! repeat (string->number times))]
   #:args (fname problem)
   (run-file fname problem #:debug debug #:repeat repeat) ))
