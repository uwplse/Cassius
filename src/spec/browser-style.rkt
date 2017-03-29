#lang racket

(provide get-sheet)

(define baseline
  '(((tag abbr) (display inline))
    ((tag bdo) (display inline))
    ((tag small) (display inline))
    ((tag i) (display inline))
    ((tag font) (display inline))
    ((tag label) (display inline))
    ((tag em) (display inline))
    ((tag b) (display inline))
    ((tag input) (display inline))
    ((tag br) (display inline))
    ((tag img) (display inline))
    ((tag strong) (display inline))
    ((tag a) (display inline))
    ((tag span) (display inline))

    ((tag html) (display block))
    ((tag body) (display block))
    ((tag p) (display block))
    ((tag hr) (display block))
    ((tag section) (display block))
    ((tag footer) (display block))
    ((tag frameset) (display block))
    ((tag header) (display block))
    ((tag main) (display block))
    ((tag ol) (display block))
    ((tag ul) (display block))
    ((tag option) (display block))
    ((tag textarea) (display block))
    ((tag div) (display block))
    ((tag h1) (display block))
    ((tag h2) (display block))
    ((tag h3) (display block))
    ((tag h4) (display block))
    ((tag h5) (display block))
    ((tag pre) (display block))
    ((tag iframe) (display block))
    ((tag form) (display block))

    ((tag button) (display inline-block))
    ((tag select) (display inline-block))
    ((tag object) (display inline-block))

    ((tag head) (display none))
    ((tag link) (display none))
    ((tag meta) (display none))
    ((tag noframes) (display none))
    ((tag style) (display none))
    ((tag script) (display none))
    ((tag title) (display none))

    ((tag li) (display list-item))

    ((tag table) (display table))
    ((tag tr) (display table-row))
    ((tag td) (display table-cell))
    ((tag th) (display table-cell))
    ((tag col) (display table-column))
    ((tag caption) (display table-caption))
    ((tag thead) (display table-header-group))
    ((tag tbody) (display table-row-group))
    ((tag tfoot) (display table-footer-group))
    ((tag colgroup) (display table-column-group))))

; From https://hell.meiert.org/core/css/firefox-3.6.3.css

(define firefox-sheet
  '(

    ((tag blockquote)
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
     [margin-bottom (em 1)]
     [padding-left (px 40)])
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
     [margin-bottom (em 1)]
     [padding-left (px 40)])))

(define (get-sheet browser)
  (match browser
    ['firefox (append baseline firefox-sheet)]
    [#f baseline]
    ['user #f]))
