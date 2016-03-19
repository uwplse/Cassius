#lang racket
(require "../common.rkt")
(provide stylesheet->string header->string value->string selector->string rule->string)

(define (stylesheet->string sheet)
  (format "/* Generated code below */\n\n~a\n"
          (string-join (map rule->string sheet) "\n\n")))

(define (header->string header)
  (format "/* Hand-written header */\n\n~a\n\n" header))

(define (rule->string rule)
  (define selector (car rule))
  (match-define (list (list properties values) ...) (filter list? (cdr rule)))
  (with-output-to-string
    (λ ()
      (when (member ':style rule) (printf "[inline style] "))
      (printf "~a {\n" (selector->string selector))
      (for ([property properties] [value values])
        (match value
          [`(bad ,val)
           (printf "  \33[1;31m~a: ~a\33[0m;\n" property (value->string val))]
          [_
           (printf "  ~a: ~a;\n" property (value->string value))]))
      (printf "}"))))

(define/match (value->string value)
  [(`(,_ 0.0)) "0"]
  [(`(px ,px)) (format "~apx" px)]
  [(`(% ,pct)) (format "~a%" pct)]
  [((? symbol?)) (~a value)])

(define (selector->string selector)
  (match selector
    [`(selector ,name) "?"]
    [`(id ,id) (format "#~a" id)]
    [`(class ,cls) (format ".~a" cls)]
    [`(tag ,tag) (~a (slower tag))]
    ['* "*"]
    [(list (? string? sel) sel*) sel]
    [`(or ,sels ...) (string-join (map selector->string sels) ", ")]
    [`(desc ,sels ...) (string-join (map selector->string sels) " ")]
    [`(child ,sels ...) (string-join (map selector->string sels) " > ")]
    [`(and ,sels ...) (string-join (map selector->string sels) "")]))
