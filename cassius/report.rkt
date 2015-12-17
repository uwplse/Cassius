#lang racket

(require racket/path)
(require racket/set)
(require racket/engine)
(require unstable/sequence)
(require racket/cmdline)
(require json)
(require "common.rkt")
(require "run.rkt")

(define (normalize-index name section)
  (if (string=? (last (string-split (~a name) "-")) (substring section 1))
      (string-join (drop-right (string-split (~a name) "-") 1) "-")
      name))

(define (normalize-uname uname)
  (define base (first (string-split (~a uname) ".")))
  (if (string=? (last (string-split base "-")) "ref")
      (string-join (drop-right (string-split base "-") 1) "-")
      base))

(define (run-files files #:debug [debug '()] #:output [outname #f] #:fast [fast? #f] #:classify [classify #f])
  (define out (if outname (open-output-file (format "~a.html" outname) #:exists 'replace) (current-output-port)))
  (define index
    (if classify
        (for*/hash ([sec (call-with-input-file classify read-json)] [(k v) (in-hash sec)])
          (values (normalize-index k v) v))
        (hash)))
  (define results
  (parameterize ([current-output-port out])
    (printf "<!doctype html>\n<html lang='en_US'>\n<meta charset='utf8' />\n")
    (printf "<link rel='stylesheet' href='report.css' />\n")
    (printf "<title>Cassius results for ~a</title>\n" (string-join files ", "))
    (printf "<body>\n")
    (define results
      (for/reap [sow] ([fname files])
        (printf "<h2>~a</h2>\n" fname)
        (printf "<table>\n")
        (define probs (call-with-input-file fname parse-file))
        (for ([(pname prob) (in-pairs (sort (hash->list probs) symbol<? #:key car))]
              #:when (or (not fast?) (subset? (problem-features prob) supported-features)))
          (eprintf "~a\t~a\t" fname pname)
          (define-values (ubase uname udir?) (split-path (problem-url prob)))
          (printf "<tr><td>~a</td><td>~a</td><td>~a</td><td class='out'><pre>" pname uname (problem-desc prob))
          (define status
            (parameterize ([current-error-port (current-output-port)])
              
              (define eng (engine (λ (_) (run-file fname (~a pname) #:debug debug))))
              (define timeout? (not (engine-run 120000 eng))) ; Run for 2m max
              (engine-kill eng)
              (cond
               [timeout?
                (printf "[10.00s] Timed out\n")
                'timeout]
               [(engine-result eng) 'success]
               [(> (length (set-subtract (problem-features prob) supported-features)) 0) 'unsupported]
               [else 'fail])))

          (sow (list fname uname (hash-ref index (normalize-uname uname) "unknown") status (set-subtract (problem-features prob) supported-features)))
          (eprintf "~a\n" status)

          (printf "</pre></td><td class='~a'>~a</td></tr>\n" status
                  (match status ['success "✔"] ['fail "✘"] ['timeout "🕡"]
                    ['unsupported
                     (define probfeats (set-subtract (problem-features prob) supported-features))
                     (format "<span title='~a'>☹</span>" (string-join (map ~a probfeats) ", "))])))
        (printf "</table>\n")))
    (printf "<h2>Status totals</h2>\n")
    (printf "<dl>\n")
    (for ([status '(success fail timeout unsupported)])
      (printf "<dt>~a</dt><dd>~a</dd>\n" status (count (λ (x) (equal? (fourth x) status)) results)))
    (printf "</dl>\n")
    (printf "<h2>Feature totals</h2>\n")
    (printf "<dl>\n")
    (for ([feature (remove-duplicates (append-map fifth results))])
      (printf "<dt>~a</dt><dd>~a</dd>\n" feature (count (λ (x) (member feature (fifth x))) results)))
    (printf "</dl>\n")
    (printf "</body>\n")
    (printf "</html>\n")
    results))
  (when outname (close-output-port out))

  ;; This can also be done after-the-fact with
  ;; a = $$("tr"); k = []; for (var i = 0; i < a.length; i++) { r = a[i].children[4]; k.push({ file: $$("h2").textContent, test: a[i].children[1].textContent, status: r.className, features: (r.children[0] ? r.children[0].title.split() : [])}) }; p = document.createElement("pre"); document.body.appendChild(p); p.textContent = JSON.stringify(k)
  (set! out (if outname (open-output-file (format "~a.json" outname) #:exists 'replace) (current-output-port)))
  (write-json
   (for/list ([row results])
     (match-define (list fname pname section status features) row)
     (make-hash `((file . ,(~a fname)) (test . ,(~a pname)) (section . ,section) (status . ,(~a status)) (features . ,(map ~a features)))))
   out)
  (when outname (close-output-port out)))

(module+ main
  (define debug '())
  (define out-file #f)
  (define classify #f)
  (define fast #f)

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
   #:args fnames
   (run-files fnames #:debug debug #:output out-file #:fast fast #:classify classify)))
