#lang racket
(require "../smt.rkt")

(provide tree-types link-definitions)

(define tree-types
  `((declare-datatypes ()
       ((Box no-box
             (box (type BoxType)
                  (x Real) (y Real) (w Real) (h Real)
                  (mt Real) (mr Real) (mb Real) (ml Real)
                  (mtp Real) (mtn Real) (mbp Real) (mbn Real)
                  (pt Real) (pr Real) (pb Real) (pl Real)
                  (bt Real) (br Real) (bb Real) (bl Real)
                  (stfwidth Real)
                  (pb-name BoxName)
                  (n-name BoxName) (v-name BoxName) (flt-name BoxName)
                  (element ElementName)))
        (BoxType box/root box/text box/inline box/block box/line)
        (Element no-elt
             (elt (document Document) (tagname TagNames) (id Id) (rules Style)
                  (display Display) (float Float) (textalign TextAlign)
                  (previous-name ElementName) (parent-name ElementName) (next-name ElementName)
                  (first-child-name ElementName) (last-child-name ElementName)
                  (flow-box BoxName)))))))


(define-constraints link-definitions
  (define-fun previous ((elt Element)) Element (get/elt (previous-name elt)))
  (define-fun next ((elt Element)) Element (get/elt (next-name elt)))
  (define-fun parent   ((elt Element)) Element (get/elt (parent-name elt)))
  (define-fun fchild   ((elt Element)) Element (get/elt (first-child-name elt)))
  (define-fun lchild   ((elt Element)) Element (get/elt (last-child-name elt)))

  ;; The "real" boxes in each direction
  (define-fun real-pbox ((box Box)) Box (get/box (flow-box (parent (get/elt (element box))))))
  (define-fun real-fbox ((box Box)) Box (get/box (flow-box (fchild (get/elt (element box))))))
  (define-fun real-lbox ((box Box)) Box (get/box (flow-box (lchild (get/elt (element box))))))
  (define-fun real-vbox ((box Box)) Box
    (if (is-no-elt (previous (get/elt (element box))))
        no-box
        (get/box (flow-box (previous (get/elt (element box)))))))
  (define-fun real-nbox ((box Box)) Box
    (if (is-no-elt (next (get/elt (element box))))
        no-box
        (get/box (flow-box (next (get/elt (element box)))))))

  (define-fun pbox ((box Box)) Box (real-pbox box))
  (define-fun nbox ((box Box)) Box (get/box (n-name box)))
  (define-fun vbox ((box Box)) Box (get/box (v-name box)))
  (define-fun fltbox ((box Box)) Box (get/box (flt-name box)))
  (define-fun fbox ((b Box)) Box
    (ite (=> (is-box (real-fbox b)) (is-float/none (float (get/elt (element (real-fbox b))))))
         (real-fbox b) (nbox (real-fbox b))))
  (define-fun lbox ((b Box)) Box
    (ite (=> (is-box (real-lbox b)) (is-float/none (float (get/elt (element (real-lbox b))))))
         (real-lbox b) (vbox (real-lbox b))))
  (define-fun pbbox ((box Box)) Box (get/box (pb-name box)))

  (define-fun link-block-box ((b Box)) Bool
    ,(smt-let ([e (get/elt (element b))])
       (= (pb-name b) (flow-box e))
       (= (v-name b)
          ,(smt-cond
            [(is-no-elt (previous e)) nil-box]
            [(is-float/none (float (previous e))) (flow-box (previous e))]
            [else (v-name (get/box (flow-box (previous e))))]))
       (= (n-name b)
          ,(smt-cond
            [(is-no-elt (next e)) nil-box]
            [(is-float/none (float (next e))) (flow-box (next e))]
            [else (n-name (get/box (flow-box (next e))))]))
       (= (flt-name b)
          ,(smt-cond
            [(and (is-no-elt (previous e)) (not (is-float/none (float (parent e))))) nil-box]
            [(is-no-elt (previous e)) (flt-name (get/box (flow-box (parent e))))]
            [(is-float/none (float (previous e))) (flt-name (get/box (flow-box (previous e))))]
            [else (flow-box (previous e))]))))

  (define-fun link-inline-box ((b Box)) Bool
    ,(smt-let ([e (get/elt (element b))])
       (= (pb-name b) (pb-name (pbox b)))
       (= (v-name b) (ite (is-no-elt (previous e)) nil-box (flow-box (previous e))))
       (= (n-name b) (ite (is-no-elt (next e)) nil-box (flow-box (next e))))
       (= (flt-name b) (flt-name (pbbox b)))))

  (define-fun link-line-box ((b Box)) Bool
    ,(smt-let ([e (get/elt (element b))])
       (= (pb-name b) (pb-name (pbox b)))
       (= (v-name b) (ite (is-no-elt (previous e)) nil-box (flow-box (previous e))))
       (= (n-name b) (ite (is-no-elt (next e)) nil-box (flow-box (next e))))
       (= (flt-name b) (flt-name (pbbox b)))))

  (define-fun link-text-box ((b Box)) Bool
    ,(smt-let ([e (get/elt (element b))])
       (= (pb-name b) (pb-name (pbox b)))
       (= (v-name b) (ite (is-no-elt (previous e)) nil-box (flow-box (previous e))))
       (= (n-name b) (ite (is-no-elt (next e)) nil-box (flow-box (next e))))
       (= (flt-name b) (flt-name (pbbox b))))))
