#lang racket

(require racket/path racket/set racket/engine racket/cmdline)
(require json (only-in xml write-xexpr))
(require "common.rkt" "input.rkt" "frontend.rkt")

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

(define (run-file-tests file #:debug [debug '()] #:fast [fast? #f] #:index [index (hash)] #:feature [feature #f] #:old-json [old-json #f])
  (define probs (call-with-input-file file parse-file))
  (define passes-filter?
    (if old-json
         (curry set-member?
                (for/list ([rec (call-with-input-file old-json read-json)]
                           #:unless (equal? (dict-ref rec 'status) "success"))
                  (dict-ref rec 'test)))
        (const true)))

  (for/list ([(pname prob) (in-dict (sort (hash->list probs) symbol<? #:key car))]
        #:when (or (not fast?) (subset? (dict-ref prob ':features) supported-features))
        #:when (or (not feature) (set-member? (dict-ref prob ':features) feature))
        #:when (let-values ([(_1 uname _2) (split-path (car (dict-ref prob ':url)))])
                 (passes-filter? (~a uname))))
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
            status (car (dict-ref prob ':title)) (dict-ref prob ':features) (get-output-string out) runtime
            (car (dict-ref prob ':url)))))

(define (number-or-empty? x)
  (if (zero? x) "" x))

(define (file-name-stem fn)
  (first (string-split (last (string-split fn "/")) ".")))

(define (call-with-output-to outname #:extension [extension #f] #:exists [exists 'error] f . args)
  (if outname
      (call-with-output-file (if extension (format "~a.~a" outname extension) outname) #:exists exists
        (apply curry f args))
      (apply f args (current-output-port))))

(define (run-report files #:debug [debug '()] #:output [outname #f] #:fast [fast? #f] #:classify [classify #f] #:feature [feature #f] #:old-json [old-json #f])
  (define index
    (if classify
        (for*/hash ([sec (call-with-input-file classify read-json)] [(k v) (in-hash sec)])
          (values (normalize-index k v) v))
        (hash)))

  (define resultss
    (for/list ([file files])
      (run-file-tests file #:debug debug #:fast fast? #:index index #:feature feature #:old-json old-json)))
  (define results (apply append resultss))

  (call-with-output-to
   outname #:extension "json" #:exists 'replace
   write-json
   (for/list ([res results])
     (match-define (result file problem test section status description features output time url) res)
     (make-hash `((file . ,(~a file)) (test . ,(~a test)) (section . ,section) (status . ,(~a status)) (features . ,(map ~a features)) (time . ,time)))))

  (define (row #:cell [cell 'td] #:hide [hide #f] #:class [class #f] . args)
    `(tr (,@(if class `((class ,class)) '()))
         ,@(for/list ([arg args]) `(,cell () ,(if (equal? arg hide) "" arg)))))

  (define (count-type set t)
    (count (λ (x) (equal? (result-status x) t)) set))

  (define (set->results set)
    (map (compose number->string (curry count-type set)) '(success fail error timeout unsupported)))

  (call-with-output-to
   outname #:extension "html" #:exists 'replace
   write-xexpr
   `(html ((lang "en_US"))
     (meta ((charset "utf8")))
     (link ((rel "stylesheet") (href "report.css")))
     (title ,(format "Cassius results for ~a" (string-join files ", ")))
     (body ()
      (table ((id "sections") (rules "groups"))
       (thead ()
        ,(row #:cell 'th "Section" "Pass" "Fail" "Error" "Time" "Skip")
        ,(apply row `(strong "Total") (set->results results) #:hide "0"))
       (tbody ()
        ,@(for/list ([section (sort (remove-duplicates (map result-section results)) section<?)])
            (define sresults (filter (λ (x) (equal? (result-section x) section)) results))
            (keyword-apply
             row '(#:hide) '("0")
             (string-replace section "s" "§" #:all? #f)
             (append
              (set->results sresults)
              `((span ()
                 ,@(for/list ([r sresults] #:when (member (result-status r) '(error fail)))
                     `(a ((href ,(result-url r)))
                         ,(format "~a:~a" (file-name-stem (result-file r)) (result-problem r)))))))))))
      (section ()
       (h2 () "Feature totals")
       (table ()
        (thead () ,(row #:cell 'th "Feature" "# Blocking" "# Necessary"))
        ,@(for/list ([feature (remove-duplicates (append-map result-features results))])
            (row (~a feature)
                 (~a (count (λ (x) (equal? (result-features x) (list feature))) results))
                 (~a (count (λ (x) (member feature (result-features x))) results))))))
      (section ()
       (h2 () "Failing tests")
       (table ()
       ,@(for/list ([fname files] [results resultss])
           `(tbody
             (tr () (th ((colspan "4")) ,fname))
             ,@(for/list ([res results] #:when (not (member (result-status res) '(success unsupported))))
                 (match-define (result file problem test section status description features output time url) res)
                 (row #:class (~a status) (~a problem) `(a ((href ,url)) ,(~a test)) description
                      (match status
                        ['success "✔"] ['fail "✘"] ['timeout "🕡"]
                        ['unsupported
                         (define probfeats (set-subtract features supported-features))
                         `(span ((title ,(string-join (map ~a probfeats) ", "))) "☹")]
                        ['error "!"])))))))))))

(module+ main
  (define debug '())
  (define out-file #f)
  (define old-json #f)
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
   [("--rerun") json "Old JSON file of failures to rerun"
    (set! old-json json)]
   [("--test") fname "Test a particular feature"
    (set! feature (string->symbol fname))]
   #:args fnames
   (run-report fnames #:debug debug #:old-json old-json #:output out-file #:fast fast #:classify classify #:feature feature)))
