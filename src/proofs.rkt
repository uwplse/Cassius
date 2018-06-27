#lang racket

(require "common.rkt" "tree.rkt" "dom.rkt" "smt.rkt" "selectors.rkt" "match.rkt"
         "assertions.rkt")

(provide read-proofs)

(define (spec-or-assert assert)
  (define-values (vars body) (disassemble-forall assert))
  (if (null? vars) ':spec ':assert))

(define (dom-run-proof problem tactics theorem theorems props)
  (define the-dom* (first (dict-ref problem ':documents)))
  (define ctx*
    (for/fold ([ctx (dom-properties the-dom*)]) ([(k v) (in-dict props)])
      (dict-set ctx k v)))
  (define the-dom (struct-copy dom the-dom* [properties ctx*]))
  (define elts (parse-tree (dom-elements the-dom)))
  (define boxes (parse-tree (dom-boxes the-dom)))

  (match (dom-context the-dom ':matched) ['(true) (void)])
  (define matcher
    (let ([linker (link-matched-elts-boxes #f elts boxes)])
      (λ (x) (match (linker x) [#f #f] [(list a b c) a]))))

  (define box-context (make-hash (list (cons 'root boxes))))
  (node-set! boxes ':name 'root)
  (define components (hash-values box-context))
  (for ([cmd tactics])
    (match cmd
      [`(assert * ,assert)
       (for ([box components])
         (node-add! box (spec-or-assert assert) assert))]
      [`(assert! * ,assert)
       (for ([box components])
         (node-set! box (spec-or-assert assert) assert))]
      [`(assert! ,name ,assert)
       (define box (dict-ref box-context name))
       (node-set! box (spec-or-assert assert) assert)]
      [`(assert ,name ,assert)
       (define box (dict-ref box-context name))
       (node-add! box (spec-or-assert assert) assert)]
      [`(admit ,name ,assert)
       (define box (dict-ref box-context name))
       (node-add! box ':admit assert)]
      [`(lemma (,thm ,boxes ...))
       (define-values (vars body) (disassemble-forall (theorems thm)))       
       (define-values (thvars thbody) (disassemble-forall theorem))
       (set! theorem
             `(forall ,thvars
                      (=> (let (,@(map list vars boxes))
                            ,body)
                          ,thbody)))]
      [`(component ,name ,sel)
       (define selected-boxes
         (for/list ([box (in-tree boxes)] #:when (and (matcher box) (selector-matches? sel (matcher box))))
           box))
       (define box
         (match selected-boxes
           [(list) (raise (format "Could not find any elements matching ~a" sel))]
           [(list box) box]
           [(list boxes ...) (raise (format "~a matches multiple elements ~a" sel (string-join (map ~a boxes) ", ")))]))
       (hash-set! box-context name box)
       (set! components (cons box components))
       (node-set! box ':name name)
       (node-set*! box ':spec (list))]
      [`(components ,sels ...)
       (define selected-boxes
         (filter identity
                 (for/list ([box (in-tree boxes)] #:when (matcher box))
                   (define elt (matcher box))
                   (and elt (ormap (curryr selector-matches? elt) sels) box))))
       (when (null? selected-boxes)
         (eprintf "Warning: Could not find any elements matching ~a\n" (string-join (map ~a sels) ", ")))
       (for ([box selected-boxes])
         (node-set*! box ':spec (list))
         (set! components (cons box components)))]))
  (define problem* (dict-set problem ':documents (list (struct-copy dom the-dom [boxes (unparse-tree boxes)]))))
  (define problem** (dict-set problem* ':test (list theorem)))
  problem**)

(define (read-proofs proof-file)
  (define theorem-context (make-hash))
  (define proof-context (make-hash))
  (call-with-input-file proof-file
    (λ (p)
      (for ([cmd (in-port read p)])
        (match cmd
          [`(define (,name ,args ...) ,body)
           (define helper
             (procedure-reduce-arity
              (λ vals (smt-replace-terms body (map cons args vals)))
              (length args)))
           (hash-set! assertion-helpers name helper)]
          [`(theorem (,name ,args ...) ,body)
           (hash-set! theorem-context name `(forall ,args ,body))]
          [`(proof (,name ,thmname ,attrs ...) ,subcmds ...)
           (define theorem (dict-ref theorem-context thmname))
           (define props (attributes->dict attrs))
           (hash-set! proof-context name (curryr dom-run-proof subcmds theorem (curry dict-ref theorem-context) props))]))))
  proof-context)

