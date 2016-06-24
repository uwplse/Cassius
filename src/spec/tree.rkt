#lang racket
(require "../common.rkt")
(require "../smt.rkt")
(require "../css-properties.rkt")

(provide tree-types link-definitions)

(define (type->prefix type)
  (if (eq? (slower type) 'textalign) 'text-align (slower type)))

(define-constraints tree-types
  (declare-datatypes ()
     ((Box no-box
           (box (type BoxType)
                (x Real) (y Real) (w Real) (h Real)
                (xo Real) (yo Real)
                (mt Real) (mr Real) (mb Real) (ml Real)
                (mtp2 Real) (mtn2 Real) (mbp2 Real) (mbn2 Real)
                (mtp Real) (mtn Real) (mbp Real) (mbn Real)
                (pt Real) (pr Real) (pb Real) (pl Real)
                (bt Real) (br Real) (bb Real) (bl Real)
                (stfwidth Real)
                (real-p-name BoxName)
                (real-n-name BoxName) (real-v-name BoxName)
                (real-f-name BoxName) (real-l-name BoxName)
                (width-set Bool)
                (pb-name BoxName)
                (n-name BoxName) (v-name BoxName) (flt-name BoxName) (flt-up-name BoxName)
                (float Float) (textalign Text-Align) (position Position)
                (element ElementName)))
      (BoxType box/root box/text box/inline box/block box/line)
      (Element no-elt
           (elt (document Document) (tagname TagNames) (idname Id)
                (specified-style Style) (computed-style Style)
                (previous-name ElementName) (parent-name ElementName) (next-name ElementName)
                (first-child-name ElementName) (last-child-name ElementName)
                (flow-box BoxName))))))

(define-constraints link-definitions
  (define-fun previous ((elt Element)) Element (get/elt (previous-name elt)))
  (define-fun next ((elt Element)) Element (get/elt (next-name elt)))
  (define-fun parent   ((elt Element)) Element (get/elt (parent-name elt)))
  (define-fun fchild   ((elt Element)) Element (get/elt (first-child-name elt)))
  (define-fun lchild   ((elt Element)) Element (get/elt (last-child-name elt)))

  ;; The "real" boxes in each direction
  (define-fun real-pbox ((box Box)) Box (get/box (real-p-name box)))
  (define-fun real-fbox ((box Box)) Box (get/box (real-f-name box)))
  (define-fun real-lbox ((box Box)) Box (get/box (real-l-name box)))
  (define-fun real-vbox ((box Box)) Box (get/box (real-v-name box)))
  (define-fun real-nbox ((box Box)) Box (get/box (real-n-name box)))

  (define-fun box-in-flow ((box Box)) Bool
    (and (is-box box) (is-float/none (float box))
         (or (is-position/static (position box))
             (is-position/relative (position box)))))

  (define-fun pbox ((box Box)) Box (real-pbox box))
  (define-fun nbox ((box Box)) Box (get/box (n-name box)))
  (define-fun vbox ((box Box)) Box (get/box (v-name box)))
  (define-fun fltbox ((box Box)) Box (get/box (flt-name box)))
  (define-fun fbox ((b Box)) Box
    (ite (=> (is-box (real-fbox b)) (box-in-flow (real-fbox b)))
         (real-fbox b) (nbox (real-fbox b))))
  (define-fun lbox ((b Box)) Box
    (ite (=> (is-box (real-lbox b)) (box-in-flow (real-lbox b)))
         (real-lbox b) (vbox (real-lbox b))))
  (define-fun pbbox ((box Box)) Box (get/box (pb-name box)))

  (define-fun link-element ((elt Element) (doc Document) (p ElementName)
                            (v ElementName) (n ElementName) (f ElementName)
                            (l ElementName)) Bool
    (and (is-elt elt)
         (= (document elt) doc)
         (= (parent-name elt) p)
         (= (previous-name elt) v)
         (= (next-name elt) n)
         (= (first-child-name elt) f)
         (= (last-child-name elt) l)))

  (define-fun element-info ((elt Element) (tag TagNames) (&idname Id)) Bool
    (and (= (tagname elt) tag) (= (idname elt) &idname)
         (not (is-no-tag (tagname elt)))
         ,@(for/list ([(prop type _d) (in-css-properties)])
             `(not (,(sformat "is-~a/inherit" (type->prefix type))
                    (,(sformat "style.~a" prop) (specified-style elt)))))
         ,@(for/list ([prop '(width min-width max-width min-height max-height
                              margin-top margin-right margin-bottom margin-left
                              padding-top padding-right padding-bottom padding-left
                              border-top-style border-right-style border-bottom-style border-left-style
                              text-align overflow-x overflow-y position top bottom left right)])
             `(= (,(sformat "style.~a" prop) (computed-style elt))
                 (,(sformat "style.~a" prop) (specified-style elt))))
         ;; If the height of the containing block is not specified
         ;; explicitly (i.e., it depends on content height), and this
         ;; element is not absolutely positioned, the value computes
         ;; to 'auto'
         (= (style.height (computed-style elt))
            (let ([h (style.height (specified-style elt))]
                  [h* (style.height (specified-style (parent elt)))])
              (ite (and (not (or (is-height/px h) (is-height/auto h))) (is-height/auto h*))
                   height/auto
                   (style.height (specified-style elt)))))
         ;; This isn't what the standard says, but is what Firefox does.
         (= (style.float (computed-style elt))
            (let ([pos (style.position (specified-style elt))])
              (ite (or (is-position/relative pos) (is-position/static pos))
                   (style.float (specified-style elt))
                   float/none)))
         ;; border-*-width
         ,@(for/list ([dir '(top right bottom left)])
             `(= (,(sformat "style.border-~a-width" dir) (computed-style elt))
                 (ite (or (is-border-style/none (,(sformat "style.border-~a-style" dir) (specified-style elt)))
                          (is-border-style/hidden (,(sformat "style.border-~a-style" dir) (specified-style elt))))
                      (border/px 0.0)
                      (,(sformat "style.border-~a-width" dir) (specified-style elt)))))))

  (define-fun link-element-box ((&e ElementName) (&b BoxName)) Bool
    (and
     (is-box (get/box &b))
     (= (float (get/box &b)) (style.float (computed-style (get/elt &e))))
     (= (position (get/box &b)) (style.position (computed-style (get/elt &e))))
     (= (textalign (get/box &b)) (style.text-align (computed-style (get/elt &e))))
     (= (element (get/box &b)) &e)
     (= (flow-box (get/elt &e)) &b)))

  (define-fun link-anon-box ((&b BoxName)) Bool
    (and
     (is-box (get/box &b))
     (= (float (get/box &b)) float/none)
     (= (position (get/box &b)) position/static)
     (= (textalign (get/box &b))
        (ite (is-box (pbox (get/box &b)))
             (textalign (pbox (get/box &b)))
             text-align/left))
     (= (element (get/box &b)) nil-elt)))

  (define-fun link-block-box ((b Box) (&self BoxName) (&p BoxName) (&v BoxName) (&n BoxName) (&f BoxName) (&l BoxName)) Bool
    ,(smt-let ([e (get/elt (element b))])
       (= (real-p-name b) &p)
       (= (real-v-name b) &v)
       (= (real-n-name b) &n)
       (= (real-f-name b) &f)
       (= (real-l-name b) &l)
       (= (pb-name b) &self)
       (= (v-name b)
          ,(smt-cond
            [(is-nil-box &v) nil-box]
            [(box-in-flow (get/box &v)) &v]
            [else (v-name (get/box &v))]))
       (= (n-name b)
          ,(smt-cond
            [(is-nil-box &n) nil-box]
            [(box-in-flow (get/box &n)) &n]
            [else (n-name (get/box &n))]))
       ;; Uncomment the next two commented lines to not inline flow chains
       (!
       (= (flt-name b)
          (ite (is-nil-box &v)
               (ite (not (box-in-flow (get/box &p)))
                    nil-box
                    (flt-name (get/box &p)))
               (flt-up-name (get/box &v))))
       :opt false)
       (= (flt-up-name b)
          ,(smt-cond
            [(or (is-position/fixed (position b)) (is-position/absolute (position b)))
             (ite (is-nil-box &v) nil-box (flt-up-name (get/box &v)))]
            [(not (is-float/none (float b))) &self]
            [(is-nil-box &l) (flt-name b)]
            [else (flt-up-name (get/box &l))]))))

  (define-fun link-inline-box ((b Box) (&self BoxName) (&p BoxName) (&v BoxName) (&n BoxName) (&f BoxName) (&l BoxName)) Bool
    ,(smt-let ([e (get/elt (element b))])
       (= (real-p-name b) &p)
       (= (real-v-name b) &v)
       (= (real-n-name b) &n)
       (= (real-f-name b) &f)
       (= (real-l-name b) &l)
       (= (pb-name b) (pb-name (pbox b)))
       (= (v-name b) &v)
       (= (n-name b) &n)
       (= (flt-name b) (flt-name (pbbox b)))
       (= (flt-up-name b) (flt-name b))))

  (define-fun link-line-box ((b Box) (&self BoxName) (&p BoxName) (&v BoxName) (&n BoxName) (&f BoxName) (&l BoxName)) Bool
    ,(smt-let ([e (get/elt (element b))])
       (= (real-p-name b) &p)
       (= (real-v-name b) &v)
       (= (real-n-name b) &n)
       (= (real-f-name b) &f)
       (= (real-l-name b) &l)
       (= (pb-name b) (pb-name (pbox b)))
       (= (v-name b) &v)
       (= (n-name b) &n)
       (= (flt-name b) (flt-name (pbbox b)))
       (= (flt-up-name b) (flt-name b))))

  (define-fun link-text-box ((b Box) (&self BoxName) (&p BoxName) (&v BoxName) (&n BoxName) (&f BoxName) (&l BoxName)) Bool
    ,(smt-let ([e (get/elt (element b))])
       (= (real-p-name b) &p)
       (= (real-v-name b) &v)
       (= (real-n-name b) &n)
       (= (real-f-name b) &f)
       (= (real-l-name b) &l)
       (= (pb-name b) (pb-name (pbox b)))
       (= (v-name b) &v)
       (= (n-name b) &n)
       (= (flt-name b) (flt-name (pbbox b)))
       (= (flt-up-name b) (flt-name b)))))
