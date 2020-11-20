#lang racket

(provide execute-script script->js)


(define (execute-script lines)
  (define environment (make-hash))
  (define effects '())
  (for ([line (in-list lines)])
    (match line
      [`(let ,var ,expr)
       (define val (evaluate-expr expr environment))
       (hash-set! environment var val)]
      [`(set ,var ,field ,expr)
       (void)]
      [`(append-child ,elt ,child)
       (define elt* (evaluate-expr elt environment))
       (define child* (evaluate-expr child environment))
       (define box (elt->box child*))
       (set! effects (cons (list 'append-child elt* child* box) effects))]))
  (reverse effects))

(define (evaluate-expr expr env)
  (match expr
    [(? symbol?)
     (hash-ref env expr)]
    [`(select ,sel)
     sel]
    [`(create ,tree)
     tree]))

(define (elt->box tree)
  '[BLOCK])

(define (script->js lines)
  (define lines '())
  (for ([line (in-list lines)])
    (define str
      (match line
        [`(let ,var ,expr)
         (format "var ~a = ~a;" var (expr->js expr))]
        [`(set ,var ,field ,expr)
         (format "~a.~a = ~a;" var field (expr->js expr))]
        [`(append-child ,elt ,child)
         (format "~a.appendChild(~a)" (expr->js elt) (expr->js child))]))
    (set! lines (cons str lines)))
  (string-join (reverse lines) "\n"))

(define (expr->js expr)
  expr)
