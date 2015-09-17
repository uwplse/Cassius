#lang racket

(provide get-sheet)

; Significantly via http://css-class.com/test/css/defaults/UA-style-sheet-defaults.htm

(define firefox-sheet
  '(((sel/tag tag/blockquote)
     [margin-top (margin/px 16)]
     [margin-right (margin/px 40)]
     [margin-bottom (margin/px 16)]
     [margin-left (margin/px 40)])
    ((sel/tag tag/body)
     [margin-top (margin/px 8)]
     [margin-right (margin/px 8)]
     [margin-bottom (margin/px 8)]
     [margin-left (margin/px 8)])
    ((sel/tag tag/caption)
     [text-align text/center])
    ((sel/tag tag/center)
     [text-align text/center])
    ((sel/tag tag/dd)
     [margin-left (margin/px 40)])
    ; DIR
    ((sel/tag tag/dl)
     [margin-top (margin/px 16)]
     [margin-bottom (margin/px 16)])
    ; Fieldset
    ((sel/tag tag/figure)
     [margin-top (margin/px 16)]
     [margin-right (margin/px 40)]
     [margin-bottom (margin/px 16)]
     [margin-left (margin/px 40)])
    ; Form
    ((sel/tag tag/h1)
     [margin-top (margin/px (/ 643 30))]
     [margin-bottom (margin/px (/ 643 30))])
    ((sel/tag tag/h2)
     [margin-top (margin/px (/ 1195 60))]
     [margin-bottom (margin/px (/ 1195 60))])
    ((sel/tag tag/h3)
     [margin-top (margin/px (/ 1123 60))]
     [margin-bottom (margin/px (/ 1123 60))])
    ((sel/tag tag/h4)
     [margin-top (margin/px (/ 1277 60))]
     [margin-bottom (margin/px (/ 1277 60))])
    ((sel/tag tag/h5)
     [margin-top (margin/px (/ 1331 60))]
     [margin-bottom (margin/px (/ 1331 60))])
    ((sel/tag tag/h6)
     [margin-top (margin/px (/ 1498 60))]
     [margin-bottom (margin/px (/ 1498 60))])
    ((sel/tag tag/hr)
     [margin-left margin/auto]
     [margin-right margin/auto]
     [border-top (border/px 1)]
     [border-right (border/px 1)]
     [border-bottom (border/px 1)]
     [border-left (border/px 1)])
    ; Menu
    ; OL
    ; TH
    ; UL
    ((sel/tag tag/p)
     [margin-top (margin/px 16)]
     [margin-bottom (margin/px 16)])))

(define (get-sheet browser)
  (match browser
    ['firefox firefox-sheet]
    [#f '()]))
