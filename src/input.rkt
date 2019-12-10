#lang racket

(require "common.rkt" "dom.rkt" "tree.rkt" "spec/css-properties.rkt" "spec/browser-style.rkt")
(provide parse-file)

(define (parse-file port)
  (define problems (make-hash))
  (define fonts (make-hash))
  (define sheets (make-hash (list (cons 'firefox firefox-sheet)
                                  (cons 'baseline baseline-sheet))))
  (define docs (make-hash))
  (define layouts (make-hash))
  (define browsers (make-hash))
  (define actions (make-hash))
  (define scripts (make-hash))

  (parameterize ([read-decimal-as-inexact false])
    (for ([expr (in-port read port)])
      (match expr
        [`(define-stylesheet ,name ,rules ...)
         (dict-set! sheets name
                    (for/list ([rule rules])
                      (cons
                       (car rule)
                       (filter (λ (thing) (or (not (list? thing)) (set-member? (css-properties) (first thing)))) (cdr rule)))))]
        [`(define-fonts ,name ,rules ...)
         (dict-set! fonts name rules)]
        [`(define-browser ,name ,rest ...)
         (dict-set! browsers name (attributes->dict rest))]
        [`(define-layout ,name (,browser ,doc) ,tree)
         (define properties (dict-ref browsers browser))
         (define document (dict-ref docs doc))
         (dict-set! layouts name (dom name properties document tree #f))]
        [`(define-document ,name ,tree)
         (dict-set! docs name tree)]
        [`(define-problem ,name ,rest ...)
         (define properties (attributes->dict rest))
         (define (get-from key hash)
           (when (dict-has-key? properties key)
             (define val*
               (for/list ([name (dict-ref properties key)])
                 (dict-ref hash name)))
             (set! properties (dict-set properties key val*))))

         (get-from ':sheets sheets)
         (get-from ':layouts layouts)
         (set! properties (dict-set properties ':documents (dict-ref properties ':layouts)))
         (set! properties
               (dict-set properties ':fonts
                         (append-map (curry dict-ref fonts) (dict-ref properties ':fonts))))
         (dict-set! problems name properties)])))

  problems)
