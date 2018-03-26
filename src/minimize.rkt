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

(define (has-num? html)
  (if (get-num html)
      html
      #f))

;; Returns the elt of a child, from the highest ancestor in the hierarchy with multiple children, that is not an ancestor of the original node
(define (choose-to-remove node)
  (define parent (and node (node-parent node)))
  (if parent
      (let ([fromparent (choose-to-remove parent)]
            [next (node-next node)]
            [prev (node-prev node)])
        (or (has-num? fromparent) (has-num? next) (has-num? prev)))
      #f))

(define (get-statistics to-remove docs)
  (define doms (map parse-dom docs))
  (define removed-boxes (sub-tree-size to-remove))
  (define total-boxes (length (append-map (compose sequence->list in-tree dom-boxes) doms)))
  (list removed-boxes
        total-boxes
        (real->decimal-string (* (/ removed-boxes total-boxes) 100) 2)))

(define (find-problem-box new)
  (define last #f)
  (for* ([dom new] [node (in-tree (parse-tree dom))]
                   #:when node
                   [(key value) (in-dict (node-attrs node))]
                   #:break last)
    (match value
      [(list (list 'bad prop)) (set! last node)]
      [_ '()]))
  last)

(define (get-elt-ancestor box)
  (if (has-elt? box)
      box
      (and (node-parent box) (get-elt-ancestor (node-parent box)))))

(define (get-elt->index old)
  (define tagcounts (make-hash))
  (define elt->index (make-hash))
  (for* ([doc old] [html (in-elements (parse-dom doc))] #:when (has-num? html))
    (define tag (node-type html))
    (dict-set! elt->index (get-num html) (dict-ref! tagcounts tag 0))
    (dict-set! tagcounts tag (+ 1 (dict-ref tagcounts tag))))
  elt->index)

(define (get-box-elt-map new old)
  (define box->elt (make-hash))
  (define elt->box (make-hash))
  (for* ([dom new] [doc old]
                   [node (in-tree (parse-tree dom))]
                   [html (in-elements (parse-dom doc))]
                   #:when (and (has-elt? node) (has-num? html)))
    (when (equal? (dict-ref (node-attrs node) ':elt) (dict-ref (node-attrs html) ':num))
      (dict-set! box->elt (dict-ref (node-attrs node) ':elt) html)
      (dict-set! elt->box (get-num html) node)))
  (cons box->elt elt->box))

(define (get-box-to-remove new old)
  (define problem-box (get-elt-ancestor (find-problem-box new)))
  (match-define (cons box->elt elt->box) (get-box-elt-map new old))
  (define elt->index (get-elt->index old))
  (define problem-html (dict-ref box->elt (dict-ref (node-attrs problem-box) ':elt)))
  (define to-remove (choose-to-remove problem-html))
  (if to-remove
      (let* ([num (get-num to-remove)]
             [result (cons (node-type to-remove) (dict-ref elt->index num))])
        (cons (get-statistics (dict-ref elt->box num) old) result))
      to-remove))
