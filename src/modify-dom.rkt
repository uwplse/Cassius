#lang racket
(require "common.rkt")
(require "dom.rkt")
(require math/base)

(provide dom-strip-positions dom-print-all dom-limit-depth dom-not-something)

(define ((dom-transform! l) d)
  (match-define (dom name ctx tree) d)
  (dom name ctx
       (let loop ([tree tree])
         (cons (cons (caar tree) (l (caar tree) (cdar tree)))
               (map loop (cdr tree))))))

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
  [((or 'LINE 'BLOCK 'INLINE) cmds)
   (for/cmds cmds
     [((and (or ':x ':y ':w ':h) cmd) (? number? val))
      '()]
     [(x) (list x)])]
  [('TEXT cmds)
   (for/cmds cmds
     [((and (or ':x ':y) cmd) (? number? val))
      '()]
     [(x) (list x)])]
  [(_ _)
   cmds])

(define-dom-transformer (dom-print-all head cmds)
  [(_ (? list?)) (append cmds '(:print #t))])


(define (dom-limit-depth n d)
  (match-define (dom name ctx tree) d)

  (dom name ctx
       (let loop ([n n] [tree tree])
         (if (= n 0)
             `([MAGIC ,@ (cdar tree)])
             (cons (car tree) (map (curry loop (- n 1)) (cdr tree)))))))

(define (dom-not-something d)
  (match-define (dom name ctx tree) d)
  
  (define constraints 0)

  (let loop ([tree tree])
    (when (member (caar tree) '(LINE BLOCK INLINE))
      (set! constraints (+ constraints (count (curryr member '(:x :y :w :h)) (cdar tree)))))
    (for-each loop (cdr tree)))
  
  (define idx (random-integer 0 constraints))
  (set! constraints 0)

  ;; Not my fault
  (dom name ctx
       (let loop ([tree tree])
         (cond
          [(> constraints idx) tree]
          [(member (caar tree) '(LINE BLOCK INLINE))
           (set! constraints (+ constraints (count (curryr member '(:x :y :w :h)) (cdar tree))))
           (cons (cons (caar tree)
                       (let loop2 ([n (- constraints idx)] [props (cdar tree)])
                         (cond
                          [(null? props) props]
                          [(and (= n 1) (member (car props) '(:x :y :w :h)))
                           (list* (car props) `(not ,(cadr props)) (cddr props))]
                          [(and (member (car props) '(:x :y :w :h)))
                           (list* (car props) (cadr props) (loop2 (- n 1) (cddr props)))]
                          [else
                           (list* (car props) (cadr props) (loop2 n (cddr props)))])))
                 (map loop (cdr tree)))]
          [else (cons (car tree) (map loop (cdr tree)))]))))
