#lang racket
(require "../smt.rkt")

(provide tree-helpers)

(define-constraints tree-helpers
  (define-fun previous ((elt Element)) Element (get/elt (previous-name elt)))
  (define-fun next ((elt Element)) Element (get/elt (next-name elt)))
  (define-fun parent   ((elt Element)) Element (get/elt (parent-name elt)))
  (define-fun fchild   ((elt Element)) Element (get/elt (first-child-name elt)))
  (define-fun lchild   ((elt Element)) Element (get/elt (last-child-name elt)))

  (define-fun pbox ((box Box)) Box (get/box (p-name box)))
  (define-fun pbbox ((box Box)) Box (get/box (pb-name box)))
  (define-fun nbox ((box Box)) Box (get/box (n-name box)))
  (define-fun vbox ((box Box)) Box (get/box (vnf-name box)))
  (define-fun vnfbox ((box Box)) Box (get/box (vnf-name box)))
  (define-fun vffbox ((box Box)) Box (get/box (vff-name box)))
  (define-fun fbox ((box Box)) Box (get/box (f-name box)))
  (define-fun lbox ((box Box)) Box (get/box (l-name box))))
