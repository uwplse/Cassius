#lang racket

(require "types.rkt")
(require "logic.rkt")

(define (selector-applies sel elt)
  (l/match sel
           [(sel:all) true]
           [(sel:tag tag) (l/= (elt.tag elt) tag)]
           [(sel:id id) (l/= (elt.id elt) id)]))

(define selector-score-base 1000)
(define (selector-score-value important? style? ids clss tags idx)
  (+ (* (expt selector-score-base 5) (if important? 1 0))
     (* (expt selector-score-base 4) (if style? 0 1))
     (* (expt selector-score-base 3) ids)
     (* (expt selector-score-base 2) clss)
     (* (expt selector-score-base 1) tags)
     (* (expt selector-score-base 0) (+ 1.0 idx))))

(define (selector-score sel idx)
  ; IMPORTANT: This must always be > 0
  (l/match sel
           [(sel:all) (selector-score-value #f #f 0 0 1 ,idx)]
           [(sel:tag tag) (selector-score-value #f #f 0 0 1 ,idx)]
           [(sel:id id) (selector-score-value #f #f 1 0 0 ,idx)]))

(define (element-style elt rules)
  "Give the computed style of an element, given a list of all the rules."
  (define style (l/var Style))
  (apply l/and
         ; For each property,
         (for/list ([(property info) (in-hash css-properties)])
           (l/and
            (apply l/and ; Its score is greater than any enabled rule's
                   (for/list ([rule rules] [idx (in-naturals)])
                     (l/=> (l/and (selector-applies (rule.sel rule) elt)
                                  (property-enabled? property rule))
                           (l/>= (property-score property style)
                                 (selector-score (rule.sel rule) idx)))))
            (l/or
             (l/and (l/= (property-score property style) (l/real 0))
                    (l/= (property-value property style) (property-default property)))
             (apply l/and
                    (for/list ([rule rules] [idx (in-naturals)])
                      (l/and
                       (property-enabled? property rule)
                       (selector-applies (rule.sel rule) elt)
                       (l/= (property-score property style) (selector-score (rule.sel rule) idx))
                       (l/= (property-value property style) (property-specified property rule))))))))))
