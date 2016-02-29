#lang racket

(provide get-sheet)

; Significantly via http://css-class.com/test/css/defaults/UA-style-sheet-defaults.htm

(define firefox-sheet
  '(((tag blockquote)
     [margin-top (px 16)]
     [margin-right (px 40)]
     [margin-bottom (px 16)]
     [margin-left (px 40)])
    ((tag body)
     [margin-top (px 8)]
     [margin-right (px 8)]
     [margin-bottom (px 8)]
     [margin-left (px 8)])
    ((tag caption)
     [text-align center])
    ((tag center)
     [text-align center])
    ((tag dd)
     [margin-left (px 40)])
    ((tag dl)
     [margin-top (px 16)]
     [margin-bottom (px 16)])
    ((tag fieldset)
     [margin-top (px 2)]
     [margin-right (px 0)]
     [margin-bottom (px 2)]
     [margin-left (px 0)])
    ((tag figure)
     [margin-top (px 16)]
     [margin-right (px 40)]
     [margin-bottom (px 16)]
     [margin-left (px 40)])
    ((tag form)
     [margin-top (px 0)]
     [margin-right (px 0)]
     [margin-bottom (px 0)]
     [margin-left (px 0)])
    ((tag h1)
     [margin-top (px (/ 643 30))]
     [margin-bottom (px (/ 643 30))])
    ((tag h2)
     [margin-top (px (/ 1195 60))]
     [margin-bottom (px (/ 1195 60))])
    ((tag h3)
     [margin-top (px (/ 1123 60))]
     [margin-bottom (px (/ 1123 60))])
    ((tag h4)
     [margin-top (px (/ 1277 60))]
     [margin-bottom (px (/ 1277 60))])
    ((tag h5)
     [margin-top (px (/ 1331 60))]
     [margin-bottom (px (/ 1331 60))])
    ((tag h6)
     [margin-top (px (/ 1498 60))]
     [margin-bottom (px (/ 1498 60))])
    ((tag hr)
     [margin-left auto]
     [margin-right auto]
     [border-top (px 1)]
     [border-right (px 1)]
     [border-bottom (px 1)]
     [border-left (px 1)])
    ((tag menu)
     [margin-left (px 0)]
     [margin-right (px 0)]
     [margin-top (px 16)]
     [margin-bottom (px 16)])
    ((tag ol)
     [margin-left (px 0)]
     [margin-right (px 0)]
     [margin-top (px 16)]
     [margin-bottom (px 16)])
    ((tag p)
     [margin-left (px 0)]
     [margin-right (px 0)]
     [margin-top (px 16)]
     [margin-bottom (px 16)])
    ((tag pre)
     [white-space pre]
     [margin-top (px 16)]
     [margin-bottom (px 16)]
     [margin-left (px 0)]
     [margin-right (px 0)])
    ((tag th)
     [text-align center])
    ((tag ul)
     [margin-left (px 0)]
     [margin-right (px 0)]
     [margin-top (px 16)]
     [margin-bottom (px 16)])
    ))

(define (get-sheet browser)
  (match browser
    ['firefox firefox-sheet]
    [#f '()]
    ['user #f]))
