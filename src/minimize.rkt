#lang racket

(require json
         "common.rkt" "input.rkt" "tree.rkt" "dom.rkt"
         "frontend.rkt" "solver.rkt"
         "print/tree.rkt" "print/css.rkt" "print/smt.rkt")

(provide get-box-to-remove)

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

(define (find-problem-boxes new)
  (define (is-problem box)
    (for/or ([(key value) (in-dict (node-attrs box))])
      (match value
        [(list (list 'bad prop)) #t]
        [_ #f])))

  (for*/list ([dom new] [node (in-tree (parse-tree dom))]
                   #:when node
                   #:when (is-problem node))
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
         (define tag&index (cons (dict-ref node 'tag #f) (dict-ref node 'index #f)))
         (dict-ref tag&index->elt tag&index #f))
       nodes))

(define (get-box-to-remove new old backtracked)
  (define docs (map parse-dom old))
  (define failing (find-problem-boxes new))
  (define tag&index->elt (elt<->tag&idx-association docs))
  (define backtracked-elts (parse-backtracked backtracked tag&index->elt))
  (mark-failing (append failing backtracked-elts))
  (mark-tree (append failing backtracked-elts) ':bad #t)
  (mark-tree backtracked-elts ':dnr #t)

  (define candidates
    (for/list ([problem-box failing])
      (define problem-elt (get-elt-ancestor problem-box))
      (if (has-elt? problem-elt)
          (match-let ([(cons box->elt elt->box) (get-box-elt-map new docs)])
            (define problem-html (dict-ref box->elt (dict-ref (node-attrs problem-elt) ':elt)))
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
        (match-let ([(cons box->elt elt->box) (get-box-elt-map new docs)])
          (cons (get-statistics (dict-ref elt->box num) old) result)))
      to-remove)) ;; TODO: Choose a different mode
