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

(struct result (file problem test section status description features time url))

(define (run-file-tests file #:debug [debug '()] #:valid [valid? (const true)] #:index [index (hash)])
  (define probs (call-with-input-file file parse-file))

  (for/list ([(pname prob) (in-dict (sort (hash->list probs) symbol<? #:key car))] #:when (valid? prob))
    (eprintf "~a\t~a\t" file pname)

    (define eng
      (engine (λ (_)
                (parameterize ([current-error-port (open-output-string)]
                               [current-output-port (open-output-string)])
                  (with-handlers
                      ([exn:break? (λ (e) 'break)]
                       [exn:fail? (λ (e) (list 'error e))])
                    (solve (dict-ref prob ':sheets) (dict-ref prob ':documents) #:debug debug))))))

    (define t (current-inexact-milliseconds))
    (define res (if (engine-run 60000 eng) (engine-result eng) 'timeout)) ; 1m max
    (define runtime (- (current-inexact-milliseconds) t))
    (engine-kill eng)

    (define status
      (match res
        ['timeout 'timeout]
        [(list 'error e)
         (newline)
         ((error-display-handler) (exn-message e) e)
         (newline)
         'error]
        ['break 'break]
        [(success stylesheet trees) 'success]
        [(failure stylesheet trees)
         (if (null? (set-subtract (dict-ref prob ':features) supported-features)) 'fail 'unsupported)]))
    (eprintf "~a\n" status)

    (define uname (file-name-stem (car (dict-ref prob ':url))))
    (result file pname uname (hash-ref index (normalize-uname uname) "unknown")
            status (car (dict-ref prob ':title)) (dict-ref prob ':features) runtime
            (car (dict-ref prob ':url)))))

(define (file-name-stem fn)
  (define-values (_1 uname _2) (split-path fn))
  uname)

(define (call-with-output-to outname #:extension [extension #f] #:exists [exists 'error] f . args)
  (if outname
      (call-with-output-file (if extension (format "~a.~a" outname extension) outname) #:exists exists
        (apply curry f args))
      (apply f (append args (list (current-output-port))))))

(define (row #:cell [cell 'td] #:hide [hide #f] #:class [class #f] . args)
  `(tr (,@(if class `((class ,class)) '()))
       ,@(for/list ([arg args]) `(,cell () ,(if (equal? arg hide) "" arg)))))

(define (write-report results #:output [outname #f])
  (define (count-type set t)
    (count (λ (x) (equal? (result-status x) t)) set))
  (define (set->results set)
    (map (compose number->string (curry count-type set)) '(success fail error timeout unsupported)))

  (call-with-output-to
   outname #:extension "json" #:exists 'replace
   write-json
   (for/list ([res results])
     (match-define (result file problem test section status description features time url) res)
     (make-hash `((file . ,(~a file)) (test . ,(~a test)) (section . ,section) (status . ,(~a status)) (features . ,(map ~a features)) (time . ,time)))))

  (call-with-output-to
   outname #:extension "html" #:exists 'replace
   write-xexpr
   `(html ((lang "en_US"))
     (meta ((charset "utf8")))
     (link ((rel "stylesheet") (href "report.css")))
     (title ,(format "Cassius results for ~a" (string-join (remove-duplicates (map result-file results)) ", ")))
     (body ()
      (table ((id "sections") (rules "groups"))
       (thead ()
        ,(row #:cell 'th "" "Pass" "Fail" "Error" "Time" "Skip" "")
        ,(apply row `(strong "Total") (set->results results)))
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
       ,@(for/list ([group-results (group-by result-file results)])
           `(tbody
             (tr () (th ((colspan "4")) ,(result-file (car group-results))))
             ,@(for/list ([res group-results] #:when (not (member (result-status res) '(success unsupported))))
                 (match-define (result file problem test section status description features time url) res)
                 (row #:class (~a status) (~a problem) `(a ((href ,url)) ,(~a test)) description
                      (match status
                        ['success "✔"] ['fail "✘"] ['timeout "🕡"]
                        ['unsupported
                         (define probfeats (set-subtract features supported-features))
                         `(span ((title ,(string-join (map ~a probfeats) ", "))) "☹")]
                        ['error "!"])))))))))))

(define-syntax-rule (and! var function)
  (set! var (let ([test var]) (λ (x) (and (function x) (test x))))))

(module+ main
  (define debug '())
  (define out-file #f)
  (define old-json #f)
  (define index (hash))
  (define valid? (const true))

  (command-line
   #:program "cassius"
   #:multi
   [("-d" "--debug") type "Turn on debug information"
    (set! debug (cons (string->symbol type) debug))]
   [("+x") name "Set an option" (flags (cons (string->symbol name) (flags)))]
   [("-x") name "Unset an option" (flags (cons (string->symbol name) (flags)))]
   #:once-each
   [("-o" "--output") fname "File name for final CSS file"
    (set! out-file fname)]
   [("--index") sname "File name with section information for tests"
    (set!
     index
     (for*/hash ([sec (call-with-input-file sname read-json)] [(k v) (in-hash sec)])
       (values (normalize-index k v) v)))]
   [("--supported") "Skip tests with unsupported features"
    (and! valid? (λ (p) (subset? (dict-ref p ':features) supported-features)))]
   [("--failed") json "Run only tests that failed in given JSON file"
    (define failed-tests
      (for/list ([rec (call-with-input-file json read-json)]
                 #:unless (equal? (dict-ref rec 'status) "success"))
        (dict-ref rec 'test)))
    (and! valid?
          (λ (p) (set-member? failed-tests (~a (file-name-stem (car (dict-ref p ':url)))))))]
   [("--feature") fname "Test a particular feature"
    (and! valid? (λ (p) (set-member? (dict-ref p ':features) (string->symbol fname))))]
   #:args fnames
   (pretty-print out-file)
   (write-report
    #:output out-file
    (for/append ([file fnames])
      (run-file-tests file #:debug debug #:valid valid? #:index index)))))
