#lang racket
(require racket/runtime-path (only-in xml write-xexpr make-cdata))

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
      (define rel-path (find-relative-path dir json))
      (define-values (branch prob) (parse-json-path (file-name-from-path json)))
      (define prob-data (dict-ref! data (string->symbol prob) (list)))
      (define time (seconds->date (string->number (directory-name subdir))))
      (define file-data
        (let ([read-data (λ () (summarize-data time branch rel-path (call-with-input-file json read-json)))])
          (dict-ref skip (list (date->seconds time) (string->symbol prob) branch) read-data)))
      (dict-set! data (string->symbol prob) (cons file-data prob-data))))
  data)

(define (summarize-data time branch rel-path data)
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
  (dict-set! status-counts ':path (path->string rel-path))
  status-counts)

(define-runtime-path graph-js-path "index-chart.js")
(define-runtime-path index-css-path "index.css")

(define (make-index data dir #:cache [cache #f])
  (when cache
    (call-with-output-file cache #:exists 'replace (λ (p) (write-json data p))))
  (copy-file graph-js-path (build-path dir "chart.js") #t)
  (copy-file index-css-path (build-path dir "index.css") #t)

  (define script
    (format "d3.json('~a', (data) => draw(d3.select('#chart'), data))"
            (find-relative-path dir cache)))

  (define page
    `(html
      (head
       (meta ((charset "utf-8")))
       (title "Cassius reports")
       (link ((rel "stylesheet") (href "index.css"))))
      (body
       (figure ((id "chart")))
       (script ((src "https://d3js.org/d3.v4.min.js")))
       (script ((src "chart.js")))
       (script ,(make-cdata #f #f script)))))

  (call-with-output-file (build-path dir "index.html") #:exists 'replace
                         (λ (p) (write-xexpr page p))))

(module+ main
  (define cache #f)
  (command-line
   #:program "make-index.rkt"
   #:once-each
   ["--cache" cache-file "File to store a cache of read data in"
    (set! cache cache-file)]
   #:args (dir)
   (make-index (gather-data dir #:cache cache) dir #:cache cache)))
