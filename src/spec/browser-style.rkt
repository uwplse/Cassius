#lang racket

(provide get-sheet)

; From https://hell.meiert.org/core/css/firefox-3.6.3.css

(define firefox-sheet
  '(((tag blockquote)
     :browser
     [margin-top (em 1)]
     [margin-right (px 40)]
     [margin-bottom (em 1)]
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
     [margin-top (em 1)]
     [margin-bottom (em 1)])
    ((tag figure)
     :browser
     [margin-top (em 1)]
     [margin-right (px 40)]
     [margin-bottom (em 1)]
     [margin-left (px 40)])
    ((tag h1)
     :browser
     [font-size (em 2)]
     [margin-top (em .67)]
     [margin-bottom (em .67)])
    ((tag h2)
     :browser
     [font-size (em 1.5)]
     [margin-top (em .83)]
     [margin-bottom (em .83)])
    ((tag h3)
     :browser
     [font-size (em 1.17)]
     [margin-top (em 1)]
     [margin-bottom (em 1)])
    ((tag h4)
     :browser
     [margin-top (em 1.33)]
     [margin-bottom (em 1.33)])
    ((tag h5)
     :browser
     [font-size (em .83)]
     [margin-top (em 1.67)]
     [margin-bottom (em 1.67)])
    ((tag h6)
     :browser
     [font-size (em 0.67)]
     [margin-top (em 2.33)]
     [margin-bottom (em 2.33)])
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
     [margin-top (em 1)]
     [margin-bottom (em 1)])
    ((tag ol)
     :browser
     [margin-top (em 1)]
     [margin-bottom (em 1)])
    ((tag p)
     :browser
     [margin-top (em 1)]
     [margin-bottom (em 1)])
    ((tag pre)
     :browser
     [margin-top (em 1)]
     [margin-bottom (em 1)])
    ((tag th)
     :browser
     [text-align center])
    ((tag ul)
     :browser
     [margin-top (em 1)]
     [margin-bottom (em 1)])))

(define (get-sheet browser)
  (match browser
    ['firefox firefox-sheet]
    [#f '()]
    ['user #f]))
