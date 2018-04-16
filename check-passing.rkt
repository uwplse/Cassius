#lang racket

(require json)

(module+ main
  (command-line
   #:program "filter-working.rkt"
   #:args (json)
   (define data (call-with-input-file json read-json))
   (for ([rec data] #:when (equal? (dict-ref rec 'status) "fail"))
     (write-json (make-hash (list (cons 'problem (dict-ref rec 'problem))
                                  (cons 'url (dict-ref rec 'url))))))))
