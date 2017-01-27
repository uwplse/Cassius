#lang racket

(require racket/cmdline
         "../common.rkt" "../input.rkt" "../tree.rkt" "../dom.rkt" "../modify-dom.rkt"
         "../frontend.rkt" "../actions.rkt" "../print/tree.rkt" "../print/css.rkt"
         "../main.rkt" "../match.rkt")

(define (run-file fname pname #:debug [debug '()])
  (define problem (hash-ref (call-with-input-file fname parse-file) (string->symbol pname)))
  (define documents (dict-ref problem ':documents))
  (define sheets (dict-ref problem ':sheets))

  (define documents*
    (for/list ([document documents])
      (match-define (dom name props elts boxes) document)
      (dom name props (parse-tree elts) (parse-tree boxes))))

  (define res
    (with-handlers
        ([exn:break? (λ (e) 'break)]
         [exn:fail? (λ (e) (list 'error e))])
      (css-values-solver
       (list documents*
             (for/list ([doc documents*]) (link-elts-boxes (apply append sheets) (dom-elements doc) (dom-boxes doc)))
             (apply append sheets))
       #f)))

  (pretty-print res))

(module+ main
  (define debug '())

  (command-line
   #:program "cassius test-new"
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
   #:args (fname problem)
   (run-file fname problem #:debug debug)))
