#lang racket
(require "../common.rkt" "../smt.rkt" "../encode.rkt" "utils.rkt")
(provide link-definitions)

;; This file defines the tree structures used in Cassius's SMT
;; encoding of CSS. It defines the Element and Box classes, and
;; functions to properly establish the pointers each holds.

(define-constraints link-definitions

  ;; Three additional pointers: to the previous floating box, the
  ;; parent block box, and the parent positioned box.
  (define-fun ppflow ((box Box)) Box (get/box (&ppflow box)))
  (define-fun pbflow ((box Box)) Box (get/box (&pbflow box)))
  (define-fun rootbox ((box Box)) Box (get/box (&root box)))

  ;; Helper functions for some basic primitives
  (define-fun float ((b Box)) Float
    (ite (is-elt (box-elt b))
         (style.float (computed-style (box-elt b)))
         float/none))

  (define-fun position ((b Box)) Position
    (ite (is-elt (box-elt b))
         (style.position (computed-style (box-elt b)))
         position/static))

  (define-fun box-positioned ((box Box)) Bool
    (or (is-position/absolute (position box))
        (is-position/fixed (position box))
        (is-position/relative (position box))))

  (define-fun is-root-elt ((e Element)) Bool
    (= (&pelt e) -1))

  (define-fun box-in-flow ((box Box)) Bool
    (and (is-box box) (is-float/none (float box))
         (or (is-position/relative (position box))
             (is-position/static (position box)))))

  (define-fun is-flow-root ((b Box)) Bool
    (and (is-elt (box-elt b))
         (or (is-box/root (type b))
             (is-root-elt (box-elt b))
             (not (box-in-flow b))
             (is-display/inline-block (style.display (computed-style (box-elt b))))
             (not (is-overflow/visible (style.overflow-x (computed-style (box-elt b)))))
             (not (is-overflow/visible (style.overflow-y (computed-style (box-elt b))))))))

  ;; The boxes in each direction in the flow tree
  (define-fun pflow ((box Box)) Box (pbox box))
  (define-fun nflow ((box Box)) Box (get/box (&nflow box)))
  (define-fun vflow ((box Box)) Box (get/box (&vflow box)))
  (define-fun &fflow ((b Box)) Int
    (ite (=> (is-box (fbox b)) (box-in-flow (fbox b)))
         (&fbox b) (&nflow (fbox b))))
  (define-fun &lflow ((b Box)) Int
    (ite (=> (is-box (lbox b)) (box-in-flow (lbox b)))
         (&lbox b) (&vflow (lbox b))))
  (define-fun fflow ((box Box)) Box (get/box (&fflow box)))
  (define-fun lflow ((box Box)) Box (get/box (&lflow box)))

  ;; `link-element` and `link-box` set the element and box tree pointers
  (define-fun link-element ((elt Element) (&p Int) (&v Int) (&n Int) (&f Int) (&l Int)) Bool
    (and (is-elt elt)
         (= (&pelt elt) &p)
         (= (&velt elt) &v)
         (= (&nelt elt) &n)
         (= (&felt elt) &f)
         (= (&lelt elt) &l)))

  (define-fun link-box ((box Box) (&p Int) (&v Int) (&n Int) (&f Int) (&l Int)) Bool
    (and (is-box box)
         (= (&pbox box) &p)
         (= (&vbox box) &v)
         (= (&nbox box) &n)
         (= (&fbox box) &f)
         (= (&lbox box) &l)
         ,@(for/list ([field '(bl br bt bb pr pb pt w h mtp mbp stfwidth)]) ; No pl because text-indent
             `(>= (,field box) 0.0))
         ,@(for/list ([field '(mtn mbn)])
             `(<= (,field box) 0.0))))

  ;; `match-element-box` matchs elements and boxes together.
  ;; `match-anon-element` and `match-anon-box` do the same for
  ;; elements and boxes without links on the other side.
  (define-fun match-element-box ((&e Int) (&b Int) (first? Bool) (last? Bool)) Bool
    (and
     (= (&elt (get/box &b)) &e)
     (= (first-box? (get/box &b)) first?)
     (= (last-box? (get/box &b)) last?)
     ,@(for/list ([i (in-naturals)] [(name p) (in-dict (extra-pointers))])
         `(= (,(sformat "&~a" i) (get/box &b)) ,(p '&b (sformat "&~a" i))))
     (= (textalign (get/box &b))
        (style.text-align (computed-style (get/elt &e))))
     (= (fg-color (get/box &b))
        (style.color (computed-style (get/elt &e))))
     (= (bg-color (get/box &b))
        (style.background-color (computed-style (get/elt &e))))))

  (define-fun match-anon-box ((&b Int)) Bool
    (and
     (= (&elt (get/box &b)) -1)
     (= (first-box? (get/box &b)) true)
     (= (last-box? (get/box &b)) true)
     ,@(for/list ([i (in-naturals)] [(name p) (in-dict (extra-pointers))])
         `(= (,(sformat "&~a" i) (get/box &b)) ,(p '&b (sformat "&~a" i))))
     (= (textalign (get/box &b))
        (ite (is-no-box (pflow (get/box &b)))
             text-align/left
             (textalign (pflow (get/box &b)))))
     (= (fg-color (get/box &b))
        (ite (is-no-box (pflow (get/box &b)))
             color/black
             (fg-color (pflow (get/box &b)))))
     (= (bg-color (get/box &b)) color/transparent)))

  ;; `link-flow-simple`, `link-flow-root`, and `link-flow-block` link
  ;; boxes together in their flow trees. The "block" version is much
  ;; more complex than the non-block version, because so many things
  ;; can only be true of block boxes.
  (define-fun link-flow-root ((b Box) (&b Int)) Bool
    (and
     (= (&ppflow b) &b)
     (= (&pbflow b) -1)
     (= (&vflow b) -1)
     (= (&nflow b) -1)
     (= (&root b) &b)
     (= (ez.in b) ez.init)))

  (define-fun link-flow-simple ((b Box) (&b Int)) Bool
    (and
     (= (&ppflow b) (ite (box-positioned (pbox b)) (&pbox b) (&ppflow (pflow b))))
     (= (&pbflow b) (ite (or (is-box/block (type (pbox b))) (is-flow-root (pbox b))) (&pbox b) (&pbflow (pbox b))))
     (= (&vflow b) (&vbox b))
     (= (&nflow b) (&nbox b))
     (= (&root b) (&root (pbox b)))
     (= (ez.in b) (ite (is-no-box (vbox b))
                       (ite (is-flow-root (pbox b))
                            ez.init
                            (ez.in (pbox b)))
                       (ez.out (vbox b))))))

  (define-fun link-flow-block ((b Box) (&b Int)) Bool
    (and
     (= (&ppflow b) (ite (box-positioned (pbox b)) (&pbox b) (&ppflow (pbox b))))
     (= (&pbflow b) (ite (or (is-box/block (type (pbox b))) (is-flow-root (pbox b))) (&pbox b) (&pbflow (pbox b))))
     (= (&vflow b)
        ,(smt-cond
          [(is-no-box (vbox b)) -1]
          [(box-in-flow (vbox b)) (&vbox b)]
          [else (&vflow (vbox b))]))
     (= (&nflow b)
        ,(smt-cond
          [(is-no-box (nbox b)) -1]
          [(box-in-flow (nbox b)) (&nbox b)]
          [else (&nflow (nbox b))]))
     (= (&root b) (&root (pbox b)))
     (= (ez.in b) (ite (is-no-box (vbox b))
                       (ite (is-flow-root (pbox b))
                            ez.init
                            (ez.in (pbox b)))
                       (ez.out (vbox b)))))))

