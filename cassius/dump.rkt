#lang racket
(require "dom.rkt")
(require "modify-dom.rkt")
(require "input.rkt")

(define (dump-problem fname pname out #:truncate [truncate #f])
  (define documents
    (problem-documents
     (hash-ref (call-with-input-file fname parse-file) (string->symbol pname))))
  (define tree
    (dom-tree
     (first
      (if truncate (map (curry dom-limit-depth truncate) documents) documents))))

  (let loop ([tree tree])
    (match (car tree)
      [(list (or 'LINE 'VIEW 'ANON) _ ...) (for-each loop (cdr tree))]
      [(list (or 'BLOCK 'INLINE 'MAGIC) attrs ...)
       (define tag (if (member ':tag attrs) (cadr (member ':tag attrs)) #f))
       (printf "<~a style='display: block; box-sizing: border-box; position: absolute; border: 2px solid black; " (or tag 'div))
       (for ([attr '(:w :h :x :y)] #:when (member attr attrs))
         (define property (match attr [':w 'width] [':h 'height] [':x 'left] [':y 'top]))
         (printf "~a: ~a; " property (cadr (member attr attrs))))
       (printf "'>")
       (unless (member tag '(HTML BODY))
         (printf "</~a>\n" (or tag 'div)))
       (for-each loop (cdr tree))
       (when (member tag '(HTML BODY))
         (printf "</~a>\n" (or tag 'div)))])))

(module+ main
  (define out-file #f)
  (define truncate #f)

  (command-line
   #:program "cassius"
   #:multi
   [("--truncate") level "Truncate the tree to this level"
    (set! truncate (string->number level))]
   #:once-each
   [("-o" "--output") fname "File name for final CSS file"
    (set! out-file fname)]
   #:args (fname problem)
   (dump-problem fname problem out-file #:truncate truncate)))
