#lang racket

(require racket/runtime-path racket/hash)
(require "common.rkt" "dom.rkt" "registry.rkt" "selectors.rkt" "encode.rkt" "smt.rkt" "spec/utils.rkt" "print/css.rkt"
         "assertions.rkt")

(provide test-assertion)

(define-runtime-path capture-path "../capture/")
(define python-path (find-executable-path (match (system-type 'os) ['windows "python.exe"] [_ "python"])))
(define xvfb-run-path (find-executable-path "xvfb-run"))

(define js-header
  (string-join
   '("function last(r) { return r[r.length - 1]; }"
     "function ancestor(b, c) { var v = b; while (v && ! c(v)) { v = v.parentNode; }; return v; }"
     "function allelts() {
  var out = [];
  var cn, ni = document.createNodeIterator(document.documentElement, NodeFilter.SHOW_ELEMENT);
  while(cn = ni.nextNode()) out.push(cn);
  return out;
}"
     "function nprod(base, n, f, tail) {
  if (n == 0) { return f.apply(this, tail); }
  else {
    var out = true;
    for (var i = 0; out && i < base.length; i++) {
      out = out && nprod(base, n - 1, f, [base[i]].concat(tail));
    }
    return out;
  }}")
   "\n"))

(define (newvar head vars)
  (for/first ([i (in-range (+ 1 (set-count vars)))]
              #:unless (set-member? vars (sformat "~a~a" head i)))
    (sformat "~a~a" head i)))

(define (run-python . args)
  (define errp (if (file-stream-port? (current-error-port)) (current-error-port) #f))
  (match (system-type 'os)
    [(or 'windows 'macosx)
     (apply subprocess #f #f errp python-path args)]
    [_
     (apply subprocess #f #f errp
            xvfb-run-path "-a" "-s" "-screen 0 1920x1080x24"
            python-path args)]))

(define (dump-range syntax)
  (match (first syntax)
    [(? number? n) (~a n)]
    [`(between ,a ,b) (format "~a--~a" a b)]))

(define (test-assertion url assertion num named-components anon-components ranges)
  (define args
    `(,@(if (> num 0) `("--num" ,(~a num)) `("--exhaustive"))
      "--width" ,(dump-range (dict-ref ranges ':w))
      "--height" ,(dump-range (dict-ref ranges ':h))
      "--font" ,(dump-range (dict-ref ranges ':fs))))
  (define-values (proc procout procin _procerr)
    (apply run-python (build-path capture-path "test.py") url args))
  (define-values (vars body) (disassemble-forall assertion))
  (define components
    (for/hash ([(name sel) (in-dict named-components)] [i (in-naturals)])
      (values name (format "window.component~a" i))))
  (define ctx
    (hash-union components (for/hash ([var vars]) (values var (~a var)))))
  (define code
    (string-join
     `(,js-header
       ,@(for/list ([(name sel) (in-dict named-components)])
           (format "~a = document.querySelector('~a')" (dict-ref components name) (selector->string sel)))
       ,(format "function is_component(b) { return b.matches('~a'); }"
                 (string-join (remove-duplicates (map selector->string (set-union anon-components (hash-values named-components)))) ", "))
       ,(format "function good_tuple(~a) { return ~a; }"
                (string-join (map ~a vars) ", ")
                (body->js body ctx))
       ,(format "function testall() { return nprod(allelts(), ~a, good_tuple, []); }"
                (length vars))
       "return testall();")
     "\n"))
  (display code procin)
  (close-output-port procin)
  (subprocess-wait proc)
  (begin0
      (match (subprocess-status proc)
        [0 '(success)]
        [_ `(counterexample
             ,(for/hash ([line (in-port read-line procout)])
                (match-define (list (app string->symbol key) (app string->number val))
                              (string-split line))
                (values key val)))])
    (close-input-port procout)))

(define (body->js body ctx)
  (let loop ([expr body] [ctx ctx])
    (match expr
      ;; Booleans
      [(or 'true 'false) (~a expr)]
      [`(and ,parts ...)
       (format "(~a)" (string-join (map (curryr loop ctx) parts) " && "))]
      [`(or ,parts ...)
       (format "(~a)" (string-join (map (curryr loop ctx) parts) " || "))]
      [`(=> ,as ... ,b)
       (format "( ~a ? ~a : true)" (string-join (map (curryr loop ctx) as) " && ") (loop b ctx))]
      [`(not ,part) (format "(! ~a)" (loop part ctx))]

      ;; Real numbers
      [(? number?) (~a expr)]
      [(list (and (or '= '< '> '<= '>=) op) parts ...)
       (define args (map (curryr loop ctx) parts))
       (define cmp (if (equal? op '=) "==" (~a op)))
       (format "(~a)"
               (string-join
                (for/list ([arg1 args] [arg2 (cdr args)])
                  (format "(~a ~a ~a)" arg1 cmp arg2))
                " && "))]
      [(list (and (or '+ '- '* '/) op) parts ...)
       (format "(~a)" (string-join (map (curryr loop ctx) parts) (~a op)))]
      [`(max ,a ,b)
       (format "Math.max(~a, ~a)" (loop a ctx) (loop b ctx))]

      ;; Boxes
      ['null "null"]
      ['root "document.documentElement"]
      [(list (and (or 'parent 'next 'prev 'first) field) box)
       (define function
         (match field
           ['parent "parentNode"] ['next  "nextSibling"] ['prev  "previousSibling"]
           ['first "childNodes[0]"]))
       `(,function ,(loop box ctx))]
      [`(last ,box)
       (format "last(~a.childNodes)" (loop box ctx))]
      [`(ancestor ,box ,cond*)
       (define var (newvar "anc" (set (hash-values ctx))))
       (define cond (format "function (~a) { return ~a; }" var (loop cond* (hash '? var))))
       (format "ancestor(~a, ~a)" (loop box ctx) cond)]
      [`(has-contents ,box) (format "(!!~a.textContent)" (loop box ctx))]
      [`(is-component ,box)
       (format "is_component(~a)" (loop box ctx))]
      [`(has-type ,box ,(and (or 'root 'text 'inline 'block 'line) boxtype))
       (match boxtype
         ['root (format "(~a == document.documentElement)" (loop box ctx))]
         ['text (format "(~a.nodeType == document.TEXT_NODE)" (loop box ctx))]
         [(or 'inline 'block)
          (format "(~a.nodeType == document.ELEMENT_NODE && window.getComputedStyle(~a).display == '~a')"
                  (loop box ctx) (loop box ctx) boxtype)]
         ['line (error "Line boxes not yet supported")])] ;; TODO
      [(list-rest (and (or 'top 'right 'bottom 'left) dir) box edge*)
       (define edge
         (match edge* [(list edge) edge] [(list) 'border]))
       (match edge
        ['border
         (format "(~a.getBoundingClientRect().~a)" (loop box ctx) dir)]
        [_
         (error (format "Edge ~a not supported for ~a." edge dir))])]
      [`(text-height ,box)
       (format
        "(function(b) { var r = new Range(); r.selectNodeContent(b); return r.getBoundingClientRect().height; })(~a)"
        (loop box ctx))]

      ;; Colors
      [`(fg ,box)
       (format "window.getComputedStyle(~a).color" (loop box ctx))]
      [`(bg ,box)
       (format "window.getComputedStyle(~a).backgroundColor" (loop box ctx))]
      ['transparent "transparent"]
      [`(color ,name) (error "Named colors not supported")]
      [`(rgb ,(? number? r) ,(? number? g) ,(? number? b))
       (format "rgb(~a, ~a, ~a)" (format r g b))]
      [(list (and (or 'r 'g 'b) component) `(gamma ,color))
       (error "Color components not supported")]
      [(list (and (or 'r 'g 'b) component) color)
       (error "Color components not supported")]

      ;; Elements
      [`(anonymous? ,b)
       (format "(~a.nodeType !== document.ELEMENT_NODE)" (loop b ctx))]
      [`(matches ,b ,sels ...)
       (format "~a.matches('~a')" (loop b ctx) (string-join (map selector->string sels) ", "))]

      ;; Extra syntax
      [`(if ,c ,t ,f)
       (format "(~a ? ~a : ~a)" (loop c ctx) (loop t ctx) (loop f ctx))]
      [`(let ([,vars ,vals] ...) ,body)
       (define vals* (for/list ([val vals]) (loop val ctx)))
       (define ctx*
         (for/fold ([ctx ctx]) ([var vars])
           (dict-set ctx var (newvar var (set (hash-values ctx))))))
       (format "(function(~a) { return ~a; })(~a)"
               (map (curry dict-ref ctx*) vars) (loop body ctx*) vals*)]

      ;; Expandable
      [(list (? (curry dict-has-key? assertion-helpers) fname) args ...)
       (loop (apply (dict-ref assertion-helpers fname) args) ctx)]
      [`(luminance ,color)
       (error "Unsupported" expr)]
      [`(overlaps ,b1 ,b2)
       (error "Unsupported" expr)]
      [`(within ,b1 ,b2)
       (error "Unsupported" expr)]

      [`(raw ,expr)
       (error "Unsupported" expr)]

      ;; Variables
      [(? symbol?)
       (with-handlers ([exn:fail:contract? (λ (e) (raise-user-error 'visual-logic "Could not find ~a (context includes ~a)\n\t~a\n" expr (dict-keys ctx) body))])
           (dict-ref ctx expr))])))
