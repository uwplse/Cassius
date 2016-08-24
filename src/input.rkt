#lang racket

(require "common.rkt" "dom.rkt" "tree.rkt")
(provide parse-file)

(define (parse-file port)
  (define problems (make-hash))
  (define sheets (make-hash))
  (define docs (make-hash))
  (define layouts (make-hash))
  (define actions (make-hash))
  (define handlers (make-hash))

  (for ([expr (in-port read port)])
    (match expr
      [`(define-stylesheet ,name ,rules ...)
       (dict-set! sheets name rules)]
      [`(define-layout (,name ,rest ...) ,tree)
       (define properties (attributes->dict rest))
       (dict-set! layouts name (dom name properties tree tree))]
      [`(define-document ,name ,tree)
       (dict-set! docs name tree)]
      [`(define-action ,name ,target ,evt (,froms ,tos) ...)
       (define deref (curry map (curry dict-ref docs)))
       (dict-set! actions name (list* target evt (map cons (deref froms) (deref tos))))]
      [`(define-handler ,name ,sel (,evt ,bindings ...) ,acts ...)
       (dict-set! handlers name (list* sel evt bindings acts))]
      [`(define-problem ,name ,rest ...)
       (define properties (attributes->dict rest))
       (define (get-from key hash)
         (when (dict-has-key? properties key)
           (define val*
             (for/list ([name (dict-ref properties key)])
               (dict-ref hash name)))
           (set! properties (dict-set properties key val*))))

       (get-from ':sheets sheets)
       (get-from ':documents docs)
       (get-from ':layouts layouts)
       (get-from ':actions actions)
       (get-from ':handlers handlers)

       (when (and (dict-has-key? properties ':layouts) (dict-has-key? properties ':documents))
         (define layouts*
           (for/list ([doc (dict-ref properties ':documents)]
                      [layout (dict-ref properties ':layouts)])
             (dom (dom-name layout) (dom-properties layout) doc (dom-boxes layout))))
         (set! properties (dict-set properties ':documents layouts*)))

       (dict-set! problems name properties)]))

  problems)
