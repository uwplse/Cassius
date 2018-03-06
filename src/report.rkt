#lang racket

(require racket/path racket/set racket/engine racket/cmdline)
(require json (only-in xml write-xexpr))
(require "common.rkt" "input.rkt" "frontend.rkt" "dom.rkt" "run.rkt")

(define verbose (make-parameter false))
(define timeout (make-parameter 60))
(define show-success (make-parameter false))
(define expected-failures (make-parameter '()))

(define (expected? . info)
  (set-member? (expected-failures) info))

(define (dom-not-something d)
  (match-define (dom name ctx elts boxes) d)
  
  (define constraints 0)

  (let loop ([tree boxes])
    (when (member (caar tree) '(LINE BLOCK INLINE))
      (set! constraints (+ constraints (count (curryr member '(:x :y :w :h)) (cdar tree)))))
    (for-each loop (cdr tree)))
  
  (define idx (random 0 constraints))
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

(define (run-problem prob #:fuzz [fuzz? '(/ 10 60)])
  (define custodian (make-custodian))
  (define eng
    (engine (λ (_)
              (with-handlers
                  ([exn:break? (λ (e) 'break)]
                   [exn:fail? (λ (e)
                                ((error-display-handler)
                                 (exn-message e)
                                 e)
                                (list 'error e))])

                (parameterize ([current-error-port (if (verbose) (current-error-port) (open-output-nowhere))]
                               [current-output-port (if (verbose) (current-output-port) (open-output-nowhere))]
                               [current-subprocess-custodian-mode 'kill]
                               [current-custodian custodian]
                               [*fuzz* fuzz?])
                  (solve (dict-ref prob ':sheets) (dict-ref prob ':documents) (dict-ref prob ':test #f)
                         (dict-ref prob ':fonts)))))))

  (define t (current-inexact-milliseconds))
  (define res (if (engine-run (* 1000 (timeout)) eng) (engine-result eng) 'timeout))
  (define runtime (- (current-inexact-milliseconds) t))
  (engine-kill eng)
  (custodian-shutdown-all custodian)
  (values res runtime))

(struct result (file problem subproblem test section status description features time url) #:prefab)

(define (make-result file pname prob #:subproblem [subproblem #f] #:index [index (hash)])
  (define url (car (dict-ref prob ':url '("/tmp"))))
  (result file pname subproblem
          (file-name-stem url) (get-index index (file-name-stem url))
          'ready (car (dict-ref prob ':title))
          (dict-ref prob ':features '()) #f url))

(define (get-status info prob res #:invert [invert? #f] #:unsupported [unsupported? #t])
  (define out
    (match res
      ['timeout 'timeout]
      [(list 'error e) 'error]
      ['break 'break]
      [(success stylesheet trees doms) (if invert? 'fail 'success)]
      [(failure stylesheet trees) (if invert? 'success 'fail)]))
  (cond
   [(not (equal? out 'fail))
    out]
   [(apply expected? info)
    'expected]
   [(and
     (not (subset? (dict-ref prob ':features '()) (supported-features)))
     unsupported?)
    'unsupported]
   [else
    'fail]))

(define (test-regression file pname prob #:index [index (hash)])
  (eprintf "~a\t~a\t" file pname)
  (define res (make-result file pname prob #:index index))
  (define-values (out runtime) (run-problem prob))
  (define status (get-status (list file pname) prob out #:invert false #:unsupported true))
  (eprintf "~a\n" status)
  (flush-output (current-error-port))
  (struct-copy result res [status status] [time runtime]))

(define (test-mutations file pname prob #:index [index (hash)])
  (eprintf "~a\t~a\t" file pname)
  (define prob* (dict-update prob ':documents (curry map dom-not-something)))
  (define res (make-result file pname prob #:index index))
  (define-values (out runtime) (run-problem prob*))
  (define status (get-status (list file pname) prob out #:invert true #:unsupported true))
  (eprintf "~a\n" status)
  (flush-output (current-error-port))
  (struct-copy result res [status status] [time runtime]))

(define (test-assertions assertion file pname prob #:index [index (hash)])
  (eprintf "~a\t~a\t~a\t" file pname assertion)
  (define prob* (dict-update prob ':documents (curry map dom-strip-positions)))
  (define res (make-result file pname prob #:subproblem assertion #:index index))
  (define-values (out runtime) (run-problem prob* #:fuzz #f))
  (define status (get-status (list file pname assertion) prob out #:invert true #:unsupported false))

  (eprintf "~a\n" status)
  (flush-output (current-error-port))
  (struct-copy result res [status status] [time runtime]))

(define-syntax-rule (for/threads num-threads ([input all-inputs]) body ...)
  (let ([threads num-threads] [inputs all-inputs])
    (if threads
        (let ([workers
               (build-list
                threads
                (λ (i)
                  (place ch
                         (match-define (list-rest verbose* timeout* expected-failures*) (place-channel-get ch))
                         (verbose verbose*)
                         (timeout timeout*)
                         (expected-failures expected-failures*)
                         (let loop ()
                           (match-define (cons self (cons id thing)) (place-channel-get ch))
                           (define result
                             (let ([input thing])
                               body ...))
                           (place-channel-put ch (cons self (cons id result)))
                           (loop)))))])
          (for ([worker workers])
            (place-channel-put worker (list* (verbose) (timeout) (expected-failures))))
          (define to-send (map cons (range 0 (length inputs)) inputs))
          (for ([worker workers])
            (unless (null? to-send)
              (place-channel-put worker (cons worker (car to-send)))
              (set! to-send (cdr to-send))))
          (let loop ([out '()])
            (cond
             [(= (length out) (length inputs))
              (map cdr (sort out < #:key car))]
             [else
              (match-define (cons worker result) (apply sync workers))
              (unless (null? to-send)
                (place-channel-put worker (cons worker (car to-send)))
                (set! to-send (cdr to-send)))
              (loop (cons result out))])))
        (for/list ([input inputs]) body ...))))

(define (run-regression-tests probs #:valid [valid? (const true)] #:index [index (hash)]
                              #:threads [threads #f])
  (define inputs
    (for/list ([(file x) (in-dict probs)] #:when (valid? (cdr x)))
      (list file (car x) (cdr x) index)))

  (for/threads threads ([rec inputs])
    (match-define (list file pname prob index) rec)
    (test-regression file pname prob #:index index)))

(define (run-mutation-tests probs #:repeat [repeat 1] #:valid [valid? (const true)] #:index [index (hash)]
                            #:threads [threads #f])
  (define inputs
    (for/list ([(file x) (in-dict probs)] #:when (valid? (cdr x))
               [_ (in-range repeat)])
      (list file (car x) (cdr x) index)))
  (for/threads threads ([rec inputs])
    (match-define (list file pname prob index) rec)
    (test-mutations file pname prob #:index index)))

(define (run-assertion-tests probs #:repeat [repeat 1] #:valid [valid? (const true)] #:index [index (hash)]
                             #:threads [threads #f])
  (define inputs
    (for/list ([(assertion x) (in-dict probs)] #:when (valid? (cddr x))
               [_ (in-range repeat)])
      (list assertion (first x) (second x) (cddr x) index)))
  (for/threads threads ([rec inputs])
    (match-define (list assertion file pname prob index) rec)
    (test-assertions assertion file pname prob #:index index)))

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
    (result (get 'file) (get 'problem string->symbol) (and (get 'subproblem) (get 'subproblem string->symbol))
            (get 'test string->symbol) (get 'section)
            (match (get 'status string->symbol)
              [(or 'fail 'unsupported 'expected)
               (cond
                [(apply expected? (get 'file) (get 'problem string->symbol)
                        (if (get 'subproblem)
                            (list (get 'subproblem string->symbol))
                            (list)))
                 'expected]
                [(not (subset? (get 'features (curry map string->symbol)) (supported-features)))
                 'unsupported]
                [else 'fail])]
              [s s])
            (get 'description) (get 'features (curry map string->symbol)) (get 'time) (get 'url))))

(define (shorten-filename name)
  (string-join (drop-right (string-split (~a (file-name-from-path name)) ".") 1) "."))

(define (write-json* results #:output [outname #f])
  (call-with-output-to
   outname #:extension "json" #:exists 'replace
   write-json
   (for/list ([res results])
     (match-define (result file problem subproblem test section status description features time url) res)
     (make-hash
      `((file . ,(~a file))
        (problem . ,(~a problem))
        (subproblem . ,(and subproblem (~a subproblem)))
        (test . ,(~a test))
        (section . ,section)
        (status . ,(~a status))
        (description . ,description)
        (features . ,(map ~a features))
        (time . ,time)
        (url . ,url))))))

(define (status-symbol status)
  (match status
    ['success "✔"] ['fail "✘"] ['timeout "🕡"]
    ['unsupported "☹"] ['error "!"] ['expected "-"]
    ['ready "0"]))

(define (print-time ms)
  (cond
   [(< ms 2) (format "~ams" (~r ms #:precision 3))]
   [(< ms 2000) (format "~ams" (~r ms #:precision 1))]
   [(< ms 120000) (format "~as" (~r (/ ms 1000) #:precision 1))]
   [(< ms 7200000) (format "~amin" (~r (/ ms 60000) #:precision 1))]
   [else (format "~ahr" (~r (/ ms 3600000) #:precision 1))]))

(define (write-report results #:output [outname #f])
  (write-json* results #:output outname)

  (define total-time
    (apply + (map result-time results)))

  (define (count-type set t)
    (count (λ (x) (equal? (result-status x) t)) set))
  (define (set->results set)
    (map (compose number->string (curry count-type set)) '(success fail error timeout unsupported)))

  (define unsupported-features
    (set-subtract (remove-duplicates (append-map result-features results)) (supported-features)))

  (define (feature-row feature results)
    (list feature
          (count (λ (x) (equal? 
                         (set-subtract
                          (result-features x)
                          (if (set-member? (supported-features) feature)
                              (list)
                              (supported-features)))
                         (list feature))) results)
          (count (λ (x) (set-member? (result-features x) feature)) results)))

  (define (sort-features data)
    (filter (λ (r) (> (third r) 0)) (sort (sort data > #:key third) > #:key second)))

  (define (show-res res)
    (not (set-member?
          (if (show-success) '() '(success unsupported expected))
          (result-status res))))

  (call-with-output-to
   outname #:extension "html" #:exists 'replace
   write-xexpr
   `(html ((lang "en_US"))
     (meta ((charset "utf8")))
     (link ((rel "stylesheet") (href "report.css")))
     (title ,(format "Cassius results for ~a" (string-join (remove-duplicates (map result-file results)) ", ")))
     (body
      (p (b "Cassius") " version " (kbd ,(~a *version*)) " branch " (kbd ,(~a *branch*)) " commit " (kbd ,(~a *commit*)))
      (p (b "Time") " total " ,(print-time total-time) " for " ,(~a (length results)) " tests.")
      (table ((id "sections") (rules "groups"))
       (thead
        ,(row #:cell 'th "" "Pass" "Fail" "Error" "Time" "Skip" "")
        ,(apply row `(strong "Total") (append (set->results results) '(""))))
       (tbody
        ,@(for/list ([section (sort (remove-duplicates (map result-section results)) section<?)])
            (define sresults (filter (λ (x) (equal? (result-section x) section)) results))
            (keyword-apply
             row '(#:hide) '("0")
             (string-replace section "s" "§" #:all? #f)
             (append
              (set->results sresults)
              `((span
                 ,@(for/list ([r sresults] #:when (member (result-status r) '(error fail)))
                     `(a ((href ,(result-url r)))
                         ,(format "~a:~a" (file-name-stem (result-file r)) (result-problem r)))))))))))
      ,@(if (ormap (λ (r) (set-member? '(unsupported) (result-status r))) results)
            `((section
               (h2 "Feature totals")
               (table
                (thead ,(row #:cell 'th "Unsupported Feature" "# Blocking" "# Necessary"))
                (tbody
                       ,@(let ([bad-results
                                (for/list ([r results] #:when (not (set-member? '(success expected) (result-status r))))
                                  r)])
                           (for/list ([data (sort-features (map (curryr feature-row bad-results) unsupported-features))])
                             (apply row (map ~a data))))))))
            '())
      (section
       (h2 ,(if (show-success) "Tests" "Failing tests"))
       (table
       ,@(for/list ([results-group (group-by result-file results)]
                    #:unless (not (ormap show-res results-group)))
           `(tbody
             (tr (th ((colspan "4")) ,(result-file (car results-group))))
             ,@(for/list ([ress (group-by result-problem results-group)]
                          #:unless (not (ormap show-res ress)))
                 (match-define (result file problem _ test section _ description features _ url) (car ress))
                 (apply row (~a problem) `(a ([href ,url]) ,(~a test)) description
                        (for/list ([res ress])
                          `(span ([class ,(~a (result-status res))]
                                  [title ,(~a (or (result-subproblem res) ""))])
                                 ,(status-symbol (result-status res))))))))))))))

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
  (for*/hash ([sec (call-with-input-file iname read-json)]
              [(k v) (in-hash sec)])
    (define name
      (if (string=? (last (string-split (~a k) "-")) (substring v 1))
          (string-join (drop-right (string-split (~a k) "-") 1) "-")
          k))
    (values name v)))

(define (get-index index uname)
  (define base (first (string-split (~a uname) ".")))
  (hash-ref index
            (if (string=? (last (string-split base "-")) "ref")
                (string-join (drop-right (string-split base "-") 1) "-")
                base)
            "(unknown)"))

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
    (debug-mode!)]
   [("+x") name "Set an option" (flags (cons (string->symbol name) (flags)))]
   [("-x") name "Unset an option" (flags (cons (string->symbol name) (flags)))]

   #:once-each
   [("-o" "--output") fname "File name for final CSS file"
    (set! out-file fname)]
   [("-t" "--timeout") s "Timeout in seconds"
    (timeout (string->number s))]
   [("-v" "--verbose") "Print output of each solver process"
    (verbose true)]
   [("--index") index-file "File name with section information for tests"
    (set! index (read-index index-file))]
   [("--show-all") "Do not hide successful or unsupported tests"
    (show-success true)]
   [("--supported") "Skip tests with unsupported features"
    (and! valid? (λ (p) (subset? (dict-ref p ':features '()) (supported-features))))]
   [("--failed") json-file "Run only tests that failed in given JSON file"
    (and! valid? (read-failed-tests json-file))]
   [("--sections") sections "Run only tests for particular sections (needs --index)"
    (define secs (string-split sections ","))
    (define (valid-sections? prob)
      (define url (car (dict-ref prob ':url '("/tmp"))))
      (set-member? (get-index index (file-name-stem url)) secs))
    (and! valid? valid-sections?)]
   [("--feature") feature "Test a particular feature"
    (and! valid? (λ (p) (set-member? (dict-ref p ':features '()) (string->symbol feature))))]
   [("--expected") efile "Expect failures named in this file"
    (expected-failures (call-with-input-file efile (λ (p) (sequence->list (in-port read p)))))]
   [("--threads") t "How many threads to use"
    (set! threads (string->number t))]

   #:subcommands

   ["regression"
    #:args fnames
    (write-report
     #:output out-file
     (let ([probs (for/append ([file (sort fnames string<?)])
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
     (let ([probs (for/append ([file (sort fnames string<?)])
                              (define x (sort (hash->list (call-with-input-file file parse-file)) symbol<? #:key car))
                              (map (curry cons file) x))])
       (run-mutation-tests probs #:valid valid? #:index index #:repeat repeat #:threads threads)))]

   ["features"
    #:args fnames
    (print-feature-table
     (for/append ([file fnames]) (dict-values (call-with-input-file file parse-file))))]

   ["available"
    #:args fnames
    (for* ([file fnames] [(name prob) (in-dict (call-with-input-file file parse-file))]
           #:when (subset? (dict-ref prob ':features '()) (supported-features)))
      (printf "~a ~a\n" file name))]

   ["assertion"
    #:args (assertions . fnames)
    (define prob1
      (for/append ([file (sort fnames string<?)])
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
     (run-assertion-tests probs #:valid valid? #:index index #:threads threads))]

   ["specific-assertions"
    #:args (assertions file problems)
    (define assns
      (call-with-input-file assertions
        (λ (p) (for/hash ([ass (sequence->list (in-port read p))])
                 (match-define `(define-test (,name ,args ...) ,body) ass)
                 (values name `(forall ,args ,body))))))
    (define probs (call-with-input-file file parse-file))

    (define insts
      (call-with-input-file problems
        (λ (f)
          (for/list ([x (in-port read f)])
            (list* (second x) file (first x) (dict-set (dict-ref probs (first x)) ':test (list (dict-ref assns (second x)))))))))

    (write-report
     #:output out-file
     (run-assertion-tests insts #:valid valid? #:index index #:threads threads))]

   ["rerender"
    #:args (json-file)
    (write-report #:output out-file (load-results json-file))]))
