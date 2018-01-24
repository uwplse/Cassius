#lang racket

(provide get-sheet)

(define default-displays
  #hash([inline
         . (abbr bdo small i font label em b input br img strong a span)]
        [block
         . (html body p hr section footer frameset header main ol ul
                 option textarea div h1 h2 h3 h4 h5 h6 pre iframe form)]
        [none
         . (head link meta noframes style script title)]
        [inline-block
         . (button select object)]))

(define baseline
  (append
   (for*/list ([(display-type tags) (in-hash default-displays)]
               [tag (in-list tags)])
     `((tag ,tag) (display ,display-type)))
   '(((tag li) (display list-item))
     ((tag table) (display table))
     ((tag tr) (display table-row))
     ((tag td) (display table-cell))
     ((tag th) (display table-cell))
     ((tag col) (display table-column))
     ((tag caption) (display table-caption))
     ((tag thead) (display table-header-group))
     ((tag tbody) (display table-row-group))
     ((tag tfoot) (display table-footer-group))
     ((tag colgroup) (display table-column-group)))))

; From https://hell.meiert.org/core/css/firefox-3.6.3.css
; and https://dxr.mozilla.org/mozilla-central/source/layout/style/res/html.css

(define firefox-sheet
  `(((tag blockquote)
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
     [font-weight bold]
     [margin-top (em .67)]
     [margin-bottom (em .67)])
    ((tag h2)
     :browser
     [font-size (em 1.5)]
     [font-weight bold]
     [margin-top (em .83)]
     [margin-bottom (em .83)])
    ((tag h3)
     :browser
     [font-size (em 1.17)]
     [font-weight bold]
     [margin-top (em 1)]
     [margin-bottom (em 1)])
    ((tag h4)
     :browser
     [font-weight bold]
     [margin-top (em 1.33)]
     [margin-bottom (em 1.33)])
    ((tag h5)
     :browser
     [font-size (em .83)]
     [font-weight bold]
     [margin-top (em 1.67)]
     [margin-bottom (em 1.67)])
    ((tag h6)
     :browser
     [font-size (em 0.67)]
     [font-weight bold]
     [margin-top (em 2.33)]
     [margin-bottom (em 2.33)])
    ((tag hr)
     :browser
     [margin-left auto]
     [margin-right auto]
     [box-sizing border-box] ; Weird Firefox choice!
     [border-top-width (px 1)]
     [border-top-style solid]
     [border-right-width (px 1)]
     [border-right-style solid]
     [border-bottom-width (px 1)]
     [border-bottom-style solid]
     [border-left-width (px 1)]
     [border-left-style solid])
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
     [margin-bottom (em 1)]
     [font-family "monospace"])
    ((tag th)
     :browser
     [text-align center]
     [font-weight bold])
    ((tag ul)
     :browser
     [margin-top (em 1)]
     [margin-bottom (em 1)]
     [padding-left (px 40)])
    ((tag em)
     :browser
     [font-style italic])
    ((tag i)
     :browser
     [font-style italic])
    ((tag b)
     :browser
     [font-weight bold])
    ((tag strong)
     :broswer
     [font-weight bold])
    ((tag input)
     :browser
     [font-family "-moz-field"]
     [font-size (px 13.3333)]
     [padding-left (px 1)]
     [padding-top (px 1)]
     [padding-right (px 1)]
     [padding-bottom (px 1)]
     [border-top-width (px 2)]
     [border-right-width (px 2)]
     [border-bottom-width (px 2)]
     [border-left-width (px 2)]
     [border-top-style inset]
     [border-right-style inset]
     [border-bottom-style inset]
     [border-left-style inset]
     [text-align start]
     [text-indent (px 0)])
    ((and (tag input) (type hidden))
     :browser
     [display none :important]
     [padding-top (px 0)]
     [padding-right (px 0)]
     [padding-bottom (px 0)]
     [padding-left (px 0)]
     [border-top-width (px 0)]
     [border-right-width (px 0)]
     [border-bottom-width (px 0)]
     [border-left-width (px 0)])
    ((and (tag input) (type image))
     :browser
     [padding-top (px 0)]
     [padding-right (px 0)]
     [padding-bottom (px 0)]
     [padding-left (px 0)]
     [border-top-style none]
     [border-right-style none]
     [border-bottom-style none]
     [border-left-style none]
     [font-size small])
    ((and (tag input) (type file))
     :browser
     [display inline-block]
     [padding-top (px 0)]
     [padding-right (px 0)]
     [padding-bottom (px 0)]
     [padding-left (px 0)]
     [border-top-style none]
     [border-right-style none]
     [border-bottom-style none]
     [border-left-style none]
     [overflow-x hidden]
     [overflow-y hidden])
    ((and (tag input) (type radio))
     :browser
     [margin-top (px 3)]
     [margin-right (px 5)]
     [margin-bottom (px 0)]
     [margin-left (px 3)]
     [box-sizing border-box]
     [width (px 13)]
     [height (px 13)]
     [padding-top (px 0) :important]
     [padding-right (px 0) :important]
     [padding-bottom (px 0) :important]
     [padding-left (px 0) :important]
     [border-top-width (px 2) :important]
     [border-right-width (px 2) :important]
     [border-bottom-width (px 2) :important]
     [border-left-width (px 2) :important]
     [border-top-style inset :important]
     [border-right-style inset :important]
     [border-bottom-style inset :important]
     [border-left-style inset :important])
    ((and (tag input) (type checkbox))
     :browser
     [margin-top (px 3)]
     [margin-right (px 3)]
     [margin-bottom (px 3)]
     [margin-left (px 4)]
     [box-sizing border-box]
     [width (px 13)]
     [height (px 13)]
     [padding-top (px 0) :important]
     [padding-right (px 0) :important]
     [padding-bottom (px 0) :important]
     [padding-left (px 0) :important]
     [border-top-width (px 2) :important]
     [border-right-width (px 2) :important]
     [border-bottom-width (px 2) :important]
     [border-left-width (px 2) :important]
     [border-top-style inset :important]
     [border-right-style inset :important]
     [border-bottom-style inset :important]
     [border-left-style inset :important])
    ((and (tag input) (type search))
     :browser
     [box-sizing border-box])
    ,@(for/list ([sel '((tag button)
                        (and (tag input) (type color))
                        (and (tag input) (type reset))
                        (and (tag input) (type button))
                        (and (tag input) (type submit)))])
        (cons sel
              '([padding-top (px 0)]
                [padding-right (px 6)]
                [padding-bottom (px 0)]
                [padding-left (px 6)]
                [border-top-width (px 2)]
                [border-right-width (px 2)]
                [border-bottom-width (px 2)]
                [border-left-width (px 2)]
                [border-top-style outset]
                [border-right-style outset]
                [border-bottom-style outset]
                [border-left-style outset]
                [box-sizing border-box])))
    ,@(for/list ([sel '((tag button) ; no color
                        (and (tag input) (type reset))
                        (and (tag input) (type button))
                        (and (tag input) (type submit)))])
        (cons sel '([text-align center])))
    ((and (tag input) (type color))
     [width (px 64)]
     [height (px 23)])
    ((tag select)
     :browser
     [font-family "-moz-field"])
    ((tag button)
     :browser
     [text-align center]
     [text-indent (px 0)]
     [display inline-block]
     [font-family "-moz-field"])
    ((and (tag input) (type reset))
     :browser
     [text-align center])
    ((and (tag input) (type button))
     :browser
     [text-align center])
    ((and (tag input) (type submit))
     :browser
     [text-align center])
    ((and (tag input) (type range))
     :browser
     [display inline-block]
     [width (em 12)]
     [height (em 1.3)]
     [margin-left (em .7)]
     [margin-right (em .7)]
     [margin-top (px 0)]
     [margin-bottom (px 0)]
     [border-top-style none]
     [border-right-style none]
     [border-bottom-style none]
     [border-left-style none])
    ((tag textarea)
     [margin-top (px 1)]
     [margin-bottom (px 1)]
     [border-top-width (px 1)]
     [border-top-style inset]
     [border-right-width (px 1)]
     [border-right-style inset]
     [border-bottom-width (px 1)]
     [border-bottom-style inset]
     [border-left-width (px 1)]
     [border-left-style inset]
     [padding-left (px 1)]
     [padding-right (px 1)]
     [font-size medium]
     [font-family "monospace"]
     [text-align start]
     [color black]
     [background-color white]
     #;[vertical-align text-bottom]
     [text-indent 0]
     #;[white-space pre-wrap])
    ((tag select)
     [margin-top (px 0)]
     [margin-right (px 0)]
     [margin-bottom (px 0)]
     [margin-left (px 0)]
     [line-height normal :important]
     [text-align start]
     [box-sizing border-box]
     [border-top-width (px 2)]
     [border-top-style inset]
     [border-right-width (px 2)]
     [border-right-style inset]
     [border-bottom-width (px 2)]
     [border-bottom-style inset]
     [border-left-width (px 2)]
     [border-left-style inset]
     [text-indent (px 0)])))

(define (get-sheet browser)
  (match browser
    ['firefox (append baseline firefox-sheet)]
    [#f baseline]
    ['user #f]))
