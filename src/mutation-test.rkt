#lang racket

(require racket/path racket/set racket/cmdline math/base json)
(require "dom.rkt" "common.rkt" "input.rkt" "frontend.rkt" "report.rkt")

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


(define (run-mutation-tests file #:debug [debug '()] #:repeat [repeat 1] #:valid [valid? (const true)] #:index [index (hash)])
  (define probs (call-with-input-file file parse-file))

  (for/list ([(pname prob) (in-dict (sort (hash->list probs) symbol<? #:key car))] #:when (valid? prob)
             [_ (in-range repeat)])
    (eprintf "~a\t~a\t" file pname)
    (define-values (res runtime) (run-problem prob #:debug debug))
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

(module+ main
  (define debug '())
  (define out-file #f)
  (define index (hash))
  (define valid? (const true))
  (define repeat 1)

  (command-line
   #:program "report"
   #:multi
   [("-d" "--debug") type "Turn on debug information"
    (set! debug (cons (string->symbol type) debug))]
   [("+x") name "Set an option" (flags (cons (string->symbol name) (flags)))]
   [("-x") name "Unset an option" (flags (cons (string->symbol name) (flags)))]
   #:once-each
   [("-o" "--output") fname "File name for final CSS file"
    (set! out-file fname)]
   [("-n" "--repeat") n "How many random bugs try per test"
    (set! repeat (string->number n))]
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
      (run-mutation-tests file #:debug debug #:valid valid? #:index index #:repeat repeat)))))
