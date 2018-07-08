#lang racket

(require "common.rkt" "tree.rkt" "dom.rkt" "smt.rkt" "selectors.rkt" "match.rkt"
         "assertions.rkt" "input.rkt" "modularize.rkt")

(provide read-proofs)

(define (spec-or-assert assert)
  (define-values (vars body) (disassemble-forall assert))
  (if (null? vars) ':spec ':assert))

(define (box-set stx components ctx)
  (let loop ([stx stx])
    (match stx
      ['* components]
      [(? symbol?) (list (dict-ref ctx stx))]
      [`(- ,stx1 ,stx2)
       (set-subtract (loop stx1) (loop stx2))]
      [`(or ,stx1 ,stx2)
       (set-union (loop stx1) (loop stx2))]
      [`(and ,stx1 ,stx2)
       (set-intersect (loop stx1) (loop stx2))])))

(define (rename-problem problem n)
  (dict-set problem ':documents
            (list-update (dict-ref problem ':documents #f) 0
                         (λ (x)
                           (struct-copy dom x [name n])))))

(define (dom-run-proof problem tactics theorem theorems)
  (define the-dom (first (dict-ref problem ':documents)))
  (define elts (parse-tree (dom-elements the-dom)))
  (define boxes (parse-tree (dom-boxes the-dom)))

  (match (dom-context the-dom ':matched) ['(true) (void)])
  (define get-by-selector
    (let ([linker (link-matched-elts-boxes #f elts boxes)])
      (λ (sel)
        (for/list ([box (in-tree boxes)]
                   #:when (linker box)
                   #:when (selector-matches? sel (first (linker box))))
          box))))

  (define box-context (make-hash (list (cons 'root boxes))))
  (node-set! boxes ':split 0)

  (node-set! boxes ':name 'root)
  (define components (hash-values box-context))

  (define extra-problems (list))

  (for ([cmd tactics])
    (match cmd

      [`(component ,name ,sel)
       (define selected-boxes (get-by-selector sel))
       (define box
         (match selected-boxes
           [(list) (raise (format "Could not find any elements matching ~a" sel))]
           [(list box) box]
           [(list boxes ...) (raise (format "~a matches multiple elements ~a" sel (string-join (map ~a boxes) ", ")))]))
       (hash-set! box-context name box)
       (node-set! box ':name name)
       (node-set*! box ':spec (list))
       (node-set! box ':split (length components))
       (set! components (cons box components))]
      [`(components ,sels ...)
       (define selected-boxes (append-map get-by-selector sels))
       (for ([box selected-boxes])
         (node-set*! box ':spec (list))
         (node-set! box ':split (length components))
         (set! components (cons box components)))]

      [`(,(and (or 'assert 'page 'random 'exhaustive 'admit) tool) ,boxes ,assert)
       (for ([box (box-set boxes components box-context)])
         (if (equal? tool 'assert)
             (node-add! box (spec-or-assert assert) assert)
             (begin
               (node-add! box ':admit assert)
               (set! extra-problems
                     (cons (list tool box assert) extra-problems)))))]
      [`(lemma (,thm ,boxes ...))
       (define-values (vars body) (disassemble-forall (theorems thm)))       
       (define-values (thvars thbody) (disassemble-forall theorem))
       (set! theorem
             `(forall ,thvars
                      (=> (let (,@(map list vars boxes))
                            ,body)
                          ,thbody)))]))

  (define problem* (dict-set problem ':documents (list (struct-copy dom the-dom [boxes (unparse-tree boxes)]))))
  (define problem** (dict-set* problem* ':test (list theorem) ':tool (list 'assert)))

  (define cnt 0)
  (define extras
    (for/list ([thing extra-problems])
      (match-define (list tool box assert) thing)
      (define name
        (match (node-get box ':name)
          [#f
           (define name (sformat "anon-component-~a" cnt))
           (set! cnt (+ 1 cnt))
           (node-set! box ':name name)
           name]
          [name name]))
      (dict-set* problem* ':name (list name) ':component (list name)
                 ':test (list assert) ':tool (list tool))))

  (append
   (modularize problem**)
   extras
   (list (dict-set* problem** ':tool '(modular) ':name (list ':check)))))

(define (read-proofs port)
  (define problem-context (make-hash))
  (define theorem-context (make-hash))
  (define proof-context (make-hash))
  (for ([cmd (in-port read port)])
    (match cmd
      [`(page ,name (load ,file ,pname) ,attrs ...)
       (define problem (dict-ref (call-with-input-file file parse-file) pname))
       (define the-dom* (first (dict-ref problem ':documents)))
       (define ctx*
         (for/fold ([ctx (dom-properties the-dom*)])
             ([(k v) (in-dict (attributes->dict attrs))])
           (dict-set ctx k v)))
       (define problem*
         (dict-set problem ':documents
                   (map dom-strip-positions
                        (cons (struct-copy dom the-dom* [properties ctx*])
                              (cdr (dict-ref problem ':documents))))))
       (hash-set! problem-context name problem*)]
      [`(define (,name ,args ...) ,body)
       (define helper
         (procedure-reduce-arity
          (λ vals (smt-replace-terms body (map cons args vals)))
          (length args)))
       (hash-set! helper-dict (cons name args) body)
       (hash-set! assertion-helpers name helper)]
      [`(,(or 'theorem 'lemma) (,name ,args ...) ,body)
       (hash-set! theorem-context name `(forall ,args ,body))]
      [`(proof (,name ,thmname ,pages ...) ,subcmds ...)
       (define theorem (dict-ref theorem-context thmname))
       (hash-set! proof-context name
                  (for/hash ([page pages])
                    (values
                     page
                     (dom-run-proof (dict-ref problem-context page)
                                    subcmds theorem (curry dict-ref theorem-context)))))]))
  proof-context)

