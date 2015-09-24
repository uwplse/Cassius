#lang racket

(require racket/path)
(require unstable/sequence)
(require racket/cmdline)
(require "common.rkt")
(require "run.rkt")

(define (run-files files #:debug [debug '()] #:output [outname #f])
  (define out (if outname (open-output-file outname #:exists 'replace) (current-output-port)))
  (parameterize ([current-output-port out])
    (printf "<!doctype html>\n<html lang='en_US'>\n<meta charset='utf8' />\n")
    (printf "<link rel='stylesheet' href='report.css' />\n")
    (printf "<title>Cassius results for ~a</title>\n" (string-join files ", "))
    (printf "<body>\n")
    (for ([fname files])
      (printf "<h2>~a</h2>\n" fname)
      (printf "<table>\n")
      (define probs (call-with-input-file fname parse-file))
      (for ([(pname prob) (in-pairs (sort (hash->list probs) symbol<? #:key car))])
        (eprintf "~a\t~a\t" fname pname)
        (define-values (ubase uname udir?) (split-path (problem-url prob)))
        (printf "<tr><td>~a</td><td>~a</td><td>~a</td><td class='out'><pre>" pname uname (problem-desc prob))
        (define solve? 
          (parameterize ([current-error-port (current-output-port)])
            (run-file fname (~a pname) #:debug debug)))
        (eprintf "~a\n" (if solve? "✔" "✘"))
        (printf "</pre></td><td class='~a'>~a</td></tr>\n" (if solve? 'success 'fail) (if solve? "✔" "✘")))
      (printf "</table>\n"))
    (printf "</body>\n")
    (printf "</html>\n"))
  (when outname (close-output-port out)))

(module+ main
  (define debug '())
  (define out-file #f)

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
   #:args fnames
   (run-files fnames #:debug debug #:output out-file)))
