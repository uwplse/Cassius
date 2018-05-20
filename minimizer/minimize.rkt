#lang racket

(require json
         "../src/common.rkt" "../src/input.rkt" "../src/tree.rkt" "../src/dom.rkt"
         "../src/frontend.rkt" "../src/solver.rkt"
         "../src/print/tree.rkt" "../src/print/css.rkt" "../src/print/smt.rkt")

(provide get-box-to-remove)

(define (parse-unsat-cache port)
  (define cache (make-hash))
  (for ([expr (in-port read port)])
    (match expr
      [`(define-tree ,tree) (dict-set! cache ':tree tree)]
      [`(define-document ,document) (dict-set! cache ':document document)]))
  cache)

(define (parse-cex-cache port)
  (define cache (make-hash))
  (for ([expr (in-port read port)])
    (match expr
      [`(define-tree ,tree) (dict-set! cache ':tree tree)]
      [`(define-document ,document) (dict-set! cache ':document document)]
      [`(define-config ,config) (dict-set! cache ':config config)]))
  cache)

(define (sub-tree-size node)
  (define count 1)
  (for ([child (node-children node)])
    (set! count (+ count (sub-tree-size child))))
  count)

(define (has-elt? node)
  (if (and node (dict-ref (node-attrs node) ':elt #f))
      node
      #f))

(define (get-num html)
  (and html (dict-ref (node-attrs html) ':num #f)))

(define (is-marked? mark html)
  (and html (node-get html mark #:default #f)))

(define (has-num? html)
  (and (get-num html) html))

(define (valid? mark)
  (lambda (html)
    (and (not (is-marked? mark html)) (has-num? html))))

;; Returns the elt of a child, from the highest ancestor in the hierarchy with multiple children, that is not an ancestor of the original node
(define (choose-to-remove node test)
  (define parent (and node (node-parent node)))
  (if parent
      (let ([fromparent (choose-to-remove parent test)]
            [next (node-next node)]
            [prev (node-prev node)])
        (or (test fromparent) (test next) (test prev)))
      #f))

(define (get-statistics to-remove docs)
  (define doms (map parse-dom docs))
  (define removed-boxes (sub-tree-size to-remove))
  (define total-boxes (length (append-map (compose sequence->list in-tree dom-boxes) doms)))
  (list removed-boxes
        total-boxes
        (real->decimal-string (* (/ removed-boxes total-boxes) 100) 2)))

(define (is-problem box)
    (for/or ([(key value) (in-dict (node-attrs box))])
      (match value
        [(list (list 'bad prop)) #t]
        [_ #f])))

#;(define (is-cex box)
    (for/or ([(key value) (in-dict (node-attrs box))])
      (match key
        [':cex #t]
        [_ #f])))

(define (find-problem-boxes new test)
  (for*/list ([dom new] [node (in-tree (parse-tree dom))]
                   #:when (and node (test node)))
    node))

(define (get-elt-ancestor box)
  (if (has-elt? box)
      box
      (and box (node-parent box) (get-elt-ancestor (node-parent box)))))

(define (elt<->tag&idx-association old)
  (define tagcounts (make-hash))
  (define tag&index->elt (make-hash))
  (for* ([doc old] [html (in-elements doc)])
    (define tag (node-type html))
    (define idx (dict-ref tagcounts tag 0))
    (node-set! html ':idx idx)
    (dict-set! tag&index->elt (cons tag idx) html)
    (dict-set! tagcounts tag (+ 1 idx)))
  tag&index->elt)

(define (get-box-elt-map new old)
  (define box->elt (make-hash))
  (define elt->box (make-hash))
  (for* ([dom new] [doc old]
                   [node (in-tree (parse-tree dom))]
                   [html (in-elements doc)]
                   #:when (and (has-elt? node) (has-num? html)))
    (when (equal? (dict-ref (node-attrs node) ':elt) (dict-ref (node-attrs html) ':num))
      (dict-set! box->elt (dict-ref (node-attrs node) ':elt) html)
      (dict-set! elt->box (get-num html) node)))
  (cons box->elt elt->box))

(define (mark-failing nodes)
  (define (mark-node node)
    (when node
      (node-set! node ':bad-children (node-get node ':bad-children #:default 0))
      (mark-node (node-parent node))))

  (for ([node nodes])
    (mark-node node)))

(define (mark-tree nodes mark value)
  (define (mark-node node)
    (when node
      (node-set! node mark value)
      (mark-node (node-parent node))))

  (for ([node nodes])
    (mark-node node)))

(define (parse-backtracked backtracked tag&index->elt)
  (define nodes (string->jsexpr backtracked))
  (map (lambda (node)
         (define tag&index (cons (string->symbol (dict-ref node 'tag #f)) (dict-ref node 'index #f)))
         (dict-ref tag&index->elt tag&index #f))
       nodes))

(define (get-box-to-remove new old backtracked)
  (define docs (map parse-dom old))
  (define failing (find-problem-boxes new is-problem)) ; Switch to is-cex for assertions
  (define tag&index->elt (elt<->tag&idx-association docs))
  (define backtracked-elts (parse-backtracked backtracked tag&index->elt))
  (mark-failing (append failing backtracked-elts))
  (mark-tree (append failing backtracked-elts) ':bad #t)
  (mark-tree backtracked-elts ':dnr #t)
  (match-define (cons box->elt elt->box) (get-box-elt-map new docs))

  (define candidates
    (for/list ([problem-box failing])
      (define problem-elt (get-elt-ancestor problem-box))
      (if (has-elt? problem-elt)
          (let ([problem-html (dict-ref box->elt (dict-ref (node-attrs problem-elt) ':elt))])
            (define weak-candidate (choose-to-remove problem-html (valid? ':bad)))
            (define strong-candidate (choose-to-remove problem-html (valid? ':dnr)))
            (or weak-candidate strong-candidate))
          #f)))

  (define to-remove
    (for/fold ([default #f]) ([candidate candidates])
      (or (and candidate default
               (if (> (sub-tree-size candidate) (sub-tree-size default)) candidate default))
          candidate default)))

  (if to-remove
      (let* ([num (get-num to-remove)]
             [result (cons (node-type to-remove) (node-get to-remove ':idx))])
          (cons (get-statistics (dict-ref elt->box num) old) result))
      to-remove))

#;(module+ main
  (multi-command-line
   #:program "cassius minimizer"

   #:subcommands
   ["rendering"
    #:args (cache-file [backtracked "[]"])
    (define cache (call-with-input-file cache-file parse-unsat-cache))
    (define to-remove (get-box-to-remove
                       (dict-ref cache ':tree)
                       (dict-ref cache ':document)
                       backtracked))
    (when to-remove
      (printf "Rejected\n")
      (match-define (cons (list removed total efficiency) (cons tag index)) to-remove)
      ;; TODO: Make two JSON outputs into one JSON output
      (write-json (make-hash (list (cons 'removed removed)
                                   (cons 'total total)
                                   (cons 'efficiency efficiency))))
      (newline)
       (write-json (make-hash (list (cons 'tag (symbol->string tag)) (cons 'index index))))
      (newline))
    (unless to-remove
      (printf "Minimized\n")
      (define total-boxes (length (append-map (compose sequence->list in-tree dom-boxes) (map parse-dom (dict-ref cache ':document)))))
      (printf "~s\n" total-boxes))]
   ["assertion"
    #:args (cache-file cexes [backtracked "[]"])
    (eprintf "Minimizing assertions is currently unsupported\n\n")
    (define cache (call-with-input-file cache-file parse-cex-cache))
    (define properties (dict-ref cache ':config))
    (eprintf "Dom-properties: ~s\n" properties)
    
    (define to-remove (get-box-to-remove
                       (dict-ref cache ':tree)
                       (dict-ref cache ':document)
                       backtracked))
    (when to-remove
      (printf "Rejected\n")
      (match-define (cons (list removed total efficiency) (cons tag index)) to-remove)
      ;; TODO: Make two JSON outputs into one JSON output
      (write-json (make-hash (list (cons 'removed removed)
                                   (cons 'total total)
                                   (cons 'efficiency efficiency))))
      (newline)
       (write-json (make-hash (list (cons 'tag (symbol->string tag)) (cons 'index index))))
      (newline))
    (unless to-remove
      (printf "Minimized\n")
      (define total-boxes (length (append-map (compose sequence->list in-tree dom-boxes) (map parse-dom (dict-ref cache ':document)))))
      (printf "~s\n" total-boxes))]))