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
  
  ; Solve once to get the initial tree with bad values highlighted
  (define (solve-problem sheets documents debug)
    (with-handlers
        ([exn:break? (λ (e) 'break)]
         [exn:fail? (λ (e) (list 'error e))])
      (solve sheets documents #:debug debug)))
  
  ; Get the failure/success results of a given pass
  (define fixed #f)
  (define (match-result res)
    (match res
      [(success stylesheet trees)
       (set! fixed #t)
       (displayln (stylesheet->string stylesheet))
       (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h))))
       (eprintf "\nAccepted!\n")]
      [(failure stylesheet trees) #f]
      [(list 'error e)
       ((error-display-handler) (exn-message e) e) #t]
      ['break
       (eprintf "\nTerminated.\n") #t]))
  
  ; First, run solve without any repair holes
  (define result (solve-problem (list sheet) documents* debug))
  (define last-repaired-trees '()) ; Keeps track of the last tree we have tried to repair. If we have already tried this one, go to the last phase.
  (define continue #t)
  
  ; Keep looping until we reach the maximum number of repair attempts, or the result is accepted
  (for ([i max-repairs])
    #:break (or (equal? continue #f) (match-result result))
    (match result
      [(failure stylesheet trees)
       (displayln (stylesheet->string stylesheet))
       (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h))))
       
       ; Replace the bad tags with holes and attempt to repair the document
       (cond
         [(equal? repair-all #f)     
          ; Update trees
          (reset-replaced)
          (define new-trees
            (for/list ([t trees])
              (replace-ids-with-holes t #t)))
          
          ; Create new doms
          (define doms
            (for/list ([d documents*][t new-trees]) ;; d = <#dom>   
              ; Create a new instance of the problem again and try to solve
              (printf "\nRepairing this tree..\n\n")
              (displayln (tree->string t #:attrs '(:x :y :w :h)))
              (printf "\n")
              
              (match-define (dom name ctx tree) d)
              (dom name ctx t)))

          (set! continue (not (equal? last-repaired-trees new-trees)))
          (when continue
            (printf "\nAttempting to repair the document... \n\n")
            (set! result (solve-problem (list sheet) doms debug)))
            
          (set! last-repaired-trees new-trees)]
         [(equal? repair-all 't)
          (define doms
            (for/list ([d documents*] [t trees])
              (define new-tree (replace-ids-with-holes t))
              (match-define (dom name ctx tree) d)
              (dom name ctx new-tree)))
          (set! result (solve-problem (list sheet) doms debug))])]))
  
  ; Attempt to repair all holes at once
  (for ([i 1])
    #:break (or fixed (match-result result))
    (match result
      [(failure stylesheet trees)
       (displayln (stylesheet->string stylesheet))
       (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h))))
       (printf "\n\nUnable to repair the document... Attempting to repair by filling in all holes at once.\n\n")
       
       (define doms
         (for/list ([d documents*] [t trees])
           (reset-replaced)
           (define new-tree (replace-ids-with-holes t #f))
           (match-define (dom name ctx tree) d)
           (dom name ctx new-tree)))
       
       (set! result (solve-problem (list sheet) doms debug))]
      [(list 'error e)
       ((error-display-handler) (exn-message e) e) #t]
      ['break
       (eprintf "\nTerminated.\n") #t]))
  
  ; Try to synthesize a new rule that will make the document be accepted
  (for ([i 1])
    #:break (or fixed (match-result result))
    (match result
      [(failure stylesheet trees)
       (displayln (stylesheet->string stylesheet))
       (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h))))
       
       (printf "\n\nUnable to repair the document... Attempting to repair by synthesizing a new rule.\n\n")
       (set! sheet (append (list (list '? '?)) sheet))    
       (define doms
         (for/list ([d documents*] [t trees])
           (define new-tree (replace-ids-with-holes t #f))
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
  (define max-repairs 10)
  
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
