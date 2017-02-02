#lang racket

(require racket/path racket/set racket/engine racket/cmdline math/base)
(require json (only-in xml write-xexpr))
(require "common.rkt" "input.rkt" "frontend.rkt" "dom.rkt")

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

(define (run-problem prob #:debug debug)
  (define eng
    (engine (λ (_)
              (parameterize ([current-error-port (open-output-string)]
                             [current-output-port (open-output-string)])
                (with-handlers
                    ([exn:break? (λ (e) 'break)]
                     [exn:fail? (λ (e)
                                  (newline)
                                  ((error-display-handler) (exn-message e) e)
                                  (newline)
                                  (list 'error e))])
                  (solve (dict-ref prob ':sheets) (dict-ref prob ':documents) #:debug debug))))))

  (define t (current-inexact-milliseconds))
  (define res (if (engine-run 60000 eng) (engine-result eng) 'timeout)) ; 1m max
  (define runtime (- (current-inexact-milliseconds) t))
  (engine-kill eng)
  (values res runtime))

(struct result (file problem test section status description features time url))

(define (run-regression-tests file #:debug [debug '()] #:repeat [repeat 1] #:valid [valid? (const true)] #:index [index (hash)])
  (define probs (call-with-input-file file parse-file))

  (for/list ([(pname prob) (in-dict (sort (hash->list probs) symbol<? #:key car))] #:when (valid? prob))
    (eprintf "~a\t~a\t" file pname)
    (define-values (res runtime) (run-problem prob #:debug debug))
    (define supported? (null? (set-subtract (dict-ref prob ':features) supported-features)))

    (define status
      (match res
        ['timeout 'timeout]
        [(list 'error e) 'error]
        ['break 'break]
        [(success stylesheet trees) 'success]
        [(failure stylesheet trees) (if supported? 'fail 'unsupported)]))
    (eprintf "~a\n" status)

    (define uname (file-name-stem (car (dict-ref prob ':url))))
    (result file pname uname (hash-ref index (normalize-uname uname) "unknown")
            status (car (dict-ref prob ':title)) (dict-ref prob ':features) runtime
            (car (dict-ref prob ':url)))))

(define (run-mutation-tests file #:debug [debug '()] #:repeat [repeat 1] #:valid [valid? (const true)] #:index [index (hash)])
  (define probs (call-with-input-file file parse-file))

  (for/list ([(pname prob) (in-dict (sort (hash->list probs) symbol<? #:key car))] #:when (valid? prob)
             [_ (in-range repeat)])
    (eprintf "~a\t~a\t" file pname)
    (define prob* (dict-update prob ':documents (curry map dom-not-something)))
    (define-values (res runtime) (run-problem prob* #:debug debug))
    (define supported? (null? (set-subtract (dict-ref prob ':features) supported-features)))

    (define status
      (match res
        ['timeout 'timeout]
        [(list 'error e) 'error]
        ['break 'break]
        [(success stylesheet trees) (if supported? 'fail 'unsupported)]
        [(failure stylesheet trees) 'success]))
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
  (define index (hash))
  (define valid? (const true))
  (define repeat 1)

  (multi-command-line
   #:program "report"
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
   #:subcommands
   ["regression"
    #:args fnames
    (write-report
     #:output out-file
     (for/append ([file fnames])
       (run-regression-tests file #:debug debug #:valid valid? #:index index #:repeat repeat)))]
   ["mutation"
    #:once-each
    [("-n" "--repeat") n "How many random bugs to try per test"
     (set! repeat (string->number n))]
    #:args fnames
    (write-report
     #:output out-file
     (for/append ([file fnames])
       (run-mutation-tests file #:debug debug #:valid valid? #:index index #:repeat repeat)))]))
