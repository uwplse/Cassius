#lang racket

(require racket/cmdline)
(require "../common.rkt")
(require "../input.rkt")
(require "../frontend.rkt")
(require "../dom.rkt")
(require "../modify-dom.rkt")
(require "../print/tree.rkt")
(require "../print/css.rkt")
(require "../main.rkt")

(define (run-file fname pname #:debug [debug '()] #:truncate truncate #:repair repair)
  (match-define
    (problem desc url header sheet documents features test)
    (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))
  
  (define documents*
    (if truncate (map (curry dom-limit-depth truncate) documents) documents))
  
  ; Secondary repair pass to fill in holes in the IDs and tag names
  (define (repair-pass trees)
    (printf "\nAttempting to repair the document..\n")
    (define second-res
      (with-handlers
          ([exn:break? (λ (e) 'break)]
           [exn:fail? (λ (e) (list 'error e))])
        (solve (list sheet) trees #:debug debug)))
    (match second-res
      [(success stylesheet trees)
       (displayln (stylesheet->string stylesheet))
       (for-each (compose displayln tree->string) trees)]
      [(failure stylesheet trees)
       (displayln (stylesheet->string stylesheet))
       (for-each (compose displayln tree->string) trees)
       (eprintf "Rejected.\n")]
      [(list 'error e)
       ((error-display-handler) (exn-message e) e)]
      ['break
       (eprintf "Terminated.\n")]))

  ; Solve once to get the tree with holes highlighed 
  (define res
    (with-handlers
        ([exn:break? (λ (e) 'break)]
         [exn:fail? (λ (e) (list 'error e))])
      (solve (list sheet) documents* #:debug debug)))
  
  ; If a failure was returned, trigger the repair process if the flag is set
  (match res
    [(success stylesheet trees)
     (eprintf "Accepted!\n")]
    [(failure stylesheet trees)
     (cond
       [(equal? repair #t)
        (displayln (stylesheet->string stylesheet))
        (for-each (compose displayln tree->string) trees)
        
        ; Replace the bad tags with holes and attempt to repair the document
        (define doms
          (for/list ([d documents*] [t trees]) ;; d = <#dom>
            (define new-tree  (replace-ids-with-holes t))
            (match-define (dom name ctx tree) d)
            (dom name ctx new-tree)))
        
        (repair-pass doms)]
       [
        (displayln (stylesheet->string stylesheet))
        (for-each (compose displayln tree->string) trees)
        (eprintf "Rejected 1.\n")])]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Terminated.\n")]))

(module+ main
  (define debug '())
  (define truncate #f)
  (define repair #t)
  
  (command-line
   #:program "cassius repair"
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
   [("--truncate") level "Truncate the tree to this level"
                   (set! truncate (string->number level))]
   [("--repair") userepair "Repair the given tree if the first pass is rejected"
                 (set! repair userepair)] ; TODO: Fix this flag to work. 
   #:args (fname problem)
   (run-file fname problem #:debug debug #:truncate truncate #:repair repair)))
