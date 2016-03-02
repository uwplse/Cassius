#lang racket
(require "common.rkt")
(require "dom.rkt")
(require "modify-dom.rkt")
(require "input.rkt")

(define (dump-problem fname pname out #:truncate [truncate #f] #:screenshot [screenshot #f])
  (define documents
    (problem-documents
     (hash-ref (call-with-input-file fname parse-file) (string->symbol pname))))
  (define tree
    (dom-tree
     (first
      (if truncate (map (curry dom-limit-depth truncate) documents) documents))))
  
  (printf "<!doctype html>\n<html><body>\n")
  (when screenshot
    (define w (rendering-context-width (dom-context (first documents))))
    (printf "<img src='~a' width='~a' style='opacity:.4;position:absolute;top:0;left:0;'/>"
            screenshot w))

  (let loop ([tree tree])
    (match (car tree)
      [(list (or 'LINE 'VIEW 'ANON) _ ...) (for-each loop (cdr tree))]
      [(list (or 'BLOCK 'INLINE 'MAGIC) attrs ...)
       (printf "<div style='display: block; box-sizing: border-box; position: absolute; border: 2px solid black; ")
       (for ([attr '(:w :h :x :y)] #:when (member attr attrs))
         (define property (match attr [':w 'width] [':h 'height] [':x 'left] [':y 'top]))
         (printf "~a: ~apx; " property (real->double-flonum (->number (cadr (member attr attrs))))))
       (printf "'>")
       (printf "</div>\n")
       (for-each loop (cdr tree))]))

  (printf "</body></html>"))

(module+ main
  (define out-file #f)
  (define truncate #f)
  (define screenshot #f)

  (command-line
   #:program "cassius"
   #:multi
   [("--truncate") level "Truncate the tree to this level"
    (set! truncate (string->number level))]
   [("--screenshot") sname "File with a web page screenshot"
    (set! screenshot sname)]
   #:once-each
   [("-o" "--output") fname "File name for final CSS file"
    (set! out-file fname)]
   #:args (fname problem)
   (dump-problem fname problem out-file #:truncate truncate #:screenshot screenshot)))
