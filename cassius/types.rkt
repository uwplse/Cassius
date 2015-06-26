#lang racket

(require unstable/sequence)
(require "common.rkt")
(require "logic.rkt")

(l/type IdName)
(l/type TagName)
(l/type ElementName)
(l/type DocumentName)

;; Boxes

(l/struct Box
          (box (x Real) (y Real) (w Real) (h Real)
               (mt Real) (mr Real) (mb Real) (ml Real)
               (mtp Real) (mtn Real) (mbp Real) (mbn Real)
               (pt Real) (pr Real) (pb Real) (pl Real)
               (bt Real) (br Real) (bb Real) (bl Real)
               (gap Real)))

(define (left-outer box) (l/- (x box) (ml box)))
(define (left-border box) (x box))
(define (box-left box) (l/+ (x box) (bl box)))
(define (left-padding box) (l/+ (x box) (bl box)))
(define (left-content box) (l/+ (x box) (bl box) (pl box)))

(define (right-content box) (l/+ (x box) (bl box) (pl box) (w box)))
(define (right-padding box) (l/+ (x box) (bl box) (pl box) (w box) (pr box)))
(define (box-right box) (l/+ (x box) (bl box) (pl box) (w box) (pr box)))
(define (right-border box) (l/+ (x box) (bl box) (pl box) (w box) (pr box) (br box)))
(define (right-outer box) (l/+ (x box) (bl box) (pl box) (w box) (pr box) (br box) (mr box)))

(define (top-outer box) (l/- (y box) (mtn box) (mtp box)))
(define (top-border box) (y box))
(define (box-top box) (l/+ (y box) (bt box)))
(define (top-padding box) (l/+ (y box) (bt box)))
(define (top-content box) (l/+ (y box) (bt box) (pt box)))

(define (bottom-content box) (l/+ (y box) (bt box) (pt box) (h box)))
(define (bottom-padding box) (l/+ (y box) (bt box) (pt box) (h box) (pb box)))
(define (box-bottom box) (l/+ (y box) (bt box) (pt box) (h box) (pb box)))
(define (bottom-border box) (l/+ (y box) (bt box) (pt box) (h box) (pb box) (bb box)))
(define (bottom-outer box) (l/+ (y box) (bt box) (pt box) (h box) (pb box) (bb box) (mbp box) (mbn box)))

(define (box-width box)  (l/+ (bl box) (pl box) (w box) (pr box) (br box)))
(define (box-height box) (l/+ (bt box) (pt box) (h box) (pb box) (bb box)))

;; CSS Properties

(define css-property (hash))
(define-for-syntax property-info '())
(define-syntax (properties stx)
  (syntax-case stx
      [(_ name cs ... #:names [prop defaults] ...)
       (set! property-info (append property-info (map (curryr cons #'name) (map syntax->datum (syntax->list #'(prop ...))))))
       #'(begin
           (l/struct name cs ...)
           (for ([n (list 'prop ...)] [d (list defaults ...)])
             (hash-set! css-properties n (list name d))))]))

(define (property-type name)
  (first (hash-ref css-property name)))
(define (property-default name)
  (second (hash-ref css-property name)))

(properties
 Width (width:auto) (width:px (width.px 'Real))
 #:names
 [width (width:auto)])
(properties
 Height (height:auto) (height:px (height.px 'Real))
 #:names
 [height (height:auto)])
(properties
 Margin (margin:auto) (margin:px (margin.px 'Real))
 #:names
 [margin-left (margin:px 0)]
 [margin-right (margin:px 0)]
 [margin-top (margin:auto)]
 [margin-bottom (margin:auto)])
(properties
 Padding (padding:px (padding.px 'Real))
 #:names
 [padding-left (padding:px 0)]
 [padding-right (padding:px 0)]
 [padding-top (padding:px 0)]
 [padding-bottom (padding:px 0)])
(properties
 Border (border:px (border.px 'Real))
 #:names
 [border-left (border:px 0)]
 [border-right (border:px 0)]
 [border-top (border:px 0)]
 [border-bottom (border:px 0)])
(properties
 Float (float:none) (float:left) (float:right) (float:inherit)
 #:names
 [float (float:none)])
(properties
 Display (display:block) (display:inline)
 #:names
 [Display (display:inline)])

;; CSS Stylesheets

(l/struct Selector (sel:all) (sel:tag (sel.tag TagName)) (sel:id (sel.id Id)))

(define-syntax (generate-style stx)
  (define-values (props scores)
    (reap [prop score]
          (for ([(prop type) (in-pairs property-info)])
            (let* ([prop-name (symbol-append 'style prop #:join ".")]
                   [score-name (symbol-append prop-name "#" #:join "")])
              (prop `[,prop-name ,type])
              (score `[,score-name Real])))))
  (datum->syntax
   stx ; This is not the right way to do it... we're explicitly being unhygeinic. Oh well...
   `(l/struct Style (style ,@props ,@scores))))

(define-syntax (generate-style stx)
  (define-values (props exists)
    (reap [prop exist]
          (for ([(prop type) (in-pairs property-info)])
            (let* ([prop-name (symbol-append 'rule prop #:join ".")]
                   [exists-name (symbol-append prop-name "?" #:join "")])
              (prop `[,prop-name ,type])
              (exist `[,exists-name Bool])))))
  (datum->syntax
   stx ; This is not the right way to do it... we're explicitly being unhygeinic. Oh well...
   `(l/struct Rule (rule [rule.sel Selector] [rule.idx Real] ,@props ,@exists))))

(generate-style)
(generate-rule)

; Uses some internal hacking around
(define (property-score prop style)
  (cdr (assoc (string->symbol (format "style.~a#" prop)) (cdr style))))

(define (property-value prop style)
  (cdr (assoc (string->symbol (format "style.~a" prop)) (cdr style))))

(define (property-specified prop rule)
  (cdr (assoc (string->symbol (format "rule.~a" prop)) (cdr rule))))

(define (property-enabled? prop rule)
  (cdr (assoc (string->symbol (format "rule.~a?" prop)) (cdr rule))))

;; Elements

(l/struct Element
          (elt:nil)
          (elt (elt.name ElementName) (elt.doc DocumentName) (elt.tag TagName) (elt.id IdName)
               (elt.rules ComputedStyle) (elt.display Display) (elt.float Float)
               (elt.prev ElementName) (elt.up ElementName) (elt.first ElementName) (elt.last ElementName)
               (elt.flowbox Box) (elt.box Box)))
