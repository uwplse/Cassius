#lang racket

(provide get-sheet)

; Significantly via http://css-class.com/test/css/defaults/UA-style-sheet-defaults.htm

(define firefox-sheet
  '(((tag blockquote)
     :browser
     [margin-top (px 16)]
     [margin-right (px 40)]
     [margin-bottom (px 16)]
     [margin-left (px 40)])
    ((tag body)
     :browser
     [margin-top (px 8)]
     [margin-right (px 8)]
     [margin-bottom (px 8)]
     [margin-left (px 8)])
    ((tag caption)
     :browser
     [text-align center])
    ((tag center)
     :browser
     [text-align center])
    ((tag dd)
     :browser
     [margin-left (px 40)])
    ((tag dl)
     :browser
     [margin-top (px 16)]
     [margin-bottom (px 16)])
    ((tag fieldset)
     :browser
     [margin-top (px 2)]
     [margin-right (px 0)]
     [margin-bottom (px 2)]
     [margin-left (px 0)])
    ((tag figure)
     :browser
     [margin-top (px 16)]
     [margin-right (px 40)]
     [margin-bottom (px 16)]
     [margin-left (px 40)])
    ((tag form)
     :browser
     [margin-top (px 0)]
     [margin-right (px 0)]
     [margin-bottom (px 0)]
     [margin-left (px 0)])
    ((tag h1)
     :browser
     [margin-top (px (/ 643 30))]
     [margin-bottom (px (/ 643 30))])
    ((tag h2)
     :browser
     [margin-top (px (/ 1195 60))]
     [margin-bottom (px (/ 1195 60))])
    ((tag h3)
     :browser
     [margin-top (px (/ 1123 60))]
     [margin-bottom (px (/ 1123 60))])
    ((tag h4)
     :browser
     [margin-top (px (/ 1277 60))]
     [margin-bottom (px (/ 1277 60))])
    ((tag h5)
     :browser
     [margin-top (px (/ 1331 60))]
     [margin-bottom (px (/ 1331 60))])
    ((tag h6)
     :browser
     [margin-top (px (/ 1498 60))]
     [margin-bottom (px (/ 1498 60))])
    ((tag hr)
     :browser
     [margin-left auto]
     [margin-right auto]
     [border-top-width (px 1)]
     [border-right-width (px 1)]
     [border-bottom-width (px 1)]
     [border-left-width (px 1)])
    ((tag menu)
     :browser
     [margin-left (px 0)]
     [margin-right (px 0)]
     [margin-top (px 16)]
     [margin-bottom (px 16)])
    ((tag ol)
     :browser
     [margin-left (px 0)]
     [margin-right (px 0)]
     [margin-top (px 16)]
     [margin-bottom (px 16)])
    ((tag p)
     :browser
     [margin-left (px 0)]
     [margin-right (px 0)]
     [margin-top (em 1)]
     [margin-bottom (em 1)])
    ((tag pre)
     :browser
     [margin-top (px 16)]
     [margin-bottom (px 16)]
     [margin-left (px 0)]
     [margin-right (px 0)])
    ((tag th)
     :browser
     [text-align center])
    ((tag ul)
     :browser
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
