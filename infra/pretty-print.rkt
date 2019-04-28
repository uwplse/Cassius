#lang racket

(command-line
 #:args (file)
 (call-with-input-file file
   (λ (p)
     (for ([x (in-port read p)])
       (pretty-print x)))))
