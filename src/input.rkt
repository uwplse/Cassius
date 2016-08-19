#lang racket

(require "common.rkt")
(require "dom.rkt")
(require "modify-dom.rkt")

(provide parse-file)

(define (parse-file port)
  (define problems (make-hash))
  (define sheets (make-hash))
  (define docs (make-hash))
  (define actions (make-hash))
  (define handlers (make-hash))

  (for ([expr (in-port read port)])
    (match expr
      [`(define-stylesheet ,name ,rules ...)
       (dict-set! sheets name rules)]
      [`(define-document (,name ,rest ...) ,tree)
       (define properties (attributes->dict rest))
       (dict-set! docs name (dom name properties tree))]
      [`(define-action ,name ,evt (,froms ,tos) ...)
       (define deref (curry map (curry dict-ref docs)))
       (dict-set! actions name (cons evt (map cons (deref froms) (deref tos))))]
      [`(define-handler ,name ,sel (,evt ,bindings ...) ,acts ...)
       (dict-set! handlers name (list* sel evt bindings acts))]
      [`(define-problem ,name ,rest ...)
       (define properties (attributes->dict rest))
       (when (dict-has-key? properties ':sheets)
         (set! properties (dict-update properties ':sheets (curry map (curry dict-ref sheets)))))
       (when (dict-has-key? properties ':documents)
         (set! properties (dict-update properties ':documents (curry map (curry dict-ref docs)))))
       (when (dict-has-key? properties ':actions)
         (set! properties (dict-update properties ':actions (curry map (curry dict-ref actions)))))
       (when (dict-has-key? properties ':handlers)
         (set! properties (dict-update properties ':handlers (curry map (curry dict-ref handlers)))))
       (dict-set! problems name properties)]))

  problems)
