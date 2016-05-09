#lang racket
(require srfi/13)
(require "../common.rkt")
(require "../browser-style.rkt")
(require "../dom.rkt")
(require "../css-properties.rkt")
(require "../spec/cascade.rkt")
(require "css.rkt")

(provide print-unsat-core)

(define (split-symbol s)
  (for/list ([part (string-split (~a s) "/")])
    (or (string->number part) (string->symbol part))))

(define (extract-selector sel)
  (match sel
    ['sel/all '*]
    [`(sel/id ,id) (list 'id (string->symbol (substring (~a id) 3)))]
    [`(sel/tag ,tag) (list 'tag (string->symbol (substring (~a tag) 4)))]))

(define (extract-value value)
  (match value
    [(list (? (css-type-ending? 'px)) x) (list 'px x)]
    [(? css-%?) (list '% (string->number (string-trim (~a (last (split-symbol value))) #\%)))]
    [(? symbol?) (last (split-symbol value))]))

(define (split-line-name var)
  (for/list ([part (string-split (~a var) "^")])
    (match (string-split part "/")
      [(list _) part]
      [(list parts ...) (map (curryr with-input-from-string read) parts)])))

(define ((css-type-ending? v) x)
  (match (split-symbol x)
    [(list _ ... (== v)) #t]
    [_ #f]))

(define (css-%? x)
  (string-suffix? "%" (~a (last (split-symbol x)))))

(define (parsed->elt parsed)
  (for/first ([part parsed] #:when (list? part) [symbol part]
              #:when (string-prefix? "elt$" (~a symbol)))
    (elt-from-name (string->symbol (car (string-split (~a symbol) "-"))))))

(define (describe-line name line elt)
  (match name
    [`((,(and (or 'box-x 'box-y 'box-width 'box-height 'mt 'mr 'mb 'ml) field) ,_) ,_ ...)
     (define field-name
       (match field ['box-x ':x] ['box-y ':y] ['box-width ':w] ['box-height ':h]
         ['mt ':mt] ['mr ':mr] ['mb ':mb] ['ml ':ml]))
     (format "~a ~a" field-name (element-get elt field-name))]
    [`((box-width ,_)) (format "You gave :w ~a" (element-get elt ':w))]
    [`((box-height ,_)) (format "You gave :h ~a" (element-get elt ':h))]
    [`((box root ,_) (zero-xybpm ,_)) (void)]
    [`((box block ,_) (positive-bpwh ,_ ,_))
     "Borders, paddings, width, and height must all be non-negative"]
    [`((box block ,_) _ (because !positioned _) (because flow ,_) (flow-width-overflow ,_ ,_))
     (format "If the given L/R margins and width overflow, ignore the right margin")]
    [`((box block ,_) _ (because !positioned _) (because flow ,_) (flow-width-wauto ,_ ,_))
     (format "If { width: auto } and the margins don't overflow, expand the element to fill the available width")]
    [`((box block ,_) _ (because !positioned _) (because flow ,_) (flow-width-center ,_ ,_))
     (format "If { margin-left: auto; margin-right: auto } and the width doesn't overflow, center the element")]
    [`((box block ,_) _ (because !positioned _) (because flow ,_) (flow-width-ordinary ,_ ,_))
     (format "If the width is given, ignore auto margins and the right margin if necessary")]
    [`((box block ,_) _ (because !positioned _) (because flow ,_) (flow-x ,_ ,_))
     (format "The X-position is the parent's left content edge plus the left margin")]
    [`((box block ,_) _ (because !positioned _) (because flow ,_) (flow-fill-width ,_ ,_))
     (format "In-flow block boxes fill the horizontal width")]
    [`((box block ,_) _ (because !positioned _) (because flow ,_) (flow-mt-auto ,_ ,_))
     (format "{ margin-top: auto } means no top margin")]
    [`((box block ,_) _ (because !positioned _) (because flow ,_) (flow-mb-auto ,_ ,_))
     (format "{ margin-bottom: auto } means no bottom margin")]
    [`((box block ,_) _ (because !positioned _) (because flow ,_) (from-style ,prop ,_ ,_))
     (format "~a is used straight from the computed style" prop)]
    [`((box block ,_) _ (because !positioned _) (because flow ,_) (auto-height ,prop ,_ ,_))
     (format "Since height is auto, height is computed based on the children" prop)]
    [`((box block ,_) _ (because !positioned _) (because !flow ,_) (no-collapse ,_ ,_))
     (format "Margins of floating boxes don't collapse")]
    [`((box block ,_) _ (because !positioned _) (because !flow ,_) (restriction-1 ,_ ,_))
     (format "Cassius doesn't allow floats to have negative margins")]
    [`((box block ,_) _ (because !positioned _) (because !flow ,_) (restriction-2 ,_ ,_))
     (format "Cassius requires the bottom of a float box to be below the bottom of the previous float")]
    [`((box block ,_) _ (because !positioned _) (because !flow ,_) (restriction-3 ,_ ,_))
     (format "Cassius requires a row of floats to fill the parent before wrapping to the next row")]
    [`((box block ,_) _ (because !positioned _) (because !flow ,_) (restriction-4 ,_ ,_))
     (format "Cassius doesn't allow horizontally-adjacent left and right floats")]
    [`((box line ,_) (line-no-mbp ,_))
     (format "Line boxes do not have margins, padding, or borders")]
    [`((box line ,_) (lines-dont-float ,_))
     (format "Line boxes do not float")]
    [`((box line ,_) (skip-float ,_))
     (format "Y position after preceding floats")]
    [`((box line ,_) (top-of-parent ,_))
     (format "Y position at the top of the parent block")]
    [`((box line ,_) (follow-previous-line ,_))
     (format "Y position after previous line")]
    [`((cascade eq ,_ ,prop) ,num)
     (match line
       [`(= (,_ (specified-style ,_)) ,val)
        (format "Specified: { ~a: ~a; }" prop (value->string (extract-value val)))]
       [_ (format "Specified: ~a" line)])]
    [`((root ,prop ,_))
     (for/first ([(prop* type default) (in-css-properties)] #:when (eq? prop prop*))
       (format "The root box has { ~a: ~a; }" prop (value->string (extract-value default))))]
    [_ (format "~a: ~a" name line) #;#f]))

(define (print-unsat-core core stylesheet)
  (define elts (make-hash))
  (for ([(name line) (in-dict core)])
    (define elt (parsed->elt name))
    (hash-set! elts elt (cons (cons name line) (hash-ref elts elt '()))))

  (define (print-rule-core rules)
    (for ([(sheet-name rules) (in-hash (trieify (map cdaar rules)))])
      (printf "~a.css:\n" sheet-name)
      (define sheet* (or (get-sheet sheet-name) stylesheet))
      (for ([(rule-id props) (in-hash rules)])
        (printf "(~a) " rule-id)
        (define rule* (list-ref sheet* rule-id))
        (cond
         [(eq? rule* '?)
          (printf "? {")]
         [else
          (printf "  ~a {" (selector->string (car rule*)))])
        (for ([prop props] #:when (not (member prop '(selector a-rule))))
          (define val (cadr (assoc prop (filter list? (cdr rule*)))))
          (printf " ~a: ~a;" prop (value->string val)))
        (printf " }\n"))
      (printf "\n")))

  (define keys (hash-keys elts))
  (define (key<? x y)
    (cond [(not x) #t]
          [(not y) #f]
          [else (symbol<? (element-name x) (element-name y))]))
  (printf "\n")
  (for ([elt (sort keys key<?)])
    (cond
     [elt
      (printf "~a:\n" elt)
      (for ([(name line) (in-dict (hash-ref elts elt))])
        (let ([desc (describe-line name line elt)])
          (when desc
            (printf "  ~a\n" (describe-line name line elt)))))
      (printf "\n")]
     [(not elt)
      (define-values (rules root)
        (for/reap [rule root] ([(name line) (in-dict (hash-ref elts elt))])
          (match name
            [`((rule ,_ ...)) (rule (cons name line))]
            [_ (root (cons name line))])))
      (print-rule-core rules)
      (printf "[VIEW]:\n")
      (for ([(name line) (in-dict root)])
        (let ([desc (describe-line name line elt)])
          (when desc
            (printf "  ~a\n" (describe-line name line elt)))))
      (printf "\n")])))
