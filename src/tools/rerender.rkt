#lang racket

(require "../common.rkt")
(require "../input.rkt")
(require "../frontend.rkt")
(require "../dom.rkt")
(require "../modify-dom.rkt")
(require "../print/css.rkt")
(require "../print/tree.rkt")

(provide run-file)

(define num-holes 5)

(define (change-width d w)
  (define (tree-change-width tree)
    (cons (list* (caar tree) ':w w (apply append (for/list ([(k v) (in-groups 2 (cdar tree))] #:when (not (equal? k ':w))) (list k v)))) (cdr tree)))
  (dom (dom-name d) (dom-context d) (tree-change-width (dom-tree d))))

(define (run-file fname pname #:debug [debug '()] #:truncate truncate)
  (define problem (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))
  (define document (dict-ref problem ':documents))
  (define sheets (dict-ref problem ':sheets))

  (define documents*
    (map (if truncate (curry dom-limit-depth truncate) identity) documents))

  (define res
    (with-handlers
        ([exn:break? (λ (e) 'break)]
         [exn:fail? (λ (e) (list 'error e))])
      (solve sheets documents* #:debug debug)))

  (match res
    [(success _ trees)
     (eprintf "Inferred stylesheet\n")
     (printf "<!doctype html>\n<html>\n")
     (printf "<style>\n~a\n</style>" header)
     (printf "<body>\n")
     (let loop ([tree (car trees)])
       (match (car tree)
         [(list (or 'LINE 'VIEW 'ANON) _ ...) (for-each loop (cdr tree))]
         [(list (or 'BLOCK 'INLINE 'MAGIC) attrs ...)
          (define tag (cadr (member ':tag attrs)))
          (define style (cadr (member ':style attrs)))
          (printf "<div class='~a' style='~a'>\n"
                  tag
                  (string-join (for/list ([(k v) (in-dict style)])
                                 (format "~a: ~a" k (value->string (car v)))) "; "))
          (for-each loop (cdr tree))
          (printf "</div>\n")]))
     (printf "</body></html>\n")
     #|
     ;; rerendering code
     (displayln (tree->string tree #:attrs '(:style)))
     (define document**
       (change-width 
        ((dom-strip-attrs '(:style :tag))
         (dom (dom-name document*) (dom-context document*) tree)) w))
     (define res
       (with-handlers
           ([exn:break? (λ (e) 'break)]
            [exn:fail? (λ (e) (list 'error e))])
         (solve (list sheet) (list document**) #:debug debug)))
     (match res
       [(success _ (list tree))
        (displayln (tree->string tree #:attrs '(:x :y :w :h)))]
       [(failure stylesheet trees)
        (eprintf "Unable to rerender.\n")
        (for ([tree trees]) (displayln (tree->string tree #:attrs '(:x :y :w :h :style))))]
       [(list 'error e)
        ((error-display-handler) (exn-message e) e)]
       ['break
        (eprintf "Rendering terminated.\n")])
     |#]
    [(failure stylesheet trees)
     (eprintf "Unable to infer stylesheet.\n")
     (for ([tree trees]) (displayln (tree->string tree #:attrs '(:style :x :y :w :h))))]
    [(list 'error e)
     ((error-display-handler) (exn-message e) e)]
    ['break
     (eprintf "Rendering terminated.\n")])

  (exit (if (success? res) 0 1)))

(module+ main
  (define debug '())
  (define truncate #f)

  (command-line
   #:program "cassius render"
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
   #:args (fname problem)
   (run-file fname problem #:debug debug #:truncate truncate)))
