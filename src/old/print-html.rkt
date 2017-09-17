#lang racket
(require "../common.rkt" "../tree.rkt" "script.rkt" "css.rkt")
(provide elements->string)

(define (elements->string elements #:sheets [sheets '()] #:scripts [scripts '()] #:title [title #f])
  (with-output-to-string
    (λ ()
      (printf "<!doctype html>\n<html>\n<head>\n  <meta charset=\"utf-8\" />\n")
      (when title (printf "  <title>~a</title>\n" title))
      (for ([sheet sheets])
        (printf "  <style>\n~a\n  </style>\n" (indent (stylesheet->string sheet) "    ")))
      (printf "</head>\n")

      (let loop ([elt (node-fchild elements)] [indent ""])
        (cond
         [(node? elt)
          (define attrs
            (for/list ([(k vs) (in-dict (node-attrs elt))])
              (format "~a=\"~a\"" (string-trim (~a k) ":" #:right? #f)
                      (string-join (map ~a vs) " "))))
          (match (node-children* elt)
            ['()
             (printf "~a<~a></~a>\n" indent (string-join (cons (~a (node-type elt)) attrs) " ") (node-type elt))]
            [children
             (printf "~a<~a>\n" indent (string-join (cons (~a (node-type elt)) attrs) " "))
             (for-each (curryr loop (string-append "  " indent)) children)
             (printf "~a</~a>\n" indent (node-type elt))])]
         [else (printf "~a~a\n" indent elt)]))
  
      (unless (null? scripts)
        (printf "  <script src=\"~a\" integrity=\"~a\" crossorigin=\"anonymous\"></script>\n"
                "https://code.jquery.com/jquery-3.1.0.slim.min.js"
                "sha256-cRpWjoSOw5KcyIOaZNo4i6fZ9tKPhYYb6i5T9RSVJG8="))
      (for ([script scripts])
        (printf "  <script>\n~a  </script>\n" (indent (script->string script) "    ")))
      (printf "</html>\n"))))
