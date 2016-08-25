#lang racket

(require racket/cmdline "../common.rkt" "../input.rkt" "../tree.rkt" "../dom.rkt" "../print/html.rkt")

(module+ main
  (command-line
   #:program "cassius export"
   #:args (fname pname)
   (let ([problem (hash-ref (call-with-input-file fname parse-file) (string->symbol pname))])
     (display
      (elements->string (parse-tree (dom-elements (car (dict-ref problem ':documents))))
                        #:sheets (dict-ref problem ':sheets '())
                        #:scripts (dict-ref problem ':scripts '())
                        #:title (dict-ref problem ':title #f))))))
