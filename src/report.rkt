#lang racket

(require racket/path racket/set racket/engine racket/cmdline math/base)
(require json (only-in xml write-xexpr))
(require "common.rkt" "input.rkt" "frontend.rkt" "dom.rkt" "run.rkt")

(define timeout (make-parameter 60))
(define show-success (make-parameter false))
(define aggregate (make-parameter false))

(define (dom-not-something d)
  (match-define (dom name ctx elts boxes) d)
  
  (define constraints 0)

  (let loop ([tree boxes])
    (when (member (caar tree) '(LINE BLOCK INLINE))
      (set! constraints (+ constraints (count (curryr member '(:x :y :w :h)) (cdar tree)))))
    (for-each loop (cdr tree)))
  
  (define idx (random-integer 0 constraints))
  (set! constraints 0)

  ;; Not my fault
  (dom name ctx elts
       (let loop ([tree boxes])
         (cond
          [(> constraints idx) tree]
          [(member (caar tree) '(LINE BLOCK INLINE))
           (set! constraints (+ constraints (count (curryr member '(:x :y :w :h)) (cdar tree))))
           (cons (cons (caar tree)
                       (let loop2 ([n (- constraints idx)] [props (cdar tree)])
                         (cond
                          [(null? props) props]
                          [(and (= n 1) (member (car props) '(:x :y :w :h)))
                           (list* (car props) `(not ,(cadr props)) (cddr props))]
                          [(and (member (car props) '(:x :y :w :h)))
                           (list* (car props) (cadr props) (loop2 (- n 1) (cddr props)))]
                          [else
                           (list* (car props) (cadr props) (loop2 n (cddr props)))])))
                 (map loop (cdr tree)))]
          [else (cons (car tree) (map loop (cdr tree)))]))))

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

(define (run-problem prob)
  (define custodian (make-custodian))
  (define eng
    (engine (λ (_)
              (parameterize ([current-error-port (open-output-nowhere)]
                             [current-output-port (open-output-nowhere)]
                             [current-subprocess-custodian-mode 'kill]
                             [current-custodian custodian])
                (with-handlers
                    ([exn:break? (λ (e) 'break)]
                     [exn:fail? (λ (e) (list 'error e))])
                  (solve (dict-ref prob ':sheets) (dict-ref prob ':documents) (dict-ref prob ':test #f)))))))

  (define t (current-inexact-milliseconds))
  (define res (if (engine-run (* 1000 (timeout)) eng) (engine-result eng) 'timeout)) ; 1m max
  (define runtime (- (current-inexact-milliseconds) t))
  (engine-kill eng)
  (custodian-shutdown-all custodian)
  (values res runtime))

(struct result (file problem test section status description features time url) #:prefab)

(define (test-regression file pname prob #:index [index (hash)])
  (eprintf "~a\t~a\t" file pname)
  (define-values (res runtime) (run-problem prob))
  (define supported? (null? (set-subtract (dict-ref prob ':features '()) (supported-features))))

  (define status
    (match res
      ['timeout 'timeout]
      [(list 'error e) 'error]
      ['break 'break]
      [(success stylesheet trees doms) 'success]
      [(failure stylesheet trees) (if supported? 'fail 'unsupported)]))
  (eprintf "~a\n" status)

  (define uname (file-name-stem (car (dict-ref prob ':url '("/tmp")))))
  (result file pname uname (hash-ref index (normalize-uname uname) "unknown")
          status (car (dict-ref prob ':title)) (dict-ref prob ':features '()) runtime
          (car (dict-ref prob ':url '("/tmp")))))

(define (test-mutations file pname prob #:index [index (hash)])
  (eprintf "~a\t~a\t" file pname)
  (define prob* (dict-update prob ':documents (curry map dom-not-something)))
  (define-values (res runtime) (run-problem prob*))
  (define supported? (null? (set-subtract (dict-ref prob ':features '()) (supported-features))))

  (define status
    (match res
      ['timeout 'timeout]
      [(list 'error e) 'error]
      ['break 'break]
      [(success stylesheet trees doms) (if supported? 'fail 'unsupported)]
      [(failure stylesheet trees) 'success]))
  (eprintf "~a\n" status)

  (define uname (file-name-stem (car (dict-ref prob ':url '("/tmp")))))
  (result file pname uname (hash-ref index (normalize-uname uname) "unknown")
          status (car (dict-ref prob ':title)) (dict-ref prob ':features '()) runtime
          (car (dict-ref prob ':url '("/tmp")))))

(define (test-assertions assertion file pname prob #:index [index (hash)])
  (eprintf "~a\t~a\t~a\t" assertion file pname)
  (define prob* (dict-update prob ':documents (curry map dom-strip-positions)))
  (define-values (res runtime) (run-problem prob*))
  (define supported? (null? (set-subtract (dict-ref prob* ':features '()) (supported-features))))

  (define status
    (match res
      ['timeout 'timeout]
      [(list 'error e) 'error]
      ['break 'break]
      [(success stylesheet trees doms) 'fail]
      [(failure stylesheet trees) 'success]))
  (eprintf "~a\n" status)

  (define uname (file-name-stem (car (dict-ref prob ':url '("/tmp")))))
  (result file (format "~a on ~a" assertion pname) uname (hash-ref index (normalize-uname uname) "unknown")
          status (car (dict-ref prob ':title)) (dict-ref prob ':features '()) runtime
          (car (dict-ref prob ':url '("/tmp")))))

(define (run-regression-tests probs #:valid [valid? (const true)] #:index [index (hash)]
                              #:threads [threads #f])
  (define inputs
    (for/list ([(file x) (in-dict probs)] #:when (valid? (cdr x)))
      (list file (car x) (cdr x) index)))

  (if threads
      (let ([workers
             (build-list
              threads
              (λ (i)
                (place ch
                       (let loop ()
                         (match-define (list self file pname prob index) (place-channel-get ch))
                         (define result (test-regression file pname prob #:index index))
                         (place-channel-put ch (cons self result))
                         (loop)))))])
        (define to-send inputs)
        (for ([worker workers])
          (unless (null? to-send)
            (place-channel-put worker (cons worker (car to-send)))
            (set! to-send (cdr to-send))))
        (let loop ([out '()])
          (match-define (cons worker result) (apply sync workers))
          (unless (null? to-send)
            (place-channel-put worker (cons worker (car to-send)))
            (set! to-send (cdr to-send)))
          (define out* (cons result out))
          (if (= (length out*) (length inputs))
              out*
              (loop out*))))
      (for/list ([rec inputs])
        (match-define (list file pname prob index) rec)
        (test-regression file pname prob #:index index))))

(define (run-mutation-tests probs #:repeat [repeat 1] #:valid [valid? (const true)] #:index [index (hash)])
  (for/list ([(file x) (in-dict probs)] #:when (valid? (cdr x))
             [_ (in-range repeat)])
    (test-mutations file (car x) (cdr x) #:index index)))

(define (run-assertion-tests probs #:repeat [repeat 1] #:valid [valid? (const true)] #:index [index (hash)])
  (for/list ([(assertion x) (in-dict probs)] #:when (valid? (cddr x))
             [_ (in-range repeat)])
    (test-assertions assertion (first x) (second x) (cddr x) #:index index)))

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

(define (load-results file)
  (define data (call-with-input-file file read-json))
  (for/list ([rec data])
    (define (get field [convert identity]) (convert (dict-ref rec field)))
    (result (get 'file) (get 'problem) (get 'test string->symbol) (get 'section) (get 'status string->symbol)
            (get 'description) (get 'features (curry map string->symbol)) (get 'time) (get 'url))))

(define (shorten-filename name)
  (string-join (drop-right (string-split (~a (file-name-from-path name)) ".") 1) "."))

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
     (make-hash
      `((file . ,(~a file))
        (problem . ,(~a problem))
        (test . ,(~a test))
        (section . ,section)
        (status . ,(~a status))
        (description . ,description)
        (features . ,(map ~a features))
        (time . ,time)
        (url . ,url)))))
  
  (define unsupported-features
    (set-subtract (remove-duplicates (append-map result-features results)) (supported-features)))


  (define (feature-row feature)
    (list feature
          (count (λ (x) (equal? 
                         (set-subtract
                          (result-features x)
                          (if (set-member? (supported-features) feature)
                              (list)
                              (supported-features)))
                         (list feature))) results)
          (count (λ (x) (member feature (result-features x))) results)))

  (define (sort-features data)
    (sort (sort data > #:key third) > #:key second))

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
        ,(apply row `(strong "Total") (append (set->results results) '(""))))
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
      ,@(if (ormap (λ (r) (set-member? '(fail unsupported) (result-status r))) results)
            `((section ()
               (h2 () "Feature totals")
               (table ()
                (thead () ,(row #:cell 'th "Unsupported Feature" "# Blocking" "# Necessary"))
                (tbody () ,@(for/list ([data (sort-features (map feature-row unsupported-features))])
                              (apply row (map ~a data)))))))
            '())
      (section ()
       (h2 () "Failing tests")
       (table ()
       ,@(for/list ([group-results (group-by result-file results)]
                    #:unless (and
                              (not (aggregate))
                              (andmap (λ (res) (set-member? (if (show-success) '(unsupported) '(success unsupported))
                                                            (result-status res))) group-results)))
           (if (aggregate)
               (match-let ([(result file problem test section status description features time url)
                            (car group-results)])
                 (apply row `(a ((href ,url) (title ,(~a file))) ,(~a (shorten-filename file))) description
                        (for/list ([res group-results])
                          (define title
                            (if (equal? (result-status res) 'unsupported)
                                (let ([probfeats (set-subtract features (supported-features))])
                                  (format "~a\n~a" (result-problem res) (string-join (map ~a probfeats) ", ")))
                                (~a (result-problem res))))
                          (define status (result-status res))
                          `(span ((class ,(~a status)) (title ,title))
                                 ,(match status
                                    ['success "✔"] ['fail "✘"] ['timeout "🕡"]
                                    ['unsupported "☹"] ['error "!"])))))
               `(tbody
                 (tr () (th ((colspan "4")) ,(result-file (car group-results))))
                 ,@(for/list ([res group-results]
                              #:when (not (set-member? (if (show-success) '(unsupported) '(success unsupported))
                                                       (result-status res))))
                     (match-define (result file problem test section status description features time url) res)
                     (row (~a problem) `(a ((href ,url)) ,(~a test)) description
                          (match status
                            ['success `(span ((class "success")) "✔")]
                            ['fail `(span ((class "fail")) "✘")]
                            ['timeout `(span ((class "timeout")) "🕡")]
                            ['unsupported
                             (define probfeats (set-subtract features (supported-features)))
                             `(span ((class "unsupported") (title ,(string-join (map ~a probfeats) ", "))) "☹")]
                            ['error `(span ((class "error")) "!")]))))))))))))

(define (print-feature-table problems)
  (define all-features (remove-duplicates (append-map (λ (x) (dict-ref x ':features '())) problems)))
  (define unsupported-features (set-subtract all-features (supported-features)))

  (define width (apply max (map (compose string-length ~a) (cons "Feature" all-features))))
  (define (~feature feature) (~a feature #:width width))

  (define (feature-row feature)
    (list feature
          (count (λ (x) (equal? 
                         (set-subtract
                          (dict-ref x ':features '())
                          (if (set-member? (supported-features) feature)
                              (list)
                              (supported-features)))
                         (list feature))) problems)
          (count (λ (x) (member feature (dict-ref x ':features '()))) problems)))

  (define (sort-features data)
    (sort (sort data > #:key third) > #:key second))

  (printf "~a\t~a\t~a\n" (~feature "Feature") "#B" "#N")
  (for ([data (sort-features (map feature-row unsupported-features))])
    (printf "~a\t~a\t~a\n" (~feature (first data)) (second data) (third data)))

  (printf "\n~a\t~a\t~a\n" (~feature "Feature") "#B" "#N")
  (for ([data (sort-features (map feature-row (supported-features)))])
    (printf "~a\t~a\t~a\n" (~feature (first data)) (second data) (third data)))

  (printf "\n~a unsupported tests\n"
          (count (λ (prob) (not (subset? (dict-ref prob ':features '()) (supported-features)))) problems)))

(define-syntax-rule (and! var function)
  (set! var (let ([test var]) (λ (x) (and (function x) (test x))))))

(define (read-index iname)
  (for*/hash ([sec (call-with-input-file iname read-json)] [(k v) (in-hash sec)])
    (values (normalize-index k v) v)))

(define (read-failed-tests jname)
  (define failed-tests
    (for/list ([rec (call-with-input-file jname read-json)]
               #:unless (equal? (dict-ref rec 'status) "success"))
      (dict-ref rec 'test)))

  (λ (p) (set-member? failed-tests (~a (file-name-stem (car (dict-ref p ':url '("/tmp"))))))))

(module+ main
  (define out-file #f)
  (define index (hash))
  (define valid? (const true))
  (define repeat 1)
  (define threads #f)

  (multi-command-line
   #:program "report"

   #:multi
   [("-d" "--debug") "Turn on debug mode"
    (*debug* true)]
   [("+x") name "Set an option" (flags (cons (string->symbol name) (flags)))]
   [("-x") name "Unset an option" (flags (cons (string->symbol name) (flags)))]

   #:once-each
   [("-o" "--output") fname "File name for final CSS file"
    (set! out-file fname)]
   [("-t" "--timeout") s "Timeout in seconds"
    (timeout (string->number s))]
   [("--index") index-file "File name with section information for tests"
    (set! index (read-index index-file))]
   [("--show-success") "Output report rows for successful tests"
    (show-success true)]
   [("--aggregate") "Aggregate tests from one file together"
    (aggregate true)]
   [("--supported") "Skip tests with unsupported features"
    (and! valid? (λ (p) (subset? (dict-ref p ':features '()) (supported-features))))]
   [("--failed") json-file "Run only tests that failed in given JSON file"
    (and! valid? (read-failed-tests json-file))]
   [("--feature") feature "Test a particular feature"
    (and! valid? (λ (p) (set-member? (dict-ref p ':features '()) (string->symbol feature))))]

   #:subcommands

   ["regression"
    #:once-each
    [("--threads") t "How many threads to use"
     (set! threads (string->number t))]
    #:args fnames
    (write-report
     #:output out-file
     (let ([probs (for/append ([file fnames])
                              (define x (sort (hash->list (call-with-input-file file parse-file)) symbol<? #:key car))
                              (map (curry cons file) x))])
       (run-regression-tests probs #:valid valid? #:index index #:threads threads)))]

   ["mutation"
    #:once-each
    [("-n" "--repeat") n "How many random bugs to try per test"
     (set! repeat (string->number n))]
    #:args fnames
    (write-report
     #:output out-file
     (let ([probs (for/append ([file fnames])
                              (define x (sort (hash->list (call-with-input-file file parse-file)) symbol<? #:key car))
                              (map (curry cons file) x))])
       (run-mutation-tests probs #:valid valid? #:index index #:repeat repeat)))]

   ["features"
    #:args fnames
    (print-feature-table
     (for/append ([file fnames]) (dict-values (call-with-input-file file parse-file))))]

   ["available"
    #:args fnames
    (for* ([file fnames] [(name prob) (in-dict (call-with-input-file file parse-file))]
           #:when (subset? (dict-ref prob ':features '()) (supported-features)))
      (printf "~a ~a\n" file name))]

   ["assertions"
    #:args (assertions . fnames)
    (define prob1
      (for/append ([file fnames])
                  (define x (sort (hash->list (call-with-input-file file parse-file)) symbol<? #:key car))
                  (map (curry cons file) x)))
    (define assertions*
      (call-with-input-file assertions
        (λ (p) (sequence->list (in-port read p)))))

    (define probs
      (for*/list ([prob prob1] [assertion assertions*])
        (match-define `(define-test (,name ,args ...) ,body) assertion)
        (match-define (cons a (cons b c)) prob)
        (list* name a b (dict-set c ':test (list `(forall ,args ,body))))))
    (write-report
     #:output out-file
     (run-assertion-tests probs #:valid valid? #:index index))]

   ["rerender"
    #:args (json-file)
    (write-report #:output out-file (load-results json-file))]))
