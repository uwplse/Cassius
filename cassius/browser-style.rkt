#lang racket

(provide get-sheet)

; Significantly via http://css-class.com/test/css/defaults/UA-style-sheet-defaults.htm

(define firefox-sheet
  '(((tag blockquote)
     [margin-top (margin/px 16)]
     [margin-right (margin/px 40)]
     [margin-bottom (margin/px 16)]
     [margin-left (margin/px 40)])
    ((tag body)
     [margin-top (margin/px 8)]
     [margin-right (margin/px 8)]
     [margin-bottom (margin/px 8)]
     [margin-left (margin/px 8)])
    ((tag caption)
     [text-align text-align/center])
    ((tag center)
     [text-align text-align/center])
    ((tag dd)
     [margin-left (margin/px 40)])
    ; DIR
    ((tag dl)
     [margin-top (margin/px 16)]
     [margin-bottom (margin/px 16)])
    ; Fieldset
    ((tag figure)
     [margin-top (margin/px 16)]
     [margin-right (margin/px 40)]
     [margin-bottom (margin/px 16)]
     [margin-left (margin/px 40)])
    ; Form
    ((tag h1)
     [margin-top (margin/px (/ 643 30))]
     [margin-bottom (margin/px (/ 643 30))])
    ((tag h2)
     [margin-top (margin/px (/ 1195 60))]
     [margin-bottom (margin/px (/ 1195 60))])
    ((tag h3)
     [margin-top (margin/px (/ 1123 60))]
     [margin-bottom (margin/px (/ 1123 60))])
    ((tag h4)
     [margin-top (margin/px (/ 1277 60))]
     [margin-bottom (margin/px (/ 1277 60))])
    ((tag h5)
     [margin-top (margin/px (/ 1331 60))]
     [margin-bottom (margin/px (/ 1331 60))])
    ((tag h6)
     [margin-top (margin/px (/ 1498 60))]
     [margin-bottom (margin/px (/ 1498 60))])
    ((tag hr)
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
    ((tag p)
     [margin-top (margin/px 16)]
     [margin-bottom (margin/px 16)])))

(define (get-sheet browser)
  (match browser
    ['firefox firefox-sheet]
    [#f '()]
    ['user #f]))
