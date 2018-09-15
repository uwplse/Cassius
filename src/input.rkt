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
        [`(define-layout (,name ,rest ...) ,tree)
         (define properties (attributes->dict rest))
         (dict-set! layouts name (dom name properties tree tree #f))]
        [`(define-document ,name ,tree)
         (dict-set! docs name tree)]
        [`(define-action ,name ,target ,evt (,froms ,tos) ...)
         (define deref (curry map (curry dict-ref docs)))
         (dict-set! actions name (list* target evt (map cons (deref froms) (deref tos))))]
        [`(define-script ,name
            (handle ,sel (,evt ,bindings ...) ,acts ...) ...)
         (dict-set! scripts name (map list* sel evt bindings acts))]
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
         (get-from ':scripts scripts)
         (set! properties
               (dict-set properties ':fonts
                         (append-map (curry dict-ref fonts) (dict-ref properties ':fonts))))

         (when (and (dict-has-key? properties ':layouts) (dict-has-key? properties ':documents))
           (define layouts*
             (for/list ([doc (dict-ref properties ':documents)]
                        [layout (dict-ref properties ':layouts)])
               (dom (dom-name layout) (dom-properties layout) doc (dom-boxes layout) #f)))
           (set! properties (dict-set properties ':documents layouts*)))

         (dict-set! problems name properties)])))

  problems)
