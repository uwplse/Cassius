#lang racket
(require "common.rkt")
(require "dom.rkt")

(provide dom-strip-positions dom-print-all)

(define ((dom-transform! l) d)
  (match-define (dom name ctx tree) d)
  (for ([elt (in-tree tree)])
    (set-element-attrs! elt (l (element-type elt) (element-attrs elt))))
  d)

(define-syntax-rule (define-dom-transformer (name head cmds) [(pat1 pat2) body ...] ...)
  (define name
    (dom-transform! (λ (head cmds) (match* (head cmds) [(pat1 pat2) body ...] ...)))))

(define-syntax-rule (for/cmds cmds [(pat ...) body ...] ...)
  (reap [sow]
        (let loop ([cmds cmds])
          (match cmds
            [(list pat ... rest ___)
             (for-each sow (begin body ...))
             (loop rest)] ...
            [(list) (void)]))))

(define-dom-transformer (dom-strip-positions head cmds)
  [((or 'BLOCK 'INLINE) cmds)
   (for/cmds cmds
     [((and (or ':x ':y ':w ':h) cmd) val)
      '()]
     [(x) (list x)])]
  [(_ _)
   cmds])

(define-dom-transformer (dom-print-all head cmds)
  [(_ (? list?)) (append cmds '(:print #t))])

