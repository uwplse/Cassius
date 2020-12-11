#lang racket

(require "print/css.rkt")
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

(define (script->js lines name)
  (define js-lines '())
  (set! js-lines (cons (format "function ~a(e) {" name) js-lines))
  (for ([line (in-list lines)])
    (define str
      (match line
        [`(let ,var ,expr)
         (format "var ~a = ~a;" var (expr->js expr))]
        [`(set ,var ,field ,expr)
         (format "~a.~a = ~a;" var (expr->js field) (expr->js expr))]
        [`(append-child ,elt ,child)
         (format "~a.appendChild(~a);" (expr->js elt) (expr->js child))]))
    (set! js-lines (cons str js-lines)))
  (set! js-lines (cons "}" js-lines))
  (string-join (reverse js-lines) "\n"))

(define (expr->js expr)
  (match expr
    [`(select ,sel) 
       (format "document.querySelector(\"~a\")" (selector->string sel))] 
    [`(create ,elt)
      (match elt 
       [(list element)
          (format "document.createElement('~a')" element)]
       [else
	 (raise "Bad input for create")])]
    [`(quote ,elt)
      (match elt
	[':id
	  "id"]
	[':text
	 "innerText"]
	[else
	  (raise (format "~a not supported" elt))])]
    [else
      expr]))
