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

(define (run-file fname pname #:debug [debug '()] #:truncate truncate #:repair-all repair-all #:max-repairs max-repairs)
  (match-define
    (problem desc url header sheet documents features test)
    (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))
  
  (define documents*
    (if truncate (map (curry dom-limit-depth truncate) documents) documents))

  (define documents-orig documents*)
  (define repaired-elt-paths '()) ; Keep track of all of the elements we have tried to repair so far
  
  ; Solve once to get the tree with holes highlighed 
  (define (solve-problem sheets documents debug)
    (with-handlers
        ([exn:break? (λ (e) 'break)]
         [exn:fail? (λ (e) (list 'error e))])
      (solve sheets documents #:debug debug)))

  ; Get the failure/succeses results
  (define fixed #f)
  (define (match-result res)
    (match res
      [(success stylesheet trees)
       (set! fixed #t)
       (displayln (stylesheet->string stylesheet))
       (for-each (compose displayln tree->string) trees)
       (eprintf "\nAccepted!\n")]
      [(failure stylesheet trees) #f]
      [(list 'error e)
       ((error-display-handler) (exn-message e) e) #t]
      ['break
       (eprintf "\nTerminated.\n") #t]))

  ; First, run solve without any repair holes
  (define result (solve-problem (list sheet) documents* debug))
  (define last-repaired-tree '())

  ; Keep looping until we reach the maximum number of repair attempts, or the result is accepted
  (define continue #t)
  (for ([i max-repairs])
    #:break (or (not continue) (match-result result))
    (match result
      [(failure stylesheet trees)
       (displayln (stylesheet->string stylesheet))
       (for-each (compose displayln tree->string) trees)
       ; Replace the bad tags with holes and attempt to repair the document
       (cond
         [(equal? repair-all #f)
          (define doms
            (for/list ([d documents*][t trees]) ;; d = <#dom>
              ; Replace one id or tag with a ?. If the last tag or id could not be fixed, set it back to what it was previously
              (set-replaced #f)
              (define new-tree (replace-one-id-with-hole t))
              (set! continue (not (equal? last-repaired-tree new-tree))) ; break out if we are trying to repair the exact same tree
              (set! last-repaired-tree new-tree)

              ; Createe a new instance of the problem again and try to solve
              (printf "\nRepairing this tree..\n\n")
              ((compose displayln tree->string) new-tree)
              (printf "\n")
              (match-define (dom name ctx tree) d)
              (dom name ctx new-tree)))
          (when continue
            (printf "\nAttempting to repair the document...\n\n")
            (set! result (solve-problem (list sheet) doms debug)))]
         [(equal? repair-all 't)
          (define doms
            (for/list ([d documents*] [t trees])
              (define new-tree (replace-ids-with-holes t))
              (match-define (dom name ctx tree) d)
              (dom name ctx new-tree)))
          (set! result (solve-problem (list sheet) doms debug))])]))
  
  ; Fill in all holes at once
  (set! continue #t)
  (for ([i max-repairs])
    #:break (or fixed (not continue) (match-result result))
    (match result
      [(failure stylesheet trees)
       (displayln (stylesheet->string stylesheet))
       (for-each (compose displayln tree->string) trees)
       (printf "\n\nUnable to repair the document... Attempting to repair by filling in all holes at once.\n\n")
       
       (define doms
         (for/list ([d documents*] [t trees])
           (define new-tree (replace-ids-with-holes t))
           (set! continue (not (equal? last-repaired-tree new-tree))) ; break out if we are trying to repair the exact same tree
           (set! last-repaired-tree new-tree)
           (match-define (dom name ctx tree) d)
           (dom name ctx new-tree)))
        (when continue (set! result (solve-problem (list sheet) doms debug)))]
      [(list 'error e)
       ((error-display-handler) (exn-message e) e) #t]
      ['break
       (eprintf "\nTerminated.\n") #t]))
  
  ; After looping for the max number, try to synthesize an empty rule that will make it work
  (for ([i 1])
    #:break (or fixed (match-result result))
    (match result
      [(failure stylesheet trees)
       (displayln (stylesheet->string stylesheet))
       (for-each (compose displayln tree->string) trees)
       (printf "\n\nUnable to repair the document... Attempting to repair by synthesizing a new rule.\n\n")
       (set! sheet (append (list (list '? '?)) sheet))
       
       (define doms
         (for/list ([d documents*] [t trees])
           (define new-tree (replace-ids-with-holes t))
           (match-define (dom name ctx tree) d)
           (dom name ctx new-tree)))
       
       (match-result (solve-problem (list sheet) doms debug))]    
      [(list 'error e)
       ((error-display-handler) (exn-message e) e) #t]
      ['break
       (eprintf "\nTerminated.\n") #t]))) 

(module+ main
  (define debug '())
  (define truncate #f)
  (define repair-all #f)
  (define max-repairs 5)
  
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
   [("--repair-all") repairall "Repair the document by filling all holes in at once"
                 (set! repair-all (string->symbol repairall))]
   [("--max-repairs") maxrepairs "Set the maximum number of repair attempts"
                 (set! max-repairs (string->number maxrepairs))]
   #:args (fname problem)
   (run-file fname problem #:debug debug #:truncate truncate #:repair-all repair-all #:max-repairs max-repairs)))
