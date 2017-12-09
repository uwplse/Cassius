#lang racket

(require json racket/date)
(require "../src/common.rkt")

(define (directory-jsons dir)
  (reap [sow]
    (let loop ([dir dir])
      (cond
       [(directory-exists? dir)
        (for-each loop (directory-list dir #:build? true))]
       [(path-has-extension? dir #".json")
        (sow dir)]))))

(define (parse-json-path path)
  (define s (path->string (path-replace-extension path #"")))
  (match (string-split s ":")
    [(list branch prob)
     (values branch prob)]
    [(list prob)
     (values "master" prob)]))

(define (directory-name path)
  (let-values ([(base name dir?) (split-path path)])
    (path->string name)))

(define (gather-data dir #:cache [cache #f])
  (define old-data (if (and cache (file-exists? cache)) (call-with-input-file cache read-json) (hash)))
  (define data (make-hash))
  (for ([subdir (directory-list dir #:build? true)] #:when (directory-exists? subdir))
    (define skip
      (for*/hash ([(prob data) (in-dict old-data)] [rec data])
        (values (list (dict-ref rec ':time #f) prob (dict-ref rec ':branch #f)) rec)))
    (for ([json (directory-jsons subdir)])
      (define-values (branch prob) (parse-json-path (file-name-from-path json)))
      (define prob-data (dict-ref! data (string->symbol prob) (list)))
      (define time (seconds->date (string->number (directory-name subdir))))
      (define file-data 
        (let ([read-data (λ () (summarize-data time branch (call-with-input-file json read-json)))])
          (dict-ref skip (list (date->seconds time) (string->symbol prob) branch) read-data)))
      (dict-set! data (string->symbol prob) (cons file-data prob-data))))
  data)

(define (summarize-data time branch data)
  (define statuses (for/list ([problem data]) (dict-ref problem 'status)))
  (define status-counts
    (make-hash
     (for/list ([group (group-by identity statuses)])
       (cons (string->symbol (car group)) (length group)))))
  (define runtime
    (apply + (for/list ([problem data]) (dict-ref problem 'time 0))))
  (when (> runtime 0)
    (dict-set! status-counts ':runtime runtime))
  (dict-set! status-counts ':time (date->seconds time))
  (dict-set! status-counts ':branch branch)
  status-counts)

(define (make-index data file #:cache [cache #f])
  (when cache
    (call-with-output-file cache #:exists 'replace (λ (p) (write-json data p))))

  (for ([(prob data) (in-dict data)])
    (printf "\n~a\n" prob)
    (for ([data (sort data < #:key (curryr dict-ref ':time))])
      (printf "~a,~a,~a,~a,~a,~a,~a,~a,~a\n"
              (dict-ref data ':time)
              (dict-ref data ':branch)
              (dict-ref data 'success 0)
              (dict-ref data 'expected 0)
              (dict-ref data 'timeout 0)
              (dict-ref data 'fail 0)
              (dict-ref data 'error 0)
              (dict-ref data 'unsupported 0)
              (dict-ref data ':runtime #f)))))

(module+ main
  (define cache #f)
  (command-line
   #:program "make-index.rkt"
   #:once-each
   ["--cache" cache-file "File to store a cache of read data in"
    (set! cache cache-file)]
   #:args (dir index-file)
   (make-index (gather-data dir #:cache cache) index-file #:cache cache)))
