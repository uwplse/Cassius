#lang racket
(require "../common.rkt" "css.rkt")
(provide script->string)

(define (string->js-string s)
  (define replacements
    '(("\\" . "\\\\") ("\"" . "\\\"")))
  (format "\"~a\""
          (for/fold ([s s]) ([(from to) (in-dict replacements)])
            (string-replace s from to))))

(define (indent s)
  (string-trim (string-replace (string-append "  " s) "\n" "\n  ") "  " #:left? #f))

(define (script->string script)
  (string-join
   (for/list ([handler script])
     (with-output-to-string
       (λ ()
         (match-define (list sel evt vars code ...) handler)
         (printf "$(~a).on(~a, function(~a) {\n"
                 (string->js-string (selector->string sel))
                 (string->js-string (~a evt))
                 (string-join (map ~a vars) " "))
         (define env (list* (cons 'this "$(this)") (for/list ([v vars]) (cons v (~a v)))))
         (for ([line code])
           (display (indent (line->string line env))))
         (printf "});\n"))))
   "\n"))

(define (line->string line env)
  (match line
    [(list 'add-class eltexpr cls)
     (format "~a.addClass(~a);\n" (eltexpr->string eltexpr env) (string->js-string (~a cls)))]
    [(list 'remove-class eltexpr cls)
     (format "~a.removeClass(~a);\n" (eltexpr->string eltexpr env) (string->js-string (~a cls)))]))

(define (eltexpr->string eltexpr env)
  (match eltexpr
    [(list 'select sel)
     (format "$(~a)" (string->js-string (selector->string sel)))]
    [(list 'parent expr)
     (format "~a.parent()" (eltexpr->string expr env))]
    [(? symbol?)
     (dict-ref env eltexpr)]))
