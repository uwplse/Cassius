#lang racket

(require racket/path)
(require racket/set)
(require racket/engine)
(require racket/cmdline)
(require json)
(require "common.rkt")
(require "input.rkt")
(require "frontend.rkt")

(define (normalize-index name section)
  (if (string=? (last (string-split (~a name) "-")) (substring section 1))
      (string-join (drop-right (string-split (~a name) "-") 1) "-")
      name))

(define (normalize-uname uname)
  (define base (first (string-split (~a uname) ".")))
  (if (string=? (last (string-split base "-")) "ref")
      (string-join (drop-right (string-split base "-") 1) "-")
      base))

(define (section->tuple s)
  (if (string=? (substring s 0 1) "s")
      (cons "s" (map (λ (c) (or (string->number c) c)) (string-split (substring s 1) ".")))
      '("u")))

(define (number-string<? c1 c2)
  (cond
   [(and (number? c1) (number? c2)) (< c1 c2)]
   [(number? c1) #t]
   [(number? c2) #f]
   [else (string<? c1 c2)]))

(define (section-tuple<? s1 s2)
  (cond
   [(and (null? s1) (null? s2)) #f]
   [(null? s1) #t]
   [(null? s2) #f]
   [(number-string<? (car s1) (car s2)) #t]
   [(number-string<? (car s2) (car s1)) #f]
   [else (section-tuple<? (cdr s1) (cdr s2))]))

(define (section<? s1 s2)
  (section-tuple<? (section->tuple s1) (section->tuple s2)))

(struct result (file problem test section status description features output time url))

(define (run-file-tests file #:debug [debug '()] #:fast [fast? #f] #:index [index (hash)] #:feature [feature #f])
  (define probs (call-with-input-file file parse-file))

  (for/list ([(pname prob) (in-dict (sort (hash->list probs) symbol<? #:key car))]
        #:when (or (not fast?) (subset? (dict-ref prob ':features) supported-features))
        #:when (or (not feature) (set-member? (dict-ref prob ':features) feature)))
    (eprintf "~a\t~a\t" file pname)
    (define-values (ubase uname udir?) (split-path (car (dict-ref prob ':url))))

    (define out (open-output-string))
    (define eng
      (engine (λ (_)
                (parameterize ([current-error-port out] [current-output-port out])
                  (with-handlers
                      ([exn:break? (λ (e) 'break)]
                       [exn:fail? (λ (e) (list 'error e))])
                    (solve (dict-ref prob ':sheets) (dict-ref prob ':documents) #:debug debug))))))
    (define t (current-inexact-milliseconds))
    (define res
      (with-handlers ([exn:fail? (λ (e) 'error)])
        (if (engine-run 60000 eng) (engine-result eng) 'timeout))) ; 1m max
    (define runtime (- (current-inexact-milliseconds) t))
    (engine-kill eng)
    (define status
      (match res
        ['timeout 'timeout]
        [(list 'error e)
         (newline)
         ((error-display-handler) (exn-message e) e)
         'error]
        ['break 'break]
        [(success stylesheet trees) 'success]
        [(failure stylesheet trees)
         (if (null? (set-subtract (dict-ref prob ':features) supported-features)) 'fail 'unsupported)]))
    (eprintf "~a\n" status)
    (result file pname uname (hash-ref index (normalize-uname uname) "unknown")
            status (dict-ref prob ':desc) (dict-ref prob ':features) (get-output-string out) runtime
            (car (dict-ref prob ':url)))))

(define (number-or-empty? x)
  (if (zero? x) "" x))

(define (file-name-stem fn)
  (first (string-split (last (string-split fn "/")) ".")))

(define (run-report files #:debug [debug '()] #:output [outname #f] #:fast [fast? #f] #:classify [classify #f] #:feature [feature #f])
  (define index
    (if classify
        (for*/hash ([sec (call-with-input-file classify read-json)] [(k v) (in-hash sec)])
          (values (normalize-index k v) v))
        (hash)))

  (define resultss
    (for/list ([file files])
      (run-file-tests file #:debug debug #:fast fast? #:index index #:feature feature)))
  (define results (apply append resultss))

  (define out (if outname (open-output-file (format "~a.json" outname) #:exists 'replace) (current-output-port)))
  (write-json
   (for/list ([res results])
     (match-define (result file problem test section status description features output time url) res)
     (make-hash `((file . ,(~a file)) (test . ,(~a test)) (section . ,section) (status . ,(~a status)) (features . ,(map ~a features)) (time . ,time))))
   out)
  (when outname (close-output-port out))
  
  (set! out (if outname (open-output-file (format "~a.html" outname) #:exists 'replace) (current-output-port)))
  (parameterize ([current-output-port out])
    (printf "<!doctype html>\n<html lang='en_US'>\n<meta charset='utf8' />\n")
    (printf "<link rel='stylesheet' href='report.css' />\n")
    (printf "<title>Cassius results for ~a</title>\n" (string-join files ", "))
    (printf "<body>\n")

    (printf "<table id='sections'>\n")
    (printf "<tr><th>Section</th><th>Passing</th><th>Failing</th><th>Unsupported</th></tr>\n")
    (for ([section (sort (remove-duplicates (map result-section results)) section<?)])
      (define sresults (filter (λ (x) (equal? (result-section x) section)) results))
      (printf "<tr><td>~a</td><td>~a</td><td>~a</td><td>~a</td><td>~a</td></tr>\n"
              section
              (number-or-empty? (count (λ (x) (equal? (result-status x) 'success)) sresults))
              (number-or-empty? (count (λ (x) (member (result-status x) '(error fail))) sresults))
              (number-or-empty? (count (λ (x) (member (result-status x) '(unsupported timeout))) sresults))
              (string-join
               (for/list ([r sresults] #:when (member (result-status r) '(error fail)))
                 (format "<a href='~a'>~a:~a</a>" (result-url r) (file-name-stem (result-file r)) (result-problem r))) ",")
              ))
    (printf "</table>\n")

    (for ([fname files] [results resultss])
      (printf "<h2>~a</h2>\n" fname)
      (printf "<table class='results'>\n")
      (for ([res results] #:when (not (member (result-status res) '(success unsupported))))
        (match-define (result file problem test section status description features output time url) res)
        (printf "<tr><td>~a</td><td><a href='~a'>~a</a></td><td>~a</td><td class='~a'>~a</td></tr>\n"
                problem url test description status
                (match status ['success "✔"] ['fail "✘"] ['timeout "🕡"]
                  ['unsupported
                   (define probfeats (set-subtract features supported-features))
                   (format "<span title='~a'>☹</span>" (string-join (map ~a probfeats) ", "))]
                  ['error "!"])))
      (printf "</table>\n"))

    (printf "<h2>Status totals</h2>\n")
    (printf "<dl>\n")
    (for ([status '(success fail timeout unsupported error)])
      (printf "<dt>~a</dt><dd>~a</dd>\n" status (count (λ (x) (equal? (result-status x) status)) results)))
    (printf "</dl>\n")
    (printf "<h2>Feature totals</h2>\n")
    (printf "<dl>\n")
    (for ([feature (remove-duplicates (append-map result-features results))])
      (printf "<dt>~a</dt><dd>~a only, ~a has </dd>\n" feature (count (λ (x) (equal? (result-features x) (list feature))) results) (count (λ (x) (member feature (result-features x))) results)))
    (printf "</dl>\n")
    (printf "</body>\n")
    (printf "</html>\n"))
  (when outname (close-output-port out)))

(module+ main
  (define debug '())
  (define out-file #f)
  (define classify #f)
  (define fast #f)
  (define feature #f)

  (command-line
   #:program "cassius"
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
   [("-o" "--output") fname "File name for final CSS file"
    (set! out-file fname)]
   [("--fast") "Skip tests with unsupported features"
    (set! fast #t)]
   [("--index") sname "File name with section information for tests"
    (set! classify sname)]
   [("--test") fname "Test a particular feature"
    (set! feature (string->symbol fname))]
   #:args fnames
   (run-report fnames #:debug debug #:output out-file #:fast fast #:classify classify #:feature feature)))
