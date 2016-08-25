#lang racket
(require "../common.rkt")
(provide stylesheet->string value->string selector->string rule->string)

(define (stylesheet->string sheet)
  (string-join (map rule->string sheet) "\n\n"))

(define (rule->string rule)
  (define selector (car rule))
  (match-define (list (list properties valuess ...) ...) (filter list? (cdr rule)))
  (with-output-to-string
    (λ ()
      (when (member ':style rule) (printf "[inline] "))
      (when (member ':browser rule) (printf "[browser] "))
      (when (member ':user rule) (printf "[user] "))
      (printf "~a {\n" (selector->string selector))
      (for ([property properties] [values valuess])
        (if (equal? values '((bad)))
            (printf "  \33[9;31m~a\33[0m;\n" property)
            (printf "  ~a: ~a;\n" property 
                    (string-join
                     (for/list ([value values])
                       (match value
                         [`(bad ,val)
                          (format "\33[1;31m~a\33[0m" (value->string val))]
                         [val
                          (format "~a" (value->string val))]))
                     " "))))
      (printf "}"))))

(define/match (value->string value)
  [(`(,_ 0.0)) "0"]
  [(`(px ,px)) (format "~apx" px)]
  [(`(% ,pct)) (format "~a%" pct)]
  [((? symbol?)) (~a value)])

(define (selector->string selector)
  (match selector
    [`(selector ,name) "?"]
    [`(match ,elts ...) (string-join (map ~a elts) ", ")]
    [`(id ,id) (format "#~a" id)]
    [`(class ,cls) (format ".~a" cls)]
    [`(tag ,tag) (~a (slower tag))]
    ['* "*"]
    [(list (? string? sel) sel*) sel]
    [`(or ,sels ...) (string-join (map selector->string sels) ", ")]
    [`(desc ,sels ...) (string-join (map selector->string sels) " ")]
    [`(child ,sels ...) (string-join (map selector->string sels) " > ")]
    [`(and ,sels ...) (string-join (map selector->string sels) "")]))
