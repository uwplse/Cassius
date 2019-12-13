;; From file:///tmp/amazon.html

(define-stylesheet doc-1
  (*
   [box-sizing border-box])
  ((tag body)
   [min-height (% 100)])
  ((tag article)
   [display block])
  ((tag aside)
   [display block])
  ((tag details)
   [display block])
  ((tag figcaption)
   [display block])
  ((tag figure)
   [display block])
  ((tag footer)
   [display block])
  ((tag header)
   [display block])
  ((tag hgroup)
   [display block])
  ((tag nav)
   [display block])
  ((tag section)
   [display block])
  ((tag html)
   [font-size (% 100)])
  ((tag img)
   [max-width (% 100)]
   #;[border-top-color currentcolor]
   [border-top-style none]
   [border-top-width (px 0)]
   #;[border-left-color currentcolor]
   [border-left-style none]
   [border-left-width (px 0)]
   #;[border-bottom-color currentcolor]
   [border-bottom-style none]
   [border-bottom-width (px 0)]
   #;[border-right-color currentcolor]
   [border-right-style none]
   [border-right-width (px 0)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1])
  ((tag button)
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [font-size (% 100)]
   [vertical-align middle])
  ((tag input)
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [font-size (% 100)]
   [vertical-align middle])
  ((tag select)
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [font-size (% 100)]
   [vertical-align middle])
  ((tag textarea)
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [font-size (% 100)]
   [vertical-align middle])
  ((tag button)
   [line-height normal])
  ((tag input)
   [line-height normal])
  ((tag body)
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [background-color (rgb 255 255 255)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((class a-box)
   [display block]
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 4)]
   #;[border-top-color (rgb 221 221 221)]
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-left-color (rgb 221 221 221)]
   [border-left-style solid]
   [border-left-width (px 1)]
   #;[border-bottom-color (rgb 221 221 221)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   #;[border-right-color (rgb 221 221 221)]
   [border-right-style solid]
   [border-right-width (px 1)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   [background-color (rgb 255 255 255)])
  ((desc (class a-box) (class a-box-inner))
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 4)]
   [position relative]
   [padding-top (px 14)]
   [padding-right (px 18)]
   [padding-bottom (px 14)]
   [padding-left (px 18)])
  ((desc (class a-text-center) (class a-box))
   [margin-left auto]
   [margin-right auto])
  ((desc (class a-text-center) (class a-box-group))
   [margin-left auto]
   [margin-right auto])
  ((class a-color-base)
   [color (rgb 17 17 17) :important])
  ((class a-color-tertiary)
   [color (rgb 118 118 118) :important])
  ((class a-row)
   [width (% 100)])
  ((desc (class a-ws) (and (tag div) (class a-column)))
   [margin-right (% 2)]
   [float left]
   [min-height (px 1)]
   [overflow-x visible]
   [overflow-y visible])
  ((and (tag div) (class a-column))
   [margin-right (% 2)]
   [float left]
   [min-height (px 1)]
   [overflow-x visible]
   [overflow-y visible])
  ((desc (class a-row) (class a-span6))
   [width (% 48.948)])
  ((desc (class a-ws) (class a-row) (class a-ws-span6))
   [width (% 48.948)])
  ((desc (class a-row) (class a-span12))
   [width (% 99.948)])
  ((desc (class a-ws) (class a-row) (class a-ws-span12))
   [width (% 99.948)])
  ((and (class a-column) (class a-span-last))
   [margin-right (px 0)]
   [float right])
  ((desc (class a-row) (class a-span12))
   [width (% 100)]
   [margin-right (px 0)])
  ((class a-span12)
   [width (% 100)]
   [margin-right (px 0)])
  ((desc (class a-ws) (class a-row) (class a-ws-span12))
   [width (% 100)]
   [margin-right (px 0)])
  ((desc (class a-ws) (class a-ws-span12))
   [width (% 100)]
   [margin-right (px 0)])
  ((desc (class a-ws) (class a-ws-span12))
   [margin-right (px 0)]
   [float right])
  ((and (tag div) (class a-column) (class a-span-last))
   [margin-right (px 0)]
   [float right])
  ((class a-fixed-left-grid-inner)
   [position relative]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((class a-fixed-right-grid-inner)
   [position relative]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((class a-fixed-left-grid-col)
   [position relative]
   [overflow-x visible]
   [overflow-y visible]
   [min-height (px 1)])
  ((class a-fixed-right-grid-col)
   [position relative]
   [overflow-x visible]
   [overflow-y visible]
   [min-height (px 1)])
  ((class a-fixed-right-grid)
   [position relative])
  ((desc (class a-fixed-right-grid) (class a-col-left))
   [width (% 100)]
   [padding-right (% 3.5)])
  ((class a-spacing-none)
   [margin-bottom (px 0) :important])
  ((desc (class a-ws) (class a-ws-spacing-none))
   [margin-bottom (px 0) :important])
  ((class a-spacing-mini)
   [margin-bottom (px 6) :important])
  ((desc (class a-ws) (class a-ws-spacing-mini))
   [margin-bottom (px 6) :important])
  ((class a-spacing-small)
   [margin-bottom (px 10) :important])
  ((desc (class a-ws) (class a-ws-spacing-small))
   [margin-bottom (px 10) :important])
  ((class a-spacing-medium)
   [margin-bottom (px 18) :important])
  ((desc (class a-ws) (class a-ws-spacing-medium))
   [margin-bottom (px 18) :important])
  ((class a-padding-base)
   [padding-top (px 10) :important]
   [padding-right (px 14) :important]
   [padding-bottom (px 10) :important]
   [padding-left (px 14) :important])
  ((class a-text-left)
   [text-align left :important])
  ((class a-text-center)
   [text-align center :important])
  ((class a-text-right)
   [text-align right :important])
  ((class a-section)
   [margin-bottom (px 22)])
  ((and (class a-section) (pseudo-class last-child))
   [margin-bottom (px 0)])
  ((class a-icon)
   #;[background-image url("https://m.media-amazon.com/images/G/01/AUIClients/AmazonUIBaseCSS-sprite_1x-7233320d393c05a5508cf7d579641c4b327cbda4._V2_.png")]
   #;[background-size 400px 900px]
   #;[background-repeat no-repeat]
   [display inline-block]
   [vertical-align top])
  ((fake " .a-link-emphasis::after")
   #;[background-image url("https://m.media-amazon.com/images/G/01/AUIClients/AmazonUIBaseCSS-sprite_1x-7233320d393c05a5508cf7d579641c4b327cbda4._V2_.png")]
   #;[background-size 400px 900px]
   #;[background-repeat no-repeat]
   [display inline-block]
   [vertical-align top])
  ((class a-icon-star)
   [position relative]
   [vertical-align text-top])
  ((class a-icon-star-medium)
   [position relative]
   [vertical-align text-top])
  ((class a-icon-star-mini)
   [position relative]
   [vertical-align text-top])
  ((class a-icon-star-small)
   [position relative]
   [vertical-align text-top])
  ((class a-icon-star-medium)
   [width (px 95)]
   [height (px 21)]
   [margin-right (px 1)]
   [top (px -2)])
  ((class a-icon-checkmark-inverse)
   [width (px 15)]
   [height (px 17)]
   #;[background-position-x (px -172)]
   #;[background-position-y (px -82)]
   #;[opacity 0.6]
   [margin-right (em 0.6)]
   [vertical-align baseline])
  ((desc (class a-alert-inline-error) (class a-icon-alert))
   [width (px 5)]
   #;[background-position-x (px -141)]
   #;[background-position-y (px -130)])
  ((and (class a-icon-error) (class a-icon-small))
   [width (px 5)]
   #;[background-position-x (px -141)]
   #;[background-position-y (px -130)])
  ((class a-icon-alt)
   [position absolute]
   [left (px -9999)]
   [top auto]
   [display block]
   [width (px 1)]
   [height (px 1)]
   [line-height (px 1)]
   [font-size (px 1)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((fake "[class*=\"a-icon-star\"] > .a-icon-alt" (id edoc-10001))
   [left auto]
   [width (% 100)]
   [height (% 100)]
   [font-size inherit]
   [line-height normal]
   #;[opacity 0])
  ((tag body)
   [font-size (px 13)]
   [line-height (px 19)]
   [color (rgb 17 17 17)]
   [font-family "Arial, sans-serif"])
  ((tag button)
   [font-family inherit])
  ((tag input)
   [font-family inherit])
  ((tag select)
   [font-family inherit])
  ((tag textarea)
   [font-family inherit])
  ((tag h1)
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((tag h2)
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((tag h3)
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((tag h4)
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((tag h5)
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((tag h6)
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((tag h1)
   [padding-bottom (px 4)])
  ((tag h2)
   [padding-bottom (px 4)])
  ((tag h3)
   [padding-bottom (px 4)])
  ((tag h4)
   [padding-bottom (px 4)])
  ((and (tag h1) (pseudo-class last-child))
   [padding-bottom (px 0)])
  ((and (tag h2) (pseudo-class last-child))
   [padding-bottom (px 0)])
  ((and (tag h3) (pseudo-class last-child))
   [padding-bottom (px 0)])
  ((and (tag h4) (pseudo-class last-child))
   [padding-bottom (px 0)])
  ((tag h1)
   [padding-bottom (px 4)])
  ((tag h2)
   [padding-bottom (px 4)])
  ((tag h2)
   [font-weight 700]
   [font-size (px 21)]
   [line-height 1.3])
  ((tag h5)
   [font-weight 700]
   [font-size (px 13)]
   [line-height (px 19)])
  ((tag p)
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 14)]
   [margin-left (px 0)])
  ((and (tag p) (pseudo-class last-child))
   [margin-bottom (px 0)])
  ((fake "p + p" (id edoc-10002) (id edoc-10003) (id edoc-10004) (id edoc-10005) (id edoc-10006) (id edoc-10007) (id edoc-10008) (id edoc-10009) (id edoc-10010) (id edoc-10011) (id edoc-10012) (id edoc-10013))
   [margin-top (px -4)])
  ((tag b)
   [font-weight 700])
  ((tag strong)
   [font-weight 700])
  ((tag em)
   [font-style italic])
  ((tag i)
   [font-style italic])
  ((class a-size-mini)
   [font-size (px 11) :important]
   [line-height 1.465 :important])
  ((class a-size-small)
   [font-size (px 12) :important]
   [line-height 1.5 :important])
  ((class a-size-base)
   [font-size (px 13) :important]
   [line-height (px 19) :important])
  ((class a-size-medium)
   [font-size (px 17) :important]
   [line-height 1.255 :important])
  ((class a-size-large)
   [font-size (px 21) :important]
   [line-height 1.3 :important])
  ((class a-text-normal)
   [font-weight 400 :important]
   [font-style normal :important]
   #;[text-transform none]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor])
  ((class a-text-bold)
   [font-weight 700 :important])
  ((tag hr)
   [background-color transparent]
   [display block]
   [height (px 1)]
   [border-left-width (px 0)]
   [border-bottom-width (px 0)]
   [border-right-width (px 0)]
   #;[border-top-color (rgb 231 231 231)]
   [border-top-style solid]
   [border-top-width (px 1)]
   [line-height (px 19)]
   [margin-top (px 0)]
   [margin-bottom (px 14)])
  ((desc (class a-alert-inline) (class a-icon-alert))
   [height (px 13)]
   [width (px 14)]
   [position absolute]
   [left (px 2)]
   [top (px 2)])
  ((class a-alert-inline)
   [display inline-block]
   #;[border-top-color currentcolor]
   [border-top-style none]
   [border-top-width medium]
   #;[border-left-color currentcolor]
   [border-left-style none]
   [border-left-width medium]
   #;[border-bottom-color currentcolor]
   [border-bottom-style none]
   [border-bottom-width medium]
   #;[border-right-color currentcolor]
   [border-right-style none]
   [border-right-width medium]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   [vertical-align middle]
   [background-color transparent])
  ((desc (class a-alert-inline) (class a-alert-container))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (class a-alert-inline) (class a-alert-container) (class a-alert-content))
   [margin-bottom (px 0)]
   [text-align left]
   [font-size (px 12)]
   [line-height (px 15)])
  ((desc (class a-alert-inline-error) (class a-alert-container))
   [padding-left (px 16)]
   [color (rgb 196 0 0)])
  ((class a-button)
   [background-color (rgb 231 233 236)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[border-top-color (rgb 173 177 184)]
   #;[border-right-color (rgb 162 166 172)]
   #;[border-bottom-color (rgb 141 144 150)]
   #;[border-left-color (rgb 162 166 172)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 1)]
   [border-left-width (px 1)]
   [border-bottom-width (px 1)]
   [border-right-width (px 1)]
   #;[cursor pointer]
   [display inline-block]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [text-align center]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [vertical-align middle])
  ((desc (class a-button) (class a-button-inner))
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [background-color transparent]
   #;[background-image linear-gradient(rgb(247, 248, 250), rgb(231, 233, 236))])
  ((desc (class a-button) (class a-button-text))
   [color (rgb 17 17 17)])
  ((class a-button-text)
   [background-color transparent]
   #;[border-top-color currentcolor]
   [border-top-style none]
   [border-top-width (px 0)]
   #;[border-left-color currentcolor]
   [border-left-style none]
   [border-left-width (px 0)]
   #;[border-bottom-color currentcolor]
   [border-bottom-style none]
   [border-bottom-width (px 0)]
   #;[border-right-color currentcolor]
   [border-right-style none]
   [border-right-width (px 0)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   [display block]
   [font-size (px 13)]
   [line-height (px 29)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 11)]
   [text-align center]
   #;[white-space nowrap])
  ((and (tag a) (class a-button-text))
   [width (% 100)]
   [height (% 100)])
  ((and (tag button) (class a-button-text))
   [width (% 100)]
   [height (% 100)])
  ((class a-button-inner)
   [display block]
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden]
   [height (px 29)]
   #;[box-shadow rgba(255, 255, 255, 0.6) 0px 1px 0px inset]
   #;[border-top-left-radius (px 2)]
   #;[border-top-right-radius (px 2)]
   #;[border-bottom-right-radius (px 2)]
   #;[border-bottom-left-radius (px 2)])
  ((class a-button-input)
   [position absolute]
   [background-color transparent]
   [color transparent]
   #;[border-top-color currentcolor]
   [border-top-style none]
   [border-top-width (px 0)]
   #;[border-left-color currentcolor]
   [border-left-style none]
   [border-left-width (px 0)]
   #;[border-bottom-color currentcolor]
   [border-bottom-style none]
   [border-bottom-width (px 0)]
   #;[border-right-color currentcolor]
   [border-right-style none]
   [border-right-width (px 0)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   #;[cursor pointer]
   [height (% 100)]
   [width (% 100)]
   [left (px 0)]
   [top (px 0)]
   #;[opacity 0.01]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor]
   [overflow-x visible]
   [overflow-y visible]
   #;[z-index 20])
  ((desc (class a-button) (tag a))
   [color (rgb 17 17 17)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor])
  ((desc (and (class a-button) (pseudo-class hover)) (tag a))
   [color (rgb 17 17 17)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor])
  ((class a-button-disabled)
   [background-color (rgb 247 248 250)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   #;[background-image none]
   #;[border-top-color (rgb 224 224 224)]
   #;[border-right-color (rgb 224 224 224)]
   #;[border-bottom-color (rgb 224 224 224)]
   #;[border-left-color (rgb 224 224 224)]
   #;[cursor default])
  ((desc (class a-button-disabled) (class a-button-text))
   [color (rgb 153 153 153) :important]
   #;[cursor default]
   [font-weight 400]
   #;[text-shadow none])
  ((desc (class a-button-disabled) (class a-button-inner))
   #;[background-image none]
   [background-color (rgb 247 248 250) :important]
   #;[box-shadow none])
  ((desc (class a-button-disabled) (class a-button-input))
   [display none])
  ((class a-button-primary)
   [background-color (rgb 240 193 75)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   #;[border-top-color (rgb 168 135 52)]
   #;[border-right-color (rgb 156 126 49)]
   #;[border-bottom-color (rgb 132 106 41)]
   #;[border-left-color (rgb 156 126 49)]
   [color (rgb 17 17 17)])
  ((desc (class a-button-primary) (class a-button-inner))
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [background-color transparent]
   #;[background-image linear-gradient(rgb(247, 223, 165), rgb(240, 193, 75))])
  ((and (class a-button-primary) (class a-button-disabled))
   [background-color (rgb 249 243 229) :important]
   #;[border-top-color (rgb 232 224 205)]
   #;[border-right-color (rgb 232 224 205)]
   #;[border-bottom-color (rgb 232 224 205)]
   #;[border-left-color (rgb 232 224 205)])
  ((desc (and (class a-button-primary) (class a-button-disabled)) (class a-button-inner))
   [background-color (rgb 249 243 229) :important])
  ((desc (class a-button-primary) (class a-button-text))
   [color (rgb 17 17 17)])
  ((tag img)
   [vertical-align top])
  ((tag a)
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [color (rgb 0 102 192)])
  ((fake " a:active")
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [color (rgb 0 102 192)])
  ((fake " a:link" (id edoc-10014) (id edoc-10015) (id edoc-10016) (id edoc-10017) (id edoc-10018) (id edoc-10019) (id edoc-10020) (id edoc-10021) (id edoc-10022) (id edoc-10023) (id edoc-10024) (id edoc-10025) (id edoc-10026) (id edoc-10027) (id edoc-10028) (id edoc-10029) (id edoc-10030) (id nav_prefetch_yourorders) (id edoc-10031) (id edoc-10032) (id edoc-10033) (id edoc-10034) (id edoc-10035) (id edoc-10036) (id edoc-10037) (id edoc-10038) (id edoc-10039) (id edoc-10040) (id edoc-10041) (id edoc-10042) (id edoc-10043) (id edoc-10044) (id edoc-10045) (id edoc-10046) (id edoc-10047) (id edoc-10048) (id edoc-10049) (id edoc-10050) (id nav-item-switch-account) (id nav-item-signout-sa) (id edoc-10051) (id edoc-10052) (id edoc-10053) (id edoc-10054) (id edoc-10055) (id edoc-10056) (id edoc-10057) (id edoc-10058) (id edoc-10059) (id edoc-10060) (id edoc-10061) (id edoc-10062) (id edoc-10063) (id edoc-10064) (id edoc-10065) (id edoc-10066) (id edoc-10067) (id edoc-10068) (id edoc-10069) (id edoc-10070) (id edoc-10071) (id edoc-10072) (id edoc-10073) (id edoc-10074) (id edoc-10075) (id edoc-10076) (id edoc-10077) (id edoc-10078) (id edoc-10079) (id edoc-10080) (id edoc-10081) (id edoc-10082) (id edoc-10083) (id edoc-10084) (id edoc-10085) (id edoc-10086) (id edoc-10087) (id edoc-10088) (id edoc-10089) (id edoc-10090) (id edoc-10091) (id edoc-10092) (id edoc-10093) (id edoc-10094) (id edoc-10095) (id edoc-10096) (id edoc-10097) (id edoc-10098) (id edoc-10099) (id edoc-10100) (id edoc-10101) (id edoc-10102) (id edoc-10103) (id edoc-10104) (id edoc-10105) (id edoc-10106) (id edoc-10107) (id edoc-10108) (id edoc-10109) (id edoc-10110) (id edoc-10111) (id edoc-10112) (id edoc-10113) (id edoc-10114) (id edoc-10115) (id edoc-10116) (id edoc-10117) (id edoc-10118) (id edoc-10119) (id edoc-10120) (id edoc-10121) (id edoc-10122) (id edoc-10123) (id edoc-10124) (id edoc-10125) (id edoc-10126) (id edoc-10127) (id edoc-10128) (id edoc-10129) (id edoc-10130) (id edoc-10131) (id edoc-10132) (id edoc-10133) (id edoc-10134) (id edoc-10135) (id edoc-10136) (id edoc-10137) (id edoc-10138) (id edoc-10139) (id edoc-10140) (id edoc-10141) (id edoc-10142) (id edoc-10143) (id edoc-10144) (id edoc-10145) (id edoc-10146) (id edoc-10147) (id edoc-10148) (id edoc-10149) (id edoc-10150) (id edoc-10151) (id edoc-10152) (id edoc-10153) (id edoc-10154) (id edoc-10155) (id edoc-10156) (id edoc-10157) (id edoc-10158) (id edoc-10159) (id edoc-10160) (id edoc-10161) (id edoc-10162) (id edoc-10163) (id edoc-10164) (id edoc-10165) (id edoc-10166) (id edoc-10167) (id edoc-10168) (id edoc-10169) (id edoc-10170) (id edoc-10171) (id edoc-10172) (id edoc-10173) (id edoc-10174) (id edoc-10175) (id edoc-10176) (id edoc-10177) (id edoc-10178) (id edoc-10179) (id edoc-10180) (id edoc-10181) (id edoc-10182) (id edoc-10183) (id edoc-10184) (id edoc-10185) (id edoc-10186) (id edoc-10187) (id edoc-10188) (id edoc-10189) (id edoc-10190) (id edoc-10191) (id edoc-10192) (id edoc-10193) (id edoc-10194) (id edoc-10195) (id edoc-10196) (id edoc-10197) (id edoc-10198) (id edoc-10199) (id edoc-10200) (id edoc-10201) (id edoc-10202) (id edoc-10203) (id edoc-10204) (id edoc-10205) (id edoc-10206) (id edoc-10207) (id edoc-10208) (id edoc-10209) (id edoc-10210) (id edoc-10211) (id edoc-10212) (id edoc-10213) (id edoc-10214) (id edoc-10215) (id edoc-10216) (id edoc-10217) (id edoc-10218) (id edoc-10219) (id edoc-10220) (id edoc-10221) (id edoc-10222) (id edoc-10223) (id edoc-10224) (id edoc-10225) (id edoc-10226) (id edoc-10227) (id edoc-10228) (id edoc-10229) (id edoc-10230) (id edoc-10231) (id edoc-10232) (id edoc-10233) (id edoc-10234) (id edoc-10235) (id edoc-10236) (id edoc-10237) (id edoc-10238) (id edoc-10239) (id edoc-10240) (id edoc-10241) (id edoc-10242) (id edoc-10243) (id edoc-10244) (id edoc-10245) (id edoc-10246) (id edoc-10247) (id edoc-10248) (id edoc-10249) (id edoc-10250) (id edoc-10251) (id edoc-10252) (id edoc-10253) (id edoc-10254) (id edoc-10255) (id edoc-10256) (id edoc-10257) (id edoc-10258) (id edoc-10259) (id edoc-10260) (id edoc-10261) (id edoc-10262) (id edoc-10263) (id edoc-10264) (id edoc-10265) (id edoc-10266) (id edoc-10267) (id edoc-10268) (id edoc-10269) (id edoc-10270) (id edoc-10271) (id edoc-10272) (id edoc-10273) (id edoc-10274) (id edoc-10275) (id edoc-10276) (id edoc-10277) (id edoc-10278) (id edoc-10279) (id edoc-10280) (id edoc-10281) (id edoc-10282) (id edoc-10283) (id edoc-10284) (id edoc-10285) (id edoc-10286) (id edoc-10287) (id edoc-10288) (id edoc-10289) (id edoc-10290) (id edoc-10291) (id edoc-10292) (id edoc-10293) (id edoc-10294) (id edoc-10295) (id edoc-10296) (id edoc-10297) (id edoc-10298) (id edoc-10299) (id edoc-10300) (id edoc-10301) (id edoc-10302) (id edoc-10303) (id edoc-10304) (id edoc-10305) (id edoc-10306) (id edoc-10307) (id edoc-10308) (id edoc-10309) (id edoc-10310) (id edoc-10311) (id edoc-10312) (id edoc-10313) (id edoc-10314) (id edoc-10315) (id edoc-10316) (id edoc-10317) (id edoc-10318) (id edoc-10319) (id edoc-10320) (id edoc-10321) (id edoc-10322) (id edoc-10323) (id edoc-10324) (id edoc-10325) (id edoc-10326) (id edoc-10327) (id edoc-10328) (id edoc-10329) (id edoc-10330) (id edoc-10331) (id edoc-10332) (id edoc-10333) (id edoc-10334) (id edoc-10335) (id edoc-10336) (id edoc-10337) (id edoc-10338) (id edoc-10339) (id edoc-10340) (id edoc-10341) (id edoc-10342) (id edoc-10343) (id edoc-10344) (id edoc-10345) (id edoc-10346) (id edoc-10347) (id icp-nav-flyout) (id nav-link-accountList) (id edoc-10348) (id nav-orders) (id nav-link-prime) (id nav-cart) (id nav-link-shopall) (id nav-recently-viewed) (id nav-your-amazon) (id edoc-10349) (id edoc-10350) (id edoc-10351) (id edoc-10352) (id edoc-10353) (id edoc-10354) (id edoc-10355) (id edoc-10356) (id edoc-10357) (id edoc-10358) (id edoc-10359) (id edoc-10360) (id edoc-10361) (id edoc-10362) (id edoc-10363) (id edoc-10364) (id edoc-10365) (id edoc-10366) (id edoc-10367) (id edoc-10368) (id edoc-10369) (id edoc-10370) (id edoc-10371) (id edoc-10372) (id edoc-10373) (id edoc-10374) (id edoc-10375) (id edoc-10376) (id edoc-10377) (id edoc-10378) (id edoc-10379) (id edoc-10380) (id edoc-10381) (id edoc-10382) (id edoc-10383) (id edoc-10384) (id edoc-10385) (id edoc-10386) (id edoc-10387) (id edoc-10388) (id edoc-10389) (id edoc-10390) (id edoc-10391) (id edoc-10392) (id edoc-10393) (id edoc-10394) (id edoc-10395) (id edoc-10396) (id edoc-10397) (id edoc-10398) (id edoc-10399) (id edoc-10400) (id edoc-10401) (id edoc-10402) (id edoc-10403) (id edoc-10404) (id edoc-10405) (id edoc-10406) (id edoc-10407) (id edoc-10408) (id edoc-10409) (id edoc-10410) (id edoc-10411) (id edoc-10412) (id edoc-10413) (id edoc-10414) (id edoc-10415) (id edoc-10416) (id edoc-10417) (id edoc-10418) (id edoc-10419) (id edoc-10420) (id edoc-10421) (id edoc-10422) (id edoc-10423) (id edoc-10424) (id edoc-10425) (id edoc-10426) (id edoc-10427) (id edoc-10428) (id edoc-10429) (id edoc-10430) (id edoc-10431) (id edoc-10432) (id edoc-10433) (id edoc-10434) (id edoc-10435) (id edoc-10436) (id edoc-10437) (id edoc-10438) (id edoc-10439) (id edoc-10440) (id edoc-10441) (id edoc-10442) (id edoc-10443) (id edoc-10444) (id edoc-10445) (id edoc-10446) (id edoc-10447) (id edoc-10448) (id edoc-10449) (id edoc-10450) (id edoc-10451) (id edoc-10452) (id edoc-10453) (id edoc-10454) (id edoc-10455) (id edoc-10456) (id edoc-10457) (id edoc-10458) (id edoc-10459) (id edoc-10460) (id edoc-10461) (id edoc-10462) (id edoc-10463) (id edoc-10464) (id edoc-10465) (id edoc-10466) (id edoc-10467) (id edoc-10468) (id edoc-10469) (id edoc-10470) (id edoc-10471) (id edoc-10472) (id edoc-10473) (id edoc-10474) (id edoc-10475) (id edoc-10476) (id edoc-10477) (id edoc-10478) (id edoc-10479) (id digital-dash-check-order-submit-button-announce) (id edoc-10480) (id edoc-10481) (id edoc-10482) (id edoc-10483) (id edoc-10484) (id edoc-10485) (id edoc-10486) (id edoc-10487) (id edoc-10488) (id edoc-10489) (id edoc-10490) (id edoc-10491) (id edoc-10492) (id edoc-10493) (id edoc-10494) (id edoc-10495) (id edoc-10496) (id edoc-10497) (id edoc-10498) (id edoc-10499) (id edoc-10500) (id edoc-10501) (id edoc-10502) (id edoc-10503) (id edoc-10504) (id edoc-10505) (id edoc-10506) (id edoc-10507) (id edoc-10508) (id edoc-10509) (id edoc-10510) (id edoc-10511) (id edoc-10512) (id edoc-10513) (id edoc-10514) (id edoc-10515) (id edoc-10516) (id edoc-10517) (id edoc-10518) (id edoc-10519) (id edoc-10520) (id edoc-10521) (id edoc-10522) (id edoc-10523) (id edoc-10524) (id edoc-10525) (id edoc-10526) (id edoc-10527) (id edoc-10528) (id edoc-10529) (id edoc-10530) (id edoc-10531) (id edoc-10532) (id edoc-10533) (id edoc-10534) (id edoc-10535) (id edoc-10536) (id edoc-10537) (id edoc-10538) (id edoc-10539) (id edoc-10540) (id edoc-10541) (id edoc-10542) (id edoc-10543) (id edoc-10544) (id edoc-10545) (id edoc-10546) (id edoc-10547) (id edoc-10548) (id edoc-10549) (id edoc-10550) (id edoc-10551) (id edoc-10552) (id edoc-10553) (id edoc-10554) (id edoc-10555) (id edoc-10556) (id edoc-10557) (id edoc-10558) (id edoc-10559) (id edoc-10560) (id edoc-10561) (id edoc-10562) (id edoc-10563) (id edoc-10564) (id edoc-10565) (id edoc-10566) (id edoc-10567) (id edoc-10568) (id edoc-10569) (id edoc-10570) (id edoc-10571) (id edoc-10572) (id dmimglnch_1530817684) (id edoc-10573) (id edoc-10574) (id a-autoid-0-announce) (id edoc-10575) (id navBackToTop) (id edoc-10576) (id edoc-10577) (id edoc-10578) (id edoc-10579) (id edoc-10580) (id edoc-10581) (id edoc-10582) (id edoc-10583) (id edoc-10584) (id edoc-10585) (id edoc-10586) (id edoc-10587) (id edoc-10588) (id edoc-10589) (id edoc-10590) (id edoc-10591) (id edoc-10592) (id edoc-10593) (id edoc-10594) (id edoc-10595) (id edoc-10596) (id edoc-10597) (id edoc-10598) (id edoc-10599) (id edoc-10600) (id edoc-10601) (id edoc-10602) (id edoc-10603) (id edoc-10604) (id icp-touch-link-language) (id icp-touch-link-country) (id edoc-10605) (id edoc-10606) (id edoc-10607) (id edoc-10608) (id edoc-10609) (id edoc-10610) (id edoc-10611) (id edoc-10612) (id edoc-10613) (id edoc-10614) (id edoc-10615) (id edoc-10616) (id edoc-10617) (id edoc-10618) (id edoc-10619) (id edoc-10620) (id edoc-10621) (id edoc-10622) (id edoc-10623) (id edoc-10624) (id edoc-10625) (id edoc-10626) (id edoc-10627) (id edoc-10628) (id edoc-10629) (id edoc-10630) (id edoc-10631) (id edoc-10632) (id edoc-10633) (id edoc-10634) (id edoc-10635) (id edoc-10636) (id edoc-10637) (id edoc-10638) (id edoc-10639) (id edoc-10640) (id edoc-10641) (id edoc-10642) (id edoc-10643) (id edoc-10644) (id edoc-10645) (id edoc-10646) (id edoc-10647))
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [color (rgb 0 102 192)])
  ((fake " a:visited")
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [color (rgb 0 102 192)])
  ((tag table)
   [margin-bottom (px 18)]
   #;[border-collapse collapse]
   [width (% 100)])
  ((and (tag table) (pseudo-class last-child))
   [margin-bottom (px 0) :important])
  ((tag td)
   [vertical-align top])
  ((tag th)
   [vertical-align top])
  ((and (tag td) (pseudo-class first-child))
   [padding-left (px 0)])
  ((and (tag th) (pseudo-class first-child))
   [padding-left (px 0)])
  ((and (tag td) (pseudo-class last-child))
   [padding-right (px 0)])
  ((and (tag th) (pseudo-class last-child))
   [padding-right (px 0)])
  ((desc (and (tag tr) (pseudo-class last-child)) (tag td))
   [padding-bottom (px 0)])
  ((desc (and (tag tr) (pseudo-class last-child)) (tag th))
   [padding-bottom (px 0)])
  ((desc (and (tag tr) (pseudo-class first-child)) (tag td))
   [padding-top (px 0)])
  ((desc (and (tag tr) (pseudo-class first-child)) (tag th))
   [padding-top (px 0)])
  ((tag td)
   [padding-top (px 3)]
   [padding-right (px 3)]
   [padding-bottom (px 3)]
   [padding-left (px 3)])
  ((tag th)
   [padding-top (px 3)]
   [padding-right (px 3)]
   [padding-bottom (px 3)]
   [padding-left (px 3)])
  ((class a-unordered-list)
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 18)]
   [color (rgb 148 148 148)])
  ((tag ul)
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 18)]
   [color (rgb 148 148 148)])
  ((class a-ordered-list)
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 20)]
   [color (rgb 118 118 118)])
  ((tag ol)
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 20)]
   [color (rgb 118 118 118)])
  ((class a-ordered-list)
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((class a-unordered-list)
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((tag ol)
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((tag ul)
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (class a-ordered-list) (class a-list-item))
   [color (rgb 17 17 17)])
  ((desc (class a-unordered-list) (class a-list-item))
   [color (rgb 17 17 17)])
  ((desc (tag ol) (class a-list-item))
   [color (rgb 17 17 17)])
  ((desc (tag ul) (class a-list-item))
   [color (rgb 17 17 17)])
  ((desc (class a-ordered-list) (tag li))
   #;[overflow-wrap break-word]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (class a-unordered-list) (tag li))
   #;[overflow-wrap break-word]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (tag ol) (tag li))
   #;[overflow-wrap break-word]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (tag ul) (tag li))
   #;[overflow-wrap break-word]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (class a-ordered-list) (class a-nostyle))
   [margin-left (px 0)]
   [color (rgb 17 17 17)])
  ((and (class a-unordered-list) (class a-nostyle))
   [margin-left (px 0)]
   [color (rgb 17 17 17)])
  ((and (tag ol) (class a-nostyle))
   [margin-left (px 0)]
   [color (rgb 17 17 17)])
  ((and (tag ul) (class a-nostyle))
   [margin-left (px 0)]
   [color (rgb 17 17 17)])
  ((desc (and (class a-ordered-list) (class a-nostyle)) (class a-unordered-list))
   [margin-left (px 14)])
  ((desc (and (class a-ordered-list) (class a-nostyle)) (tag ul))
   [margin-left (px 14)])
  ((desc (and (class a-unordered-list) (class a-nostyle)) (class a-unordered-list))
   [margin-left (px 14)])
  ((desc (and (class a-unordered-list) (class a-nostyle)) (tag ul))
   [margin-left (px 14)])
  ((desc (and (tag ol) (class a-nostyle)) (class a-unordered-list))
   [margin-left (px 14)])
  ((desc (and (tag ol) (class a-nostyle)) (tag ul))
   [margin-left (px 14)])
  ((desc (and (tag ul) (class a-nostyle)) (class a-unordered-list))
   [margin-left (px 14)])
  ((desc (and (tag ul) (class a-nostyle)) (tag ul))
   [margin-left (px 14)])
  ((and (class a-ordered-list) (class a-horizontal))
   [display block]
   [margin-left (px 0)])
  ((and (class a-unordered-list) (class a-horizontal))
   [display block]
   [margin-left (px 0)])
  ((and (tag ol) (class a-horizontal))
   [display block]
   [margin-left (px 0)])
  ((and (tag ul) (class a-horizontal))
   [display block]
   [margin-left (px 0)])
  ((desc (and (class a-ordered-list) (class a-horizontal)) (tag li))
   [display inline-block]
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class a-unordered-list) (class a-horizontal)) (tag li))
   [display inline-block]
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (tag ol) (class a-horizontal)) (tag li))
   [display inline-block]
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (tag ul) (class a-horizontal)) (tag li))
   [display inline-block]
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class a-ordered-list) (class a-horizontal)) (and (tag li) (class a-last)))
   [margin-right (px 0)])
  ((desc (and (class a-ordered-list) (class a-horizontal)) (and (tag li) (pseudo-class last-child)))
   [margin-right (px 0)])
  ((desc (and (class a-unordered-list) (class a-horizontal)) (and (tag li) (class a-last)))
   [margin-right (px 0)])
  ((desc (and (class a-unordered-list) (class a-horizontal)) (and (tag li) (pseudo-class last-child)))
   [margin-right (px 0)])
  ((desc (and (tag ol) (class a-horizontal)) (and (tag li) (class a-last)))
   [margin-right (px 0)])
  ((desc (and (tag ol) (class a-horizontal)) (and (tag li) (pseudo-class last-child)))
   [margin-right (px 0)])
  ((desc (and (tag ul) (class a-horizontal)) (and (tag li) (class a-last)))
   [margin-right (px 0)])
  ((desc (and (tag ul) (class a-horizontal)) (and (tag li) (pseudo-class last-child)))
   [margin-right (px 0)])
  ((tag form)
   [margin-bottom (px 14)])
  ((tag label)
   [display block]
   [padding-left (px 2)]
   [padding-bottom (px 2)]
   [font-weight 700])
  ((tag legend)
   [display block]
   [padding-left (px 2)]
   [padding-bottom (px 2)]
   [font-weight 700])
  ((class a-input-text)
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-left-color (rgb 166 166 166)]
   [border-left-style solid]
   [border-left-width (px 1)]
   #;[border-bottom-color (rgb 166 166 166)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   #;[border-right-color (rgb 166 166 166)]
   [border-right-style solid]
   [border-right-width (px 1)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   #;[border-top-color (rgb 148 148 148)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[box-shadow rgba(255, 255, 255, 0.5) 0px 1px 0px, rgba(0, 0, 0, 0.07) 0px 1px 0px inset]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor])
  ((and (tag input) (type text))
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-left-color (rgb 166 166 166)]
   [border-left-style solid]
   [border-left-width (px 1)]
   #;[border-bottom-color (rgb 166 166 166)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   #;[border-right-color (rgb 166 166 166)]
   [border-right-style solid]
   [border-right-width (px 1)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   #;[border-top-color (rgb 148 148 148)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[box-shadow rgba(255, 255, 255, 0.5) 0px 1px 0px, rgba(0, 0, 0, 0.07) 0px 1px 0px inset]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor])
  ((and (tag input) (type search))
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-left-color (rgb 166 166 166)]
   [border-left-style solid]
   [border-left-width (px 1)]
   #;[border-bottom-color (rgb 166 166 166)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   #;[border-right-color (rgb 166 166 166)]
   [border-right-style solid]
   [border-right-width (px 1)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   #;[border-top-color (rgb 148 148 148)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[box-shadow rgba(255, 255, 255, 0.5) 0px 1px 0px, rgba(0, 0, 0, 0.07) 0px 1px 0px inset]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor])
  ((and (tag input) (type number))
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-left-color (rgb 166 166 166)]
   [border-left-style solid]
   [border-left-width (px 1)]
   #;[border-bottom-color (rgb 166 166 166)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   #;[border-right-color (rgb 166 166 166)]
   [border-right-style solid]
   [border-right-width (px 1)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   #;[border-top-color (rgb 148 148 148)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[box-shadow rgba(255, 255, 255, 0.5) 0px 1px 0px, rgba(0, 0, 0, 0.07) 0px 1px 0px inset]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor])
  ((and (tag input) (type tel))
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-left-color (rgb 166 166 166)]
   [border-left-style solid]
   [border-left-width (px 1)]
   #;[border-bottom-color (rgb 166 166 166)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   #;[border-right-color (rgb 166 166 166)]
   [border-right-style solid]
   [border-right-width (px 1)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   #;[border-top-color (rgb 148 148 148)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[box-shadow rgba(255, 255, 255, 0.5) 0px 1px 0px, rgba(0, 0, 0, 0.07) 0px 1px 0px inset]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor])
  ((and (tag input) (type password))
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-left-color (rgb 166 166 166)]
   [border-left-style solid]
   [border-left-width (px 1)]
   #;[border-bottom-color (rgb 166 166 166)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   #;[border-right-color (rgb 166 166 166)]
   [border-right-style solid]
   [border-right-width (px 1)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   #;[border-top-color (rgb 148 148 148)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[box-shadow rgba(255, 255, 255, 0.5) 0px 1px 0px, rgba(0, 0, 0, 0.07) 0px 1px 0px inset]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor])
  ((and (tag select) (class a-select-multiple))
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-left-color (rgb 166 166 166)]
   [border-left-style solid]
   [border-left-width (px 1)]
   #;[border-bottom-color (rgb 166 166 166)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   #;[border-right-color (rgb 166 166 166)]
   [border-right-style solid]
   [border-right-width (px 1)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   #;[border-top-color (rgb 148 148 148)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[box-shadow rgba(255, 255, 255, 0.5) 0px 1px 0px, rgba(0, 0, 0, 0.07) 0px 1px 0px inset]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor])
  ((tag textarea)
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-left-color (rgb 166 166 166)]
   [border-left-style solid]
   [border-left-width (px 1)]
   #;[border-bottom-color (rgb 166 166 166)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   #;[border-right-color (rgb 166 166 166)]
   [border-right-style solid]
   [border-right-width (px 1)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   #;[border-top-color (rgb 148 148 148)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[box-shadow rgba(255, 255, 255, 0.5) 0px 1px 0px, rgba(0, 0, 0, 0.07) 0px 1px 0px inset]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor])
  ((tag input)
   #;[transition-property all]
   #;[transition-duration (s 0.1)]
   #;[transition-timing-function linear]
   #;[transition-delay (s 0)]
   [line-height (px 19)]
   [color (rgb 17 17 17)])
  ((tag select)
   #;[transition-property all]
   #;[transition-duration (s 0.1)]
   #;[transition-timing-function linear]
   #;[transition-delay (s 0)]
   [line-height (px 19)]
   [color (rgb 17 17 17)])
  ((tag textarea)
   #;[transition-property all]
   #;[transition-duration (s 0.1)]
   #;[transition-timing-function linear]
   #;[transition-delay (s 0)]
   [line-height (px 19)]
   [color (rgb 17 17 17)])
  ((class a-input-text)
   [background-color (rgb 255 255 255)]
   [height (px 31)]
   [padding-top (px 3)]
   [padding-right (px 7)]
   [padding-bottom (px 3)]
   [padding-left (px 7)]
   [line-height normal])
  ((and (tag input) (type text))
   [background-color (rgb 255 255 255)]
   [height (px 31)]
   [padding-top (px 3)]
   [padding-right (px 7)]
   [padding-bottom (px 3)]
   [padding-left (px 7)]
   [line-height normal])
  ((and (tag input) (type search))
   [background-color (rgb 255 255 255)]
   [height (px 31)]
   [padding-top (px 3)]
   [padding-right (px 7)]
   [padding-bottom (px 3)]
   [padding-left (px 7)]
   [line-height normal])
  ((and (tag input) (type number))
   [background-color (rgb 255 255 255)]
   [height (px 31)]
   [padding-top (px 3)]
   [padding-right (px 7)]
   [padding-bottom (px 3)]
   [padding-left (px 7)]
   [line-height normal])
  ((and (tag input) (type tel))
   [background-color (rgb 255 255 255)]
   [height (px 31)]
   [padding-top (px 3)]
   [padding-right (px 7)]
   [padding-bottom (px 3)]
   [padding-left (px 7)]
   [line-height normal])
  ((and (tag input) (type password))
   [background-color (rgb 255 255 255)]
   [height (px 31)]
   [padding-top (px 3)]
   [padding-right (px 7)]
   [padding-bottom (px 3)]
   [padding-left (px 7)]
   [line-height normal])
  ((and (tag input) (type date))
   [background-color (rgb 255 255 255)]
   [height (px 31)]
   [padding-top (px 3)]
   [padding-right (px 7)]
   [padding-bottom (px 3)]
   [padding-left (px 7)]
   [line-height normal])
  ((and (tag input) (type email))
   [background-color (rgb 255 255 255)]
   [height (px 31)]
   [padding-top (px 3)]
   [padding-right (px 7)]
   [padding-bottom (px 3)]
   [padding-left (px 7)]
   [line-height normal])
  ((and (tag input) (type checkbox))
   [height (px 13)]
   [width (px 13)]
   [vertical-align top]
   [position relative]
   [bottom (px -3)])
  ((desc (class a-checkbox) (tag label))
   [position relative]
   [font-weight 400]
   [color (rgb 17 17 17)]
   [padding-left (px 15)]
   [text-indent (px -15)]
   [margin-left (px 3)]
   [top (px -2)]
   [padding-bottom (px 0)])
  ((desc (class a-radio) (tag label))
   [position relative]
   [font-weight 400]
   [color (rgb 17 17 17)]
   [padding-left (px 15)]
   [text-indent (px -15)]
   [margin-left (px 3)]
   [top (px -2)]
   [padding-bottom (px 0)])
  ((class a-checkbox-label)
   [position relative]
   [padding-left (px 5)]
   [text-indent (px 0)]
   [display inline-block])
  ((class a-radio-label)
   [position relative]
   [padding-left (px 5)]
   [text-indent (px 0)]
   [display inline-block])
  ((class a-price)
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [position relative]
   [line-height normal])
  ((fake ".a-price[data-a-color=\"base\"]" (id digital-dash-button-price) (id digital-dash-button-price) (id digital-dash-button-price) (id digital-dash-button-price) (id digital-dash-button-price) (id digital-dash-button-price))
   [color (rgb 17 17 17)])
  ((fake ".a-price[data-a-size$=\"l\"] .a-price-decimal" (id edoc-10648) (id edoc-10649) (id edoc-10650) (id edoc-10651) (id edoc-10652) (id edoc-10653))
   [position absolute]
   #;[opacity 0])
  ((fake ".a-price[data-a-size$=\"l\"] .a-price-fraction" (id edoc-10654) (id edoc-10655) (id edoc-10656) (id edoc-10657) (id edoc-10658) (id edoc-10659))
   [position relative])
  ((fake " .a-price[data-a-size$=\"l\"] .a-price-symbol" (id edoc-10660) (id edoc-10661) (id edoc-10662) (id edoc-10663) (id edoc-10664) (id edoc-10665))
   [position relative])
  ((fake ".a-price[data-a-size=\"l\"]" (id digital-dash-button-price) (id digital-dash-button-price) (id digital-dash-button-price) (id digital-dash-button-price) (id digital-dash-button-price) (id digital-dash-button-price))
   [font-size (px 21)])
  ((fake ".a-price[data-a-size=\"l\"] .a-price-symbol" (id edoc-10660) (id edoc-10661) (id edoc-10662) (id edoc-10663) (id edoc-10664) (id edoc-10665))
   [top (em -0.5)]
   [font-size (px 12)])
  ((fake ".a-price[data-a-size=\"l\"] .a-price-fraction" (id edoc-10654) (id edoc-10655) (id edoc-10656) (id edoc-10657) (id edoc-10658) (id edoc-10659))
   [top (em -0.5)]
   [font-size (px 12)])
  ((class a-carousel-container)
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden])
  ((class a-carousel-row-inner)
   [position relative]
   [height (% 100)])
  ((class a-carousel-col)
   [overflow-x visible]
   [overflow-y visible]
   [min-height (px 1)]
   [position relative])
  ((desc (class a-carousel-has-buttons) (class a-carousel-center))
   [margin-top (px 0)]
   [margin-right (px 40)]
   [margin-bottom (px 0)]
   [margin-left (px 40)])
  ((desc (and (class a-carousel-has-buttons) (class a-carousel-overlay-buttons)) (class a-carousel-center))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((class a-carousel-center)
   [overflow-x hidden]
   [overflow-y hidden])
  ((class a-carousel-left)
   [left (px 0)]
   [padding-left (px 3)])
  ((class a-carousel-right)
   [text-align right]
   [right (px 0)]
   [padding-right (px 3)])
  ((class a-carousel-left)
   [width (px 40)]
   [height (% 100)]
   [position absolute]
   [top (px 0)]
   #;[z-index 1])
  ((class a-carousel-right)
   [width (px 40)]
   [height (% 100)]
   [position absolute]
   [top (px 0)]
   #;[z-index 1])
  ((class a-carousel-viewport)
   [width (% 100)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (tag ol) (class a-carousel))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[list-style-type none]
   [height (% 100)]
   #;[white-space nowrap]
   [overflow-x visible]
   [color (rgb 17 17 17)]
   #;[letter-spacing (px -4)])
  ((class a-carousel-card)
   [vertical-align top]
   [text-align left]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-left (px 16)]
   [width (px 160)]
   [min-height (% 100)]
   #;[list-style-type none]
   [display inline-block]
   #;[white-space normal]
   #;[letter-spacing normal])
  ((desc (class a-carousel-display-single) (class a-carousel-card))
   [width (% 100)]
   [text-align center]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (class a-carousel-display-single) (class a-carousel-card) (tag img))
   [max-width (% 100)]
   [max-height (% 100)])
  ((and (class a-icon) (class a-icon-next-rounded))
   #;[background-size 68px 52px]
   #;[background-image url("https://m.media-amazon.com/images/G/01/AUIClients/AmazonUICarousel-arrows-c495a9b59afd9b35a08c12513d40b8c7e7771499._V2_.png")]
   [width (px 34)]
   [height (px 52)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor])
  ((and (class a-icon) (class a-icon-previous-rounded))
   #;[background-size 68px 52px]
   #;[background-image url("https://m.media-amazon.com/images/G/01/AUIClients/AmazonUICarousel-arrows-c495a9b59afd9b35a08c12513d40b8c7e7771499._V2_.png")]
   [width (px 34)]
   [height (px 52)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor])
  ((desc (class a-carousel-rounded-buttons) (class a-carousel-left))
   [width (px 80)]
   [position absolute])
  ((desc (class a-carousel-rounded-buttons) (class a-carousel-right))
   [width (px 80)]
   [position absolute])
  ((desc (class a-carousel-rounded-buttons) (class a-carousel-goto-nextpage))
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 0)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor])
  ((desc (class a-carousel-rounded-buttons) (class a-carousel-goto-prevpage))
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 0)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor])
  ((desc (class a-carousel-rounded-buttons) (class a-icon-next-rounded))
   [position absolute]
   [top (% 50)]
   [left (% 50)]
   #;[transform translate(-50%, -50%)])
  ((desc (class a-carousel-rounded-buttons) (class a-icon-previous-rounded))
   [position absolute]
   [top (% 50)]
   [left (% 50)]
   #;[transform translate(-50%, -50%)])
  ((class a-popover-preload)
   [display none])
  ((class a-hidden)
   [display none :important]
   #;[visibility hidden])
  ((class aok-hidden)
   [display none :important]
   #;[visibility hidden])
  ((class a-inline-block)
   [display inline-block])
  ((class aok-inline-block)
   [display inline-block])
  ((class a-offscreen)
   [position absolute :important]
   [left (px 0) :important]
   [bottom (px -1) :important]
   #;[z-index -1]
   #;[opacity 0])
  ((class aok-offscreen)
   [position absolute :important]
   [left (px 0) :important]
   [bottom (px -1) :important]
   #;[z-index -1]
   #;[opacity 0])
  ((class a-align-center)
   [vertical-align middle :important])
  ((class aok-align-center)
   [vertical-align middle :important])
  ((class a-hide-text)
   [font-style normal]
   #;[font-variant-caps normal]
   [font-weight normal]
   #;[font-stretch normal]
   [font-size (px 0)]
   [line-height 0]
   [font-family "a"]
   #;[font-size-adjust none]
   #;[font-kerning auto]
   #;[font-variant-alternates normal]
   #;[font-variant-east-asian normal]
   #;[font-variant-ligatures normal]
   #;[font-variant-numeric normal]
   #;[font-variant-position normal]
   #;[font-language-override normal]
   #;[font-feature-settings normal]
   [color transparent]
   #;[text-shadow none]
   [background-color transparent]
   #;[border-top-color currentcolor]
   [border-top-style none]
   [border-top-width (px 0)]
   #;[border-left-color currentcolor]
   [border-left-style none]
   [border-left-width (px 0)]
   #;[border-bottom-color currentcolor]
   [border-bottom-style none]
   [border-bottom-width (px 0)]
   #;[border-right-color currentcolor]
   [border-right-style none]
   [border-right-width (px 0)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1])
  ((class aok-hide-text)
   [font-style normal]
   #;[font-variant-caps normal]
   [font-weight normal]
   #;[font-stretch normal]
   [font-size (px 0)]
   [line-height 0]
   [font-family "a"]
   #;[font-size-adjust none]
   #;[font-kerning auto]
   #;[font-variant-alternates normal]
   #;[font-variant-east-asian normal]
   #;[font-variant-ligatures normal]
   #;[font-variant-numeric normal]
   #;[font-variant-position normal]
   #;[font-language-override normal]
   #;[font-feature-settings normal]
   [color transparent]
   #;[text-shadow none]
   [background-color transparent]
   #;[border-top-color currentcolor]
   [border-top-style none]
   [border-top-width (px 0)]
   #;[border-left-color currentcolor]
   [border-left-style none]
   [border-left-width (px 0)]
   #;[border-bottom-color currentcolor]
   [border-bottom-style none]
   [border-bottom-width (px 0)]
   #;[border-right-color currentcolor]
   [border-right-style none]
   [border-right-width (px 0)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1])
  ((desc (class a-ember) (tag body))
   [font-family "Arial, sans-serif"])
  ((class nav-hidden)
   [position absolute]
   [left (px -10000)]
   [top auto]
   [width (px 1)]
   [height (px 1)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((class nav-hidden-aria)
   [position absolute]
   [left (px -10000)]
   [top auto]
   [width (px 1)]
   [height (px 1)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((tag body)
   [margin-top (px 0) :important]
   [margin-right (px 8) :important]
   [margin-bottom (px 0) :important]
   [margin-left (px 8) :important])
  ((desc (and (tag html) (class a-js)) (tag body))
   [margin-top (px 0) :important]
   [margin-right (px 0) :important]
   [margin-bottom (px 0) :important]
   [margin-left (px 0) :important])
  ((desc (and (tag html) (class a-no-js)) (tag body))
   [margin-top (px 0) :important]
   [margin-right (px 0) :important]
   [margin-bottom (px 0) :important]
   [margin-left (px 0) :important])
  ((id navbar)
   [position relative]
   [top (px 0)]
   [left (px 0)]
   #;[z-index 198]
   [font-family "arial, sans-serif"]
   [font-size (px 12)]
   [line-height (em 1)]
   [margin-top (px 0)]
   [margin-right (px -8)]
   [margin-bottom (px 0)]
   [margin-left (px -8)]
   [display block]
   [min-width (px 1000)])
  ((desc (and (tag html) (class a-js)) (id navbar))
   [margin-top (px 0) :important]
   [margin-right (px 0) :important]
   [margin-bottom (px 0) :important]
   [margin-left (px 0) :important])
  ((desc (and (tag html) (class a-no-js)) (id navbar))
   [margin-top (px 0) :important]
   [margin-right (px 0) :important]
   [margin-bottom (px 0) :important]
   [margin-left (px 0) :important])
  ((desc (id navbar) *)
   [box-sizing border-box])
  ((desc (id navbar) (id nav-search))
   [margin-top (px 0)]
   [padding-top (px 11)]
   [padding-right (px 25)])
  ((desc (id navbar) (id nav-search) (class nav-searchbar))
   [margin-bottom (px 0)])
  ((desc (id navbar) (id nav-search) (class nav-searchbar) (class nav-fill))
   [overflow-x hidden]
   [overflow-y hidden])
  ((id nav-belt)
   [position relative]
   [width (% 100)]
   [font-size (px 14)]
   #;[z-index 5])
  ((desc (id navbar) (class nav-belt))
   [position relative]
   [width (% 100)]
   [font-size (px 14)]
   #;[z-index 5])
  ((desc (id nav-belt) (class nav-fill))
   [height (px 39)])
  ((desc (id nav-belt) (class nav-left))
   [height (px 39)])
  ((desc (id nav-belt) (class nav-right))
   [height (px 39)])
  ((desc (id navbar) (class nav-belt) (class nav-fill))
   [height (px 39)])
  ((desc (id navbar) (class nav-belt) (class nav-left))
   [height (px 39)])
  ((desc (id navbar) (class nav-belt) (class nav-right))
   [height (px 39)])
  ((desc (id nav-belt) (class nav-right))
   [min-width (px 350)])
  ((desc (id navbar) (class nav-belt) (class nav-right))
   [min-width (px 350)])
  ((desc (id nav-belt) (class nav-fill))
   [overflow-x visible]
   [overflow-y visible])
  ((desc (id navbar) (class nav-belt) (class nav-fill))
   [overflow-x visible]
   [overflow-y visible])
  ((id nav-main)
   [width (% 100)]
   [height (px 60)]
   [padding-top (px 5)]
   [position relative]
   #;[transform translate3d(0px, 0px, 0px)]
   #;[z-index 4]
   #;[background-position-x (px 0)]
   #;[background-position-y (px -725)])
  ((desc (id navbar) (class nav-main))
   [width (% 100)]
   [height (px 60)]
   [padding-top (px 5)]
   [position relative]
   #;[transform translate3d(0px, 0px, 0px)]
   #;[z-index 4]
   #;[background-position-x (px 0)]
   #;[background-position-y (px -725)])
  ((desc (id nav-main) (class nav-fill))
   [height (px 55)])
  ((desc (id nav-main) (class nav-left))
   [height (px 55)])
  ((desc (id nav-main) (class nav-right))
   [height (px 55)])
  ((desc (id navbar) (class nav-main) (class nav-fill))
   [height (px 55)])
  ((desc (id navbar) (class nav-main) (class nav-left))
   [height (px 55)])
  ((desc (id navbar) (class nav-main) (class nav-right))
   [height (px 55)])
  ((desc (id nav-main) (and (tag span) (class nav-arrow)))
   [display none])
  ((desc (id navbar) (class nav-main) (and (tag span) (class nav-arrow)))
   [display none])
  ((id nav-tools)
   [float left]
   [padding-top (px 6)]
   [padding-right (px 7)]
   [padding-bottom (px 0)]
   [padding-left (px 32)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [margin-top (px 2)])
  ((desc (id nav-tools) (class nav-a))
   [position relative]
   [float left]
   [top (px 1)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 9)]
   [line-height (px 44)]
   [height (px 44)])
  ((desc (id navbar) (class nav-tools) (class nav-a))
   [position relative]
   [float left]
   [top (px 1)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 9)]
   [line-height (px 44)]
   [height (px 44)])
  ((desc (id nav-tools) (class nav-cart-count))
   [color (rgb 228 121 17)]
   [font-weight 700]
   [font-family "arial, sans-serif"]
   [position absolute]
   [line-height (px 16)]
   [width (px 20)]
   [text-align center])
  ((desc (id navbar) (class nav-tools) (class nav-cart-count))
   [color (rgb 228 121 17)]
   [font-weight 700]
   [font-family "arial, sans-serif"]
   [position absolute]
   [line-height (px 16)]
   [width (px 20)]
   [text-align center])
  ((desc (id nav-tools) (id nav-cart) (class nav-cart-0))
   [left (px 23)]
   [top (px 9)]
   [font-size (px 16)]
   [width (px 19)])
  ((desc (id nav-tools) (class nav-cart) (class nav-cart-0))
   [left (px 23)]
   [top (px 9)]
   [font-size (px 16)]
   [width (px 19)])
  ((desc (id navbar) (class nav-tools) (id nav-cart) (class nav-cart-0))
   [left (px 23)]
   [top (px 9)]
   [font-size (px 16)]
   [width (px 19)])
  ((desc (id navbar) (class nav-tools) (class nav-cart) (class nav-cart-0))
   [left (px 23)]
   [top (px 9)]
   [font-size (px 16)]
   [width (px 19)])
  ((desc (id nav-tools) (id nav-cart) (class nav-cart-icon))
   [display block]
   [overflow-x hidden]
   [overflow-y hidden]
   [position absolute]
   [left (px 10)]
   [top (px 11)]
   #;[background-position-x (px -10)]
   #;[background-position-y (px -340)]
   [width (px 38)]
   [height (px 26)])
  ((desc (id nav-tools) (class nav-cart) (class nav-cart-icon))
   [display block]
   [overflow-x hidden]
   [overflow-y hidden]
   [position absolute]
   [left (px 10)]
   [top (px 11)]
   #;[background-position-x (px -10)]
   #;[background-position-y (px -340)]
   [width (px 38)]
   [height (px 26)])
  ((desc (id navbar) (class nav-tools) (id nav-cart) (class nav-cart-icon))
   [display block]
   [overflow-x hidden]
   [overflow-y hidden]
   [position absolute]
   [left (px 10)]
   [top (px 11)]
   #;[background-position-x (px -10)]
   #;[background-position-y (px -340)]
   [width (px 38)]
   [height (px 26)])
  ((desc (id navbar) (class nav-tools) (class nav-cart) (class nav-cart-icon))
   [display block]
   [overflow-x hidden]
   [overflow-y hidden]
   [position absolute]
   [left (px 10)]
   [top (px 11)]
   #;[background-position-x (px -10)]
   #;[background-position-y (px -340)]
   [width (px 38)]
   [height (px 26)])
  ((desc (id nav-tools) (id nav-cart) (class nav-line-1))
   [margin-left (px 42)])
  ((desc (id nav-tools) (id nav-cart) (class nav-line-2))
   [margin-left (px 42)])
  ((desc (id nav-tools) (class nav-cart) (class nav-line-1))
   [margin-left (px 42)])
  ((desc (id nav-tools) (class nav-cart) (class nav-line-2))
   [margin-left (px 42)])
  ((desc (id navbar) (class nav-tools) (id nav-cart) (class nav-line-1))
   [margin-left (px 42)])
  ((desc (id navbar) (class nav-tools) (id nav-cart) (class nav-line-2))
   [margin-left (px 42)])
  ((desc (id navbar) (class nav-tools) (class nav-cart) (class nav-line-1))
   [margin-left (px 42)])
  ((desc (id navbar) (class nav-tools) (class nav-cart) (class nav-line-2))
   [margin-left (px 42)])
  ((desc (id nav-tools) (and (class nav-a) (pseudo-class last-of-type)))
   [padding-left (px 6)])
  ((desc (id nav-tools) (class nav-a-2))
   [padding-right (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   [top (px 1)]
   [margin-top (px 0)]
   [margin-right (px 1)]
   [margin-bottom (px 0)]
   [margin-left (px 1)]
   [display inline-block]
   [box-sizing border-box])
  ((desc (id nav-xshop) (class nav-a-2))
   [padding-right (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   [top (px 1)]
   [margin-top (px 0)]
   [margin-right (px 1)]
   [margin-bottom (px 0)]
   [margin-left (px 1)]
   [display inline-block]
   [box-sizing border-box])
  ((desc (id navbar) (class nav-tools) (class nav-a-2))
   [padding-right (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   [top (px 1)]
   [margin-top (px 0)]
   [margin-right (px 1)]
   [margin-bottom (px 0)]
   [margin-left (px 1)]
   [display inline-block]
   [box-sizing border-box])
  ((desc (id nav-tools) (class nav-a-2) (class nav-line-1))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 9)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id nav-tools) (class nav-a-2) (class nav-line-2))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 9)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id nav-tools) (class nav-a-2) (class nav-line-3))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 9)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id nav-tools) (class nav-a-2) (class nav-line-4))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 9)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id nav-xshop) (class nav-a-2) (class nav-line-1))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 9)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id nav-xshop) (class nav-a-2) (class nav-line-2))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 9)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id nav-xshop) (class nav-a-2) (class nav-line-3))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 9)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id nav-xshop) (class nav-a-2) (class nav-line-4))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 9)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-1))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 9)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-2))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 9)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-3))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 9)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-4))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 9)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id nav-tools) (class nav-a-2) (class nav-line-1))
   [font-size (px 12)]
   [line-height (px 14)]
   [height (px 14)]
   [font-weight 400]
   [margin-top (px 9)])
  ((desc (id nav-tools) (class nav-a-2) (class nav-line-3))
   [font-size (px 12)]
   [line-height (px 14)]
   [height (px 14)]
   [font-weight 400]
   [margin-top (px 9)])
  ((desc (id nav-xshop) (class nav-a-2) (class nav-line-1))
   [font-size (px 12)]
   [line-height (px 14)]
   [height (px 14)]
   [font-weight 400]
   [margin-top (px 9)])
  ((desc (id nav-xshop) (class nav-a-2) (class nav-line-3))
   [font-size (px 12)]
   [line-height (px 14)]
   [height (px 14)]
   [font-weight 400]
   [margin-top (px 9)])
  ((desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-1))
   [font-size (px 12)]
   [line-height (px 14)]
   [height (px 14)]
   [font-weight 400]
   [margin-top (px 9)])
  ((desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-3))
   [font-size (px 12)]
   [line-height (px 14)]
   [height (px 14)]
   [font-weight 400]
   [margin-top (px 9)])
  ((desc (id nav-tools) (class nav-a-2) (class nav-line-2))
   [font-size (px 14)]
   [line-height (px 15)]
   [font-weight 700]
   [padding-bottom (px 5)])
  ((desc (id nav-tools) (class nav-a-2) (class nav-line-4))
   [font-size (px 14)]
   [line-height (px 15)]
   [font-weight 700]
   [padding-bottom (px 5)])
  ((desc (id nav-xshop) (class nav-a-2) (class nav-line-2))
   [font-size (px 14)]
   [line-height (px 15)]
   [font-weight 700]
   [padding-bottom (px 5)])
  ((desc (id nav-xshop) (class nav-a-2) (class nav-line-4))
   [font-size (px 14)]
   [line-height (px 15)]
   [font-weight 700]
   [padding-bottom (px 5)])
  ((desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-2))
   [font-size (px 14)]
   [line-height (px 15)]
   [font-weight 700]
   [padding-bottom (px 5)])
  ((desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-4))
   [font-size (px 14)]
   [line-height (px 15)]
   [font-weight 700]
   [padding-bottom (px 5)])
  ((desc (id nav-tools) (class nav-a-2) (class nav-line-2) (class nav-icon))
   [display inline-block]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 4)]
   [border-left-width (px 4)]
   [border-right-width (px 4)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-top-color (rgb 96 96 96)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   [font-size (px 0)]
   [line-height 0]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 5)]
   #;[visibility hidden])
  ((desc (id nav-tools) (class nav-a-2) (class nav-line-4) (class nav-icon))
   [display inline-block]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 4)]
   [border-left-width (px 4)]
   [border-right-width (px 4)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-top-color (rgb 96 96 96)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   [font-size (px 0)]
   [line-height 0]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 5)]
   #;[visibility hidden])
  ((desc (id nav-xshop) (class nav-a-2) (class nav-line-2) (class nav-icon))
   [display inline-block]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 4)]
   [border-left-width (px 4)]
   [border-right-width (px 4)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-top-color (rgb 96 96 96)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   [font-size (px 0)]
   [line-height 0]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 5)]
   #;[visibility hidden])
  ((desc (id nav-xshop) (class nav-a-2) (class nav-line-4) (class nav-icon))
   [display inline-block]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 4)]
   [border-left-width (px 4)]
   [border-right-width (px 4)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-top-color (rgb 96 96 96)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   [font-size (px 0)]
   [line-height 0]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 5)]
   #;[visibility hidden])
  ((desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-2) (class nav-icon))
   [display inline-block]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 4)]
   [border-left-width (px 4)]
   [border-right-width (px 4)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-top-color (rgb 96 96 96)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   [font-size (px 0)]
   [line-height 0]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 5)]
   #;[visibility hidden])
  ((desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-4) (class nav-icon))
   [display inline-block]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 4)]
   [border-left-width (px 4)]
   [border-right-width (px 4)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-top-color (rgb 96 96 96)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   [font-size (px 0)]
   [line-height 0]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 5)]
   #;[visibility hidden])
  ((desc (id nav-tools) (class nav-a-2) (class nav-line-3))
   [display none])
  ((desc (id nav-tools) (class nav-a-2) (class nav-line-4))
   [display none])
  ((desc (id nav-xshop) (class nav-a-2) (class nav-line-3))
   [display none])
  ((desc (id nav-xshop) (class nav-a-2) (class nav-line-4))
   [display none])
  ((desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-3))
   [display none])
  ((desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-4))
   [display none])
  ((desc (id nav-tools) (class nav-truncate) (class nav-line-1))
   #;[text-overflow ellipsis]
   [overflow-x hidden]
   [overflow-y hidden]
   [position absolute]
   [top (px 8)]
   [left (px 0)]
   [width (% 100)]
   [margin-top (px 1)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   [box-sizing border-box]
   [font-family "arial, sans-serif"])
  ((desc (id nav-tools) (class nav-truncate) (class nav-line-3))
   #;[text-overflow ellipsis]
   [overflow-x hidden]
   [overflow-y hidden]
   [position absolute]
   [top (px 8)]
   [left (px 0)]
   [width (% 100)]
   [margin-top (px 1)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   [box-sizing border-box]
   [font-family "arial, sans-serif"])
  ((desc (id nav-xshop) (class nav-truncate) (class nav-line-1))
   #;[text-overflow ellipsis]
   [overflow-x hidden]
   [overflow-y hidden]
   [position absolute]
   [top (px 8)]
   [left (px 0)]
   [width (% 100)]
   [margin-top (px 1)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   [box-sizing border-box]
   [font-family "arial, sans-serif"])
  ((desc (id nav-xshop) (class nav-truncate) (class nav-line-3))
   #;[text-overflow ellipsis]
   [overflow-x hidden]
   [overflow-y hidden]
   [position absolute]
   [top (px 8)]
   [left (px 0)]
   [width (% 100)]
   [margin-top (px 1)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   [box-sizing border-box]
   [font-family "arial, sans-serif"])
  ((desc (id navbar) (class nav-tools) (class nav-truncate) (class nav-line-1))
   #;[text-overflow ellipsis]
   [overflow-x hidden]
   [overflow-y hidden]
   [position absolute]
   [top (px 8)]
   [left (px 0)]
   [width (% 100)]
   [margin-top (px 1)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   [box-sizing border-box]
   [font-family "arial, sans-serif"])
  ((desc (id navbar) (class nav-tools) (class nav-truncate) (class nav-line-3))
   #;[text-overflow ellipsis]
   [overflow-x hidden]
   [overflow-y hidden]
   [position absolute]
   [top (px 8)]
   [left (px 0)]
   [width (% 100)]
   [margin-top (px 1)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   [box-sizing border-box]
   [font-family "arial, sans-serif"])
  ((desc (id nav-tools) (class nav-truncate) (class nav-line-2))
   [padding-top (px 23)])
  ((desc (id nav-xshop) (class nav-truncate) (class nav-line-2))
   [padding-top (px 23)])
  ((desc (id navbar) (class nav-tools) (class nav-truncate) (class nav-line-2))
   [padding-top (px 23)])
  ((desc (id nav-tools) (class nav-single-row-link))
   [height (px 26)]
   [margin-top (px 18)])
  ((fake " #nav-tools .nav-single-row-link:focus")
   [height (px 26)]
   [margin-top (px 18)])
  ((desc (id nav-tools) (and (class nav-single-row-link) (pseudo-class hover)))
   [height (px 26)]
   [margin-top (px 18)])
  ((desc (id nav-xshop) (class nav-single-row-link))
   [height (px 26)]
   [margin-top (px 18)])
  ((fake " #nav-xshop .nav-single-row-link:focus")
   [height (px 26)]
   [margin-top (px 18)])
  ((desc (id nav-xshop) (and (class nav-single-row-link) (pseudo-class hover)))
   [height (px 26)]
   [margin-top (px 18)])
  ((desc (id navbar) (class nav-tools) (class nav-single-row-link))
   [height (px 26)]
   [margin-top (px 18)])
  ((fake " #navbar .nav-tools .nav-single-row-link:focus")
   [height (px 26)]
   [margin-top (px 18)])
  ((desc (id navbar) (class nav-tools) (and (class nav-single-row-link) (pseudo-class hover)))
   [height (px 26)]
   [margin-top (px 18)])
  ((desc (id nav-tools) (class nav-single-row-link) (class nav-line-1))
   [color (rgb 170 170 170)]
   [height (px 0)]
   [margin-top (px 5)])
  ((fake " #nav-tools .nav-single-row-link:focus .nav-line-1")
   [color (rgb 170 170 170)]
   [height (px 0)]
   [margin-top (px 5)])
  ((desc (id nav-tools) (and (class nav-single-row-link) (pseudo-class hover)) (class nav-line-1))
   [color (rgb 170 170 170)]
   [height (px 0)]
   [margin-top (px 5)])
  ((desc (id nav-xshop) (class nav-single-row-link) (class nav-line-1))
   [color (rgb 170 170 170)]
   [height (px 0)]
   [margin-top (px 5)])
  ((fake " #nav-xshop .nav-single-row-link:focus .nav-line-1")
   [color (rgb 170 170 170)]
   [height (px 0)]
   [margin-top (px 5)])
  ((desc (id nav-xshop) (and (class nav-single-row-link) (pseudo-class hover)) (class nav-line-1))
   [color (rgb 170 170 170)]
   [height (px 0)]
   [margin-top (px 5)])
  ((desc (id navbar) (class nav-tools) (class nav-single-row-link) (class nav-line-1))
   [color (rgb 170 170 170)]
   [height (px 0)]
   [margin-top (px 5)])
  ((fake " #navbar .nav-tools .nav-single-row-link:focus .nav-line-1")
   [color (rgb 170 170 170)]
   [height (px 0)]
   [margin-top (px 5)])
  ((desc (id navbar) (class nav-tools) (and (class nav-single-row-link) (pseudo-class hover)) (class nav-line-1))
   [color (rgb 170 170 170)]
   [height (px 0)]
   [margin-top (px 5)])
  ((id nav-shop)
   [float left]
   [padding-top (px 6)]
   [padding-right (px 12)]
   [padding-bottom (px 0)]
   [padding-left (px 15)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [margin-top (px 2)]
   [width (px 192)])
  ((desc (id nav-programs) (class nav-a))
   [line-height (px 44)]
   [height (px 44)]
   [position relative]
   [float left]
   [top (px 1)])
  ((desc (id nav-shop) (class nav-a))
   [line-height (px 44)]
   [height (px 44)]
   [position relative]
   [float left]
   [top (px 1)])
  ((desc (id nav-programs) (class nav-a-2))
   [padding-right (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   [top (px 1)]
   [margin-top (px 0)]
   [margin-right (px 1)]
   [margin-bottom (px 0)]
   [margin-left (px 1)]
   [display inline-block]
   [box-sizing border-box])
  ((desc (id nav-shop) (class nav-a-2))
   [padding-right (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   [top (px 1)]
   [margin-top (px 0)]
   [margin-right (px 1)]
   [margin-bottom (px 0)]
   [margin-left (px 1)]
   [display inline-block]
   [box-sizing border-box])
  ((desc (id nav-programs) (class nav-a-2) (class nav-line-1))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-top (px 0)]
   [padding-right (px 12)]
   [padding-bottom (px 0)]
   [padding-left (px 13)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id nav-programs) (class nav-a-2) (class nav-line-2))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-top (px 0)]
   [padding-right (px 12)]
   [padding-bottom (px 0)]
   [padding-left (px 13)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id nav-shop) (class nav-a-2) (class nav-line-1))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-top (px 0)]
   [padding-right (px 12)]
   [padding-bottom (px 0)]
   [padding-left (px 13)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id nav-shop) (class nav-a-2) (class nav-line-2))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-top (px 0)]
   [padding-right (px 12)]
   [padding-bottom (px 0)]
   [padding-left (px 13)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (id nav-programs) (class nav-a-2) (class nav-line-1))
   [font-size (px 12)]
   [line-height (px 14)]
   [height (px 14)]
   [font-weight 400]
   [margin-top (px 9)])
  ((desc (id nav-shop) (class nav-a-2) (class nav-line-1))
   [font-size (px 12)]
   [line-height (px 14)]
   [height (px 14)]
   [font-weight 400]
   [margin-top (px 9)])
  ((desc (id nav-programs) (class nav-a-2) (class nav-line-2))
   [font-size (px 14)]
   [line-height (px 15)]
   [font-weight 700]
   [padding-bottom (px 5)])
  ((desc (id nav-shop) (class nav-a-2) (class nav-line-2))
   [font-size (px 14)]
   [line-height (px 15)]
   [font-weight 700]
   [padding-bottom (px 5)])
  ((desc (id nav-programs) (class nav-a-2) (class nav-line-2) (class nav-icon))
   [display inline-block]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 4)]
   [border-left-width (px 4)]
   [border-right-width (px 4)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-top-color (rgb 96 96 96)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   [font-size (px 0)]
   [line-height 0]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 5)]
   #;[visibility hidden])
  ((desc (id nav-shop) (class nav-a-2) (class nav-line-2) (class nav-icon))
   [display inline-block]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 4)]
   [border-left-width (px 4)]
   [border-right-width (px 4)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-top-color (rgb 96 96 96)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   [font-size (px 0)]
   [line-height 0]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 5)]
   #;[visibility hidden])
  ((desc (id nav-programs) (class nav-single-row-link))
   [height (px 26)]
   [margin-top (px 16)])
  ((fake " #nav-programs .nav-single-row-link:focus")
   [height (px 26)]
   [margin-top (px 16)])
  ((desc (id nav-programs) (and (class nav-single-row-link) (pseudo-class hover)))
   [height (px 26)]
   [margin-top (px 16)])
  ((desc (id nav-shop) (class nav-single-row-link))
   [height (px 26)]
   [margin-top (px 16)])
  ((fake " #nav-shop .nav-single-row-link:focus")
   [height (px 26)]
   [margin-top (px 16)])
  ((desc (id nav-shop) (and (class nav-single-row-link) (pseudo-class hover)))
   [height (px 26)]
   [margin-top (px 16)])
  ((desc (id nav-programs) (class nav-single-row-link) (class nav-line-1))
   [color (rgb 170 170 170)]
   [height (px 0)]
   [margin-top (px 5)])
  ((fake " #nav-programs .nav-single-row-link:focus .nav-line-1")
   [color (rgb 170 170 170)]
   [height (px 0)]
   [margin-top (px 5)])
  ((desc (id nav-programs) (and (class nav-single-row-link) (pseudo-class hover)) (class nav-line-1))
   [color (rgb 170 170 170)]
   [height (px 0)]
   [margin-top (px 5)])
  ((desc (id nav-shop) (class nav-single-row-link) (class nav-line-1))
   [color (rgb 170 170 170)]
   [height (px 0)]
   [margin-top (px 5)])
  ((fake " #nav-shop .nav-single-row-link:focus .nav-line-1")
   [color (rgb 170 170 170)]
   [height (px 0)]
   [margin-top (px 5)])
  ((desc (id nav-shop) (and (class nav-single-row-link) (pseudo-class hover)) (class nav-line-1))
   [color (rgb 170 170 170)]
   [height (px 0)]
   [margin-top (px 5)])
  ((id nav-xshop-container)
   [position relative]
   [float left]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[z-index 20])
  ((id nav-xshop)
   [margin-top (px 32)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [height (px 37)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (id nav-xshop) (class nav-a))
   [float left]
   [padding-top (px 0)]
   [padding-right (px 9)]
   [padding-bottom (px 0)]
   [padding-left (px 9)]
   [margin-bottom (px 25)]
   [font-family "arial, sans-serif"]
   [font-size (px 13)])
  ((desc (id nav-xshop) (and (class nav-a) (pseudo-class first-of-type)))
   [padding-left (px 0)])
  ((desc (id nav-xshop) (class nav-a))
   [color (rgb 0 85 170)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor])
  ((fake " #nav-xshop .nav-a:link" (id nav-recently-viewed) (id nav-your-amazon) (id edoc-10349) (id edoc-10350) (id edoc-10351) (id edoc-10352) (id edoc-10353) (id edoc-10354))
   [color (rgb 0 85 170)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor])
  ((fake " #nav-xshop .nav-a:visited")
   [color (rgb 0 85 170)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor])
  ((desc (id nav-xshop) (class nav-a) (class nav-icon))
   [display inline-block]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 4)]
   [border-left-width (px 4)]
   [border-right-width (px 4)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-top-color (rgb 96 96 96)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   [font-size (px 0)]
   [line-height 0]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 5)]
   #;[visibility hidden])
  ((id nav-swmslot)
   [position relative]
   [height (px 39)]
   [display inline]
   [overflow-x hidden]
   [overflow-y hidden])
  ((class nav-left)
   [position relative]
   [float left]
   [width auto]
   [display inline-block])
  ((class nav-right)
   [position relative]
   [float right]
   [width auto]
   [display inline-block])
  ((class nav-fill)
   [width auto]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[white-space nowrap])
  ((and (tag a) (class nav-a))
   [font-family "arial, sans-serif"]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   #;[cursor pointer])
  ((fake " a.nav-a:link" (id edoc-10014) (id icp-nav-flyout) (id nav-link-accountList) (id nav-orders) (id nav-link-prime) (id nav-cart) (id nav-link-shopall) (id nav-recently-viewed) (id nav-your-amazon) (id edoc-10349) (id edoc-10350) (id edoc-10351) (id edoc-10352) (id edoc-10353) (id edoc-10354))
   [font-family "arial, sans-serif"]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   #;[cursor pointer])
  ((fake " a.nav-a:visited")
   [font-family "arial, sans-serif"]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   #;[cursor pointer])
  ((class nav-column)
   [float left]
   [clear none])
  ((class nav-column-notfirst)
   [margin-left (px -12)])
  ((id nav-logo)
   [position relative]
   [float left]
   [line-height 0]
   [height (% 100)]
   [width (px 192)]
   [padding-top (px 13)]
   [padding-right (px 18)]
   [padding-bottom (px 0)]
   [padding-left (px 27)])
  ((desc (id nav-logo) (class nav-logo-link))
   [clear both]
   [display inline-block]
   #;[cursor pointer])
  ((desc (id nav-logo) (class nav-logo-base))
   [float left]
   [text-indent (px -500)]
   #;[background-position-x (px -10)]
   #;[background-position-y (px -51)]
   [width (px 97)]
   [height (px 30)])
  ((desc (id nav-logo) (class nav-logo-ext))
   [float left]
   [display none])
  ((desc (id nav-logo) (class nav-logo-locale))
   [float left]
   [display none]
   [margin-top (px 6)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 1)])
  ((desc (id nav-logo) (class nav-logo-tagline))
   [position absolute]
   [top (px 32)]
   [left (px 92)]
   [font-size (px 11)]
   [line-height (px 11)]
   [font-family "arial, sans-serif"]
   #;[white-space nowrap]
   [color (rgb 72 163 198)]
   #;[background-repeat no-repeat]
   #;[background-position-x (px -1000)]
   #;[background-position-y (px 0)]
   #;[text-decoration-line underline]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [font-weight 700])
  ((desc (and (id nav-logo) (class nav-prime-1)) (class nav-logo-tagline))
   #;[background-position-x (px -160)]
   #;[background-position-y (px -10)]
   [width (px 45)]
   [height (px 17)])
  ((class nav-tpl-discoveryPanelList)
   [width (px 210)])
  ((class nav-tpl-discoveryPanelSummary)
   [width (px 210)])
  ((class nav-tpl-itemList)
   [width (px 210)])
  ((desc (class nav-tpl-discoveryPanelList) (class nav-item))
   [position relative]
   [display block]
   [clear both]
   [font-family "arial, sans-serif"]
   [line-height (px 16)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 7)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   #;[cursor default])
  ((desc (class nav-tpl-discoveryPanelSummary) (class nav-item))
   [position relative]
   [display block]
   [clear both]
   [font-family "arial, sans-serif"]
   [line-height (px 16)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 7)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   #;[cursor default])
  ((desc (class nav-tpl-itemList) (class nav-item))
   [position relative]
   [display block]
   [clear both]
   [font-family "arial, sans-serif"]
   [line-height (px 16)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 7)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   #;[cursor default])
  ((desc (class nav-tpl-discoveryPanelList) (class nav-text))
   [display block]
   [font-size (px 13)]
   [color (rgb 68 68 68)]
   [font-weight 400]
   #;[white-space normal]
   #;[overflow-wrap break-word])
  ((desc (class nav-tpl-discoveryPanelSummary) (class nav-text))
   [display block]
   [font-size (px 13)]
   [color (rgb 68 68 68)]
   [font-weight 400]
   #;[white-space normal]
   #;[overflow-wrap break-word])
  ((desc (class nav-tpl-itemList) (class nav-text))
   [display block]
   [font-size (px 13)]
   [color (rgb 68 68 68)]
   [font-weight 400]
   #;[white-space normal]
   #;[overflow-wrap break-word])
  ((desc (class nav-tpl-discoveryPanelList) (class nav-subtext))
   [display block]
   [font-size (px 11)]
   [line-height (px 13)]
   [font-weight 400]
   [color (rgb 153 153 153)]
   #;[white-space normal])
  ((desc (class nav-tpl-discoveryPanelSummary) (class nav-subtext))
   [display block]
   [font-size (px 11)]
   [line-height (px 13)]
   [font-weight 400]
   [color (rgb 153 153 153)]
   #;[white-space normal])
  ((desc (class nav-tpl-itemList) (class nav-subtext))
   [display block]
   [font-size (px 11)]
   [line-height (px 13)]
   [font-weight 400]
   [color (rgb 153 153 153)]
   #;[white-space normal])
  ((desc (class nav-tpl-discoveryPanelList) (class nav-title))
   [padding-bottom (px 10)]
   [left (px 20)])
  ((desc (class nav-tpl-discoveryPanelSummary) (class nav-title))
   [padding-bottom (px 10)]
   [left (px 20)])
  ((desc (class nav-tpl-itemList) (class nav-title))
   [padding-bottom (px 10)]
   [left (px 20)])
  ((desc (class nav-tpl-discoveryPanelList) (class nav-title) (class nav-text))
   [font-size (px 18)]
   [line-height (px 19)]
   [color (rgb 228 121 17)])
  ((desc (class nav-tpl-discoveryPanelSummary) (class nav-title) (class nav-text))
   [font-size (px 18)]
   [line-height (px 19)]
   [color (rgb 228 121 17)])
  ((desc (class nav-tpl-itemList) (class nav-title) (class nav-text))
   [font-size (px 18)]
   [line-height (px 19)]
   [color (rgb 228 121 17)])
  ((desc (class nav-tpl-discoveryPanelList) (class nav-divider))
   [position relative]
   [display block]
   [line-height (px 1)]
   [height (px 1)]
   [overflow-x hidden]
   [overflow-y hidden]
   [background-color (rgb 238 238 238)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 9)]
   [margin-left (px 0)])
  ((desc (class nav-tpl-discoveryPanelSummary) (class nav-divider))
   [position relative]
   [display block]
   [line-height (px 1)]
   [height (px 1)]
   [overflow-x hidden]
   [overflow-y hidden]
   [background-color (rgb 238 238 238)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 9)]
   [margin-left (px 0)])
  ((desc (class nav-tpl-itemList) (class nav-divider))
   [position relative]
   [display block]
   [line-height (px 1)]
   [height (px 1)]
   [overflow-x hidden]
   [overflow-y hidden]
   [background-color (rgb 238 238 238)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 9)]
   [margin-left (px 0)])
  ((id nav-subnav)
   [position relative]
   [display none]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 9)]
   [padding-bottom (px 0)]
   [padding-left (px 15)]
   [overflow-x hidden]
   [overflow-y hidden]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-top-color undefined]
   #;[border-bottom-color undefined]
   #;[white-space nowrap]
   [height (px 33)]
   [background-color (rgb 250 250 250)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((id navFooter)
   [margin-top (px 30)]
   [margin-right (px 0)]
   [margin-bottom (px 8)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 7)]
   [padding-left (px 0)])
  ((desc (id navFooter) (tag table))
   [width (% 100)])
  ((desc (id navFooter) (tag td))
   [font-family "arial, sans-serif"]
   [font-size (px 13)]
   [line-height (% 120)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)])
  ((fake "#navFooter a:link" (id navBackToTop) (id edoc-10576) (id edoc-10577) (id edoc-10578) (id edoc-10579) (id edoc-10580) (id edoc-10581) (id edoc-10582) (id edoc-10583) (id edoc-10584) (id edoc-10585) (id edoc-10586) (id edoc-10587) (id edoc-10588) (id edoc-10589) (id edoc-10590) (id edoc-10591) (id edoc-10592) (id edoc-10593) (id edoc-10594) (id edoc-10595) (id edoc-10596) (id edoc-10597) (id edoc-10598) (id edoc-10599) (id edoc-10600) (id edoc-10601) (id edoc-10602) (id edoc-10603) (id edoc-10604) (id icp-touch-link-language) (id icp-touch-link-country) (id edoc-10605) (id edoc-10606) (id edoc-10607) (id edoc-10608) (id edoc-10609) (id edoc-10610) (id edoc-10611) (id edoc-10612) (id edoc-10613) (id edoc-10614) (id edoc-10615) (id edoc-10616) (id edoc-10617) (id edoc-10618) (id edoc-10619) (id edoc-10620) (id edoc-10621) (id edoc-10622) (id edoc-10623) (id edoc-10624) (id edoc-10625) (id edoc-10626) (id edoc-10627) (id edoc-10628) (id edoc-10629) (id edoc-10630) (id edoc-10631) (id edoc-10632) (id edoc-10633) (id edoc-10634) (id edoc-10635) (id edoc-10636) (id edoc-10637) (id edoc-10638) (id edoc-10639) (id edoc-10640) (id edoc-10641) (id edoc-10642) (id edoc-10643) (id edoc-10644) (id edoc-10645) (id edoc-10646) (id edoc-10647))
   [font-family "arial, sans-serif"]
   [color (rgb 0 75 145)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor])
  ((fake " #navFooter a:visited")
   [font-family "arial, sans-serif"]
   [color (rgb 0 75 145)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor])
  ((desc (id navFooter) (tag a))
   [font-family "arial, sans-serif"]
   #;[white-space nowrap])
  ((desc (id navFooter) (tag span))
   [font-family "arial, sans-serif"]
   #;[white-space nowrap])
  ((desc (class navFooterVerticalColumn) (class navFooterColSpacerInner))
   [width (% 10)]
   [padding-top (px 0)]
   [padding-right (px 15)]
   [padding-bottom (px 0)]
   [padding-left (px 15)])
  ((class navFooterLinkCol)
   [color (rgb 51 51 51)]
   [vertical-align top])
  ((desc (class navFooterLinkCol) (tag ul))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (class navFooterLinkCol) (tag ul) (tag li))
   #;[list-style-type none]
   #;[white-space nowrap]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 8)]
   [margin-left (px 0)])
  ((class navFooterColHead)
   [font-family "arial, sans-serif"]
   [color (rgb 51 51 51)]
   [font-size (px 16)]
   [margin-top (px 6)]
   [margin-right (px 0)]
   [margin-bottom (px 14)]
   [margin-left (px 0)]
   #;[white-space nowrap])
  ((and (tag div) (class navFooterLine))
   [font-family "arial, sans-serif"]
   [color (rgb 118 118 118)]
   [font-size (px 11)]
   [text-align center]
   [line-height (px 18)]
   #;[white-space nowrap])
  ((and (tag div) (class navFooterLogoLine))
   [margin-top (px 30)]
   [margin-right (px 8)]
   [margin-bottom (px 4)]
   [margin-left (px 8)]
   [font-size (px 1)]
   [line-height 0])
  ((desc (id navFooter) (class nav-logo-base))
   #;[background-position-x (px -10)]
   #;[background-position-y (px -90)]
   [width (px 76)]
   [height (px 23)]
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto])
  ((class navFooterLinkLine)
   [margin-top (px 0)]
   [margin-right (px 8)]
   [margin-bottom (px 0)]
   [margin-left (px 8)])
  ((desc (class navFooterLinkLine) (tag span))
   #;[list-style-type none]
   [display inline-block]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (class navFooterLinkLine) (tag ul))
   #;[list-style-type none]
   [display inline-block]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (class navFooterLinkLine) (tag ul) (tag li))
   [display inline])
  ((desc (class navFooterLinkCol) (tag ul) (and (tag li) (class nav_a_carat)))
   [position relative]
   [padding-left (px 0)])
  ((desc (class navFooterLinkCol) (tag ul) (and (tag li) (class nav_a_carat)) (and (tag span) (class nav_a_carat)))
   [top (px 0)]
   [font-size (px 15)]
   [color (rgb 228 121 17)]
   [font-weight 700]
   [line-height (px 15)])
  ((desc (class navFooterLinkCol) (tag ul) (and (tag li) (class nav_a_carat)) (tag a))
   [padding-left (px 4)])
  ((desc (class navFooterPadItemLine) (tag a))
   [padding-top (px 0)]
   [padding-right (em 0.6)]
   [padding-bottom (px 0)]
   [padding-left (em 0.6)])
  ((desc (class navFooterPadItemLine) (tag span))
   [padding-top (px 0)]
   [padding-right (em 0.6)]
   [padding-bottom (px 0)]
   [padding-left (em 0.6)])
  ((class navFooterDescLine)
   [margin-top (px 20)]
   [margin-right (px 0)]
   [margin-bottom (px 14)]
   [margin-left (px 0)])
  ((class navFooterDescSpacer)
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (id navFooter) (class navFooterBackToTop))
   [background-color (rgb 243 243 243)]
   [margin-bottom (px 25)])
  ((desc (id navFooter) (class navFooterBackToTop) (tag span))
   [display block]
   [text-align center]
   [color (rgb 17 17 17)]
   [padding-top (px 15)]
   [padding-right (px 0)]
   [padding-bottom (px 15)]
   [padding-left (px 0)]
   [line-height (px 19)]
   [font-size (px 13)])
  ((desc (id navFooter) (class navFooterDescItem))
   [font-size (px 11) :important]
   [padding-top (px 0)]
   [padding-right (em 0.75)]
   [padding-bottom (px 0)]
   [padding-left (em 0.75)]
   [vertical-align top]
   [text-align left]
   [line-height (% 115)])
  ((class navFooterDescText)
   [font-size (px 10)]
   [color (rgb 118 118 118)]
   [line-height (% 110)]
   [display block]
   [margin-bottom (px 1)])
  ((and (id navFooter) (class navLeftFooter))
   [margin-bottom (px 0)]
   [padding-bottom (px 0)]
   [background-color (rgb 35 47 62)]
   [min-width (px 1000)]
   [position relative])
  ((desc (and (id navFooter) (class navLeftFooter)) (class navFooterVerticalColumn))
   [max-width (px 1000)])
  ((desc (and (id navFooter) (class navLeftFooter)) (class navFooterColHead))
   [font-weight 700]
   [color (rgb 255 255 255)])
  ((fake "#navFooter.navLeftFooter a.nav_a:link" (id edoc-10576) (id edoc-10577) (id edoc-10578) (id edoc-10579) (id edoc-10580) (id edoc-10581) (id edoc-10582) (id edoc-10583) (id edoc-10584) (id edoc-10585) (id edoc-10586) (id edoc-10587) (id edoc-10588) (id edoc-10589) (id edoc-10590) (id edoc-10591) (id edoc-10592) (id edoc-10593) (id edoc-10594) (id edoc-10595) (id edoc-10596) (id edoc-10597) (id edoc-10598) (id edoc-10599) (id edoc-10600) (id edoc-10601) (id edoc-10602) (id edoc-10603) (id edoc-10605) (id edoc-10606) (id edoc-10607) (id edoc-10608) (id edoc-10609) (id edoc-10610) (id edoc-10611) (id edoc-10612) (id edoc-10613) (id edoc-10614) (id edoc-10615) (id edoc-10616) (id edoc-10617) (id edoc-10618) (id edoc-10619) (id edoc-10620) (id edoc-10621) (id edoc-10622) (id edoc-10623) (id edoc-10624) (id edoc-10625) (id edoc-10626) (id edoc-10627) (id edoc-10628) (id edoc-10629) (id edoc-10630) (id edoc-10631) (id edoc-10632) (id edoc-10633) (id edoc-10634) (id edoc-10635) (id edoc-10636) (id edoc-10637) (id edoc-10638) (id edoc-10639) (id edoc-10640) (id edoc-10641) (id edoc-10642) (id edoc-10643) (id edoc-10644) (id edoc-10645) (id edoc-10646) (id edoc-10647))
   [color (rgb 221 221 221)])
  ((fake " #navFooter.navLeftFooter a.nav_a:visited")
   [color (rgb 221 221 221)])
  ((desc (and (id navFooter) (class navLeftFooter)) (and (tag li) (class nav_a_carat)) (and (tag span) (class nav_a_carat)))
   [color (rgb 221 221 221)])
  ((desc (and (id navFooter) (class navLeftFooter)) (class navFooterBackToTop))
   [margin-bottom (px 40)]
   [background-color (rgb 55 71 90)])
  ((desc (and (id navFooter) (class navLeftFooter)) (class navFooterBackToTop) (class navFooterBackToTopText))
   [color (rgb 255 255 255)])
  ((desc (and (id navFooter) (class navLeftFooter)) (class navFooterDescText))
   [color (rgb 153 153 153)])
  ((desc (and (id navFooter) (class navLeftFooter)) (class nav_last))
   [color (rgb 153 153 153)])
  ((desc (and (id navFooter) (class navLeftFooter)) (class nav-footer-line))
   #;[border-top-color (rgb 58 69 83)]
   [border-top-style solid]
   [border-top-width (px 1)]
   [margin-top (px 40)])
  ((desc (and (id navFooter) (class navLeftFooter)) (class navFooterLogoLine))
   [text-align center]
   [max-width (px 1000)]
   [margin-top (px 30)]
   [margin-right auto]
   [margin-bottom (px 15)]
   [margin-left auto])
  ((desc (and (id navFooter) (class navLeftFooter)) (class navFooterPadItemLine))
   [text-align center]
   [max-width (px 1000)]
   [margin-top (px 30)]
   [margin-right auto]
   [margin-bottom (px 15)]
   [margin-left auto])
  ((desc (and (id navFooter) (class navLeftFooter)) (class navFooterLinkLine))
   [margin-top (px 10)]
   [margin-right auto]
   [margin-bottom (px 10)]
   [margin-left auto])
  ((desc (and (id navFooter) (class navLeftFooter)) (and (tag div) (class navFooterLine)))
   [font-size (px 12)])
  ((desc (and (id navFooter) (class navLeftFooter)) (class navFooterDescLine))
   [background-color (rgb 19 26 34)]
   [padding-top (px 30)]
   [padding-right (px 0)]
   [padding-bottom (px 30)]
   [padding-left (px 0)]
   [margin-top (px 30)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id navFooter) (class navLeftFooter)) (class navFooterDescLine) (class navFooterMoreOnAmazon))
   [max-width (px 1000)]
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto])
  ((desc (and (id navFooter) (class navLeftFooter)) (class navFooterLinkCol) (tag ul) (tag li))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 10)]
   [margin-left (px 0)])
  ((desc (and (id navFooter) (class navLeftFooter)) (class navFooterCopyright))
   [background-color (rgb 19 26 34)]
   [max-width (% 100)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 10)]
   [padding-right (px 0)]
   [padding-bottom (px 30)]
   [padding-left (px 0)])
  ((desc (id navFooter) (and (class navAccessibility) (class navFooterLinkCol)))
   [line-height (% 120)])
  ((desc (id navFooter) (and (class navAccessibility) (class navFooterVerticalColumn)))
   [display table]
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto])
  ((desc (id navFooter) (and (class navAccessibility) (class navFooterColSpacerInner)))
   [display table-cell]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)])
  ((desc (id navFooter) (and (class navAccessibility) (class navFooterLinkCol)))
   [display table-cell]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)])
  ((desc (id navFooter) (and (class navAccessibility) (class navFooterVerticalRow)))
   [display table-row])
  ((id nav-swmslot)
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden]
   [height (px 39)]
   [top (px 9)])
  ((id navSwmHoliday)
   #;[background-repeat no-repeat]
   #;[background-position-x right]
   #;[background-position-y bottom]
   #;[border-top-color currentcolor]
   [border-top-style none]
   [border-top-width medium]
   #;[border-left-color currentcolor]
   [border-left-style none]
   [border-left-width medium]
   #;[border-bottom-color currentcolor]
   [border-bottom-style none]
   [border-bottom-width medium]
   #;[border-right-color currentcolor]
   [border-right-style none]
   [border-right-width medium]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   [text-align right]
   #;[background-size inherit])
  ((desc (id navSwmHoliday) (class nav-imageHref))
   [display block]
   [height (% 100)])
  ((id nav-search-label)
   [position relative]
   [display inline-block]
   [float left]
   [line-height (px 35)]
   [color (rgb 51 51 51)]
   [font-weight 700]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 10)]
   [font-family "arial, sans-serif"])
  ((id nav-search)
   [position relative]
   [display block]
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 4)]
   [box-sizing border-box]
   [width auto]
   [margin-top (px 10)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (id nav-search) (class nav-searchbar))
   [display block]
   [position relative]
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 4)])
  ((desc (id nav-search) (class nav-searchbar) (class nav-fill))
   [position relative]
   [height (px 35)])
  ((desc (id nav-search) (class nav-searchbar) (class nav-left))
   [position relative]
   [height (px 35)])
  ((desc (id nav-search) (class nav-searchbar) (class nav-right))
   [position relative]
   [height (px 35)])
  ((desc (id nav-search) (class nav-searchbar) (class nav-right))
   [min-width (px 0)])
  ((desc (id nav-search) (class nav-search-scope))
   [position relative]
   [float left]
   [height (px 35)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-left (px 5)]
   [overflow-x hidden]
   [overflow-y hidden]
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-left-color (rgb 205 205 205)]
   [border-left-style solid]
   [border-left-width (px 1)]
   #;[border-bottom-color (rgb 205 205 205)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   #;[border-right-color (rgb 205 205 205)]
   [border-right-style solid]
   [border-right-width (px 1)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   #;[border-top-color (rgb 189 189 189)]
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 4)]
   #;[background-position-x (px 0)]
   #;[background-position-y (px -532)])
  ((desc (id nav-search) (class nav-search-facade))
   [position relative]
   [float left]
   #;[cursor default]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (id nav-search) (class nav-search-facade) (class nav-search-label))
   [display block]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[white-space nowrap]
   #;[text-overflow ellipsis]
   [color (rgb 102 102 102)]
   [font-size (px 12)]
   [line-height (px 33)]
   [margin-right (px 21)]
   [margin-left (px 5)])
  ((desc (id nav-search) (class nav-search-facade) (class nav-icon))
   [position absolute]
   [top (px 14)]
   [right (px 8)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 4)]
   [border-left-width (px 4)]
   [border-right-width (px 4)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-top-color (rgb 102 102 102)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   [font-size (px 0)]
   [line-height 0])
  ((desc (id nav-search) (class nav-search-dropdown))
   [position absolute]
   [display block]
   [top (px -1)]
   [left (px 0)]
   [height (px 35)]
   [width auto]
   [font-family "arial, sans-serif"]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[cursor pointer]
   #;[opacity 0]
   #;[visibility visible]
   #;[border-top-color currentcolor]
   [border-top-style none]
   [border-top-width (px 0)]
   #;[border-left-color currentcolor]
   [border-left-style none]
   [border-left-width (px 0)]
   #;[border-bottom-color currentcolor]
   [border-bottom-style none]
   [border-bottom-width (px 0)]
   #;[border-right-color currentcolor]
   [border-right-style none]
   [border-right-width (px 0)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   [line-height (px 35)])
  ((desc (id nav-search) (class nav-search-submit))
   [position relative]
   [top (px 0)]
   [right (px 0)]
   [height (px 35)]
   [width (px 42)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[cursor pointer]
   [border-top-style solid]
   [border-top-width (px 1)]
   [border-left-style solid]
   [border-left-width (px 1)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   [border-right-style solid]
   [border-right-width (px 1)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   #;[border-top-color (rgb 72 80 89)]
   #;[border-right-color (rgb 44 49 55)]
   #;[border-bottom-color (rgb 54 60 67)]
   #;[border-left-color (rgb 72 80 89)]
   [background-color (rgb 91 98 106)]
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 0)]
   #;[background-position-x (px 0)]
   #;[background-position-y (px -381)])
  ((desc (id nav-search) (class nav-search-submit) (class nav-search-submit-text))
   [position absolute]
   [left (px 11)]
   [top (px 10)]
   [font-weight 700]
   [color (rgb 255 255 255)]
   [font-size (px 13)]
   [line-height (px 13)]
   [font-family "arial, sans-serif"]
   [vertical-align middle]
   [text-align center]
   #;[text-shadow rgba(0, 0, 0, 0.25) 0px -1px 0px])
  ((desc (id nav-search) (class nav-search-submit) (class nav-input))
   [position relative]
   [display block]
   [height (% 100)]
   [width (% 100)]
   [font-size (px 14)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[cursor pointer]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor]
   [color (rgb 255 255 255)]
   [background-color transparent]
   #;[background-position-x (px 0)]
   #;[background-position-y (px 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   #;[border-top-color currentcolor]
   [border-top-style none]
   [border-top-width medium]
   #;[border-left-color currentcolor]
   [border-left-style none]
   [border-left-width medium]
   #;[border-bottom-color currentcolor]
   [border-bottom-style none]
   [border-bottom-width medium]
   #;[border-right-color currentcolor]
   [border-right-style none]
   [border-right-width medium]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   [text-indent (px -1000)]
   [line-height (px 1)])
  ((desc (id nav-search) (class nav-search-field))
   [position relative]
   [height (px 35)]
   [background-color (rgb 255 255 255)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   #;[border-top-color (rgb 189 189 189)]
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-bottom-color (rgb 205 205 205)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)])
  ((desc (id nav-search) (class nav-search-field) (class nav-input))
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [display block]
   [width (% 100)]
   [line-height (px 15)]
   [padding-top (px 6)]
   [padding-right (px 10)]
   [padding-bottom (px 6)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[border-top-color currentcolor]
   [border-top-style none]
   [border-top-width (px 0)]
   #;[border-left-color currentcolor]
   [border-left-style none]
   [border-left-width (px 0)]
   #;[border-bottom-color currentcolor]
   [border-bottom-style none]
   [border-bottom-width (px 0)]
   #;[border-right-color currentcolor]
   [border-right-style none]
   [border-right-width (px 0)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   [height (px 33)]
   [font-family "arial, sans-serif"]
   [font-size (px 15)]
   [background-color transparent]
   #;[background-position-x (px 0)]
   #;[background-position-y (px 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [color (rgb 17 17 17)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor]
   #;[box-shadow none]
   [text-indent (px 8)])
  ((desc (id nav-search) (id nav-iss-attach))
   [position absolute]
   [bottom (px 0)]
   [left (px 0)]
   [width (% 100)]
   [height (px 0)]
   [line-height 1])
  ((id nav-flyout-iss-anchor)
   [position absolute]
   [bottom (px 0)]
   [left (px 0)]
   [width (% 100)]
   [height (px 0)]
   [line-height 0]
   #;[z-index 100])
  ((id nav-flyout-iss-timeline-anchor)
   [position absolute]
   [bottom (px 0)]
   [left (px 0)]
   [width (% 100)]
   [height (px 0)]
   [line-height 0]
   #;[z-index 100])
  ((id nav-flyout-iss-topCategories-anchor)
   [position absolute]
   [bottom (px 0)]
   [left (px 0)]
   [width (% 100)]
   [height (px 0)]
   [line-height 0]
   #;[z-index 100])
  ((desc (id nav-flyout-iss-anchor) (class nav-issFlyout))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (id nav-flyout-iss-timeline-anchor) (class nav-issFlyout))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (id nav-flyout-iss-topCategories-anchor) (class nav-issFlyout))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((class nav-flyout)
   [position absolute]
   [display none]
   [overflow-x visible :important]
   [overflow-y visible :important]
   [background-color (rgb 255 255 255)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   #;[border-top-color (rgb 187 187 187)]
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-left-color (rgb 187 187 187)]
   [border-left-style solid]
   [border-left-width (px 1)]
   #;[border-bottom-color (rgb 187 187 187)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   #;[border-right-color (rgb 187 187 187)]
   [border-right-style solid]
   [border-right-width (px 1)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   [box-sizing border-box]
   [padding-top (px 14)]
   [padding-right (px 14)]
   [padding-bottom (px 14)]
   [padding-left (px 14)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[box-shadow rgba(0, 0, 0, 0.13) 0px 2px 4px 0px]
   #;[transform translate3d(0px, 0px, 0px)]
   [font-size (px 13)]
   [font-family "arial, sans-serif"]
   [line-height normal])
  ((desc (class nav-flyout) (class nav-arrow))
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-left-width (px 9)]
   [border-bottom-width (px 9)]
   [border-right-width (px 9)]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-left-color transparent]
   [border-top-width (px 0)]
   #;[border-bottom-color (rgb 204 204 204)]
   [width (px 0)]
   [height (px 0)]
   [font-size (px 0)]
   [line-height 0]
   [position absolute]
   [top (px -9)])
  ((desc (class nav-flyout) (class nav-arrow-inner))
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-left-width (px 9)]
   [border-bottom-width (px 9)]
   [border-right-width (px 9)]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-left-color transparent]
   [border-top-width (px 0)]
   #;[border-bottom-color (rgb 255 255 255)]
   [width (px 0)]
   [height (px 0)]
   [font-size (px 0)]
   [line-height 0]
   [position absolute]
   [top (px 1)]
   [left (px -9)])
  ((desc (class nav-flyout) (class nav-spinner))
   [min-height (px 200)]
   [min-width (px 200)])
  ((id nav-flyout-anchor)
   [position absolute]
   [bottom (px 0)]
   [left (px 0)]
   [width (% 100)]
   [height (px 0)]
   [line-height 0]
   #;[z-index 100])
  ((class nav-coreFlyout)
   [margin-top (px -3)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px -2)]
   [padding-bottom (px 7)]
   [width (px 240)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)])
  ((desc (class nav-coreFlyout) (class nav-arrow))
   [margin-left (px -1)])
  ((desc (class nav-fullWidthFlyout) (class nav-flyout-content))
   [min-height (px 120)]
   [width (% 100)])
  ((desc (class nav-fullWidthSubnavFlyout) (class nav-flyout-content))
   [min-height (px 120)]
   [width (% 100)])
  ((class nav-catFlyout)
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[border-top-color (rgb 187 187 187)]
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-left-color (rgb 187 187 187)]
   [border-left-style solid]
   [border-left-width (px 1)]
   #;[border-bottom-color (rgb 187 187 187)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   #;[border-right-color (rgb 187 187 187)]
   [border-right-style solid]
   [border-right-width (px 1)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1])
  ((desc (class nav-catFlyout) (class nav-spinner))
   [min-height (px 200)])
  ((desc (class nav-catFlyout) (class nav-promo))
   [position absolute]
   [bottom (px -15)]
   [right (px 0)]
   #;[border-top-color currentcolor]
   [border-top-style none]
   [border-top-width medium]
   #;[border-left-color currentcolor]
   [border-left-style none]
   [border-left-width medium]
   #;[border-bottom-color currentcolor]
   [border-bottom-style none]
   [border-bottom-width medium]
   #;[border-right-color currentcolor]
   [border-right-style none]
   [border-right-width medium]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   [margin-right (px 0)]
   [max-width none]
   [margin-bottom (px 14)])
  ((desc (class nav-catFlyout) (class nav-flyout-content))
   [float left]
   [clear none]
   [width (px 238)]
   [padding-top (px 14)]
   [padding-right (px 0)]
   [padding-bottom (px 8)]
   [padding-left (px 0)])
  ((desc (class nav-catFlyout) (class nav-flyout-content) (class nav-item))
   [position relative]
   [margin-top (px 0)]
   [margin-right (px 8)]
   [margin-bottom (px 0)]
   [margin-left (px 14)]
   #;[text-overflow ellipsis]
   [padding-right (px 8)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor])
  ((desc (class nav-catFlyout) (class nav-flyout-content) (class nav-hasPanel) (class nav-text))
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis])
  ((desc (class nav-catFlyout) (class nav-flyout-content) (class nav-hasPanel) (class nav-badge))
   #;[text-transform uppercase]
   [color (rgb 255 255 255)]
   [background-color (rgb 80 156 38)]
   [padding-top (px 1)]
   [padding-right (px 4)]
   [padding-bottom (px 1)]
   [padding-left (px 4)]
   #;[border-top-left-radius (px 5)]
   #;[border-top-right-radius (px 5)]
   #;[border-bottom-right-radius (px 5)]
   #;[border-bottom-left-radius (px 5)]
   [font-size (px 10)]
   [font-weight 700]
   [margin-left (px 5)]
   [display inline-block])
  ((desc (class nav-catFlyout) (class nav-flyout-content) (class nav-divider))
   [margin-top (px 0)]
   [margin-right (px 7)]
   [margin-bottom (px 9)]
   [margin-left (px 14)])
  ((desc (class nav-catFlyout) (class nav-subcats))
   [position relative]
   [float left]
   [display none]
   [margin-left (px 3)]
   #;[border-left-color (rgb 238 238 238)]
   [border-left-style solid]
   [border-left-width (px 1)]
   [overflow-x hidden]
   [overflow-y hidden]
   [clear none])
  ((desc (class nav-catFlyout) (class nav-subcat))
   [position relative]
   [display none]
   [padding-top (px 15)]
   [width auto]
   [height (% 100)])
  ((desc (class nav-catFlyout) (class nav-subcat) (class nav-item))
   [left (px 20)]
   [width (px 220)])
  ((desc (class nav-catFlyout) (class nav-subcat) (class nav-panel))
   [width (px 220)]
   [margin-right (px 27)])
  ((desc (class nav-catFlyout) (class nav-subcat) (class nav-panel) (class nav-link))
   [left (px 20)])
  ((desc (class nav-catFlyout) (class nav-subcat) (class nav-divider))
   [margin-top (px 0)]
   [margin-right (px 7)]
   [margin-bottom (px 9)]
   [margin-left (px 20)]
   [width (px 220)])
  ((desc (class nav-catFlyout) (class nav-colcount-2))
   [width (px 499)])
  ((id nav-flyout-cart)
   [margin-top (px -2)])
  ((id nav-flyout-fresh)
   [margin-top (px -2)])
  ((id nav-flyout-genzFresh)
   [margin-top (px -2)])
  ((id nav-flyout-genzMusic)
   [margin-top (px -2)])
  ((id nav-flyout-genzPrime)
   [margin-top (px -2)])
  ((id nav-flyout-genzVideo)
   [margin-top (px -2)])
  ((id nav-flyout-prime)
   [margin-top (px -2)])
  ((id nav-flyout-shopAll)
   [margin-top (px -2)])
  ((id nav-flyout-wishlist)
   [margin-top (px -2)])
  ((id nav-flyout-yourAccount)
   [margin-top (px -2)])
  ((id nav-flyout-transientFlyout)
   [margin-top (px 8)]
   [width auto]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (id nav-flyout-transientFlyout) (class nav-arrow))
   [margin-left (px -9)])
  ((desc (id nav-flyout-fresh) (class nav-arrow))
   [margin-left (px -1)])
  ((desc (id nav-flyout-shopAll) (class nav-arrow))
   [margin-left (px -1)])
  ((id nav-flyout-timeline)
   [margin-top (px 4)])
  ((desc (id nav-flyout-timeline) (class nav-arrow))
   [margin-left (px 0)])
  ((id nav-flyout-accountList)
   [width (px 500)])
  ((desc (id nav-flyout-accountList) (id nav-al-container))
   [width (px 460)]
   [float right])
  ((desc (id nav-flyout-accountList) (id nav-al-your-account))
   [float left]
   #;[border-left-color (rgb 238 238 238)]
   [border-left-style solid]
   [border-left-width (px 1)]
   [padding-left (px 20)])
  ((desc (id nav-flyout-accountList) (id nav-al-wishlist))
   [float left]
   [margin-right (px 20)])
  ((desc (id nav-flyout-accountList) (class nav-title))
   [font-size (px 16)]
   [font-weight 700])
  ((desc (id nav-flyout-accountList) (class nav-al-column))
   [float left])
  ((id nav-flyout-wl-alexa)
   [display none]
   #;[border-bottom-color (rgb 238 238 238)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   [margin-bottom (px 8)])
  ((id nav-flyout-wl-items)
   [display none]
   #;[border-bottom-color (rgb 238 238 238)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   [margin-bottom (px 8)])
  ((and (id nav-flyout-wl-alexa) (class nav-spinner))
   [min-height (px 50)])
  ((and (id nav-flyout-wl-items) (class nav-spinner))
   [min-height (px 50)])
  ((id nav-flyout-prime)
   [box-sizing content-box])
  ((desc (id nav-flyout-prime) (class nav-flyout-content))
   [box-sizing content-box]
   [width auto]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [min-width (px 200)])
  ((id nav-recently-viewed)
   [margin-bottom (px 20)]
   [height (px 17)])
  ((id nav-upnav)
   [margin-top (px 0)]
   [margin-right (px -8)]
   [margin-bottom (px 0)]
   [margin-left (px -8)])
  ((desc (and (tag html) (class a-js)) (tag body) (id nav-upnav))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (tag html) (class a-no-js)) (tag body) (id nav-upnav))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (id nav-upnav) (class nav-a))
   [display block]
   [width (% 100)]
   [height (% 100)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color currentcolor])
  ((desc (id nav-upnav) (class nav-spanAltText))
   [height (px 1)]
   [width (px 1)]
   [position absolute]
   [top (px -10000)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (class nav-packard-glow) (id nav-global-location-slot))
   [float left]
   [padding-top (px 6)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [margin-top (px 2)]
   [width (px 192)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (class nav-packard-glow) (id nav-global-location-slot) (class nav-a))
   [line-height (px 44)]
   [height (px 44)]
   [position relative]
   [float left]
   [top (px 1)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 10)])
  ((desc (class nav-packard-glow) (id nav-global-location-slot) (class nav-a-2))
   [padding-right (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   [top (px 1)]
   [margin-top (px 0)]
   [margin-right (px 1)]
   [margin-bottom (px 0)]
   [margin-left (px 1)]
   [display inline-block]
   [box-sizing border-box])
  ((desc (class nav-packard-glow) (id nav-global-location-slot) (class nav-a-2) (class nav-line-1))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 11)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (class nav-packard-glow) (id nav-global-location-slot) (class nav-a-2) (class nav-line-2))
   [float left]
   [clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 11)]
   [font-family "arial, sans-serif"]
   [color (rgb 0 0 0)])
  ((desc (class nav-packard-glow) (id nav-global-location-slot) (class nav-a-2) (class nav-line-1))
   [font-size (px 12)]
   [line-height (px 14)]
   [height (px 14)]
   [font-weight 400]
   [margin-top (px 9)])
  ((desc (class nav-packard-glow) (id nav-global-location-slot) (class nav-a-2) (class nav-line-2))
   [font-size (px 14)]
   [line-height (px 15)]
   [font-weight 700]
   [padding-bottom (px 5)])
  ((desc (class nav-packard-glow) (id nav-global-location-slot) (id nav-packard-glow-loc-icon))
   [position absolute]
   [width (px 22)]
   [height (px 22)]
   #;[background-position-x (px -68)]
   #;[background-position-y (px -340)]
   [left (px 2)]
   [top (px 13)])
  ((desc (class nav-packard-glow) (id nav-global-location-slot) (id glow-ingress-block))
   [margin-left (px 17)])
  ((desc (class nav-packard-glow) (id nav-shop))
   [padding-top (px 6)]
   [padding-right (px 15)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [width auto])
  ((desc (class nav-packard-glow) (id nav-xshop-container))
   [position static]
   [float none]
   [padding-top (px 2)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((id nav-packard-glow-loc-icon)
   [position absolute]
   [width (px 22)]
   [height (px 22)]
   #;[background-position-x (px -68)]
   #;[background-position-y (px -340)]
   [left (px 4)]
   [top (px 39)])
  ((desc (id navbar) (id nav-search-submit-text))
   [left (px 12)]
   [color (rgb 17 17 17)]
   [top (px 11)]
   #;[text-shadow none])
  ((desc (id navbar) (and (id nav-search-submit-text) (class nav-sprite)))
   #;[background-position-x (px -40)]
   #;[background-position-y (px -290)]
   [width (px 21)]
   [height (px 21)]
   [text-indent (px -500)]
   [top (px 7)])
  ((and (id navbar) (class nav-bluebeacon))
   [background-color (rgb 35 47 62)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-belt))
   [background-color (rgb 35 47 62)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-main))
   #;[background-image none]
   [background-color (rgb 35 47 62)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-logo))
   [width (px 192)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-search-label))
   [top (px 1)]
   [font-weight 400])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-xshop) (class nav-a))
   [color (rgb 204 204 204)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-xshop) (id nav-your-amazon) (id nav-your-amazon-text))
   [display inline-block])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-xshop) (id nav-your-amazon) (id nav-your-amazon-text) (class nav-shortened-name))
   [max-width (px 60)]
   [display inline-block]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis]
   #;[white-space nowrap]
   [vertical-align top]
   [height (px 12.5)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-search-label))
   [color (rgb 255 255 255)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (class nav-a-2) (class nav-line-1))
   [color (rgb 255 255 255)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (class nav-a-2) (class nav-line-2))
   [color (rgb 255 255 255)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-tools) (class nav-line-1))
   [color (rgb 204 204 204)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-xshop) (class nav-line-1))
   [color (rgb 204 204 204)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-cart-count))
   [color (rgb 240 136 4)]
   [top (px 7)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-ewc-cart-count))
   [color (rgb 240 136 4)]
   [top (px 7)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-search) (class nav-search-facade))
   [top (px 1)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-search) (class nav-fill))
   [height (px 35)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-search) (class nav-search-scope))
   [background-color (rgb 243 243 243)]
   #;[background-image none]
   #;[border-left-color (rgb 243 243 243)]
   [border-left-style solid]
   [border-left-width (px 1)]
   #;[border-top-color (rgb 243 243 243)]
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-bottom-color (rgb 243 243 243)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-search) (class nav-search-field))
   #;[border-left-color currentcolor]
   [border-left-style none]
   [border-left-width medium]
   #;[border-bottom-color currentcolor]
   [border-bottom-style none]
   [border-bottom-width medium]
   #;[border-right-color currentcolor]
   [border-right-style none]
   [border-right-width medium]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   #;[border-top-color transparent]
   [border-top-style solid]
   [border-top-width (px 1)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-search) (class nav-search-submit))
   [background-color (rgb 254 189 105)]
   #;[background-image none]
   #;[border-top-color currentcolor]
   [border-top-style none]
   [border-top-width medium]
   #;[border-left-color currentcolor]
   [border-left-style none]
   [border-left-width medium]
   #;[border-bottom-color currentcolor]
   [border-bottom-style none]
   [border-bottom-width medium]
   #;[border-right-color currentcolor]
   [border-right-style none]
   [border-right-width medium]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   [width (px 45)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (id nav-search) (and (id nav-search-submit-text) (class nav-sprite)))
   #;[background-position-x (px -10)]
   #;[background-position-y (px -290)]
   [width (px 21)]
   [height (px 21)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (class nav-logo-tagline))
   [color (rgb 72 163 198)])
  ((desc (id rhf) (class rhf-frame))
   [display none]
   [min-width (px 940)]
   [position relative])
  ((desc (id rhf) (class rhf-border))
   #;[border-top-color (rgb 221 221 221)]
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-left-color (rgb 221 221 221)]
   [border-left-style solid]
   [border-left-width (px 1)]
   #;[border-bottom-color (rgb 221 221 221)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   #;[border-right-color (rgb 221 221 221)]
   [border-right-style solid]
   [border-right-width (px 1)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   #;[border-top-left-radius (px 5)]
   #;[border-top-right-radius (px 5)]
   #;[border-bottom-right-radius (px 5)]
   #;[border-bottom-left-radius (px 5)]
   [padding-top (px 0)]
   [padding-right (px 20)]
   [padding-bottom (px 0)]
   [padding-left (px 20)])
  ((desc (id rhf) (class rhf-header))
   [color (rgb 68 68 68)]
   [font-weight 400]
   [padding-top (px 10)]
   [padding-right (px 10)]
   [padding-bottom (px 3)]
   [padding-left (px 10)]
   #;[white-space nowrap])
  ((desc (id rhf) (class rhf-header))
   [font-size (px 20)]
   [text-align left]
   [display inline-block])
  ((desc (id rhf) (class rhf-loading-outer))
   [height (px 248)]
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative]
   [margin-top (px 10)]
   [width (% 100) :important])
  ((fake "#rhf .rhf-loading-outer[class]" (id edoc-10666))
   [display table]
   [position static])
  ((desc (id rhf) (class rhf-loading-middle))
   [height (% 100)]
   [width (% 100) :important])
  ((desc (id rhf) (class rhf-loading-inner))
   [text-align center]
   [vertical-align middle])
  ((desc (id rhf) (class rhf-footer))
   [padding-bottom (px 14)])
  ((desc (id rhf) (class rvi-container))
   [height (px 75)]
   [line-height (px 75)]
   [overflow-x hidden]
   [overflow-y hidden]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   [position relative])
  ((desc (id rhf) (class rhf-footer) (class ybh-edit))
   [float right]
   [margin-top (px 18)]
   [padding-left (px 40)]
   [padding-right (px 10)])
  ((desc (id rhf) (class ybh-edit) (class ybh-edit-arrow))
   [display inline-block]
   [font-weight 700]
   [line-height (px 11)]
   [vertical-align top])
  ((desc (id rhf) (class ybh-edit) (class ybh-edit-link))
   [display inline-block]
   [font-weight 700]
   [line-height (px 11)]
   [vertical-align top])
  ((desc (id rhf) (class ybh-edit) (class ybh-edit-arrow))
   [color (rgb 204 153 0)]
   [font-size (px 11)]
   [margin-top (px -2)]
   [padding-right (px 8)])
  ((desc (id rhf) (class ybh-edit) (class ybh-edit-link))
   [font-size (px 10)]
   [width (px 80)])
  ((desc (id rhf) (class rvi-container) (class no-rvi-message))
   [color (rgb 0 0 0)]
   [float left]
   [font-size (px 13)]
   [font-style italic])
  ((class icp-color-base)
   [color (rgb 17 17 17)])
  ((desc (and (id navFooter) (class navLeftFooter)) (class icp-color-base))
   [color (rgb 204 204 204)])
  ((desc (and (tag footer) (class nav-ftr-batmobile)) (class icp-color-base))
   [color (rgb 204 204 204)])
  ((class icp-nav-link-inner)
   [padding-right (px 11)]
   [margin-left (px -16)]
   [display inline-block])
  ((class icp-nav-link-border)
   #;[border-right-color (rgb 85 85 85)]
   [border-right-style solid]
   [border-right-width (px 1)]
   [display inline-block]
   [margin-bottom (px 5)]
   [width (px 1)]
   [height (px 29)])
  ((class icp-nav-language)
   [position relative]
   [top (px -3)]
   [left (px 5)])
  ((class icp-nav-globe-img-2)
   [position relative]
   [top (px 15)]
   [left (px 24)]
   [background-color transparent]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image url("https://m.media-amazon.com/images/G/01/AUIClients/InternationalCustomerPreferencesNavAssets-icp_sprite-7d1bfde38eb13748605e178896ede63a4aa68e0c._V2_.png")]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   #;[background-position-x (px -77)]
   #;[background-position-y (px -24)]
   [display inline-block]
   [width (px 14)]
   [height (px 14)])
  ((desc (class icp-nav-link-inner) (class nav-arrow))
   [position relative]
   [left (px 38)])
  ((desc (class icp-nav-link-inner) (class nav-line-2))
   [position relative]
   [left (px -7)])
  ((class icp-button-globe-2)
   [width (px 15)]
   [height (px 15)]
   #;[background-position-x (px -76)]
   #;[background-position-y (px -51)]
   [top (px 2)]
   [left (px 0)])
  ((class icp-flag-3)
   [width (px 18)]
   [position relative]
   [top (px 2)]
   [display inline-block]
   [height (px 12)]
   [margin-top (px 0)]
   [margin-right (em 0.6)]
   [margin-bottom (px 0)]
   [margin-left (em 0.6)]
   #;[background-image url("https://m.media-amazon.com/images/G/01/AUIClients/InternationalCustomerPreferencesNavAssets-icp_sprite-7d1bfde38eb13748605e178896ede63a4aa68e0c._V2_.png")])
  ((desc (class icp-container-desktop) (class icp-flag-2))
   [margin-top (px 3)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [top (px 1)])
  ((desc (class icp-container-desktop) (class icp-flag-3))
   [margin-top (px 3)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [top (px 1)])
  ((and (class nav-arrow) (class icp-up-down-arrow))
   [background-color transparent]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image url("https://m.media-amazon.com/images/G/01/AUIClients/InternationalCustomerPreferencesNavAssets-icp_sprite-7d1bfde38eb13748605e178896ede63a4aa68e0c._V2_.png")]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [width (px 12)]
   [height (px 12)]
   #;[background-position-x (px -77)]
   #;[background-position-y (px -80)]
   [position relative]
   [left (px 12)])
  ((desc (class icp-container-desktop) *)
   [box-sizing border-box])
  ((and (tag span) (class icp-container-desktop))
   [vertical-align top]
   [margin-top (px 18)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left (px 70)])
  ((desc (class icp-container-desktop) (class icp-button))
   [display inline-block :important]
   #;[border-top-color (rgb 132 134 136)]
   [border-top-style solid]
   [border-top-width (px 1)]
   #;[border-left-color (rgb 132 134 136)]
   [border-left-style solid]
   [border-left-width (px 1)]
   #;[border-bottom-color (rgb 132 134 136)]
   [border-bottom-style solid]
   [border-bottom-width (px 1)]
   #;[border-right-color (rgb 132 134 136)]
   [border-right-style solid]
   [border-right-width (px 1)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   [padding-top (px 6)]
   [padding-right (px 18)]
   [padding-bottom (px 6)]
   [padding-left (px 8)]
   [font-size (px 13)]
   [margin-right (px 4)])
  ((id pageContent)
   [max-width (px 1500)]
   [min-width (px 1000)]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (id pageContent) (tag hr))
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [height (px 1)]
   [background-color (rgb 238 238 238)]
   [color (rgb 238 238 238)]
   #;[border-top-color currentcolor]
   [border-top-style none]
   [border-top-width medium]
   #;[border-left-color currentcolor]
   [border-left-style none]
   [border-left-width medium]
   #;[border-bottom-color currentcolor]
   [border-bottom-style none]
   [border-bottom-width medium]
   #;[border-right-color currentcolor]
   [border-right-style none]
   [border-right-width medium]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1])
  ((class billboardRow)
   [margin-bottom (px 15)])
  ((desc (id pageContent) (class billboardrow-hr))
   [margin-bottom (px 20)])
  ((desc (id pageContent) (class sidebar) (tag hr))
   [width (% 100)]
   [margin-top (px 15)]
   [margin-right (px 0)]
   [margin-bottom (px 15)]
   [margin-left (px 0)])
  ((desc (id sidebar) (tag hr))
   [width (% 100)]
   [margin-top (px 15)]
   [margin-right (px 0)]
   [margin-bottom (px 15)]
   [margin-left (px 0)])
  ((desc (id pageContent) (class sidebar) (and (tag hr) (class desktop-ad-atf-hr)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 15)]
   [margin-left (px 0)])
  ((desc (id sidebar) (and (tag hr) (class desktop-ad-atf-hr)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 15)]
   [margin-left (px 0)])
  ((class billboardRowWrapper)
   [padding-top (px 12)]
   [padding-right (px 0)]
   [padding-bottom (px 12)]
   [padding-left (px 0)])
  ((class adcenterRowWrapper)
   [padding-top (px 6)]
   [padding-right (px 12)]
   [padding-bottom (px 18)]
   [padding-left (px 12)])
  ((desc (id a-page) (class billboardRow))
   [background-color transparent]
   #;[background-position-x center]
   #;[background-position-y center]
   #;[background-repeat repeat-y]
   #;[background-attachment scroll]
   #;[background-image url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVQIW2N8/vz5fwAJKAO2z0UyAQAAAABJRU5ErkJggg==")]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (id a-page) (class billboardRow) (and (tag a) (class a-link-normal)))
   [max-width (px 440)]
   [min-width (px 330)]
   [display block]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto])
  ((desc (id a-page) (class billboardRow) (tag img))
   [max-height (px 200)]
   [height (% 100)])
  ((id desktop-editorial)
   [vertical-align middle]
   [display inline-block]
   [width (% 100)]
   [height (% 100)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   [max-height (px 200)]
   [min-height (px 150)]
   [text-align center]
   [overflow-x hidden]
   [overflow-y hidden])
  ((class billboard)
   [vertical-align middle]
   [display inline-block]
   [width (% 100)]
   [height (% 100)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   [max-height (px 200)]
   [min-height (px 150)]
   [text-align center]
   [overflow-x hidden]
   [overflow-y hidden])
  ((id desktop-editorial)
   [max-height (% 100)])
  ((desc (id desktop-editorial) (tag img))
   [width (% 100)])
  ((desc (id pageContent) (class sidebar))
   [float right :important])
  ((desc (id pageContent) (class sidebar))
   [position relative]
   [padding-top (px 10)]
   [padding-right (px 23)]
   [padding-bottom (px 10)]
   [padding-left (px 23)]
   [background-color (rgb 255 255 255)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((id sidebar)
   [position relative]
   [padding-top (px 10)]
   [padding-right (px 23)]
   [padding-bottom (px 10)]
   [padding-left (px 23)]
   [background-color (rgb 255 255 255)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((class displayAd)
   [height (px 277)])
  ((child (id gw-content-grid-bottom) (tag div))
   [background-color transparent]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image linear-gradient(to left, rgba(0, 0, 0, 0.024), rgba(0, 0, 0, 0.024) 310px, rgb(255, 255, 255) 310px)]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((child (id gw-content-grid-top) (tag div))
   [background-color transparent]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image linear-gradient(to left, rgba(0, 0, 0, 0.024), rgba(0, 0, 0, 0.024) 310px, rgb(255, 255, 255) 310px)]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((id btfContent)
   [padding-top (px 5)]
   [padding-right (px 20)]
   [padding-bottom (px 0)]
   [padding-left (px 20)])
  ((class btfContent)
   [padding-top (px 5)]
   [padding-right (px 20)]
   [padding-bottom (px 0)]
   [padding-left (px 20)])
  ((class bestsellers)
   [width (% 100)])
  ((class desktop-row)
   [width (% 100)])
  ((class sidekick)
   [width (% 100)])
  ((class displayAd)
   [padding-top (px 5)]
   [width (px 300)]
   [position relative]
   [margin-left (px -18)]
   #;[z-index 3]
   [background-color (rgb 255 255 255)])
  ((desc (class displayAd) (tag a))
   [top (px -5) :important]
   [right (px 0) :important])
  ((class gw-spinner)
   [background-color transparent]
   #;[background-position-x (% 50)]
   #;[background-position-y (% 50)]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-image url("https://m.media-amazon.com/images/G/01/AUIClients/AmazonGatewayAuiAssets-loading_spinner-1af74fe87992c48b734d5c68f8ab795e0e9e3759._V2_.gif")]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [display inline-block]
   [vertical-align top]
   [width (px 70)]
   [height (px 70)])
  ((class gw-loading-stripe)
   [background-color transparent]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-image url("https://m.media-amazon.com/images/G/01/AUIClients/AmazonGatewayAuiAssets-loading_stripe-6e2e2549824f90e7ebf588143008d35ffb8498ab._V2_.gif")]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [display inline-block]
   [vertical-align top]
   [width (px 900)]
   [height (px 3)])
  ((and (tag div) (class feed-carousel))
   [width (% 100)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 5)]
   [margin-left (px 0)]
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (class feed-carousel) (class feed-carousel-viewport))
   [width (% 100)]
   [min-height (px 220)]
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (class feed-carousel) (class feed-carousel-card))
   [vertical-align top]
   [min-height (px 200)])
  ((desc (class feed-carousel) (class feed-carousel-shelf))
   [display inline-block]
   [position relative]
   [left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 14)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (class feed-carousel) (class spinner))
   [display none]
   [background-color (rgb 255 255 255)]
   [position absolute]
   [line-height (% 100)]
   [left (px 0)]
   [right (px 0)]
   [top (px 0)]
   [bottom (px 0)]
   [text-align center]
   [padding-top (px 50)])
  ((desc (class feed-carousel) (class feed-carousel-control))
   [position absolute]
   [top (px 55)]
   [background-color (rgb 255 255 255)]
   [height (px 100)]
   [line-height (px 100)]
   [width (px 45)]
   [text-align center]
   #;[box-shadow rgb(136, 136, 136) 0px 1px 3px]
   [display none])
  ((desc (class feed-carousel) (class feed-left))
   [left (px 0)]
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 0)]
   #;[clip rect(-10px, 55px, 110px, 0px)]
   [padding-right (px 5)])
  ((desc (class feed-carousel) (class feed-right))
   [right (px 0)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 3)]
   #;[clip rect(-10px, 45px, 110px, -10px)]
   [padding-left (px 5)])
  ((desc (class feed-carousel) (class feed-arrow))
   [display inline-block]
   [line-height normal]
   [vertical-align top]
   [position relative]
   [top (% 50)]
   [height (px 22)]
   [width (px 13)]
   [margin-top (px -11)])
  ((desc (class feed-carousel) (class feed-scrollbar))
   [display block]
   [position absolute]
   [height (px 6)]
   [bottom (px 0)]
   [left (px 0)]
   [width (% 100)]
   [font-size (px 0)])
  ((desc (class feed-carousel) (class feed-scrollbar-track))
   [display block]
   [background-color (rgb 238 238 238)]
   [height (px 1)]
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 4)]
   [width (% 100)]
   [position relative]
   [top (px 2)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (class feed-carousel) (class feed-scrollbar-thumb))
   [display none]
   [background-color (rgb 170 170 170)]
   [height (px 6)]
   #;[border-top-left-radius (px 6)]
   #;[border-top-right-radius (px 6)]
   #;[border-bottom-right-radius (px 6)]
   #;[border-bottom-left-radius (px 6)]
   [width (px 0)]
   [position absolute]
   [top (px -2)]
   [left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[cursor pointer])
  ((class fresh-shoveler)
   [padding-top (px 10)]
   [padding-right (px 20)]
   [padding-bottom (px 10)]
   [padding-left (px 20)])
  ((desc (class fresh-shoveler) (class as-title-block))
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-top (px 10)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (class fresh-shoveler) (class as-title-block) (class a-color-base))
   [color (rgb 68 68 68) :important])
  ((desc (class fresh-shoveler) (class as-title-block-left))
   [display block]
   [width auto]
   [float left]
   [font-size (px 21)]
   [line-height 1.5]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis]
   [font-weight 400]
   [padding-bottom (px 0)])
  ((desc (class fresh-shoveler) (class as-title-block-right) (tag a))
   [color (rgb 36 123 189)])
  ((desc (class fresh-shoveler) (class as-title-block-right))
   [display block]
   [width auto]
   [float left]
   [text-align right]
   [font-size (px 14)]
   [vertical-align middle]
   [padding-left (px 15)]
   [line-height (px 35)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis])
  ((desc (class fresh-shoveler) (class feed-carousel-card))
   [text-align center]
   [min-width (px 145)]
   [max-width (px 270)]
   [max-height (px 200)]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [position relative])
  ((desc (class fresh-shoveler) (class feed-carousel) (class feed-carousel-card) (class product-image))
   [width auto]
   [height auto]
   [max-width (px 270)]
   [max-height (px 200)]
   [vertical-align middle])
  ((desc (class fresh-shoveler) (class feed-carousel) (class feed-carousel-card))
   [display none])
  ((id gw-asin-popover)
   [width (% 100)]
   [height (% 100)]
   [background-color (rgb 255 255 255)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (% 3)]
   [padding-right (% 3)]
   [padding-bottom (% 3)]
   [padding-left (% 3)]
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative])
  ((desc (id gw-asin-popover) (class content))
   [height (% 100)])
  ((desc (id gw-asin-popover) (class detailblock))
   [height (% 100)])
  ((id gw-popover-wrapper)
   [height (% 100)])
  ((desc (id gw-asin-popover) (class detailblock))
   [position relative]
   #;[z-index 2])
  ((desc (id gw-asin-popover) (class details))
   [width (% 35)]
   [display inline-block]
   [vertical-align middle])
  ((desc (id gw-asin-popover) (class imgblock))
   [background-color (rgb 255 255 255)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [display block]
   [margin-right (% 3)]
   [width (% 60)]
   [height (% 100)]
   [text-align center]
   [overflow-x hidden]
   [overflow-y hidden]
   [float left]
   [position relative]
   #;[z-index 3])
  ((desc (id gw-asin-popover) (and (tag img) (class product-image)))
   [max-width (% 100)]
   [max-height (% 100)]
   [width auto]
   [height auto]
   [vertical-align middle]
   [color transparent])
  ((desc (id gw-asin-popover) (class title))
   [display block]
   [color (rgb 17 17 17)]
   [font-size (px 24)]
   [line-height 1.33]
   [margin-bottom (px 12)]
   [overflow-x hidden]
   [overflow-y hidden]
   [max-height (em 4)])
  ((desc (id gw-asin-popover) (class byline))
   [font-size (px 18)]
   [line-height 1.5]
   #;[white-space nowrap]
   #;[text-overflow ellipsis]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (id gw-asin-popover) (class pricing))
   [font-size (px 22)]
   [margin-bottom (px 28)])
  ((desc (id gw-asin-popover) (class pricing) (class ppu))
   [color (rgb 153 153 153) :important]
   [font-size (px 12) :important])
  ((desc (id gw-asin-popover) (class pricing) (class ppu) (class a-color-price))
   [color (rgb 153 153 153) :important]
   [font-size (px 12) :important])
  ((desc (id gw-asin-popover) (class reviews))
   [display block]
   [font-size (px 16)]
   [vertical-align middle]
   [margin-bottom (px 36)]
   [min-height (em 1.2)])
  ((desc (id gw-asin-popover) (class reviews) (class a-icon-star-medium))
   [vertical-align middle])
  ((desc (id gw-asin-popover) (class pricing) (class price))
   [color (rgb 17 17 17) :important])
  ((desc (id gw-asin-popover) (class pricing) (class price) (class a-color-price))
   [color (rgb 17 17 17) :important])
  ((desc (id gw-asin-popover) (class a-button))
   [width (% 100)]
   [max-width (px 210)])
  ((desc (id gw-asin-popover) (class loading))
   [position absolute]
   [top (% 50)]
   [left (px 0)]
   [right (px 0)]
   [margin-top (px -50)]
   [text-align center]
   [display none])
  ((desc (id gw-asin-popover) (class close-icon))
   [height (px 36)]
   [width (px 36)]
   #;[background-position-x (px -96)]
   #;[background-position-y (px -46)]
   [position absolute]
   [top (px 10)]
   [right (px 10)]
   #;[cursor pointer]
   #;[opacity 0.5]
   #;[z-index 4])
  ((id gw-quick-look-btn)
   [display none]
   [position absolute]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 7)]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto]
   [width (% 95)]
   [max-width (px 180)])
  ((desc (class feed-carousel) (class feed-carousel-card) (class a-list-item))
   [text-align center]
   [position relative]
   [display inline-block]
   [min-width (px 145)])
  ((id gw-asin-popover)
   [height (% 70)])
  ((id sims-section)
   [height (% 30)])
  ((class sims-container)
   [height (px 141)]
   [width (% 100)])
  ((class sims-wrapper)
   [background-color (rgb 242 242 242)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [height (px 2)]
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative])
  ((class sims-header)
   [padding-top (px 15)]
   [position relative]
   #;[z-index 2])
  ((class sims-header-text)
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [display block]
   [text-align center]
   #;[white-space nowrap])
  ((class sims-loading)
   [height (px 2)])
  ((class sims-details)
   [overflow-x hidden]
   [overflow-y hidden]
   [height (% 100)]
   [margin-left (px 10)])
  ((class cropped-image-map-size)
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden]
   [width (% 100)])
  ((class cropped-image-map-center-alignment)
   [text-align center]
   [position absolute]
   [top (px 0)]
   [right (% -200)]
   [bottom (px 0)]
   [left (% -200)])
  ((desc (class cropped-image-map-size) (tag img))
   [max-width none])
  ((desc (class scalable-image-map) (and (tag a) (class a-link-normal)))
   [display inline-block])
  ((desc (class gw-ftGr-desktop-hero) (class gw-hero-image) (class cropped-image-map-size) (tag img))
   [height (px 300) :important]
   [width (px 1500) :important])
  ((desc (class gw-ftGr-desktop-hero) (class image-map) (class cropped-image-map-size) (tag img))
   [height (px 300) :important]
   [width (px 1500) :important])
  ((desc (id gw-desktop-herotator) (class gw-hero-image) (class cropped-image-map-size))
   [height (px 300) :important]
   [width (% 100) :important])
  ((desc (id gw-desktop-herotator) (class image-map) (class cropped-image-map-size))
   [height (px 300) :important]
   [width (% 100) :important])
  ((id gw-desktop-herotator)
   [position relative])
  ((desc (id gw-desktop-herotator) (and (tag ol) (class a-carousel)))
   [position relative])
  ((media print (class TridactylStatusIndicator))
   [display none :important])
  ((class off-screen)
   [height (px 1)]
   [left (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   [position absolute]
   [top (px -500)]
   [width (px 1)])
  ((desc (id gw-desktop-herotator) (class a-carousel-container))
   [height (px 300)])
  ((desc (id gw-desktop-herotator) (class a-carousel-viewport))
   [height (px 300)])
  ((class hud-single-player-content-wrapper)
   [position relative]
   [display inline-block])
  ((class hud-card-subtext-line1)
   [font-size (px 15)]
   [margin-top (px 0)]
   [margin-bottom (px 0)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((class hud-card-subtext-line2)
   [font-size (px 15)]
   [color white]
   [margin-top (px -2)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis]
   [max-width 30ch])
  ((class hud-card-image)
   [max-width (px 210)]
   [height (px 150)]
   [margin-top (px 15)]
   [margin-bottom (px 5)])
  ((class hud-card-divider)
   [width (px 210)]
   [height (px 5)]
   [background-color (rgb 130 216 227)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [margin-bottom (px 10)]
   [margin-top (px 5)])
  ((desc (class hud-card-1) (class hud-card-divider))
   [background-color (rgb 130 216 227) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-card-5) (class hud-card-divider))
   [background-color (rgb 130 216 227) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-card-9) (class hud-card-divider))
   [background-color (rgb 130 216 227) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-card-13) (class hud-card-divider))
   [background-color (rgb 130 216 227) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-card-2) (class hud-card-divider))
   [background-color (rgb 173 228 34) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-card-6) (class hud-card-divider))
   [background-color (rgb 173 228 34) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-card-10) (class hud-card-divider))
   [background-color (rgb 173 228 34) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-card-14) (class hud-card-divider))
   [background-color (rgb 173 228 34) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-card-3) (class hud-card-divider))
   [background-color (rgb 255 167 36) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-card-7) (class hud-card-divider))
   [background-color (rgb 255 167 36) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-card-11) (class hud-card-divider))
   [background-color (rgb 255 167 36) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-card-15) (class hud-card-divider))
   [background-color (rgb 255 167 36) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-card-4) (class hud-card-divider))
   [background-color (rgb 255 82 82) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-card-8) (class hud-card-divider))
   [background-color (rgb 255 82 82) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-card-12) (class hud-card-divider))
   [background-color (rgb 255 82 82) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-card-16) (class hud-card-divider))
   [background-color (rgb 255 82 82) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((and (tag div) (class hud-feed-carousel))
   [width (% 100)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class hud-feed-carousel) (class feed-carousel)) (class feed-carousel-control))
   [top (px 90) :important])
  ((desc (class hud-feed-carousel) (class hud-feed-carousel-viewport))
   [width (% 100)]
   [min-height (px 220)]
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (class hud-feed-carousel) (class hud-feed-carousel-shelf))
   [display inline-block]
   [position relative]
   [left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (class hud-feed-carousel) (class feed-carousel-control))
   [position absolute]
   [top (px 100)]
   [background-color white]
   [height (px 100)]
   [line-height (px 100)]
   [width (px 45)]
   [text-align center]
   #;[box-shadow rgb(136, 136, 136) 0px 1px 3px]
   [display none])
  ((desc (class hud-feed-carousel) (and (class feed-carousel-control) (class feed-left) (class feed-control-disabled)))
   [display none :important])
  ((class hud-card-title-wrapper)
   [width (px 210)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((class hud-white-dashboard)
   [background-color (rgb 234 237 237)])
  ((desc (class hud-white-dashboard) (class hud-feed-carousel) (class feed-carousel-card))
   [margin-top (px 10)]
   [margin-bottom (px 10)]
   [background-color (rgb 255 255 255)]
   [line-height (px 19)]
   [width (px 240)]
   [height (px 280)]
   [margin-right (px 0)]
   [margin-left (px 6)])
  ((desc (class hud-white-dashboard) (class hud-feed-carousel))
   [padding-right (px 10)]
   [padding-left (px 4)])
  ((desc (class hud-white-dashboard) (class hud-card-wrapper))
   [position relative]
   [padding-top (px 15)]
   [padding-right (px 15)]
   [padding-bottom (px 15)]
   [padding-left (px 15)]
   [height (px 280)])
  ((desc (class hud-white-dashboard) (class hud-card-seemore))
   [display none])
  ((desc (class hud-white-dashboard) (class hud-card-title))
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [color (rgb 0 46 54)]
   [font-size (px 24)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (class hud-white-dashboard) (class hud-card-title-wrapper))
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [color (rgb 0 46 54)]
   [font-size (px 24)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (class hud-white-dashboard) (class hud-card-subtext-line1))
   [color (rgb 0 46 54)])
  ((desc (class hud-white-dashboard) (class hud-card-subtext-line2))
   [color (rgb 0 46 54)])
  ((desc (class hud-white-dashboard) (and (class feed-carousel-control) (class feed-right)))
   #;[opacity 1]
   #;[z-index 150]
   [background-color (rgb 234 237 237) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-white-dashboard) (and (class feed-carousel-control) (class feed-left)))
   #;[opacity 1]
   #;[z-index 150]
   [background-color (rgb 234 237 237) :important]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((desc (class hud-white-dashboard) (and (class feed-carousel-control) (class feed-right)))
   [right (px 10) :important])
  ((class hud-profile-image)
   #;[border-top-left-radius (% 50)]
   #;[border-top-right-radius (% 50)]
   #;[border-bottom-right-radius (% 50)]
   #;[border-bottom-left-radius (% 50)]
   [width (% 100)]
   [height (% 100)]
   #;[white-space initial])
  ((class hud-profilecard-name)
   [font-size (px 18)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-bottom (px 1)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis])
  ((desc (class hud-white-dashboard) (class hud-profilecard-name))
   [padding-right (px 15)]
   [width (px 160)])
  ((class hud-profilecard-divider)
   [width (px 45)]
   [margin-top (px 15)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((class hud-profilecard-digital-preorders-title)
   [font-size (px 13)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((class hud-profilecard-yourorders-title)
   [font-size (px 13)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((class hud-profilecard-categories-title)
   [font-size (px 13)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((class hud-profilecard-customer-since)
   [font-size (px 13)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((class hud-profile-giftguide-text-only-option-title)
   [font-size (px 13)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (class hud-white-dashboard) (class hud-profilecard-digital-preorders-title))
   [color (rgb 135 149 150) :important])
  ((desc (class hud-white-dashboard) (class hud-profilecard-yourorders-title))
   [color (rgb 135 149 150) :important])
  ((desc (class hud-white-dashboard) (class hud-profilecard-categories-title))
   [color (rgb 135 149 150) :important])
  ((desc (class hud-white-dashboard) (class hud-profilecard-customer-since))
   [color (rgb 135 149 150) :important])
  ((desc (class hud-white-dashboard) (class hud-profile-giftguide-text-only-option-title))
   [color (rgb 135 149 150) :important])
  ((class hud-profilecard-digital-preorders)
   [font-size (px 13)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((class hud-profilecard-yourorders)
   [font-size (px 13)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((class hud-profilecard-category)
   [font-size (px 13)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((class hud-profile-giftguide-text-only-option-text)
   [font-size (px 13)]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((class hud-profilecard-category)
   #;[text-overflow ellipsis]
   [display block]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-right (px -4)])
  ((class hud-profile-giftguide-text-only-option-text)
   #;[text-overflow ellipsis]
   [display block]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-right (px -4)])
  ((desc (class hud-white-dashboard) (class hud-profilecard-digital-preorders))
   [color (rgb 0 46 54) :important])
  ((desc (class hud-white-dashboard) (class hud-profilecard-yourorders))
   [color (rgb 0 46 54) :important])
  ((desc (class hud-white-dashboard) (class hud-profilecard-category))
   [color (rgb 0 46 54) :important])
  ((desc (class hud-white-dashboard) (class hud-profilecard-name))
   [color (rgb 0 46 54) :important])
  ((desc (class hud-white-dashboard) (class hud-profile-giftguide-text-only-option-text))
   [color (rgb 0 46 54) :important])
  ((class hud-profilecard-card)
   [padding-top (px 12)]
   [padding-right (px 15)]
   [padding-bottom (px 15)]
   [padding-left (px 15)]
   [position relative])
  ((class hud-profile-wrapper)
   [display inline-block])
  ((class hud-profile-image-wrapper)
   [display inline-block]
   [vertical-align top]
   [width (px 45)]
   [height (px 45)])
  ((class hud-profile-name-wrapper)
   [display inline-block]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [vertical-align top]
   [height (px 45)]
   [padding-left (px 15)]
   [line-height (px 23)])
  ((class hud-card-subtext-line)
   [font-size (px 15)]
   [width (px 210)]
   [height (px 38)]
   #;[word-break keep-all]
   #;[overflow-wrap break-word]
   #;[white-space pre-line]
   [overflow-x hidden]
   [overflow-y hidden])
  ((class hud-card-subtext-line)
   [font-size (px 15)]
   [width (px 210)]
   [height (px 38)]
   #;[word-break keep-all]
   #;[overflow-wrap break-word]
   #;[white-space pre-line]
   [overflow-x hidden]
   [overflow-y hidden])
  ((class hud-card-subtext-line)
   [font-size (px 15)]
   [width (px 210)]
   [height (px 38)]
   #;[word-break keep-all]
   #;[overflow-wrap break-word]
   #;[white-space pre-line]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (class hud-balancable-card) (class hud-card-subtext-line1))
   [margin-bottom (px 5)])
  ((desc (class hud-balancable-card) (class hud-card-subtext-line2))
   [margin-top (px 0)]
   [font-weight 500]
   [color (rgb 135 149 150)]
   #;[overflow-wrap break-word]
   #;[word-break keep-all]
   #;[white-space pre-line]
   [overflow-x hidden]
   [overflow-y hidden]
   [display -webkit-box]
   [height (px 38)])
  ((desc (class hud-balancable-card) (class hud-card-image))
   [height (px 130)]
   [max-width (px 210)]
   [margin-top (px 10)]
   [margin-bottom (px 5)])
  ((class hud-timeline-primary-asin-image-wrapper)
   [width (px 210)]
   [height (px 110)]
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-top (px 5)])
  ((class hud-timeline-primary-image)
   [top (% -100)]
   [bottom (% -100)]
   [left (% -100)]
   [right (% -100)]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto])
  ((class hud-timeline-secondary-asin-image-wrapper)
   [width (px 70)]
   [height (px 70)]
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-top (px 5)])
  ((class hud-timeline-secondary-images)
   [top (% -100)]
   [bottom (% -100)]
   [left (% -100)]
   [right (% -100)]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto])
  ((desc (class a-unordered-list) (class hud-timeline-products))
   [margin-left (px 0) :important]
   [margin-top (px 5)])
  ((desc (class a-unordered-list) (class hud-timeline-lists))
   [margin-right (px 0) :important])
  ((id ape_Gateway_right-2_desktop_placement)
   [line-height 1])
  ((desc (id ape_Gateway_right-2_desktop_placement) (tag div))
   [margin-top (px 0) :important]
   [margin-right auto :important]
   [margin-bottom (px 0) :important]
   [margin-left auto :important]
   [width (% 100) :important]
   [top (px 1) :important])
  ((child (id ape_Gateway_right-2_desktop_placement) (tag div) (tag a))
   [top (px 0) :important])
  ((class digital-dash-button-helper-wrapper)
   [max-width (px 264)]
   [max-height (px 114.4)]
   [width (% 100)]
   [height (% 100)]
   [display inline-block]
   [margin-bottom (px 0)]
   [line-height normal])
  ((desc (class digital-dash-button-helper-wrapper) (class digital-dash-tag-wrapper))
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 4)]
   #;[transition-property all]
   #;[transition-duration (s 0.25)]
   #;[transition-timing-function ease]
   #;[transition-delay (s 0)]
   [position absolute]
   [top (% 50)]
   [left (px 0)]
   #;[transform translate3d(-125%, -50%, 0px)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [background-color undefined]
   [color (rgb 255 255 255)]
   #;[visibility hidden]
   [width auto]
   [max-height (% 80)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[border-collapse collapse]
   [display table]
   #;[z-index 3])
  ((desc (class digital-dash-button-helper-wrapper) (class digital-dash-tag-wrapper) (class digital-dash-tag))
   [display table-row])
  ((desc (class digital-dash-button-helper-wrapper) (class digital-dash-tag-wrapper) (class digital-dash-tag-link-text))
   [color (rgb 252 154 24)])
  ((desc (class digital-dash-button-helper-wrapper) (class digital-dash-tag-wrapper) (class digital-dash-tag-body))
   [display block])
  ((desc (class digital-dash-button-helper-wrapper) (class digital-dash-tag-wrapper) (class digital-dash-tag-link))
   [display block])
  ((desc (class digital-dash-button-helper-wrapper) (class digital-dash-tag-wrapper) (class digital-dash-tag-title))
   [display block])
  ((desc (class digital-dash-button-helper-wrapper) (class digital-dash-tag-wrapper) (class digital-dash-tag-body-address))
   [display -webkit-box]
   #;[overflow-wrap break-word]
   #;[hyphens auto]
   [overflow-x hidden]
   [overflow-y hidden]
   [width (px 152)]
   [height (px 37)])
  ((desc (class digital-dash-button-helper-wrapper) (class digital-dash-tag-wrapper) (class digital-dash-tag-arrives))
   [padding-top (px 10)]
   [padding-right (px 14)]
   [padding-bottom (px 10)]
   [padding-left (px 14)]
   [display table-cell])
  ((desc (class digital-dash-button-helper-wrapper) (class digital-dash-tag-wrapper) (class digital-dash-tag-ships-to))
   [padding-top (px 10)]
   [padding-right (px 14)]
   [padding-bottom (px 10)]
   [padding-left (px 14)]
   [display table-cell])
  ((desc (class digital-dash-button-helper-wrapper) (class digital-dash-tag-wrapper) (class digital-dash-tag-ships-to))
   [display none]
   #;[border-right-color (rgb 162 162 162)]
   [border-right-style solid]
   [border-right-width (px 2)]
   #;[transition-property max-width]
   #;[transition-duration (s 0.25)]
   #;[transition-timing-function ease-in]
   #;[transition-delay (s 0)])
  ((desc (class digital-dash-button-helper-wrapper) (class digital-dash-tag-wrapper) (class digital-dash-tag-arrives))
   [width auto])
  ((desc (class digital-dash-button-helper-wrapper) (and (class digital-dash-tag-wrapper) (class digital-dash-tag-show)))
   #;[visibility visible]
   [position absolute]
   [top (% 50)]
   [left (px 0)]
   #;[transform translate3d(0px, -50%, 0px)])
  ((desc (class digital-dash-button-helper-wrapper) (class digital-dash-tag-wrapper) (tag a))
   [color (rgb 255 255 255)])
  ((class digital-dash-button-outer-wrapper)
   [position relative]
   [width (% 100)]
   [height (% 100)]
   #;[border-top-color (rgb 135 148 149)]
   [border-top-style solid]
   [border-top-width (px 2)]
   #;[border-left-color (rgb 135 148 149)]
   [border-left-style solid]
   [border-left-width (px 2)]
   #;[border-bottom-color (rgb 135 148 149)]
   [border-bottom-style solid]
   [border-bottom-width (px 2)]
   #;[border-right-color (rgb 135 148 149)]
   [border-right-style solid]
   [border-right-width (px 2)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   [background-color (rgb 169 182 183)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [padding-top (px 3)]
   [padding-right (px 3)]
   [padding-bottom (px 3)]
   [padding-left (px 3)]
   #;[border-top-left-radius 43% 100%]
   #;[border-top-right-radius 43% 100%]
   #;[border-bottom-right-radius 43% 100%]
   #;[border-bottom-left-radius 43% 100%]
   #;[z-index 1])
  ((desc (class digital-dash-button-outer-wrapper) (class digital-dash-button-inner-wrapper))
   #;[border-top-left-radius 43% 100%]
   #;[border-top-right-radius 43% 100%]
   #;[border-bottom-right-radius 43% 100%]
   #;[border-bottom-left-radius 43% 100%]
   [display block]
   #;[background-size 100% 100%]
   [position absolute]
   [top (px 3)]
   [bottom (px 3)]
   [left (px 3)]
   [right (px 3)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (class digital-dash-button-outer-wrapper) (class digital-dash-button-inner-wrapper) (class digital-dash-deck))
   [height (% 100)]
   [display table]
   [float left]
   [width (% 40)]
   [margin-left (% 15)]
   #;[table-layout fixed])
  ((desc (class digital-dash-button-outer-wrapper) (class digital-dash-button-inner-wrapper) (class digital-dash-deck) (class brand-name))
   #;[white-space normal]
   #;[overflow-wrap normal]
   [font-size (px 18)]
   [line-height (px 22)]
   [display table-cell]
   [vertical-align middle]
   [text-align left]
   [color (rgb 255 255 255)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis])
  ((desc (class digital-dash-button-outer-wrapper) (class digital-dash-button-inner-wrapper) (class digital-dash-button-wrapper))
   [display inline-block]
   [height (% 100)]
   [width (% 40)]
   [overflow-x hidden]
   [overflow-y hidden]
   [float right]
   [position relative])
  ((desc (class digital-dash-button-outer-wrapper) (class digital-dash-button-inner-wrapper) (class digital-dash-button-price))
   [color (rgb 0 70 79)])
  ((desc (class digital-dash-button-outer-wrapper) (and (class digital-dash-button-inner-wrapper) (class digital-dash-background-gradient-0)))
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [background-color transparent]
   #;[background-image linear-gradient(rgb(192, 27, 126), rgb(145, 31, 97))]
   #;[background-size 100% 100%])
  ((desc (class digital-dash-button-outer-wrapper) (and (class digital-dash-button-inner-wrapper) (class digital-dash-background-gradient-1)))
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [background-color transparent]
   #;[background-image linear-gradient(rgb(98, 144, 62), rgb(70, 103, 50))]
   #;[background-size 100% 100%])
  ((desc (class digital-dash-button-outer-wrapper) (and (class digital-dash-button-inner-wrapper) (class digital-dash-background-gradient-2)))
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [background-color transparent]
   #;[background-image linear-gradient(rgb(14, 67, 74), rgb(14, 49, 57))]
   #;[background-size 100% 100%])
  ((class digital-dash-button-name)
   [display inline-block]
   [max-height (px 66)]
   [overflow-x hidden]
   [overflow-y hidden]
   [max-width (% 100)])
  ((class digital-dash-button-label)
   [position absolute]
   [bottom (px 0)]
   [left (px 0)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [background-color undefined]
   [color (rgb 255 255 255)]
   [padding-top (px 4)]
   [padding-right (px 20)]
   [padding-bottom (px 4)]
   [padding-left (px 40)]
   #;[border-top-right-radius 30px 100%]
   #;[border-bottom-right-radius 30px 100%]
   #;[border-bottom-left-radius 30px 100%]
   #;[border-top-left-radius (px 0)]
   #;[white-space nowrap]
   [max-width (% 66.6667)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis]
   #;[cursor pointer])
  ((and (class digital-dash-button-label) (class digital-dash-button-label-hide))
   [display none])
  ((class digital-dash-button-border)
   [position absolute]
   [top (% 50)]
   [right (px 9)]
   [width (% 87.931)]
   [height (% 85)]
   [margin-top (% -43.9655)]
   [float right]
   [vertical-align middle]
   [display inline-block])
  ((class digital-dash-button-button)
   [position absolute]
   [top (% 50)]
   [left (% 50)]
   #;[z-index 2]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [background-color transparent]
   #;[background-image linear-gradient(45deg, rgb(234, 237, 237) 0px, rgb(255, 255, 255) 100%)]
   #;[border-top-left-radius (% 50)]
   #;[border-top-right-radius (% 50)]
   #;[border-bottom-right-radius (% 50)]
   #;[border-bottom-left-radius (% 50)]
   #;[border-top-color (rgb 206 214 215)]
   [border-top-style solid]
   [border-top-width (px 5)]
   #;[border-left-color (rgb 206 214 215)]
   [border-left-style solid]
   [border-left-width (px 5)]
   #;[border-bottom-color (rgb 206 214 215)]
   [border-bottom-style solid]
   [border-bottom-width (px 5)]
   #;[border-right-color (rgb 206 214 215)]
   [border-right-style solid]
   [border-right-width (px 5)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   [color (rgb 108 119 120)]
   [width (% 100)]
   [height (% 100)]
   [margin-top (% -50)]
   [margin-left (% -50)]
   [font-size (px 11)]
   #;[transition-property all]
   #;[transition-duration (s 0.15)]
   #;[transition-timing-function linear]
   #;[transition-delay (s 0)])
  ((desc (class digital-dash-button-button) (class digital-dash-button-item-price))
   [display block])
  ((class digital-dash-list-item)
   [background-color transparent]
   #;[transition-property all]
   #;[transition-duration (s 0.5)]
   #;[transition-timing-function ease]
   #;[transition-delay (s 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   [padding-top (px 1)]
   [padding-right (px 0)]
   [padding-bottom (px 1)]
   [padding-left (px 0)]
   #;[white-space normal]
   #;[overflow-wrap break-word])
  ((class digital-dash-delete-swiper)
   [width (% 200)]
   [display table]
   [line-height 0]
   #;[transform translateX(0px)]
   #;[transition-property transform]
   #;[transition-duration (s 0.2)]
   #;[transition-timing-function ease]
   #;[transition-delay (s 0)])
  ((class digital-dash-delete-swiper-frame)
   [width (% 50)]
   [display table-cell]
   [position relative]
   [vertical-align middle])
  ((class digital-dash-delete-message)
   [top (px 0)]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 0)]
   [text-align left]
   #;[z-index 2]
   [color (rgb 255 255 255)]
   [margin-bottom (px 0)])
  ((desc (class digital-dash-delete-message) (class digital-dash-delete-text))
   [display inline-block]
   [width (rem 11)]
   [text-align center])
  ((desc (class digital-dash-delete-message) (class digital-dash-delete-text) (tag a))
   [color (rgb 255 255 255)])
  ((class digital-dash-restore-message)
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 0)]
   #;[z-index 1]
   [display none]
   [width (% 80)]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto])
  ((desc (class digital-dash-restore-message) (tag a))
   [display table]
   #;[table-layout fixed]
   [width (% 100)]
   [height (% 100)])
  ((desc (class digital-dash-restore-message) (tag a) (tag div))
   [display table-cell]
   [vertical-align middle])
  ((class digital-dash-deletable__delete-error-message)
   [display none])
  ((desc (class digital-dash-restore-message) (class digital-dash-deletable__restore-error-message))
   [display none]
   [text-align center])
  ((desc (id pageContent) (class digital-dash-gateway-desktop) (class digital-dash-gateway-desktop__radial-divider))
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [background-color transparent]
   #;[background-image radial-gradient(circle at center top, rgb(236, 236, 236) 10px, transparent 125px)])
  ((desc (class digital-dash-gateway-desktop) (class digital-dash-gateway-desktop__radial-divider))
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [background-color transparent]
   #;[background-image radial-gradient(circle at center top, rgb(236, 236, 236) 10px, transparent 125px)])
  ((and (class digital-dash-gateway-desktop) (class digital-dash-gateway-desktop--slot-right-rail))
   #;[visibility visible]
   [margin-left (px -23)]
   [margin-right (px -23)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class digital-dash-gateway-desktop) (class digital-dash-gateway-desktop--slot-right-rail)) (class digital-dash-gateway-desktop__header))
   [padding-left (px 23)]
   [padding-right (px 23)])
  ((class digital-dash-order-toast)
   [background-color (rgb 35 47 62)]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   [color (rgb 255 255 255)]
   [text-align center])
  ((desc (class digital-dash-order-toast) (class digital-dash-order-toast__checkmark))
   [display none])
  ((desc (class digital-dash-order-toast) (class digital-dash-order-toast__spinner))
   [display none])
  ((id digital-dash-duplicate-order-footer)
   [display none])
  ((id digital-dash-check-order-footer)
   [display none])
  ((class digital-dash-duplicate-order__text)
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((id digital-dash-duplicate-order-cancel-button)
   [margin-top (px 0)]
   [margin-right (px 5)]
   [margin-bottom (px 14)]
   [margin-left (px 5)]
   [float right])
  ((id digital-dash-duplicate-order-submit-button)
   [margin-top (px 0)]
   [margin-right (px 5)]
   [margin-bottom (px 14)]
   [margin-left (px 5)]
   [float right])
  ((class digital-dash-check-order__text)
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((id digital-dash-check-order-cancel-button)
   [margin-top (px 0)]
   [margin-right (px 5)]
   [margin-bottom (px 14)]
   [margin-left (px 5)]
   [float right])
  ((id digital-dash-check-order-submit-button)
   [margin-top (px 0)]
   [margin-right (px 5)]
   [margin-bottom (px 14)]
   [margin-left (px 5)]
   [float right])
  ((class digital-dash-offer-change__text)
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((class digital-dash-spinner)
   [display inline-block]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 3)]
   #;[border-left-color (rgb 170 175 181)]
   [border-left-width (px 3)]
   #;[border-bottom-color (rgb 170 175 181)]
   [border-bottom-width (px 3)]
   #;[border-right-color (rgb 170 175 181)]
   [border-right-width (px 3)]
   #;[border-image-outset 0]
   #;[border-image-repeat stretch]
   #;[border-image-slice (% 100)]
   #;[border-image-source none]
   #;[border-image-width 1]
   #;[border-top-color (rgb 255 255 255)]
   [background-color transparent]
   #;[background-position-x (px 0)]
   #;[background-position-y (px 0)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-image none]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box]
   #;[border-top-left-radius (% 50)]
   #;[border-top-right-radius (% 50)]
   #;[border-bottom-right-radius (% 50)]
   #;[border-bottom-left-radius (% 50)]
   [width (px 15)]
   [height (px 15)]
   #;[animation-name digital-dash-spin]
   #;[animation-duration (s 2)]
   #;[animation-timing-function linear]
   #;[animation-delay (s 0)]
   #;[animation-iteration-count infinite]
   #;[animation-direction normal]
   #;[animation-fill-mode none]
   #;[animation-play-state running]
   [vertical-align text-top])
  ((class digital-dash-first-time-hint__error-message)
   [display none])
  ((class digital-dash-age-confirmation__title)
   [font-size (px 20)])
  ((id digital-dash-age-confirmation-footer)
   [float right])
  ((id digital-dash-promotion-redemption-failure-order__content)
   [padding-bottom (rem 1)]
   [display block])
  ((desc (id digital-dash-promotion-redemption-failure-order__content) (class digital-dash-promotion-redemption-failure-order__text))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (id digital-dash-promotion-redemption-failure-order__content) (id digital-dash-promotion-redemption-failure-order-footer))
   [padding-left (rem 1)]
   [padding-right (rem 1)]
   [display block])
  ((media (and screen (min-width (px 600))) (desc (id digital-dash-promotion-redemption-failure-order__content) (id digital-dash-promotion-redemption-failure-order-footer)))
   [float right])
  ((id digital-dash-promotion-redemption-failure-order-cancel-button)
   [margin-top (px 0)]
   [margin-right (px 5)]
   [margin-bottom (px 14)]
   [margin-left (px 5)]
   [float right])
  ((id digital-dash-promotion-redemption-failure-order-submit-button)
   [margin-top (px 0)]
   [margin-right (px 5)]
   [margin-bottom (px 14)]
   [margin-left (px 5)]
   [float right])
  ((id sidebar-bottom)
   [margin-top (px -161)])
  ((id nav-prime-tooltip)
   [padding-top (px 0)]
   [padding-right (px 20)]
   [padding-bottom (px 2)]
   [padding-left (px 20)]
   [background-color white]
   [font-family "arial, sans-serif"])
  ((class nav-npt-text-title)
   [font-family "arial, sans-serif"]
   [font-size (px 18)]
   [font-weight bold]
   [line-height (px 21)]
   [color (rgb 228 121 35)])
  ((class nav-npt-text-detail)
   [font-family "arial, sans-serif"]
   [font-size (px 12)]
   [line-height (px 14)]
   [color (rgb 51 51 51)]
   [margin-top (px 2)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 0)])
  ((and (tag a) (class nav-npt-a))
   [font-family "arial, sans-serif"]
   [font-size (px 12)]
   [line-height (px 14)]
   [color (rgb 51 51 51)]
   [margin-top (px 2)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 0)])
  ((id ape_Gateway_right-7_desktop_placement)
   [line-height 1])
  ((desc (id ape_Gateway_right-7_desktop_placement) (tag div))
   [margin-top (px 0) :important]
   [margin-right auto :important]
   [margin-bottom (px 0) :important]
   [margin-left auto :important]
   [width (% 100) :important]
   [top (px 1) :important])
  ((child (id ape_Gateway_right-7_desktop_placement) (tag div) (tag a))
   [top (px 0) :important])
  ((id icp-touch-link-language)
   [display none])
  ((id icp-touch-link-country)
   [display none])
  ((id cmdline_iframe) :style
   [height (px 0) :important])
  ((id edoc-10667) :style
   [display none])
  ((id nav-upnav) :style
   #;[background-image url("https://images-na.ssl-images-amazon.com/images/G/01/airstream/upnav/C/nav_latest_1x._CB475728145_.jpg")]
   [background-color (rgb 246 246 246)]
   [text-align left]
   #;[background-position-x left]
   #;[background-position-y top]
   [height (px 55)]
   #;[background-repeat no-repeat]
   #;[background-size 1920px auto]
   [min-width (px 1000)])
  ((id navSwmHoliday) :style
   [width (px 400)]
   [height (px 39)]
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative])
  ((id searchDropdownDescription) :style
   [display none])
  ((id searchDropdownBox) :style
   [display block])
  ((id nav-flyout-wl-alexa) :style
   [display block])
  ((id nav-flyout-wl-items) :style
   [display block])
  ((id edoc-10668) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 535)])
  ((id edoc-10669) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 517)])
  ((id edoc-10670) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 535)])
  ((id edoc-10671) :style
   [bottom (px -25)]
   [right (px -20)]
   [width (px 519)]
   [height (px 535)])
  ((id edoc-10672) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 535)])
  ((id edoc-10673) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 535)])
  ((id edoc-10674) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 535)])
  ((id edoc-10675) :style
   [bottom (px -14)]
   [right (px -20)]
   [width (px 519)]
   [height (px 522)])
  ((id edoc-10676) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 545)])
  ((id edoc-10677) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 522)])
  ((id edoc-10678) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 535)])
  ((id edoc-10679) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 535)])
  ((id edoc-10680) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 535)])
  ((id edoc-10681) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 535)])
  ((id edoc-10682) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 535)])
  ((id edoc-10683) :style
   [bottom (px -14)]
   [right (px -20)]
   [width (px 519)]
   [height (px 525)])
  ((id edoc-10684) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 535)])
  ((id edoc-10685) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 535)])
  ((id edoc-10686) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 535)])
  ((id edoc-10687) :style
   [bottom (px -24)]
   [right (px -20)]
   [width (px 519)]
   [height (px 535)])
  ((id edoc-10688) :style
   [bottom (px -14)]
   [right (px -20)]
   [width (px 519)]
   [height (px 522)])
  ((id desktop-banner) :style
   [width (% 100)])
  ((id anonCarousel1) :style
   [height (px 300)])
  ((id edoc-10695) :style
   [width (px 10500)]
   #;[transform translateX(-4500px) translateZ(0px)])
  ((id edoc-10696) :style
   #;[visibility visible]
   [width (px 1500)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((id edoc-10697) :style
   [height (px 300)])
  ((id edoc-10698) :style
   [display inline-block])
  ((id edoc-10699) :style
   #;[visibility visible]
   [width (px 1500)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((id edoc-10700) :style
   [height (px 300)])
  ((id edoc-10701) :style
   [display inline-block])
  ((id edoc-10702) :style
   #;[visibility visible]
   [width (px 1500)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((id edoc-10703) :style
   [height (px 300)])
  ((id edoc-10704) :style
   [display inline-block])
  ((id edoc-10705) :style
   #;[visibility visible]
   [width (px 1500)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((id edoc-10706) :style
   [height (px 300)])
  ((id edoc-10707) :style
   [display inline-block])
  ((id edoc-10708) :style
   #;[visibility visible]
   [width (px 1500)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((id edoc-10709) :style
   [height (px 300)])
  ((id edoc-10710) :style
   [display inline-block])
  ((id edoc-10711) :style
   #;[visibility visible]
   [width (px 1500)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((id edoc-10712) :style
   [height (px 300)])
  ((id edoc-10713) :style
   [display inline-block])
  ((id edoc-10714) :style
   #;[visibility visible]
   [width (px 1500)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((id edoc-10715) :style
   [height (px 300)])
  ((id edoc-10716) :style
   [display inline-block])
  ((id edoc-10718) :style
   [height (px 300) :important])
  ((id edoc-10719) :style
   [display inline-block])
  ((id edoc-10720) :style
   [display inline-block])
  ((id edoc-10721) :style
   [display inline-block])
  ((id edoc-10722) :style
   [display inline-block])
  ((id edoc-10723) :style
   [display inline-block])
  ((id edoc-10724) :style
   [display inline-block])
  ((id edoc-10725) :style
   [display inline-block])
  ((id edoc-10726) :style
   [display inline-block])
  ((id edoc-10394) :style
   [display inline])
  ((id edoc-10395) :style
   [display inline])
  ((id edoc-10727) :style
   [padding-right (px 310)])
  ((id main-content-top) :style
   [padding-right (% 0)]
   [float left])
  ((id edoc-10728) :style
   [display inline-block])
  ((id edoc-10729) :style
   [display inline-block])
  ((id edoc-10730) :style
   [display inline-block])
  ((id edoc-10731) :style
   [display inline-block])
  ((id edoc-10732) :style
   [display inline-block])
  ((id edoc-10733) :style
   [display inline-block])
  ((id edoc-10734) :style
   [display inline-block])
  ((id edoc-10735) :style
   [display inline-block])
  ((id edoc-10736) :style
   [display inline-block])
  ((id edoc-10737) :style
   [display inline-block])
  ((id edoc-10738) :style
   [display inline-block])
  ((id edoc-10739) :style
   [display inline-block])
  ((id edoc-10740) :style
   [display inline-block])
  ((id edoc-10741) :style
   [display inline-block])
  ((id edoc-10742) :style
   [display inline-block])
  ((id edoc-10743) :style
   [display inline-block])
  ((id edoc-10744) :style
   [display none])
  ((id edoc-10745) :style
   [width (px (/ 28979 60))]
   [left (px 0)])
  ((id edoc-10746) :style
   [display inline-block])
  ((id edoc-10747) :style
   [display inline-block])
  ((id edoc-10748) :style
   [display inline-block])
  ((id edoc-10749) :style
   [display inline-block])
  ((id edoc-10750) :style
   [display inline-block])
  ((id edoc-10751) :style
   [display inline-block])
  ((id edoc-10752) :style
   [display inline-block])
  ((id edoc-10753) :style
   [display inline-block])
  ((id edoc-10754) :style
   [display inline-block])
  ((id edoc-10755) :style
   [display inline-block])
  ((id edoc-10756) :style
   [display inline-block])
  ((id edoc-10757) :style
   [display none])
  ((id edoc-10758) :style
   [width (px (/ 32381 60))]
   [left (px 0)])
  ((id edoc-10759) :style
   [display inline-block]
   [margin-right (px 10)])
  ((id edoc-10760) :style
   [display inline-block]
   [margin-right (px 10)])
  ((id edoc-10761) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10762) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10763) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10764) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10765) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10766) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10767) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10768) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10769) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10770) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10771) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10772) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10773) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10774) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10775) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10776) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10777) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10778) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10779) :style
   [display none])
  ((id edoc-10780) :style
   [width (px (/ 4447 15))]
   [left (px 0)])
  ((id edoc-10781) :style
   [display inline-block]
   [margin-right (px 10)])
  ((id edoc-10782) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10783) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10784) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10785) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10786) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10787) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10788) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10789) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10790) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10791) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10792) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10793) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10794) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10795) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10796) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10797) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10798) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10799) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10800) :style
   [margin-right (px 10)]
   [display inline-block])
  ((id edoc-10801) :style
   [display none])
  ((id edoc-10802) :style
   [width (px (/ 7589 20))]
   [left (px 0)])
  ((id sidebar-top) :style
   [width (px 310)]
   [margin-right (px -310)]
   [float left])
  ((id ape_Gateway_right-2_desktop_placement) :style
   [width (px 300)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((id ape_Gateway_right-2_desktop_placement_Feedback) :style
   [position relative]
   [height (px 20)]
   [top (px 2)])
  ((id edoc-10803) :style
   [position absolute]
   [top (px 2)]
   [right (px 0)]
   [display inline-block]
   [font-style normal]
   #;[font-variant-caps normal]
   [font-weight normal]
   #;[font-stretch normal]
   [font-size (px 11)]
   [line-height normal]
   [font-family "Arial"]
   #;[font-size-adjust none]
   #;[font-kerning auto]
   #;[font-variant-alternates normal]
   #;[font-variant-east-asian normal]
   #;[font-variant-ligatures normal]
   #;[font-variant-numeric normal]
   #;[font-variant-position normal]
   #;[font-language-override normal]
   #;[font-feature-settings normal]
   [color (rgb 0 75 145)]
   #;[cursor pointer]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor])
  ((id ad-feedback-text-right-2) :style
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [color (rgb 0 75 145)])
  ((id ad-feedback-sprite-right-2) :style
   [display inline-block]
   [vertical-align top]
   [margin-top (px 1)]
   [margin-right (px 0)]
   [margin-bottom (px 1)]
   [margin-left (px 0)]
   [width (px 14)]
   [height (px 12)]
   [background-color transparent]
   #;[background-position-x (px 0)]
   #;[background-position-y (px 0)]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-image url("https://images-na.ssl-images-amazon.com/images/G/01/productAds/ad_feedback_icon_1Xsprite._CB323764680_.png")]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((id edoc-10805) :style
   [max-height (rem 0)])
  ((id edoc-10807) :style
   [max-height (rem 0)])
  ((id edoc-10809) :style
   [max-height (rem 0)])
  ((id edoc-10811) :style
   [max-height (rem 0)])
  ((id edoc-10813) :style
   [max-height (rem 0)])
  ((id edoc-10815) :style
   [max-height (rem 0)])
  ((id edoc-10816) :style
   [height (px 350)])
  ((id edoc-10817) :style
   [display inline-block])
  ((id edoc-10818) :style
   [display none])
  ((id edoc-10819) :style
   [display none])
  ((id edoc-10820) :style
   [display none])
  ((id edoc-10821) :style
   [padding-right (px 310)])
  ((id main-content-bottom) :style
   [padding-right (% 0)]
   [float left])
  ((id ape_Gateway_desktop-ad-center-1_desktop_placement) :style
   [max-width (px 1110)]
   [min-width (px 610)]
   [overflow-x hidden]
   [overflow-y hidden]
   [display block]
   [margin-left auto]
   [margin-right auto])
  ((id ape_Gateway_desktop-ad-center-1_desktop_iframe) :style
   [max-width (% 100)]
   [max-height (% 100)]
   [margin-bottom (px -6)]
   [height (px 286)]
   [width (px 1110)])
  ((id ape_Gateway_desktop-ad-center-1_desktop_placement_Feedback) :style
   [position relative]
   [height (px 20)]
   [top (px 2)])
  ((id edoc-10822) :style
   [position absolute]
   [top (px 2)]
   [right (px 0)]
   [display inline-block]
   [font-style normal]
   #;[font-variant-caps normal]
   [font-weight normal]
   #;[font-stretch normal]
   [font-size (px 11)]
   [line-height normal]
   [font-family "Arial"]
   #;[font-size-adjust none]
   #;[font-kerning auto]
   #;[font-variant-alternates normal]
   #;[font-variant-east-asian normal]
   #;[font-variant-ligatures normal]
   #;[font-variant-numeric normal]
   #;[font-variant-position normal]
   #;[font-language-override normal]
   #;[font-feature-settings normal]
   [color (rgb 0 75 145)]
   #;[cursor pointer]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor])
  ((id ad-feedback-text-desktop-ad-center-1) :style
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [color (rgb 0 75 145)])
  ((id ad-feedback-sprite-desktop-ad-center-1) :style
   [display inline-block]
   [vertical-align top]
   [margin-top (px 1)]
   [margin-right (px 0)]
   [margin-bottom (px 1)]
   [margin-left (px 0)]
   [width (px 14)]
   [height (px 12)]
   [background-color transparent]
   #;[background-position-x (px 0)]
   #;[background-position-y (px 0)]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-image url("https://images-na.ssl-images-amazon.com/images/G/01/productAds/ad_feedback_icon_1Xsprite._CB323764680_.png")]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((id edoc-10823) :style
   [height (px 200)])
  ((id edoc-10824) :style
   [display inline-block])
  ((id edoc-10825) :style
   [display inline-block])
  ((id edoc-10826) :style
   [display inline-block])
  ((id edoc-10827) :style
   [display inline-block])
  ((id edoc-10828) :style
   [display inline-block])
  ((id edoc-10829) :style
   [display inline-block])
  ((id edoc-10830) :style
   [display inline-block])
  ((id edoc-10831) :style
   [display inline-block])
  ((id edoc-10832) :style
   [display inline-block])
  ((id edoc-10833) :style
   [display inline-block])
  ((id edoc-10834) :style
   [display inline-block])
  ((id edoc-10835) :style
   [display inline-block])
  ((id edoc-10836) :style
   [display inline-block])
  ((id edoc-10837) :style
   [display inline-block])
  ((id edoc-10838) :style
   [display inline-block])
  ((id edoc-10839) :style
   [display inline-block])
  ((id edoc-10840) :style
   [display inline-block])
  ((id edoc-10841) :style
   [display inline-block])
  ((id edoc-10842) :style
   [display inline-block])
  ((id edoc-10843) :style
   [display inline-block])
  ((id edoc-10844) :style
   [display none])
  ((id edoc-10845) :style
   [width (px (/ 5983 15))]
   [left (px 0)])
  ((id edoc-10846) :style
   [display inline-block])
  ((id edoc-10847) :style
   [display inline-block])
  ((id edoc-10848) :style
   [display inline-block])
  ((id edoc-10849) :style
   [display inline-block])
  ((id edoc-10850) :style
   [display inline-block])
  ((id edoc-10851) :style
   [display inline-block])
  ((id edoc-10852) :style
   [display inline-block])
  ((id edoc-10853) :style
   [display inline-block])
  ((id edoc-10854) :style
   [display inline-block])
  ((id edoc-10855) :style
   [display inline-block])
  ((id edoc-10856) :style
   [display inline-block])
  ((id edoc-10857) :style
   [display inline-block])
  ((id edoc-10858) :style
   [display inline-block])
  ((id edoc-10859) :style
   [display inline-block])
  ((id edoc-10860) :style
   [display inline-block])
  ((id edoc-10861) :style
   [display inline-block])
  ((id edoc-10862) :style
   [display none])
  ((id edoc-10863) :style
   [width (px 446.9)]
   [left (px 0)])
  ((id edoc-10864) :style
   [display inline-block])
  ((id edoc-10865) :style
   [display inline-block])
  ((id edoc-10866) :style
   [display inline-block])
  ((id edoc-10867) :style
   [display inline-block])
  ((id edoc-10868) :style
   [display inline-block])
  ((id edoc-10869) :style
   [display inline-block])
  ((id edoc-10870) :style
   [display inline-block])
  ((id edoc-10871) :style
   [display inline-block])
  ((id edoc-10872) :style
   [display inline-block])
  ((id edoc-10873) :style
   [display inline-block])
  ((id edoc-10874) :style
   [display inline-block])
  ((id edoc-10875) :style
   [display inline-block])
  ((id edoc-10876) :style
   [display inline-block])
  ((id edoc-10877) :style
   [display inline-block])
  ((id edoc-10878) :style
   [display inline-block])
  ((id edoc-10879) :style
   [display inline-block])
  ((id edoc-10880) :style
   [display inline-block])
  ((id edoc-10881) :style
   [display inline-block])
  ((id edoc-10882) :style
   [display inline-block])
  ((id edoc-10883) :style
   [display inline-block])
  ((id edoc-10884) :style
   [display none])
  ((id edoc-10885) :style
   [width (px (/ 16223 60))]
   [left (px 0)])
  ((id sidebar-bottom) :style
   [width (px 310)]
   [margin-right (px -310)]
   [float left])
  ((id edoc-10886) :style
   [height (px 350)])
  ((id edoc-10887) :style
   [display inline-block])
  ((id ape_Gateway_right-7_desktop_placement) :style
   [width (px 300)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((id ape_Gateway_right-7_desktop_placement_Feedback) :style
   [position relative]
   [height (px 20)]
   [top (px 2)])
  ((id edoc-10888) :style
   [position absolute]
   [top (px 2)]
   [right (px 0)]
   [display inline-block]
   [font-style normal]
   #;[font-variant-caps normal]
   [font-weight normal]
   #;[font-stretch normal]
   [font-size (px 11)]
   [line-height normal]
   [font-family "Arial"]
   #;[font-size-adjust none]
   #;[font-kerning auto]
   #;[font-variant-alternates normal]
   #;[font-variant-east-asian normal]
   #;[font-variant-ligatures normal]
   #;[font-variant-numeric normal]
   #;[font-variant-position normal]
   #;[font-language-override normal]
   #;[font-feature-settings normal]
   [color (rgb 0 75 145)]
   #;[cursor pointer]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor])
  ((id ad-feedback-text-right-7) :style
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-decoration-color currentcolor]
   [color (rgb 0 75 145)])
  ((id ad-feedback-sprite-right-7) :style
   [display inline-block]
   [vertical-align top]
   [margin-top (px 1)]
   [margin-right (px 0)]
   [margin-bottom (px 1)]
   [margin-left (px 0)]
   [width (px 14)]
   [height (px 12)]
   [background-color transparent]
   #;[background-position-x (px 0)]
   #;[background-position-y (px 0)]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-image url("https://images-na.ssl-images-amazon.com/images/G/01/productAds/ad_feedback_icon_1Xsprite._CB323764680_.png")]
   #;[background-size auto auto]
   #;[background-origin padding-box]
   #;[background-clip border-box])
  ((id rhf) :style
   [clear both])
  ((id edoc-10889) :style
   [display none])
  ((id rhf-error) :style
   [display none])
  ((id edoc-10890) :style
   [display table-row])
  ((id edoc-10891) :style
   [width (% 4)])
  ((id edoc-10892) :style
   [width (% 4)])
  ((id edoc-10893) :style
   [width (% 4)])
  ((id edoc-10894) :style
   [width (% 4)])
  ((id edoc-10895) :style
   [width (% 4)])
  ((id edoc-10896) :style
   [width (% 4)])
  ((id edoc-10897) :style
   [width (% 4)])
  ((id edoc-10898) :style
   [width (% 4)])
  ((id edoc-10899) :style
   [width (% 4)])
  ((id edoc-10900) :style
   [width (% 4)])
  ((id edoc-10901) :style
   [width (% 4)])
  ((id edoc-10902) :style
   [width (% 4)])
  ((id edoc-10903) :style
   [width (% 4)])
  ((id edoc-10904) :style
   [width (% 4)])
  ((id edoc-10905) :style
   [width (% 4)])
  ((id edoc-10906) :style
   [width (% 4)])
  ((id edoc-10907) :style
   [width (% 4)])
  ((id edoc-10908) :style
   [width (% 4)])
  ((id edoc-10909) :style
   [width (% 4)])
  ((id edoc-10910) :style
   [width (% 4)])
  ((id edoc-10911) :style
   [width (% 4)])
  ((id edoc-10912) :style
   [width (% 4)])
  ((id edoc-10913) :style
   [width (% 4)])
  ((id edoc-10914) :style
   [width (% 4)])
  ((id edoc-10915) :style
   [width (% 4)])
  ((id edoc-10916) :style
   [width (% 4)])
  ((id edoc-10917) :style
   [width (% 4)])
  ((id edoc-10918) :style
   [width (% 4)])
  ((id edoc-10919) :style
   [width (% 4)])
  ((id edoc-10920) :style
   [width (% 4)])
  ((id edoc-10921) :style
   [width (% 4)])
  ((id edoc-10922) :style
   [width (% 4)])
  ((id edoc-10923) :style
   [width (% 4)])
  ((id edoc-10924) :style
   [width (% 4)])
  ((id edoc-10925) :style
   [width (% 4)])
  ((id edoc-10926) :style
   [width (% 4)])
  ((id sis_pixel_r2) :style
   [height (px 1)]
   [position absolute]
   [left (px -1000000)]
   [top (px -1000000)])
  ((id apaypx) :style
   [height (px 1)]
   [position absolute]
   [left (px -1000000)]
   [top (px -1000000)])
  ((id be) :style
   [display none]
   #;[visibility hidden])
  ((id a-popover-root) :style
   #;[z-index -1]
   [position absolute])
  ((id edoc-10927) :style
   [display none])
  ((id edoc-10928) :style
   [display none])
  ((id edoc-10929) :style
   [display none])
  ((id edoc-10930) :style
   [display none])
  ((id edoc-10931) :style
   [display none])
  ((id edoc-10932) :style
   [display none])
  ((id edoc-10933) :style
   [position absolute]
   [top (px 0)]
   #;[z-index -1]
   #;[transition-property top]
   #;[transition-duration 1ms]
   #;[transition-timing-function ease]
   #;[transition-delay (s 0)]))

(define-fonts doc-1
  [16 "serif" 400 normal 12 4 1.5 1.5 19]
  [13 "Arial, sans-serif" 400 normal 10 3 1 1 15]
  [13 "arial, sans-serif" 400 normal 10 3 1 1 15]
  [12 "arial, sans-serif" 400 normal 9 3 1 1 14]
  [14 "arial, sans-serif" 400 normal 11 3 1 1 16]
  [11 "arial, sans-serif" 700 normal 9 2 0.5 0.5 12]
  [0 "arial, sans-serif" 400 italic 0 0 0 0 0]
  [13 "arial, sans-serif" 700 normal 10 3 1 1 15]
  [15 "arial, sans-serif" 400 normal 12 3 1 1 17]
  [0 "arial, sans-serif" 400 normal 0 0 0 0 0]
  [16 "arial, sans-serif" 700 normal 12 4 0.5 0.5 17]
  [10 "arial, sans-serif" 700 normal 8 2 0.5 0.5 11]
  [13 "arial, sans-serif" 400 italic 10 3 1 1 15]
  [18 "arial, sans-serif" 400 normal 14 4 1 1 20]
  [11 "arial, sans-serif" 400 normal 9 2 0.5 0.5 12]
  [14 "arial, sans-serif" 700 normal 11 3 1 1 16]
  [0 "arial, sans-serif" 700 normal 0 0 0 0 0]
  [13 "Arial, sans-serif" 400 italic 10 3 1 1 15]
  [1 "Arial, sans-serif" 400 italic 1 0 0 0 1.2]
  [21 "Arial, sans-serif" 700 normal 16 5 1 1 23]
  [18 "Arial, sans-serif" 400 normal 14 4 1 1 20]
  [24 "Arial, sans-serif" 400 normal 19 5 1.5 1.5 27]
  [15 "Arial, sans-serif" 400 normal 12 3 1 1 17]
  [15 "Arial, sans-serif" 500 normal 12 3 1 1 17]
  [21 "Arial, sans-serif" 400 normal 16 5 1 1 23]
  [14 "Arial, sans-serif" 400 normal 11 3 1 1 16]
  [0 "Arial, sans-serif" 400 normal 0 0 0 0 0]
  [11 "Arial" 400 normal 9 2 0.5 0.5 12]
  [11 "Arial" 700 normal 9 2 0.5 0.5 12]
  [0 "a" 400 normal 0 0 0 0 0]
  [11 "Arial, sans-serif" 400 normal 9 2 0.5 0.5 12]
  [12 "Arial, sans-serif" 400 normal 9 3 1 1 14]
  [13 "Arial, sans-serif" 700 normal 10 3 1 1 15]
  [20 "Arial, sans-serif" 400 normal 16 4 1 1 22]
  [18 "arial, sans-serif" 700 normal 14 4 1 1 20]
  [16 "Arial, sans-serif" 400 normal 12 4 0.5 0.5 17]
  [16 "Arial, sans-serif" 400 italic 12 4 0.5 0.5 17]
  [22 "Arial, sans-serif" 400 normal 17 5 1.5 1.5 25]
  [22 "Arial, sans-serif" 400 italic 17 5 1.5 1.5 25]
  [17 "Arial, sans-serif" 400 normal 13 4 1 1 19]
  [11 "Arial, sans-serif" 700 normal 9 2 0.5 0.5 12]
  [10 "Arial, sans-serif" 700 normal 8 2 0.5 0.5 11]
  [15 "arial, sans-serif" 700 normal 12 3 1 1 17]
  [10 "arial, sans-serif" 400 normal 8 2 0.5 0.5 11])

(define-browser doc-1 :matched true :w 1920 :h 980 :fs 16 :scrollw 12)

(define-document doc-1
  ([html :num 0 :class (a-ember a-transition a-transform a-opacity a-border-image a-border-radius a-box-shadow a-text-stroke a-text-shadow a-touch-scrolling a-transform3d a-gradients a-local-storage a-textarea-placeholder a-input-placeholder a-autofocus a-webworker a-history a-geolocation a-drag-drop a-svg a-canvas a-video a-audio a-js TridactylThemeDefault a-ws a-audio a-video a-canvas a-svg a-drag-drop a-geolocation a-history a-webworker a-autofocus a-input-placeholder a-textarea-placeholder a-local-storage a-gradients a-transform3d a-touch-scrolling a-text-shadow a-text-stroke a-box-shadow a-border-radius a-border-image a-opacity a-transform a-transition)]
   ([head :num 1]
    ([script :num 2])
    ([script :num 3])
    ([script :num 4])
    ([script :num 5])
    ([meta :num 6])
    ([script :num 7])
    ([meta :num 8])
    ([link :num 9])
    ([link :num 10])
    ([link :num 11])
    ([script :num 12])
    ([link :num 13])
    ([script :num 14])
    ([script :num 15])
    ([script :num 16])
    ([style :num 17])
    ([link :num 18])
    ([link :num 19])
    ([link :num 20])
    ([script :num 21])
    ([script :num 22])
    ([script :num 23])
    ([script :num 24])
    ([script :num 25])
    ([script :num 26])
    ([link :num 27])
    ([title :num 28])
    ([meta :num 29])
    ([meta :num 30])
    ([meta :num 31])
    ([meta :num 32])
    ([link :num 33])
    ([meta :num 34])
    ([meta :num 35])
    ([meta :num 36])
    ([meta :num 37])
    ([meta :num 38])
    ([meta :num 39])
    ([script :num 40])
    ([script :num 41])
    ([script :num 42])
    ([script :num 43])
    ([script :num 44])
    ([script :num 45])
    ([script :num 46 :id DA_adblockerdetector])
    ([script :num 47])
    ([script :num 48])
    ([script :num 49])
    ([script :num 50])
    ([style :num 51])
    ([script :num 52])
    ([style :num 53])
    ([style :num 54])
    ([script :num 55])
    ([script :num 56])
    ([script :num 57])
    ([script :num 58])
    ([script :num 59])
    ([script :num 60])
    ([script :num 61])
    ([style :num 62])
    ([script :num 63 :id JscriptId::initSvcConnection]))
   ([body :num 64 :class (a-m-us a-aui_149818-c a-aui_152852-c a-aui_51744-c a-aui_57326-c a-aui_72554-c a-aui_accessibility_49860-c a-aui_attr_validations_1_51371-c a-aui_bolt_62845-c a-aui_perf_130093-c a-aui_tnr_140932-c a-aui_ux_113788-c a-aui_ux_114039-c a-aui_ux_138741-c a-aui_ux_145937-c a-aui_ux_59374-c a-aui_ux_60000-c a-meter-animate)]
    ([iframe :num 65 :id cmdline_iframe :class (cleanslate) :w 304 :h 4])
    ([div :num 66 :id a-page]
     ([script :num 67])
     ([script :num 68]) " " " " " "
     ([script :num 69]) " "
     ([img :num 70 :id edoc-10667 :w 0 :h 0]) " " " " " " " "
     ([script :num 71]) " " " " " " " "
     ([script :num 72]) " "
     ([script :num 73]) " "
     ([script :num 74]) " "
     ([style :num 75]) " "
     ([script :num 76]) " " " "
     ([noscript :num 77]) " "
     ([script :num 78]) " "
     ([a :num 79 :id nav-top]) " "
     ([script :num 80])
     ([div :num 81 :id nav-upnav]
      ([a :num 82 :id edoc-10014 :class (nav-a)]
       ([span :num 83 :class (nav-spanAltText)] "Interesting Finds Updated Daily")))
     ([script :num 84]) " "
     ([script :num 85])
     ([header :num 86 :class (nav-locale-us nav-lang-en nav-ssl nav-rec nav-opt-sprite)]
      ([div :num 87 :id navbar :class (nav-sprite-v1 nav-bluebeacon nav-packard-glow)]
       ([div :num 88 :id nav-belt]
        ([div :num 89 :class (nav-left)]
         ([script :num 90])
         ([script :num 91]) " "
         ([script :num 92]) " "
         ([div :num 93 :id nav-logo :class (nav-prime-1)]
          ([a :num 94 :id edoc-10015 :class (nav-logo-link)]
           ([span :num 95 :class (nav-logo-base nav-sprite)] "Amazon") " "
           ([span :num 96 :class (nav-logo-ext nav-sprite)]) " "
           ([span :num 97 :class (nav-logo-locale nav-sprite)])) " "
          ([a :num 98 :id edoc-10016 :class (nav-logo-tagline nav-sprite)])) " "
         ([script :num 99])) " "
        ([div :num 100 :class (nav-right)]
         ([script :num 101]) " "
         ([div :num 102 :id nav-swmslot] " "
          ([div :num 103 :id navSwmHoliday]
           ([a :num 104 :id edoc-10017 :class (nav-imageHref)]
            ([img :num 105 :w 400 :h 39]))) " ") " "
         ([script :num 106]))
        ([div :num 107 :class (nav-fill)]
         ([script :num 108])
         ([div :num 109 :id nav-search]
          ([div :num 110 :id nav-bar-left])
          ([form :num 111 :class (nav-searchbar)]
           ([div :num 112 :class (nav-left)]
            ([div :num 113 :class (nav-search-scope nav-sprite)]
             ([div :num 114 :class (nav-search-facade)]
              ([span :num 115 :class (nav-search-label)] "All")
              ([i :num 116 :class (nav-icon)])) " "
             ([span :num 117 :id searchDropdownDescription]) " "
             ([select :num 118 :id searchDropdownBox :class (nav-search-dropdown searchSelect)]
              ([option :num 119] "All Departments")
              ([option :num 120] "Alexa Skills")
              ([option :num 121] "Amazon Devices")
              ([option :num 122] "Amazon Fresh")
              ([option :num 123] "Amazon Warehouse")
              ([option :num 124] "Appliances")
              ([option :num 125] "Apps & Games")
              ([option :num 126] "Arts, Crafts & Sewing")
              ([option :num 127] "Automotive Parts & Accessories")
              ([option :num 128] "Baby")
              ([option :num 129] "Beauty & Personal Care")
              ([option :num 130] "Books")
              ([option :num 131] "CDs & Vinyl")
              ([option :num 132] "Cell Phones & Accessories")
              ([option :num 133] "Clothing, Shoes & Jewelry")
              ([option :num 134] " Women")
              ([option :num 135] " Men")
              ([option :num 136] " Girls")
              ([option :num 137] " Boys")
              ([option :num 138] " Baby")
              ([option :num 139] "Collectibles & Fine Art")
              ([option :num 140] "Computers")
              ([option :num 141] "Courses")
              ([option :num 142] "Credit and Payment Cards")
              ([option :num 143] "Digital Music")
              ([option :num 144] "Electronics")
              ([option :num 145] "Garden & Outdoor")
              ([option :num 146] "Gift Cards")
              ([option :num 147] "Grocery & Gourmet Food")
              ([option :num 148] "Handmade")
              ([option :num 149] "Health, Household & Baby Care")
              ([option :num 150] "Home & Business Services")
              ([option :num 151] "Home & Kitchen")
              ([option :num 152] "Industrial & Scientific")
              ([option :num 153] "Kindle Store")
              ([option :num 154] "Luggage & Travel Gear")
              ([option :num 155] "Luxury Beauty")
              ([option :num 156] "Magazine Subscriptions")
              ([option :num 157] "Movies & TV")
              ([option :num 158] "Musical Instruments")
              ([option :num 159] "Office Products")
              ([option :num 160] "Pet Supplies")
              ([option :num 161] "Prime Exclusive Savings")
              ([option :num 162] "Prime Pantry")
              ([option :num 163] "Prime Video")
              ([option :num 164] "Software")
              ([option :num 165] "Sports & Outdoors")
              ([option :num 166] "Tools & Home Improvement")
              ([option :num 167] "Toys & Games")
              ([option :num 168] "Vehicles")
              ([option :num 169] "Video Games")))) " "
           ([div :num 170 :class (nav-right)]
            ([div :num 171 :class (nav-search-submit nav-sprite)]
             ([span :num 172 :id nav-search-submit-text :class (nav-search-submit-text nav-sprite)] "Go")
             ([input :num 173 :class (nav-input) :w 45 :h 35 :type submit])))
           ([div :num 174 :class (nav-fill)]
            ([div :num 175 :class (nav-search-field )] " "
             ([label :num 176 :id nav-search-label :class (aok-offscreen)] " Search ") " "
             ([input :num 177 :id twotabsearchtextbox :class (nav-input) :w 1199 :h 33 :type text :dir auto]))
            ([div :num 178 :id nav-iss-attach]))))
         ([script :num 179]))
        ([div :num 180 :id nav-flyout-anchor]
         ([div :num 181 :id nav-flyout-prime :class (nav-coreFlyout nav-flyout)]
          ([div :num 182 :class (nav-arrow)]
           ([div :num 183 :class (nav-arrow-inner)]))
          ([div :num 184 :class (nav-template nav-flyout-content nav-spinner)]))
         ([div :num 185 :id nav-flyout-accountList :class (nav-coreFlyout nav-flyout)]
          ([div :num 186 :class (nav-arrow)]
           ([div :num 187 :class (nav-arrow-inner)]))
          ([div :num 188 :class (nav-template nav-flyout-content)]
           ([div :num 189 :id nav-al-container]
            ([div :num 190 :id nav-al-wishlist :class (nav-al-column nav-tpl-itemList)]
             ([div :num 191 :id nav-al-title :class (nav-title)])
             ([div :num 192 :id nav-flyout-wl-alexa :class (nav-template)])
             ([div :num 193 :id nav-flyout-wl-items :class (nav-template nav-spinner)])
             ([a :num 194 :id edoc-10018 :class (nav-link nav-item)]
              ([span :num 195 :class (nav-text)]))
             ([a :num 196 :id edoc-10019 :class (nav-link nav-item)]
              ([span :num 197 :class (nav-text)]))
             ([a :num 198 :id edoc-10020 :class (nav-link nav-item)]
              ([span :num 199 :class (nav-text)]))
             ([a :num 200 :id edoc-10021 :class (nav-link nav-item)]
              ([span :num 201 :class (nav-text)]))
             ([a :num 202 :id edoc-10022 :class (nav-link nav-item)]
              ([span :num 203 :class (nav-text)]))
             ([a :num 204 :id edoc-10023 :class (nav-link nav-item)]
              ([span :num 205 :class (nav-text)]))
             ([a :num 206 :id edoc-10024 :class (nav-link nav-item)]
              ([span :num 207 :class (nav-text)]))
             ([a :num 208 :id edoc-10025 :class (nav-link nav-item)]
              ([span :num 209 :class (nav-text)]))
             ([a :num 210 :id edoc-10026 :class (nav-link nav-item)]
              ([span :num 211 :class (nav-text)]))
             ([a :num 212 :id edoc-10027 :class (nav-link nav-item)]
              ([span :num 213 :class (nav-text)]))
             ([a :num 214 :id edoc-10028 :class (nav-link nav-item)]
              ([span :num 215 :class (nav-text)]))
             ([a :num 216 :id edoc-10029 :class (nav-link nav-item)]
              ([span :num 217 :class (nav-text)])))
            ([div :num 218 :id nav-al-your-account :class (nav-al-column nav-template nav-flyout-content nav-tpl-itemList)]
             ([div :num 219 :class (nav-title)])
             ([a :num 220 :id edoc-10030 :class (nav-link nav-item)]
              ([span :num 221 :class (nav-text)]))
             ([a :num 222 :id nav_prefetch_yourorders :class (nav-link nav-item)]
              ([span :num 223 :class (nav-text)]))
             ([a :num 224 :id edoc-10031 :class (nav-link nav-item)]
              ([span :num 225 :class (nav-text)]))
             ([a :num 226 :id edoc-10032 :class (nav-link nav-item)]
              ([span :num 227 :class (nav-text)]))
             ([a :num 228 :id edoc-10033 :class (nav-link nav-item)]
              ([span :num 229 :class (nav-text)]))
             ([a :num 230 :id edoc-10034 :class (nav-link nav-item)]
              ([span :num 231 :class (nav-text)]))
             ([a :num 232 :id edoc-10035 :class (nav-link nav-item)]
              ([span :num 233 :class (nav-text)]))
             ([a :num 234 :id edoc-10036 :class (nav-link nav-item)]
              ([span :num 235 :class (nav-text)]))
             ([a :num 236 :id edoc-10037 :class (nav-link nav-item)]
              ([span :num 237 :class (nav-text)]))
             ([a :num 238 :id edoc-10038 :class (nav-link nav-item)]
              ([span :num 239 :class (nav-text)]))
             ([a :num 240 :id edoc-10039 :class (nav-link nav-item)]
              ([span :num 241 :class (nav-text)]))
             ([a :num 242 :id edoc-10040 :class (nav-link nav-item)]
              ([span :num 243 :class (nav-text)]))
             ([a :num 244 :id edoc-10041 :class (nav-link nav-item)]
              ([span :num 245 :class (nav-text)]))
             ([a :num 246 :id edoc-10042 :class (nav-link nav-item)]
              ([span :num 247 :class (nav-text)]))
             ([a :num 248 :id edoc-10043 :class (nav-link nav-item)]
              ([span :num 249 :class (nav-text)]))
             ([a :num 250 :id edoc-10044 :class (nav-link nav-item)]
              ([span :num 251 :class (nav-text)]))
             ([a :num 252 :id edoc-10045 :class (nav-link nav-item)]
              ([span :num 253 :class (nav-text)]))
             ([a :num 254 :id edoc-10046 :class (nav-link nav-item)]
              ([span :num 255 :class (nav-text)]))
             ([a :num 256 :id edoc-10047 :class (nav-link nav-item)]
              ([span :num 257 :class (nav-text)]))
             ([a :num 258 :id edoc-10048 :class (nav-link nav-item)]
              ([span :num 259 :class (nav-text)]))
             ([a :num 260 :id edoc-10049 :class (nav-link nav-item)]
              ([span :num 261 :class (nav-text)]))
             ([a :num 262 :id edoc-10050 :class (nav-link nav-item)]
              ([span :num 263 :class (nav-text)]))
             ([a :num 264 :id nav-item-switch-account :class (nav-link nav-item)]
              ([span :num 265 :class (nav-text)]))
             ([a :num 266 :id nav-item-signout-sa :class (nav-link nav-item)]
              ([span :num 267 :class (nav-text)])))))
          ([div :num 268 :class (nav-subcats)]))
         ([div :num 269 :id nav-flyout-timeline :class (nav-coreFlyout nav-fullWidthFlyout nav-flyout)]
          ([div :num 270 :class (nav-arrow)]
           ([div :num 271 :class (nav-arrow-inner)]))
          ([div :num 272 :class (nav-template nav-flyout-content nav-spinner)]))
         ([div :num 273 :id nav-flyout-shopAll :class (nav-catFlyout nav-flyout)]
          ([div :num 274 :class (nav-arrow)]
           ([div :num 275 :class (nav-arrow-inner)]))
          ([div :num 276 :class (nav-template nav-flyout-content nav-tpl-itemList)]
           ([span :num 277 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 278 :class (nav-text)]))
           ([span :num 279 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 280 :class (nav-text)]))
           ([span :num 281 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 282 :class (nav-text)]))
           ([span :num 283 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 284 :class (nav-text)]))
           ([span :num 285 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 286 :class (nav-text)]))
           ([span :num 287 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 288 :class (nav-text)]))
           ([span :num 289 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 290 :class (nav-text)]))
           ([div :num 291 :class (nav-divider)])
           ([span :num 292 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 293 :class (nav-text)]
             ([span :num 294 :class (nav-badge)])))
           ([div :num 295 :class (nav-divider)])
           ([span :num 296 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 297 :class (nav-text)]))
           ([span :num 298 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 299 :class (nav-text)]))
           ([span :num 300 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 301 :class (nav-text)]))
           ([span :num 302 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 303 :class (nav-text)]))
           ([span :num 304 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 305 :class (nav-text)]))
           ([span :num 306 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 307 :class (nav-text)]))
           ([span :num 308 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 309 :class (nav-text)]))
           ([span :num 310 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 311 :class (nav-text)]))
           ([span :num 312 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 313 :class (nav-text)]))
           ([span :num 314 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 315 :class (nav-text)]))
           ([span :num 316 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 317 :class (nav-text)]))
           ([div :num 318 :class (nav-divider)])
           ([span :num 319 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 320 :class (nav-text)]))
           ([span :num 321 :class (                    nav-hasPanel                              nav-item)]
            ([span :num 322 :class (nav-text)]))
           ([a :num 323 :id edoc-10051 :class (nav-link                                nav-carat                  nav-item)]
            ([i :num 324 :class (nav-icon)])
            ([span :num 325 :class (nav-text)])))
          ([div :num 326 :class (nav-subcats)]
           ([div :num 327 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 328 :id edoc-10668 :class (nav-promo) :w 0 :h 0])
            ([map :num 329 :id nav_imgmap_nav-sa-instant-video]
             ([area :num 330])
             ([area :num 331])
             ([area :num 332]))
            ([div :num 333 :class (nav-column nav-column-first)]
             ([span :num 334 :class (                          nav-title                        nav-item)]
              ([span :num 335 :class (nav-text)]))
             ([div :num 336 :class (nav-panel)]
              ([a :num 337 :id edoc-10052 :class (nav-link                                    nav-item)]
               ([span :num 338 :class (nav-text)])
               ([span :num 339 :class (nav-subtext)]))
              ([a :num 340 :id edoc-10053 :class (nav-link                                    nav-item)]
               ([span :num 341 :class (nav-text)])
               ([span :num 342 :class (nav-subtext)]))
              ([a :num 343 :id edoc-10054 :class (nav-link                                    nav-item)]
               ([span :num 344 :class (nav-text)])
               ([span :num 345 :class (nav-subtext)]))
              ([a :num 346 :id edoc-10055 :class (nav-link                                    nav-item)]
               ([span :num 347 :class (nav-text)])
               ([span :num 348 :class (nav-subtext)]))
              ([div :num 349 :class (nav-divider)])
              ([a :num 350 :id edoc-10056 :class (nav-link                                    nav-item)]
               ([span :num 351 :class (nav-text)]))
              ([a :num 352 :id edoc-10057 :class (nav-link                                    nav-item)]
               ([span :num 353 :class (nav-text)]))
              ([a :num 354 :id edoc-10058 :class (nav-link                                    nav-item)]
               ([span :num 355 :class (nav-text)]))
              ([a :num 356 :id edoc-10059 :class (nav-link                                    nav-item)]
               ([span :num 357 :class (nav-text)]))))
            ([div :num 358 :class (nav-column nav-column-notfirst nav-column-break)]
             ([span :num 359 :class (                          nav-title                        nav-item)]
              ([span :num 360 :class (nav-text)]))
             ([div :num 361 :class (nav-panel)]
              ([a :num 362 :id edoc-10060 :class (nav-link                                    nav-item)]
               ([span :num 363 :class (nav-text)])
               ([span :num 364 :class (nav-subtext)]))
              ([a :num 365 :id edoc-10061 :class (nav-link                                    nav-item)]
               ([span :num 366 :class (nav-text)])
               ([span :num 367 :class (nav-subtext)]))
              ([a :num 368 :id edoc-10062 :class (nav-link                                    nav-item)]
               ([span :num 369 :class (nav-text)])))))
           ([div :num 370 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 371 :id edoc-10669 :class (nav-promo) :w 0 :h 0])
            ([map :num 372 :id nav_imgmap_nav-sa-digital-music]
             ([area :num 373]))
            ([span :num 374 :class (                          nav-title                        nav-item)]
             ([span :num 375 :class (nav-text)]))
            ([div :num 376 :class (nav-panel)]
             ([a :num 377 :id edoc-10063 :class (nav-link                                    nav-item)]
              ([span :num 378 :class (nav-text)])
              ([span :num 379 :class (nav-subtext)]))
             ([a :num 380 :id edoc-10064 :class (nav-link                                    nav-item)]
              ([span :num 381 :class (nav-text)])
              ([span :num 382 :class (nav-subtext)]))
             ([div :num 383 :class (nav-divider)])
             ([a :num 384 :id edoc-10065 :class (nav-link                                    nav-item)]
              ([span :num 385 :class (nav-text)])
              ([span :num 386 :class (nav-subtext)])))
            ([div :num 387 :class (nav-divider)])
            ([span :num 388 :class (                          nav-title                        nav-item)]
             ([span :num 389 :class (nav-text)]))
            ([div :num 390 :class (nav-panel)]
             ([a :num 391 :id edoc-10066 :class (nav-link                                    nav-item)]
              ([span :num 392 :class (nav-text)])
              ([span :num 393 :class (nav-subtext)]))
             ([a :num 394 :id edoc-10067 :class (nav-link                                    nav-item)]
              ([span :num 395 :class (nav-text)])
              ([span :num 396 :class (nav-subtext)]))))
           ([div :num 397 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 398 :id edoc-10670 :class (nav-promo) :w 0 :h 0])
            ([map :num 399 :id nav_imgmap_nav-sa-android]
             ([area :num 400]))
            ([span :num 401 :class (                          nav-title                        nav-item)]
             ([span :num 402 :class (nav-text)]))
            ([div :num 403 :class (nav-panel)]
             ([a :num 404 :id edoc-10068 :class (nav-link                                    nav-item)]
              ([span :num 405 :class (nav-text)])
              ([span :num 406 :class (nav-subtext)]))
             ([a :num 407 :id edoc-10069 :class (nav-link                                    nav-item)]
              ([span :num 408 :class (nav-text)])
              ([span :num 409 :class (nav-subtext)]))
             ([a :num 410 :id edoc-10070 :class (nav-link                                    nav-item)]
              ([span :num 411 :class (nav-text)])
              ([span :num 412 :class (nav-subtext)]))
             ([div :num 413 :class (nav-divider)])
             ([a :num 414 :id edoc-10071 :class (nav-link                                    nav-item)]
              ([span :num 415 :class (nav-text)])
              ([span :num 416 :class (nav-subtext)]))
             ([a :num 417 :id edoc-10072 :class (nav-link                                    nav-item)]
              ([span :num 418 :class (nav-text)])
              ([span :num 419 :class (nav-subtext)]))
             ([a :num 420 :id edoc-10073 :class (nav-link                                    nav-item)]
              ([span :num 421 :class (nav-text)])
              ([span :num 422 :class (nav-subtext)]))))
           ([div :num 423 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 424 :id edoc-10671 :class (nav-promo) :w 0 :h 0])
            ([map :num 425 :id nav_imgmap_nav-sa-kindle-amazon-echo]
             ([area :num 426]))
            ([div :num 427 :class (nav-column nav-column-first)]
             ([span :num 428 :class (                          nav-title                        nav-item)]
              ([span :num 429 :class (nav-text)]))
             ([div :num 430 :class (nav-panel)]
              ([a :num 431 :id edoc-10074 :class (nav-link                                    nav-item)]
               ([span :num 432 :class (nav-text)])
               ([span :num 433 :class (nav-subtext)]))
              ([a :num 434 :id edoc-10075 :class (nav-link                                    nav-item)]
               ([span :num 435 :class (nav-text)])
               ([span :num 436 :class (nav-subtext)]))
              ([a :num 437 :id edoc-10076 :class (nav-link                                    nav-item)]
               ([span :num 438 :class (nav-text)])
               ([span :num 439 :class (nav-subtext)]))
              ([a :num 440 :id edoc-10077 :class (nav-link                                    nav-item)]
               ([span :num 441 :class (nav-text)])
               ([span :num 442 :class (nav-subtext)]))
              ([div :num 443 :class (nav-divider)])
              ([a :num 444 :id edoc-10078 :class (nav-link                                    nav-item)]
               ([span :num 445 :class (nav-text)])
               ([span :num 446 :class (nav-subtext)]))
              ([a :num 447 :id edoc-10079 :class (nav-link                                    nav-item)]
               ([span :num 448 :class (nav-text)])
               ([span :num 449 :class (nav-subtext)]))
              ([a :num 450 :id edoc-10080 :class (nav-link                                    nav-item)]
               ([span :num 451 :class (nav-text)])
               ([span :num 452 :class (nav-subtext)]))
              ([a :num 453 :id edoc-10081 :class (nav-link                                    nav-item)]
               ([span :num 454 :class (nav-text)])
               ([span :num 455 :class (nav-subtext)]))))
            ([div :num 456 :class (nav-column nav-column-notfirst nav-column-break)]
             ([span :num 457 :class (                          nav-title                        nav-item)]
              ([span :num 458 :class (nav-text)]))
             ([div :num 459 :class (nav-panel)]
              ([a :num 460 :id edoc-10082 :class (nav-link                                    nav-item)]
               ([span :num 461 :class (nav-text)])
               ([span :num 462 :class (nav-subtext)]))
              ([a :num 463 :id edoc-10083 :class (nav-link                                    nav-item)]
               ([span :num 464 :class (nav-text)])
               ([span :num 465 :class (nav-subtext)])))
             ([div :num 466 :class (nav-divider)])
             ([span :num 467 :class (                          nav-title                        nav-item)]
              ([span :num 468 :class (nav-text)]))
             ([div :num 469 :class (nav-panel)]
              ([a :num 470 :id edoc-10084 :class (nav-link                                    nav-item)]
               ([span :num 471 :class (nav-text)])
               ([span :num 472 :class (nav-subtext)]))
              ([a :num 473 :id edoc-10085 :class (nav-link                                    nav-item)]
               ([span :num 474 :class (nav-text)])
               ([span :num 475 :class (nav-subtext)]))
              ([a :num 476 :id edoc-10086 :class (nav-link                                    nav-item)]
               ([span :num 477 :class (nav-text)])
               ([span :num 478 :class (nav-subtext)]))
              ([a :num 479 :id edoc-10087 :class (nav-link                                    nav-item)]
               ([span :num 480 :class (nav-text)])
               ([span :num 481 :class (nav-subtext)]))
              ([a :num 482 :id edoc-10088 :class (nav-link                                    nav-item)]
               ([span :num 483 :class (nav-text)])
               ([span :num 484 :class (nav-subtext)]))
              ([a :num 485 :id edoc-10089 :class (nav-link                                    nav-item)]
               ([span :num 486 :class (nav-text)])
               ([span :num 487 :class (nav-subtext)]))
              ([a :num 488 :id edoc-10090 :class (nav-link                                    nav-item)]
               ([span :num 489 :class (nav-text)])
               ([span :num 490 :class (nav-subtext)])))))
           ([div :num 491 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 492 :id edoc-10672 :class (nav-promo) :w 0 :h 0])
            ([map :num 493 :id nav_imgmap_nav-sa-kindle-fire-tablet]
             ([area :num 494]))
            ([div :num 495 :class (nav-column nav-column-first)]
             ([span :num 496 :class (                          nav-title                        nav-item)]
              ([span :num 497 :class (nav-text)]))
             ([div :num 498 :class (nav-panel)]
              ([a :num 499 :id edoc-10091 :class (nav-link                                    nav-item)]
               ([span :num 500 :class (nav-text)])
               ([span :num 501 :class (nav-subtext)]))
              ([a :num 502 :id edoc-10092 :class (nav-link                                    nav-item)]
               ([span :num 503 :class (nav-text)])
               ([span :num 504 :class (nav-subtext)]))
              ([a :num 505 :id edoc-10093 :class (nav-link                                    nav-item)]
               ([span :num 506 :class (nav-text)])
               ([span :num 507 :class (nav-subtext)]))
              ([a :num 508 :id edoc-10094 :class (nav-link                                    nav-item)]
               ([span :num 509 :class (nav-text)])
               ([span :num 510 :class (nav-subtext)]))
              ([a :num 511 :id edoc-10095 :class (nav-link                                    nav-item)]
               ([span :num 512 :class (nav-text)])
               ([span :num 513 :class (nav-subtext)]))
              ([a :num 514 :id edoc-10096 :class (nav-link                                    nav-item)]
               ([span :num 515 :class (nav-text)])
               ([span :num 516 :class (nav-subtext)]))
              ([a :num 517 :id edoc-10097 :class (nav-link                                    nav-item)]
               ([span :num 518 :class (nav-text)])
               ([span :num 519 :class (nav-subtext)]))
              ([a :num 520 :id edoc-10098 :class (nav-link                                    nav-item)]
               ([span :num 521 :class (nav-text)])
               ([span :num 522 :class (nav-subtext)]))))
            ([div :num 523 :class (nav-column nav-column-notfirst nav-column-break)]
             ([span :num 524 :class (                          nav-title                        nav-item)]
              ([span :num 525 :class (nav-text)]))
             ([div :num 526 :class (nav-panel)]
              ([a :num 527 :id edoc-10099 :class (nav-link                                    nav-item)]
               ([span :num 528 :class (nav-text)]))
              ([a :num 529 :id edoc-10100 :class (nav-link                                    nav-item)]
               ([span :num 530 :class (nav-text)]))
              ([a :num 531 :id edoc-10101 :class (nav-link                                    nav-item)]
               ([span :num 532 :class (nav-text)]))
              ([a :num 533 :id edoc-10102 :class (nav-link                                    nav-item)]
               ([span :num 534 :class (nav-text)]))
              ([a :num 535 :id edoc-10103 :class (nav-link                                    nav-item)]
               ([span :num 536 :class (nav-text)]))
              ([a :num 537 :id edoc-10104 :class (nav-link                                    nav-item)]
               ([span :num 538 :class (nav-text)]))
              ([a :num 539 :id edoc-10105 :class (nav-link                                    nav-item)]
               ([span :num 540 :class (nav-text)]))
              ([a :num 541 :id edoc-10106 :class (nav-link                                    nav-item)]
               ([span :num 542 :class (nav-text)]))
              ([a :num 543 :id edoc-10107 :class (nav-link                                    nav-item)]
               ([span :num 544 :class (nav-text)]))
              ([a :num 545 :id edoc-10108 :class (nav-link                                    nav-item)]
               ([span :num 546 :class (nav-text)])))))
           ([div :num 547 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 548 :id edoc-10673 :class (nav-promo) :w 0 :h 0])
            ([map :num 549 :id nav_imgmap_nav-sa-fire-tv]
             ([area :num 550]))
            ([div :num 551 :class (nav-column nav-column-first)]
             ([span :num 552 :class (                          nav-title                        nav-item)]
              ([span :num 553 :class (nav-text)]))
             ([div :num 554 :class (nav-panel)]
              ([a :num 555 :id edoc-10109 :class (nav-link                                    nav-item)]
               ([span :num 556 :class (nav-text)])
               ([span :num 557 :class (nav-subtext)]))
              ([a :num 558 :id edoc-10110 :class (nav-link                                    nav-item)]
               ([span :num 559 :class (nav-text)])
               ([span :num 560 :class (nav-subtext)]))
              ([a :num 561 :id edoc-10111 :class (nav-link                                    nav-item)]
               ([span :num 562 :class (nav-text)])
               ([span :num 563 :class (nav-subtext)]))
              ([a :num 564 :id edoc-10112 :class (nav-link                                    nav-item)]
               ([span :num 565 :class (nav-text)])
               ([span :num 566 :class (nav-subtext)]))
              ([a :num 567 :id edoc-10113 :class (nav-link                                    nav-item)]
               ([span :num 568 :class (nav-text)])
               ([span :num 569 :class (nav-subtext)]))
              ([a :num 570 :id edoc-10114 :class (nav-link                                    nav-item)]
               ([span :num 571 :class (nav-text)])
               ([span :num 572 :class (nav-subtext)]))))
            ([div :num 573 :class (nav-column nav-column-notfirst nav-column-break)]
             ([span :num 574 :class (                          nav-title                        nav-item)]
              ([span :num 575 :class (nav-text)]))
             ([div :num 576 :class (nav-panel)]
              ([a :num 577 :id edoc-10115 :class (nav-link                                    nav-item)]
               ([span :num 578 :class (nav-text)]))
              ([a :num 579 :id edoc-10116 :class (nav-link                                    nav-item)]
               ([span :num 580 :class (nav-text)]))
              ([a :num 581 :id edoc-10117 :class (nav-link                                    nav-item)]
               ([span :num 582 :class (nav-text)]))
              ([a :num 583 :id edoc-10118 :class (nav-link                                    nav-item)]
               ([span :num 584 :class (nav-text)]))
              ([a :num 585 :id edoc-10119 :class (nav-link                                    nav-item)]
               ([span :num 586 :class (nav-text)])))))
           ([div :num 587 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 588 :id edoc-10674 :class (nav-promo) :w 0 :h 0])
            ([map :num 589 :id nav_imgmap_nav-sa-kindle-reader]
             ([area :num 590]))
            ([div :num 591 :class (nav-column nav-column-first)]
             ([span :num 592 :class (                          nav-title                        nav-item)]
              ([span :num 593 :class (nav-text)]))
             ([div :num 594 :class (nav-panel)]
              ([a :num 595 :id edoc-10120 :class (nav-link                                    nav-item)]
               ([span :num 596 :class (nav-text)])
               ([span :num 597 :class (nav-subtext)]))
              ([a :num 598 :id edoc-10121 :class (nav-link                                    nav-item)]
               ([span :num 599 :class (nav-text)])
               ([span :num 600 :class (nav-subtext)]))
              ([a :num 601 :id edoc-10122 :class (nav-link                                    nav-item)]
               ([span :num 602 :class (nav-text)])
               ([span :num 603 :class (nav-subtext)]))
              ([a :num 604 :id edoc-10123 :class (nav-link                                    nav-item)]
               ([span :num 605 :class (nav-text)])
               ([span :num 606 :class (nav-subtext)]))
              ([a :num 607 :id edoc-10124 :class (nav-link                                    nav-item)]
               ([span :num 608 :class (nav-text)])
               ([span :num 609 :class (nav-subtext)]))
              ([a :num 610 :id edoc-10125 :class (nav-link                                    nav-item)]
               ([span :num 611 :class (nav-text)])
               ([span :num 612 :class (nav-subtext)]))
              ([a :num 613 :id edoc-10126 :class (nav-link                                    nav-item)]
               ([span :num 614 :class (nav-text)])
               ([span :num 615 :class (nav-subtext)])))
             ([div :num 616 :class (nav-divider)])
             ([span :num 617 :class (                          nav-title                        nav-item)]
              ([span :num 618 :class (nav-text)]))
             ([div :num 619 :class (nav-panel)]
              ([a :num 620 :id edoc-10127 :class (nav-link                                    nav-item)]
               ([span :num 621 :class (nav-text)]))
              ([a :num 622 :id edoc-10128 :class (nav-link                                    nav-item)]
               ([span :num 623 :class (nav-text)]))
              ([a :num 624 :id edoc-10129 :class (nav-link                                    nav-item)]
               ([span :num 625 :class (nav-text)])
               ([span :num 626 :class (nav-subtext)]))
              ([a :num 627 :id edoc-10130 :class (nav-link                                    nav-item)]
               ([span :num 628 :class (nav-text)]))))
            ([div :num 629 :class (nav-column nav-column-notfirst nav-column-break)]
             ([span :num 630 :class (                          nav-title                        nav-item)]
              ([span :num 631 :class (nav-text)]))
             ([div :num 632 :class (nav-panel)]
              ([a :num 633 :id edoc-10131 :class (nav-link                                    nav-item)]
               ([span :num 634 :class (nav-text)])
               ([span :num 635 :class (nav-subtext)]))
              ([a :num 636 :id edoc-10132 :class (nav-link                                    nav-item)]
               ([span :num 637 :class (nav-text)])
               ([span :num 638 :class (nav-subtext)]))
              ([a :num 639 :id edoc-10133 :class (nav-link                                    nav-item)]
               ([span :num 640 :class (nav-text)])))))
           ([div :num 641 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 642 :id edoc-10675 :class (nav-promo) :w 0 :h 0])
            ([map :num 643 :id nav_imgmap_nav-sa-amazon-fresh]
             ([area :num 644]))
            ([span :num 645 :class (                          nav-title                        nav-item)]
             ([span :num 646 :class (nav-text)]))
            ([div :num 647 :class (nav-panel)]
             ([a :num 648 :id edoc-10134 :class (nav-link                                    nav-item)]
              ([span :num 649 :class (nav-text)]))
             ([a :num 650 :id edoc-10135 :class (nav-link                                    nav-item)]
              ([span :num 651 :class (nav-text)]))
             ([a :num 652 :id edoc-10136 :class (nav-link                                    nav-item)]
              ([span :num 653 :class (nav-text)]))
             ([a :num 654 :id edoc-10137 :class (nav-link                                    nav-item)]
              ([span :num 655 :class (nav-text)]))
             ([a :num 656 :id edoc-10138 :class (nav-link                                    nav-item)]
              ([span :num 657 :class (nav-text)]))
             ([a :num 658 :id edoc-10139 :class (nav-link                                    nav-item)]
              ([span :num 659 :class (nav-text)]))
             ([a :num 660 :id edoc-10140 :class (nav-link                                    nav-item)]
              ([span :num 661 :class (nav-text)]))
             ([a :num 662 :id edoc-10141 :class (nav-link                                    nav-item)]
              ([span :num 663 :class (nav-text)]))
             ([a :num 664 :id edoc-10142 :class (nav-link                                    nav-item)]
              ([span :num 665 :class (nav-text)]))
             ([a :num 666 :id edoc-10143 :class (nav-link                                    nav-item)]
              ([span :num 667 :class (nav-text)]))
             ([a :num 668 :id edoc-10144 :class (nav-link                                    nav-item)]
              ([span :num 669 :class (nav-text)]))
             ([a :num 670 :id edoc-10145 :class (nav-link                                    nav-item)]
              ([span :num 671 :class (nav-text)]))
             ([a :num 672 :id edoc-10146 :class (nav-link                                    nav-item)]
              ([span :num 673 :class (nav-text)]))
             ([a :num 674 :id edoc-10147 :class (nav-link                                    nav-item)]
              ([span :num 675 :class (nav-text)]))
             ([a :num 676 :id edoc-10148 :class (nav-link                                    nav-item)]
              ([span :num 677 :class (nav-text)]))
             ([a :num 678 :id edoc-10149 :class (nav-link                                    nav-item)]
              ([span :num 679 :class (nav-text)]))
             ([div :num 680 :class (nav-divider)])
             ([a :num 681 :id edoc-10150 :class (nav-link                                    nav-item)]
              ([span :num 682 :class (nav-text)]))
             ([a :num 683 :id edoc-10151 :class (nav-link                                    nav-item)]
              ([span :num 684 :class (nav-text)]))
             ([div :num 685 :class (nav-divider)])
             ([a :num 686 :id edoc-10152 :class (nav-link                                    nav-item)]
              ([span :num 687 :class (nav-text)]))))
           ([div :num 688 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 689 :id edoc-10676 :class (nav-promo) :w 0 :h 0])
            ([map :num 690 :id nav_imgmap_nav-sa-books]
             ([area :num 691]))
            ([span :num 692 :class (                          nav-title                        nav-item)]
             ([span :num 693 :class (nav-text)]))
            ([div :num 694 :class (nav-panel)]
             ([a :num 695 :id edoc-10153 :class (nav-link                                    nav-item)]
              ([span :num 696 :class (nav-text)]))
             ([a :num 697 :id edoc-10154 :class (nav-link                                    nav-item)]
              ([span :num 698 :class (nav-text)]))
             ([a :num 699 :id edoc-10155 :class (nav-link                                    nav-item)]
              ([span :num 700 :class (nav-text)])
              ([span :num 701 :class (nav-subtext)]))
             ([a :num 702 :id edoc-10156 :class (nav-link                                    nav-item)]
              ([span :num 703 :class (nav-text)]))
             ([div :num 704 :class (nav-divider)])
             ([a :num 705 :id edoc-10157 :class (nav-link                                    nav-item)]
              ([span :num 706 :class (nav-text)]))
             ([a :num 707 :id edoc-10158 :class (nav-link                                    nav-item)]
              ([span :num 708 :class (nav-text)]))
             ([a :num 709 :id edoc-10159 :class (nav-link                                    nav-item)]
              ([span :num 710 :class (nav-text)]))
             ([a :num 711 :id edoc-10160 :class (nav-link                                    nav-item)]
              ([span :num 712 :class (nav-text)])))
            ([div :num 713 :class (nav-divider)])
            ([span :num 714 :class (                          nav-title                        nav-item)]
             ([span :num 715 :class (nav-text)]))
            ([div :num 716 :class (nav-panel)]
             ([a :num 717 :id edoc-10161 :class (nav-link                                    nav-item)]
              ([span :num 718 :class (nav-text)]))
             ([a :num 719 :id edoc-10162 :class (nav-link                                    nav-item)]
              ([span :num 720 :class (nav-text)]))
             ([a :num 721 :id edoc-10163 :class (nav-link                                    nav-item)]
              ([span :num 722 :class (nav-text)]))
             ([a :num 723 :id edoc-10164 :class (nav-link                                    nav-item)]
              ([span :num 724 :class (nav-text)])
              ([span :num 725 :class (nav-subtext)])))
            ([div :num 726 :class (nav-divider)])
            ([span :num 727 :class (                          nav-title                        nav-item)]
             ([span :num 728 :class (nav-text)]))
            ([div :num 729 :class (nav-panel)]
             ([a :num 730 :id edoc-10165 :class (nav-link                                    nav-item)]
              ([span :num 731 :class (nav-text)])
              ([span :num 732 :class (nav-subtext)]))
             ([a :num 733 :id edoc-10166 :class (nav-link                                    nav-item)]
              ([span :num 734 :class (nav-text)]))))
           ([div :num 735 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 736 :id edoc-10677 :class (nav-promo) :w 0 :h 0])
            ([map :num 737 :id nav_imgmap_nav-sa-movies-music-games]
             ([area :num 738]))
            ([span :num 739 :class (                          nav-title                        nav-item)]
             ([span :num 740 :class (nav-text)]))
            ([div :num 741 :class (nav-panel)]
             ([a :num 742 :id edoc-10167 :class (nav-link                                    nav-item)]
              ([span :num 743 :class (nav-text)]))
             ([a :num 744 :id edoc-10168 :class (nav-link                                    nav-item)]
              ([span :num 745 :class (nav-text)]))
             ([a :num 746 :id edoc-10169 :class (nav-link                                    nav-item)]
              ([span :num 747 :class (nav-text)]))
             ([a :num 748 :id edoc-10170 :class (nav-link                                    nav-item)]
              ([span :num 749 :class (nav-text)]))
             ([div :num 750 :class (nav-divider)])
             ([a :num 751 :id edoc-10171 :class (nav-link                                    nav-item)]
              ([span :num 752 :class (nav-text)]))
             ([a :num 753 :id edoc-10172 :class (nav-link                                    nav-item)]
              ([span :num 754 :class (nav-text)]))
             ([a :num 755 :id edoc-10173 :class (nav-link                                    nav-item)]
              ([span :num 756 :class (nav-text)]))
             ([a :num 757 :id edoc-10174 :class (nav-link                                    nav-item)]
              ([span :num 758 :class (nav-text)]))
             ([div :num 759 :class (nav-divider)])
             ([a :num 760 :id edoc-10175 :class (nav-link                                    nav-item)]
              ([span :num 761 :class (nav-text)]))
             ([a :num 762 :id edoc-10176 :class (nav-link                                    nav-item)]
              ([span :num 763 :class (nav-text)]))
             ([a :num 764 :id edoc-10177 :class (nav-link                                    nav-item)]
              ([span :num 765 :class (nav-text)]))
             ([div :num 766 :class (nav-divider)])
             ([a :num 767 :id edoc-10178 :class (nav-link                                    nav-item)]
              ([span :num 768 :class (nav-text)]))
             ([a :num 769 :id edoc-10179 :class (nav-link                                    nav-item)]
              ([span :num 770 :class (nav-text)]))))
           ([div :num 771 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 772 :id edoc-10678 :class (nav-promo) :w 0 :h 0])
            ([map :num 773 :id nav_imgmap_nav-sa-electronics-computers]
             ([area :num 774]))
            ([div :num 775 :class (nav-column nav-column-first)]
             ([span :num 776 :class (                          nav-title                        nav-item)]
              ([span :num 777 :class (nav-text)]))
             ([div :num 778 :class (nav-panel)]
              ([a :num 779 :id edoc-10180 :class (nav-link                                    nav-item)]
               ([span :num 780 :class (nav-text)]))
              ([a :num 781 :id edoc-10181 :class (nav-link                                    nav-item)]
               ([span :num 782 :class (nav-text)]))
              ([a :num 783 :id edoc-10182 :class (nav-link                                    nav-item)]
               ([span :num 784 :class (nav-text)]))
              ([a :num 785 :id edoc-10183 :class (nav-link                                    nav-item)]
               ([span :num 786 :class (nav-text)]))
              ([a :num 787 :id edoc-10184 :class (nav-link                                    nav-item)]
               ([span :num 788 :class (nav-text)]))
              ([a :num 789 :id edoc-10185 :class (nav-link                                    nav-item)]
               ([span :num 790 :class (nav-text)]))
              ([a :num 791 :id edoc-10186 :class (nav-link                                    nav-item)]
               ([span :num 792 :class (nav-text)]))
              ([a :num 793 :id edoc-10187 :class (nav-link                                    nav-item)]
               ([span :num 794 :class (nav-text)]))
              ([a :num 795 :id edoc-10188 :class (nav-link                                    nav-item)]
               ([span :num 796 :class (nav-text)]))
              ([a :num 797 :id edoc-10189 :class (nav-link                                    nav-item)]
               ([span :num 798 :class (nav-text)]))
              ([a :num 799 :id edoc-10190 :class (nav-link                                    nav-item)]
               ([span :num 800 :class (nav-text)]))))
            ([div :num 801 :class (nav-column nav-column-notfirst nav-column-break)]
             ([span :num 802 :class (                          nav-title                        nav-item)]
              ([span :num 803 :class (nav-text)]))
             ([div :num 804 :class (nav-panel)]
              ([a :num 805 :id edoc-10191 :class (nav-link                                    nav-item)]
               ([span :num 806 :class (nav-text)]))
              ([a :num 807 :id edoc-10192 :class (nav-link                                    nav-item)]
               ([span :num 808 :class (nav-text)]))
              ([a :num 809 :id edoc-10193 :class (nav-link                                    nav-item)]
               ([span :num 810 :class (nav-text)])
               ([span :num 811 :class (nav-subtext)]))
              ([a :num 812 :id edoc-10194 :class (nav-link                                    nav-item)]
               ([span :num 813 :class (nav-text)]))
              ([a :num 814 :id edoc-10195 :class (nav-link                                    nav-item)]
               ([span :num 815 :class (nav-text)]))
              ([a :num 816 :id edoc-10196 :class (nav-link                                    nav-item)]
               ([span :num 817 :class (nav-text)]))
              ([a :num 818 :id edoc-10197 :class (nav-link                                    nav-item)]
               ([span :num 819 :class (nav-text)])
               ([span :num 820 :class (nav-subtext)]))
              ([a :num 821 :id edoc-10198 :class (nav-link                                    nav-item)]
               ([span :num 822 :class (nav-text)]))
              ([a :num 823 :id edoc-10199 :class (nav-link                                    nav-item)]
               ([span :num 824 :class (nav-text)]))
              ([a :num 825 :id edoc-10200 :class (nav-link                                    nav-item)]
               ([span :num 826 :class (nav-text)])))))
           ([div :num 827 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 828 :id edoc-10679 :class (nav-promo) :w 0 :h 0])
            ([map :num 829 :id nav_imgmap_nav-sa-home-garden-tools]
             ([area :num 830]))
            ([div :num 831 :class (nav-column nav-column-first)]
             ([a :num 832 :id edoc-10201 :class (nav-link                          nav-title                        nav-item)]
              ([span :num 833 :class (nav-text)]))
             ([div :num 834 :class (nav-panel)]
              ([a :num 835 :id edoc-10202 :class (nav-link                                    nav-item)]
               ([span :num 836 :class (nav-text)]))
              ([a :num 837 :id edoc-10203 :class (nav-link                                    nav-item)]
               ([span :num 838 :class (nav-text)]))
              ([div :num 839 :class (nav-divider)])
              ([a :num 840 :id edoc-10204 :class (nav-link                                    nav-item)]
               ([span :num 841 :class (nav-text)]))
              ([a :num 842 :id edoc-10205 :class (nav-link                                    nav-item)]
               ([span :num 843 :class (nav-text)]))
              ([a :num 844 :id edoc-10206 :class (nav-link                                    nav-item)]
               ([span :num 845 :class (nav-text)]))
              ([a :num 846 :id edoc-10207 :class (nav-link                                    nav-item)]
               ([span :num 847 :class (nav-text)]))
              ([a :num 848 :id edoc-10208 :class (nav-link                                    nav-item)]
               ([span :num 849 :class (nav-text)]))
              ([a :num 850 :id edoc-10209 :class (nav-link                                    nav-item)]
               ([span :num 851 :class (nav-text)]))
              ([a :num 852 :id edoc-10210 :class (nav-link                                    nav-item)]
               ([span :num 853 :class (nav-text)]))
              ([a :num 854 :id edoc-10211 :class (nav-link                                    nav-item)]
               ([span :num 855 :class (nav-text)])))
             ([div :num 856 :class (nav-divider)])
             ([a :num 857 :id edoc-10212 :class (nav-link                                    nav-item)]
              ([span :num 858 :class (nav-text)]))
             ([a :num 859 :id edoc-10213 :class (nav-link                                    nav-item)]
              ([span :num 860 :class (nav-text)]))
             ([div :num 861 :class (nav-divider)])
             ([span :num 862 :class (                          nav-title                        nav-item)]
              ([span :num 863 :class (nav-text)]))
             ([div :num 864 :class (nav-panel)]
              ([a :num 865 :id edoc-10214 :class (nav-link                                    nav-item)]
               ([span :num 866 :class (nav-text)]))
              ([a :num 867 :id edoc-10215 :class (nav-link                                    nav-item)]
               ([span :num 868 :class (nav-text)]))))
            ([div :num 869 :class (nav-column nav-column-notfirst nav-column-break)]
             ([a :num 870 :id edoc-10216 :class (nav-link                          nav-title                        nav-item)]
              ([span :num 871 :class (nav-text)]))
             ([div :num 872 :class (nav-panel)]
              ([a :num 873 :id edoc-10217 :class (nav-link                                    nav-item)]
               ([span :num 874 :class (nav-text)]))
              ([a :num 875 :id edoc-10218 :class (nav-link                                    nav-item)]
               ([span :num 876 :class (nav-text)]))
              ([a :num 877 :id edoc-10219 :class (nav-link                                    nav-item)]
               ([span :num 878 :class (nav-text)]))
              ([a :num 879 :id edoc-10220 :class (nav-link                                    nav-item)]
               ([span :num 880 :class (nav-text)])))
             ([div :num 881 :class (nav-divider)])
             ([span :num 882 :class (                          nav-title                        nav-item)]
              ([span :num 883 :class (nav-text)]))
             ([div :num 884 :class (nav-panel)]
              ([a :num 885 :id edoc-10221 :class (nav-link                                    nav-item)]
               ([span :num 886 :class (nav-text)]))
              ([a :num 887 :id edoc-10222 :class (nav-link                                    nav-item)]
               ([span :num 888 :class (nav-text)]))
              ([a :num 889 :id edoc-10223 :class (nav-link                                    nav-item)]
               ([span :num 890 :class (nav-text)]))
              ([a :num 891 :id edoc-10224 :class (nav-link                                    nav-item)]
               ([span :num 892 :class (nav-text)]))
              ([a :num 893 :id edoc-10225 :class (nav-link                                    nav-item)]
               ([span :num 894 :class (nav-text)]))
              ([a :num 895 :id edoc-10226 :class (nav-link                                    nav-item)]
               ([span :num 896 :class (nav-text)])))))
           ([div :num 897 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 898 :id edoc-10680 :class (nav-promo) :w 0 :h 0])
            ([map :num 899 :id nav_imgmap_nav-sa-restaurants-food-grocery]
             ([area :num 900]))
            ([span :num 901 :class (                          nav-title                        nav-item)]
             ([span :num 902 :class (nav-text)]))
            ([div :num 903 :class (nav-panel)]
             ([a :num 904 :id edoc-10227 :class (nav-link                                    nav-item)]
              ([span :num 905 :class (nav-text)])
              ([span :num 906 :class (nav-subtext)]))
             ([a :num 907 :id edoc-10228 :class (nav-link                                    nav-item)]
              ([span :num 908 :class (nav-text)]))
             ([a :num 909 :id edoc-10229 :class (nav-link                                    nav-item)]
              ([span :num 910 :class (nav-text)]))
             ([a :num 911 :id edoc-10230 :class (nav-link                                    nav-item)]
              ([span :num 912 :class (nav-text)]))
             ([a :num 913 :id edoc-10231 :class (nav-link                                    nav-item)]
              ([span :num 914 :class (nav-text)]))
             ([a :num 915 :id edoc-10232 :class (nav-link                                    nav-item)]
              ([span :num 916 :class (nav-text)])))
            ([div :num 917 :class (nav-divider)])
            ([span :num 918 :class (                          nav-title                        nav-item)]
             ([span :num 919 :class (nav-text)]))
            ([div :num 920 :class (nav-panel)]
             ([a :num 921 :id edoc-10233 :class (nav-link                                    nav-item)]
              ([span :num 922 :class (nav-text)]))
             ([a :num 923 :id edoc-10234 :class (nav-link                                    nav-item)]
              ([span :num 924 :class (nav-text)])
              ([span :num 925 :class (nav-subtext)]))
             ([a :num 926 :id edoc-10235 :class (nav-link                                    nav-item)]
              ([span :num 927 :class (nav-text)])
              ([span :num 928 :class (nav-subtext)]))
             ([a :num 929 :id edoc-10236 :class (nav-link                                    nav-item)]
              ([span :num 930 :class (nav-text)]))
             ([a :num 931 :id edoc-10237 :class (nav-link                                    nav-item)]
              ([span :num 932 :class (nav-text)])
              ([span :num 933 :class (nav-subtext)]))
             ([a :num 934 :id edoc-10238 :class (nav-link                                    nav-item)]
              ([span :num 935 :class (nav-text)]))))
           ([div :num 936 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 937 :id edoc-10681 :class (nav-promo) :w 0 :h 0])
            ([map :num 938 :id nav_imgmap_nav-sa-beauty-health]
             ([area :num 939]))
            ([div :num 940 :class (nav-column nav-column-first)]
             ([span :num 941 :class (                          nav-title                        nav-item)]
              ([span :num 942 :class (nav-text)]))
             ([div :num 943 :class (nav-panel)]
              ([a :num 944 :id edoc-10239 :class (nav-link                                    nav-item)]
               ([span :num 945 :class (nav-text)]))
              ([a :num 946 :id edoc-10240 :class (nav-link                                    nav-item)]
               ([span :num 947 :class (nav-text)]))
              ([a :num 948 :id edoc-10241 :class (nav-link                                    nav-item)]
               ([span :num 949 :class (nav-text)]))
              ([a :num 950 :id edoc-10242 :class (nav-link                                    nav-item)]
               ([span :num 951 :class (nav-text)]))
              ([a :num 952 :id edoc-10243 :class (nav-link                                    nav-item)]
               ([span :num 953 :class (nav-text)])))
             ([div :num 954 :class (nav-divider)])
             ([span :num 955 :class (                          nav-title                        nav-item)]
              ([span :num 956 :class (nav-text)]))
             ([div :num 957 :class (nav-panel)]
              ([a :num 958 :id edoc-10244 :class (nav-link                                    nav-item)]
               ([span :num 959 :class (nav-text)])
               ([span :num 960 :class (nav-subtext)]))
              ([a :num 961 :id edoc-10245 :class (nav-link                                    nav-item)]
               ([span :num 962 :class (nav-text)])
               ([span :num 963 :class (nav-subtext)]))
              ([a :num 964 :id edoc-10246 :class (nav-link                                    nav-item)]
               ([span :num 965 :class (nav-text)]))
              ([a :num 966 :id edoc-10247 :class (nav-link                                    nav-item)]
               ([span :num 967 :class (nav-text)]))
              ([a :num 968 :id edoc-10248 :class (nav-link                                    nav-item)]
               ([span :num 969 :class (nav-text)])
               ([span :num 970 :class (nav-subtext)]))
              ([div :num 971 :class (nav-divider)])
              ([a :num 972 :id edoc-10249 :class (nav-link                                    nav-item)]
               ([span :num 973 :class (nav-text)]))))
            ([div :num 974 :class (nav-column nav-column-notfirst nav-column-break)]
             ([span :num 975 :class (                          nav-title                        nav-item)]
              ([span :num 976 :class (nav-text)]))
             ([div :num 977 :class (nav-panel)]
              ([a :num 978 :id edoc-10250 :class (nav-link                                    nav-item)]
               ([span :num 979 :class (nav-text)]))
              ([a :num 980 :id edoc-10251 :class (nav-link                                    nav-item)]
               ([span :num 981 :class (nav-text)]))
              ([a :num 982 :id edoc-10252 :class (nav-link                                    nav-item)]
               ([span :num 983 :class (nav-text)]))
              ([a :num 984 :id edoc-10253 :class (nav-link                                    nav-item)]
               ([span :num 985 :class (nav-text)]))
              ([a :num 986 :id edoc-10254 :class (nav-link                                    nav-item)]
               ([span :num 987 :class (nav-text)]))
              ([a :num 988 :id edoc-10255 :class (nav-link                                    nav-item)]
               ([span :num 989 :class (nav-text)]))
              ([a :num 990 :id edoc-10256 :class (nav-link                                    nav-item)]
               ([span :num 991 :class (nav-text)]))
              ([a :num 992 :id edoc-10257 :class (nav-link                                    nav-item)]
               ([span :num 993 :class (nav-text)])))))
           ([div :num 994 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 995 :id edoc-10682 :class (nav-promo) :w 0 :h 0])
            ([map :num 996 :id nav_imgmap_nav-sa-toys-kids-baby]
             ([area :num 997]))
            ([span :num 998 :class (                          nav-title                        nav-item)]
             ([span :num 999 :class (nav-text)]))
            ([div :num 1000 :class (nav-panel)]
             ([a :num 1001 :id edoc-10258 :class (nav-link                                    nav-item)]
              ([span :num 1002 :class (nav-text)]))
             ([a :num 1003 :id edoc-10259 :class (nav-link                                    nav-item)]
              ([span :num 1004 :class (nav-text)]))
             ([a :num 1005 :id edoc-10260 :class (nav-link                                    nav-item)]
              ([span :num 1006 :class (nav-text)]))
             ([a :num 1007 :id edoc-10261 :class (nav-link                                    nav-item)]
              ([span :num 1008 :class (nav-text)])
              ([span :num 1009 :class (nav-subtext)]))
             ([a :num 1010 :id edoc-10262 :class (nav-link                                    nav-item)]
              ([span :num 1011 :class (nav-text)]))
             ([a :num 1012 :id edoc-10263 :class (nav-link                                    nav-item)]
              ([span :num 1013 :class (nav-text)]))
             ([div :num 1014 :class (nav-divider)])
             ([a :num 1015 :id edoc-10264 :class (nav-link                                    nav-item)]
              ([span :num 1016 :class (nav-text)])
              ([span :num 1017 :class (nav-subtext)]))
             ([div :num 1018 :class (nav-divider)])
             ([a :num 1019 :id edoc-10265 :class (nav-link                                    nav-item)]
              ([span :num 1020 :class (nav-text)])
              ([span :num 1021 :class (nav-subtext)])))
            ([div :num 1022 :class (nav-divider)])
            ([span :num 1023 :class (                          nav-title                        nav-item)]
             ([span :num 1024 :class (nav-text)]))
            ([div :num 1025 :class (nav-panel)]
             ([a :num 1026 :id edoc-10266 :class (nav-link                                    nav-item)]
              ([span :num 1027 :class (nav-text)]))
             ([a :num 1028 :id edoc-10267 :class (nav-link                                    nav-item)]
              ([span :num 1029 :class (nav-text)]))
             ([a :num 1030 :id edoc-10268 :class (nav-link                                    nav-item)]
              ([span :num 1031 :class (nav-text)]))))
           ([div :num 1032 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 1033 :id edoc-10683 :class (nav-promo) :w 0 :h 0])
            ([map :num 1034 :id nav_imgmap_nav-sa-clothing-shoes-jewelry]
             ([area :num 1035]))
            ([a :num 1036 :id edoc-10269 :class (nav-link                          nav-title                        nav-item)]
             ([span :num 1037 :class (nav-text)]))
            ([div :num 1038 :class (nav-panel)]
             ([a :num 1039 :id edoc-10270 :class (nav-link                                    nav-item)]
              ([span :num 1040 :class (nav-text)]))
             ([a :num 1041 :id edoc-10271 :class (nav-link                                    nav-item)]
              ([span :num 1042 :class (nav-text)]))
             ([a :num 1043 :id edoc-10272 :class (nav-link                                    nav-item)]
              ([span :num 1044 :class (nav-text)]))
             ([a :num 1045 :id edoc-10273 :class (nav-link                                    nav-item)]
              ([span :num 1046 :class (nav-text)]))
             ([a :num 1047 :id edoc-10274 :class (nav-link                                    nav-item)]
              ([span :num 1048 :class (nav-text)]))
             ([a :num 1049 :id edoc-10275 :class (nav-link                                    nav-item)]
              ([span :num 1050 :class (nav-text)])))
            ([div :num 1051 :class (nav-divider)])
            ([a :num 1052 :id edoc-10276 :class (nav-link                                    nav-item)]
             ([span :num 1053 :class (nav-text)])
             ([span :num 1054 :class (nav-subtext)]))
            ([div :num 1055 :class (nav-divider)])
            ([span :num 1056 :class (                          nav-title                        nav-item)]
             ([span :num 1057 :class (nav-text)]))
            ([div :num 1058 :class (nav-panel)]
             ([a :num 1059 :id edoc-10277 :class (nav-link                                    nav-item)]
              ([span :num 1060 :class (nav-text)])
              ([span :num 1061 :class (nav-subtext)]))
             ([a :num 1062 :id edoc-10278 :class (nav-link                                    nav-item)]
              ([span :num 1063 :class (nav-text)])
              ([span :num 1064 :class (nav-subtext)]))))
           ([div :num 1065 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 1066 :id edoc-10684 :class (nav-promo) :w 0 :h 0])
            ([map :num 1067 :id nav_imgmap_nav-sa-handmade]
             ([area :num 1068]))
            ([span :num 1069 :class (                          nav-title                        nav-item)]
             ([span :num 1070 :class (nav-text)]))
            ([div :num 1071 :class (nav-panel)]
             ([a :num 1072 :id edoc-10279 :class (nav-link                                    nav-item)]
              ([span :num 1073 :class (nav-text)]))
             ([a :num 1074 :id edoc-10280 :class (nav-link                                    nav-item)]
              ([span :num 1075 :class (nav-text)]))
             ([a :num 1076 :id edoc-10281 :class (nav-link                                    nav-item)]
              ([span :num 1077 :class (nav-text)]))
             ([a :num 1078 :id edoc-10282 :class (nav-link                                    nav-item)]
              ([span :num 1079 :class (nav-text)]))
             ([a :num 1080 :id edoc-10283 :class (nav-link                                    nav-item)]
              ([span :num 1081 :class (nav-text)]))
             ([a :num 1082 :id edoc-10284 :class (nav-link                                    nav-item)]
              ([span :num 1083 :class (nav-text)]))
             ([a :num 1084 :id edoc-10285 :class (nav-link                                    nav-item)]
              ([span :num 1085 :class (nav-text)]))
             ([a :num 1086 :id edoc-10286 :class (nav-link                                    nav-item)]
              ([span :num 1087 :class (nav-text)]))
             ([a :num 1088 :id edoc-10287 :class (nav-link                                    nav-item)]
              ([span :num 1089 :class (nav-text)]))
             ([a :num 1090 :id edoc-10288 :class (nav-link                                    nav-item)]
              ([span :num 1091 :class (nav-text)]))
             ([a :num 1092 :id edoc-10289 :class (nav-link                                    nav-item)]
              ([span :num 1093 :class (nav-text)]))
             ([a :num 1094 :id edoc-10290 :class (nav-link                                    nav-item)]
              ([span :num 1095 :class (nav-text)]))))
           ([div :num 1096 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 1097 :id edoc-10685 :class (nav-promo) :w 0 :h 0])
            ([map :num 1098 :id nav_imgmap_nav-sa-sports-outdoors-t1]
             ([area :num 1099]))
            ([div :num 1100 :class (nav-column nav-column-first)]
             ([span :num 1101 :class (                          nav-title                        nav-item)]
              ([span :num 1102 :class (nav-text)]))
             ([div :num 1103 :class (nav-panel)]
              ([a :num 1104 :id edoc-10291 :class (nav-link                                    nav-item)]
               ([span :num 1105 :class (nav-text)]))
              ([a :num 1106 :id edoc-10292 :class (nav-link                                    nav-item)]
               ([span :num 1107 :class (nav-text)]))
              ([a :num 1108 :id edoc-10293 :class (nav-link                                    nav-item)]
               ([span :num 1109 :class (nav-text)]))
              ([a :num 1110 :id edoc-10294 :class (nav-link                                    nav-item)]
               ([span :num 1111 :class (nav-text)]))
              ([a :num 1112 :id edoc-10295 :class (nav-link                                    nav-item)]
               ([span :num 1113 :class (nav-text)]))
              ([a :num 1114 :id edoc-10296 :class (nav-link                                    nav-item)]
               ([span :num 1115 :class (nav-text)]))
              ([a :num 1116 :id edoc-10297 :class (nav-link                                    nav-item)]
               ([span :num 1117 :class (nav-text)]))
              ([a :num 1118 :id edoc-10298 :class (nav-link                                    nav-item)]
               ([span :num 1119 :class (nav-text)]))
              ([a :num 1120 :id edoc-10299 :class (nav-link                                    nav-item)]
               ([span :num 1121 :class (nav-text)]))
              ([a :num 1122 :id edoc-10300 :class (nav-link                                    nav-item)]
               ([span :num 1123 :class (nav-text)])
               ([span :num 1124 :class (nav-subtext)]))))
            ([div :num 1125 :class (nav-column nav-column-notfirst nav-column-break)]
             ([span :num 1126 :class (                          nav-title                        nav-item)]
              ([span :num 1127 :class (nav-text)]))
             ([div :num 1128 :class (nav-panel)]
              ([a :num 1129 :id edoc-10301 :class (nav-link                                    nav-item)]
               ([span :num 1130 :class (nav-text)]))
              ([a :num 1131 :id edoc-10302 :class (nav-link                                    nav-item)]
               ([span :num 1132 :class (nav-text)]))
              ([a :num 1133 :id edoc-10303 :class (nav-link                                    nav-item)]
               ([span :num 1134 :class (nav-text)]))
              ([a :num 1135 :id edoc-10304 :class (nav-link                                    nav-item)]
               ([span :num 1136 :class (nav-text)]))
              ([a :num 1137 :id edoc-10305 :class (nav-link                                    nav-item)]
               ([span :num 1138 :class (nav-text)]))
              ([a :num 1139 :id edoc-10306 :class (nav-link                                    nav-item)]
               ([span :num 1140 :class (nav-text)]))
              ([a :num 1141 :id edoc-10307 :class (nav-link                                    nav-item)]
               ([span :num 1142 :class (nav-text)]))
              ([a :num 1143 :id edoc-10308 :class (nav-link                                    nav-item)]
               ([span :num 1144 :class (nav-text)]))
              ([a :num 1145 :id edoc-10309 :class (nav-link                                    nav-item)]
               ([span :num 1146 :class (nav-text)])))))
           ([div :num 1147 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 1148 :id edoc-10686 :class (nav-promo) :w 0 :h 0])
            ([map :num 1149 :id nav_imgmap_nav-sa-automotive-industrial]
             ([area :num 1150]))
            ([span :num 1151 :class (                          nav-title                        nav-item)]
             ([span :num 1152 :class (nav-text)]))
            ([div :num 1153 :class (nav-panel)]
             ([a :num 1154 :id edoc-10310 :class (nav-link                                    nav-item)]
              ([span :num 1155 :class (nav-text)]))
             ([a :num 1156 :id edoc-10311 :class (nav-link                                    nav-item)]
              ([span :num 1157 :class (nav-text)]))
             ([a :num 1158 :id edoc-10312 :class (nav-link                                    nav-item)]
              ([span :num 1159 :class (nav-text)]))
             ([a :num 1160 :id edoc-10313 :class (nav-link                                    nav-item)]
              ([span :num 1161 :class (nav-text)]))
             ([a :num 1162 :id edoc-10314 :class (nav-link                                    nav-item)]
              ([span :num 1163 :class (nav-text)]))
             ([div :num 1164 :class (nav-divider)])
             ([a :num 1165 :id edoc-10315 :class (nav-link                                    nav-item)]
              ([span :num 1166 :class (nav-text)])
              ([span :num 1167 :class (nav-subtext)]))
             ([div :num 1168 :class (nav-divider)])
             ([a :num 1169 :id edoc-10316 :class (nav-link                                    nav-item)]
              ([span :num 1170 :class (nav-text)])
              ([span :num 1171 :class (nav-subtext)])))
            ([div :num 1172 :class (nav-divider)])
            ([span :num 1173 :class (                          nav-title                        nav-item)]
             ([span :num 1174 :class (nav-text)]))
            ([div :num 1175 :class (nav-panel)]
             ([a :num 1176 :id edoc-10317 :class (nav-link                                    nav-item)]
              ([span :num 1177 :class (nav-text)]))
             ([a :num 1178 :id edoc-10318 :class (nav-link                                    nav-item)]
              ([span :num 1179 :class (nav-text)]))
             ([a :num 1180 :id edoc-10319 :class (nav-link                                    nav-item)]
              ([span :num 1181 :class (nav-text)]))
             ([a :num 1182 :id edoc-10320 :class (nav-link                                    nav-item)]
              ([span :num 1183 :class (nav-text)]))
             ([a :num 1184 :id edoc-10321 :class (nav-link                                    nav-item)]
              ([span :num 1185 :class (nav-text)]))
             ([a :num 1186 :id edoc-10322 :class (nav-link                                    nav-item)]
              ([span :num 1187 :class (nav-text)]))))
           ([div :num 1188 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 1189 :id edoc-10687 :class (nav-promo) :w 0 :h 0])
            ([map :num 1190 :id nav_imgmap_nav-sa-home-services]
             ([area :num 1191]))
            ([div :num 1192 :class (nav-column nav-column-first)]
             ([span :num 1193 :class (                          nav-title                        nav-item)]
              ([span :num 1194 :class (nav-text)])
              ([span :num 1195 :class (nav-subtext)]))
             ([div :num 1196 :class (nav-panel)]
              ([a :num 1197 :id edoc-10323 :class (nav-link                                    nav-item)]
               ([span :num 1198 :class (nav-text)]))
              ([a :num 1199 :id edoc-10324 :class (nav-link                                    nav-item)]
               ([span :num 1200 :class (nav-text)]))
              ([a :num 1201 :id edoc-10325 :class (nav-link                                    nav-item)]
               ([span :num 1202 :class (nav-text)]))
              ([a :num 1203 :id edoc-10326 :class (nav-link                                    nav-item)]
               ([span :num 1204 :class (nav-text)]))
              ([a :num 1205 :id edoc-10327 :class (nav-link                                    nav-item)]
               ([span :num 1206 :class (nav-text)]))
              ([a :num 1207 :id edoc-10328 :class (nav-link                                    nav-item)]
               ([span :num 1208 :class (nav-text)]))
              ([a :num 1209 :id edoc-10329 :class (nav-link                                    nav-item)]
               ([span :num 1210 :class (nav-text)]))
              ([a :num 1211 :id edoc-10330 :class (nav-link                                    nav-item)]
               ([span :num 1212 :class (nav-text)]))))
            ([div :num 1213 :class (nav-column nav-column-notfirst nav-column-break)]
             ([span :num 1214 :class (                          nav-title                        nav-item)]
              ([span :num 1215 :class (nav-text)])
              ([span :num 1216 :class (nav-subtext)]))
             ([div :num 1217 :class (nav-panel)]
              ([a :num 1218 :id edoc-10331 :class (nav-link                                    nav-item)]
               ([span :num 1219 :class (nav-text)])
               ([span :num 1220 :class (nav-subtext)]))
              ([a :num 1221 :id edoc-10332 :class (nav-link                                    nav-item)]
               ([span :num 1222 :class (nav-text)])
               ([span :num 1223 :class (nav-subtext)]))
              ([div :num 1224 :class (nav-divider)])
              ([a :num 1225 :id edoc-10333 :class (nav-link                                    nav-item)]
               ([span :num 1226 :class (nav-text)]))
              ([a :num 1227 :id edoc-10334 :class (nav-link                                    nav-item)]
               ([span :num 1228 :class (nav-text)]))
              ([a :num 1229 :id edoc-10335 :class (nav-link                                    nav-item)]
               ([span :num 1230 :class (nav-text)]))
              ([a :num 1231 :id edoc-10336 :class (nav-link                                    nav-item)]
               ([span :num 1232 :class (nav-text)]))
              ([a :num 1233 :id edoc-10337 :class (nav-link                                    nav-item)]
               ([span :num 1234 :class (nav-text)]))
              ([a :num 1235 :id edoc-10338 :class (nav-link                                    nav-item)]
               ([span :num 1236 :class (nav-text)])
               ([span :num 1237 :class (nav-subtext)])))))
           ([div :num 1238 :class (nav-template nav-subcat nav-tpl-itemList nav-colcount-2)]
            ([img :num 1239 :id edoc-10688 :class (nav-promo) :w 0 :h 0])
            ([map :num 1240 :id nav_imgmap_nav-sa-credit]
             ([area :num 1241]))
            ([span :num 1242 :class (                          nav-title                        nav-item)]
             ([span :num 1243 :class (nav-text)]))
            ([div :num 1244 :class (nav-panel)]
             ([a :num 1245 :id edoc-10339 :class (nav-link                                    nav-item)]
              ([span :num 1246 :class (nav-text)])
              ([span :num 1247 :class (nav-subtext)]))
             ([a :num 1248 :id edoc-10340 :class (nav-link                                    nav-item)]
              ([span :num 1249 :class (nav-text)])
              ([span :num 1250 :class (nav-subtext)]))
             ([a :num 1251 :id edoc-10341 :class (nav-link                                    nav-item)]
              ([span :num 1252 :class (nav-text)])
              ([span :num 1253 :class (nav-subtext)]))
             ([a :num 1254 :id edoc-10342 :class (nav-link                                    nav-item)]
              ([span :num 1255 :class (nav-text)])
              ([span :num 1256 :class (nav-subtext)])))
            ([div :num 1257 :class (nav-divider)])
            ([span :num 1258 :class (                          nav-title                        nav-item)]
             ([span :num 1259 :class (nav-text)]))
            ([div :num 1260 :class (nav-panel)]
             ([a :num 1261 :id edoc-10343 :class (nav-link                                    nav-item)]
              ([span :num 1262 :class (nav-text)])
              ([span :num 1263 :class (nav-subtext)]))
             ([a :num 1264 :id edoc-10344 :class (nav-link                                    nav-item)]
              ([span :num 1265 :class (nav-text)])
              ([span :num 1266 :class (nav-subtext)]))
             ([a :num 1267 :id edoc-10345 :class (nav-link                                    nav-item)]
              ([span :num 1268 :class (nav-text)])
              ([span :num 1269 :class (nav-subtext)]))
             ([a :num 1270 :id edoc-10346 :class (nav-link                                    nav-item)]
              ([span :num 1271 :class (nav-text)])
              ([span :num 1272 :class (nav-subtext)]))
             ([a :num 1273 :id edoc-10347 :class (nav-link                                    nav-item)]
              ([span :num 1274 :class (nav-text)])
              ([span :num 1275 :class (nav-subtext)]))))))
         ([div :num 1276 :id nav-flyout-transientFlyout :class (nav-coreFlyout nav-flyout)]
          ([div :num 1277 :class (nav-arrow)]
           ([div :num 1278 :class (nav-arrow-inner)]))
          ([div :num 1279 :class (nav-template nav-flyout-content nav-spinner)]))
         ([div :num 1280 :id nav-flyout-icp :class (nav-coreFlyout nav-flyout)]
          ([div :num 1281 :class (nav-arrow)]
           ([div :num 1282 :class (nav-arrow-inner)]))
          ([div :num 1283 :class (nav-template nav-flyout-content nav-spinner)]))
         ([div :num 1284 :id nav-flyout-icp-footer-flyout :class (nav-coreFlyout nav-flyout)]
          ([div :num 1285 :class (nav-arrow)]
           ([div :num 1286 :class (nav-arrow-inner)]))
          ([div :num 1287 :class (nav-template nav-flyout-content nav-spinner)])))
        ([div :num 1288 :id nav-flyout-iss-anchor]
         ([div :num 1289 :id nav-flyout-searchAjax :class (nav-issFlyout nav-flyout)]
          ([div :num 1290 :class (nav-template nav-flyout-content)])))
        ([div :num 1291 :id nav-flyout-anchor]
         ([div :num 1292 :id nav-flyout-prime :class (nav-coreFlyout nav-flyout)]
          ([div :num 1293 :class (nav-arrow)]
           ([div :num 1294 :class (nav-arrow-inner)]))
          ([div :num 1295 :class (nav-template nav-flyout-content nav-spinner)]))
         ([div :num 1296 :id nav-flyout-accountList :class (nav-coreFlyout nav-flyout)]
          ([div :num 1297 :class (nav-arrow)]
           ([div :num 1298 :class (nav-arrow-inner)]))
          ([div :num 1299 :class (nav-template nav-flyout-content nav-spinner)]))
         ([div :num 1300 :id nav-flyout-timeline :class (nav-coreFlyout nav-fullWidthFlyout nav-flyout)]
          ([div :num 1301 :class (nav-arrow)]
           ([div :num 1302 :class (nav-arrow-inner)]))
          ([div :num 1303 :class (nav-template nav-flyout-content nav-spinner)]))
         ([div :num 1304 :id nav-flyout-shopAll :class (nav-catFlyout nav-flyout)]
          ([div :num 1305 :class (nav-arrow)]
           ([div :num 1306 :class (nav-arrow-inner)]))
          ([div :num 1307 :class (nav-template nav-flyout-content nav-spinner)]))
         ([div :num 1308 :id nav-flyout-transientFlyout :class (nav-coreFlyout nav-flyout)]
          ([div :num 1309 :class (nav-arrow)]
           ([div :num 1310 :class (nav-arrow-inner)]))
          ([div :num 1311 :class (nav-template nav-flyout-content nav-spinner)]))
         ([div :num 1312 :id nav-flyout-icp :class (nav-coreFlyout nav-flyout)]
          ([div :num 1313 :class (nav-arrow)]
           ([div :num 1314 :class (nav-arrow-inner)]))
          ([div :num 1315 :class (nav-template nav-flyout-content nav-spinner)]))
         ([div :num 1316 :id nav-flyout-icp-footer-flyout :class (nav-coreFlyout nav-flyout)]
          ([div :num 1317 :class (nav-arrow)]
           ([div :num 1318 :class (nav-arrow-inner)]))
          ([div :num 1319 :class (nav-template nav-flyout-content nav-spinner)])))
        ([div :num 1320 :id nav-flyout-iss-anchor]
         ([div :num 1321 :id nav-flyout-searchAjax :class (nav-issFlyout nav-flyout)]
          ([div :num 1322 :class (nav-template nav-flyout-content)]))))
       ([div :num 1323 :id nav-main :class (nav-sprite)]
        ([div :num 1324 :class (nav-left)]
         ([div :num 1325 :id nav-global-location-slot]
          ([span :num 1326 :class (a-declarative)]
           ([a :num 1327 :class (nav-a nav-a-2 a-popover-trigger a-declarative)]
            ([div :num 1328 :id nav-packard-glow-loc-icon :class (nav-sprite)])
            ([div :num 1329 :id glow-ingress-block]
             ([span :num 1330 :id glow-ingress-line1 :class (nav-line-1)] "Deliver to Pavel")
             ([span :num 1331 :id glow-ingress-line2 :class (nav-line-2)] "Seattle 98122‌"))))
          ([input :num 1332 :id unifiedLocation1ClickAddress :w 0 :h 0 :type hidden])
          ([input :num 1333 :id ubbShipTo :w 0 :h 0 :type hidden]))) " "
        ([div :num 1334 :class (nav-right)]
         ([script :num 1335]) " "
         ([div :num 1336 :id nav-tools]
          ([a :num 1337 :id icp-nav-flyout :class (nav-a nav-a-2 icp-link-style-2)]
           ([span :num 1338 :class (icp-nav-link-inner)]
            ([span :num 1339 :class (nav-line-1)]
             ([span :num 1340 :class (icp-nav-globe-img-2)]) " "
             ([span :num 1341 :class (icp-nav-language)] "EN")) " "
            ([span :num 1342 :class (nav-line-2)] " "
             ([span :num 1343 :id edoc-10689 :class (nav-icon nav-arrow)]))) " "
           ([span :num 1344 :class (icp-nav-link-border)])) " "
          ([a :num 1345 :id nav-link-accountList :class (nav-a nav-a-2 nav-truncate)]
           ([span :num 1346 :class (nav-line-1)] "Hello, Pavel")
           ([span :num 1347 :class (nav-line-2)] "Account & Lists"
            ([span :num 1348 :id edoc-10690 :class (nav-icon nav-arrow)]))
           ([span :num 1349 :class (nav-line-3)])
           ([span :num 1350 :class (nav-line-4)]))
          ([a :num 1351 :id edoc-10348 :class (nav-hidden-aria)] "Not Pavel? Sign Out ")
          ([a :num 1352 :id nav-orders :class (nav-a nav-a-2 nav-single-row-link)]
           ([span :num 1353 :class (nav-line-1)])
           ([span :num 1354 :class (nav-line-2)] "Orders"))
          ([a :num 1355 :id nav-link-prime :class (nav-a nav-a-2 nav-single-row-link)]
           ([span :num 1356 :class (nav-line-1)])
           ([span :num 1357 :class (nav-line-2)] "Prime"
            ([span :num 1358 :id edoc-10691 :class (nav-icon nav-arrow)])))
          ([a :num 1359 :id nav-cart :class (nav-a nav-a-2)]
           ([span :num 1360 :class (nav-line-1)])
           ([span :num 1361 :class (nav-line-2)] "Cart"
            ([span :num 1362 :class (nav-icon nav-arrow)]))
           ([span :num 1363 :class (nav-cart-icon nav-sprite)])
           ([span :num 1364 :id nav-cart-count :class (nav-cart-count nav-cart-0)] "0"))) " "
         ([script :num 1365]))
        ([div :num 1366 :class (nav-fill)]
         ([div :num 1367 :id nav-shop]
          ([a :num 1368 :id nav-link-shopall :class (nav-a nav-a-2 nav-single-row-link)]
           ([span :num 1369 :class (nav-line-1)])
           ([span :num 1370 :class (nav-line-2)] "Departments"
            ([span :num 1371 :id edoc-10692 :class (nav-icon nav-arrow)]))))
         ([div :num 1372 :id nav-xshop-container]
          ([div :num 1373 :id nav-xshop]
           ([script :num 1374]) " "
           ([a :num 1375 :id nav-recently-viewed :class (nav-a)] "Browsing History"
            ([span :num 1376 :id edoc-10693 :class (nav-icon nav-arrow)]))
           ([a :num 1377 :id nav-your-amazon :class (nav-a nav_a)]
            ([span :num 1378 :id nav-your-amazon-text]
             ([span :num 1379 :class (nav-shortened-name)] "Pavel") "'s Amazon.com"))
           ([a :num 1380 :id edoc-10349 :class (nav-a)] "Today's Deals")
           ([a :num 1381 :id edoc-10350 :class (nav-a)] "Gift Cards")
           ([a :num 1382 :id edoc-10351 :class (nav-a)] "Registry")
           ([a :num 1383 :id edoc-10352 :class (nav-a)] "Sell")
           ([a :num 1384 :id edoc-10353 :class (nav-a)] "Treasure Truck")
           ([a :num 1385 :id edoc-10354 :class (nav-a)] "Help")
           ([a :num 1386 :id edoc-10355 :class (nav-hidden-aria)] "Disability Customer Support ") " "
           ([script :num 1387])))))
       ([div :num 1388 :id nav-subnav-toaster])
       ([script :num 1389]) " "
       ([div :num 1390 :id nav-subnav]) " "
       ([script :num 1391]) " "
       ([script :num 1392])
       ([script :num 1393])) " ") " "
     ([script :num 1394]) " "
     ([script :num 1395]) " "
     ([script :num 1396]) " "
     ([script :num 1397]) " "
     ([script :num 1398])
     ([script :num 1399]) " "
     ([script :num 1400]) " " " "
     ([div :num 1401 :id pageContent :class (a-section a-spacing-none)]
      ([a :num 1402]) " "
      ([style :num 1403]) " "
      ([div :num 1404 :class (off-screen)]
       ([a :num 1405 :id edoc-10356] "Welcome to Amazon.com. If you prefer a simplified shopping experience, try the mobile web version of Amazon at www.amazon.com/access. The mobile web version is similar to the mobile app. Stay on Amazon.com for access to all the features of the main Amazon website."))
      ([div :num 1406 :id desktop-banner :class (celwidget csm-placement-id-9a6869dc-7968-42dd-b351-993975330ae8)]
       ([style :num 1407])
       ([div :num 1408 :id gw-desktop-herotator :class (a-section a-spacing-none gw-desktop-herotator-ready)]
        ([div :num 1409 :class (a-begin a-carousel-container a-carousel-display-single a-carousel-transition-slideCircular gw-desktop-herotator a-carousel-initialized)]
         ([input :num 1410 :class (a-carousel-firstvisibleitem) :w 0 :h 0 :type hidden])
         ([div :num 1411 :class (a-row a-carousel-controls a-carousel-row a-carousel-has-buttons a-carousel-overlay-buttons a-carousel-rounded-buttons)]
          ([div :num 1412 :class (a-carousel-row-inner)]
           ([div :num 1413 :id edoc-10694 :class (a-carousel-col a-carousel-left celwidget)]
            ([a :num 1414 :id edoc-10357 :class (a-carousel-goto-prevpage)]
             ([i :num 1415 :class (a-icon a-icon-previous-rounded)]
              ([span :num 1416 :class (a-icon-alt)] "Previous page"))))
           ([div :num 1417 :class (a-carousel-col a-carousel-center)]
            ([div :num 1418 :id anonCarousel1 :class (a-carousel-viewport)]
             ([ol :num 1419 :id edoc-10695 :class (a-carousel)]
              ([li :num 1420 :id edoc-10696 :class (a-carousel-card)]
               ([div :num 1421 :id gw-ftGr-desktop-hero-prime :class (celwidget csm-placement-id-98a8ccd1-63ba-4382-9552-33130ffb2aa7 gw-ftGr-desktop-hero)]
                ([div :num 1422 :id fsOmvxbPkv46iOKOf9o3_w :class (cropped-image-link image-map shogun-widget card-lite ameyal-cropped-image-link)]
                 ([div :num 1423 :id edoc-10697 :class (cropped-image-map-size)]
                  ([div :num 1424 :class (cropped-image-map-center-alignment)]
                   ([span :num 1425 :id edoc-10698]
                    ([a :num 1426 :id edoc-10358 :class (a-link-normal aok-inline-block)]
                     ([img :num 1427 :w 1500 :h 300]))
                    ([div :num 1428 :class (a-section)])))))))
              ([li :num 1429 :id edoc-10699 :class (a-carousel-card)]
               ([div :num 1430 :id gw-ftGr-desktop-hero-H :class (celwidget csm-placement-id-28e1e259-9950-43c0-9f6e-ec64aa1551a9 gw-ftGr-desktop-hero)]
                ([div :num 1431 :id iBaW2-hzHor7Z9Lg6vXn0Q :class (cropped-image-link image-map shogun-widget card-lite ameyal-cropped-image-link)]
                 ([div :num 1432 :id edoc-10700 :class (cropped-image-map-size)]
                  ([div :num 1433 :class (cropped-image-map-center-alignment)]
                   ([span :num 1434 :id edoc-10701]
                    ([a :num 1435 :id edoc-10359 :class (a-link-normal aok-inline-block)]
                     ([img :num 1436 :w 1500 :h 300]))
                    ([div :num 1437 :class (a-section)])))))))
              ([li :num 1438 :id edoc-10702 :class (a-carousel-card)]
               ([div :num 1439 :id gw-ftGr-desktop-hero-kindle-A :class (gw-ftGr-desktop-hero gw-critical-content celwidget csm-placement-id-90d6b04b-3451-407a-b09b-98dd3c6fac30)]
                ([div :num 1440 :id g0iD9aJ9PEN758_EDIpT2g :class (cropped-image-link image-map shogun-widget card-lite ameyal-cropped-image-link)]
                 ([script :num 1441])
                 ([div :num 1442 :id edoc-10703 :class (cropped-image-map-size)]
                  ([div :num 1443 :class (cropped-image-map-center-alignment)]
                   ([span :num 1444 :id edoc-10704]
                    ([a :num 1445 :id edoc-10360 :class (a-link-normal aok-inline-block)]
                     ([img :num 1446 :w 1500 :h 300]))
                    ([div :num 1447 :class (a-section)])))))
                ([script :num 1448])))
              ([li :num 1449 :id edoc-10705 :class (a-carousel-card)]
               ([div :num 1450 :id gw-ftGr-desktop-hero-A :class (celwidget csm-placement-id-37fcb530-4fba-428b-aee9-c6fbe841644d gw-ftGr-desktop-hero)]
                ([div :num 1451 :id a-LE6joIPLATx-basIg0tw :class (cropped-image-link image-map shogun-widget card-lite ameyal-cropped-image-link)]
                 ([div :num 1452 :id edoc-10706 :class (cropped-image-map-size)]
                  ([div :num 1453 :class (cropped-image-map-center-alignment)]
                   ([span :num 1454 :id edoc-10707]
                    ([a :num 1455 :id edoc-10361 :class (a-link-normal aok-inline-block)]
                     ([img :num 1456 :w 1500 :h 300]))
                    ([div :num 1457 :class (a-section)])))))))
              ([li :num 1458 :id edoc-10708 :class (a-carousel-card)]
               ([div :num 1459 :id gw-ftGr-desktop-hero-softlines :class (celwidget csm-placement-id-6e502b75-4875-4ebd-81ed-ef489793b3d0 gw-ftGr-desktop-hero)]
                ([div :num 1460 :id fChyJu4dwzDMiVvvtMWYwQ :class (cropped-image-link image-map shogun-widget card-lite ameyal-cropped-image-link)]
                 ([div :num 1461 :id edoc-10709 :class (cropped-image-map-size)]
                  ([div :num 1462 :class (cropped-image-map-center-alignment)]
                   ([span :num 1463 :id edoc-10710]
                    ([a :num 1464 :id edoc-10362 :class (a-link-normal aok-inline-block)]
                     ([img :num 1465 :w 1500 :h 300]))
                    ([div :num 1466 :class (a-section)])))))))
              ([li :num 1467 :id edoc-10711 :class (a-carousel-card)]
               ([div :num 1468 :id gw-ftGr-desktop-hero-piv :class (celwidget csm-placement-id-164aa45e-e965-4e70-8252-69e6ed8a77e7 gw-ftGr-desktop-hero)]
                ([div :num 1469 :id qMGdehEZzG1ILd0T8aUA2Q :class (cropped-image-link image-map shogun-widget card-lite ameyal-cropped-image-link)]
                 ([div :num 1470 :id edoc-10712 :class (cropped-image-map-size)]
                  ([div :num 1471 :class (cropped-image-map-center-alignment)]
                   ([span :num 1472 :id edoc-10713]
                    ([a :num 1473 :id edoc-10363 :class (a-link-normal aok-inline-block)]
                     ([img :num 1474 :w 1500 :h 300]))
                    ([div :num 1475 :class (a-section)])))))))
              ([li :num 1476 :id edoc-10714 :class (a-carousel-card)]
               ([div :num 1477 :id gw-ftGr-desktop-hero-kindle-B :class (celwidget csm-placement-id-360e10ad-06a1-4e84-9b6a-28a5d58f24fe gw-ftGr-desktop-hero)]
                ([div :num 1478 :id kX1I5houlT06jTWzM2ZnRQ :class (cropped-image-link image-map shogun-widget card-lite ameyal-cropped-image-link)]
                 ([div :num 1479 :id edoc-10715 :class (cropped-image-map-size)]
                  ([div :num 1480 :class (cropped-image-map-center-alignment)]
                   ([span :num 1481 :id edoc-10716]
                    ([a :num 1482 :id edoc-10364 :class (a-link-normal aok-inline-block)]
                     ([img :num 1483 :w 1500 :h 300]))
                    ([div :num 1484 :class (a-section)]))))))))))
           ([div :num 1485 :id edoc-10717 :class (a-carousel-col a-carousel-right celwidget)]
            ([a :num 1486 :id edoc-10365 :class (a-carousel-goto-nextpage)]
             ([i :num 1487 :class (a-icon a-icon-next-rounded)]
              ([span :num 1488 :class (a-icon-alt)] "Next page"))))))
         ([span :num 1489 :class (a-end aok-hidden)]))))
      ([script :num 1490])
      ([div :num 1491 :id gw-hud]
       ([style :num 1492])
       ([div :num 1493 :id ah-dashboard :class (a-section a-spacing-none shogun-widget asin-shoveler aui-desktop hud-shoveler gw-widget-instrument hud-white-dashboard)]
        ([div :num 1494 :class (a-section hud-feed-carousel feed-carousel first-carousel)]
         ([div :num 1495 :class (a-section hud-feed-carousel-viewport feed-carousel-viewport)]
          ([h2 :num 1496 :class (aok-offscreen)] " Your Amazon Dashboard ") " "
          ([ul :num 1497 :id edoc-10718 :class (a-unordered-list a-nostyle a-horizontal hud-feed-carousel-shelf feed-carousel-shelf)] " "
           ([li :num 1498 :id edoc-10719 :class (celwidget feed-carousel-card hud-card-0 csm-placement-id-e4789c80-7e4b-4bfd-947c-b51318c7a480)]
            ([style :num 1499])
            ([div :num 1500 :class (hud-profilecard-card)]
             ([div :num 1501 :class (hud-profile-wrapper)]
              ([div :num 1502 :class (hud-profile-image-wrapper copilot-secure-display)]
               ([a :num 1503 :id edoc-10366] " "
                ([img :num 1504 :class (hud-profile-image) :w 45 :h 45]) " ")) " "
              ([div :num 1505 :class (hud-profile-name-wrapper)]
               ([p :num 1506 :class (hud-profilecard-name)] "Hi, Pavel")
               ([p :num 1507 :id edoc-10002 :class (hud-profilecard-customer-since)] "CUSTOMER SINCE 2011")))
             ([div :num 1508 :class (hud-profilecard-divider)])
             ([p :num 1509 :class (hud-profilecard-yourorders-title)] "YOUR ORDERS")
             ([a :num 1510 :id edoc-10367 :class (hud-profilecard-yourorders)] "1 recent order")
             ([div :num 1511 :id hud-profilecard-categories-divider :class (hud-profilecard-divider)])
             ([p :num 1512 :class (hud-profilecard-categories-title)] "TOP CATEGORIES FOR YOU")
             ([div :num 1513]
              ([a :num 1514 :id edoc-10368 :class (hud-profilecard-category hud-profilecard-category-0)] "Health & Household"))
             ([div :num 1515]
              ([a :num 1516 :id edoc-10369 :class (hud-profilecard-category hud-profilecard-category-1)] "Cell Phones & Accessories"))
             ([div :num 1517]
              ([a :num 1518 :id edoc-10370 :class (hud-profilecard-category hud-profilecard-category-2)] "Electronics")))) " "
           ([li :num 1519 :id edoc-10720 :class (celwidget feed-carousel-card hud-card-1 csm-placement-id-9a87a05a-efa1-4168-9fc0-c275956187a6)]
            ([style :num 1520])
            ([div :num 1521 :class (hud-card-wrapper)]
             ([div :num 1522 :class (hud-card-title-wrapper)]
              ([a :num 1523 :id edoc-10371 :class (hud-card-title)] "PRIME"))
             ([div :num 1524 :class (hud-card-divider)])
             ([div :num 1525]
              ([p :num 1526 :class (hud-card-subtext-line)] "Prime Day starts July 16 at 3pm ET. Learn more."))
             ([a :num 1527 :id edoc-10372 :class (hud-png-image-url)] " "
              ([img :num 1528 :class (hud-card-image) :w 210 :h 150]) " ") " "
             ([div :num 1529 :class (hud-card-seemore)]
              ([a :num 1530 :id edoc-10373 :class (hud-modal-link)])))) " "
           ([li :num 1531 :id edoc-10721 :class (celwidget feed-carousel-card hud-card-2 csm-placement-id-2ef4c8e6-5340-4b83-97d4-80ac69ae0a88)]
            ([style :num 1532])
            ([div :num 1533 :class (hud-card-wrapper)]
             ([div :num 1534 :class (hud-card-title-wrapper)]
              ([a :num 1535 :id edoc-10374 :class (hud-card-title)] "FRESH"))
             ([div :num 1536 :class (hud-card-divider)])
             ([div :num 1537]
              ([p :num 1538 :class (hud-card-subtext-line)] "Start your FREE trial: $25 off your first order"))
             ([a :num 1539 :id edoc-10375 :class (hud-png-image-url)] " "
              ([img :num 1540 :class (hud-card-image) :w 210 :h 150]) " ") " "
             ([div :num 1541 :class (hud-card-seemore)]
              ([a :num 1542 :id edoc-10376 :class (hud-modal-link)])))) " "
           ([li :num 1543 :id edoc-10722 :class (celwidget feed-carousel-card hud-card-3 csm-placement-id-8e6702dc-bd6d-4dce-9c81-a90219bfde85)]
            ([div :num 1544 :class (hud-card-wrapper hud-single-video)]
             ([div :num 1545 :class (hud-card-title-wrapper)]
              ([a :num 1546 :id edoc-10377 :class (hud-card-title)] "VIDEO"))
             ([div :num 1547 :class (hud-card-divider)])
             ([div :num 1548]
              ([p :num 1549 :class (hud-card-subtext-line1)] "Recommended for you:")
              ([p :num 1550 :id edoc-10003 :class (hud-card-subtext-line2)] "Goliath - Season 1"))
             ([div :num 1551 :class (hud-single-player-content-wrapper)]
              ([a :num 1552 :id edoc-10378 :class (hud-video-image-url)] " "
               ([img :num 1553 :class (hud-card-image) :w 200 :h 150]) " ")) " "
             ([div :num 1554 :class (hud-card-seemore)]
              ([a :num 1555 :id edoc-10379 :class (hud-modal-link)])))) " "
           ([li :num 1556 :id edoc-10723 :class (celwidget feed-carousel-card hud-card-4 csm-placement-id-59cd49b6-064e-4fee-80b3-3e814ce3fc62)]
            ([div :num 1557 :class (hud-card-wrapper hud-single-music)]
             ([div :num 1558 :class (hud-card-title-wrapper)]
              ([a :num 1559 :id edoc-10380 :class (hud-card-title)] "MUSIC"))
             ([div :num 1560 :class (hud-card-divider)])
             ([div :num 1561]
              ([p :num 1562 :class (hud-card-subtext-line1)] "Recommended for you:")
              ([p :num 1563 :id edoc-10004 :class (hud-card-subtext-line2)] "Wanted! - The Outlaws"))
             ([div :num 1564 :class (hud-single-player-content-wrapper)]
              ([a :num 1565 :id edoc-10381 :class (hud-music-image-url)] " "
               ([img :num 1566 :class (hud-card-image) :w 145 :h 150]) " ")) " "
             ([div :num 1567 :class (hud-card-seemore)]
              ([a :num 1568 :id edoc-10382 :class (hud-modal-link)])))) " "
           ([li :num 1569 :id edoc-10724 :class (celwidget feed-carousel-card hud-card-5 csm-placement-id-328e8786-becb-4178-a8e0-f7efcdfc7e57)]
            ([style :num 1570])
            ([div :num 1571 :class (hud-card-wrapper)]
             ([div :num 1572 :class (hud-card-title-wrapper)]
              ([a :num 1573 :id edoc-10383 :class (hud-card-title)] "MEET ALEXA"))
             ([div :num 1574 :class (hud-card-divider)])
             ([div :num 1575]
              ([p :num 1576 :class (hud-card-subtext-line1)] "Voice control your world with")
              ([p :num 1577 :id edoc-10005 :class (hud-card-subtext-line2)] "Echo & Alexa devices"))
             ([a :num 1578 :id edoc-10384 :class (hud-png-image-url)] " "
              ([img :num 1579 :class (hud-card-image) :w 210 :h 150]) " ") " "
             ([div :num 1580 :class (hud-card-seemore)]
              ([a :num 1581 :id edoc-10385 :class (hud-modal-link)])))) " "
           ([li :num 1582 :id edoc-10725 :class (celwidget feed-carousel-card hud-card-6 csm-placement-id-8afb6321-b59b-49d6-a857-2ce85ca834aa)]
            ([style :num 1583])
            ([div :num 1584 :class (hud-card-wrapper hud-balancable-card)]
             ([div :num 1585 :class (hud-card-title-wrapper)]
              ([a :num 1586 :id edoc-10386 :class (hud-card-title)] "AUDIBLE"))
             ([div :num 1587 :class (hud-card-divider)])
             ([div :num 1588]
              ([p :num 1589 :class (hud-card-subtext-line1)] "Get any 2 audiobooks FREE")
              ([p :num 1590 :id edoc-10006 :class (hud-card-subtext-line2)] "Start with one we think you'll love:"))
             ([a :num 1591 :id edoc-10387 :class (hud-png-image-url)] " "
              ([img :num 1592 :class (hud-card-image) :w 130 :h 130]) " "))) " "
           ([li :num 1593 :id edoc-10726 :class (celwidget feed-carousel-card hud-card-7 csm-placement-id-8775829c-f3c1-45c7-8a4e-5aecb1453b40)]
            ([style :num 1594])
            ([div :num 1595 :class (hud-card-wrapper hud-timeline-card)]
             ([div :num 1596 :class (hud-card-title-wrapper)]
              ([a :num 1597 :id edoc-10388 :class (hud-card-title)] "RECENT VIEWS"))
             ([div :num 1598 :class (hud-card-divider)])
             ([a :num 1599 :id edoc-10389 :class (hud-card-subtext-line1)] "View your browsing history")
             ([div :num 1600 :class (hud-timeline-primary-asin-image-wrapper)]
              ([a :num 1601 :id edoc-10390 :class (hud-timeline-image-url)] " "
               ([img :num 1602 :class (hud-timeline-primary-image) :w 210 :h 110]) " "))
             ([ul :num 1603 :class (a-unordered-list hud-timeline-products)]
              ([li :num 1604 :class (hud-timeline-lists)]
               ([div :num 1605 :class (hud-timeline-secondary-asin-image-wrapper)]
                ([a :num 1606 :id edoc-10391 :class (hud-timeline-image-url)] " "
                 ([img :num 1607 :class (hud-timeline-secondary-images) :w 70 :h 70]) " "))) " "
              ([li :num 1608 :class (hud-timeline-lists)]
               ([div :num 1609 :class (hud-timeline-secondary-asin-image-wrapper)]
                ([a :num 1610 :id edoc-10392 :class (hud-timeline-image-url)] " "
                 ([img :num 1611 :class (hud-timeline-secondary-images) :w 70 :h 70]) " "))) " "
              ([li :num 1612 :class (hud-timeline-lists)]
               ([div :num 1613 :class (hud-timeline-secondary-asin-image-wrapper)]
                ([a :num 1614 :id edoc-10393 :class (hud-timeline-image-url)] " "
                 ([img :num 1615 :class (hud-timeline-secondary-images) :w 70 :h 70]) " ")))))) " "))
         ([a :num 1616 :id edoc-10394 :class (feed-carousel-control feed-left feed-control-disabled)]
          ([span :num 1617 :class (gw-icon feed-arrow)])) " "
         ([a :num 1618 :id edoc-10395 :class (feed-carousel-control feed-right)]
          ([span :num 1619 :class (gw-icon feed-arrow)])))
        ([script :num 1620])))
      ([script :num 1621])
      ([div :num 1622 :id gw-content-grid-top :class (a-fixed-right-grid gw-content-grid)]
       ([div :num 1623 :id edoc-10727 :class (a-fixed-right-grid-inner)]
        ([div :num 1624 :id main-content-top :class (a-fixed-right-grid-col main-content a-col-left)]
         ([div :num 1625 :class (btfContent)]
          ([div :num 1626 :id desktop-1 :class (desktop-row gw-widget-instrument gwi-x2 celwidget csm-placement-id-7f2ebd8b-ccd6-573d-805e-74c795fd912d pd_rd_wg-ZmGa2 pd_rd_r-8f536811-70f1-4326-b92f-8641b7a6525e pd_rd_w-DQcUH)]
           ([div :num 1627 :id 4eqXtRLeZiC5PkAy9nf2MQ :class (a-section a-spacing-none shogun-widget card-lite product-shoveler aui-desktop fresh-shoveler ameyal-product-shoveler)]
            ([div :num 1628 :class (a-section as-title-block)]
             ([h2 :num 1629 :class (as-title-block-left)]
              ([span :num 1630 :class (a-color-base)] "Recommendations for you in Books")) " "
             ([span :num 1631 :class (as-title-block-right)]))
            ([div :num 1632 :class (a-section feed-carousel)]
             ([div :num 1633 :class (a-section feed-carousel-viewport)]
              ([ul :num 1634 :class (a-unordered-list a-nostyle a-horizontal feed-carousel-shelf)]
               ([li :num 1635 :id edoc-10728 :class (feed-carousel-card)]
                ([span :num 1636 :class (a-list-item)]
                 ([a :num 1637 :id edoc-10396 :class (a-link-normal aok-inline-block)]
                  ([img :num 1638 :class (product-image) :w 132 :h 200])))) " "
               ([li :num 1639 :id edoc-10729 :class (feed-carousel-card)]
                ([span :num 1640 :class (a-list-item)]
                 ([a :num 1641 :id edoc-10397 :class (a-link-normal aok-inline-block)]
                  ([img :num 1642 :class (product-image) :w 132 :h 200])))) " "
               ([li :num 1643 :id edoc-10730 :class (feed-carousel-card)]
                ([span :num 1644 :class (a-list-item)]
                 ([a :num 1645 :id edoc-10398 :class (a-link-normal aok-inline-block)]
                  ([img :num 1646 :class (product-image) :w 131 :h 200])))) " "
               ([li :num 1647 :id edoc-10731 :class (feed-carousel-card)]
                ([span :num 1648 :class (a-list-item)]
                 ([a :num 1649 :id edoc-10399 :class (a-link-normal aok-inline-block)]
                  ([img :num 1650 :class (product-image) :w 136 :h 200])))) " "
               ([li :num 1651 :id edoc-10732 :class (feed-carousel-card)]
                ([span :num 1652 :class (a-list-item)]
                 ([a :num 1653 :id edoc-10400 :class (a-link-normal aok-inline-block)]
                  ([img :num 1654 :class (product-image) :w 133 :h 200])))) " "
               ([li :num 1655 :id edoc-10733 :class (feed-carousel-card)]
                ([span :num 1656 :class (a-list-item)]
                 ([a :num 1657 :id edoc-10401 :class (a-link-normal aok-inline-block)]
                  ([img :num 1658 :class (product-image) :w 130 :h 200])))) " "
               ([li :num 1659 :id edoc-10734 :class (feed-carousel-card)]
                ([span :num 1660 :class (a-list-item)]
                 ([a :num 1661 :id edoc-10402 :class (a-link-normal aok-inline-block)]
                  ([img :num 1662 :class (product-image) :w 131 :h 200])))) " "
               ([li :num 1663 :id edoc-10735 :class (feed-carousel-card)]
                ([span :num 1664 :class (a-list-item)]
                 ([a :num 1665 :id edoc-10403 :class (a-link-normal aok-inline-block)]
                  ([img :num 1666 :class (product-image) :w 132 :h 200])))) " "
               ([li :num 1667 :id edoc-10736 :class (feed-carousel-card)]
                ([span :num 1668 :class (a-list-item)]
                 ([a :num 1669 :id edoc-10404 :class (a-link-normal aok-inline-block)]
                  ([img :num 1670 :class (product-image) :w 132 :h 200])))) " "
               ([li :num 1671 :id edoc-10737 :class (feed-carousel-card)]
                ([span :num 1672 :class (a-list-item)]
                 ([a :num 1673 :id edoc-10405 :class (a-link-normal aok-inline-block)]
                  ([img :num 1674 :class (product-image) :w 133 :h 200])))) " "
               ([li :num 1675 :id edoc-10738 :class (feed-carousel-card)]
                ([span :num 1676 :class (a-list-item)]
                 ([a :num 1677 :id edoc-10406 :class (a-link-normal aok-inline-block)]
                  ([img :num 1678 :class (product-image) :w 162 :h 200])))) " "
               ([li :num 1679 :id edoc-10739 :class (feed-carousel-card)]
                ([span :num 1680 :class (a-list-item)]
                 ([a :num 1681 :id edoc-10407 :class (a-link-normal aok-inline-block)]
                  ([img :num 1682 :class (product-image) :w 133 :h 200])))) " "
               ([li :num 1683 :id edoc-10740 :class (feed-carousel-card)]
                ([span :num 1684 :class (a-list-item)]
                 ([a :num 1685 :id edoc-10408 :class (a-link-normal aok-inline-block)]
                  ([img :num 1686 :class (product-image) :w 136 :h 200])))) " "
               ([li :num 1687 :id edoc-10741 :class (feed-carousel-card)]
                ([span :num 1688 :class (a-list-item)]
                 ([a :num 1689 :id edoc-10409 :class (a-link-normal aok-inline-block)]
                  ([img :num 1690 :class (product-image) :w 149 :h 200])))) " "
               ([li :num 1691 :id edoc-10742 :class (feed-carousel-card)]
                ([span :num 1692 :class (a-list-item)]
                 ([a :num 1693 :id edoc-10410 :class (a-link-normal aok-inline-block)]
                  ([img :num 1694 :class (product-image) :w 134 :h 200])))) " "
               ([li :num 1695 :id edoc-10743 :class (feed-carousel-card)]
                ([span :num 1696 :class (a-list-item)]
                 ([a :num 1697 :id edoc-10411 :class (a-link-normal aok-inline-block)]
                  ([img :num 1698 :class (product-image) :w 130 :h 200]))))) " "
              ([div :num 1699 :id edoc-10744 :class (spinner)]
               ([i :num 1700 :class (gw-spinner)])))
             ([a :num 1701 :id edoc-10412 :class (feed-carousel-control feed-left feed-control-disabled)]
              ([span :num 1702 :class (gw-icon feed-arrow)])) " "
             ([a :num 1703 :id edoc-10413 :class (feed-carousel-control feed-right)]
              ([span :num 1704 :class (gw-icon feed-arrow)])) " "
             ([span :num 1705 :class (feed-scrollbar)]
              ([span :num 1706 :class (feed-scrollbar-track)]
               ([span :num 1707 :id edoc-10745 :class (feed-scrollbar-thumb)]))))
            ([script :num 1708]) " "
            ([script :num 1709 :id 4eqXtRLeZiC5PkAy9nf2MQ-btfCarouselContent]) " "
            ([script :num 1710]))
           ([script :num 1711]))
          ([div :num 1712 :id desktop-2 :class (desktop-row gw-widget-instrument gwi-x2 celwidget csm-placement-id-10aa8faf-b151-50b2-bf3c-c9c1efe296c0 pd_rd_wg-ZmGa2 pd_rd_r-8f536811-70f1-4326-b92f-8641b7a6525e pd_rd_w-INDwc)]
           ([div :num 1713 :id bKzUQC-zOJ4GW0hI1wQ9_g :class (a-section a-spacing-none shogun-widget card-lite product-shoveler aui-desktop fresh-shoveler ameyal-product-shoveler)]
            ([div :num 1714 :class (a-section as-title-block)]
             ([h2 :num 1715 :class (as-title-block-left)]
              ([span :num 1716 :class (a-color-base)] "More recommendations for you")) " "
             ([span :num 1717 :class (as-title-block-right)]
              ([a :num 1718 :id edoc-10414 :class (a-link-normal)] "See more")))
            ([div :num 1719 :class (a-section feed-carousel)]
             ([div :num 1720 :class (a-section feed-carousel-viewport)]
              ([ul :num 1721 :class (a-unordered-list a-nostyle a-horizontal feed-carousel-shelf)]
               ([li :num 1722 :id edoc-10746 :class (feed-carousel-card)]
                ([span :num 1723 :class (a-list-item)]
                 ([a :num 1724 :id edoc-10415 :class (a-link-normal aok-inline-block)]
                  ([img :num 1725 :class (product-image) :w 104 :h 200])))) " "
               ([li :num 1726 :id edoc-10747 :class (feed-carousel-card)]
                ([span :num 1727 :class (a-list-item)]
                 ([a :num 1728 :id edoc-10416 :class (a-link-normal aok-inline-block)]
                  ([img :num 1729 :class (product-image) :w 88 :h 200])))) " "
               ([li :num 1730 :id edoc-10748 :class (feed-carousel-card)]
                ([span :num 1731 :class (a-list-item)]
                 ([a :num 1732 :id edoc-10417 :class (a-link-normal aok-inline-block)]
                  ([img :num 1733 :class (product-image) :w 200 :h 200])))) " "
               ([li :num 1734 :id edoc-10749 :class (feed-carousel-card)]
                ([span :num 1735 :class (a-list-item)]
                 ([a :num 1736 :id edoc-10418 :class (a-link-normal aok-inline-block)]
                  ([img :num 1737 :class (product-image) :w 200 :h 200])))) " "
               ([li :num 1738 :id edoc-10750 :class (feed-carousel-card)]
                ([span :num 1739 :class (a-list-item)]
                 ([a :num 1740 :id edoc-10419 :class (a-link-normal aok-inline-block)]
                  ([img :num 1741 :class (product-image) :w 194 :h 200])))) " "
               ([li :num 1742 :id edoc-10751 :class (feed-carousel-card)]
                ([span :num 1743 :class (a-list-item)]
                 ([a :num 1744 :id edoc-10420 :class (a-link-normal aok-inline-block)]
                  ([img :num 1745 :class (product-image) :w 270 :h (/ 1339 20)])))) " "
               ([li :num 1746 :id edoc-10752 :class (feed-carousel-card)]
                ([span :num 1747 :class (a-list-item)]
                 ([a :num 1748 :id edoc-10421 :class (a-link-normal aok-inline-block)]
                  ([img :num 1749 :class (product-image) :w 224 :h 200])))) " "
               ([li :num 1750 :id edoc-10753 :class (feed-carousel-card)]
                ([span :num 1751 :class (a-list-item)]
                 ([a :num 1752 :id edoc-10422 :class (a-link-normal aok-inline-block)]
                  ([img :num 1753 :class (product-image) :w 270 :h 77.8])))) " "
               ([li :num 1754 :id edoc-10754 :class (feed-carousel-card)]
                ([span :num 1755 :class (a-list-item)]
                 ([a :num 1756 :id edoc-10423 :class (a-link-normal aok-inline-block)]
                  ([img :num 1757 :class (product-image) :w 153 :h 200])))) " "
               ([li :num 1758 :id edoc-10755 :class (feed-carousel-card)]
                ([span :num 1759 :class (a-list-item)]
                 ([a :num 1760 :id edoc-10424 :class (a-link-normal aok-inline-block)]
                  ([img :num 1761 :class (product-image) :w 95 :h 200])))) " "
               ([li :num 1762 :id edoc-10756 :class (feed-carousel-card)]
                ([span :num 1763 :class (a-list-item)]
                 ([a :num 1764 :id edoc-10425 :class (a-link-normal aok-inline-block)]
                  ([img :num 1765 :class (product-image) :w 197 :h 200]))))) " "
              ([div :num 1766 :id edoc-10757 :class (spinner)]
               ([i :num 1767 :class (gw-spinner)])))
             ([a :num 1768 :id edoc-10426 :class (feed-carousel-control feed-left feed-control-disabled)]
              ([span :num 1769 :class (gw-icon feed-arrow)])) " "
             ([a :num 1770 :id edoc-10427 :class (feed-carousel-control feed-right)]
              ([span :num 1771 :class (gw-icon feed-arrow)])) " "
             ([span :num 1772 :class (feed-scrollbar)]
              ([span :num 1773 :class (feed-scrollbar-track)]
               ([span :num 1774 :id edoc-10758 :class (feed-scrollbar-thumb)]))))
            ([script :num 1775]) " "
            ([script :num 1776 :id bKzUQC-zOJ4GW0hI1wQ9_g-btfCarouselContent]) " "
            ([script :num 1777]))
           ([script :num 1778]))
          ([script :num 1779]) " "
          ([script :num 1780])
          ([div :num 1781 :class (billboardRowWrapper gwi-x2)]
           ([div :num 1782 :class (a-row billboardRow)]
            ([div :num 1783 :class (a-column a-span6)]
             ([div :num 1784 :id desktop-billboard-1 :class (billboard celwidget csm-placement-id-9ae848b4-7616-4a11-a8fa-e0f8ae8e4951)]
              ([div :num 1785 :id l9la_HdRO0DNPIhIUDciNg :class (a-section a-text-center scalable-image-link scalable-image-map card-lite ameyal-scalable-image-link)]
               ([script :num 1786])
               ([a :num 1787 :id edoc-10428 :class (a-link-normal)]
                ([img :num 1788 :w 440 :h 200])))
              ([script :num 1789]))) " "
            ([div :num 1790 :class (a-column a-span6 a-span-last)]
             ([div :num 1791 :id desktop-billboard-2 :class (billboard celwidget csm-placement-id-74370cdf-6be8-49af-a503-ddbfded277f0)]
              ([div :num 1792 :id oHIEaKtbrWURs08AXYeZEg :class (a-section a-text-center scalable-image-link scalable-image-map card-lite ameyal-scalable-image-link)]
               ([script :num 1793])
               ([a :num 1794 :id edoc-10429 :class (a-link-normal)]
                ([img :num 1795 :w 440 :h 200])))
              ([script :num 1796]))) " "))
          ([hr :num 1797 :class (billboardrow-hr)])
          ([div :num 1798 :id desktop-3 :class (desktop-row gw-widget-instrument gwi-x2 celwidget csm-placement-id-b320a174-d048-593b-b43e-3c98a5523bbd pd_rd_wg-ZmGa2 pd_rd_r-8f536811-70f1-4326-b92f-8641b7a6525e pd_rd_w-kxqKd)]
           ([div :num 1799 :id x34wbV__5QfxcJFRd0oSKw :class (a-section a-spacing-none shogun-widget card-lite product-shoveler aui-desktop fresh-shoveler ameyal-product-shoveler)]
            ([div :num 1800 :class (a-section as-title-block)]
             ([h2 :num 1801 :class (as-title-block-left)]
              ([span :num 1802 :class (a-color-base)] "Recommendations for you in Health & Household")) " "
             ([span :num 1803 :class (as-title-block-right)]))
            ([div :num 1804 :class (a-section feed-carousel)]
             ([div :num 1805 :class (a-section feed-carousel-viewport)]
              ([ul :num 1806 :class (a-unordered-list a-nostyle a-horizontal feed-carousel-shelf)]
               ([li :num 1807 :id edoc-10759 :class (feed-carousel-card)]
                ([span :num 1808 :class (a-list-item)]
                 ([a :num 1809 :id edoc-10430 :class (a-link-normal aok-inline-block)]
                  ([img :num 1810 :class (product-image) :w 92 :h 200])))) " "
               ([li :num 1811 :id edoc-10760 :class (feed-carousel-card)]
                ([span :num 1812 :class (a-list-item)]
                 ([a :num 1813 :id edoc-10431 :class (a-link-normal aok-inline-block)]
                  ([img :num 1814 :class (product-image) :w 176 :h 200])))) " "
               ([li :num 1815 :id edoc-10761 :class (feed-carousel-card)]
                ([span :num 1816 :class (a-list-item)]
                 ([a :num 1817 :id edoc-10432 :class (a-link-normal aok-inline-block)]
                  ([img :num 1818 :class (product-image) :w 167 :h 200])))) " "
               ([li :num 1819 :id edoc-10762 :class (feed-carousel-card)]
                ([span :num 1820 :class (a-list-item)]
                 ([a :num 1821 :id edoc-10433 :class (a-link-normal aok-inline-block)]
                  ([img :num 1822 :class (product-image) :w 126 :h 200])))) " "
               ([li :num 1823 :id edoc-10763 :class (feed-carousel-card)]
                ([span :num 1824 :class (a-list-item)]
                 ([a :num 1825 :id edoc-10434 :class (a-link-normal aok-inline-block)]
                  ([img :num 1826 :class (product-image) :w 197 :h 200])))) " "
               ([li :num 1827 :id edoc-10764 :class (feed-carousel-card)]
                ([span :num 1828 :class (a-list-item)]
                 ([a :num 1829 :id edoc-10435 :class (a-link-normal aok-inline-block)]
                  ([img :num 1830 :class (product-image) :w 225 :h 200])))) " "
               ([li :num 1831 :id edoc-10765 :class (feed-carousel-card)]
                ([span :num 1832 :class (a-list-item)]
                 ([a :num 1833 :id edoc-10436 :class (a-link-normal aok-inline-block)]
                  ([img :num 1834 :class (product-image) :w 208 :h 200])))) " "
               ([li :num 1835 :id edoc-10766 :class (feed-carousel-card)]
                ([span :num 1836 :class (a-list-item)]
                 ([a :num 1837 :id edoc-10437 :class (a-link-normal aok-inline-block)]
                  ([img :num 1838 :class (product-image) :w 270 :h (/ 551 3)])))) " "
               ([li :num 1839 :id edoc-10767 :class (feed-carousel-card)]
                ([span :num 1840 :class (a-list-item)]
                 ([a :num 1841 :id edoc-10438 :class (a-link-normal aok-inline-block)]
                  ([img :num 1842 :class (product-image) :w 215 :h 200])))) " "
               ([li :num 1843 :id edoc-10768 :class (feed-carousel-card)]
                ([span :num 1844 :class (a-list-item)]
                 ([a :num 1845 :id edoc-10439 :class (a-link-normal aok-inline-block)]
                  ([img :num 1846 :class (product-image) :w 251 :h 200])))) " "
               ([li :num 1847 :id edoc-10769 :class (feed-carousel-card)]
                ([span :num 1848 :class (a-list-item)]
                 ([a :num 1849 :id edoc-10440 :class (a-link-normal aok-inline-block)]
                  ([img :num 1850 :class (product-image) :w 270 :h (/ 1153 6)])))) " "
               ([li :num 1851 :id edoc-10770 :class (feed-carousel-card)]
                ([span :num 1852 :class (a-list-item)]
                 ([a :num 1853 :id edoc-10441 :class (a-link-normal aok-inline-block)]
                  ([img :num 1854 :class (product-image) :w 176 :h 200])))) " "
               ([li :num 1855 :id edoc-10771 :class (feed-carousel-card)]
                ([span :num 1856 :class (a-list-item)]
                 ([a :num 1857 :id edoc-10442 :class (a-link-normal aok-inline-block)]
                  ([img :num 1858 :class (product-image) :w 109 :h 200])))) " "
               ([li :num 1859 :id edoc-10772 :class (feed-carousel-card)]
                ([span :num 1860 :class (a-list-item)]
                 ([a :num 1861 :id edoc-10443 :class (a-link-normal aok-inline-block)]
                  ([img :num 1862 :class (product-image) :w 124 :h 200])))) " "
               ([li :num 1863 :id edoc-10773 :class (feed-carousel-card)]
                ([span :num 1864 :class (a-list-item)]
                 ([a :num 1865 :id edoc-10444 :class (a-link-normal aok-inline-block)]
                  ([img :num 1866 :class (product-image) :w 176 :h 200])))) " "
               ([li :num 1867 :id edoc-10774 :class (feed-carousel-card)]
                ([span :num 1868 :class (a-list-item)]
                 ([a :num 1869 :id edoc-10445 :class (a-link-normal aok-inline-block)]
                  ([img :num 1870 :class (product-image) :w 213 :h 200])))) " "
               ([li :num 1871 :id edoc-10775 :class (feed-carousel-card)]
                ([span :num 1872 :class (a-list-item)]
                 ([a :num 1873 :id edoc-10446 :class (a-link-normal aok-inline-block)]
                  ([img :num 1874 :class (product-image) :w 209 :h 200])))) " "
               ([li :num 1875 :id edoc-10776 :class (feed-carousel-card)]
                ([span :num 1876 :class (a-list-item)]
                 ([a :num 1877 :id edoc-10447 :class (a-link-normal aok-inline-block)]
                  ([img :num 1878 :class (product-image) :w 194 :h 200])))) " "
               ([li :num 1879 :id edoc-10777 :class (feed-carousel-card)]
                ([span :num 1880 :class (a-list-item)]
                 ([a :num 1881 :id edoc-10448 :class (a-link-normal aok-inline-block)]
                  ([img :num 1882 :class (product-image) :w 208 :h 200])))) " "
               ([li :num 1883 :id edoc-10778 :class (feed-carousel-card)]
                ([span :num 1884 :class (a-list-item)]
                 ([a :num 1885 :id edoc-10449 :class (a-link-normal aok-inline-block)]
                  ([img :num 1886 :class (product-image) :w 105 :h 200]))))) " "
              ([div :num 1887 :id edoc-10779 :class (spinner)]
               ([i :num 1888 :class (gw-spinner)])))
             ([a :num 1889 :id edoc-10450 :class (feed-carousel-control feed-left feed-control-disabled)]
              ([span :num 1890 :class (gw-icon feed-arrow)])) " "
             ([a :num 1891 :id edoc-10451 :class (feed-carousel-control feed-right)]
              ([span :num 1892 :class (gw-icon feed-arrow)])) " "
             ([span :num 1893 :class (feed-scrollbar)]
              ([span :num 1894 :class (feed-scrollbar-track)]
               ([span :num 1895 :id edoc-10780 :class (feed-scrollbar-thumb)]))))
            ([script :num 1896]) " "
            ([script :num 1897 :id x34wbV__5QfxcJFRd0oSKw-btfCarouselContent]) " "
            ([script :num 1898]))
           ([script :num 1899]))
          ([div :num 1900 :id desktop-editorial :class (desktop-row gw-widget-instrument gwi-x2 celwidget csm-placement-id-bd36d063-906e-471b-b209-676a8ff0f91b)]
           ([div :num 1901 :id qk6LvHdSNmXV2IHCMaSLHg :class (a-section a-text-center scalable-image-link scalable-image-map card-lite ameyal-scalable-image-link)]
            ([script :num 1902]) " "
            ([a :num 1903 :id edoc-10452 :class (a-link-normal)]
             ([img :num 1904 :w 1130 :h (/ 9521 30)])))
           ([script :num 1905]))
          ([div :num 1906 :id desktop-4 :class (desktop-row gw-widget-instrument gwi-x2 celwidget csm-placement-id-ebb1d1b3-1f90-5a56-866b-7db224ef16d7 pd_rd_wg-ZmGa2 pd_rd_w-kFnlc pd_rd_r-8f536811-70f1-4326-b92f-8641b7a6525e)]
           ([div :num 1907 :id KmFvCyvoCHhnRNw-VU7nbg :class (a-section a-spacing-none shogun-widget card-lite product-shoveler aui-desktop fresh-shoveler ameyal-product-shoveler)]
            ([div :num 1908 :class (a-section as-title-block)]
             ([h2 :num 1909 :class (as-title-block-left)]
              ([span :num 1910 :class (a-color-base)] "Popular movies included with your Prime membership")) " "
             ([span :num 1911 :class (as-title-block-right)]
              ([a :num 1912 :id edoc-10453 :class (a-link-normal)] "See more")))
            ([div :num 1913 :class (a-section feed-carousel)]
             ([div :num 1914 :class (a-section feed-carousel-viewport)]
              ([ul :num 1915 :class (a-unordered-list a-nostyle a-horizontal feed-carousel-shelf)]
               ([li :num 1916 :id edoc-10781 :class (feed-carousel-card)]
                ([span :num 1917 :class (a-list-item)]
                 ([a :num 1918 :id edoc-10454 :class (a-link-normal aok-inline-block)]
                  ([img :num 1919 :class (product-image) :w 146 :h 200])))) " "
               ([li :num 1920 :id edoc-10782 :class (feed-carousel-card)]
                ([span :num 1921 :class (a-list-item)]
                 ([a :num 1922 :id edoc-10455 :class (a-link-normal aok-inline-block)]
                  ([img :num 1923 :class (product-image) :w 150 :h 200])))) " "
               ([li :num 1924 :id edoc-10783 :class (feed-carousel-card)]
                ([span :num 1925 :class (a-list-item)]
                 ([a :num 1926 :id edoc-10456 :class (a-link-normal aok-inline-block)]
                  ([img :num 1927 :class (product-image) :w 150 :h 200])))) " "
               ([li :num 1928 :id edoc-10784 :class (feed-carousel-card)]
                ([span :num 1929 :class (a-list-item)]
                 ([a :num 1930 :id edoc-10457 :class (a-link-normal aok-inline-block)]
                  ([img :num 1931 :class (product-image) :w 150 :h 200])))) " "
               ([li :num 1932 :id edoc-10785 :class (feed-carousel-card)]
                ([span :num 1933 :class (a-list-item)]
                 ([a :num 1934 :id edoc-10458 :class (a-link-normal aok-inline-block)]
                  ([img :num 1935 :class (product-image) :w 150 :h 200])))) " "
               ([li :num 1936 :id edoc-10786 :class (feed-carousel-card)]
                ([span :num 1937 :class (a-list-item)]
                 ([a :num 1938 :id edoc-10459 :class (a-link-normal aok-inline-block)]
                  ([img :num 1939 :class (product-image) :w 150 :h 200])))) " "
               ([li :num 1940 :id edoc-10787 :class (feed-carousel-card)]
                ([span :num 1941 :class (a-list-item)]
                 ([a :num 1942 :id edoc-10460 :class (a-link-normal aok-inline-block)]
                  ([img :num 1943 :class (product-image) :w 133 :h 200])))) " "
               ([li :num 1944 :id edoc-10788 :class (feed-carousel-card)]
                ([span :num 1945 :class (a-list-item)]
                 ([a :num 1946 :id edoc-10461 :class (a-link-normal aok-inline-block)]
                  ([img :num 1947 :class (product-image) :w 150 :h 200])))) " "
               ([li :num 1948 :id edoc-10789 :class (feed-carousel-card)]
                ([span :num 1949 :class (a-list-item)]
                 ([a :num 1950 :id edoc-10462 :class (a-link-normal aok-inline-block)]
                  ([img :num 1951 :class (product-image) :w 150 :h 200])))) " "
               ([li :num 1952 :id edoc-10790 :class (feed-carousel-card)]
                ([span :num 1953 :class (a-list-item)]
                 ([a :num 1954 :id edoc-10463 :class (a-link-normal aok-inline-block)]
                  ([img :num 1955 :class (product-image) :w 150 :h 200])))) " "
               ([li :num 1956 :id edoc-10791 :class (feed-carousel-card)]
                ([span :num 1957 :class (a-list-item)]
                 ([a :num 1958 :id edoc-10464 :class (a-link-normal aok-inline-block)]
                  ([img :num 1959 :class (product-image) :w 150 :h 200])))) " "
               ([li :num 1960 :id edoc-10792 :class (feed-carousel-card)]
                ([span :num 1961 :class (a-list-item)]
                 ([a :num 1962 :id edoc-10465 :class (a-link-normal aok-inline-block)]
                  ([img :num 1963 :class (product-image) :w 150 :h 200])))) " "
               ([li :num 1964 :id edoc-10793 :class (feed-carousel-card)]
                ([span :num 1965 :class (a-list-item)]
                 ([a :num 1966 :id edoc-10466 :class (a-link-normal aok-inline-block)]
                  ([img :num 1967 :class (product-image) :w 150 :h 200])))) " "
               ([li :num 1968 :id edoc-10794 :class (feed-carousel-card)]
                ([span :num 1969 :class (a-list-item)]
                 ([a :num 1970 :id edoc-10467 :class (a-link-normal aok-inline-block)]
                  ([img :num 1971 :class (product-image) :w 133 :h 200])))) " "
               ([li :num 1972 :id edoc-10795 :class (feed-carousel-card)]
                ([span :num 1973 :class (a-list-item)]
                 ([a :num 1974 :id edoc-10468 :class (a-link-normal aok-inline-block)]
                  ([img :num 1975 :class (product-image) :w 150 :h 200])))) " "
               ([li :num 1976 :id edoc-10796 :class (feed-carousel-card)]
                ([span :num 1977 :class (a-list-item)]
                 ([a :num 1978 :id edoc-10469 :class (a-link-normal aok-inline-block)]
                  ([img :num 1979 :class (product-image) :w 139 :h 200])))) " "
               ([li :num 1980 :id edoc-10797 :class (feed-carousel-card)]
                ([span :num 1981 :class (a-list-item)]
                 ([a :num 1982 :id edoc-10470 :class (a-link-normal aok-inline-block)]
                  ([img :num 1983 :class (product-image) :w 144 :h 200])))) " "
               ([li :num 1984 :id edoc-10798 :class (feed-carousel-card)]
                ([span :num 1985 :class (a-list-item)]
                 ([a :num 1986 :id edoc-10471 :class (a-link-normal aok-inline-block)]
                  ([img :num 1987 :class (product-image) :w 150 :h 200])))) " "
               ([li :num 1988 :id edoc-10799 :class (feed-carousel-card)]
                ([span :num 1989 :class (a-list-item)]
                 ([a :num 1990 :id edoc-10472 :class (a-link-normal aok-inline-block)]
                  ([img :num 1991 :class (product-image) :w 150 :h 200])))) " "
               ([li :num 1992 :id edoc-10800 :class (feed-carousel-card)]
                ([span :num 1993 :class (a-list-item)]
                 ([a :num 1994 :id edoc-10473 :class (a-link-normal aok-inline-block)]
                  ([img :num 1995 :class (product-image) :w 133 :h 200]))))) " "
              ([div :num 1996 :id edoc-10801 :class (spinner)]
               ([i :num 1997 :class (gw-spinner)])))
             ([a :num 1998 :id edoc-10474 :class (feed-carousel-control feed-left feed-control-disabled)]
              ([span :num 1999 :class (gw-icon feed-arrow)])) " "
             ([a :num 2000 :id edoc-10475 :class (feed-carousel-control feed-right)]
              ([span :num 2001 :class (gw-icon feed-arrow)])) " "
             ([span :num 2002 :class (feed-scrollbar)]
              ([span :num 2003 :class (feed-scrollbar-track)]
               ([span :num 2004 :id edoc-10802 :class (feed-scrollbar-thumb)]))))
            ([script :num 2005]) " "
            ([script :num 2006 :id KmFvCyvoCHhnRNw-VU7nbg-btfCarouselContent]) " "
            ([script :num 2007]))
           ([script :num 2008])))) " "
        ([div :num 2009 :id sidebar-top :class (a-fixed-right-grid-col sidebar a-col-right)]
         ([div :num 2010 :id desktop-ad-atf :class (displayAd celwidget csm-placement-id-63d232e0-12ef-4a39-8d64-74425f050755)]
          ([script :num 2011])
          ([style :num 2012])
          ([div :num 2013 :id ape_Gateway_right-2_desktop_placement :class (copilot-secure-display celwidget  text/x-dacx-safeframe)]
           ([iframe :num 2014 :id ape_Gateway_right-2_desktop_iframe :w 300 :h 250])
           ([script :num 2015 :id APE_adblockerdetector])
           ([div :num 2016 :id ape_Gateway_right-2_desktop_placement_Feedback]
            ([a :num 2017 :id edoc-10803 :class (a-declarative)]
             ([span :num 2018 :id ad-feedback-text-right-2] " Ad feedback "
              ([b :num 2019 :id ad-feedback-sprite-right-2])))
            ([script :num 2020])))
          ([script :num 2021])
          ([script :num 2022])) " "
         ([hr :num 2023 :class (slot-hr desktop-ad-atf-hr)])
         ([div :num 2024 :id desktop-sidekick-1 :class (sidekick celwidget csm-placement-id-727f53d6-d535-49be-a5dd-415e51c3505b)]
          ([link :num 2025]) " "
          ([script :num 2026])
          ([div :num 2027 :id digital-dash-gateway-desktop--slot-right-rail :class (a-section digital-dash-gateway-desktop digital-dash-gateway-desktop--slot-right-rail)]
           ([div :num 2028 :class (a-section a-spacing-none digital-dash-gateway-desktop__header digital-dash-default-header)]
            ([div :num 2029 :class (a-row)] " "
             ([div :num 2030 :class (a-column a-span12)]
              ([h2 :num 2031 :class (a-spacing-small a-text-center a-text-normal)] " Tap Below to Reorder ")) " ")
            ([div :num 2032 :class (a-row a-spacing-small)] " "
             ([div :num 2033 :class (a-column a-span6)]
              ([a :num 2034 :id edoc-10476 :class (a-link-normal)] " Your Dash Buttons ")) " "
             ([div :num 2035 :class (a-column a-span6 a-text-right a-span-last)]
              ([span :num 2036 :class (a-declarative)] " "
               ([a :num 2037 :id edoc-10477 :class (a-link-normal)] " Learn more ") " ")) " "))
           ([div :num 2038 :class (digital-dash-top-slot)])
           ([hr :num 2039 :class (digital-dash-gateway-desktop__radial-divider)])
           ([div :num 2040 :class (a-section a-text-center digital-dash-fade-out-delete)]
            ([div :num 2041 :class (a-section a-spacing-small digital-dash-list-item)]
             ([div :num 2042 :class (a-section digital-dash-delete-swiper digital-dash-deletable)]
              ([div :num 2043 :class (a-section digital-dash-delete-swiper-frame digital-dash-delete-swiper-button-frame)]
               ([script :num 2044]) " "
               ([span :num 2045 :class (a-declarative)]
                ([form :num 2046 :class (digital-dash-button-helper-wrapper )]
                 ([div :num 2047 :class (digital-dash-button-outer-wrapper)] " "
                  ([div :num 2048 :id edoc-10804 :class (digital-dash-button-inner-wrapper digital-dash-background-gradient-2)]
                   ([span :num 2049 :class (a-declarative)]
                    ([span :num 2050 :class (a-declarative)]
                     ([a :num 2051 :id edoc-10478 :class (digital-dash-deck)]
                      ([h5 :num 2052 :class (brand-name a-text-normal)]
                       ([span :num 2053 :class (aok-hide-text)]
                        ([span :num 2054 :class (aok-hide-text)] "Digital dash button for")
                        ([span :num 2055 :id edoc-10805 :class (digital-dash-button-name)] "Body Fortress")
                        ([span :num 2056 :class (aok-hide-text)] "select for more information")))) " ")
                    ([span :num 2057 :class (a-size-mini digital-dash-button-label)] "Super Ad…(Chocolate)"))
                   ([div :num 2058 :class (digital-dash-button-wrapper)]
                    ([div :num 2059 :class (digital-dash-button-border)]
                     ([button :num 2060 :class (digital-dash-button-button)]
                      ([span :num 2061 :class (digital-dash-button-item-price)]
                       ([span :num 2062 :id digital-dash-button-price :class (a-price digital-dash-button-price)]
                        ([span :num 2063 :class (a-offscreen)] "USD 18.68")
                        ([span :num 2064]
                         ([span :num 2065 :id edoc-10660 :class (a-price-symbol)] "$")
                         ([span :num 2066 :class (a-price-whole)] "18"
                          ([span :num 2067 :id edoc-10648 :class (a-price-decimal)] "."))
                         ([span :num 2068 :id edoc-10654 :class (a-price-fraction)] "68"))))
                      ([span :num 2069 :class (digital-dash-button-button__cta)] "Buy now"))))) " ")
                 ([input :num 2070 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2071 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2072 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2073 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2074 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2075 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2076 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2077 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2078 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2079 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2080 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2081 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2082 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2083 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2084 :w 0 :h 0 :type hidden]) " "
                 ([div :num 2085 :class (a-section digital-dash-tag-wrapper digital-dash-tag-show)]
                  ([div :num 2086 :class (a-row digital-dash-tag)]
                   ([div :num 2087 :class (a-section a-text-left digital-dash-tag-ships-to)]
                    ([span :num 2088 :class (a-size-small digital-dash-tag-title digital-dash-j-tag-ships-to-title)])
                    ([span :num 2089 :class (a-size-base digital-dash-tag-body-address digital-dash-j-tag-ships-to-body a-text-bold)]))
                   ([div :num 2090 :class (a-section a-padding-base a-text-center digital-dash-tag-arrives)]
                    ([a :num 2091 :id edoc-10479 :class (a-link-normal digital-dash-tag-link digital-dash-j-tag-arrives-link)]
                     ([span :num 2092 :class (a-size-small digital-dash-tag-title digital-dash-j-tag-arrives-title)] "Arrives")
                     ([span :num 2093 :class (a-size-base digital-dash-tag-body digital-dash-j-tag-arrives-body a-text-bold)] "Jul 16")
                     ([span :num 2094 :class (a-size-mini digital-dash-tag-link-text digital-dash-j-tag-arrives-link-text)] "View order")))))) " ")
               ([div :num 2095 :id a-popover-digital-dash-order-notifier :class (a-popover-preload)]
                ([div :num 2096 :class (a-section a-padding-base digital-dash-order-toast)]
                 ([span :num 2097 :class (digital-dash-order-toast__spinner)]
                  ([span :num 2098 :class (digital-dash-spinner)]))
                 ([span :num 2099 :class (digital-dash-order-toast__checkmark)]
                  ([i :num 2100 :class (a-icon a-icon-checkmark-inverse)]))
                 ([span :num 2101 :class (digital-dash-order-message)])
                 ([div :num 2102 :class (a-section)]
                  ([span :num 2103 :class (digital-dash-discount-message)]))))
               ([div :num 2104 :id a-popover-digital-dash-duplicate-order-alert :class (a-popover-preload)]
                ([div :num 2105 :id digital-dash-duplicate-order__content]
                 ([div :num 2106 :class (a-section digital-dash-duplicate-order__text)]
                  ([span :num 2107]
                   ([span :num 2108 :id digital-dash-duplicate-previous-order-date])))
                 ([div :num 2109 :class (a-section digital-dash-duplicate-order__text)]
                  ([span :num 2110]))
                 ([div :num 2111 :id digital-dash-duplicate-order-footer :class (a-section)]
                  ([div :num 2112 :class (digital-dash-duplicate-order__button)]
                   ([span :num 2113 :class (a-declarative)]
                    ([span :num 2114 :id digital-dash-duplicate-order-submit-button :class (a-button a-button-primary)]
                     ([span :num 2115 :class (a-button-inner)]
                      ([input :num 2116 :class (a-button-input) :w 0 :h 0 :type submit])
                      ([span :num 2117 :id digital-dash-duplicate-order-submit-button-announce :class (a-button-text)])))))
                  ([div :num 2118 :class (digital-dash-duplicate-order__button)]
                   ([span :num 2119 :class (a-declarative)]
                    ([span :num 2120 :id digital-dash-duplicate-order-cancel-button :class (a-button)]
                     ([span :num 2121 :class (a-button-inner)]
                      ([input :num 2122 :class (a-button-input) :w 0 :h 0 :type submit])
                      ([span :num 2123 :id digital-dash-duplicate-order-cancel-button-announce :class (a-button-text)]))))))))
               ([div :num 2124 :id a-popover-digital-dash-promotion-redemption-failure-alert :class (a-popover-preload)]
                ([div :num 2125 :id digital-dash-promotion-redemption-failure-order__content]
                 ([div :num 2126 :class (a-section digital-dash-promotion-redemption-failure-order__text)]
                  ([span :num 2127]))
                 ([div :num 2128 :id digital-dash-promotion-redemption-failure-order-footer :class (a-section)]
                  ([div :num 2129 :class (digital-dash-promotion-redemption-failure-order__button)]
                   ([span :num 2130 :class (a-declarative)]
                    ([span :num 2131 :id digital-dash-promotion-redemption-failure-order-submit-button :class (a-button a-button-primary)]
                     ([span :num 2132 :class (a-button-inner)]
                      ([input :num 2133 :class (a-button-input) :w 0 :h 0 :type submit])
                      ([span :num 2134 :id digital-dash-promotion-redemption-failure-order-submit-button-announce :class (a-button-text)])))))
                  ([div :num 2135 :class (digital-dash-promotion-redemption-failure-order__button)]
                   ([span :num 2136 :class (a-declarative)]
                    ([span :num 2137 :id digital-dash-promotion-redemption-failure-order-cancel-button :class (a-button)]
                     ([span :num 2138 :class (a-button-inner)]
                      ([input :num 2139 :class (a-button-input) :w 0 :h 0 :type submit])
                      ([span :num 2140 :id digital-dash-promotion-redemption-failure-order-cancel-button-announce :class (a-button-text)]))))))))
               ([div :num 2141 :id a-popover-digital-dash-age-confirmation :class (a-popover-preload)]
                ([div :num 2142 :id digital-dash-age-confirmation__content]
                 ([div :num 2143 :class (a-section a-spacing-mini digital-dash-age-confirmation__title)])
                 ([div :num 2144 :class (a-section digital-dash-age-confirmation__text)]
                  ([span :num 2145 :class (a-declarative)]
                   ([div :num 2146 :class (a-checkbox a-spacing-none)]
                    ([label :num 2147]
                     ([input :num 2148 :w 0 :h 0 :type checkbox])
                     ([i :num 2149 :class (a-icon a-icon-checkbox)])
                     ([span :num 2150 :class (a-label a-checkbox-label)])))))
                 ([div :num 2151 :id digital-dash-age-confirmation-footer :class (a-section a-spacing-mini)]
                  ([div :num 2152 :class (digital-dash-age-confirmation__disabled-button)]
                   ([span :num 2153 :id digital-dash-confirm-age-submit-button__disabled :class (a-button a-button-disabled a-button-primary)]
                    ([span :num 2154 :class (a-button-inner)]
                     ([input :num 2155 :class (a-button-input) :w 0 :h 0 :type submit])
                     ([span :num 2156 :id digital-dash-confirm-age-submit-button__disabled-announce :class (a-button-text)]))))
                  ([div :num 2157 :class (digital-dash-age-confirmation__enabled-button)]
                   ([span :num 2158 :class (a-declarative)]
                    ([span :num 2159 :id digital-dash-confirm-age-submit-button__enabled :class (a-button a-button-primary)]
                     ([span :num 2160 :class (a-button-inner)]
                      ([input :num 2161 :class (a-button-input) :w 0 :h 0 :type submit])
                      ([span :num 2162 :id digital-dash-confirm-age-submit-button__enabled-announce :class (a-button-text)]))))))))
               ([div :num 2163 :id a-popover-digital-dash-check-order-alert :class (a-popover-preload)]
                ([div :num 2164 :class (a-section digital-dash-check-order__text)]
                 ([span :num 2165]))
                ([div :num 2166 :class (a-section digital-dash-check-order__text)]
                 ([span :num 2167]))
                ([div :num 2168 :id digital-dash-check-order-footer :class (a-section)]
                 ([span :num 2169 :class (a-declarative)]
                  ([span :num 2170 :id digital-dash-check-order-submit-button :class (a-button a-button-primary)]
                   ([span :num 2171 :class (a-button-inner)]
                    ([a :num 2172 :id digital-dash-check-order-submit-button-announce :class (a-button-text)]))))
                 ([span :num 2173 :class (a-declarative)]
                  ([span :num 2174 :id digital-dash-check-order-cancel-button :class (a-button)]
                   ([span :num 2175 :class (a-button-inner)]
                    ([input :num 2176 :class (a-button-input) :w 0 :h 0 :type submit])
                    ([span :num 2177 :id digital-dash-check-order-cancel-button-announce :class (a-button-text)]))))))
               ([div :num 2178 :id a-popover-digital-dash-offer-change-alert :class (a-popover-preload)]
                ([div :num 2179 :class (a-section digital-dash-offer-change__text)]
                 ([span :num 2180]))
                ([div :num 2181 :class (a-section digital-dash-offer-change__text)]
                 ([span :num 2182])))
               ([div :num 2183 :class (digital-dash-offer-change__header aok-hidden)]
                ([span :num 2184 :class (a-text-bold)])) " "
               ([div :num 2185 :class (digital-dash-duplicate-order-alert__header aok-hidden)]
                ([span :num 2186 :class (a-text-bold)])) " "
               ([div :num 2187 :class (digital-dash-promotion-redemption-failure-alert__header aok-hidden)]
                ([span :num 2188 :class (a-text-bold)])) " "
               ([div :num 2189 :class (digital-dash-first-time-hint__error-message aok-hidden)]
                ([span :num 2190])) " "
               ([div :num 2191 :class (a-box a-alert-inline a-alert-inline-error digital-dash-deletable__delete-error-message)]
                ([div :num 2192 :class (a-box-inner a-alert-container)]
                 ([i :num 2193 :class (a-icon a-icon-alert)])
                 ([div :num 2194 :class (a-alert-content)]
                  ([span :num 2195 :class (a-size-mini)])))))
              ([div :num 2196 :class (a-section digital-dash-delete-swiper-frame)]
               ([div :num 2197 :class (a-section digital-dash-delete-message)]
                ([span :num 2198 :class (digital-dash-delete-text)]
                 ([span :num 2199 :class (a-declarative)]
                  ([a :num 2200 :id edoc-10480 :class (a-size-large a-link-normal)] "Delete this button"))))
               ([div :num 2201 :class (a-section digital-dash-restore-message)]
                ([span :num 2202 :class (a-declarative)]
                 ([a :num 2203 :id edoc-10481 :class (a-link-normal)]
                  ([div :num 2204 :class (a-section)]
                   ([p :num 2205 :class (a-size-large a-color-base)]
                    ([span :num 2206 :class (digital-dash-deleted-button-name)]))
                   ([p :num 2207 :id edoc-10007 :class (digital-dash-restore-link-text)])
                   ([div :num 2208 :class (a-box a-alert-inline a-alert-inline-error digital-dash-deletable__restore-error-message)]
                    ([div :num 2209 :class (a-box-inner a-alert-container)]
                     ([i :num 2210 :class (a-icon a-icon-alert)])
                     ([div :num 2211 :class (a-alert-content)]
                      ([span :num 2212 :class (a-size-mini)])))))))))))
            ([div :num 2213 :class (a-section a-spacing-small digital-dash-list-item)]
             ([div :num 2214 :class (a-section digital-dash-delete-swiper digital-dash-deletable)]
              ([div :num 2215 :class (a-section digital-dash-delete-swiper-frame digital-dash-delete-swiper-button-frame)]
               ([span :num 2216 :class (a-declarative)]
                ([form :num 2217 :class (digital-dash-button-helper-wrapper )]
                 ([div :num 2218 :class (digital-dash-button-outer-wrapper)] " "
                  ([div :num 2219 :id edoc-10806 :class (digital-dash-button-inner-wrapper digital-dash-background-gradient-1)]
                   ([span :num 2220 :class (a-declarative)]
                    ([span :num 2221 :class (a-declarative)]
                     ([a :num 2222 :id edoc-10482 :class (digital-dash-deck)]
                      ([h5 :num 2223 :class (brand-name a-text-normal)]
                       ([span :num 2224 :class (aok-hide-text)]
                        ([span :num 2225 :class (aok-hide-text)] "Digital dash button for")
                        ([span :num 2226 :id edoc-10807 :class (digital-dash-button-name)] "Schick")
                        ([span :num 2227 :class (aok-hide-text)] "select for more information")))) " ")
                    ([span :num 2228 :class (a-size-mini digital-dash-button-label)] "8 Cartridges, Regul…"))
                   ([div :num 2229 :class (digital-dash-button-wrapper)]
                    ([div :num 2230 :class (digital-dash-button-border)]
                     ([button :num 2231 :class (digital-dash-button-button)]
                      ([span :num 2232 :class (digital-dash-button-item-price)]
                       ([span :num 2233 :id digital-dash-button-price :class (a-price digital-dash-button-price)]
                        ([span :num 2234 :class (a-offscreen)] "USD 19.23")
                        ([span :num 2235]
                         ([span :num 2236 :id edoc-10661 :class (a-price-symbol)] "$")
                         ([span :num 2237 :class (a-price-whole)] "19"
                          ([span :num 2238 :id edoc-10649 :class (a-price-decimal)] "."))
                         ([span :num 2239 :id edoc-10655 :class (a-price-fraction)] "23"))))
                      ([span :num 2240 :class (digital-dash-button-button__cta)] "Buy now"))))) " ")
                 ([input :num 2241 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2242 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2243 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2244 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2245 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2246 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2247 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2248 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2249 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2250 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2251 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2252 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2253 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2254 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2255 :w 0 :h 0 :type hidden]) " "
                 ([div :num 2256 :class (a-section digital-dash-tag-wrapper)]
                  ([div :num 2257 :class (a-row digital-dash-tag)]
                   ([div :num 2258 :class (a-section a-text-left digital-dash-tag-ships-to)]
                    ([span :num 2259 :class (a-size-small digital-dash-tag-title digital-dash-j-tag-ships-to-title)])
                    ([span :num 2260 :class (a-size-base digital-dash-tag-body-address digital-dash-j-tag-ships-to-body a-text-bold)]))
                   ([div :num 2261 :class (a-section a-padding-base a-text-center digital-dash-tag-arrives)]
                    ([a :num 2262 :id edoc-10483 :class (a-link-normal digital-dash-tag-link digital-dash-j-tag-arrives-link)]
                     ([span :num 2263 :class (a-size-small digital-dash-tag-title digital-dash-j-tag-arrives-title)] "Arrives")
                     ([span :num 2264 :class (a-size-base digital-dash-tag-body digital-dash-j-tag-arrives-body a-text-bold)])
                     ([span :num 2265 :class (a-size-mini digital-dash-tag-link-text digital-dash-j-tag-arrives-link-text)] "View order")))))) " ")
               ([div :num 2266 :class (a-box a-alert-inline a-alert-inline-error digital-dash-deletable__delete-error-message)]
                ([div :num 2267 :class (a-box-inner a-alert-container)]
                 ([i :num 2268 :class (a-icon a-icon-alert)])
                 ([div :num 2269 :class (a-alert-content)]
                  ([span :num 2270 :class (a-size-mini)])))))
              ([div :num 2271 :class (a-section digital-dash-delete-swiper-frame)]
               ([div :num 2272 :class (a-section digital-dash-delete-message)]
                ([span :num 2273 :class (digital-dash-delete-text)]
                 ([span :num 2274 :class (a-declarative)]
                  ([a :num 2275 :id edoc-10484 :class (a-size-large a-link-normal)] "Delete this button"))))
               ([div :num 2276 :class (a-section digital-dash-restore-message)]
                ([span :num 2277 :class (a-declarative)]
                 ([a :num 2278 :id edoc-10485 :class (a-link-normal)]
                  ([div :num 2279 :class (a-section)]
                   ([p :num 2280 :class (a-size-large a-color-base)]
                    ([span :num 2281 :class (digital-dash-deleted-button-name)]))
                   ([p :num 2282 :id edoc-10008 :class (digital-dash-restore-link-text)])
                   ([div :num 2283 :class (a-box a-alert-inline a-alert-inline-error digital-dash-deletable__restore-error-message)]
                    ([div :num 2284 :class (a-box-inner a-alert-container)]
                     ([i :num 2285 :class (a-icon a-icon-alert)])
                     ([div :num 2286 :class (a-alert-content)]
                      ([span :num 2287 :class (a-size-mini)])))))))))))
            ([div :num 2288 :class (a-section a-spacing-small digital-dash-list-item)]
             ([div :num 2289 :class (a-section digital-dash-delete-swiper digital-dash-deletable)]
              ([div :num 2290 :class (a-section digital-dash-delete-swiper-frame digital-dash-delete-swiper-button-frame)]
               ([span :num 2291 :class (a-declarative)]
                ([form :num 2292 :class (digital-dash-button-helper-wrapper )]
                 ([div :num 2293 :class (digital-dash-button-outer-wrapper)] " "
                  ([div :num 2294 :id edoc-10808 :class (digital-dash-button-inner-wrapper digital-dash-background-gradient-0)]
                   ([span :num 2295 :class (a-declarative)]
                    ([span :num 2296 :class (a-declarative)]
                     ([a :num 2297 :id edoc-10486 :class (digital-dash-deck)]
                      ([h5 :num 2298 :class (brand-name a-text-normal)]
                       ([span :num 2299 :class (aok-hide-text)]
                        ([span :num 2300 :class (aok-hide-text)] "Digital dash button for")
                        ([span :num 2301 :id edoc-10809 :class (digital-dash-button-name)] "Quilted Northern")
                        ([span :num 2302 :class (aok-hide-text)] "select for more information")))) " ")
                    ([span :num 2303 :class (a-size-mini digital-dash-button-label digital-dash-button-label-hide)]))
                   ([div :num 2304 :class (digital-dash-button-wrapper)]
                    ([div :num 2305 :class (digital-dash-button-border)]
                     ([button :num 2306 :class (digital-dash-button-button)]
                      ([span :num 2307 :class (digital-dash-button-item-price)]
                       ([span :num 2308 :id digital-dash-button-price :class (a-price digital-dash-button-price)]
                        ([span :num 2309 :class (a-offscreen)] "USD 25.99")
                        ([span :num 2310]
                         ([span :num 2311 :id edoc-10662 :class (a-price-symbol)] "$")
                         ([span :num 2312 :class (a-price-whole)] "25"
                          ([span :num 2313 :id edoc-10650 :class (a-price-decimal)] "."))
                         ([span :num 2314 :id edoc-10656 :class (a-price-fraction)] "99"))))
                      ([span :num 2315 :class (digital-dash-button-button__cta)] "Buy now"))))) " ")
                 ([input :num 2316 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2317 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2318 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2319 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2320 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2321 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2322 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2323 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2324 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2325 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2326 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2327 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2328 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2329 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2330 :w 0 :h 0 :type hidden]) " "
                 ([div :num 2331 :class (a-section digital-dash-tag-wrapper)]
                  ([div :num 2332 :class (a-row digital-dash-tag)]
                   ([div :num 2333 :class (a-section a-text-left digital-dash-tag-ships-to)]
                    ([span :num 2334 :class (a-size-small digital-dash-tag-title digital-dash-j-tag-ships-to-title)])
                    ([span :num 2335 :class (a-size-base digital-dash-tag-body-address digital-dash-j-tag-ships-to-body a-text-bold)]))
                   ([div :num 2336 :class (a-section a-padding-base a-text-center digital-dash-tag-arrives)]
                    ([a :num 2337 :id edoc-10487 :class (a-link-normal digital-dash-tag-link digital-dash-j-tag-arrives-link)]
                     ([span :num 2338 :class (a-size-small digital-dash-tag-title digital-dash-j-tag-arrives-title)] "Arrives")
                     ([span :num 2339 :class (a-size-base digital-dash-tag-body digital-dash-j-tag-arrives-body a-text-bold)])
                     ([span :num 2340 :class (a-size-mini digital-dash-tag-link-text digital-dash-j-tag-arrives-link-text)] "View order")))))) " ")
               ([div :num 2341 :class (a-box a-alert-inline a-alert-inline-error digital-dash-deletable__delete-error-message)]
                ([div :num 2342 :class (a-box-inner a-alert-container)]
                 ([i :num 2343 :class (a-icon a-icon-alert)])
                 ([div :num 2344 :class (a-alert-content)]
                  ([span :num 2345 :class (a-size-mini)])))))
              ([div :num 2346 :class (a-section digital-dash-delete-swiper-frame)]
               ([div :num 2347 :class (a-section digital-dash-delete-message)]
                ([span :num 2348 :class (digital-dash-delete-text)]
                 ([span :num 2349 :class (a-declarative)]
                  ([a :num 2350 :id edoc-10488 :class (a-size-large a-link-normal)] "Delete this button"))))
               ([div :num 2351 :class (a-section digital-dash-restore-message)]
                ([span :num 2352 :class (a-declarative)]
                 ([a :num 2353 :id edoc-10489 :class (a-link-normal)]
                  ([div :num 2354 :class (a-section)]
                   ([p :num 2355 :class (a-size-large a-color-base)]
                    ([span :num 2356 :class (digital-dash-deleted-button-name)]))
                   ([p :num 2357 :id edoc-10009 :class (digital-dash-restore-link-text)])
                   ([div :num 2358 :class (a-box a-alert-inline a-alert-inline-error digital-dash-deletable__restore-error-message)]
                    ([div :num 2359 :class (a-box-inner a-alert-container)]
                     ([i :num 2360 :class (a-icon a-icon-alert)])
                     ([div :num 2361 :class (a-alert-content)]
                      ([span :num 2362 :class (a-size-mini)])))))))))))
            ([div :num 2363 :class (a-section a-spacing-small digital-dash-list-item)]
             ([div :num 2364 :class (a-section digital-dash-delete-swiper digital-dash-deletable)]
              ([div :num 2365 :class (a-section digital-dash-delete-swiper-frame digital-dash-delete-swiper-button-frame)]
               ([span :num 2366 :class (a-declarative)]
                ([form :num 2367 :class (digital-dash-button-helper-wrapper )]
                 ([div :num 2368 :class (digital-dash-button-outer-wrapper)] " "
                  ([div :num 2369 :id edoc-10810 :class (digital-dash-button-inner-wrapper digital-dash-background-gradient-2)]
                   ([span :num 2370 :class (a-declarative)]
                    ([span :num 2371 :class (a-declarative)]
                     ([a :num 2372 :id edoc-10490 :class (digital-dash-deck)]
                      ([h5 :num 2373 :class (brand-name a-text-normal)]
                       ([span :num 2374 :class (aok-hide-text)]
                        ([span :num 2375 :class (aok-hide-text)] "Digital dash button for")
                        ([span :num 2376 :id edoc-10811 :class (digital-dash-button-name)] "Body Fortress")
                        ([span :num 2377 :class (aok-hide-text)] "select for more information")))) " ")
                    ([span :num 2378 :class (a-size-mini digital-dash-button-label)] "Super Adva…(Vanilla)"))
                   ([div :num 2379 :class (digital-dash-button-wrapper)]
                    ([div :num 2380 :class (digital-dash-button-border)]
                     ([button :num 2381 :class (digital-dash-button-button)]
                      ([span :num 2382 :class (digital-dash-button-item-price)]
                       ([span :num 2383 :id digital-dash-button-price :class (a-price digital-dash-button-price)]
                        ([span :num 2384 :class (a-offscreen)] "USD 22.45")
                        ([span :num 2385]
                         ([span :num 2386 :id edoc-10663 :class (a-price-symbol)] "$")
                         ([span :num 2387 :class (a-price-whole)] "22"
                          ([span :num 2388 :id edoc-10651 :class (a-price-decimal)] "."))
                         ([span :num 2389 :id edoc-10657 :class (a-price-fraction)] "45"))))
                      ([span :num 2390 :class (digital-dash-button-button__cta)] "Buy now"))))) " ")
                 ([input :num 2391 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2392 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2393 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2394 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2395 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2396 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2397 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2398 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2399 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2400 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2401 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2402 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2403 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2404 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2405 :w 0 :h 0 :type hidden]) " "
                 ([div :num 2406 :class (a-section digital-dash-tag-wrapper)]
                  ([div :num 2407 :class (a-row digital-dash-tag)]
                   ([div :num 2408 :class (a-section a-text-left digital-dash-tag-ships-to)]
                    ([span :num 2409 :class (a-size-small digital-dash-tag-title digital-dash-j-tag-ships-to-title)])
                    ([span :num 2410 :class (a-size-base digital-dash-tag-body-address digital-dash-j-tag-ships-to-body a-text-bold)]))
                   ([div :num 2411 :class (a-section a-padding-base a-text-center digital-dash-tag-arrives)]
                    ([a :num 2412 :id edoc-10491 :class (a-link-normal digital-dash-tag-link digital-dash-j-tag-arrives-link)]
                     ([span :num 2413 :class (a-size-small digital-dash-tag-title digital-dash-j-tag-arrives-title)] "Arrives")
                     ([span :num 2414 :class (a-size-base digital-dash-tag-body digital-dash-j-tag-arrives-body a-text-bold)])
                     ([span :num 2415 :class (a-size-mini digital-dash-tag-link-text digital-dash-j-tag-arrives-link-text)] "View order")))))) " ")
               ([div :num 2416 :class (a-box a-alert-inline a-alert-inline-error digital-dash-deletable__delete-error-message)]
                ([div :num 2417 :class (a-box-inner a-alert-container)]
                 ([i :num 2418 :class (a-icon a-icon-alert)])
                 ([div :num 2419 :class (a-alert-content)]
                  ([span :num 2420 :class (a-size-mini)])))))
              ([div :num 2421 :class (a-section digital-dash-delete-swiper-frame)]
               ([div :num 2422 :class (a-section digital-dash-delete-message)]
                ([span :num 2423 :class (digital-dash-delete-text)]
                 ([span :num 2424 :class (a-declarative)]
                  ([a :num 2425 :id edoc-10492 :class (a-size-large a-link-normal)] "Delete this button"))))
               ([div :num 2426 :class (a-section digital-dash-restore-message)]
                ([span :num 2427 :class (a-declarative)]
                 ([a :num 2428 :id edoc-10493 :class (a-link-normal)]
                  ([div :num 2429 :class (a-section)]
                   ([p :num 2430 :class (a-size-large a-color-base)]
                    ([span :num 2431 :class (digital-dash-deleted-button-name)]))
                   ([p :num 2432 :id edoc-10010 :class (digital-dash-restore-link-text)])
                   ([div :num 2433 :class (a-box a-alert-inline a-alert-inline-error digital-dash-deletable__restore-error-message)]
                    ([div :num 2434 :class (a-box-inner a-alert-container)]
                     ([i :num 2435 :class (a-icon a-icon-alert)])
                     ([div :num 2436 :class (a-alert-content)]
                      ([span :num 2437 :class (a-size-mini)])))))))))))
            ([div :num 2438 :class (a-section a-spacing-small digital-dash-list-item)]
             ([div :num 2439 :class (a-section digital-dash-delete-swiper digital-dash-deletable)]
              ([div :num 2440 :class (a-section digital-dash-delete-swiper-frame digital-dash-delete-swiper-button-frame)]
               ([span :num 2441 :class (a-declarative)]
                ([form :num 2442 :class (digital-dash-button-helper-wrapper )]
                 ([div :num 2443 :class (digital-dash-button-outer-wrapper)] " "
                  ([div :num 2444 :id edoc-10812 :class (digital-dash-button-inner-wrapper digital-dash-background-gradient-1)]
                   ([span :num 2445 :class (a-declarative)]
                    ([span :num 2446 :class (a-declarative)]
                     ([a :num 2447 :id edoc-10494 :class (digital-dash-deck)]
                      ([h5 :num 2448 :class (brand-name a-text-normal)]
                       ([span :num 2449 :class (aok-hide-text)]
                        ([span :num 2450 :class (aok-hide-text)] "Digital dash button for")
                        ([span :num 2451 :id edoc-10813 :class (digital-dash-button-name)] "Schick")
                        ([span :num 2452 :class (aok-hide-text)] "select for more information")))) " ")
                    ([span :num 2453 :class (a-size-mini digital-dash-button-label)] "Quattro Tit…(1-Pack)"))
                   ([div :num 2454 :class (digital-dash-button-wrapper)]
                    ([div :num 2455 :class (digital-dash-button-border)]
                     ([button :num 2456 :class (digital-dash-button-button)]
                      ([span :num 2457 :class (digital-dash-button-item-price)]
                       ([span :num 2458 :id digital-dash-button-price :class (a-price digital-dash-button-price)]
                        ([span :num 2459 :class (a-offscreen)] "USD 18.25")
                        ([span :num 2460]
                         ([span :num 2461 :id edoc-10664 :class (a-price-symbol)] "$")
                         ([span :num 2462 :class (a-price-whole)] "18"
                          ([span :num 2463 :id edoc-10652 :class (a-price-decimal)] "."))
                         ([span :num 2464 :id edoc-10658 :class (a-price-fraction)] "25"))))
                      ([span :num 2465 :class (digital-dash-button-button__cta)] "Buy now"))))) " ")
                 ([input :num 2466 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2467 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2468 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2469 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2470 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2471 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2472 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2473 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2474 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2475 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2476 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2477 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2478 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2479 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2480 :w 0 :h 0 :type hidden]) " "
                 ([div :num 2481 :class (a-section digital-dash-tag-wrapper)]
                  ([div :num 2482 :class (a-row digital-dash-tag)]
                   ([div :num 2483 :class (a-section a-text-left digital-dash-tag-ships-to)]
                    ([span :num 2484 :class (a-size-small digital-dash-tag-title digital-dash-j-tag-ships-to-title)])
                    ([span :num 2485 :class (a-size-base digital-dash-tag-body-address digital-dash-j-tag-ships-to-body a-text-bold)]))
                   ([div :num 2486 :class (a-section a-padding-base a-text-center digital-dash-tag-arrives)]
                    ([a :num 2487 :id edoc-10495 :class (a-link-normal digital-dash-tag-link digital-dash-j-tag-arrives-link)]
                     ([span :num 2488 :class (a-size-small digital-dash-tag-title digital-dash-j-tag-arrives-title)] "Arrives")
                     ([span :num 2489 :class (a-size-base digital-dash-tag-body digital-dash-j-tag-arrives-body a-text-bold)])
                     ([span :num 2490 :class (a-size-mini digital-dash-tag-link-text digital-dash-j-tag-arrives-link-text)] "View order")))))) " ")
               ([div :num 2491 :class (a-box a-alert-inline a-alert-inline-error digital-dash-deletable__delete-error-message)]
                ([div :num 2492 :class (a-box-inner a-alert-container)]
                 ([i :num 2493 :class (a-icon a-icon-alert)])
                 ([div :num 2494 :class (a-alert-content)]
                  ([span :num 2495 :class (a-size-mini)])))))
              ([div :num 2496 :class (a-section digital-dash-delete-swiper-frame)]
               ([div :num 2497 :class (a-section digital-dash-delete-message)]
                ([span :num 2498 :class (digital-dash-delete-text)]
                 ([span :num 2499 :class (a-declarative)]
                  ([a :num 2500 :id edoc-10496 :class (a-size-large a-link-normal)] "Delete this button"))))
               ([div :num 2501 :class (a-section digital-dash-restore-message)]
                ([span :num 2502 :class (a-declarative)]
                 ([a :num 2503 :id edoc-10497 :class (a-link-normal)]
                  ([div :num 2504 :class (a-section)]
                   ([p :num 2505 :class (a-size-large a-color-base)]
                    ([span :num 2506 :class (digital-dash-deleted-button-name)]))
                   ([p :num 2507 :id edoc-10011 :class (digital-dash-restore-link-text)])
                   ([div :num 2508 :class (a-box a-alert-inline a-alert-inline-error digital-dash-deletable__restore-error-message)]
                    ([div :num 2509 :class (a-box-inner a-alert-container)]
                     ([i :num 2510 :class (a-icon a-icon-alert)])
                     ([div :num 2511 :class (a-alert-content)]
                      ([span :num 2512 :class (a-size-mini)])))))))))))
            ([div :num 2513 :class (a-section a-spacing-small digital-dash-list-item)]
             ([div :num 2514 :class (a-section digital-dash-delete-swiper digital-dash-deletable)]
              ([div :num 2515 :class (a-section digital-dash-delete-swiper-frame digital-dash-delete-swiper-button-frame)]
               ([span :num 2516 :class (a-declarative)]
                ([form :num 2517 :class (digital-dash-button-helper-wrapper )]
                 ([div :num 2518 :class (digital-dash-button-outer-wrapper)] " "
                  ([div :num 2519 :id edoc-10814 :class (digital-dash-button-inner-wrapper digital-dash-background-gradient-2)]
                   ([span :num 2520 :class (a-declarative)]
                    ([span :num 2521 :class (a-declarative)]
                     ([a :num 2522 :id edoc-10498 :class (digital-dash-deck)]
                      ([h5 :num 2523 :class (brand-name a-text-normal)]
                       ([span :num 2524 :class (aok-hide-text)]
                        ([span :num 2525 :class (aok-hide-text)] "Digital dash button for")
                        ([span :num 2526 :id edoc-10815 :class (digital-dash-button-name)] "Charmin")
                        ([span :num 2527 :class (aok-hide-text)] "select for more information")))) " ")
                    ([span :num 2528 :class (a-size-mini digital-dash-button-label digital-dash-button-label-hide)]))
                   ([div :num 2529 :class (digital-dash-button-wrapper)]
                    ([div :num 2530 :class (digital-dash-button-border)]
                     ([button :num 2531 :class (digital-dash-button-button)]
                      ([span :num 2532 :class (digital-dash-button-item-price)]
                       ([span :num 2533 :id digital-dash-button-price :class (a-price digital-dash-button-price)]
                        ([span :num 2534 :class (a-offscreen)] "USD 12.29")
                        ([span :num 2535]
                         ([span :num 2536 :id edoc-10665 :class (a-price-symbol)] "$")
                         ([span :num 2537 :class (a-price-whole)] "12"
                          ([span :num 2538 :id edoc-10653 :class (a-price-decimal)] "."))
                         ([span :num 2539 :id edoc-10659 :class (a-price-fraction)] "29"))))
                      ([span :num 2540 :class (digital-dash-button-button__cta)] "Buy now"))))) " ")
                 ([input :num 2541 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2542 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2543 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2544 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2545 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2546 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2547 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2548 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2549 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2550 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2551 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2552 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2553 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2554 :w 0 :h 0 :type hidden]) " "
                 ([input :num 2555 :w 0 :h 0 :type hidden]) " "
                 ([div :num 2556 :class (a-section digital-dash-tag-wrapper)]
                  ([div :num 2557 :class (a-row digital-dash-tag)]
                   ([div :num 2558 :class (a-section a-text-left digital-dash-tag-ships-to)]
                    ([span :num 2559 :class (a-size-small digital-dash-tag-title digital-dash-j-tag-ships-to-title)])
                    ([span :num 2560 :class (a-size-base digital-dash-tag-body-address digital-dash-j-tag-ships-to-body a-text-bold)]))
                   ([div :num 2561 :class (a-section a-padding-base a-text-center digital-dash-tag-arrives)]
                    ([a :num 2562 :id edoc-10499 :class (a-link-normal digital-dash-tag-link digital-dash-j-tag-arrives-link)]
                     ([span :num 2563 :class (a-size-small digital-dash-tag-title digital-dash-j-tag-arrives-title)] "Arrives")
                     ([span :num 2564 :class (a-size-base digital-dash-tag-body digital-dash-j-tag-arrives-body a-text-bold)])
                     ([span :num 2565 :class (a-size-mini digital-dash-tag-link-text digital-dash-j-tag-arrives-link-text)] "View order")))))) " ")
               ([div :num 2566 :class (a-box a-alert-inline a-alert-inline-error digital-dash-deletable__delete-error-message)]
                ([div :num 2567 :class (a-box-inner a-alert-container)]
                 ([i :num 2568 :class (a-icon a-icon-alert)])
                 ([div :num 2569 :class (a-alert-content)]
                  ([span :num 2570 :class (a-size-mini)])))))
              ([div :num 2571 :class (a-section digital-dash-delete-swiper-frame)]
               ([div :num 2572 :class (a-section digital-dash-delete-message)]
                ([span :num 2573 :class (digital-dash-delete-text)]
                 ([span :num 2574 :class (a-declarative)]
                  ([a :num 2575 :id edoc-10500 :class (a-size-large a-link-normal)] "Delete this button"))))
               ([div :num 2576 :class (a-section digital-dash-restore-message)]
                ([span :num 2577 :class (a-declarative)]
                 ([a :num 2578 :id edoc-10501 :class (a-link-normal)]
                  ([div :num 2579 :class (a-section)]
                   ([p :num 2580 :class (a-size-large a-color-base)]
                    ([span :num 2581 :class (digital-dash-deleted-button-name)]))
                   ([p :num 2582 :id edoc-10012 :class (digital-dash-restore-link-text)])
                   ([div :num 2583 :class (a-box a-alert-inline a-alert-inline-error digital-dash-deletable__restore-error-message)]
                    ([div :num 2584 :class (a-box-inner a-alert-container)]
                     ([i :num 2585 :class (a-icon a-icon-alert)])
                     ([div :num 2586 :class (a-alert-content)]
                      ([span :num 2587 :class (a-size-mini)])))))))))))
            ([a :num 2588 :id edoc-10502 :class (a-link-normal digital-dash-gateway-desktop__see-all-link)] " See all your Dash Buttons ")))
          ([script :num 2589]) " "
          ([script :num 2590]) " "
          ([script :num 2591]) " "
          ([script :num 2592]) " "
          ([script :num 2593]))
         ([hr :num 2594 :class (slot-hr desktop-sidekick-1-hr)])
         ([div :num 2595 :id desktop-sidekick-2 :class (sidekick celwidget csm-placement-id-ef7d3903-8765-5630-bc18-9f83dd14ac70)]
          ([div :num 2596 :id QSguKUWLV0VIvwEV1_t5kQ :class (cropped-image-link image-map shogun-widget card-lite ameyal-cropped-image-link)]
           ([script :num 2597])
           ([div :num 2598 :id edoc-10816 :class (cropped-image-map-size)]
            ([div :num 2599 :class (cropped-image-map-center-alignment)]
             ([span :num 2600 :id edoc-10817]
              ([a :num 2601 :id edoc-10503 :class (a-link-normal aok-inline-block)]
               ([img :num 2602 :w 264 :h 350]))
              ([div :num 2603 :class (a-section)])))))
          ([script :num 2604]))
         ([hr :num 2605 :class (slot-hr desktop-sidekick-2-hr)])) " ")) " "
      ([style :num 2606 :id gw-col-shift]) " "
      ([script :num 2607]) " " " " " " " "
      ([style :num 2608]) " "
      ([script :num 2609]) " "
      ([div :num 2610 :id edoc-10818]
       ([div :num 2611 :id nav-prime-menu :class (nav-empty nav-flyout-content nav-ajax-prime-menu)]
        ([div :num 2612 :class (nav_dynamic)])
        ([div :num 2613 :class (nav-ajax-message)])
        ([div :num 2614 :class (nav-ajax-error-msg)]
         ([p :num 2615 :class (nav_p nav-bold)])
         ([p :num 2616 :id edoc-10013 :class (nav_p)]
          ([a :num 2617 :id edoc-10504 :class (nav_a)]))))) " "
      ([style :num 2618]) " "
      ([div :num 2619 :id edoc-10819]
       ([div :num 2620 :id nav-prime-tooltip]
        ([div :num 2621 :class (nav-npt-text-title)])
        ([div :num 2622 :class (nav-npt-text-detail)])
        ([div :num 2623 :class (nav-npt-text-detail)]
         ([a :num 2624 :id edoc-10505 :class (nav-npt-a)])))) " "
      ([script :num 2625]) " "
      ([script :num 2626]) " "
      ([link :num 2627]) " " " "
      ([script :num 2628]) " "
      ([link :num 2629]) " "
      ([script :num 2630]) " "
      ([form :num 2631 :id edoc-10820]
       ([input :num 2632 :id rwol-display-called :w 0 :h 0 :type hidden])) " "
      ([script :num 2633]) " "
      ([script :num 2634]) " "
      ([script :num 2635]) " "
      ([script :num 2636]) " "
      ([div :num 2637 :id gw-content-grid-bottom :class (a-fixed-right-grid gw-content-grid)]
       ([div :num 2638 :id edoc-10821 :class (a-fixed-right-grid-inner)]
        ([div :num 2639 :class (a-section a-spacing-medium)]
         ([div :num 2640 :id main-content-bottom :class (a-fixed-right-grid-col main-content a-col-left)]
          ([div :num 2641 :class (btfContent)]
           ([div :num 2642 :class (adcenterRowWrapper)]
            ([div :num 2643 :id desktop-ad-center-1 :class (ad-center celwidget csm-placement-id-603accc7-bd0f-4de7-bdd1-284adb32c808)]
             ([script :num 2644])
             ([div :num 2645 :id ape_Gateway_desktop-ad-center-1_desktop_placement :class (copilot-secure-display celwidget  text/x-dacx-safeframe)]
              ([iframe :num 2646 :id ape_Gateway_desktop-ad-center-1_desktop_iframe :w 1110 :h 286])
              ([div :num 2647 :id ape_Gateway_desktop-ad-center-1_desktop_placement_Feedback]
               ([a :num 2648 :id edoc-10822 :class (a-declarative)]
                ([span :num 2649 :id ad-feedback-text-desktop-ad-center-1] " Ad feedback "
                 ([b :num 2650 :id ad-feedback-sprite-desktop-ad-center-1])))
               ([script :num 2651])))
             ([script :num 2652]))) " "
           ([hr :num 2653 :class (billboardrow-hr)])
           ([script :num 2654])
           ([div :num 2655 :class (billboardRowWrapper gwi-x2)]
            ([div :num 2656 :class (a-row billboardRow)]
             ([div :num 2657 :class (a-column a-span6)]
              ([div :num 2658 :id desktop-billboard-3 :class (billboard celwidget csm-placement-id-6ae25a30-74de-4989-b57b-b0de9f237c41)]
               ([div :num 2659 :id s5_L8oDmMA3rrBe5jXAn3w :class (a-section a-text-center scalable-image-link scalable-image-map card-lite ameyal-scalable-image-link)]
                ([script :num 2660])
                ([a :num 2661 :id edoc-10506 :class (a-link-normal)]
                 ([img :num 2662 :w 440 :h 200])))
               ([script :num 2663]))) " "
             ([div :num 2664 :class (a-column a-span6 a-span-last)]
              ([div :num 2665 :id desktop-billboard-4 :class (billboard celwidget csm-placement-id-b7487224-cbb7-4d6f-bfeb-ec90f10f32a5)]
               ([div :num 2666 :id KrG9cTfVyzLsvEgMaDWwTQ :class (cropped-image-link image-map shogun-widget card-lite ameyal-cropped-image-link)]
                ([script :num 2667])
                ([div :num 2668 :id edoc-10823 :class (cropped-image-map-size)]
                 ([div :num 2669 :class (cropped-image-map-center-alignment)]
                  ([span :num 2670 :id edoc-10824]
                   ([a :num 2671 :id edoc-10507 :class (a-link-normal aok-inline-block)]
                    ([img :num 2672 :w 440 :h 200]))
                   ([div :num 2673 :class (a-section)])))))
               ([script :num 2674]))) " "))
           ([hr :num 2675 :class (billboardrow-hr)])
           ([div :num 2676 :id desktop-5 :class (desktop-row gw-widget-instrument gwi-x2 celwidget csm-placement-id-0ec45e05-f737-5176-8f6c-1a3b39d343b3 pd_rd_wg-ZmGa2 pd_rd_w-MwJtP pd_rd_r-8f536811-70f1-4326-b92f-8641b7a6525e)]
            ([div :num 2677 :id irT0131F2o_EuobkXC_gBg :class (a-section a-spacing-none shogun-widget card-lite product-shoveler aui-desktop fresh-shoveler ameyal-product-shoveler)]
             ([div :num 2678 :class (a-section as-title-block)]
              ([h2 :num 2679 :class (as-title-block-left)]
               ([span :num 2680 :class (a-color-base)] "Recommended for you in Kindle Magazines")) " "
              ([span :num 2681 :class (as-title-block-right)]))
             ([div :num 2682 :class (a-section feed-carousel)]
              ([div :num 2683 :class (a-section feed-carousel-viewport)]
               ([ul :num 2684 :class (a-unordered-list a-nostyle a-horizontal feed-carousel-shelf)]
                ([li :num 2685 :id edoc-10825 :class (feed-carousel-card)]
                 ([span :num 2686 :class (a-list-item)]
                  ([a :num 2687 :id edoc-10508 :class (a-link-normal aok-inline-block)]
                   ([img :num 2688 :class (product-image) :w 147 :h 200])))) " "
                ([li :num 2689 :id edoc-10826 :class (feed-carousel-card)]
                 ([span :num 2690 :class (a-list-item)]
                  ([a :num 2691 :id edoc-10509 :class (a-link-normal aok-inline-block)]
                   ([img :num 2692 :class (product-image) :w 146 :h 200])))) " "
                ([li :num 2693 :id edoc-10827 :class (feed-carousel-card)]
                 ([span :num 2694 :class (a-list-item)]
                  ([a :num 2695 :id edoc-10510 :class (a-link-normal aok-inline-block)]
                   ([img :num 2696 :class (product-image) :w 148 :h 200])))) " "
                ([li :num 2697 :id edoc-10828 :class (feed-carousel-card)]
                 ([span :num 2698 :class (a-list-item)]
                  ([a :num 2699 :id edoc-10511 :class (a-link-normal aok-inline-block)]
                   ([img :num 2700 :class (product-image) :w 147 :h 200])))) " "
                ([li :num 2701 :id edoc-10829 :class (feed-carousel-card)]
                 ([span :num 2702 :class (a-list-item)]
                  ([a :num 2703 :id edoc-10512 :class (a-link-normal aok-inline-block)]
                   ([img :num 2704 :class (product-image) :w 150 :h 200])))) " "
                ([li :num 2705 :id edoc-10830 :class (feed-carousel-card)]
                 ([span :num 2706 :class (a-list-item)]
                  ([a :num 2707 :id edoc-10513 :class (a-link-normal aok-inline-block)]
                   ([img :num 2708 :class (product-image) :w 150 :h 200])))) " "
                ([li :num 2709 :id edoc-10831 :class (feed-carousel-card)]
                 ([span :num 2710 :class (a-list-item)]
                  ([a :num 2711 :id edoc-10514 :class (a-link-normal aok-inline-block)]
                   ([img :num 2712 :class (product-image) :w 150 :h 200])))) " "
                ([li :num 2713 :id edoc-10832 :class (feed-carousel-card)]
                 ([span :num 2714 :class (a-list-item)]
                  ([a :num 2715 :id edoc-10515 :class (a-link-normal aok-inline-block)]
                   ([img :num 2716 :class (product-image) :w 147 :h 200])))) " "
                ([li :num 2717 :id edoc-10833 :class (feed-carousel-card)]
                 ([span :num 2718 :class (a-list-item)]
                  ([a :num 2719 :id edoc-10516 :class (a-link-normal aok-inline-block)]
                   ([img :num 2720 :class (product-image) :w 168 :h 200])))) " "
                ([li :num 2721 :id edoc-10834 :class (feed-carousel-card)]
                 ([span :num 2722 :class (a-list-item)]
                  ([a :num 2723 :id edoc-10517 :class (a-link-normal aok-inline-block)]
                   ([img :num 2724 :class (product-image) :w 152 :h 200])))) " "
                ([li :num 2725 :id edoc-10835 :class (feed-carousel-card)]
                 ([span :num 2726 :class (a-list-item)]
                  ([a :num 2727 :id edoc-10518 :class (a-link-normal aok-inline-block)]
                   ([img :num 2728 :class (product-image) :w 146 :h 200])))) " "
                ([li :num 2729 :id edoc-10836 :class (feed-carousel-card)]
                 ([span :num 2730 :class (a-list-item)]
                  ([a :num 2731 :id edoc-10519 :class (a-link-normal aok-inline-block)]
                   ([img :num 2732 :class (product-image) :w 147 :h 200])))) " "
                ([li :num 2733 :id edoc-10837 :class (feed-carousel-card)]
                 ([span :num 2734 :class (a-list-item)]
                  ([a :num 2735 :id edoc-10520 :class (a-link-normal aok-inline-block)]
                   ([img :num 2736 :class (product-image) :w 152 :h 200])))) " "
                ([li :num 2737 :id edoc-10838 :class (feed-carousel-card)]
                 ([span :num 2738 :class (a-list-item)]
                  ([a :num 2739 :id edoc-10521 :class (a-link-normal aok-inline-block)]
                   ([img :num 2740 :class (product-image) :w 143 :h 200])))) " "
                ([li :num 2741 :id edoc-10839 :class (feed-carousel-card)]
                 ([span :num 2742 :class (a-list-item)]
                  ([a :num 2743 :id edoc-10522 :class (a-link-normal aok-inline-block)]
                   ([img :num 2744 :class (product-image) :w 148 :h 200])))) " "
                ([li :num 2745 :id edoc-10840 :class (feed-carousel-card)]
                 ([span :num 2746 :class (a-list-item)]
                  ([a :num 2747 :id edoc-10523 :class (a-link-normal aok-inline-block)]
                   ([img :num 2748 :class (product-image) :w 147 :h 200])))) " "
                ([li :num 2749 :id edoc-10841 :class (feed-carousel-card)]
                 ([span :num 2750 :class (a-list-item)]
                  ([a :num 2751 :id edoc-10524 :class (a-link-normal aok-inline-block)]
                   ([img :num 2752 :class (product-image) :w 149 :h 200])))) " "
                ([li :num 2753 :id edoc-10842 :class (feed-carousel-card)]
                 ([span :num 2754 :class (a-list-item)]
                  ([a :num 2755 :id edoc-10525 :class (a-link-normal aok-inline-block)]
                   ([img :num 2756 :class (product-image) :w 153 :h 200])))) " "
                ([li :num 2757 :id edoc-10843 :class (feed-carousel-card)]
                 ([span :num 2758 :class (a-list-item)]
                  ([a :num 2759 :id edoc-10526 :class (a-link-normal aok-inline-block)]
                   ([img :num 2760 :class (product-image) :w 140 :h 200]))))) " "
               ([div :num 2761 :id edoc-10844 :class (spinner)]
                ([i :num 2762 :class (gw-spinner)])))
              ([a :num 2763 :id edoc-10527 :class (feed-carousel-control feed-left feed-control-disabled)]
               ([span :num 2764 :class (gw-icon feed-arrow)])) " "
              ([a :num 2765 :id edoc-10528 :class (feed-carousel-control feed-right)]
               ([span :num 2766 :class (gw-icon feed-arrow)])) " "
              ([span :num 2767 :class (feed-scrollbar)]
               ([span :num 2768 :class (feed-scrollbar-track)]
                ([span :num 2769 :id edoc-10845 :class (feed-scrollbar-thumb)]))))
             ([script :num 2770]) " "
             ([script :num 2771 :id irT0131F2o_EuobkXC_gBg-btfCarouselContent]) " "
             ([script :num 2772]))
            ([script :num 2773]))
           ([div :num 2774 :id desktop-6 :class (desktop-row gw-widget-instrument gwi-x2 celwidget csm-placement-id-b841581f-e864-5164-afa6-4c18a8348879 pd_rd_wg-ZmGa2 pd_rd_r-8f536811-70f1-4326-b92f-8641b7a6525e pd_rd_w-rtAoE)]
            ([div :num 2775 :id GBRZU1SmuoSY6EvmtGmGlQ :class (a-section a-spacing-none shogun-widget card-lite product-shoveler aui-desktop fresh-shoveler ameyal-product-shoveler)]
             ([div :num 2776 :class (a-section as-title-block)]
              ([h2 :num 2777 :class (as-title-block-left)]
               ([span :num 2778 :class (a-color-base)] "Related to items you've viewed")) " "
              ([span :num 2779 :class (as-title-block-right)]
               ([a :num 2780 :id edoc-10529 :class (a-link-normal)] "See more")))
             ([div :num 2781 :class (a-section feed-carousel)]
              ([div :num 2782 :class (a-section feed-carousel-viewport)]
               ([ul :num 2783 :class (a-unordered-list a-nostyle a-horizontal feed-carousel-shelf)]
                ([li :num 2784 :id edoc-10846 :class (feed-carousel-card)]
                 ([span :num 2785 :class (a-list-item)]
                  ([a :num 2786 :id edoc-10530 :class (a-link-normal aok-inline-block)]
                   ([img :num 2787 :class (product-image) :w 128 :h 200])))) " "
                ([li :num 2788 :id edoc-10847 :class (feed-carousel-card)]
                 ([span :num 2789 :class (a-list-item)]
                  ([a :num 2790 :id edoc-10531 :class (a-link-normal aok-inline-block)]
                   ([img :num 2791 :class (product-image) :w 130 :h 200])))) " "
                ([li :num 2792 :id edoc-10848 :class (feed-carousel-card)]
                 ([span :num 2793 :class (a-list-item)]
                  ([a :num 2794 :id edoc-10532 :class (a-link-normal aok-inline-block)]
                   ([img :num 2795 :class (product-image) :w 137 :h 200])))) " "
                ([li :num 2796 :id edoc-10849 :class (feed-carousel-card)]
                 ([span :num 2797 :class (a-list-item)]
                  ([a :num 2798 :id edoc-10533 :class (a-link-normal aok-inline-block)]
                   ([img :num 2799 :class (product-image) :w 133 :h 200])))) " "
                ([li :num 2800 :id edoc-10850 :class (feed-carousel-card)]
                 ([span :num 2801 :class (a-list-item)]
                  ([a :num 2802 :id edoc-10534 :class (a-link-normal aok-inline-block)]
                   ([img :num 2803 :class (product-image) :w 155 :h 200])))) " "
                ([li :num 2804 :id edoc-10851 :class (feed-carousel-card)]
                 ([span :num 2805 :class (a-list-item)]
                  ([a :num 2806 :id edoc-10535 :class (a-link-normal aok-inline-block)]
                   ([img :num 2807 :class (product-image) :w 134 :h 200])))) " "
                ([li :num 2808 :id edoc-10852 :class (feed-carousel-card)]
                 ([span :num 2809 :class (a-list-item)]
                  ([a :num 2810 :id edoc-10536 :class (a-link-normal aok-inline-block)]
                   ([img :num 2811 :class (product-image) :w 133 :h 200])))) " "
                ([li :num 2812 :id edoc-10853 :class (feed-carousel-card)]
                 ([span :num 2813 :class (a-list-item)]
                  ([a :num 2814 :id edoc-10537 :class (a-link-normal aok-inline-block)]
                   ([img :num 2815 :class (product-image) :w 258 :h 200])))) " "
                ([li :num 2816 :id edoc-10854 :class (feed-carousel-card)]
                 ([span :num 2817 :class (a-list-item)]
                  ([a :num 2818 :id edoc-10538 :class (a-link-normal aok-inline-block)]
                   ([img :num 2819 :class (product-image) :w 131 :h 200])))) " "
                ([li :num 2820 :id edoc-10855 :class (feed-carousel-card)]
                 ([span :num 2821 :class (a-list-item)]
                  ([a :num 2822 :id edoc-10539 :class (a-link-normal aok-inline-block)]
                   ([img :num 2823 :class (product-image) :w 150 :h 200])))) " "
                ([li :num 2824 :id edoc-10856 :class (feed-carousel-card)]
                 ([span :num 2825 :class (a-list-item)]
                  ([a :num 2826 :id edoc-10540 :class (a-link-normal aok-inline-block)]
                   ([img :num 2827 :class (product-image) :w 131 :h 200])))) " "
                ([li :num 2828 :id edoc-10857 :class (feed-carousel-card)]
                 ([span :num 2829 :class (a-list-item)]
                  ([a :num 2830 :id edoc-10541 :class (a-link-normal aok-inline-block)]
                   ([img :num 2831 :class (product-image) :w 235 :h 200])))) " "
                ([li :num 2832 :id edoc-10858 :class (feed-carousel-card)]
                 ([span :num 2833 :class (a-list-item)]
                  ([a :num 2834 :id edoc-10542 :class (a-link-normal aok-inline-block)]
                   ([img :num 2835 :class (product-image) :w 154 :h 200])))) " "
                ([li :num 2836 :id edoc-10859 :class (feed-carousel-card)]
                 ([span :num 2837 :class (a-list-item)]
                  ([a :num 2838 :id edoc-10543 :class (a-link-normal aok-inline-block)]
                   ([img :num 2839 :class (product-image) :w 133 :h 200])))) " "
                ([li :num 2840 :id edoc-10860 :class (feed-carousel-card)]
                 ([span :num 2841 :class (a-list-item)]
                  ([a :num 2842 :id edoc-10544 :class (a-link-normal aok-inline-block)]
                   ([img :num 2843 :class (product-image) :w 132 :h 200])))) " "
                ([li :num 2844 :id edoc-10861 :class (feed-carousel-card)]
                 ([span :num 2845 :class (a-list-item)]
                  ([a :num 2846 :id edoc-10545 :class (a-link-normal aok-inline-block)]
                   ([img :num 2847 :class (product-image) :w 138 :h 200]))))) " "
               ([div :num 2848 :id edoc-10862 :class (spinner)]
                ([i :num 2849 :class (gw-spinner)])))
              ([a :num 2850 :id edoc-10546 :class (feed-carousel-control feed-left feed-control-disabled)]
               ([span :num 2851 :class (gw-icon feed-arrow)])) " "
              ([a :num 2852 :id edoc-10547 :class (feed-carousel-control feed-right)]
               ([span :num 2853 :class (gw-icon feed-arrow)])) " "
              ([span :num 2854 :class (feed-scrollbar)]
               ([span :num 2855 :class (feed-scrollbar-track)]
                ([span :num 2856 :id edoc-10863 :class (feed-scrollbar-thumb)]))))
             ([script :num 2857]) " "
             ([script :num 2858 :id GBRZU1SmuoSY6EvmtGmGlQ-btfCarouselContent]) " "
             ([script :num 2859]))
            ([script :num 2860]))
           ([script :num 2861])
           ([div :num 2862 :class (billboardRowWrapper gwi-x2)]
            ([div :num 2863 :class (a-row billboardRow)]
             ([div :num 2864 :class (a-column a-span6)]
              ([div :num 2865 :id desktop-billboard-5 :class (billboard celwidget csm-placement-id-1427fba5-b796-4bf8-93dc-6006a56ed625)]
               ([div :num 2866 :id gY82tCCylalKmTUgL5--FA :class (a-section a-text-center scalable-image-link scalable-image-map card-lite ameyal-scalable-image-link)]
                ([script :num 2867])
                ([a :num 2868 :id edoc-10548 :class (a-link-normal)]
                 ([img :num 2869 :w 440 :h 200])))
               ([script :num 2870]))) " "
             ([div :num 2871 :class (a-column a-span6 a-span-last)]
              ([div :num 2872 :id desktop-billboard-6 :class (billboard celwidget csm-placement-id-fea2911f-0193-466a-ae08-b040d38c41b4)]
               ([div :num 2873 :id q6DLq-xx6_N1MQdZM7xhGw :class (a-section a-text-center scalable-image-link scalable-image-map card-lite ameyal-scalable-image-link)]
                ([script :num 2874])
                ([a :num 2875 :id edoc-10549 :class (a-link-normal)]
                 ([img :num 2876 :w 440 :h 200])))
               ([script :num 2877]))) " "))
           ([hr :num 2878 :class (billboardrow-hr)])
           ([div :num 2879 :id desktop-7 :class (desktop-row gw-widget-instrument gwi-x2 celwidget csm-placement-id-c116cecb-5676-58e0-b306-0894a1d0149e pd_rd_wg-ZmGa2 pd_rd_r-8f536811-70f1-4326-b92f-8641b7a6525e pd_rd_w-taz1J)]
            ([div :num 2880 :id r2AgerAaBy1lHJoNbR4wzA :class (a-section a-spacing-none shogun-widget card-lite product-shoveler aui-desktop fresh-shoveler ameyal-product-shoveler)]
             ([div :num 2881 :class (a-section as-title-block)]
              ([h2 :num 2882 :class (as-title-block-left)]
               ([span :num 2883 :class (a-color-base)] "Toys & Games best sellers ")) " "
              ([span :num 2884 :class (as-title-block-right)]
               ([a :num 2885 :id edoc-10550 :class (a-link-normal)] "See more")))
             ([div :num 2886 :class (a-section feed-carousel)]
              ([div :num 2887 :class (a-section feed-carousel-viewport)]
               ([ul :num 2888 :class (a-unordered-list a-nostyle a-horizontal feed-carousel-shelf)]
                ([li :num 2889 :id edoc-10864 :class (feed-carousel-card)]
                 ([span :num 2890 :class (a-list-item)]
                  ([a :num 2891 :id edoc-10551 :class (a-link-normal aok-inline-block)]
                   ([img :num 2892 :class (product-image) :w 192 :h 200])))) " "
                ([li :num 2893 :id edoc-10865 :class (feed-carousel-card)]
                 ([span :num 2894 :class (a-list-item)]
                  ([a :num 2895 :id edoc-10552 :class (a-link-normal aok-inline-block)]
                   ([img :num 2896 :class (product-image) :w 270 :h (/ 2842 15)])))) " "
                ([li :num 2897 :id edoc-10866 :class (feed-carousel-card)]
                 ([span :num 2898 :class (a-list-item)]
                  ([a :num 2899 :id edoc-10553 :class (a-link-normal aok-inline-block)]
                   ([img :num 2900 :class (product-image) :w 270 :h (/ 2219 12)])))) " "
                ([li :num 2901 :id edoc-10867 :class (feed-carousel-card)]
                 ([span :num 2902 :class (a-list-item)]
                  ([a :num 2903 :id edoc-10554 :class (a-link-normal aok-inline-block)]
                   ([img :num 2904 :class (product-image) :w 270 :h (/ 1805 12)])))) " "
                ([li :num 2905 :id edoc-10868 :class (feed-carousel-card)]
                 ([span :num 2906 :class (a-list-item)]
                  ([a :num 2907 :id edoc-10555 :class (a-link-normal aok-inline-block)]
                   ([img :num 2908 :class (product-image) :w 203 :h 200])))) " "
                ([li :num 2909 :id edoc-10869 :class (feed-carousel-card)]
                 ([span :num 2910 :class (a-list-item)]
                  ([a :num 2911 :id edoc-10556 :class (a-link-normal aok-inline-block)]
                   ([img :num 2912 :class (product-image) :w 247 :h 200])))) " "
                ([li :num 2913 :id edoc-10870 :class (feed-carousel-card)]
                 ([span :num 2914 :class (a-list-item)]
                  ([a :num 2915 :id edoc-10557 :class (a-link-normal aok-inline-block)]
                   ([img :num 2916 :class (product-image) :w 185 :h 200])))) " "
                ([li :num 2917 :id edoc-10871 :class (feed-carousel-card)]
                 ([span :num 2918 :class (a-list-item)]
                  ([a :num 2919 :id edoc-10558 :class (a-link-normal aok-inline-block)]
                   ([img :num 2920 :class (product-image) :w 265 :h 200])))) " "
                ([li :num 2921 :id edoc-10872 :class (feed-carousel-card)]
                 ([span :num 2922 :class (a-list-item)]
                  ([a :num 2923 :id edoc-10559 :class (a-link-normal aok-inline-block)]
                   ([img :num 2924 :class (product-image) :w 86 :h 200])))) " "
                ([li :num 2925 :id edoc-10873 :class (feed-carousel-card)]
                 ([span :num 2926 :class (a-list-item)]
                  ([a :num 2927 :id edoc-10560 :class (a-link-normal aok-inline-block)]
                   ([img :num 2928 :class (product-image) :w 270 :h (/ 407 3)])))) " "
                ([li :num 2929 :id edoc-10874 :class (feed-carousel-card)]
                 ([span :num 2930 :class (a-list-item)]
                  ([a :num 2931 :id edoc-10561 :class (a-link-normal aok-inline-block)]
                   ([img :num 2932 :class (product-image) :w 189 :h 200])))) " "
                ([li :num 2933 :id edoc-10875 :class (feed-carousel-card)]
                 ([span :num 2934 :class (a-list-item)]
                  ([a :num 2935 :id edoc-10562 :class (a-link-normal aok-inline-block)]
                   ([img :num 2936 :class (product-image) :w 166 :h 200])))) " "
                ([li :num 2937 :id edoc-10876 :class (feed-carousel-card)]
                 ([span :num 2938 :class (a-list-item)]
                  ([a :num 2939 :id edoc-10563 :class (a-link-normal aok-inline-block)]
                   ([img :num 2940 :class (product-image) :w 234 :h 200])))) " "
                ([li :num 2941 :id edoc-10877 :class (feed-carousel-card)]
                 ([span :num 2942 :class (a-list-item)]
                  ([a :num 2943 :id edoc-10564 :class (a-link-normal aok-inline-block)]
                   ([img :num 2944 :class (product-image) :w 146 :h 200])))) " "
                ([li :num 2945 :id edoc-10878 :class (feed-carousel-card)]
                 ([span :num 2946 :class (a-list-item)]
                  ([a :num 2947 :id edoc-10565 :class (a-link-normal aok-inline-block)]
                   ([img :num 2948 :class (product-image) :w 173 :h 200])))) " "
                ([li :num 2949 :id edoc-10879 :class (feed-carousel-card)]
                 ([span :num 2950 :class (a-list-item)]
                  ([a :num 2951 :id edoc-10566 :class (a-link-normal aok-inline-block)]
                   ([img :num 2952 :class (product-image) :w 270 :h (/ 406 3)])))) " "
                ([li :num 2953 :id edoc-10880 :class (feed-carousel-card)]
                 ([span :num 2954 :class (a-list-item)]
                  ([a :num 2955 :id edoc-10567 :class (a-link-normal aok-inline-block)]
                   ([img :num 2956 :class (product-image) :w 270 :h (/ 9529 60)])))) " "
                ([li :num 2957 :id edoc-10881 :class (feed-carousel-card)]
                 ([span :num 2958 :class (a-list-item)]
                  ([a :num 2959 :id edoc-10568 :class (a-link-normal aok-inline-block)]
                   ([img :num 2960 :class (product-image) :w 134 :h 200])))) " "
                ([li :num 2961 :id edoc-10882 :class (feed-carousel-card)]
                 ([span :num 2962 :class (a-list-item)]
                  ([a :num 2963 :id edoc-10569 :class (a-link-normal aok-inline-block)]
                   ([img :num 2964 :class (product-image) :w 181 :h 200])))) " "
                ([li :num 2965 :id edoc-10883 :class (feed-carousel-card)]
                 ([span :num 2966 :class (a-list-item)]
                  ([a :num 2967 :id edoc-10570 :class (a-link-normal aok-inline-block)]
                   ([img :num 2968 :class (product-image) :w 200 :h 200]))))) " "
               ([div :num 2969 :id edoc-10884 :class (spinner)]
                ([i :num 2970 :class (gw-spinner)])))
              ([a :num 2971 :id edoc-10571 :class (feed-carousel-control feed-left feed-control-disabled)]
               ([span :num 2972 :class (gw-icon feed-arrow)])) " "
              ([a :num 2973 :id edoc-10572 :class (feed-carousel-control feed-right)]
               ([span :num 2974 :class (gw-icon feed-arrow)])) " "
              ([span :num 2975 :class (feed-scrollbar)]
               ([span :num 2976 :class (feed-scrollbar-track)]
                ([span :num 2977 :id edoc-10885 :class (feed-scrollbar-thumb)]))))
             ([script :num 2978]) " "
             ([script :num 2979 :id r2AgerAaBy1lHJoNbR4wzA-btfCarouselContent]) " "
             ([script :num 2980]))
            ([script :num 2981]))) " ") " "
         ([div :num 2982 :id sidebar-bottom :class (a-fixed-right-grid-col sidebar a-col-right)]
          ([div :num 2983 :id desktop-bestsellers-1 :class (bestsellers celwidget csm-placement-id-df1e91c0-e808-470b-9796-54e09b10911a)]
           ([div :num 2984 :class (a-section a-text-left)]
            ([a :num 2985 :id dmimglnch_1530817684 :class (a-link-normal)]
             ([img :num 2986 :w 264 :h 350])))
           ([script :num 2987]))
          ([hr :num 2988 :class (slot-hr desktop-bestsellers-1-hr)])
          ([div :num 2989 :id desktop-bestsellers-2 :class (bestsellers celwidget csm-placement-id-68438753-0893-453b-b7db-c1a40c513ee4)]
           ([div :num 2990 :id M1Fc0G-tInHvW3ZC4I2-7g :class (cropped-image-link image-map shogun-widget card-lite ameyal-cropped-image-link)]
            ([script :num 2991])
            ([div :num 2992 :id edoc-10886 :class (cropped-image-map-size)]
             ([div :num 2993 :class (cropped-image-map-center-alignment)]
              ([span :num 2994 :id edoc-10887]
               ([a :num 2995 :id edoc-10573 :class (a-link-normal aok-inline-block)]
                ([img :num 2996 :w 264 :h 350]))
               ([div :num 2997 :class (a-section)])))))
           ([script :num 2998]))
          ([hr :num 2999 :class (slot-hr desktop-bestsellers-2-hr)])
          ([div :num 3000 :id desktop-sidekick-3 :class (sidekick celwidget csm-placement-id-8d9406c5-7929-4086-88a4-cb509a28a400)]
           ([div :num 3001 :id dz9NWK1VHH2VCr7-K1BE-g :class (a-section a-text-center scalable-image-link scalable-image-map card-lite ameyal-scalable-image-link)]
            ([script :num 3002]) " "
            ([a :num 3003 :id edoc-10574 :class (a-link-normal)]
             ([img :num 3004 :w 264 :h 350])))
           ([script :num 3005]))
          ([hr :num 3006 :class (slot-hr desktop-sidekick-3-hr)])
          ([div :num 3007 :id desktop-ad-btf :class (displayAd celwidget csm-placement-id-f3e4743a-4458-4fc6-bb15-2239646d46c6)]
           ([script :num 3008])
           ([style :num 3009])
           ([div :num 3010 :id ape_Gateway_right-7_desktop_placement :class (copilot-secure-display celwidget  text/x-dacx-safeframe)]
            ([iframe :num 3011 :id ape_Gateway_right-7_desktop_iframe :w 300 :h 250])
            ([div :num 3012 :id ape_Gateway_right-7_desktop_placement_Feedback]
             ([a :num 3013 :id edoc-10888 :class (a-declarative)]
              ([span :num 3014 :id ad-feedback-text-right-7] " Ad feedback "
               ([b :num 3015 :id ad-feedback-sprite-right-7])))
             ([script :num 3016])))
           ([script :num 3017]))) " "))) " "
      ([script :num 3018]) " "
      ([div :num 3019 :id a-popover-gw-asin-popover :class (a-popover-preload)]
       ([div :num 3020 :id gw-popover-wrapper]
        ([div :num 3021 :id gw-asin-popover]
         ([i :num 3022 :id gw-popover-close :class (gw-icon close-icon)])
         ([div :num 3023 :class (content)]
          ([a :num 3024 :class (imgblock)]
           ([img :num 3025 :id quicklook-product-image :class (product-image) :w 0 :h 0]))
          ([div :num 3026 :class (detailblock)]
           ([div :num 3027 :class (details)]
            ([div :num 3028 :class (byline a-color-tertiary)])
            ([a :num 3029 :class (title)])
            ([div :num 3030 :class (reviews)]
             ([a :num 3031]
              ([i :num 3032 :class (a-icon a-icon-star-medium)]
               ([span :num 3033 :id edoc-10001 :class (a-icon-alt)]))
              ([span :num 3034 :class (review-count a-color-tertiary)])))
            ([div :num 3035 :class (pricing)]
             ([span :num 3036 :class (price)])
             ([i :num 3037 :class (prime a-icon)])
             ([div :num 3038]
              ([span :num 3039 :class (ppu)])))
            ([span :num 3040 :class (dp-link)]
             ([span :num 3041 :id a-autoid-0 :class (a-button a-button-primary)]
              ([span :num 3042 :class (a-button-inner)]
               ([a :num 3043 :id a-autoid-0-announce :class (details-button a-button-text)])))))))
         ([div :num 3044 :class (loading)]
          ([i :num 3045 :class (gw-spinner)])))
        ([div :num 3046 :id sims-section]
         ([div :num 3047 :class (sims-wrapper)]
          ([div :num 3048 :class (sims-loading)]
           ([i :num 3049 :class (gw-loading-stripe)]))
          ([div :num 3050 :class (sims-header)]
           ([span :num 3051 :class (sims-header-text a-size-medium a-align-center a-color-tertiary)]))
          ([div :num 3052 :class (sims-container)]
           ([div :num 3053 :class (sims-details)])))))) " "
      ([span :num 3054 :id gw-quick-look-btn :class (a-button)]
       ([span :num 3055 :class (a-button-inner)]
        ([input :num 3056 :class (a-button-input) :w 0 :h 0 :type submit])
        ([span :num 3057 :id gw-quick-look-btn-announce :class (a-button-text)]))) " "
      ([script :num 3058])
      ([div :num 3059 :id SponsoredLinksGateway]
       ([script :num 3060]))
      ([script :num 3061]) " "
      ([script :num 3062]) " "
      ([script :num 3063]) " "
      ([script :num 3064])) " " " " " "
     ([script :num 3065]) " " " "
     ([div :num 3066 :id rhf :class (copilot-secure-display)]
      ([div :num 3067 :id edoc-10889 :class (rhf-frame)]
       ([br :num 3068])
       ([div :num 3069 :id rhf-container]
        ([div :num 3070 :id edoc-10666 :class (rhf-loading-outer)]
         ([table :num 3071 :class (rhf-loading-middle)]
          ([tbody :num 3072]
           ([tr :num 3073]
            ([td :num 3074 :class (rhf-loading-inner)]
             ([img :num 3075 :w 0 :h 0]))))))
        ([div :num 3076 :id rhf-context]
         ([script :num 3077])))
       ([noscript :num 3078])
       ([div :num 3079 :id rhf-error]
        ([div :num 3080 :class (rhf-border)]
         ([div :num 3081 :class (rhf-header)])
         ([div :num 3082 :class (rhf-footer)]
          ([div :num 3083 :class (rvi-container)]
           ([div :num 3084 :class (ybh-edit)]
            ([div :num 3085 :class (ybh-edit-arrow)])
            ([div :num 3086 :class (ybh-edit-link)]
             ([a :num 3087 :id edoc-10575])))
           ([span :num 3088 :class (no-rvi-message)])))))
       ([br :num 3089])))
     ([div :num 3090 :id navFooter :class (navLeftFooter nav-sprite-v1)]
      ([a :num 3091 :id navBackToTop]
       ([div :num 3092 :class (navFooterBackToTop)]
        ([span :num 3093 :class (navFooterBackToTopText)] "Back to top")))
      ([div :num 3094 :class (navFooterVerticalColumn navAccessibility)]
       ([div :num 3095 :id edoc-10890 :class (navFooterVerticalRow navAccessibility)]
        ([div :num 3096 :class (navFooterLinkCol navAccessibility)]
         ([div :num 3097 :class (navFooterColHead)] "Get to Know Us")
         ([ul :num 3098]
          ([li :num 3099 :class (nav_first)]
           ([a :num 3100 :id edoc-10576 :class (nav_a)] "Careers"))
          ([li :num 3101]
           ([a :num 3102 :id edoc-10577 :class (nav_a)] "Blog"))
          ([li :num 3103]
           ([a :num 3104 :id edoc-10578 :class (nav_a)] "About Amazon"))
          ([li :num 3105]
           ([a :num 3106 :id edoc-10579 :class (nav_a)] "Investor Relations"))
          ([li :num 3107 :class (nav_last)]
           ([a :num 3108 :id edoc-10580 :class (nav_a)] "Amazon Devices"))))
        ([div :num 3109 :class (navFooterColSpacerInner navAccessibility)])
        ([div :num 3110 :class (navFooterLinkCol navAccessibility)]
         ([div :num 3111 :class (navFooterColHead)] "Make Money with Us")
         ([ul :num 3112]
          ([li :num 3113 :class (nav_first)]
           ([a :num 3114 :id edoc-10581 :class (nav_a)] "Sell on Amazon"))
          ([li :num 3115]
           ([a :num 3116 :id edoc-10582 :class (nav_a)] "Sell Your Services on Amazon"))
          ([li :num 3117]
           ([a :num 3118 :id edoc-10583 :class (nav_a)] "Sell on Amazon Business"))
          ([li :num 3119]
           ([a :num 3120 :id edoc-10584 :class (nav_a)] "Sell Your Apps on Amazon"))
          ([li :num 3121]
           ([a :num 3122 :id edoc-10585 :class (nav_a)] "Become an Affiliate"))
          ([li :num 3123]
           ([a :num 3124 :id edoc-10586 :class (nav_a)] "Advertise Your Products"))
          ([li :num 3125]
           ([a :num 3126 :id edoc-10587 :class (nav_a)] "Self-Publish with Us"))
          ([li :num 3127 :class (nav_last nav_a_carat)]
           ([span :num 3128 :class (nav_a_carat)] "›")
           ([a :num 3129 :id edoc-10588 :class (nav_a)] "See all"))))
        ([div :num 3130 :class (navFooterColSpacerInner navAccessibility)])
        ([div :num 3131 :class (navFooterLinkCol navAccessibility)]
         ([div :num 3132 :class (navFooterColHead)] "Amazon Payment Products")
         ([ul :num 3133]
          ([li :num 3134 :class (nav_first)]
           ([a :num 3135 :id edoc-10589 :class (nav_a)] "Amazon Rewards Visa Signature Cards"))
          ([li :num 3136]
           ([a :num 3137 :id edoc-10590 :class (nav_a)] "Amazon.com Store Card"))
          ([li :num 3138]
           ([a :num 3139 :id edoc-10591 :class (nav_a)] "Amazon.com Corporate Credit Line"))
          ([li :num 3140]
           ([a :num 3141 :id edoc-10592 :class (nav_a)] "Shop with Points"))
          ([li :num 3142]
           ([a :num 3143 :id edoc-10593 :class (nav_a)] "Credit Card Marketplace"))
          ([li :num 3144]
           ([a :num 3145 :id edoc-10594 :class (nav_a)] "Reload Your Balance"))
          ([li :num 3146 :class (nav_last)]
           ([a :num 3147 :id edoc-10595 :class (nav_a)] "Amazon Currency Converter"))))
        ([div :num 3148 :class (navFooterColSpacerInner navAccessibility)])
        ([div :num 3149 :class (navFooterLinkCol navAccessibility)]
         ([div :num 3150 :class (navFooterColHead)] "Let Us Help You")
         ([ul :num 3151]
          ([li :num 3152 :class (nav_first)]
           ([a :num 3153 :id edoc-10596 :class (nav_a)] "Your Account"))
          ([li :num 3154]
           ([a :num 3155 :id edoc-10597 :class (nav_a)] "Your Orders"))
          ([li :num 3156]
           ([a :num 3157 :id edoc-10598 :class (nav_a)] "Shipping Rates & Policies"))
          ([li :num 3158]
           ([a :num 3159 :id edoc-10599 :class (nav_a)] "Amazon Prime"))
          ([li :num 3160]
           ([a :num 3161 :id edoc-10600 :class (nav_a)] "Returns & Replacements"))
          ([li :num 3162]
           ([a :num 3163 :id edoc-10601 :class (nav_a)] "Manage Your Content and Devices"))
          ([li :num 3164]
           ([a :num 3165 :id edoc-10602 :class (nav_a)] "Amazon Assistant"))
          ([li :num 3166 :class (nav_last)]
           ([a :num 3167 :id edoc-10603 :class (nav_a)] "Help"))))))
      ([div :num 3168 :class (nav-footer-line)])
      ([div :num 3169 :class (navFooterLine navFooterLinkLine navFooterPadItemLine)]
       ([span :num 3170]
        ([div :num 3171 :class (navFooterLine navFooterLogoLine)]
         ([a :num 3172 :id edoc-10604]
          ([div :num 3173 :class (nav-logo-base nav-sprite)]))))
       ([ul :num 3174])
       ([span :num 3175 :class (icp-container-desktop)]
        ([div :num 3176 :class (navFooterLine)]
         ([style :num 3177]) " "
         ([a :num 3178 :id icp-touch-link-language :class (icp-button a-declarative)]
          ([div :num 3179 :class (icp-nav-globe-img-2 icp-button-globe-2)])
          ([span :num 3180 :class (icp-color-base)] "English")
          ([span :num 3181 :class (nav-arrow icp-up-down-arrow)])) " "
         ([style :num 3182]) " "
         ([a :num 3183 :id icp-touch-link-country :class (icp-button a-declarative)]
          ([span :num 3184 :class (icp-flag-3 icp-flag-3-us)])
          ([span :num 3185 :class (icp-color-base)] "United States"))))
       ([ul :num 3186]))
      ([div :num 3187 :class (navFooterLine navFooterLinkLine navFooterDescLine)]
       ([table :num 3188 :class (navFooterMoreOnAmazon)]
        ([tbody :num 3189]
         ([tr :num 3190]
          ([td :num 3191 :class (navFooterDescItem)]
           ([a :num 3192 :id edoc-10605 :class (nav_a)] "Amazon Music"
            ([br :num 3193]) " "
            ([span :num 3194 :class (navFooterDescText)] "Stream millions"
             ([br :num 3195]) " of songs")))
          ([td :num 3196 :id edoc-10891 :class (navFooterDescSpacer)])
          ([td :num 3197 :class (navFooterDescItem)]
           ([a :num 3198 :id edoc-10606 :class (nav_a)] "Amazon Drive"
            ([br :num 3199]) " "
            ([span :num 3200 :class (navFooterDescText)] "Cloud storage"
             ([br :num 3201]) " from Amazon")))
          ([td :num 3202 :id edoc-10892 :class (navFooterDescSpacer)])
          ([td :num 3203 :class (navFooterDescItem)]
           ([a :num 3204 :id edoc-10607 :class (nav_a)] "6pm"
            ([br :num 3205]) " "
            ([span :num 3206 :class (navFooterDescText)] "Score deals"
             ([br :num 3207]) " on fashion brands")))
          ([td :num 3208 :id edoc-10893 :class (navFooterDescSpacer)])
          ([td :num 3209 :class (navFooterDescItem)]
           ([a :num 3210 :id edoc-10608 :class (nav_a)] "AbeBooks"
            ([br :num 3211]) " "
            ([span :num 3212 :class (navFooterDescText)] "Books, art"
             ([br :num 3213]) " & collectibles")))
          ([td :num 3214 :id edoc-10894 :class (navFooterDescSpacer)])
          ([td :num 3215 :class (navFooterDescItem)]
           ([a :num 3216 :id edoc-10609 :class (nav_a)] "ACX "
            ([br :num 3217]) " "
            ([span :num 3218 :class (navFooterDescText)] "Audiobook Publishing"
             ([br :num 3219]) " Made Easy")))
          ([td :num 3220 :id edoc-10895 :class (navFooterDescSpacer)])
          ([td :num 3221 :class (navFooterDescItem)]
           ([a :num 3222 :id edoc-10610 :class (nav_a)] "Alexa"
            ([br :num 3223]) " "
            ([span :num 3224 :class (navFooterDescText)] "Actionable Analytics"
             ([br :num 3225]) " for the Web")))
          ([td :num 3226 :id edoc-10896 :class (navFooterDescSpacer)])
          ([td :num 3227 :class (navFooterDescItem)]
           ([a :num 3228 :id edoc-10611 :class (nav_a)] "Amazon Business"
            ([br :num 3229]) " "
            ([span :num 3230 :class (navFooterDescText)] "Everything For"
             ([br :num 3231]) " Your Business"))))
         ([tr :num 3232]
          ([td :num 3233] " "))
         ([tr :num 3234]
          ([td :num 3235 :class (navFooterDescItem)]
           ([a :num 3236 :id edoc-10612 :class (nav_a)] "AmazonFresh"
            ([br :num 3237]) " "
            ([span :num 3238 :class (navFooterDescText)] "Groceries & More"
             ([br :num 3239]) " Right To Your Door")))
          ([td :num 3240 :id edoc-10897 :class (navFooterDescSpacer)])
          ([td :num 3241 :class (navFooterDescItem)]
           ([a :num 3242 :id edoc-10613 :class (nav_a)] "AmazonGlobal"
            ([br :num 3243]) " "
            ([span :num 3244 :class (navFooterDescText)] "Ship Orders"
             ([br :num 3245]) " Internationally")))
          ([td :num 3246 :id edoc-10898 :class (navFooterDescSpacer)])
          ([td :num 3247 :class (navFooterDescItem)]
           ([a :num 3248 :id edoc-10614 :class (nav_a)] "Home Services"
            ([br :num 3249]) " "
            ([span :num 3250 :class (navFooterDescText)] "Handpicked Pros"
             ([br :num 3251]) " Happiness Guarantee")))
          ([td :num 3252 :id edoc-10899 :class (navFooterDescSpacer)])
          ([td :num 3253 :class (navFooterDescItem)]
           ([a :num 3254 :id edoc-10615 :class (nav_a)] "Amazon Inspire"
            ([br :num 3255]) " "
            ([span :num 3256 :class (navFooterDescText)] "Digital Educational"
             ([br :num 3257]) " Resources")))
          ([td :num 3258 :id edoc-10900 :class (navFooterDescSpacer)])
          ([td :num 3259 :class (navFooterDescItem)]
           ([a :num 3260 :id edoc-10616 :class (nav_a)] "Amazon Rapids"
            ([br :num 3261]) " "
            ([span :num 3262 :class (navFooterDescText)] "Fun stories for"
             ([br :num 3263]) " kids on the go")))
          ([td :num 3264 :id edoc-10901 :class (navFooterDescSpacer)])
          ([td :num 3265 :class (navFooterDescItem)]
           ([a :num 3266 :id edoc-10617 :class (nav_a)] "Amazon Restaurants"
            ([br :num 3267]) " "
            ([span :num 3268 :class (navFooterDescText)] "Food delivery from"
             ([br :num 3269]) " local restaurants")))
          ([td :num 3270 :id edoc-10902 :class (navFooterDescSpacer)])
          ([td :num 3271 :class (navFooterDescItem)]
           ([a :num 3272 :id edoc-10618 :class (nav_a)] "Amazon Web Services"
            ([br :num 3273]) " "
            ([span :num 3274 :class (navFooterDescText)] "Scalable Cloud"
             ([br :num 3275]) " Computing Services"))))
         ([tr :num 3276]
          ([td :num 3277] " "))
         ([tr :num 3278]
          ([td :num 3279 :class (navFooterDescItem)]
           ([a :num 3280 :id edoc-10619 :class (nav_a)] "Audible"
            ([br :num 3281]) " "
            ([span :num 3282 :class (navFooterDescText)] "Download"
             ([br :num 3283]) " Audiobooks")))
          ([td :num 3284 :id edoc-10903 :class (navFooterDescSpacer)])
          ([td :num 3285 :class (navFooterDescItem)]
           ([a :num 3286 :id edoc-10620 :class (nav_a)] "AudiobookStand"
            ([br :num 3287]) " "
            ([span :num 3288 :class (navFooterDescText)] "Discount Audiobooks"
             ([br :num 3289]) " on Disc")))
          ([td :num 3290 :id edoc-10904 :class (navFooterDescSpacer)])
          ([td :num 3291 :class (navFooterDescItem)]
           ([a :num 3292 :id edoc-10621 :class (nav_a)] "Book Depository"
            ([br :num 3293]) " "
            ([span :num 3294 :class (navFooterDescText)] "Books With Free"
             ([br :num 3295]) " Delivery Worldwide")))
          ([td :num 3296 :id edoc-10905 :class (navFooterDescSpacer)])
          ([td :num 3297 :class (navFooterDescItem)]
           ([a :num 3298 :id edoc-10622 :class (nav_a)] "Box Office Mojo"
            ([br :num 3299]) " "
            ([span :num 3300 :class (navFooterDescText)] "Find Movie"
             ([br :num 3301]) " Box Office Data")))
          ([td :num 3302 :id edoc-10906 :class (navFooterDescSpacer)])
          ([td :num 3303 :class (navFooterDescItem)]
           ([a :num 3304 :id edoc-10623 :class (nav_a)] "ComiXology"
            ([br :num 3305]) " "
            ([span :num 3306 :class (navFooterDescText)] "Thousands of"
             ([br :num 3307]) " Digital Comics")))
          ([td :num 3308 :id edoc-10907 :class (navFooterDescSpacer)])
          ([td :num 3309 :class (navFooterDescItem)]
           ([a :num 3310 :id edoc-10624 :class (nav_a)] "CreateSpace"
            ([br :num 3311]) " "
            ([span :num 3312 :class (navFooterDescText)] "Indie Print Publishing"
             ([br :num 3313]) " Made Easy")))
          ([td :num 3314 :id edoc-10908 :class (navFooterDescSpacer)])
          ([td :num 3315 :class (navFooterDescItem)]
           ([a :num 3316 :id edoc-10625 :class (nav_a)] "DPReview"
            ([br :num 3317]) " "
            ([span :num 3318 :class (navFooterDescText)] "Digital"
             ([br :num 3319]) " Photography"))))
         ([tr :num 3320]
          ([td :num 3321] " "))
         ([tr :num 3322]
          ([td :num 3323 :class (navFooterDescItem)]
           ([a :num 3324 :id edoc-10626 :class (nav_a)] "East Dane"
            ([br :num 3325]) " "
            ([span :num 3326 :class (navFooterDescText)] "Designer Men's"
             ([br :num 3327]) " Fashion")))
          ([td :num 3328 :id edoc-10909 :class (navFooterDescSpacer)])
          ([td :num 3329 :class (navFooterDescItem)]
           ([a :num 3330 :id edoc-10627 :class (nav_a)] "Fabric"
            ([br :num 3331]) " "
            ([span :num 3332 :class (navFooterDescText)] "Sewing, Quilting"
             ([br :num 3333]) " & Knitting")))
          ([td :num 3334 :id edoc-10910 :class (navFooterDescSpacer)])
          ([td :num 3335 :class (navFooterDescItem)]
           ([a :num 3336 :id edoc-10628 :class (nav_a)] "Goodreads"
            ([br :num 3337]) " "
            ([span :num 3338 :class (navFooterDescText)] "Book reviews"
             ([br :num 3339]) " & recommendations")))
          ([td :num 3340 :id edoc-10911 :class (navFooterDescSpacer)])
          ([td :num 3341 :class (navFooterDescItem)]
           ([a :num 3342 :id edoc-10629 :class (nav_a)] "IMDb"
            ([br :num 3343]) " "
            ([span :num 3344 :class (navFooterDescText)] "Movies, TV"
             ([br :num 3345]) " & Celebrities")))
          ([td :num 3346 :id edoc-10912 :class (navFooterDescSpacer)])
          ([td :num 3347 :class (navFooterDescItem)]
           ([a :num 3348 :id edoc-10630 :class (nav_a)] "IMDbPro"
            ([br :num 3349]) " "
            ([span :num 3350 :class (navFooterDescText)] "Get Info Entertainment"
             ([br :num 3351]) " Professionals Need")))
          ([td :num 3352 :id edoc-10913 :class (navFooterDescSpacer)])
          ([td :num 3353 :class (navFooterDescItem)]
           ([a :num 3354 :id edoc-10631 :class (nav_a)] "Junglee.com"
            ([br :num 3355]) " "
            ([span :num 3356 :class (navFooterDescText)] "Shop Online"
             ([br :num 3357]) " in India")))
          ([td :num 3358 :id edoc-10914 :class (navFooterDescSpacer)])
          ([td :num 3359 :class (navFooterDescItem)]
           ([a :num 3360 :id edoc-10632 :class (nav_a)] "Kindle Direct Publishing"
            ([br :num 3361]) " "
            ([span :num 3362 :class (navFooterDescText)] "Indie Digital Publishing"
             ([br :num 3363]) " Made Easy "))))
         ([tr :num 3364]
          ([td :num 3365] " "))
         ([tr :num 3366]
          ([td :num 3367 :class (navFooterDescItem)]
           ([a :num 3368 :id edoc-10633 :class (nav_a)] " Prime Now"
            ([br :num 3369]) " "
            ([span :num 3370 :class (navFooterDescText)] "FREE 2-Hour Delivery"
             ([br :num 3371]) " on Everyday Items")))
          ([td :num 3372 :id edoc-10915 :class (navFooterDescSpacer)])
          ([td :num 3373 :class (navFooterDescItem)]
           ([a :num 3374 :id edoc-10634 :class (nav_a)] "Prime Photos"
            ([br :num 3375]) " "
            ([span :num 3376 :class (navFooterDescText)] "Unlimited Photo Storage"
             ([br :num 3377]) " Free With Prime")))
          ([td :num 3378 :id edoc-10916 :class (navFooterDescSpacer)])
          ([td :num 3379 :class (navFooterDescItem)]
           ([a :num 3380 :id edoc-10635 :class (nav_a)] "Prime Video Direct"
            ([br :num 3381]) " "
            ([span :num 3382 :class (navFooterDescText)] "Video Distribution"
             ([br :num 3383]) " Made Easy")))
          ([td :num 3384 :id edoc-10917 :class (navFooterDescSpacer)])
          ([td :num 3385 :class (navFooterDescItem)]
           ([a :num 3386 :id edoc-10636 :class (nav_a)] "Shopbop"
            ([br :num 3387]) " "
            ([span :num 3388 :class (navFooterDescText)] "Designer"
             ([br :num 3389]) " Fashion Brands")))
          ([td :num 3390 :id edoc-10918 :class (navFooterDescSpacer)])
          ([td :num 3391 :class (navFooterDescItem)]
           ([a :num 3392 :id edoc-10637 :class (nav_a)] "TenMarks.com"
            ([br :num 3393]) " "
            ([span :num 3394 :class (navFooterDescText)] "Math Activities"
             ([br :num 3395]) " for Kids & Schools")))
          ([td :num 3396 :id edoc-10919 :class (navFooterDescSpacer)])
          ([td :num 3397 :class (navFooterDescItem)]
           ([a :num 3398 :id edoc-10638 :class (nav_a)] "Amazon Warehouse"
            ([br :num 3399]) " "
            ([span :num 3400 :class (navFooterDescText)] "Great Deals on"
             ([br :num 3401]) " Quality Used Products ")))
          ([td :num 3402 :id edoc-10920 :class (navFooterDescSpacer)])
          ([td :num 3403 :class (navFooterDescItem)]
           ([a :num 3404 :id edoc-10639 :class (nav_a)] "Whole Foods Market"
            ([br :num 3405]) " "
            ([span :num 3406 :class (navFooterDescText)] "America’s Healthiest"
             ([br :num 3407]) " Grocery Store"))))
         ([tr :num 3408]
          ([td :num 3409] " "))
         ([tr :num 3410]
          ([td :num 3411 :class (navFooterDescItem)] " ")
          ([td :num 3412 :id edoc-10921 :class (navFooterDescSpacer)])
          ([td :num 3413 :class (navFooterDescItem)]
           ([a :num 3414 :id edoc-10640 :class (nav_a)] "Withoutabox"
            ([br :num 3415]) " "
            ([span :num 3416 :class (navFooterDescText)] "Submit to"
             ([br :num 3417]) " Film Festivals")))
          ([td :num 3418 :id edoc-10922 :class (navFooterDescSpacer)])
          ([td :num 3419 :class (navFooterDescItem)]
           ([a :num 3420 :id edoc-10641 :class (nav_a)] "Woot!"
            ([br :num 3421]) " "
            ([span :num 3422 :class (navFooterDescText)] "Deals and "
             ([br :num 3423]) " Shenanigans")))
          ([td :num 3424 :id edoc-10923 :class (navFooterDescSpacer)])
          ([td :num 3425 :class (navFooterDescItem)]
           ([a :num 3426 :id edoc-10642 :class (nav_a)] "Zappos"
            ([br :num 3427]) " "
            ([span :num 3428 :class (navFooterDescText)] "Shoes &"
             ([br :num 3429]) " Clothing")))
          ([td :num 3430 :id edoc-10924 :class (navFooterDescSpacer)])
          ([td :num 3431 :class (navFooterDescItem)]
           ([a :num 3432 :id edoc-10643 :class (nav_a)] "Souq.com"
            ([br :num 3433]) " "
            ([span :num 3434 :class (navFooterDescText)] "Shop Online in"
             ([br :num 3435]) " the Middle East")))
          ([td :num 3436 :id edoc-10925 :class (navFooterDescSpacer)])
          ([td :num 3437 :class (navFooterDescItem)]
           ([a :num 3438 :id edoc-10644 :class (nav_a)] "Subscribe with Amazon"
            ([br :num 3439]) " "
            ([span :num 3440 :class (navFooterDescText)] "Discover & try"
             ([br :num 3441]) " subscription services")))
          ([td :num 3442 :id edoc-10926 :class (navFooterDescSpacer)])
          ([td :num 3443 :class (navFooterDescItem)] " ")))))
      ([div :num 3444 :class (navFooterLine navFooterLinkLine navFooterPadItemLine navFooterCopyright)]
       ([ul :num 3445]
        ([li :num 3446 :class (nav_first)]
         ([a :num 3447 :id edoc-10645 :class (nav_a)] "Conditions of Use"))
        ([li :num 3448]
         ([a :num 3449 :id edoc-10646 :class (nav_a)] "Privacy Notice"))
        ([li :num 3450]
         ([a :num 3451 :id edoc-10647 :class (nav_a)] "Interest-Based Ads"))
        ([li :num 3452 :class (nav_last)] "© 1996-2018, Amazon.com, Inc. or its affiliates")))) " "
     ([div :num 3453 :id sis_pixel_r2]
      ([iframe :num 3454 :id DAsis :w 1 :h 1]))
     ([script :num 3455]) " " " "
     ([div :num 3456 :id apaypx]
      ([iframe :num 3457 :id apaypxframe :w 0 :h 0]))
     ([script :num 3458]) " "
     ([script :num 3459]) " "
     ([div :num 3460 :id be]
      ([form :num 3461]
       ([input :num 3462 :w 0 :h 0 :type hidden]))
      ([script :num 3463])) " "
     ([noscript :num 3464])) " "
    ([span :num 3465 :class (cleanslate TridactylStatusIndicator )] "normal")
    ([div :num 3466 :id a-popover-root])
    ([span :num 3467 :id edoc-10927 :class (a-declarative)])
    ([script :num 3468 :id s-suggestion])
    ([script :num 3469 :id suggestions-template])
    ([script :num 3470 :id s-recentSearch])
    ([script :num 3471 :id s-separator])
    ([script :num 3472 :id s-option])
    ([script :num 3473 :id s-minimal])
    ([script :num 3474 :id s-storeText])
    ([script :num 3475 :id s-nextSearch])
    ([script :num 3476 :id s-bia-list])
    ([script :num 3477 :id s-bia-view-more])
    ([script :num 3478 :id s-qu-suggestion]) " "
    ([object :num 3479 :id edoc-10928 :w 0 :h 0])
    ([object :num 3480 :id edoc-10929 :w 0 :h 0])
    ([object :num 3481 :id edoc-10930 :w 0 :h 0])
    ([object :num 3482 :id edoc-10931 :w 0 :h 0])
    ([object :num 3483 :id edoc-10932 :w 0 :h 0]) " "
    ([div :num 3484 :id edoc-10933])
    ([script :num 3485 :id s-suggestion])
    ([script :num 3486 :id suggestions-template])
    ([script :num 3487 :id s-recentSearch])
    ([script :num 3488 :id s-separator])
    ([script :num 3489 :id s-option])
    ([script :num 3490 :id s-minimal])
    ([script :num 3491 :id s-storeText])
    ([script :num 3492 :id s-nextSearch])
    ([script :num 3493 :id s-bia-list])
    ([script :num 3494 :id s-bia-view-more])
    ([script :num 3495 :id s-qu-suggestion]))))

(define-layout doc-1 (doc-1 doc-1)
 ([VIEW :w 1920]
  ([BLOCK :x 0 :y 0 :w 1908 :h (/ 78088 15) :elt 0]
   ([BLOCK :x 0 :y 0 :w 1908 :h (/ 78088 15) :elt 64]
    ([ANON]
     ([LINE]
      ([INLINE :x 0 :y 10 :w 304 :h 4 :elt 65])))
    ([BLOCK :x 0 :y 19 :w 1908 :h (/ 77518 15) :elt 66]
     ([ANON]
      ([LINE]
       ([INLINE :elt 79])))
     ([BLOCK :x 0 :y 19 :w 1908 :h 55 :elt 81]
      ([BLOCK :x 0 :y 19 :w 1908 :h 55 :elt 82]
       ([BLOCK :x 0 :y -10000 :w 1 :h 1 :elt 83]
        ([LINE]
         ([TEXT :x 0 :y -9998 :w 61 :h 15 :text "Interesting " :features exclusion-zone]))
        ([LINE]
         ([TEXT :x 0 :y -9979 :w 32 :h 15 :text "Finds " :features exclusion-zone]))
        ([LINE]
         ([TEXT :x 0 :y -9960 :w 48 :h 15 :text "Updated " :features exclusion-zone]))
        ([LINE]
         ([TEXT :x 0 :y -9941 :w 29 :h 15 :text "Daily" :features exclusion-zone])))))
     ([BLOCK :x 0 :y 74 :w 1908 :h 99 :elt 86]
      ([BLOCK :x 0 :y 74 :w 1908 :h 99 :elt 87]
       ([BLOCK :x 0 :y 74 :w 1908 :h 39 :elt 88]
        ([BLOCK :x 0 :y 74 :w 192 :h 39 :elt 89]
         ([BLOCK :x 0 :y 74 :w 192 :h 39 :elt 93]
          ([LINE]
           ([INLINE :x 27 :y 87 :w 97 :h 30 :elt 94]
            ([BLOCK :x 27 :y 87 :w 97 :h 30 :elt 95]
             ([LINE]
              ([TEXT :x -473 :y 79 :w 52 :h 16 :text "Amazon"]))))
           ([TEXT :x 124 :y 104 :w 0 :h 16 :text " "])
           ([BLOCK :x 92 :y 106 :w 45 :h 17 :elt 98]))))
        ([BLOCK :x 1508 :y 74 :w 400 :h 39 :elt 100]
         ([ANON]
          ([LINE]
           ([INLINE :elt 102])))
         ([BLOCK :x 1508 :y 83 :w 400 :h 39 :elt 103]
          ([BLOCK :x 1508 :y 83 :w 400 :h 39 :elt 104]
           ([LINE]
            ([INLINE :x 1508 :y 83 :w 400 :h 39 :elt 105])))))
        ([BLOCK :x 0 :y 74 :w 1908 :h 39 :elt 107]
         ([BLOCK :x 192 :y 74 :w 1316 :h 46 :elt 109]
          ([BLOCK :x 192 :y 85 :w 1291 :h 0 :elt 110])
          ([BLOCK :x 192 :y 85 :w 1291 :h 35 :elt 111]
           ([BLOCK :x 192 :y 85 :w 47 :h 35 :elt 112]
            ([BLOCK :x 192 :y 85 :w 47 :h 35 :elt 113]
             ([BLOCK :x 198 :y 87 :w 40 :h 33 :elt 114]
              ([BLOCK :x 203 :y 87 :w 14 :h 33 :elt 115]
               ([LINE]
                ([TEXT :x 203 :y 96.5 :w 14 :h 14 :text "All"])))
              ([BLOCK :x 222 :y 101 :w 8 :h 4 :elt 116]))
             ([BLOCK :x 193 :y 85 :w 221 :h 35 :elt 118]
              ([BLOCK :x 195 :y 86 :w 221 :h 16 :elt 119]
               ([LINE]
                ([TEXT :x 198 :y 86 :w 101 :h 16 :text "All Departments" :features exclusion-zone])))
              ([BLOCK :x 195 :y 102 :w 221 :h 16 :elt 120]
               ([LINE]
                ([TEXT :x 198 :y 102 :w 71 :h 16 :text "Alexa Skills"])))
              ([BLOCK :x 195 :y 118 :w 221 :h 16 :elt 121]
               ([LINE]
                ([TEXT :x 198 :y 118 :w 106 :h 16 :text "Amazon Devices"])))
              ([BLOCK :x 195 :y 134 :w 221 :h 16 :elt 122]
               ([LINE]
                ([TEXT :x 198 :y 134 :w 93 :h 16 :text "Amazon Fresh"])))
              ([BLOCK :x 195 :y 150 :w 221 :h 16 :elt 123]
               ([LINE]
                ([TEXT :x 198 :y 150 :w 128 :h 16 :text "Amazon Warehouse"])))
              ([BLOCK :x 195 :y 166 :w 221 :h 16 :elt 124]
               ([LINE]
                ([TEXT :x 198 :y 166 :w 69 :h 16 :text "Appliances"])))
              ([BLOCK :x 195 :y 182 :w 221 :h 16 :elt 125]
               ([LINE]
                ([TEXT :x 198 :y 182 :w 95 :h 16 :text "Apps & Games"])))
              ([BLOCK :x 195 :y 198 :w 221 :h 16 :elt 126]
               ([LINE]
                ([TEXT :x 198 :y 198 :w 134 :h 16 :text "Arts, Crafts & Sewing"])))
              ([BLOCK :x 195 :y 214 :w 221 :h 16 :elt 127]
               ([LINE]
                ([TEXT :x 198 :y 214 :w 201 :h 16 :text "Automotive Parts & Accessories"])))
              ([BLOCK :x 195 :y 230 :w 221 :h 16 :elt 128]
               ([LINE]
                ([TEXT :x 198 :y 230 :w 32 :h 16 :text "Baby"])))
              ([BLOCK :x 195 :y 246 :w 221 :h 16 :elt 129]
               ([LINE]
                ([TEXT :x 198 :y 246 :w 152 :h 16 :text "Beauty & Personal Care"])))
              ([BLOCK :x 195 :y 262 :w 221 :h 16 :elt 130]
               ([LINE]
                ([TEXT :x 198 :y 262 :w 39 :h 16 :text "Books"])))
              ([BLOCK :x 195 :y 278 :w 221 :h 16 :elt 131]
               ([LINE]
                ([TEXT :x 198 :y 278 :w 74 :h 16 :text "CDs & Vinyl"])))
              ([BLOCK :x 195 :y 294 :w 221 :h 16 :elt 132]
               ([LINE]
                ([TEXT :x 198 :y 294 :w 169 :h 16 :text "Cell Phones & Accessories"])))
              ([BLOCK :x 195 :y 310 :w 221 :h 16 :elt 133]
               ([LINE]
                ([TEXT :x 198 :y 310 :w 165 :h 16 :text "Clothing, Shoes & Jewelry"])))
              ([BLOCK :x 195 :y 326 :w 221 :h 16 :elt 134]
               ([LINE]
                ([TEXT :x 198 :y 326 :w 61 :h 16 :text " Women"])))
              ([BLOCK :x 195 :y 342 :w 221 :h 16 :elt 135]
               ([LINE]
                ([TEXT :x 198 :y 342 :w 40 :h 16 :text " Men"])))
              ([BLOCK :x 195 :y 358 :w 221 :h 16 :elt 136]
               ([LINE]
                ([TEXT :x 198 :y 358 :w 41 :h 16 :text " Girls"])))
              ([BLOCK :x 195 :y 374 :w 221 :h 16 :elt 137]
               ([LINE]
                ([TEXT :x 198 :y 374 :w 43 :h 16 :text " Boys"])))
              ([BLOCK :x 195 :y 390 :w 221 :h 16 :elt 138]
               ([LINE]
                ([TEXT :x 198 :y 390 :w 44 :h 16 :text " Baby"])))
              ([BLOCK :x 195 :y 406 :w 221 :h 16 :elt 139]
               ([LINE]
                ([TEXT :x 198 :y 406 :w 139 :h 16 :text "Collectibles & Fine Art"])))
              ([BLOCK :x 195 :y 422 :w 221 :h 16 :elt 140]
               ([LINE]
                ([TEXT :x 198 :y 422 :w 70 :h 16 :text "Computers"])))
              ([BLOCK :x 195 :y 438 :w 221 :h 16 :elt 141]
               ([LINE]
                ([TEXT :x 198 :y 438 :w 53 :h 16 :text "Courses"])))
              ([BLOCK :x 195 :y 454 :w 221 :h 16 :elt 142]
               ([LINE]
                ([TEXT :x 198 :y 454 :w 168 :h 16 :text "Credit and Payment Cards"])))
              ([BLOCK :x 195 :y 470 :w 221 :h 16 :elt 143]
               ([LINE]
                ([TEXT :x 198 :y 470 :w 80 :h 16 :text "Digital Music"])))
              ([BLOCK :x 195 :y 486 :w 221 :h 16 :elt 144]
               ([LINE]
                ([TEXT :x 198 :y 486 :w 69 :h 16 :text "Electronics"])))
              ([BLOCK :x 195 :y 502 :w 221 :h 16 :elt 145]
               ([LINE]
                ([TEXT :x 198 :y 502 :w 117 :h 16 :text "Garden & Outdoor"])))
              ([BLOCK :x 195 :y 518 :w 221 :h 16 :elt 146]
               ([LINE]
                ([TEXT :x 198 :y 518 :w 64 :h 16 :text "Gift Cards"])))
              ([BLOCK :x 195 :y 534 :w 221 :h 16 :elt 147]
               ([LINE]
                ([TEXT :x 198 :y 534 :w 161 :h 16 :text "Grocery & Gourmet Food"])))
              ([BLOCK :x 195 :y 550 :w 221 :h 16 :elt 148]
               ([LINE]
                ([TEXT :x 198 :y 550 :w 70 :h 16 :text "Handmade"])))
              ([BLOCK :x 195 :y 566 :w 221 :h 16 :elt 149]
               ([LINE]
                ([TEXT :x 198 :y 566 :w 201 :h 16 :text "Health, Household & Baby Care"])))
              ([BLOCK :x 195 :y 582 :w 221 :h 16 :elt 150]
               ([LINE]
                ([TEXT :x 198 :y 582 :w 170 :h 16 :text "Home & Business Services"])))
              ([BLOCK :x 195 :y 598 :w 221 :h 16 :elt 151]
               ([LINE]
                ([TEXT :x 198 :y 598 :w 102 :h 16 :text "Home & Kitchen"])))
              ([BLOCK :x 195 :y 614 :w 221 :h 16 :elt 152]
               ([LINE]
                ([TEXT :x 198 :y 614 :w 131 :h 16 :text "Industrial & Scientific"])))
              ([BLOCK :x 195 :y 630 :w 221 :h 16 :elt 153]
               ([LINE]
                ([TEXT :x 198 :y 630 :w 77 :h 16 :text "Kindle Store"])))
              ([BLOCK :x 195 :y 646 :w 221 :h 16 :elt 154]
               ([LINE]
                ([TEXT :x 198 :y 646 :w 148 :h 16 :text "Luggage & Travel Gear"])))
              ([BLOCK :x 195 :y 662 :w 221 :h 16 :elt 155]
               ([LINE]
                ([TEXT :x 198 :y 662 :w 91 :h 16 :text "Luxury Beauty"])))
              ([BLOCK :x 195 :y 678 :w 221 :h 16 :elt 156]
               ([LINE]
                ([TEXT :x 198 :y 678 :w 151 :h 16 :text "Magazine Subscriptions"])))
              ([BLOCK :x 195 :y 694 :w 221 :h 16 :elt 157]
               ([LINE]
                ([TEXT :x 198 :y 694 :w 80 :h 16 :text "Movies & TV"])))
              ([BLOCK :x 195 :y 710 :w 221 :h 16 :elt 158]
               ([LINE]
                ([TEXT :x 198 :y 710 :w 127 :h 16 :text "Musical Instruments"])))
              ([BLOCK :x 195 :y 726 :w 221 :h 16 :elt 159]
               ([LINE]
                ([TEXT :x 198 :y 726 :w 97 :h 16 :text "Office Products"])))
              ([BLOCK :x 195 :y 742 :w 221 :h 16 :elt 160]
               ([LINE]
                ([TEXT :x 198 :y 742 :w 79 :h 16 :text "Pet Supplies"])))
              ([BLOCK :x 195 :y 758 :w 221 :h 16 :elt 161]
               ([LINE]
                ([TEXT :x 198 :y 758 :w 154 :h 16 :text "Prime Exclusive Savings"])))
              ([BLOCK :x 195 :y 774 :w 221 :h 16 :elt 162]
               ([LINE]
                ([TEXT :x 198 :y 774 :w 82 :h 16 :text "Prime Pantry"])))
              ([BLOCK :x 195 :y 790 :w 221 :h 16 :elt 163]
               ([LINE]
                ([TEXT :x 198 :y 790 :w 77 :h 16 :text "Prime Video"])))
              ([BLOCK :x 195 :y 806 :w 221 :h 16 :elt 164]
               ([LINE]
                ([TEXT :x 198 :y 806 :w 56 :h 16 :text "Software"])))
              ([BLOCK :x 195 :y 822 :w 221 :h 16 :elt 165]
               ([LINE]
                ([TEXT :x 198 :y 822 :w 117 :h 16 :text "Sports & Outdoors"])))
              ([BLOCK :x 195 :y 838 :w 221 :h 16 :elt 166]
               ([LINE]
                ([TEXT :x 198 :y 838 :w 176 :h 16 :text "Tools & Home Improvement"])))
              ([BLOCK :x 195 :y 854 :w 221 :h 16 :elt 167]
               ([LINE]
                ([TEXT :x 198 :y 854 :w 92 :h 16 :text "Toys & Games"])))
              ([BLOCK :x 195 :y 870 :w 221 :h 16 :elt 168]
               ([LINE]
                ([TEXT :x 198 :y 870 :w 52 :h 16 :text "Vehicles"])))
              ([BLOCK :x 195 :y 886 :w 221 :h 16 :elt 169]
               ([LINE]
                ([TEXT :x 198 :y 886 :w 86 :h 16 :text "Video Games"]))))))
           ([BLOCK :x 1438 :y 85 :w 45 :h 35 :elt 170]
            ([BLOCK :x 1438 :y 85 :w 45 :h 35 :elt 171]
             ([BLOCK :x 1450 :y 92 :w 21 :h 21 :elt 172]
              ([LINE]
               ([TEXT :x 1201.5 :y 91 :w 18 :h 15 :text "Go"])))
             ([BLOCK :x 1438 :y 85 :w 45 :h 35 :elt 173])))
           ([BLOCK :x 239 :y 85 :w 1199 :h 35 :elt 174]
            ([BLOCK :x 239 :y 85 :w 1199 :h 35 :elt 175]
             ([BLOCK :x 239 :y 97 :w 55 :h 24 :elt 176]
              ([LINE]
               ([TEXT :x 239 :y 106.5 :w 45 :h 16 :text " Search "])))
             ([BLOCK :x 239 :y 86 :w 1199 :h 33 :elt 177]))
            ([BLOCK :x 239 :y 120 :w 1199 :h 0 :elt 178])))))
        ([BLOCK :x 0 :y 113 :w 1908 :h 0 :elt 180])
        ([BLOCK :x 0 :y 113 :w 1908 :h 0 :elt 1288])
        ([BLOCK :x 0 :y 113 :w 1908 :h 0 :elt 1291])
        ([BLOCK :x 0 :y 113 :w 1908 :h 0 :elt 1320]))
       ([BLOCK :x 0 :y 113 :w 1908 :h 60 :elt 1323]
        ([BLOCK :x 0 :y 118 :w 192 :h 55 :elt 1324]
         ([BLOCK :x 0 :y 120 :w 192 :h 50 :elt 1325]
          ([LINE]
           ([INLINE :elt 1326]
            ([BLOCK :x 11 :y 127 :w 129 :h 44 :elt 1327]
             ([BLOCK :x 13 :y 140 :w 22 :h 22 :elt 1328])
             ([BLOCK :x 38 :y 127 :w 102 :h 0 :elt 1329]
              ([BLOCK :x 38 :y 136 :w 97 :h 14 :elt 1330]
               ([LINE]
                ([TEXT :x 38 :y 136 :w 86 :h 14 :text "Deliver to Pavel"])))
              ([BLOCK :x 38 :y 150 :w 102 :h 20 :elt 1331]
               ([LINE]
                ([TEXT :x 38 :y 149.5 :w 91 :h 16 :text "Seattle 98122‌"])))))))))
        ([BLOCK :x 1436 :y 118 :w 472 :h 55 :elt 1334]
         ([BLOCK :x 1436 :y 120 :w 472 :h 50 :elt 1336]
          ([BLOCK :x 1469 :y 127 :w 51 :h 44 :elt 1337]
           ([LINE]
            ([INLINE :x 1462 :y 127 :w 54 :h 43 :elt 1338]
             ([BLOCK :x 1462 :y 136 :w 43 :h 14 :elt 1339]
              ([LINE]
               ([INLINE :x 1486 :y 151 :w 14 :h 14 :elt 1340]))
              ([LINE]
               ([TEXT :x 1476 :y 139 :w 3 :h 14 :text " "])
               ([INLINE :elt 1341]
                ([TEXT :x 1484 :y 136 :w 17 :h 14 :text "EN"]))))
             ([BLOCK :x 1455 :y 150 :w 30 :h 20 :elt 1342]
              ([LINE]
               ([TEXT :x 1455 :y 149.5 :w 8 :h 16 :text " "])
               ([INLINE :x 1506 :y 156.5 :w 8 :h 4 :elt 1343]))))
            ([TEXT :x 1516 :y 159 :w 3 :h 14 :text " "])
            ([INLINE :x 1519 :y 136 :w 1 :h 29 :elt 1344])))
          ([BLOCK :x 1522 :y 127 :w 141 :h 44 :elt 1345]
           ([BLOCK :x 1522 :y 136 :w 141 :h 14 :elt 1346]
            ([LINE]
             ([TEXT :x 1532 :y 136 :w 66 :h 14 :text "Hello, Pavel"])))
           ([BLOCK :x 1531 :y 127 :w 132 :h 43 :elt 1347]
            ([LINE]
             ([TEXT :x 1531 :y 149.5 :w 110 :h 16 :text "Account & Lists"])
             ([INLINE :x 1646 :y 156.5 :w 8 :h 4 :elt 1348]))))
          ([BLOCK :x -8564 :y 126 :w 1 :h 1 :elt 1351]
           ([LINE]
            ([TEXT :x -8564 :y 125 :w 19 :h 14 :text "Not " :features exclusion-zone]))
           ([LINE]
            ([TEXT :x -8564 :y 137 :w 38 :h 14 :text "Pavel? "]))
           ([LINE]
            ([TEXT :x -8564 :y 149 :w 25 :h 14 :text "Sign "]))
           ([LINE]
            ([TEXT :x -8564 :y 161 :w 19 :h 14 :text "Out "])))
          ([BLOCK :x 1665 :y 145 :w 64 :h 26 :elt 1352]
           ([BLOCK :x 1674 :y 150 :w 9 :h 0 :elt 1353])
           ([BLOCK :x 1674 :y 150 :w 55 :h 20 :elt 1354]
            ([LINE]
             ([TEXT :x 1674 :y 149.5 :w 46 :h 16 :text "Orders"]))))
          ([BLOCK :x 1731 :y 145 :w 69 :h 26 :elt 1355]
           ([BLOCK :x 1740 :y 150 :w 9 :h 0 :elt 1356])
           ([BLOCK :x 1740 :y 150 :w 60 :h 20 :elt 1357]
            ([LINE]
             ([TEXT :x 1740 :y 149.5 :w 38 :h 16 :text "Prime"])
             ([INLINE :x 1783 :y 156.5 :w 8 :h 4 :elt 1358]))))
          ([BLOCK :x 1802 :y 127 :w 98 :h 44 :elt 1359]
           ([BLOCK :x 1850 :y 136 :w 9 :h 14 :elt 1360])
           ([BLOCK :x 1850 :y 150 :w 50 :h 20 :elt 1361]
            ([LINE]
             ([TEXT :x 1850 :y 149.5 :w 28 :h 16 :text "Cart"])
             ([INLINE :x 1883 :y 156.5 :w 8 :h 4 :elt 1362])))
           ([BLOCK :x 1812 :y 138 :w 38 :h 26 :elt 1363])
           ([BLOCK :x 1825 :y 134 :w 19 :h 16 :elt 1364]
            ([LINE]
             ([TEXT :x 1830 :y 133.5 :w 9 :h 17 :text "0" :features exclusion-zone]))))))
        ([BLOCK :x 192 :y 118 :w 1244 :h 55 :elt 1366]
         ([BLOCK :x 192 :y 120 :w 142 :h 48 :elt 1367]
          ([BLOCK :x 193 :y 143 :w 125 :h 26 :elt 1368]
           ([BLOCK :x 193 :y 148 :w 25 :h 0 :elt 1369])
           ([BLOCK :x 193 :y 148 :w 125 :h 20 :elt 1370]
            ([LINE]
             ([TEXT :x 206 :y 147.5 :w 87 :h 16 :text "Departments"])
             ([INLINE :x 298 :y 154.5 :w 8 :h 4 :elt 1371])))))
         ([BLOCK :x 192 :y 118 :w 1244 :h 71 :elt 1372]
          ([BLOCK :x 334 :y 152 :w 1102 :h 37 :elt 1373]
           ([BLOCK :x 334 :y 152 :w 120 :h 17 :elt 1375]
            ([LINE]
             ([TEXT :x 334 :y 150.5 :w 98 :h 15 :text "Browsing History"])
             ([INLINE :x 437 :y 156.5 :w 8 :h 4 :elt 1376])))
           ([BLOCK :x 454 :y 152 :w 141 :h 12.5 :elt 1377]
            ([LINE]
             ([INLINE :x 463 :y 152 :w 123 :h 12.5 :elt 1378]
              ([LINE]
               ([INLINE :x 463 :y 152 :w 33 :h 12.5 :elt 1379]
                ([LINE]
                 ([TEXT :x 463 :y 150.5 :w 33 :h 15 :text "Pavel"])))
               ([TEXT :x 496 :y 150.5 :w 90 :h 15 :text "'s Amazon.com"])))))
           ([BLOCK :x 595 :y 152 :w 99 :h 12 :elt 1380]
            ([LINE]
             ([TEXT :x 604 :y 150.5 :w 81 :h 15 :text "Today's Deals"])))
           ([BLOCK :x 694 :y 152 :w 77 :h 12 :elt 1381]
            ([LINE]
             ([TEXT :x 703 :y 150.5 :w 59 :h 15 :text "Gift Cards"])))
           ([BLOCK :x 771 :y 152 :w 66 :h 12 :elt 1382]
            ([LINE]
             ([TEXT :x 780 :y 150.5 :w 48 :h 15 :text "Registry"])))
           ([BLOCK :x 837 :y 152 :w 40 :h 12 :elt 1383]
            ([LINE]
             ([TEXT :x 846 :y 150.5 :w 22 :h 15 :text "Sell"])))
           ([BLOCK :x 877 :y 152 :w 106 :h 12 :elt 1384]
            ([LINE]
             ([TEXT :x 886 :y 150.5 :w 88 :h 15 :text "Treasure Truck"])))
           ([BLOCK :x 983 :y 152 :w 44 :h 12 :elt 1385]
            ([LINE]
             ([TEXT :x 992 :y 150.5 :w 26 :h 15 :text "Help"])))
           ([BLOCK :x -10000 :y 152 :w 1 :h 1 :elt 1386]
            ([LINE]
             ([TEXT :x -10000 :y 151 :w 152 :h 14 :text "Disability Customer Support " :features exclusion-zone])))))))
       ([BLOCK :x 0 :y 173 :w 1908 :h 0 :elt 1388])))
     ([BLOCK :x 204 :y 173 :w 1500 :h (/ 61483 15) :elt 1401]
      ([ANON]
       ([LINE]
        ([INLINE :elt 1402])
        ([BLOCK :x 0 :y -500 :w 1 :h 1 :elt 1404]
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -498 :w 54 :h 15 :text "Welcome " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -479 :w 11 :h 15 :text "to " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -460 :w 81 :h 15 :text "Amazon.com. " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -441 :w 8 :h 15 :text "If " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -422 :w 21 :h 15 :text "you " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -403 :w 33 :h 15 :text "prefer " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -384 :w 7 :h 15 :text "a " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -365 :w 55 :h 15 :text "simplified " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -346 :w 52 :h 15 :text "shopping " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -327 :w 67 :h 15 :text "experience, " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -308 :w 15 :h 15 :text "try " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -289 :w 18 :h 15 :text "the " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -270 :w 38 :h 15 :text "mobile " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -251 :w 23 :h 15 :text "web " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -232 :w 42 :h 15 :text "version " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -213 :w 11 :h 15 :text "of " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -194 :w 48 :h 15 :text "Amazon " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -175 :w 11 :h 15 :text "at " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -156 :w 155 :h 15 :text "www.amazon.com/access. " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -137 :w 22 :h 15 :text "The " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -118 :w 38 :h 15 :text "mobile " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -99 :w 23 :h 15 :text "web " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -80 :w 42 :h 15 :text "version " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -61 :w 10 :h 15 :text "is " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -42 :w 38 :h 15 :text "similar " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -23 :w 11 :h 15 :text "to " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y -4 :w 18 :h 15 :text "the " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 15 :w 38 :h 15 :text "mobile " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 34 :w 25 :h 15 :text "app. " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 53 :w 27 :h 15 :text "Stay " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 72 :w 14 :h 15 :text "on " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 91 :w 77 :h 15 :text "Amazon.com " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 110 :w 15 :h 15 :text "for " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 129 :w 42 :h 15 :text "access " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 148 :w 11 :h 15 :text "to " :features exclusion-zone])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 167 :w 13 :h 15 :text "all "])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 186 :w 18 :h 15 :text "the "])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 205 :w 47 :h 15 :text "features "])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 224 :w 11 :h 15 :text "of "])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 243 :w 18 :h 15 :text "the "])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 262 :w 28 :h 15 :text "main "])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 281 :w 48 :h 15 :text "Amazon "])))
         ([LINE]
          ([INLINE :elt 1405]
           ([TEXT :x 0 :y 300 :w 48 :h 15 :text "website."]))))))
      ([BLOCK :x 204 :y 173 :w 1500 :h 300 :elt 1406]
       ([BLOCK :x 204 :y 173 :w 1500 :h 300 :elt 1408]
        ([BLOCK :x 204 :y 173 :w 1500 :h 300 :elt 1409]
         ([BLOCK :x 204 :y 173 :w 1500 :h 300 :elt 1411]
          ([BLOCK :x 204 :y 173 :w 1500 :h 300 :elt 1412]
           ([BLOCK :x 204 :y 173 :w 80 :h 300 :elt 1413]
            ([BLOCK :x 204 :y 173 :w 80 :h 300 :elt 1414]
             ([BLOCK :x 227 :y 297 :w 34 :h 52 :elt 1415]
              ([BLOCK :x -9772 :y 297 :w 1 :h 1 :elt 1416]
               ([LINE]
                ([TEXT :x -9772 :y 297 :w 6 :h 1 :text "Previous "]))
               ([LINE]
                ([TEXT :x -9772 :y 298 :w 4 :h 1 :text "page"]))))))
           ([BLOCK :x 204 :y 173 :w 1500 :h 300 :elt 1417]
            ([BLOCK :x 204 :y 173 :w 1500 :h 300 :elt 1418]
             ([BLOCK :x -4296 :y 173 :w 10500 :h 300 :elt 1419]
              ([LINE]
               ([INLINE :x -4296 :y 173 :w 1500 :h 300 :elt 1420]
                ([BLOCK :x -4296 :y 173 :w 1500 :h 300 :elt 1421]
                 ([BLOCK :x -4296 :y 173 :w 1500 :h 300 :elt 1422]
                  ([BLOCK :x -4296 :y 173 :w 1500 :h 300 :elt 1423]
                   ([BLOCK :x -7296 :y 173 :w 7500 :h 300 :elt 1424]
                    ([LINE]
                     ([INLINE :x -4296 :y 173 :w 1500 :h 300 :elt 1425]
                      ([ANON]
                       ([LINE]
                        ([INLINE :x -4296 :y 173 :w 1500 :h 300 :elt 1426]
                         ([LINE]
                          ([INLINE :x -4296 :y 173 :w 1500 :h 300 :elt 1427])))))
                      ([BLOCK :x -4296 :y 473 :w 1500 :h 0 :elt 1428]))))))))
               ([INLINE :x -2796 :y 173 :w 1500 :h 300 :elt 1429]
                ([BLOCK :x -2796 :y 173 :w 1500 :h 300 :elt 1430]
                 ([BLOCK :x -2796 :y 173 :w 1500 :h 300 :elt 1431]
                  ([BLOCK :x -2796 :y 173 :w 1500 :h 300 :elt 1432]
                   ([BLOCK :x -5796 :y 173 :w 7500 :h 300 :elt 1433]
                    ([LINE]
                     ([INLINE :x -2796 :y 173 :w 1500 :h 300 :elt 1434]
                      ([ANON]
                       ([LINE]
                        ([INLINE :x -2796 :y 173 :w 1500 :h 300 :elt 1435]
                         ([LINE]
                          ([INLINE :x -2796 :y 173 :w 1500 :h 300 :elt 1436])))))
                      ([BLOCK :x -2796 :y 473 :w 1500 :h 0 :elt 1437]))))))))
               ([INLINE :x -1296 :y 173 :w 1500 :h 300 :elt 1438]
                ([BLOCK :x -1296 :y 173 :w 1500 :h 300 :elt 1439]
                 ([BLOCK :x -1296 :y 173 :w 1500 :h 300 :elt 1440]
                  ([BLOCK :x -1296 :y 173 :w 1500 :h 300 :elt 1442]
                   ([BLOCK :x -4296 :y 173 :w 7500 :h 300 :elt 1443]
                    ([LINE]
                     ([INLINE :x -1296 :y 173 :w 1500 :h 300 :elt 1444]
                      ([ANON]
                       ([LINE]
                        ([INLINE :x -1296 :y 173 :w 1500 :h 300 :elt 1445]
                         ([LINE]
                          ([INLINE :x -1296 :y 173 :w 1500 :h 300 :elt 1446])))))
                      ([BLOCK :x -1296 :y 473 :w 1500 :h 0 :elt 1447]))))))))
               ([INLINE :x 204 :y 173 :w 1500 :h 300 :elt 1449]
                ([BLOCK :x 204 :y 173 :w 1500 :h 300 :elt 1450]
                 ([BLOCK :x 204 :y 173 :w 1500 :h 300 :elt 1451]
                  ([BLOCK :x 204 :y 173 :w 1500 :h 300 :elt 1452]
                   ([BLOCK :x -2796 :y 173 :w 7500 :h 300 :elt 1453]
                    ([LINE]
                     ([INLINE :x 204 :y 173 :w 1500 :h 300 :elt 1454]
                      ([ANON]
                       ([LINE]
                        ([INLINE :x 204 :y 173 :w 1500 :h 300 :elt 1455]
                         ([LINE]
                          ([INLINE :x 204 :y 173 :w 1500 :h 300 :elt 1456])))))
                      ([BLOCK :x 204 :y 473 :w 1500 :h 0 :elt 1457]))))))))
               ([INLINE :x 1704 :y 173 :w 1500 :h 300 :elt 1458]
                ([BLOCK :x 1704 :y 173 :w 1500 :h 300 :elt 1459]
                 ([BLOCK :x 1704 :y 173 :w 1500 :h 300 :elt 1460]
                  ([BLOCK :x 1704 :y 173 :w 1500 :h 300 :elt 1461]
                   ([BLOCK :x -1296 :y 173 :w 7500 :h 300 :elt 1462]
                    ([LINE]
                     ([INLINE :x 1704 :y 173 :w 1500 :h 300 :elt 1463]
                      ([ANON]
                       ([LINE]
                        ([INLINE :x 1704 :y 173 :w 1500 :h 300 :elt 1464]
                         ([LINE]
                          ([INLINE :x 1704 :y 173 :w 1500 :h 300 :elt 1465])))))
                      ([BLOCK :x 1704 :y 473 :w 1500 :h 0 :elt 1466]))))))))
               ([INLINE :x 3204 :y 173 :w 1500 :h 300 :elt 1467]
                ([BLOCK :x 3204 :y 173 :w 1500 :h 300 :elt 1468]
                 ([BLOCK :x 3204 :y 173 :w 1500 :h 300 :elt 1469]
                  ([BLOCK :x 3204 :y 173 :w 1500 :h 300 :elt 1470]
                   ([BLOCK :x 204 :y 173 :w 7500 :h 300 :elt 1471]
                    ([LINE]
                     ([INLINE :x 3204 :y 173 :w 1500 :h 300 :elt 1472]
                      ([ANON]
                       ([LINE]
                        ([INLINE :x 3204 :y 173 :w 1500 :h 300 :elt 1473]
                         ([LINE]
                          ([INLINE :x 3204 :y 173 :w 1500 :h 300 :elt 1474])))))
                      ([BLOCK :x 3204 :y 473 :w 1500 :h 0 :elt 1475]))))))))
               ([INLINE :x 4704 :y 173 :w 1500 :h 300 :elt 1476]
                ([BLOCK :x 4704 :y 173 :w 1500 :h 300 :elt 1477]
                 ([BLOCK :x 4704 :y 173 :w 1500 :h 300 :elt 1478]
                  ([BLOCK :x 4704 :y 173 :w 1500 :h 300 :elt 1479]
                   ([BLOCK :x 1704 :y 173 :w 7500 :h 300 :elt 1480]
                    ([LINE]
                     ([INLINE :x 4704 :y 173 :w 1500 :h 300 :elt 1481]
                      ([ANON]
                       ([LINE]
                        ([INLINE :x 4704 :y 173 :w 1500 :h 300 :elt 1482]
                         ([LINE]
                          ([INLINE :x 4704 :y 173 :w 1500 :h 300 :elt 1483])))))
                      ([BLOCK :x 4704 :y 473 :w 1500 :h 0 :elt 1484]))))))))))))
           ([BLOCK :x 1624 :y 173 :w 80 :h 300 :elt 1485]
            ([BLOCK :x 1624 :y 173 :w 80 :h 300 :elt 1486]
             ([BLOCK :x 1647 :y 297 :w 34 :h 52 :elt 1487]
              ([BLOCK :x -8352 :y 297 :w 1 :h 1 :elt 1488]
               ([LINE]
                ([TEXT :x -8352 :y 297 :w 3 :h 1 :text "Next "]))
               ([LINE]
                ([TEXT :x -8352 :y 298 :w 4 :h 1 :text "page"])))))))))))
      ([BLOCK :x 204 :y 473 :w 1500 :h 300 :elt 1491]
       ([BLOCK :x 204 :y 473 :w 1500 :h 300 :elt 1493]
        ([BLOCK :x 204 :y 473 :w 1500 :h 300 :elt 1494]
         ([BLOCK :x 208 :y 473 :w 1486 :h 300 :elt 1495]
          ([BLOCK :x 208 :y 742.7 :w 252 :h 31.3 :elt 1496]
           ([LINE]
            ([TEXT :x 208 :y (/ 14897 20) :w 252 :h 23 :text " Your Amazon Dashboard "])))
          ([ANON]
           ([LINE]
            ([INLINE :x 208 :y 473 :w 1996 :h 300 :elt 1497]
             ([LINE]
              ([INLINE :x 214 :y 483 :w 240 :h 280 :elt 1498]
               ([BLOCK :x 214 :y 483 :w 240 :h 216 :elt 1500]
                ([ANON]
                 ([LINE]
                  ([INLINE :x 229 :y 495 :w 224 :h 45 :elt 1501]
                   ([LINE]
                    ([INLINE :x 229 :y 495 :w 45 :h 45 :elt 1502]
                     ([LINE]
                      ([INLINE :elt 1503]
                       ([INLINE :x 229 :y 495 :w 45 :h 45 :elt 1504])
                       ([TEXT :x 274 :y 497 :w 0 :h 15 :text " "]))))
                    ([TEXT :x 274 :y 497 :w 4 :h 15 :text " "])
                    ([INLINE :x 278 :y 495 :w 175 :h 45 :elt 1505]
                     ([BLOCK :x 293 :y 495 :w 160 :h 24 :elt 1506]
                      ([LINE]
                       ([TEXT :x 293 :y 496.5 :w 72 :h 20 :text "Hi, Pavel"])))
                     ([BLOCK :x 293 :y 519 :w 160 :h 23 :elt 1507]
                      ([LINE]
                       ([TEXT :x 293 :y 523 :w 149 :h 15 :text "CUSTOMER SINCE 2011"]))))))))
                ([BLOCK :x 229 :y 555 :w 45 :h 0 :elt 1508])
                ([BLOCK :x 229 :y 555 :w 210 :h 19 :elt 1509]
                 ([LINE]
                  ([TEXT :x 229 :y 557 :w 96 :h 15 :text "YOUR ORDERS"])))
                ([ANON]
                 ([LINE]
                  ([INLINE :elt 1510]
                   ([TEXT :x 229 :y 576 :w 80 :h 15 :text "1 recent order"]))))
                ([BLOCK :x 229 :y 608 :w 45 :h 0 :elt 1511])
                ([BLOCK :x 229 :y 608 :w 210 :h 19 :elt 1512]
                 ([LINE]
                  ([TEXT :x 229 :y 610 :w 179 :h 15 :text "TOP CATEGORIES FOR YOU"])))
                ([BLOCK :x 229 :y 627 :w 210 :h 19 :elt 1513]
                 ([BLOCK :x 229 :y 627 :w 214 :h 19 :elt 1514]
                  ([LINE]
                   ([TEXT :x 229 :y 629 :w 115 :h 15 :text "Health & Household"]))))
                ([BLOCK :x 229 :y 646 :w 210 :h 19 :elt 1515]
                 ([BLOCK :x 229 :y 646 :w 214 :h 19 :elt 1516]
                  ([LINE]
                   ([TEXT :x 229 :y 648 :w 159 :h 15 :text "Cell Phones & Accessories"]))))
                ([BLOCK :x 229 :y 665 :w 210 :h 19 :elt 1517]
                 ([BLOCK :x 229 :y 665 :w 214 :h 19 :elt 1518]
                  ([LINE]
                   ([TEXT :x 229 :y 667 :w 65 :h 15 :text "Electronics"]))))))
              ([TEXT :x 454 :y 475 :w 4 :h 15 :text " "])
              ([INLINE :x 464 :y 483 :w 240 :h 280 :elt 1519]
               ([BLOCK :x 464 :y 483 :w 240 :h 280 :elt 1521]
                ([BLOCK :x 479 :y 498 :w 210 :h 19 :elt 1522]
                 ([LINE]
                  ([INLINE :elt 1523]
                   ([TEXT :x 479 :y 494 :w 76 :h 27 :text "PRIME"]))))
                ([BLOCK :x 479 :y 522 :w 210 :h 5 :elt 1524])
                ([BLOCK :x 479 :y 537 :w 210 :h 38 :elt 1525]
                 ([BLOCK :x 479 :y 537 :w 210 :h 38 :elt 1526]
                  ([LINE]
                   ([TEXT :x 479 :y 538 :w 178 :h 17 :text "Prime Day starts July 16 at "]))
                  ([LINE]
                   ([TEXT :x 479 :y 557 :w 137 :h 17 :text "3pm ET. Learn more."]))))
                ([ANON]
                 ([LINE]
                  ([INLINE :elt 1527]
                   ([INLINE :x 479 :y 590 :w 210 :h 150 :elt 1528])
                   ([TEXT :x 689 :y 577 :w 0 :h 15 :text " "]))))))
              ([TEXT :x 704 :y 475 :w 4 :h 15 :text " "])
              ([INLINE :x 714 :y 483 :w 240 :h 280 :elt 1531]
               ([BLOCK :x 714 :y 483 :w 240 :h 280 :elt 1533]
                ([BLOCK :x 729 :y 498 :w 210 :h 19 :elt 1534]
                 ([LINE]
                  ([INLINE :elt 1535]
                   ([TEXT :x 729 :y 494 :w 81 :h 27 :text "FRESH"]))))
                ([BLOCK :x 729 :y 522 :w 210 :h 5 :elt 1536])
                ([BLOCK :x 729 :y 537 :w 210 :h 38 :elt 1537]
                 ([BLOCK :x 729 :y 537 :w 210 :h 38 :elt 1538]
                  ([LINE]
                   ([TEXT :x 729 :y 538 :w 187 :h 17 :text "Start your FREE trial: $25 off "]))
                  ([LINE]
                   ([TEXT :x 729 :y 557 :w 95 :h 17 :text "your first order"]))))
                ([ANON]
                 ([LINE]
                  ([INLINE :elt 1539]
                   ([INLINE :x 729 :y 590 :w 210 :h 150 :elt 1540])
                   ([TEXT :x 939 :y 577 :w 0 :h 15 :text " "]))))))
              ([TEXT :x 954 :y 475 :w 4 :h 15 :text " "])
              ([INLINE :x 964 :y 483 :w 240 :h 280 :elt 1543]
               ([BLOCK :x 964 :y 483 :w 240 :h 280 :elt 1544]
                ([BLOCK :x 979 :y 498 :w 210 :h 19 :elt 1545]
                 ([LINE]
                  ([INLINE :elt 1546]
                   ([TEXT :x 979 :y 494 :w 75 :h 27 :text "VIDEO"]))))
                ([BLOCK :x 979 :y 522 :w 210 :h 5 :elt 1547])
                ([BLOCK :x 979 :y 537 :w 210 :h 36 :elt 1548]
                 ([BLOCK :x 979 :y 537 :w 210 :h 19 :elt 1549]
                  ([LINE]
                   ([TEXT :x 979 :y 538 :w 154 :h 17 :text "Recommended for you:"])))
                 ([BLOCK :x 979 :y 554 :w 210 :h 19 :elt 1550]
                  ([LINE]
                   ([TEXT :x 979 :y 555 :w 121 :h 17 :text "Goliath - Season 1"]))))
                ([ANON]
                 ([LINE]
                  ([INLINE :x 979 :y 573 :w 200 :h 170 :elt 1551]
                   ([LINE]
                    ([INLINE :elt 1552]
                     ([INLINE :x 979 :y 588 :w 200 :h 150 :elt 1553])
                     ([TEXT :x 1179 :y 575 :w 0 :h 15 :text " "]))))
                  ([TEXT :x 1179 :y 575 :w 0 :h 15 :text " "])))))
              ([TEXT :x 1204 :y 475 :w 4 :h 15 :text " "])
              ([INLINE :x 1214 :y 483 :w 240 :h 280 :elt 1556]
               ([BLOCK :x 1214 :y 483 :w 240 :h 280 :elt 1557]
                ([BLOCK :x 1229 :y 498 :w 210 :h 19 :elt 1558]
                 ([LINE]
                  ([INLINE :elt 1559]
                   ([TEXT :x 1229 :y 494 :w 77 :h 27 :text "MUSIC"]))))
                ([BLOCK :x 1229 :y 522 :w 210 :h 5 :elt 1560])
                ([BLOCK :x 1229 :y 537 :w 210 :h 36 :elt 1561]
                 ([BLOCK :x 1229 :y 537 :w 210 :h 19 :elt 1562]
                  ([LINE]
                   ([TEXT :x 1229 :y 538 :w 154 :h 17 :text "Recommended for you:"])))
                 ([BLOCK :x 1229 :y 554 :w 210 :h 19 :elt 1563]
                  ([LINE]
                   ([TEXT :x 1229 :y 555 :w 149 :h 17 :text "Wanted! - The Outlaws"]))))
                ([ANON]
                 ([LINE]
                  ([INLINE :x 1229 :y 573 :w 145 :h 170 :elt 1564]
                   ([LINE]
                    ([INLINE :elt 1565]
                     ([INLINE :x 1229 :y 588 :w 145 :h 150 :elt 1566])
                     ([TEXT :x 1374 :y 575 :w 0 :h 15 :text " "]))))
                  ([TEXT :x 1374 :y 575 :w 0 :h 15 :text " "])))))
              ([TEXT :x 1454 :y 475 :w 4 :h 15 :text " "])
              ([INLINE :x 1464 :y 483 :w 240 :h 280 :elt 1569]
               ([BLOCK :x 1464 :y 483 :w 240 :h 280 :elt 1571]
                ([BLOCK :x 1479 :y 498 :w 210 :h 19 :elt 1572]
                 ([LINE]
                  ([INLINE :elt 1573]
                   ([TEXT :x 1479 :y 494 :w 151 :h 27 :text "MEET ALEXA"]))))
                ([BLOCK :x 1479 :y 522 :w 210 :h 5 :elt 1574])
                ([BLOCK :x 1479 :y 537 :w 210 :h 36 :elt 1575]
                 ([BLOCK :x 1479 :y 537 :w 210 :h 19 :elt 1576]
                  ([LINE]
                   ([TEXT :x 1479 :y 538 :w 186 :h 17 :text "Voice control your world with"])))
                 ([BLOCK :x 1479 :y 554 :w 210 :h 19 :elt 1577]
                  ([LINE]
                   ([TEXT :x 1479 :y 555 :w 144 :h 17 :text "Echo & Alexa devices"]))))
                ([ANON]
                 ([LINE]
                  ([INLINE :elt 1578]
                   ([INLINE :x 1479 :y 588 :w 210 :h 150 :elt 1579])
                   ([TEXT :x 1689 :y 575 :w 0 :h 15 :text " "]))))))
              ([TEXT :x 1704 :y 475 :w 4 :h 15 :text " "])
              ([INLINE :x 1714 :y 483 :w 240 :h 280 :elt 1582]
               ([BLOCK :x 1714 :y 483 :w 240 :h 280 :elt 1584]
                ([BLOCK :x 1729 :y 498 :w 210 :h 19 :elt 1585]
                 ([LINE]
                  ([INLINE :elt 1586]
                   ([TEXT :x 1729 :y 494 :w 102 :h 27 :text "AUDIBLE"]))))
                ([BLOCK :x 1729 :y 522 :w 210 :h 5 :elt 1587])
                ([BLOCK :x 1729 :y 537 :w 210 :h 62 :elt 1588]
                 ([BLOCK :x 1729 :y 537 :w 210 :h 19 :elt 1589]
                  ([LINE]
                   ([TEXT :x 1729 :y 538 :w 187 :h 17 :text "Get any 2 audiobooks FREE"])))
                 ([MAGIC :x 1729 :y 561 :w 210 :h 38 :elt 1590]
                  ([TEXT :x 1729 :y 562 :w 184 :h 17 :text "Start with one we think you'll "])
                  ([TEXT :x 1729 :y 581 :w 31 :h 17 :text "love:"])))
                ([ANON]
                 ([LINE]
                  ([INLINE :elt 1591]
                   ([INLINE :x 1729 :y 609 :w 130 :h 130 :elt 1592])
                   ([TEXT :x 1859 :y 601 :w 0 :h 15 :text " "]))))))
              ([TEXT :x 1954 :y 475 :w 4 :h 15 :text " "])
              ([INLINE :x 1964 :y 483 :w 240 :h 280 :elt 1593]
               ([BLOCK :x 1964 :y 483 :w 240 :h 280 :elt 1595]
                ([BLOCK :x 1979 :y 498 :w 210 :h 19 :elt 1596]
                 ([LINE]
                  ([INLINE :elt 1597]
                   ([TEXT :x 1979 :y 494 :w 183 :h 27 :text "RECENT VIEWS"]))))
                ([BLOCK :x 1979 :y 522 :w 210 :h 5 :elt 1598])
                ([ANON]
                 ([LINE]
                  ([INLINE :elt 1599]
                   ([TEXT :x 1979 :y 538 :w 176 :h 17 :text "View your browsing history"]))))
                ([BLOCK :x 1979 :y 562 :w 210 :h 110 :elt 1600]
                 ([LINE]
                  ([INLINE :elt 1601]
                   ([INLINE :x 1979 :y 562 :w 210 :h 110 :elt 1602])
                   ([TEXT :x 2189 :y 564 :w 0 :h 15 :text " "]))))
                ([BLOCK :x 1979 :y 677 :w 210 :h 80 :elt 1603]
                 ([LINE]
                  ([INLINE :x 1979 :y 677 :w 70 :h 75 :elt 1604]
                   ([BLOCK :x 1979 :y 682 :w 70 :h 70 :elt 1605]
                    ([LINE]
                     ([INLINE :elt 1606]
                      ([INLINE :x 1979 :y 682 :w 70 :h 70 :elt 1607])
                      ([TEXT :x 2049 :y 684 :w 0 :h 15 :text " "])))))
                  ([TEXT :x 2049 :y 740 :w 4 :h 15 :text " "])
                  ([INLINE :x 2053 :y 677 :w 70 :h 75 :elt 1608]
                   ([BLOCK :x 2053 :y 682 :w 70 :h 70 :elt 1609]
                    ([LINE]
                     ([INLINE :elt 1610]
                      ([INLINE :x 2053 :y 682 :w 70 :h 70 :elt 1611])
                      ([TEXT :x 2123 :y 684 :w 0 :h 15 :text " "])))))
                  ([TEXT :x 2123 :y 740 :w 4 :h 15 :text " "])
                  ([INLINE :x 2127 :y 677 :w 70 :h 75 :elt 1612]
                   ([BLOCK :x 2127 :y 682 :w 70 :h 70 :elt 1613]
                    ([LINE]
                     ([INLINE :elt 1614]
                      ([INLINE :x 2127 :y 682 :w 70 :h 70 :elt 1615])
                      ([TEXT :x 2197 :y 684 :w 0 :h 15 :text " "])))))))))
              ([TEXT :x 2204 :y 475 :w 0 :h 15 :text " "]))))))
         ([BLOCK :x 1649 :y 563 :w 45 :h 100 :elt 1618]
          ([LINE]
           ([INLINE :x 1667.5 :y 602 :w 13 :h 22 :elt 1619]))))))
      ([BLOCK :x 204 :y 773 :w 1500 :h (/ 52721 30) :elt 1622]
       ([BLOCK :x 204 :y 773 :w 1500 :h (/ 52721 30) :elt 1623]
        ([BLOCK :x 204 :y 773 :w 1190 :h (/ 52721 30) :elt 1624]
         ([BLOCK :x 204 :y 773 :w 1190 :h (/ 52721 30) :elt 1625]
          ([BLOCK :x 224 :y 778 :w 1150 :h 286.5 :elt 1626]
           ([BLOCK :x 224 :y 778 :w 1150 :h 286.5 :elt 1627]
            ([BLOCK :x 244 :y 798 :w 1110 :h 31.5 :elt 1628]
             ([BLOCK :x 244 :y 798 :w 341 :h 31.5 :elt 1629]
              ([LINE]
               ([INLINE :elt 1630]
                ([TEXT :x 244 :y (/ 3209 4) :w 341 :h 23 :text "Recommendations for you in Books"]))))
             ([BLOCK :x 585 :y 798 :w 15 :h 0 :elt 1631]))
            ([BLOCK :x 244 :y 829.5 :w 1110 :h 220 :elt 1632]
             ([BLOCK :x 244 :y 829.5 :w 1110 :h 220 :elt 1633]
              ([LINE]
               ([INLINE :x 244 :y 829.5 :w 2551 :h 200 :elt 1634]
                ([LINE]
                 ([INLINE :x 244 :y 829.5 :w 145 :h 200 :elt 1635]
                  ([LINE]
                   ([INLINE :x 244 :y 829.5 :w 145 :h 200 :elt 1636]
                    ([LINE]
                     ([INLINE :x 250.5 :y 829.5 :w 132 :h 200 :elt 1637]
                      ([LINE]
                       ([INLINE :x 250.5 :y 829.5 :w 132 :h 200 :elt 1638])))))))
                 ([TEXT :x 399 :y 831.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 403 :y 829.5 :w 145 :h 200 :elt 1639]
                  ([LINE]
                   ([INLINE :x 403 :y 829.5 :w 145 :h 200 :elt 1640]
                    ([LINE]
                     ([INLINE :x 409.5 :y 829.5 :w 132 :h 200 :elt 1641]
                      ([LINE]
                       ([INLINE :x 409.5 :y 829.5 :w 132 :h 200 :elt 1642])))))))
                 ([TEXT :x 558 :y 831.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 562 :y 829.5 :w 145 :h 200 :elt 1643]
                  ([LINE]
                   ([INLINE :x 562 :y 829.5 :w 145 :h 200 :elt 1644]
                    ([LINE]
                     ([INLINE :x 569 :y 829.5 :w 131 :h 200 :elt 1645]
                      ([LINE]
                       ([INLINE :x 569 :y 829.5 :w 131 :h 200 :elt 1646])))))))
                 ([TEXT :x 717 :y 831.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 721 :y 829.5 :w 145 :h 200 :elt 1647]
                  ([LINE]
                   ([INLINE :x 721 :y 829.5 :w 145 :h 200 :elt 1648]
                    ([LINE]
                     ([INLINE :x 725.5 :y 829.5 :w 136 :h 200 :elt 1649]
                      ([LINE]
                       ([INLINE :x 725.5 :y 829.5 :w 136 :h 200 :elt 1650])))))))
                 ([TEXT :x 876 :y 831.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 880 :y 829.5 :w 145 :h 200 :elt 1651]
                  ([LINE]
                   ([INLINE :x 880 :y 829.5 :w 145 :h 200 :elt 1652]
                    ([LINE]
                     ([INLINE :x 886 :y 829.5 :w 133 :h 200 :elt 1653]
                      ([LINE]
                       ([INLINE :x 886 :y 829.5 :w 133 :h 200 :elt 1654])))))))
                 ([TEXT :x 1035 :y 831.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 1039 :y 829.5 :w 145 :h 200 :elt 1655]
                  ([LINE]
                   ([INLINE :x 1039 :y 829.5 :w 145 :h 200 :elt 1656]
                    ([LINE]
                     ([INLINE :x 1046.5 :y 829.5 :w 130 :h 200 :elt 1657]
                      ([LINE]
                       ([INLINE :x 1046.5 :y 829.5 :w 130 :h 200 :elt 1658])))))))
                 ([TEXT :x 1194 :y 831.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 1198 :y 829.5 :w 145 :h 200 :elt 1659]
                  ([LINE]
                   ([INLINE :x 1198 :y 829.5 :w 145 :h 200 :elt 1660]
                    ([LINE]
                     ([INLINE :x 1205 :y 829.5 :w 131 :h 200 :elt 1661]
                      ([LINE]
                       ([INLINE :x 1205 :y 829.5 :w 131 :h 200 :elt 1662])))))))
                 ([TEXT :x 1353 :y 831.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 1357 :y 829.5 :w 145 :h 200 :elt 1663]
                  ([LINE]
                   ([INLINE :x 1357 :y 829.5 :w 145 :h 200 :elt 1664]
                    ([LINE]
                     ([INLINE :x 1363.5 :y 829.5 :w 132 :h 200 :elt 1665]
                      ([LINE]
                       ([INLINE :x 1363.5 :y 829.5 :w 132 :h 200 :elt 1666])))))))
                 ([TEXT :x 1512 :y 831.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 1516 :y 829.5 :w 145 :h 200 :elt 1667]
                  ([LINE]
                   ([INLINE :x 1516 :y 829.5 :w 145 :h 200 :elt 1668]
                    ([LINE]
                     ([INLINE :x 1522.5 :y 829.5 :w 132 :h 200 :elt 1669]
                      ([LINE]
                       ([INLINE :x 1522.5 :y 829.5 :w 132 :h 200 :elt 1670])))))))
                 ([TEXT :x 1671 :y 831.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 1675 :y 829.5 :w 145 :h 200 :elt 1671]
                  ([LINE]
                   ([INLINE :x 1675 :y 829.5 :w 145 :h 200 :elt 1672]
                    ([LINE]
                     ([INLINE :x 1681 :y 829.5 :w 133 :h 200 :elt 1673]
                      ([LINE]
                       ([INLINE :x 1681 :y 829.5 :w 133 :h 200 :elt 1674])))))))
                 ([TEXT :x 1830 :y 831.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 1834 :y 829.5 :w 162 :h 200 :elt 1675]
                  ([LINE]
                   ([INLINE :x 1834 :y 829.5 :w 162 :h 200 :elt 1676]
                    ([LINE]
                     ([INLINE :x 1834 :y 829.5 :w 162 :h 200 :elt 1677]
                      ([LINE]
                       ([INLINE :x 1834 :y 829.5 :w 162 :h 200 :elt 1678])))))))
                 ([TEXT :x 2006 :y 831.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 2010 :y 829.5 :w 145 :h 200 :elt 1679]
                  ([LINE]
                   ([INLINE :x 2010 :y 829.5 :w 145 :h 200 :elt 1680]
                    ([LINE]
                     ([INLINE :x 2016 :y 829.5 :w 133 :h 200 :elt 1681]
                      ([LINE]
                       ([INLINE :x 2016 :y 829.5 :w 133 :h 200 :elt 1682])))))))
                 ([TEXT :x 2165 :y 831.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 2169 :y 829.5 :w 145 :h 200 :elt 1683]
                  ([LINE]
                   ([INLINE :x 2169 :y 829.5 :w 145 :h 200 :elt 1684]
                    ([LINE]
                     ([INLINE :x 2173.5 :y 829.5 :w 136 :h 200 :elt 1685]
                      ([LINE]
                       ([INLINE :x 2173.5 :y 829.5 :w 136 :h 200 :elt 1686])))))))
                 ([TEXT :x 2324 :y 831.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 2328 :y 829.5 :w 149 :h 200 :elt 1687]
                  ([LINE]
                   ([INLINE :x 2328 :y 829.5 :w 149 :h 200 :elt 1688]
                    ([LINE]
                     ([INLINE :x 2328 :y 829.5 :w 149 :h 200 :elt 1689]
                      ([LINE]
                       ([INLINE :x 2328 :y 829.5 :w 149 :h 200 :elt 1690])))))))
                 ([TEXT :x 2487 :y 831.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 2491 :y 829.5 :w 145 :h 200 :elt 1691]
                  ([LINE]
                   ([INLINE :x 2491 :y 829.5 :w 145 :h 200 :elt 1692]
                    ([LINE]
                     ([INLINE :x 2496.5 :y 829.5 :w 134 :h 200 :elt 1693]
                      ([LINE]
                       ([INLINE :x 2496.5 :y 829.5 :w 134 :h 200 :elt 1694])))))))
                 ([TEXT :x 2646 :y 831.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 2650 :y 829.5 :w 145 :h 200 :elt 1695]
                  ([LINE]
                   ([INLINE :x 2650 :y 829.5 :w 145 :h 200 :elt 1696]
                    ([LINE]
                     ([INLINE :x 2657.5 :y 829.5 :w 130 :h 200 :elt 1697]
                      ([LINE]
                       ([INLINE :x 2657.5 :y 829.5 :w 130 :h 200 :elt 1698])))))))))
               ([TEXT :x 2795 :y 831.5 :w 0 :h 15 :text " "])))
             ([BLOCK :x 244 :y 1043.5 :w 1110 :h 6 :elt 1705]
              ([BLOCK :x 244 :y 1045.5 :w 1110 :h 1 :elt 1706])))))
          ([BLOCK :x 224 :y 1064.5 :w 1150 :h 290 :elt 1712]
           ([BLOCK :x 224 :y 1064.5 :w 1150 :h 290 :elt 1713]
            ([BLOCK :x 244 :y 1084.5 :w 1110 :h 35 :elt 1714]
             ([BLOCK :x 244 :y 1084.5 :w 299 :h 31.5 :elt 1715]
              ([LINE]
               ([INLINE :elt 1716]
                ([TEXT :x 244 :y (/ 4355 4) :w 299 :h 23 :text "More recommendations for you"]))))
             ([BLOCK :x 543 :y 1084.5 :w 77 :h 35 :elt 1717]
              ([LINE]
               ([INLINE :elt 1718]
                ([TEXT :x 558 :y 1094 :w 62 :h 16 :text "See more"])))))
            ([BLOCK :x 244 :y 1119.5 :w 1110 :h 220 :elt 1719]
             ([BLOCK :x 244 :y 1119.5 :w 1110 :h 220 :elt 1720]
              ([LINE]
               ([INLINE :x 244 :y 1119.5 :w 2283 :h 200 :elt 1721]
                ([LINE]
                 ([INLINE :x 244 :y 1119.5 :w 145 :h 200 :elt 1722]
                  ([LINE]
                   ([INLINE :x 244 :y 1119.5 :w 145 :h 200 :elt 1723]
                    ([LINE]
                     ([INLINE :x 264.5 :y 1119.5 :w 104 :h 200 :elt 1724]
                      ([LINE]
                       ([INLINE :x 264.5 :y 1119.5 :w 104 :h 200 :elt 1725])))))))
                 ([TEXT :x 399 :y 1121.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 403 :y 1119.5 :w 145 :h 200 :elt 1726]
                  ([LINE]
                   ([INLINE :x 403 :y 1119.5 :w 145 :h 200 :elt 1727]
                    ([LINE]
                     ([INLINE :x 431.5 :y 1119.5 :w 88 :h 200 :elt 1728]
                      ([LINE]
                       ([INLINE :x 431.5 :y 1119.5 :w 88 :h 200 :elt 1729])))))))
                 ([TEXT :x 558 :y 1121.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 562 :y 1119.5 :w 200 :h 200 :elt 1730]
                  ([LINE]
                   ([INLINE :x 562 :y 1119.5 :w 200 :h 200 :elt 1731]
                    ([LINE]
                     ([INLINE :x 562 :y 1119.5 :w 200 :h 200 :elt 1732]
                      ([LINE]
                       ([INLINE :x 562 :y 1119.5 :w 200 :h 200 :elt 1733])))))))
                 ([TEXT :x 772 :y 1121.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 776 :y 1119.5 :w 200 :h 200 :elt 1734]
                  ([LINE]
                   ([INLINE :x 776 :y 1119.5 :w 200 :h 200 :elt 1735]
                    ([LINE]
                     ([INLINE :x 776 :y 1119.5 :w 200 :h 200 :elt 1736]
                      ([LINE]
                       ([INLINE :x 776 :y 1119.5 :w 200 :h 200 :elt 1737])))))))
                 ([TEXT :x 986 :y 1121.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 990 :y 1119.5 :w 194 :h 200 :elt 1738]
                  ([LINE]
                   ([INLINE :x 990 :y 1119.5 :w 194 :h 200 :elt 1739]
                    ([LINE]
                     ([INLINE :x 990 :y 1119.5 :w 194 :h 200 :elt 1740]
                      ([LINE]
                       ([INLINE :x 990 :y 1119.5 :w 194 :h 200 :elt 1741])))))))
                 ([TEXT :x 1194 :y 1121.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 1198 :y 1119.5 :w 270 :h 200 :elt 1742]
                  ([LINE]
                   ([INLINE :x 1198 :y (/ 35581 30) :w 270 :h (/ 1339 20) :elt 1743]
                    ([LINE]
                     ([INLINE :x 1198 :y (/ 35581 30) :w 270 :h (/ 1339 20) :elt 1744]
                      ([LINE]
                       ([INLINE :x 1198 :y (/ 35581 30) :w 270 :h (/ 1339 20) :elt 1745])))))))
                 ([TEXT :x 1478 :y 1121.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 1482 :y 1119.5 :w 224 :h 200 :elt 1746]
                  ([LINE]
                   ([INLINE :x 1482 :y 1119.5 :w 224 :h 200 :elt 1747]
                    ([LINE]
                     ([INLINE :x 1482 :y 1119.5 :w 224 :h 200 :elt 1748]
                      ([LINE]
                       ([INLINE :x 1482 :y 1119.5 :w 224 :h 200 :elt 1749])))))))
                 ([TEXT :x 1716 :y 1121.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 1720 :y 1119.5 :w 270 :h 200 :elt 1750]
                  ([LINE]
                   ([INLINE :x 1720 :y 1180.6 :w 270 :h 77.8 :elt 1751]
                    ([LINE]
                     ([INLINE :x 1720 :y 1180.6 :w 270 :h 77.8 :elt 1752]
                      ([LINE]
                       ([INLINE :x 1720 :y 1180.6 :w 270 :h 77.8 :elt 1753])))))))
                 ([TEXT :x 2000 :y 1121.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 2004 :y 1119.5 :w 153 :h 200 :elt 1754]
                  ([LINE]
                   ([INLINE :x 2004 :y 1119.5 :w 153 :h 200 :elt 1755]
                    ([LINE]
                     ([INLINE :x 2004 :y 1119.5 :w 153 :h 200 :elt 1756]
                      ([LINE]
                       ([INLINE :x 2004 :y 1119.5 :w 153 :h 200 :elt 1757])))))))
                 ([TEXT :x 2167 :y 1121.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 2171 :y 1119.5 :w 145 :h 200 :elt 1758]
                  ([LINE]
                   ([INLINE :x 2171 :y 1119.5 :w 145 :h 200 :elt 1759]
                    ([LINE]
                     ([INLINE :x 2196 :y 1119.5 :w 95 :h 200 :elt 1760]
                      ([LINE]
                       ([INLINE :x 2196 :y 1119.5 :w 95 :h 200 :elt 1761])))))))
                 ([TEXT :x 2326 :y 1121.5 :w 4 :h 15 :text " "])
                 ([INLINE :x 2330 :y 1119.5 :w 197 :h 200 :elt 1762]
                  ([LINE]
                   ([INLINE :x 2330 :y 1119.5 :w 197 :h 200 :elt 1763]
                    ([LINE]
                     ([INLINE :x 2330 :y 1119.5 :w 197 :h 200 :elt 1764]
                      ([LINE]
                       ([INLINE :x 2330 :y 1119.5 :w 197 :h 200 :elt 1765])))))))))
               ([TEXT :x 2527 :y 1121.5 :w 0 :h 15 :text " "])))
             ([BLOCK :x 244 :y 1333.5 :w 1110 :h 6 :elt 1772]
              ([BLOCK :x 244 :y 1335.5 :w 1110 :h 1 :elt 1773])))))
          ([BLOCK :x 224 :y 1354.5 :w 1150 :h 239 :elt 1781]
           ([BLOCK :x 224 :y 1366.5 :w 1150 :h 200 :elt 1782]
            ([BLOCK :x 224 :y 1366.5 :w 562.9 :h 200 :elt 1783]
             ([LINE]
              ([INLINE :x 224 :y 1366.5 :w 562.9 :h 200 :elt 1784]
               ([BLOCK :x 234 :y 1366.5 :w 542.9 :h 200 :elt 1785]
                ([BLOCK :x (/ 5709 20) :y 1366.5 :w 440 :h 200 :elt 1787]
                 ([LINE]
                  ([INLINE :x (/ 5709 20) :y 1366.5 :w 440 :h 200 :elt 1788])))))))
            ([BLOCK :x 811.1 :y 1366.5 :w 562.9 :h 200 :elt 1790]
             ([LINE]
              ([INLINE :x 811.1 :y 1366.5 :w 562.9 :h 200 :elt 1791]
               ([BLOCK :x 821.1 :y 1366.5 :w 542.9 :h 200 :elt 1792]
                ([BLOCK :x (/ 17451 20) :y 1366.5 :w 440 :h 200 :elt 1794]
                 ([LINE]
                  ([INLINE :x (/ 17451 20) :y 1366.5 :w 440 :h 200 :elt 1795])))))))))
          ([BLOCK :x 224 :y 1593.5 :w 1150 :h 1 :elt 1797])
          ([BLOCK :x 224 :y 1614.5 :w 1150 :h 286.5 :elt 1798]
           ([BLOCK :x 224 :y 1614.5 :w 1150 :h 286.5 :elt 1799]
            ([BLOCK :x 244 :y 1634.5 :w 1110 :h 31.5 :elt 1800]
             ([BLOCK :x 244 :y 1634.5 :w 472 :h 31.5 :elt 1801]
              ([LINE]
               ([INLINE :elt 1802]
                ([TEXT :x 244 :y (/ 6555 4) :w 472 :h 23 :text "Recommendations for you in Health & Household"]))))
             ([BLOCK :x 716 :y 1634.5 :w 15 :h 0 :elt 1803]))
            ([BLOCK :x 244 :y 1666 :w 1110 :h 220 :elt 1804]
             ([BLOCK :x 244 :y 1666 :w 1110 :h 220 :elt 1805]
              ([LINE]
               ([INLINE :x 244 :y 1666 :w 4156 :h 200 :elt 1806]
                ([LINE]
                 ([INLINE :x 244 :y 1666 :w 145 :h 200 :elt 1807]
                  ([LINE]
                   ([INLINE :x 244 :y 1666 :w 145 :h 200 :elt 1808]
                    ([LINE]
                     ([INLINE :x 270.5 :y 1666 :w 92 :h 200 :elt 1809]
                      ([LINE]
                       ([INLINE :x 270.5 :y 1666 :w 92 :h 200 :elt 1810])))))))
                 ([TEXT :x 399 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 403 :y 1666 :w 176 :h 200 :elt 1811]
                  ([LINE]
                   ([INLINE :x 403 :y 1666 :w 176 :h 200 :elt 1812]
                    ([LINE]
                     ([INLINE :x 403 :y 1666 :w 176 :h 200 :elt 1813]
                      ([LINE]
                       ([INLINE :x 403 :y 1666 :w 176 :h 200 :elt 1814])))))))
                 ([TEXT :x 589 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 593 :y 1666 :w 167 :h 200 :elt 1815]
                  ([LINE]
                   ([INLINE :x 593 :y 1666 :w 167 :h 200 :elt 1816]
                    ([LINE]
                     ([INLINE :x 593 :y 1666 :w 167 :h 200 :elt 1817]
                      ([LINE]
                       ([INLINE :x 593 :y 1666 :w 167 :h 200 :elt 1818])))))))
                 ([TEXT :x 770 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 774 :y 1666 :w 145 :h 200 :elt 1819]
                  ([LINE]
                   ([INLINE :x 774 :y 1666 :w 145 :h 200 :elt 1820]
                    ([LINE]
                     ([INLINE :x 783.5 :y 1666 :w 126 :h 200 :elt 1821]
                      ([LINE]
                       ([INLINE :x 783.5 :y 1666 :w 126 :h 200 :elt 1822])))))))
                 ([TEXT :x 929 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 933 :y 1666 :w 197 :h 200 :elt 1823]
                  ([LINE]
                   ([INLINE :x 933 :y 1666 :w 197 :h 200 :elt 1824]
                    ([LINE]
                     ([INLINE :x 933 :y 1666 :w 197 :h 200 :elt 1825]
                      ([LINE]
                       ([INLINE :x 933 :y 1666 :w 197 :h 200 :elt 1826])))))))
                 ([TEXT :x 1140 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 1144 :y 1666 :w 225 :h 200 :elt 1827]
                  ([LINE]
                   ([INLINE :x 1144 :y 1666 :w 225 :h 200 :elt 1828]
                    ([LINE]
                     ([INLINE :x 1144 :y 1666 :w 225 :h 200 :elt 1829]
                      ([LINE]
                       ([INLINE :x 1144 :y 1666 :w 225 :h 200 :elt 1830])))))))
                 ([TEXT :x 1379 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 1383 :y 1666 :w 208 :h 200 :elt 1831]
                  ([LINE]
                   ([INLINE :x 1383 :y 1666 :w 208 :h 200 :elt 1832]
                    ([LINE]
                     ([INLINE :x 1383 :y 1666 :w 208 :h 200 :elt 1833]
                      ([LINE]
                       ([INLINE :x 1383 :y 1666 :w 208 :h 200 :elt 1834])))))))
                 ([TEXT :x 1601 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 1605 :y 1666 :w 270 :h 200 :elt 1835]
                  ([LINE]
                   ([INLINE :x 1605 :y (/ 10045 6) :w 270 :h (/ 551 3) :elt 1836]
                    ([LINE]
                     ([INLINE :x 1605 :y (/ 10045 6) :w 270 :h (/ 551 3) :elt 1837]
                      ([LINE]
                       ([INLINE :x 1605 :y (/ 10045 6) :w 270 :h (/ 551 3) :elt 1838])))))))
                 ([TEXT :x 1885 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 1889 :y 1666 :w 215 :h 200 :elt 1839]
                  ([LINE]
                   ([INLINE :x 1889 :y 1666 :w 215 :h 200 :elt 1840]
                    ([LINE]
                     ([INLINE :x 1889 :y 1666 :w 215 :h 200 :elt 1841]
                      ([LINE]
                       ([INLINE :x 1889 :y 1666 :w 215 :h 200 :elt 1842])))))))
                 ([TEXT :x 2114 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 2118 :y 1666 :w 251 :h 200 :elt 1843]
                  ([LINE]
                   ([INLINE :x 2118 :y 1666 :w 251 :h 200 :elt 1844]
                    ([LINE]
                     ([INLINE :x 2118 :y 1666 :w 251 :h 200 :elt 1845]
                      ([LINE]
                       ([INLINE :x 2118 :y 1666 :w 251 :h 200 :elt 1846])))))))
                 ([TEXT :x 2379 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 2383 :y 1666 :w 270 :h 200 :elt 1847]
                  ([LINE]
                   ([INLINE :x 2383 :y (/ 20039 12) :w 270 :h (/ 1153 6) :elt 1848]
                    ([LINE]
                     ([INLINE :x 2383 :y (/ 20039 12) :w 270 :h (/ 1153 6) :elt 1849]
                      ([LINE]
                       ([INLINE :x 2383 :y (/ 20039 12) :w 270 :h (/ 1153 6) :elt 1850])))))))
                 ([TEXT :x 2663 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 2667 :y 1666 :w 176 :h 200 :elt 1851]
                  ([LINE]
                   ([INLINE :x 2667 :y 1666 :w 176 :h 200 :elt 1852]
                    ([LINE]
                     ([INLINE :x 2667 :y 1666 :w 176 :h 200 :elt 1853]
                      ([LINE]
                       ([INLINE :x 2667 :y 1666 :w 176 :h 200 :elt 1854])))))))
                 ([TEXT :x 2853 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 2857 :y 1666 :w 145 :h 200 :elt 1855]
                  ([LINE]
                   ([INLINE :x 2857 :y 1666 :w 145 :h 200 :elt 1856]
                    ([LINE]
                     ([INLINE :x 2875 :y 1666 :w 109 :h 200 :elt 1857]
                      ([LINE]
                       ([INLINE :x 2875 :y 1666 :w 109 :h 200 :elt 1858])))))))
                 ([TEXT :x 3012 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 3016 :y 1666 :w 145 :h 200 :elt 1859]
                  ([LINE]
                   ([INLINE :x 3016 :y 1666 :w 145 :h 200 :elt 1860]
                    ([LINE]
                     ([INLINE :x 3026.5 :y 1666 :w 124 :h 200 :elt 1861]
                      ([LINE]
                       ([INLINE :x 3026.5 :y 1666 :w 124 :h 200 :elt 1862])))))))
                 ([TEXT :x 3171 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 3175 :y 1666 :w 176 :h 200 :elt 1863]
                  ([LINE]
                   ([INLINE :x 3175 :y 1666 :w 176 :h 200 :elt 1864]
                    ([LINE]
                     ([INLINE :x 3175 :y 1666 :w 176 :h 200 :elt 1865]
                      ([LINE]
                       ([INLINE :x 3175 :y 1666 :w 176 :h 200 :elt 1866])))))))
                 ([TEXT :x 3361 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 3365 :y 1666 :w 213 :h 200 :elt 1867]
                  ([LINE]
                   ([INLINE :x 3365 :y 1666 :w 213 :h 200 :elt 1868]
                    ([LINE]
                     ([INLINE :x 3365 :y 1666 :w 213 :h 200 :elt 1869]
                      ([LINE]
                       ([INLINE :x 3365 :y 1666 :w 213 :h 200 :elt 1870])))))))
                 ([TEXT :x 3588 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 3592 :y 1666 :w 209 :h 200 :elt 1871]
                  ([LINE]
                   ([INLINE :x 3592 :y 1666 :w 209 :h 200 :elt 1872]
                    ([LINE]
                     ([INLINE :x 3592 :y 1666 :w 209 :h 200 :elt 1873]
                      ([LINE]
                       ([INLINE :x 3592 :y 1666 :w 209 :h 200 :elt 1874])))))))
                 ([TEXT :x 3811 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 3815 :y 1666 :w 194 :h 200 :elt 1875]
                  ([LINE]
                   ([INLINE :x 3815 :y 1666 :w 194 :h 200 :elt 1876]
                    ([LINE]
                     ([INLINE :x 3815 :y 1666 :w 194 :h 200 :elt 1877]
                      ([LINE]
                       ([INLINE :x 3815 :y 1666 :w 194 :h 200 :elt 1878])))))))
                 ([TEXT :x 4019 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 4023 :y 1666 :w 208 :h 200 :elt 1879]
                  ([LINE]
                   ([INLINE :x 4023 :y 1666 :w 208 :h 200 :elt 1880]
                    ([LINE]
                     ([INLINE :x 4023 :y 1666 :w 208 :h 200 :elt 1881]
                      ([LINE]
                       ([INLINE :x 4023 :y 1666 :w 208 :h 200 :elt 1882])))))))
                 ([TEXT :x 4241 :y 1668 :w 4 :h 15 :text " "])
                 ([INLINE :x 4245 :y 1666 :w 145 :h 200 :elt 1883]
                  ([LINE]
                   ([INLINE :x 4245 :y 1666 :w 145 :h 200 :elt 1884]
                    ([LINE]
                     ([INLINE :x 4265 :y 1666 :w 105 :h 200 :elt 1885]
                      ([LINE]
                       ([INLINE :x 4265 :y 1666 :w 105 :h 200 :elt 1886])))))))))
               ([TEXT :x 4400 :y 1668 :w 0 :h 15 :text " "])))
             ([BLOCK :x 244 :y 1880 :w 1110 :h 6 :elt 1893]
              ([BLOCK :x 244 :y 1882 :w 1110 :h 1 :elt 1894])))))
          ([ANON]
           ([LINE]
            ([INLINE :x 224 :y 1901 :w 1150 :h (/ 10181 30) :elt 1900]
             ([BLOCK :x 234 :y 1901 :w 1130 :h (/ 9521 30) :elt 1901]
              ([LINE]
               ([INLINE :x 234 :y 1901 :w 1130 :h (/ 9521 30) :elt 1903]
                ([LINE]
                 ([INLINE :x 234 :y 1901 :w 1130 :h (/ 9521 30) :elt 1904]))))))))
          ([BLOCK :x 224 :y (/ 67211 30) :w 1150 :h 290 :elt 1906]
           ([BLOCK :x 224 :y (/ 67211 30) :w 1150 :h 290 :elt 1907]
            ([BLOCK :x 244 :y (/ 67811 30) :w 1110 :h 35 :elt 1908]
             ([BLOCK :x 244 :y (/ 67811 30) :w 515 :h 31.5 :elt 1909]
              ([LINE]
               ([INLINE :elt 1910]
                ([TEXT :x 244 :y (/ 135877 60) :w 515 :h 23 :text "Popular movies included with your Prime membership"]))))
             ([BLOCK :x 759 :y (/ 67811 30) :w 77 :h 35 :elt 1911]
              ([LINE]
               ([INLINE :elt 1912]
                ([TEXT :x 774 :y (/ 34048 15) :w 62 :h 16 :text "See more"])))))
            ([BLOCK :x 244 :y (/ 68861 30) :w 1110 :h 220 :elt 1913]
             ([BLOCK :x 244 :y (/ 68861 30) :w 1110 :h 220 :elt 1914]
              ([LINE]
               ([INLINE :x 244 :y (/ 68861 30) :w 3247 :h 200 :elt 1915]
                ([LINE]
                 ([INLINE :x 244 :y (/ 68861 30) :w 146 :h 200 :elt 1916]
                  ([LINE]
                   ([INLINE :x 244 :y (/ 68861 30) :w 146 :h 200 :elt 1917]
                    ([LINE]
                     ([INLINE :x 244 :y (/ 68861 30) :w 146 :h 200 :elt 1918]
                      ([LINE]
                       ([INLINE :x 244 :y (/ 68861 30) :w 146 :h 200 :elt 1919])))))))
                 ([TEXT :x 400 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 404 :y (/ 68861 30) :w 150 :h 200 :elt 1920]
                  ([LINE]
                   ([INLINE :x 404 :y (/ 68861 30) :w 150 :h 200 :elt 1921]
                    ([LINE]
                     ([INLINE :x 404 :y (/ 68861 30) :w 150 :h 200 :elt 1922]
                      ([LINE]
                       ([INLINE :x 404 :y (/ 68861 30) :w 150 :h 200 :elt 1923])))))))
                 ([TEXT :x 564 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 568 :y (/ 68861 30) :w 150 :h 200 :elt 1924]
                  ([LINE]
                   ([INLINE :x 568 :y (/ 68861 30) :w 150 :h 200 :elt 1925]
                    ([LINE]
                     ([INLINE :x 568 :y (/ 68861 30) :w 150 :h 200 :elt 1926]
                      ([LINE]
                       ([INLINE :x 568 :y (/ 68861 30) :w 150 :h 200 :elt 1927])))))))
                 ([TEXT :x 728 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 732 :y (/ 68861 30) :w 150 :h 200 :elt 1928]
                  ([LINE]
                   ([INLINE :x 732 :y (/ 68861 30) :w 150 :h 200 :elt 1929]
                    ([LINE]
                     ([INLINE :x 732 :y (/ 68861 30) :w 150 :h 200 :elt 1930]
                      ([LINE]
                       ([INLINE :x 732 :y (/ 68861 30) :w 150 :h 200 :elt 1931])))))))
                 ([TEXT :x 892 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 896 :y (/ 68861 30) :w 150 :h 200 :elt 1932]
                  ([LINE]
                   ([INLINE :x 896 :y (/ 68861 30) :w 150 :h 200 :elt 1933]
                    ([LINE]
                     ([INLINE :x 896 :y (/ 68861 30) :w 150 :h 200 :elt 1934]
                      ([LINE]
                       ([INLINE :x 896 :y (/ 68861 30) :w 150 :h 200 :elt 1935])))))))
                 ([TEXT :x 1056 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 1060 :y (/ 68861 30) :w 150 :h 200 :elt 1936]
                  ([LINE]
                   ([INLINE :x 1060 :y (/ 68861 30) :w 150 :h 200 :elt 1937]
                    ([LINE]
                     ([INLINE :x 1060 :y (/ 68861 30) :w 150 :h 200 :elt 1938]
                      ([LINE]
                       ([INLINE :x 1060 :y (/ 68861 30) :w 150 :h 200 :elt 1939])))))))
                 ([TEXT :x 1220 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 1224 :y (/ 68861 30) :w 145 :h 200 :elt 1940]
                  ([LINE]
                   ([INLINE :x 1224 :y (/ 68861 30) :w 145 :h 200 :elt 1941]
                    ([LINE]
                     ([INLINE :x 1230 :y (/ 68861 30) :w 133 :h 200 :elt 1942]
                      ([LINE]
                       ([INLINE :x 1230 :y (/ 68861 30) :w 133 :h 200 :elt 1943])))))))
                 ([TEXT :x 1379 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 1383 :y (/ 68861 30) :w 150 :h 200 :elt 1944]
                  ([LINE]
                   ([INLINE :x 1383 :y (/ 68861 30) :w 150 :h 200 :elt 1945]
                    ([LINE]
                     ([INLINE :x 1383 :y (/ 68861 30) :w 150 :h 200 :elt 1946]
                      ([LINE]
                       ([INLINE :x 1383 :y (/ 68861 30) :w 150 :h 200 :elt 1947])))))))
                 ([TEXT :x 1543 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 1547 :y (/ 68861 30) :w 150 :h 200 :elt 1948]
                  ([LINE]
                   ([INLINE :x 1547 :y (/ 68861 30) :w 150 :h 200 :elt 1949]
                    ([LINE]
                     ([INLINE :x 1547 :y (/ 68861 30) :w 150 :h 200 :elt 1950]
                      ([LINE]
                       ([INLINE :x 1547 :y (/ 68861 30) :w 150 :h 200 :elt 1951])))))))
                 ([TEXT :x 1707 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 1711 :y (/ 68861 30) :w 150 :h 200 :elt 1952]
                  ([LINE]
                   ([INLINE :x 1711 :y (/ 68861 30) :w 150 :h 200 :elt 1953]
                    ([LINE]
                     ([INLINE :x 1711 :y (/ 68861 30) :w 150 :h 200 :elt 1954]
                      ([LINE]
                       ([INLINE :x 1711 :y (/ 68861 30) :w 150 :h 200 :elt 1955])))))))
                 ([TEXT :x 1871 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 1875 :y (/ 68861 30) :w 150 :h 200 :elt 1956]
                  ([LINE]
                   ([INLINE :x 1875 :y (/ 68861 30) :w 150 :h 200 :elt 1957]
                    ([LINE]
                     ([INLINE :x 1875 :y (/ 68861 30) :w 150 :h 200 :elt 1958]
                      ([LINE]
                       ([INLINE :x 1875 :y (/ 68861 30) :w 150 :h 200 :elt 1959])))))))
                 ([TEXT :x 2035 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 2039 :y (/ 68861 30) :w 150 :h 200 :elt 1960]
                  ([LINE]
                   ([INLINE :x 2039 :y (/ 68861 30) :w 150 :h 200 :elt 1961]
                    ([LINE]
                     ([INLINE :x 2039 :y (/ 68861 30) :w 150 :h 200 :elt 1962]
                      ([LINE]
                       ([INLINE :x 2039 :y (/ 68861 30) :w 150 :h 200 :elt 1963])))))))
                 ([TEXT :x 2199 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 2203 :y (/ 68861 30) :w 150 :h 200 :elt 1964]
                  ([LINE]
                   ([INLINE :x 2203 :y (/ 68861 30) :w 150 :h 200 :elt 1965]
                    ([LINE]
                     ([INLINE :x 2203 :y (/ 68861 30) :w 150 :h 200 :elt 1966]
                      ([LINE]
                       ([INLINE :x 2203 :y (/ 68861 30) :w 150 :h 200 :elt 1967])))))))
                 ([TEXT :x 2363 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 2367 :y (/ 68861 30) :w 145 :h 200 :elt 1968]
                  ([LINE]
                   ([INLINE :x 2367 :y (/ 68861 30) :w 145 :h 200 :elt 1969]
                    ([LINE]
                     ([INLINE :x 2373 :y (/ 68861 30) :w 133 :h 200 :elt 1970]
                      ([LINE]
                       ([INLINE :x 2373 :y (/ 68861 30) :w 133 :h 200 :elt 1971])))))))
                 ([TEXT :x 2522 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 2526 :y (/ 68861 30) :w 150 :h 200 :elt 1972]
                  ([LINE]
                   ([INLINE :x 2526 :y (/ 68861 30) :w 150 :h 200 :elt 1973]
                    ([LINE]
                     ([INLINE :x 2526 :y (/ 68861 30) :w 150 :h 200 :elt 1974]
                      ([LINE]
                       ([INLINE :x 2526 :y (/ 68861 30) :w 150 :h 200 :elt 1975])))))))
                 ([TEXT :x 2686 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 2690 :y (/ 68861 30) :w 145 :h 200 :elt 1976]
                  ([LINE]
                   ([INLINE :x 2690 :y (/ 68861 30) :w 145 :h 200 :elt 1977]
                    ([LINE]
                     ([INLINE :x 2693 :y (/ 68861 30) :w 139 :h 200 :elt 1978]
                      ([LINE]
                       ([INLINE :x 2693 :y (/ 68861 30) :w 139 :h 200 :elt 1979])))))))
                 ([TEXT :x 2845 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 2849 :y (/ 68861 30) :w 145 :h 200 :elt 1980]
                  ([LINE]
                   ([INLINE :x 2849 :y (/ 68861 30) :w 145 :h 200 :elt 1981]
                    ([LINE]
                     ([INLINE :x 2849.5 :y (/ 68861 30) :w 144 :h 200 :elt 1982]
                      ([LINE]
                       ([INLINE :x 2849.5 :y (/ 68861 30) :w 144 :h 200 :elt 1983])))))))
                 ([TEXT :x 3004 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 3008 :y (/ 68861 30) :w 150 :h 200 :elt 1984]
                  ([LINE]
                   ([INLINE :x 3008 :y (/ 68861 30) :w 150 :h 200 :elt 1985]
                    ([LINE]
                     ([INLINE :x 3008 :y (/ 68861 30) :w 150 :h 200 :elt 1986]
                      ([LINE]
                       ([INLINE :x 3008 :y (/ 68861 30) :w 150 :h 200 :elt 1987])))))))
                 ([TEXT :x 3168 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 3172 :y (/ 68861 30) :w 150 :h 200 :elt 1988]
                  ([LINE]
                   ([INLINE :x 3172 :y (/ 68861 30) :w 150 :h 200 :elt 1989]
                    ([LINE]
                     ([INLINE :x 3172 :y (/ 68861 30) :w 150 :h 200 :elt 1990]
                      ([LINE]
                       ([INLINE :x 3172 :y (/ 68861 30) :w 150 :h 200 :elt 1991])))))))
                 ([TEXT :x 3332 :y (/ 68921 30) :w 4 :h 15 :text " "])
                 ([INLINE :x 3336 :y (/ 68861 30) :w 145 :h 200 :elt 1992]
                  ([LINE]
                   ([INLINE :x 3336 :y (/ 68861 30) :w 145 :h 200 :elt 1993]
                    ([LINE]
                     ([INLINE :x 3342 :y (/ 68861 30) :w 133 :h 200 :elt 1994]
                      ([LINE]
                       ([INLINE :x 3342 :y (/ 68861 30) :w 133 :h 200 :elt 1995])))))))))
               ([TEXT :x 3491 :y (/ 68921 30) :w 0 :h 15 :text " "])))
             ([BLOCK :x 244 :y (/ 75281 30) :w 1110 :h 6 :elt 2002]
              ([BLOCK :x 244 :y (/ 75341 30) :w 1110 :h 1 :elt 2003])))))))
        ([BLOCK :x 1394 :y 773 :w 310 :h 1596.7 :elt 2009]
         ([BLOCK :x 1399 :y 783 :w 300 :h 277 :elt 2010]
          ([BLOCK :x 1399 :y 788 :w 300 :h 272 :elt 2013]
           ([ANON]
            ([LINE]
             ([INLINE :x 1399 :y 788 :w 300 :h 250 :elt 2014])))
           ([BLOCK :x 1399 :y 1041 :w 300 :h 20 :elt 2016]
            ([BLOCK :x 1621 :y 1041 :w 78 :h 14 :elt 2017]
             ([LINE]
              ([INLINE :elt 2018]
               ([TEXT :x 1621 :y 1041 :w 64 :h 12 :text " Ad feedback "])
               ([INLINE :x 1685 :y 1042 :w 14 :h 12 :elt 2019])))))))
         ([BLOCK :x 1417 :y 1060 :w 264 :h 1 :elt 2023])
         ([BLOCK :x 1417 :y 1076 :w 264 :h 864.7 :elt 2024]
          ([BLOCK :x 1394 :y 1076 :w 310 :h 864.7 :elt 2027]
           ([BLOCK :x 1394 :y 1076 :w 310 :h 56.3 :elt 2028]
            ([BLOCK :x 1417 :y 1076 :w 264 :h 37.3 :elt 2029]
             ([BLOCK :x 1417 :y 1076 :w 264 :h 37.3 :elt 2030]
              ([BLOCK :x 1417 :y 1076 :w 264 :h 27.3 :elt 2031]
               ([LINE]
                ([TEXT :x 1446 :y (/ 21563 20) :w 206 :h 23 :text " Tap Below to Reorder "])))))
            ([BLOCK :x 1417 :y 1113.3 :w 264 :h 19 :elt 2032]
             ([BLOCK :x 1417 :y 1113.3 :w (/ 7753 60) :h 19 :elt 2033]
              ([LINE]
               ([INLINE :elt 2034]
                ([TEXT :x 1417 :y 1115.3 :w 109 :h 15 :text " Your Dash Buttons "]))))
             ([BLOCK :x (/ 93107 60) :y 1113.3 :w (/ 7753 60) :h 19 :elt 2035]
              ([LINE]
               ([INLINE :elt 2036]
                ([INLINE :elt 2037]
                 ([TEXT :x 1616 :y 1115.3 :w 65 :h 15 :text " Learn more "])))))))
           ([BLOCK :x 1394 :y 1142.3 :w 310 :h 0 :elt 2038])
           ([BLOCK :x 1394 :y 1147.3 :w 310 :h 1 :elt 2039])
           ([BLOCK :x 1394 :y 1163.3 :w 310 :h 777.4 :elt 2040]
            ([BLOCK :x 1394 :y 1163.3 :w 310 :h 116.4 :elt 2041]
             ([MAGIC :x 1394 :y 1164.3 :w 620 :h 114.4 :elt 2042]
              ([MAGIC :x 1394 :y 1164.3 :w 310 :h 114.4 :elt 2043]
               ([INLINE :elt 2045]
                ([INLINE :x 1417 :y 1164.3 :w 264 :h 114.4 :elt 2046]
                 ([BLOCK :x 1417 :y 1164.3 :w 264 :h 115.1 :elt 2047]
                  ([BLOCK :x 1422 :y 1169.3 :w 254 :h 105.1 :elt 2048]
                   ([LINE]
                    ([INLINE :elt 2049]
                     ([INLINE :elt 2050]
                      ([MAGIC :x 1460.1 :y 1169.3 :w 101.6 :h 105.1 :elt 2051]
                       ([MAGIC :x 1460.1 :y 1169.3 :w 101.6 :h 105.1 :elt 2052]
                        ([INLINE :elt 2053]
                         ([INLINE :elt 2054])
                         ([INLINE :x 1460.1 :y (/ 24557 20) :w 0 :h 0 :elt 2055])
                         ([INLINE :elt 2056])))))
                     ([BLOCK :x 1422 :y (/ 75017 60) :w (/ 508 3) :h (/ 1447 60) :elt 2057]
                      ([LINE]
                       ([TEXT :x 1462 :y (/ 3769 3) :w 113 :h 12 :text "Super Ad…(Chocolate)"]))))
                    ([BLOCK :x 1574.4 :y 1169.3 :w 101.6 :h 105.1 :elt 2058]
                     ([BLOCK :x (/ 4733 3) :y (/ 7063 6) :w (/ 268 3) :h (/ 268 3) :elt 2059]
                      ([BLOCK :x (/ 4733 3) :y (/ 7063 6) :w (/ 268 3) :h (/ 268 3) :elt 2060]
                       ([BLOCK :x (/ 4772 3) :y (/ 3613 3) :w (/ 190 3) :h 23 :elt 2061]
                        ([LINE]
                         ([INLINE :elt 2062]
                          ([BLOCK :x (/ 9599 6) :y (/ 3547 3) :w 54 :h 46 :elt 2063]
                           ([LINE]
                            ([TEXT :x (/ 9629 6) :y (/ 3547 3) :w 44 :h 23 :text "USD "]))
                           ([LINE]
                            ([TEXT :x (/ 9599 6) :y (/ 3616 3) :w 54 :h 23 :text "18.68"])))
                          ([INLINE :elt 2064]
                           ([INLINE :elt 2065]
                            ([TEXT :x (/ 9599 6) :y (/ 3619 3) :w 7 :h 14 :text "$"]))
                           ([INLINE :elt 2066]
                            ([TEXT :x (/ 9641 6) :y (/ 3613 3) :w 24 :h 23 :text "18"])
                            ([BLOCK :x (/ 9785 6) :y (/ 3613 3) :w 6 :h 23 :elt 2067]
                             ([LINE]
                              ([TEXT :x (/ 9785 6) :y (/ 3613 3) :w 6 :h 23 :text "."]))))
                           ([INLINE :elt 2068]
                            ([TEXT :x (/ 9785 6) :y (/ 3619 3) :w 14 :h 14 :text "68"]))))))
                       ([ANON]
                        ([LINE]
                         ([INLINE :elt 2069]
                          ([TEXT :x (/ 4804 3) :y (/ 3682 3) :w 42 :h 12 :text "Buy now"]))))))))))
                 ([MAGIC :x 1394 :y (/ 23699 20) :w 80 :h (/ 4387 60) :elt 2085]
                  ([MAGIC :x 1394 :y (/ 23699 20) :w 80 :h (/ 4387 60) :elt 2086]
                   ([MAGIC :x 1394 :y (/ 23699 20) :w 80 :h (/ 4387 60) :elt 2090]
                    ([BLOCK :x 1408 :y (/ 23899 20) :w 52 :h (/ 3187 60) :elt 2091]
                     ([BLOCK :x 1408 :y (/ 23899 20) :w 52 :h 18 :elt 2092]
                      ([LINE]
                       ([TEXT :x 1415 :y (/ 23939 20) :w 38 :h 14 :text "Arrives"])))
                     ([BLOCK :x 1408 :y (/ 24259 20) :w 52 :h 19 :elt 2093]
                      ([LINE]
                       ([TEXT :x 1415.5 :y (/ 24299 20) :w 37 :h 15 :text "Jul 16"])))
                     ([ANON]
                      ([LINE]
                       ([INLINE :elt 2094]
                        ([TEXT :x 1408 :y 1234 :w 52 :h 12 :text "View order"])))))))))
                ([TEXT :x 1681 :y 1266.7 :w 0 :h 15 :text " "])))
              ([MAGIC :x 1704 :y 1164.3 :w 310 :h 114.4 :elt 2196]
               ([BLOCK :x 1704 :y (/ 24157 20) :w 310 :h 27.3 :elt 2197]
                ([LINE]
                 ([INLINE :x 1704 :y (/ 24157 20) :w 176 :h 27.3 :elt 2198]
                  ([LINE]
                   ([INLINE :elt 2199]
                    ([INLINE :elt 2200]
                     ([TEXT :x 1708 :y 1210 :w 168 :h 23 :text "Delete this button"]))))))))))
            ([BLOCK :x 1394 :y 1289.7 :w 310 :h 116.4 :elt 2213]
             ([MAGIC :x 1394 :y 1290.7 :w 620 :h 114.4 :elt 2214]
              ([MAGIC :x 1394 :y 1290.7 :w 310 :h 114.4 :elt 2215]
               ([INLINE :elt 2216]
                ([INLINE :x 1417 :y 1290.7 :w 264 :h 114.4 :elt 2217]
                 ([BLOCK :x 1417 :y 1290.7 :w 264 :h 115.1 :elt 2218]
                  ([BLOCK :x 1422 :y 1295.7 :w 254 :h 105.1 :elt 2219]
                   ([LINE]
                    ([INLINE :elt 2220]
                     ([INLINE :elt 2221]
                      ([MAGIC :x 1460.1 :y 1295.7 :w 101.6 :h 105.1 :elt 2222]
                       ([MAGIC :x 1460.1 :y 1295.7 :w 101.6 :h 105.1 :elt 2223]
                        ([INLINE :elt 2224]
                         ([INLINE :elt 2225])
                         ([INLINE :x 1460.1 :y (/ 5417 4) :w 0 :h 0 :elt 2226])
                         ([INLINE :elt 2227])))))
                     ([BLOCK :x 1422 :y (/ 82601 60) :w 165 :h (/ 1447 60) :elt 2228]
                      ([LINE]
                       ([TEXT :x 1462 :y (/ 20741 15) :w 105 :h 12 :text "8 Cartridges, Regul…"]))))
                    ([BLOCK :x 1574.4 :y 1295.7 :w 101.6 :h 105.1 :elt 2229]
                     ([BLOCK :x (/ 4733 3) :y (/ 39107 30) :w (/ 268 3) :h (/ 268 3) :elt 2230]
                      ([BLOCK :x (/ 4733 3) :y (/ 39107 30) :w (/ 268 3) :h (/ 268 3) :elt 2231]
                       ([BLOCK :x (/ 4772 3) :y (/ 19961 15) :w (/ 190 3) :h 23 :elt 2232]
                        ([LINE]
                         ([INLINE :elt 2233]
                          ([BLOCK :x (/ 9599 6) :y (/ 19631 15) :w 54 :h 46 :elt 2234]
                           ([LINE]
                            ([TEXT :x (/ 9629 6) :y (/ 19631 15) :w 44 :h 23 :text "USD "]))
                           ([LINE]
                            ([TEXT :x (/ 9599 6) :y (/ 19976 15) :w 54 :h 23 :text "19.23"])))
                          ([INLINE :elt 2235]
                           ([INLINE :elt 2236]
                            ([TEXT :x (/ 9599 6) :y (/ 19991 15) :w 7 :h 14 :text "$"]))
                           ([INLINE :elt 2237]
                            ([TEXT :x (/ 9641 6) :y (/ 19961 15) :w 24 :h 23 :text "19"])
                            ([BLOCK :x (/ 9785 6) :y (/ 19961 15) :w 6 :h 23 :elt 2238]
                             ([LINE]
                              ([TEXT :x (/ 9785 6) :y (/ 19961 15) :w 6 :h 23 :text "."]))))
                           ([INLINE :elt 2239]
                            ([TEXT :x (/ 9785 6) :y (/ 19991 15) :w 14 :h 14 :text "23"]))))))
                       ([ANON]
                        ([LINE]
                         ([INLINE :elt 2240]
                          ([TEXT :x (/ 4804 3) :y (/ 20306 15) :w 42 :h 12 :text "Buy now"]))))))))))
                 ([MAGIC :x 1294 :y (/ 26417 20) :w 80 :h (/ 3247 60) :elt 2256]
                  ([MAGIC :x 1294 :y (/ 26417 20) :w 80 :h (/ 3247 60) :elt 2257]
                   ([MAGIC :x 1294 :y (/ 26417 20) :w 80 :h (/ 3247 60) :elt 2261]
                    ([BLOCK :x 1308 :y (/ 26617 20) :w 52 :h (/ 2047 60) :elt 2262]
                     ([BLOCK :x 1308 :y (/ 26617 20) :w 52 :h 18 :elt 2263]
                      ([LINE]
                       ([TEXT :x 1315 :y (/ 26657 20) :w 38 :h 14 :text "Arrives"])))
                     ([BLOCK :x 1308 :y (/ 26977 20) :w 52 :h 0 :elt 2264])
                     ([ANON]
                      ([LINE]
                       ([INLINE :elt 2265]
                        ([TEXT :x 1308 :y 1350.9 :w 52 :h 12 :text "View order"])))))))))
                ([TEXT :x 1681 :y 1393.1 :w 0 :h 15 :text " "])))
              ([MAGIC :x 1704 :y 1290.7 :w 310 :h 114.4 :elt 2271]
               ([BLOCK :x 1704 :y (/ 5337 4) :w 310 :h 27.3 :elt 2272]
                ([LINE]
                 ([INLINE :x 1704 :y (/ 5337 4) :w 176 :h 27.3 :elt 2273]
                  ([LINE]
                   ([INLINE :elt 2274]
                    ([INLINE :elt 2275]
                     ([TEXT :x 1708 :y 1336.4 :w 168 :h 23 :text "Delete this button"]))))))))))
            ([BLOCK :x 1394 :y 1416.1 :w 310 :h 116.4 :elt 2288]
             ([MAGIC :x 1394 :y 1417.1 :w 620 :h 114.4 :elt 2289]
              ([MAGIC :x 1394 :y 1417.1 :w 310 :h 114.4 :elt 2290]
               ([INLINE :elt 2291]
                ([INLINE :x 1417 :y 1417.1 :w 264 :h 114.4 :elt 2292]
                 ([BLOCK :x 1417 :y 1417.1 :w 264 :h 115.1 :elt 2293]
                  ([BLOCK :x 1422 :y 1422.1 :w 254 :h 105.1 :elt 2294]
                   ([LINE]
                    ([INLINE :elt 2295]
                     ([INLINE :elt 2296]
                      ([MAGIC :x 1460.1 :y 1422.1 :w 101.6 :h 105.1 :elt 2297]
                       ([MAGIC :x 1460.1 :y 1422.1 :w 101.6 :h 105.1 :elt 2298]
                        ([INLINE :elt 2299]
                         ([INLINE :elt 2300])
                         ([INLINE :x 1460.1 :y (/ 29613 20) :w 0 :h 0 :elt 2301])
                         ([INLINE :elt 2302]))))))
                    ([BLOCK :x 1574.4 :y 1422.1 :w 101.6 :h 105.1 :elt 2304]
                     ([BLOCK :x (/ 4733 3) :y (/ 42899 30) :w (/ 268 3) :h (/ 268 3) :elt 2305]
                      ([BLOCK :x (/ 4733 3) :y (/ 42899 30) :w (/ 268 3) :h (/ 268 3) :elt 2306]
                       ([BLOCK :x (/ 4772 3) :y (/ 21857 15) :w (/ 190 3) :h 23 :elt 2307]
                        ([LINE]
                         ([INLINE :elt 2308]
                          ([BLOCK :x (/ 9599 6) :y (/ 21527 15) :w 54 :h 46 :elt 2309]
                           ([LINE]
                            ([TEXT :x (/ 9629 6) :y (/ 21527 15) :w 44 :h 23 :text "USD "]))
                           ([LINE]
                            ([TEXT :x (/ 9599 6) :y (/ 21872 15) :w 54 :h 23 :text "25.99"])))
                          ([INLINE :elt 2310]
                           ([INLINE :elt 2311]
                            ([TEXT :x (/ 9599 6) :y (/ 21887 15) :w 7 :h 14 :text "$"]))
                           ([INLINE :elt 2312]
                            ([TEXT :x (/ 9641 6) :y (/ 21857 15) :w 24 :h 23 :text "25"])
                            ([BLOCK :x (/ 9785 6) :y (/ 21857 15) :w 6 :h 23 :elt 2313]
                             ([LINE]
                              ([TEXT :x (/ 9785 6) :y (/ 21857 15) :w 6 :h 23 :text "."]))))
                           ([INLINE :elt 2314]
                            ([TEXT :x (/ 9785 6) :y (/ 21887 15) :w 14 :h 14 :text "99"]))))))
                       ([ANON]
                        ([LINE]
                         ([INLINE :elt 2315]
                          ([TEXT :x (/ 4804 3) :y (/ 22202 15) :w 42 :h 12 :text "Buy now"]))))))))))
                 ([MAGIC :x 1294 :y (/ 5789 4) :w 80 :h (/ 3247 60) :elt 2331]
                  ([MAGIC :x 1294 :y (/ 5789 4) :w 80 :h (/ 3247 60) :elt 2332]
                   ([MAGIC :x 1294 :y (/ 5789 4) :w 80 :h (/ 3247 60) :elt 2336]
                    ([BLOCK :x 1308 :y (/ 5829 4) :w 52 :h (/ 2047 60) :elt 2337]
                     ([BLOCK :x 1308 :y (/ 5829 4) :w 52 :h 18 :elt 2338]
                      ([LINE]
                       ([TEXT :x 1315 :y (/ 5837 4) :w 38 :h 14 :text "Arrives"])))
                     ([BLOCK :x 1308 :y (/ 5901 4) :w 52 :h 0 :elt 2339])
                     ([ANON]
                      ([LINE]
                       ([INLINE :elt 2340]
                        ([TEXT :x 1308 :y 1477.3 :w 52 :h 12 :text "View order"])))))))))
                ([TEXT :x 1681 :y 1519.5 :w 0 :h 15 :text " "])))
              ([MAGIC :x 1704 :y 1417.1 :w 310 :h 114.4 :elt 2346]
               ([BLOCK :x 1704 :y (/ 29213 20) :w 310 :h 27.3 :elt 2347]
                ([LINE]
                 ([INLINE :x 1704 :y (/ 29213 20) :w 176 :h 27.3 :elt 2348]
                  ([LINE]
                   ([INLINE :elt 2349]
                    ([INLINE :elt 2350]
                     ([TEXT :x 1708 :y 1462.8 :w 168 :h 23 :text "Delete this button"]))))))))))
            ([BLOCK :x 1394 :y 1542.5 :w 310 :h 116.4 :elt 2363]
             ([MAGIC :x 1394 :y 1543.5 :w 620 :h 114.4 :elt 2364]
              ([MAGIC :x 1394 :y 1543.5 :w 310 :h 114.4 :elt 2365]
               ([INLINE :elt 2366]
                ([INLINE :x 1417 :y 1543.5 :w 264 :h 114.4 :elt 2367]
                 ([BLOCK :x 1417 :y 1543.5 :w 264 :h 115.1 :elt 2368]
                  ([BLOCK :x 1422 :y 1548.5 :w 254 :h 105.1 :elt 2369]
                   ([LINE]
                    ([INLINE :elt 2370]
                     ([INLINE :elt 2371]
                      ([MAGIC :x 1460.1 :y 1548.5 :w 101.6 :h 105.1 :elt 2372]
                       ([MAGIC :x 1460.1 :y 1548.5 :w 101.6 :h 105.1 :elt 2373]
                        ([INLINE :elt 2374]
                         ([INLINE :elt 2375])
                         ([INLINE :x 1460.1 :y (/ 32141 20) :w 0 :h 0 :elt 2376])
                         ([INLINE :elt 2377])))))
                     ([BLOCK :x 1422 :y (/ 97769 60) :w 166 :h (/ 1447 60) :elt 2378]
                      ([LINE]
                       ([TEXT :x 1462 :y (/ 24533 15) :w 106 :h 12 :text "Super Adva…(Vanilla)"]))))
                    ([BLOCK :x 1574.4 :y 1548.5 :w 101.6 :h 105.1 :elt 2379]
                     ([BLOCK :x (/ 4733 3) :y (/ 46691 30) :w (/ 268 3) :h (/ 268 3) :elt 2380]
                      ([BLOCK :x (/ 4733 3) :y (/ 46691 30) :w (/ 268 3) :h (/ 268 3) :elt 2381]
                       ([BLOCK :x (/ 4772 3) :y (/ 23753 15) :w (/ 190 3) :h 23 :elt 2382]
                        ([LINE]
                         ([INLINE :elt 2383]
                          ([BLOCK :x (/ 9599 6) :y (/ 23423 15) :w 54 :h 46 :elt 2384]
                           ([LINE]
                            ([TEXT :x (/ 9629 6) :y (/ 23423 15) :w 44 :h 23 :text "USD "]))
                           ([LINE]
                            ([TEXT :x (/ 9599 6) :y (/ 23768 15) :w 54 :h 23 :text "22.45"])))
                          ([INLINE :elt 2385]
                           ([INLINE :elt 2386]
                            ([TEXT :x (/ 9599 6) :y (/ 23783 15) :w 7 :h 14 :text "$"]))
                           ([INLINE :elt 2387]
                            ([TEXT :x (/ 9641 6) :y (/ 23753 15) :w 24 :h 23 :text "22"])
                            ([BLOCK :x (/ 9785 6) :y (/ 23753 15) :w 6 :h 23 :elt 2388]
                             ([LINE]
                              ([TEXT :x (/ 9785 6) :y (/ 23753 15) :w 6 :h 23 :text "."]))))
                           ([INLINE :elt 2389]
                            ([TEXT :x (/ 9785 6) :y (/ 23783 15) :w 14 :h 14 :text "45"]))))))
                       ([ANON]
                        ([LINE]
                         ([INLINE :elt 2390]
                          ([TEXT :x (/ 4804 3) :y (/ 24098 15) :w 42 :h 12 :text "Buy now"]))))))))))
                 ([MAGIC :x 1294 :y (/ 31473 20) :w 80 :h (/ 3247 60) :elt 2406]
                  ([MAGIC :x 1294 :y (/ 31473 20) :w 80 :h (/ 3247 60) :elt 2407]
                   ([MAGIC :x 1294 :y (/ 31473 20) :w 80 :h (/ 3247 60) :elt 2411]
                    ([BLOCK :x 1308 :y (/ 31673 20) :w 52 :h (/ 2047 60) :elt 2412]
                     ([BLOCK :x 1308 :y (/ 31673 20) :w 52 :h 18 :elt 2413]
                      ([LINE]
                       ([TEXT :x 1315 :y (/ 31713 20) :w 38 :h 14 :text "Arrives"])))
                     ([BLOCK :x 1308 :y (/ 32033 20) :w 52 :h 0 :elt 2414])
                     ([ANON]
                      ([LINE]
                       ([INLINE :elt 2415]
                        ([TEXT :x 1308 :y 1603.7 :w 52 :h 12 :text "View order"])))))))))
                ([TEXT :x 1681 :y 1645.9 :w 0 :h 15 :text " "])))
              ([MAGIC :x 1704 :y 1543.5 :w 310 :h 114.4 :elt 2421]
               ([BLOCK :x 1704 :y (/ 31741 20) :w 310 :h 27.3 :elt 2422]
                ([LINE]
                 ([INLINE :x 1704 :y (/ 31741 20) :w 176 :h 27.3 :elt 2423]
                  ([LINE]
                   ([INLINE :elt 2424]
                    ([INLINE :elt 2425]
                     ([TEXT :x 1708 :y 1589.2 :w 168 :h 23 :text "Delete this button"]))))))))))
            ([BLOCK :x 1394 :y 1668.9 :w 310 :h 116.4 :elt 2438]
             ([MAGIC :x 1394 :y 1669.9 :w 620 :h 114.4 :elt 2439]
              ([MAGIC :x 1394 :y 1669.9 :w 310 :h 114.4 :elt 2440]
               ([INLINE :elt 2441]
                ([INLINE :x 1417 :y 1669.9 :w 264 :h 114.4 :elt 2442]
                 ([BLOCK :x 1417 :y 1669.9 :w 264 :h 115.1 :elt 2443]
                  ([BLOCK :x 1422 :y 1674.9 :w 254 :h 105.1 :elt 2444]
                   ([LINE]
                    ([INLINE :elt 2445]
                     ([INLINE :elt 2446]
                      ([MAGIC :x 1460.1 :y 1674.9 :w 101.6 :h 105.1 :elt 2447]
                       ([MAGIC :x 1460.1 :y 1674.9 :w 101.6 :h 105.1 :elt 2448]
                        ([INLINE :elt 2449]
                         ([INLINE :elt 2450])
                         ([INLINE :x 1460.1 :y (/ 34669 20) :w 0 :h 0 :elt 2451])
                         ([INLINE :elt 2452])))))
                     ([BLOCK :x 1422 :y (/ 105353 60) :w 166 :h (/ 1447 60) :elt 2453]
                      ([LINE]
                       ([TEXT :x 1462 :y (/ 26429 15) :w 106 :h 12 :text "Quattro Tit…(1-Pack)"]))))
                    ([BLOCK :x 1574.4 :y 1674.9 :w 101.6 :h 105.1 :elt 2454]
                     ([BLOCK :x (/ 4733 3) :y (/ 50483 30) :w (/ 268 3) :h (/ 268 3) :elt 2455]
                      ([BLOCK :x (/ 4733 3) :y (/ 50483 30) :w (/ 268 3) :h (/ 268 3) :elt 2456]
                       ([BLOCK :x (/ 4772 3) :y (/ 25649 15) :w (/ 190 3) :h 23 :elt 2457]
                        ([LINE]
                         ([INLINE :elt 2458]
                          ([BLOCK :x (/ 9599 6) :y (/ 25319 15) :w 54 :h 46 :elt 2459]
                           ([LINE]
                            ([TEXT :x (/ 9629 6) :y (/ 25319 15) :w 44 :h 23 :text "USD "]))
                           ([LINE]
                            ([TEXT :x (/ 9599 6) :y (/ 25664 15) :w 54 :h 23 :text "18.25"])))
                          ([INLINE :elt 2460]
                           ([INLINE :elt 2461]
                            ([TEXT :x (/ 9599 6) :y (/ 25679 15) :w 7 :h 14 :text "$"]))
                           ([INLINE :elt 2462]
                            ([TEXT :x (/ 9641 6) :y (/ 25649 15) :w 24 :h 23 :text "18"])
                            ([BLOCK :x (/ 9785 6) :y (/ 25649 15) :w 6 :h 23 :elt 2463]
                             ([LINE]
                              ([TEXT :x (/ 9785 6) :y (/ 25649 15) :w 6 :h 23 :text "."]))))
                           ([INLINE :elt 2464]
                            ([TEXT :x (/ 9785 6) :y (/ 25679 15) :w 14 :h 14 :text "25"]))))))
                       ([ANON]
                        ([LINE]
                         ([INLINE :elt 2465]
                          ([TEXT :x (/ 4804 3) :y (/ 25994 15) :w 42 :h 12 :text "Buy now"]))))))))))
                 ([MAGIC :x 1294 :y (/ 34001 20) :w 80 :h (/ 3247 60) :elt 2481]
                  ([MAGIC :x 1294 :y (/ 34001 20) :w 80 :h (/ 3247 60) :elt 2482]
                   ([MAGIC :x 1294 :y (/ 34001 20) :w 80 :h (/ 3247 60) :elt 2486]
                    ([BLOCK :x 1308 :y (/ 34201 20) :w 52 :h (/ 2047 60) :elt 2487]
                     ([BLOCK :x 1308 :y (/ 34201 20) :w 52 :h 18 :elt 2488]
                      ([LINE]
                       ([TEXT :x 1315 :y (/ 34241 20) :w 38 :h 14 :text "Arrives"])))
                     ([BLOCK :x 1308 :y (/ 34561 20) :w 52 :h 0 :elt 2489])
                     ([ANON]
                      ([LINE]
                       ([INLINE :elt 2490]
                        ([TEXT :x 1308 :y 1730.1 :w 52 :h 12 :text "View order"])))))))))
                ([TEXT :x 1681 :y 1772.3 :w 0 :h 15 :text " "])))
              ([MAGIC :x 1704 :y 1669.9 :w 310 :h 114.4 :elt 2496]
               ([BLOCK :x 1704 :y (/ 34269 20) :w 310 :h 27.3 :elt 2497]
                ([LINE]
                 ([INLINE :x 1704 :y (/ 34269 20) :w 176 :h 27.3 :elt 2498]
                  ([LINE]
                   ([INLINE :elt 2499]
                    ([INLINE :elt 2500]
                     ([TEXT :x 1708 :y 1715.6 :w 168 :h 23 :text "Delete this button"]))))))))))
            ([BLOCK :x 1394 :y 1795.3 :w 310 :h 116.4 :elt 2513]
             ([MAGIC :x 1394 :y 1796.3 :w 620 :h 114.4 :elt 2514]
              ([MAGIC :x 1394 :y 1796.3 :w 310 :h 114.4 :elt 2515]
               ([INLINE :elt 2516]
                ([INLINE :x 1417 :y 1796.3 :w 264 :h 114.4 :elt 2517]
                 ([BLOCK :x 1417 :y 1796.3 :w 264 :h 115.1 :elt 2518]
                  ([BLOCK :x 1422 :y 1801.3 :w 254 :h 105.1 :elt 2519]
                   ([LINE]
                    ([INLINE :elt 2520]
                     ([INLINE :elt 2521]
                      ([MAGIC :x 1460.1 :y 1801.3 :w 101.6 :h 105.1 :elt 2522]
                       ([MAGIC :x 1460.1 :y 1801.3 :w 101.6 :h 105.1 :elt 2523]
                        ([INLINE :elt 2524]
                         ([INLINE :elt 2525])
                         ([INLINE :x 1460.1 :y (/ 37197 20) :w 0 :h 0 :elt 2526])
                         ([INLINE :elt 2527]))))))
                    ([BLOCK :x 1574.4 :y 1801.3 :w 101.6 :h 105.1 :elt 2529]
                     ([BLOCK :x (/ 4733 3) :y (/ 10855 6) :w (/ 268 3) :h (/ 268 3) :elt 2530]
                      ([BLOCK :x (/ 4733 3) :y (/ 10855 6) :w (/ 268 3) :h (/ 268 3) :elt 2531]
                       ([BLOCK :x (/ 4772 3) :y (/ 5509 3) :w (/ 190 3) :h 23 :elt 2532]
                        ([LINE]
                         ([INLINE :elt 2533]
                          ([BLOCK :x (/ 9599 6) :y (/ 5443 3) :w 54 :h 46 :elt 2534]
                           ([LINE]
                            ([TEXT :x (/ 9629 6) :y (/ 5443 3) :w 44 :h 23 :text "USD "]))
                           ([LINE]
                            ([TEXT :x (/ 9599 6) :y (/ 5512 3) :w 54 :h 23 :text "12.29"])))
                          ([INLINE :elt 2535]
                           ([INLINE :elt 2536]
                            ([TEXT :x (/ 9599 6) :y (/ 5515 3) :w 7 :h 14 :text "$"]))
                           ([INLINE :elt 2537]
                            ([TEXT :x (/ 9641 6) :y (/ 5509 3) :w 24 :h 23 :text "12"])
                            ([BLOCK :x (/ 9785 6) :y (/ 5509 3) :w 6 :h 23 :elt 2538]
                             ([LINE]
                              ([TEXT :x (/ 9785 6) :y (/ 5509 3) :w 6 :h 23 :text "."]))))
                           ([INLINE :elt 2539]
                            ([TEXT :x (/ 9785 6) :y (/ 5515 3) :w 14 :h 14 :text "29"]))))))
                       ([ANON]
                        ([LINE]
                         ([INLINE :elt 2540]
                          ([TEXT :x (/ 4804 3) :y (/ 5578 3) :w 42 :h 12 :text "Buy now"]))))))))))
                 ([MAGIC :x 1294 :y (/ 36529 20) :w 80 :h (/ 3247 60) :elt 2556]
                  ([MAGIC :x 1294 :y (/ 36529 20) :w 80 :h (/ 3247 60) :elt 2557]
                   ([MAGIC :x 1294 :y (/ 36529 20) :w 80 :h (/ 3247 60) :elt 2561]
                    ([BLOCK :x 1308 :y (/ 36729 20) :w 52 :h (/ 2047 60) :elt 2562]
                     ([BLOCK :x 1308 :y (/ 36729 20) :w 52 :h 18 :elt 2563]
                      ([LINE]
                       ([TEXT :x 1315 :y (/ 36769 20) :w 38 :h 14 :text "Arrives"])))
                     ([BLOCK :x 1308 :y (/ 37089 20) :w 52 :h 0 :elt 2564])
                     ([ANON]
                      ([LINE]
                       ([INLINE :elt 2565]
                        ([TEXT :x 1308 :y 1856.5 :w 52 :h 12 :text "View order"])))))))))
                ([TEXT :x 1681 :y 1898.7 :w 0 :h 15 :text " "])))
              ([MAGIC :x 1704 :y 1796.3 :w 310 :h 114.4 :elt 2571]
               ([BLOCK :x 1704 :y (/ 36797 20) :w 310 :h 27.3 :elt 2572]
                ([LINE]
                 ([INLINE :x 1704 :y (/ 36797 20) :w 176 :h 27.3 :elt 2573]
                  ([LINE]
                   ([INLINE :elt 2574]
                    ([INLINE :elt 2575]
                     ([TEXT :x 1708 :y 1842 :w 168 :h 23 :text "Delete this button"]))))))))))
            ([ANON]
             ([LINE]
              ([INLINE :elt 2588]
               ([TEXT :x 1473 :y 1923.7 :w 152 :h 15 :text " See all your Dash Buttons "])))))))
         ([BLOCK :x 1417 :y 1962.7 :w 264 :h 1 :elt 2594])
         ([BLOCK :x 1417 :y 1978.7 :w 264 :h 350 :elt 2595]
          ([BLOCK :x 1417 :y 1978.7 :w 264 :h 350 :elt 2596]
           ([BLOCK :x 1417 :y 1978.7 :w 264 :h 350 :elt 2598]
            ([BLOCK :x 889 :y 1978.7 :w 1320 :h 350 :elt 2599]
             ([LINE]
              ([INLINE :x 1417 :y 1978.7 :w 264 :h 350 :elt 2600]
               ([ANON]
                ([LINE]
                 ([INLINE :x 1417 :y 1978.7 :w 264 :h 350 :elt 2601]
                  ([LINE]
                   ([INLINE :x 1417 :y 1978.7 :w 264 :h 350 :elt 2602])))))
               ([BLOCK :x 1417 :y 2328.7 :w 264 :h 0 :elt 2603])))))))
         ([BLOCK :x 1417 :y 2343.7 :w 264 :h 1 :elt 2605]))))
      ([BLOCK :x 204 :y (/ 75911 30) :w 1500 :h 1741.5 :elt 2637]
       ([BLOCK :x 204 :y (/ 75911 30) :w 1500 :h 1741.5 :elt 2638]
        ([BLOCK :x 204 :y (/ 75911 30) :w 1190 :h 0 :elt 2639]
         ([BLOCK :x 204 :y (/ 75911 30) :w 1190 :h 1741.5 :elt 2640]
          ([BLOCK :x 204 :y (/ 75911 30) :w 1190 :h 1741.5 :elt 2641]
           ([BLOCK :x 224 :y (/ 76061 30) :w 1150 :h 329 :elt 2642]
            ([BLOCK :x 236 :y (/ 76241 30) :w 1126 :h 305 :elt 2643]
             ([BLOCK :x 244 :y (/ 76241 30) :w 1110 :h 305 :elt 2645]
              ([ANON]
               ([LINE]
                ([INLINE :x 244 :y (/ 76241 30) :w 1110 :h 286 :elt 2646])))
              ([BLOCK :x 244 :y (/ 84851 30) :w 1110 :h 20 :elt 2647]
               ([BLOCK :x 1276 :y (/ 84911 30) :w 78 :h 14 :elt 2648]
                ([LINE]
                 ([INLINE :elt 2649]
                  ([TEXT :x 1276 :y (/ 84911 30) :w 64 :h 12 :text " Ad feedback "])
                  ([INLINE :x 1340 :y (/ 84941 30) :w 14 :h 12 :elt 2650]))))))))
           ([BLOCK :x 224 :y (/ 85931 30) :w 1150 :h 1 :elt 2653])
           ([BLOCK :x 224 :y (/ 86561 30) :w 1150 :h 239 :elt 2655]
            ([BLOCK :x 224 :y (/ 86921 30) :w 1150 :h 200 :elt 2656]
             ([BLOCK :x 224 :y (/ 86921 30) :w 562.9 :h 200 :elt 2657]
              ([LINE]
               ([INLINE :x 224 :y (/ 86921 30) :w 562.9 :h 200 :elt 2658]
                ([BLOCK :x 234 :y (/ 86921 30) :w 542.9 :h 200 :elt 2659]
                 ([BLOCK :x (/ 5709 20) :y (/ 86921 30) :w 440 :h 200 :elt 2661]
                  ([LINE]
                   ([INLINE :x (/ 5709 20) :y (/ 86921 30) :w 440 :h 200 :elt 2662])))))))
             ([BLOCK :x 811.1 :y (/ 86921 30) :w 562.9 :h 200 :elt 2664]
              ([LINE]
               ([INLINE :x 811.1 :y (/ 86921 30) :w 562.9 :h 200 :elt 2665]
                ([BLOCK :x 821.1 :y (/ 86921 30) :w 542.9 :h 200 :elt 2666]
                 ([BLOCK :x 821.1 :y (/ 86921 30) :w 542.9 :h 200 :elt 2668]
                  ([BLOCK :x -264.7 :y (/ 86921 30) :w 2714.5 :h 200 :elt 2669]
                   ([LINE]
                    ([INLINE :x (/ 17451 20) :y (/ 86921 30) :w 440 :h 200 :elt 2670]
                     ([BLOCK :x (/ 17451 20) :y (/ 86921 30) :w 440 :h 200 :elt 2671]
                      ([LINE]
                       ([INLINE :x (/ 17451 20) :y (/ 86921 30) :w 440 :h 200 :elt 2672])))
                     ([BLOCK :x (/ 17451 20) :y (/ 92921 30) :w 440 :h 0 :elt 2673])))))))))))
           ([BLOCK :x 224 :y (/ 93731 30) :w 1150 :h 1 :elt 2675])
           ([BLOCK :x 224 :y (/ 94361 30) :w 1150 :h 286.5 :elt 2676]
            ([BLOCK :x 224 :y (/ 94361 30) :w 1150 :h 286.5 :elt 2677]
             ([BLOCK :x 244 :y (/ 94961 30) :w 1110 :h 31.5 :elt 2678]
              ([BLOCK :x 244 :y (/ 94961 30) :w 418 :h 31.5 :elt 2679]
               ([LINE]
                ([INLINE :elt 2680]
                 ([TEXT :x 244 :y (/ 190177 60) :w 418 :h 23 :text "Recommended for you in Kindle Magazines"]))))
              ([BLOCK :x 662 :y (/ 94961 30) :w 15 :h 0 :elt 2681]))
             ([BLOCK :x 244 :y (/ 47953 15) :w 1110 :h 220 :elt 2682]
              ([BLOCK :x 244 :y (/ 47953 15) :w 1110 :h 220 :elt 2683]
               ([LINE]
                ([INLINE :x 244 :y (/ 47953 15) :w 3089 :h 200 :elt 2684]
                 ([LINE]
                  ([INLINE :x 244 :y (/ 47953 15) :w 147 :h 200 :elt 2685]
                   ([LINE]
                    ([INLINE :x 244 :y (/ 47953 15) :w 147 :h 200 :elt 2686]
                     ([LINE]
                      ([INLINE :x 244 :y (/ 47953 15) :w 147 :h 200 :elt 2687]
                       ([LINE]
                        ([INLINE :x 244 :y (/ 47953 15) :w 147 :h 200 :elt 2688])))))))
                  ([TEXT :x 401 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 405 :y (/ 47953 15) :w 146 :h 200 :elt 2689]
                   ([LINE]
                    ([INLINE :x 405 :y (/ 47953 15) :w 146 :h 200 :elt 2690]
                     ([LINE]
                      ([INLINE :x 405 :y (/ 47953 15) :w 146 :h 200 :elt 2691]
                       ([LINE]
                        ([INLINE :x 405 :y (/ 47953 15) :w 146 :h 200 :elt 2692])))))))
                  ([TEXT :x 561 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 565 :y (/ 47953 15) :w 148 :h 200 :elt 2693]
                   ([LINE]
                    ([INLINE :x 565 :y (/ 47953 15) :w 148 :h 200 :elt 2694]
                     ([LINE]
                      ([INLINE :x 565 :y (/ 47953 15) :w 148 :h 200 :elt 2695]
                       ([LINE]
                        ([INLINE :x 565 :y (/ 47953 15) :w 148 :h 200 :elt 2696])))))))
                  ([TEXT :x 723 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 727 :y (/ 47953 15) :w 147 :h 200 :elt 2697]
                   ([LINE]
                    ([INLINE :x 727 :y (/ 47953 15) :w 147 :h 200 :elt 2698]
                     ([LINE]
                      ([INLINE :x 727 :y (/ 47953 15) :w 147 :h 200 :elt 2699]
                       ([LINE]
                        ([INLINE :x 727 :y (/ 47953 15) :w 147 :h 200 :elt 2700])))))))
                  ([TEXT :x 884 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 888 :y (/ 47953 15) :w 150 :h 200 :elt 2701]
                   ([LINE]
                    ([INLINE :x 888 :y (/ 47953 15) :w 150 :h 200 :elt 2702]
                     ([LINE]
                      ([INLINE :x 888 :y (/ 47953 15) :w 150 :h 200 :elt 2703]
                       ([LINE]
                        ([INLINE :x 888 :y (/ 47953 15) :w 150 :h 200 :elt 2704])))))))
                  ([TEXT :x 1048 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1052 :y (/ 47953 15) :w 150 :h 200 :elt 2705]
                   ([LINE]
                    ([INLINE :x 1052 :y (/ 47953 15) :w 150 :h 200 :elt 2706]
                     ([LINE]
                      ([INLINE :x 1052 :y (/ 47953 15) :w 150 :h 200 :elt 2707]
                       ([LINE]
                        ([INLINE :x 1052 :y (/ 47953 15) :w 150 :h 200 :elt 2708])))))))
                  ([TEXT :x 1212 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1216 :y (/ 47953 15) :w 150 :h 200 :elt 2709]
                   ([LINE]
                    ([INLINE :x 1216 :y (/ 47953 15) :w 150 :h 200 :elt 2710]
                     ([LINE]
                      ([INLINE :x 1216 :y (/ 47953 15) :w 150 :h 200 :elt 2711]
                       ([LINE]
                        ([INLINE :x 1216 :y (/ 47953 15) :w 150 :h 200 :elt 2712])))))))
                  ([TEXT :x 1376 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1380 :y (/ 47953 15) :w 147 :h 200 :elt 2713]
                   ([LINE]
                    ([INLINE :x 1380 :y (/ 47953 15) :w 147 :h 200 :elt 2714]
                     ([LINE]
                      ([INLINE :x 1380 :y (/ 47953 15) :w 147 :h 200 :elt 2715]
                       ([LINE]
                        ([INLINE :x 1380 :y (/ 47953 15) :w 147 :h 200 :elt 2716])))))))
                  ([TEXT :x 1537 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1541 :y (/ 47953 15) :w 168 :h 200 :elt 2717]
                   ([LINE]
                    ([INLINE :x 1541 :y (/ 47953 15) :w 168 :h 200 :elt 2718]
                     ([LINE]
                      ([INLINE :x 1541 :y (/ 47953 15) :w 168 :h 200 :elt 2719]
                       ([LINE]
                        ([INLINE :x 1541 :y (/ 47953 15) :w 168 :h 200 :elt 2720])))))))
                  ([TEXT :x 1719 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1723 :y (/ 47953 15) :w 152 :h 200 :elt 2721]
                   ([LINE]
                    ([INLINE :x 1723 :y (/ 47953 15) :w 152 :h 200 :elt 2722]
                     ([LINE]
                      ([INLINE :x 1723 :y (/ 47953 15) :w 152 :h 200 :elt 2723]
                       ([LINE]
                        ([INLINE :x 1723 :y (/ 47953 15) :w 152 :h 200 :elt 2724])))))))
                  ([TEXT :x 1885 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1889 :y (/ 47953 15) :w 146 :h 200 :elt 2725]
                   ([LINE]
                    ([INLINE :x 1889 :y (/ 47953 15) :w 146 :h 200 :elt 2726]
                     ([LINE]
                      ([INLINE :x 1889 :y (/ 47953 15) :w 146 :h 200 :elt 2727]
                       ([LINE]
                        ([INLINE :x 1889 :y (/ 47953 15) :w 146 :h 200 :elt 2728])))))))
                  ([TEXT :x 2045 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 2049 :y (/ 47953 15) :w 147 :h 200 :elt 2729]
                   ([LINE]
                    ([INLINE :x 2049 :y (/ 47953 15) :w 147 :h 200 :elt 2730]
                     ([LINE]
                      ([INLINE :x 2049 :y (/ 47953 15) :w 147 :h 200 :elt 2731]
                       ([LINE]
                        ([INLINE :x 2049 :y (/ 47953 15) :w 147 :h 200 :elt 2732])))))))
                  ([TEXT :x 2206 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 2210 :y (/ 47953 15) :w 152 :h 200 :elt 2733]
                   ([LINE]
                    ([INLINE :x 2210 :y (/ 47953 15) :w 152 :h 200 :elt 2734]
                     ([LINE]
                      ([INLINE :x 2210 :y (/ 47953 15) :w 152 :h 200 :elt 2735]
                       ([LINE]
                        ([INLINE :x 2210 :y (/ 47953 15) :w 152 :h 200 :elt 2736])))))))
                  ([TEXT :x 2372 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 2376 :y (/ 47953 15) :w 145 :h 200 :elt 2737]
                   ([LINE]
                    ([INLINE :x 2376 :y (/ 47953 15) :w 145 :h 200 :elt 2738]
                     ([LINE]
                      ([INLINE :x 2377 :y (/ 47953 15) :w 143 :h 200 :elt 2739]
                       ([LINE]
                        ([INLINE :x 2377 :y (/ 47953 15) :w 143 :h 200 :elt 2740])))))))
                  ([TEXT :x 2531 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 2535 :y (/ 47953 15) :w 148 :h 200 :elt 2741]
                   ([LINE]
                    ([INLINE :x 2535 :y (/ 47953 15) :w 148 :h 200 :elt 2742]
                     ([LINE]
                      ([INLINE :x 2535 :y (/ 47953 15) :w 148 :h 200 :elt 2743]
                       ([LINE]
                        ([INLINE :x 2535 :y (/ 47953 15) :w 148 :h 200 :elt 2744])))))))
                  ([TEXT :x 2693 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 2697 :y (/ 47953 15) :w 147 :h 200 :elt 2745]
                   ([LINE]
                    ([INLINE :x 2697 :y (/ 47953 15) :w 147 :h 200 :elt 2746]
                     ([LINE]
                      ([INLINE :x 2697 :y (/ 47953 15) :w 147 :h 200 :elt 2747]
                       ([LINE]
                        ([INLINE :x 2697 :y (/ 47953 15) :w 147 :h 200 :elt 2748])))))))
                  ([TEXT :x 2854 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 2858 :y (/ 47953 15) :w 149 :h 200 :elt 2749]
                   ([LINE]
                    ([INLINE :x 2858 :y (/ 47953 15) :w 149 :h 200 :elt 2750]
                     ([LINE]
                      ([INLINE :x 2858 :y (/ 47953 15) :w 149 :h 200 :elt 2751]
                       ([LINE]
                        ([INLINE :x 2858 :y (/ 47953 15) :w 149 :h 200 :elt 2752])))))))
                  ([TEXT :x 3017 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 3021 :y (/ 47953 15) :w 153 :h 200 :elt 2753]
                   ([LINE]
                    ([INLINE :x 3021 :y (/ 47953 15) :w 153 :h 200 :elt 2754]
                     ([LINE]
                      ([INLINE :x 3021 :y (/ 47953 15) :w 153 :h 200 :elt 2755]
                       ([LINE]
                        ([INLINE :x 3021 :y (/ 47953 15) :w 153 :h 200 :elt 2756])))))))
                  ([TEXT :x 3184 :y (/ 47983 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 3188 :y (/ 47953 15) :w 145 :h 200 :elt 2757]
                   ([LINE]
                    ([INLINE :x 3188 :y (/ 47953 15) :w 145 :h 200 :elt 2758]
                     ([LINE]
                      ([INLINE :x 3190.5 :y (/ 47953 15) :w 140 :h 200 :elt 2759]
                       ([LINE]
                        ([INLINE :x 3190.5 :y (/ 47953 15) :w 140 :h 200 :elt 2760])))))))))
                ([TEXT :x 3333 :y (/ 47983 15) :w 0 :h 15 :text " "])))
              ([BLOCK :x 244 :y (/ 51163 15) :w 1110 :h 6 :elt 2767]
               ([BLOCK :x 244 :y (/ 51193 15) :w 1110 :h 1 :elt 2768])))))
           ([BLOCK :x 224 :y (/ 51478 15) :w 1150 :h 290 :elt 2774]
            ([BLOCK :x 224 :y (/ 51478 15) :w 1150 :h 290 :elt 2775]
             ([BLOCK :x 244 :y (/ 51778 15) :w 1110 :h 35 :elt 2776]
              ([BLOCK :x 244 :y (/ 51778 15) :w 297 :h 31.5 :elt 2777]
               ([LINE]
                ([INLINE :elt 2778]
                 ([TEXT :x 244 :y (/ 207367 60) :w 297 :h 23 :text "Related to items you've viewed"]))))
              ([BLOCK :x 541 :y (/ 51778 15) :w 77 :h 35 :elt 2779]
               ([LINE]
                ([INLINE :elt 2780]
                 ([TEXT :x 556 :y (/ 103841 30) :w 62 :h 16 :text "See more"])))))
             ([BLOCK :x 244 :y (/ 52303 15) :w 1110 :h 220 :elt 2781]
              ([BLOCK :x 244 :y (/ 52303 15) :w 1110 :h 220 :elt 2782]
               ([LINE]
                ([INLINE :x 244 :y (/ 52303 15) :w 2757 :h 200 :elt 2783]
                 ([LINE]
                  ([INLINE :x 244 :y (/ 52303 15) :w 145 :h 200 :elt 2784]
                   ([LINE]
                    ([INLINE :x 244 :y (/ 52303 15) :w 145 :h 200 :elt 2785]
                     ([LINE]
                      ([INLINE :x 252.5 :y (/ 52303 15) :w 128 :h 200 :elt 2786]
                       ([LINE]
                        ([INLINE :x 252.5 :y (/ 52303 15) :w 128 :h 200 :elt 2787])))))))
                  ([TEXT :x 399 :y (/ 52333 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 403 :y (/ 52303 15) :w 145 :h 200 :elt 2788]
                   ([LINE]
                    ([INLINE :x 403 :y (/ 52303 15) :w 145 :h 200 :elt 2789]
                     ([LINE]
                      ([INLINE :x 410.5 :y (/ 52303 15) :w 130 :h 200 :elt 2790]
                       ([LINE]
                        ([INLINE :x 410.5 :y (/ 52303 15) :w 130 :h 200 :elt 2791])))))))
                  ([TEXT :x 558 :y (/ 52333 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 562 :y (/ 52303 15) :w 145 :h 200 :elt 2792]
                   ([LINE]
                    ([INLINE :x 562 :y (/ 52303 15) :w 145 :h 200 :elt 2793]
                     ([LINE]
                      ([INLINE :x 566 :y (/ 52303 15) :w 137 :h 200 :elt 2794]
                       ([LINE]
                        ([INLINE :x 566 :y (/ 52303 15) :w 137 :h 200 :elt 2795])))))))
                  ([TEXT :x 717 :y (/ 52333 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 721 :y (/ 52303 15) :w 145 :h 200 :elt 2796]
                   ([LINE]
                    ([INLINE :x 721 :y (/ 52303 15) :w 145 :h 200 :elt 2797]
                     ([LINE]
                      ([INLINE :x 727 :y (/ 52303 15) :w 133 :h 200 :elt 2798]
                       ([LINE]
                        ([INLINE :x 727 :y (/ 52303 15) :w 133 :h 200 :elt 2799])))))))
                  ([TEXT :x 876 :y (/ 52333 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 880 :y (/ 52303 15) :w 155 :h 200 :elt 2800]
                   ([LINE]
                    ([INLINE :x 880 :y (/ 52303 15) :w 155 :h 200 :elt 2801]
                     ([LINE]
                      ([INLINE :x 880 :y (/ 52303 15) :w 155 :h 200 :elt 2802]
                       ([LINE]
                        ([INLINE :x 880 :y (/ 52303 15) :w 155 :h 200 :elt 2803])))))))
                  ([TEXT :x 1045 :y (/ 52333 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1049 :y (/ 52303 15) :w 145 :h 200 :elt 2804]
                   ([LINE]
                    ([INLINE :x 1049 :y (/ 52303 15) :w 145 :h 200 :elt 2805]
                     ([LINE]
                      ([INLINE :x 1054.5 :y (/ 52303 15) :w 134 :h 200 :elt 2806]
                       ([LINE]
                        ([INLINE :x 1054.5 :y (/ 52303 15) :w 134 :h 200 :elt 2807])))))))
                  ([TEXT :x 1204 :y (/ 52333 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1208 :y (/ 52303 15) :w 145 :h 200 :elt 2808]
                   ([LINE]
                    ([INLINE :x 1208 :y (/ 52303 15) :w 145 :h 200 :elt 2809]
                     ([LINE]
                      ([INLINE :x 1214 :y (/ 52303 15) :w 133 :h 200 :elt 2810]
                       ([LINE]
                        ([INLINE :x 1214 :y (/ 52303 15) :w 133 :h 200 :elt 2811])))))))
                  ([TEXT :x 1363 :y (/ 52333 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1367 :y (/ 52303 15) :w 258 :h 200 :elt 2812]
                   ([LINE]
                    ([INLINE :x 1367 :y (/ 52303 15) :w 258 :h 200 :elt 2813]
                     ([LINE]
                      ([INLINE :x 1367 :y (/ 52303 15) :w 258 :h 200 :elt 2814]
                       ([LINE]
                        ([INLINE :x 1367 :y (/ 52303 15) :w 258 :h 200 :elt 2815])))))))
                  ([TEXT :x 1635 :y (/ 52333 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1639 :y (/ 52303 15) :w 145 :h 200 :elt 2816]
                   ([LINE]
                    ([INLINE :x 1639 :y (/ 52303 15) :w 145 :h 200 :elt 2817]
                     ([LINE]
                      ([INLINE :x 1646 :y (/ 52303 15) :w 131 :h 200 :elt 2818]
                       ([LINE]
                        ([INLINE :x 1646 :y (/ 52303 15) :w 131 :h 200 :elt 2819])))))))
                  ([TEXT :x 1794 :y (/ 52333 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1798 :y (/ 52303 15) :w 150 :h 200 :elt 2820]
                   ([LINE]
                    ([INLINE :x 1798 :y (/ 52303 15) :w 150 :h 200 :elt 2821]
                     ([LINE]
                      ([INLINE :x 1798 :y (/ 52303 15) :w 150 :h 200 :elt 2822]
                       ([LINE]
                        ([INLINE :x 1798 :y (/ 52303 15) :w 150 :h 200 :elt 2823])))))))
                  ([TEXT :x 1958 :y (/ 52333 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1962 :y (/ 52303 15) :w 145 :h 200 :elt 2824]
                   ([LINE]
                    ([INLINE :x 1962 :y (/ 52303 15) :w 145 :h 200 :elt 2825]
                     ([LINE]
                      ([INLINE :x 1969 :y (/ 52303 15) :w 131 :h 200 :elt 2826]
                       ([LINE]
                        ([INLINE :x 1969 :y (/ 52303 15) :w 131 :h 200 :elt 2827])))))))
                  ([TEXT :x 2117 :y (/ 52333 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 2121 :y (/ 52303 15) :w 235 :h 200 :elt 2828]
                   ([LINE]
                    ([INLINE :x 2121 :y (/ 52303 15) :w 235 :h 200 :elt 2829]
                     ([LINE]
                      ([INLINE :x 2121 :y (/ 52303 15) :w 235 :h 200 :elt 2830]
                       ([LINE]
                        ([INLINE :x 2121 :y (/ 52303 15) :w 235 :h 200 :elt 2831])))))))
                  ([TEXT :x 2366 :y (/ 52333 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 2370 :y (/ 52303 15) :w 154 :h 200 :elt 2832]
                   ([LINE]
                    ([INLINE :x 2370 :y (/ 52303 15) :w 154 :h 200 :elt 2833]
                     ([LINE]
                      ([INLINE :x 2370 :y (/ 52303 15) :w 154 :h 200 :elt 2834]
                       ([LINE]
                        ([INLINE :x 2370 :y (/ 52303 15) :w 154 :h 200 :elt 2835])))))))
                  ([TEXT :x 2534 :y (/ 52333 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 2538 :y (/ 52303 15) :w 145 :h 200 :elt 2836]
                   ([LINE]
                    ([INLINE :x 2538 :y (/ 52303 15) :w 145 :h 200 :elt 2837]
                     ([LINE]
                      ([INLINE :x 2544 :y (/ 52303 15) :w 133 :h 200 :elt 2838]
                       ([LINE]
                        ([INLINE :x 2544 :y (/ 52303 15) :w 133 :h 200 :elt 2839])))))))
                  ([TEXT :x 2693 :y (/ 52333 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 2697 :y (/ 52303 15) :w 145 :h 200 :elt 2840]
                   ([LINE]
                    ([INLINE :x 2697 :y (/ 52303 15) :w 145 :h 200 :elt 2841]
                     ([LINE]
                      ([INLINE :x 2703.5 :y (/ 52303 15) :w 132 :h 200 :elt 2842]
                       ([LINE]
                        ([INLINE :x 2703.5 :y (/ 52303 15) :w 132 :h 200 :elt 2843])))))))
                  ([TEXT :x 2852 :y (/ 52333 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 2856 :y (/ 52303 15) :w 145 :h 200 :elt 2844]
                   ([LINE]
                    ([INLINE :x 2856 :y (/ 52303 15) :w 145 :h 200 :elt 2845]
                     ([LINE]
                      ([INLINE :x 2859.5 :y (/ 52303 15) :w 138 :h 200 :elt 2846]
                       ([LINE]
                        ([INLINE :x 2859.5 :y (/ 52303 15) :w 138 :h 200 :elt 2847])))))))))
                ([TEXT :x 3001 :y (/ 52333 15) :w 0 :h 15 :text " "])))
              ([BLOCK :x 244 :y (/ 55513 15) :w 1110 :h 6 :elt 2854]
               ([BLOCK :x 244 :y (/ 55543 15) :w 1110 :h 1 :elt 2855])))))
           ([BLOCK :x 224 :y (/ 55828 15) :w 1150 :h 239 :elt 2862]
            ([BLOCK :x 224 :y (/ 56008 15) :w 1150 :h 200 :elt 2863]
             ([BLOCK :x 224 :y (/ 56008 15) :w 562.9 :h 200 :elt 2864]
              ([LINE]
               ([INLINE :x 224 :y (/ 56008 15) :w 562.9 :h 200 :elt 2865]
                ([BLOCK :x 234 :y (/ 56008 15) :w 542.9 :h 200 :elt 2866]
                 ([BLOCK :x (/ 5709 20) :y (/ 56008 15) :w 440 :h 200 :elt 2868]
                  ([LINE]
                   ([INLINE :x (/ 5709 20) :y (/ 56008 15) :w 440 :h 200 :elt 2869])))))))
             ([BLOCK :x 811.1 :y (/ 56008 15) :w 562.9 :h 200 :elt 2871]
              ([LINE]
               ([INLINE :x 811.1 :y (/ 56008 15) :w 562.9 :h 200 :elt 2872]
                ([BLOCK :x 821.1 :y (/ 56008 15) :w 542.9 :h 200 :elt 2873]
                 ([BLOCK :x (/ 17451 20) :y (/ 56008 15) :w 440 :h 200 :elt 2875]
                  ([LINE]
                   ([INLINE :x (/ 17451 20) :y (/ 56008 15) :w 440 :h 200 :elt 2876])))))))))
           ([BLOCK :x 224 :y (/ 59413 15) :w 1150 :h 1 :elt 2878])
           ([BLOCK :x 224 :y (/ 59728 15) :w 1150 :h 290 :elt 2879]
            ([BLOCK :x 224 :y (/ 59728 15) :w 1150 :h 290 :elt 2880]
             ([BLOCK :x 244 :y (/ 60028 15) :w 1110 :h 35 :elt 2881]
              ([BLOCK :x 244 :y (/ 60028 15) :w 256 :h 31.5 :elt 2882]
               ([LINE]
                ([INLINE :elt 2883]
                 ([TEXT :x 244 :y (/ 240367 60) :w 256 :h 23 :text "Toys & Games best sellers "]))))
              ([BLOCK :x 500 :y (/ 60028 15) :w 77 :h 35 :elt 2884]
               ([LINE]
                ([INLINE :elt 2885]
                 ([TEXT :x 515 :y (/ 120341 30) :w 62 :h 16 :text "See more"])))))
             ([BLOCK :x 244 :y (/ 60553 15) :w 1110 :h 220 :elt 2886]
              ([BLOCK :x 244 :y (/ 60553 15) :w 1110 :h 220 :elt 2887]
               ([LINE]
                ([INLINE :x 244 :y (/ 60553 15) :w 4557 :h 200 :elt 2888]
                 ([LINE]
                  ([INLINE :x 244 :y (/ 60553 15) :w 192 :h 200 :elt 2889]
                   ([LINE]
                    ([INLINE :x 244 :y (/ 60553 15) :w 192 :h 200 :elt 2890]
                     ([LINE]
                      ([INLINE :x 244 :y (/ 60553 15) :w 192 :h 200 :elt 2891]
                       ([LINE]
                        ([INLINE :x 244 :y (/ 60553 15) :w 192 :h 200 :elt 2892])))))))
                  ([TEXT :x 446 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 450 :y (/ 60553 15) :w 270 :h 200 :elt 2893]
                   ([LINE]
                    ([INLINE :x 450 :y (/ 60632 15) :w 270 :h (/ 2842 15) :elt 2894]
                     ([LINE]
                      ([INLINE :x 450 :y (/ 60632 15) :w 270 :h (/ 2842 15) :elt 2895]
                       ([LINE]
                        ([INLINE :x 450 :y (/ 60632 15) :w 270 :h (/ 2842 15) :elt 2896])))))))
                  ([TEXT :x 730 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 734 :y (/ 60553 15) :w 270 :h 200 :elt 2897]
                   ([LINE]
                    ([INLINE :x 734 :y (/ 48533 12) :w 270 :h (/ 2219 12) :elt 2898]
                     ([LINE]
                      ([INLINE :x 734 :y (/ 48533 12) :w 270 :h (/ 2219 12) :elt 2899]
                       ([LINE]
                        ([INLINE :x 734 :y (/ 48533 12) :w 270 :h (/ 2219 12) :elt 2900])))))))
                  ([TEXT :x 1014 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1018 :y (/ 60553 15) :w 270 :h 200 :elt 2901]
                   ([LINE]
                    ([INLINE :x 1018 :y (/ 12185 3) :w 270 :h (/ 1805 12) :elt 2902]
                     ([LINE]
                      ([INLINE :x 1018 :y (/ 12185 3) :w 270 :h (/ 1805 12) :elt 2903]
                       ([LINE]
                        ([INLINE :x 1018 :y (/ 12185 3) :w 270 :h (/ 1805 12) :elt 2904])))))))
                  ([TEXT :x 1298 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1302 :y (/ 60553 15) :w 203 :h 200 :elt 2905]
                   ([LINE]
                    ([INLINE :x 1302 :y (/ 60553 15) :w 203 :h 200 :elt 2906]
                     ([LINE]
                      ([INLINE :x 1302 :y (/ 60553 15) :w 203 :h 200 :elt 2907]
                       ([LINE]
                        ([INLINE :x 1302 :y (/ 60553 15) :w 203 :h 200 :elt 2908])))))))
                  ([TEXT :x 1515 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1519 :y (/ 60553 15) :w 247 :h 200 :elt 2909]
                   ([LINE]
                    ([INLINE :x 1519 :y (/ 60553 15) :w 247 :h 200 :elt 2910]
                     ([LINE]
                      ([INLINE :x 1519 :y (/ 60553 15) :w 247 :h 200 :elt 2911]
                       ([LINE]
                        ([INLINE :x 1519 :y (/ 60553 15) :w 247 :h 200 :elt 2912])))))))
                  ([TEXT :x 1776 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1780 :y (/ 60553 15) :w 185 :h 200 :elt 2913]
                   ([LINE]
                    ([INLINE :x 1780 :y (/ 60553 15) :w 185 :h 200 :elt 2914]
                     ([LINE]
                      ([INLINE :x 1780 :y (/ 60553 15) :w 185 :h 200 :elt 2915]
                       ([LINE]
                        ([INLINE :x 1780 :y (/ 60553 15) :w 185 :h 200 :elt 2916])))))))
                  ([TEXT :x 1975 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 1979 :y (/ 60553 15) :w 265 :h 200 :elt 2917]
                   ([LINE]
                    ([INLINE :x 1979 :y (/ 60553 15) :w 265 :h 200 :elt 2918]
                     ([LINE]
                      ([INLINE :x 1979 :y (/ 60553 15) :w 265 :h 200 :elt 2919]
                       ([LINE]
                        ([INLINE :x 1979 :y (/ 60553 15) :w 265 :h 200 :elt 2920])))))))
                  ([TEXT :x 2254 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 2258 :y (/ 60553 15) :w 145 :h 200 :elt 2921]
                   ([LINE]
                    ([INLINE :x 2258 :y (/ 60553 15) :w 145 :h 200 :elt 2922]
                     ([LINE]
                      ([INLINE :x 2287.5 :y (/ 60553 15) :w 86 :h 200 :elt 2923]
                       ([LINE]
                        ([INLINE :x 2287.5 :y (/ 60553 15) :w 86 :h 200 :elt 2924])))))))
                  ([TEXT :x 2413 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 2417 :y (/ 60553 15) :w 270 :h 200 :elt 2925]
                   ([LINE]
                    ([INLINE :x 2417 :y (/ 122071 30) :w 270 :h (/ 407 3) :elt 2926]
                     ([LINE]
                      ([INLINE :x 2417 :y (/ 122071 30) :w 270 :h (/ 407 3) :elt 2927]
                       ([LINE]
                        ([INLINE :x 2417 :y (/ 122071 30) :w 270 :h (/ 407 3) :elt 2928])))))))
                  ([TEXT :x 2697 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 2701 :y (/ 60553 15) :w 189 :h 200 :elt 2929]
                   ([LINE]
                    ([INLINE :x 2701 :y (/ 60553 15) :w 189 :h 200 :elt 2930]
                     ([LINE]
                      ([INLINE :x 2701 :y (/ 60553 15) :w 189 :h 200 :elt 2931]
                       ([LINE]
                        ([INLINE :x 2701 :y (/ 60553 15) :w 189 :h 200 :elt 2932])))))))
                  ([TEXT :x 2900 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 2904 :y (/ 60553 15) :w 166 :h 200 :elt 2933]
                   ([LINE]
                    ([INLINE :x 2904 :y (/ 60553 15) :w 166 :h 200 :elt 2934]
                     ([LINE]
                      ([INLINE :x 2904 :y (/ 60553 15) :w 166 :h 200 :elt 2935]
                       ([LINE]
                        ([INLINE :x 2904 :y (/ 60553 15) :w 166 :h 200 :elt 2936])))))))
                  ([TEXT :x 3080 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 3084 :y (/ 60553 15) :w 234 :h 200 :elt 2937]
                   ([LINE]
                    ([INLINE :x 3084 :y (/ 60553 15) :w 234 :h 200 :elt 2938]
                     ([LINE]
                      ([INLINE :x 3084 :y (/ 60553 15) :w 234 :h 200 :elt 2939]
                       ([LINE]
                        ([INLINE :x 3084 :y (/ 60553 15) :w 234 :h 200 :elt 2940])))))))
                  ([TEXT :x 3328 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 3332 :y (/ 60553 15) :w 146 :h 200 :elt 2941]
                   ([LINE]
                    ([INLINE :x 3332 :y (/ 60553 15) :w 146 :h 200 :elt 2942]
                     ([LINE]
                      ([INLINE :x 3332 :y (/ 60553 15) :w 146 :h 200 :elt 2943]
                       ([LINE]
                        ([INLINE :x 3332 :y (/ 60553 15) :w 146 :h 200 :elt 2944])))))))
                  ([TEXT :x 3488 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 3492 :y (/ 60553 15) :w 173 :h 200 :elt 2945]
                   ([LINE]
                    ([INLINE :x 3492 :y (/ 60553 15) :w 173 :h 200 :elt 2946]
                     ([LINE]
                      ([INLINE :x 3492 :y (/ 60553 15) :w 173 :h 200 :elt 2947]
                       ([LINE]
                        ([INLINE :x 3492 :y (/ 60553 15) :w 173 :h 200 :elt 2948])))))))
                  ([TEXT :x 3675 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 3679 :y (/ 60553 15) :w 270 :h 200 :elt 2949]
                   ([LINE]
                    ([INLINE :x 3679 :y 4069.2 :w 270 :h (/ 406 3) :elt 2950]
                     ([LINE]
                      ([INLINE :x 3679 :y 4069.2 :w 270 :h (/ 406 3) :elt 2951]
                       ([LINE]
                        ([INLINE :x 3679 :y 4069.2 :w 270 :h (/ 406 3) :elt 2952])))))))
                  ([TEXT :x 3959 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 3963 :y (/ 60553 15) :w 270 :h 200 :elt 2953]
                   ([LINE]
                    ([INLINE :x 3963 :y (/ 60862 15) :w 270 :h (/ 9529 60) :elt 2954]
                     ([LINE]
                      ([INLINE :x 3963 :y (/ 60862 15) :w 270 :h (/ 9529 60) :elt 2955]
                       ([LINE]
                        ([INLINE :x 3963 :y (/ 60862 15) :w 270 :h (/ 9529 60) :elt 2956])))))))
                  ([TEXT :x 4243 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 4247 :y (/ 60553 15) :w 145 :h 200 :elt 2957]
                   ([LINE]
                    ([INLINE :x 4247 :y (/ 60553 15) :w 145 :h 200 :elt 2958]
                     ([LINE]
                      ([INLINE :x 4252.5 :y (/ 60553 15) :w 134 :h 200 :elt 2959]
                       ([LINE]
                        ([INLINE :x 4252.5 :y (/ 60553 15) :w 134 :h 200 :elt 2960])))))))
                  ([TEXT :x 4402 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 4406 :y (/ 60553 15) :w 181 :h 200 :elt 2961]
                   ([LINE]
                    ([INLINE :x 4406 :y (/ 60553 15) :w 181 :h 200 :elt 2962]
                     ([LINE]
                      ([INLINE :x 4406 :y (/ 60553 15) :w 181 :h 200 :elt 2963]
                       ([LINE]
                        ([INLINE :x 4406 :y (/ 60553 15) :w 181 :h 200 :elt 2964])))))))
                  ([TEXT :x 4597 :y (/ 60583 15) :w 4 :h 15 :text " "])
                  ([INLINE :x 4601 :y (/ 60553 15) :w 200 :h 200 :elt 2965]
                   ([LINE]
                    ([INLINE :x 4601 :y (/ 60553 15) :w 200 :h 200 :elt 2966]
                     ([LINE]
                      ([INLINE :x 4601 :y (/ 60553 15) :w 200 :h 200 :elt 2967]
                       ([LINE]
                        ([INLINE :x 4601 :y (/ 60553 15) :w 200 :h 200 :elt 2968])))))))))
                ([TEXT :x 4801 :y (/ 60583 15) :w 0 :h 15 :text " "])))
              ([BLOCK :x 244 :y (/ 63763 15) :w 1110 :h 6 :elt 2975]
               ([BLOCK :x 244 :y (/ 63793 15) :w 1110 :h 1 :elt 2976])))))))
         ([BLOCK :x 1394 :y (/ 71081 30) :w 310 :h 1454 :elt 2982]
          ([BLOCK :x 1417 :y (/ 71381 30) :w 264 :h 350 :elt 2983]
           ([BLOCK :x 1417 :y (/ 71381 30) :w 264 :h 350 :elt 2984]
            ([LINE]
             ([INLINE :elt 2985]
              ([INLINE :x 1417 :y (/ 71381 30) :w 264 :h 350 :elt 2986])))))
          ([BLOCK :x 1417 :y (/ 82541 30) :w 264 :h 1 :elt 2988])
          ([BLOCK :x 1417 :y (/ 83021 30) :w 264 :h 350 :elt 2989]
           ([BLOCK :x 1417 :y (/ 83021 30) :w 264 :h 350 :elt 2990]
            ([BLOCK :x 1417 :y (/ 83021 30) :w 264 :h 350 :elt 2992]
             ([BLOCK :x 889 :y (/ 83021 30) :w 1320 :h 350 :elt 2993]
              ([LINE]
               ([INLINE :x 1417 :y (/ 83021 30) :w 264 :h 350 :elt 2994]
                ([ANON]
                 ([LINE]
                  ([INLINE :x 1417 :y (/ 83021 30) :w 264 :h 350 :elt 2995]
                   ([LINE]
                    ([INLINE :x 1417 :y (/ 83021 30) :w 264 :h 350 :elt 2996])))))
                ([BLOCK :x 1417 :y (/ 93521 30) :w 264 :h 0 :elt 2997])))))))
          ([BLOCK :x 1417 :y (/ 93971 30) :w 264 :h 1 :elt 2999])
          ([BLOCK :x 1417 :y (/ 94451 30) :w 264 :h 350 :elt 3000]
           ([BLOCK :x 1417 :y (/ 94451 30) :w 264 :h 350 :elt 3001]
            ([LINE]
             ([INLINE :x 1417 :y (/ 94451 30) :w 264 :h 350 :elt 3003]
              ([LINE]
               ([INLINE :x 1417 :y (/ 94451 30) :w 264 :h 350 :elt 3004]))))))
          ([BLOCK :x 1417 :y (/ 105611 30) :w 264 :h 1 :elt 3006])
          ([BLOCK :x 1399 :y (/ 106091 30) :w 300 :h 277 :elt 3007]
           ([BLOCK :x 1399 :y (/ 106241 30) :w 300 :h 272 :elt 3010]
            ([ANON]
             ([LINE]
              ([INLINE :x 1399 :y (/ 106241 30) :w 300 :h 250 :elt 3011])))
            ([BLOCK :x 1399 :y (/ 113831 30) :w 300 :h 20 :elt 3012]
             ([BLOCK :x 1621 :y (/ 113831 30) :w 78 :h 14 :elt 3013]
              ([LINE]
               ([INLINE :elt 3014]
                ([TEXT :x 1621 :y (/ 113831 30) :w 64 :h 12 :text " Ad feedback "])
                ([INLINE :x 1685 :y (/ 113861 30) :w 14 :h 12 :elt 3015])))))))))))
      ([BLOCK :x 204 :y (/ 64078 15) :w 1500 :h 0 :elt 3059]))
     ([BLOCK :x 0 :y (/ 64078 15) :w 1908 :h 0 :elt 3066])
     ([BLOCK :x 0 :y (/ 64528 15) :w 1908 :h 885 :elt 3090]
      ([ANON]
       ([LINE]
        ([INLINE :elt 3091])))
      ([BLOCK :x 0 :y (/ 64528 15) :w 1908 :h 49 :elt 3092]
       ([BLOCK :x 0 :y (/ 64528 15) :w 1908 :h 49 :elt 3093]
        ([LINE]
         ([TEXT :x 920.5 :y (/ 64783 15) :w 67 :h 15 :text "Back to top"]))))
      ([MAGIC :x 454 :y (/ 65863 15) :w 1000 :h 241.1 :elt 3094]
       ([MAGIC :x 454 :y (/ 65863 15) :w 1000 :h 241.1 :elt 3095]
        ([MAGIC :x 454 :y (/ 65863 15) :w 138 :h 241.1 :elt 3096]
         ([BLOCK :x 464 :y (/ 65953 15) :w 118 :h 15.6 :elt 3097]
          ([LINE]
           ([TEXT :x 464 :y (/ 26377 6) :w 118 :h 17 :text "Get to Know Us"])))
         ([BLOCK :x 464 :y (/ 66397 15) :w 118 :h 118 :elt 3098]
          ([BLOCK :x 464 :y (/ 66397 15) :w 118 :h 15.6 :elt 3099]
           ([LINE]
            ([INLINE :elt 3100]
             ([TEXT :x 464 :y (/ 132803 30) :w 45 :h 15 :text "Careers"]))))
          ([BLOCK :x 464 :y (/ 66781 15) :w 118 :h 15.6 :elt 3101]
           ([LINE]
            ([INLINE :elt 3102]
             ([TEXT :x 464 :y (/ 133571 30) :w 26 :h 15 :text "Blog"]))))
          ([BLOCK :x 464 :y (/ 13433 3) :w 118 :h 15.6 :elt 3103]
           ([LINE]
            ([INLINE :elt 3104]
             ([TEXT :x 464 :y (/ 134339 30) :w 86 :h 15 :text "About Amazon"]))))
          ([BLOCK :x 464 :y (/ 67549 15) :w 118 :h 15.6 :elt 3105]
           ([LINE]
            ([INLINE :elt 3106]
             ([TEXT :x 464 :y (/ 135107 30) :w 105 :h 15 :text "Investor Relations"]))))
          ([BLOCK :x 464 :y (/ 67933 15) :w 118 :h 15.6 :elt 3107]
           ([LINE]
            ([INLINE :elt 3108]
             ([TEXT :x 464 :y (/ 27175 6) :w 99 :h 15 :text "Amazon Devices"]))))))
        ([MAGIC :x 592 :y (/ 65863 15) :w 65 :h 241.1 :elt 3109])
        ([MAGIC :x 657 :y (/ 65863 15) :w 197 :h 241.1 :elt 3110]
         ([BLOCK :x 667 :y (/ 65953 15) :w 177 :h 15.6 :elt 3111]
          ([LINE]
           ([TEXT :x 667 :y (/ 26377 6) :w 155 :h 17 :text "Make Money with Us"])))
         ([BLOCK :x 667 :y (/ 66397 15) :w 177 :h 195.5 :elt 3112]
          ([BLOCK :x 667 :y (/ 66397 15) :w 177 :h 15.6 :elt 3113]
           ([LINE]
            ([INLINE :elt 3114]
             ([TEXT :x 667 :y (/ 132803 30) :w 92 :h 15 :text "Sell on Amazon"]))))
          ([BLOCK :x 667 :y (/ 66781 15) :w 177 :h 15.6 :elt 3115]
           ([LINE]
            ([INLINE :elt 3116]
             ([TEXT :x 667 :y (/ 133571 30) :w 177 :h 15 :text "Sell Your Services on Amazon"]))))
          ([BLOCK :x 667 :y (/ 13433 3) :w 177 :h 15.6 :elt 3117]
           ([LINE]
            ([INLINE :elt 3118]
             ([TEXT :x 667 :y (/ 134339 30) :w 150 :h 15 :text "Sell on Amazon Business"]))))
          ([BLOCK :x 667 :y (/ 67549 15) :w 177 :h 15.6 :elt 3119]
           ([LINE]
            ([INLINE :elt 3120]
             ([TEXT :x 667 :y (/ 135107 30) :w 156 :h 15 :text "Sell Your Apps on Amazon"]))))
          ([BLOCK :x 667 :y (/ 67933 15) :w 177 :h 15.6 :elt 3121]
           ([LINE]
            ([INLINE :elt 3122]
             ([TEXT :x 667 :y (/ 27175 6) :w 114 :h 15 :text "Become an Affiliate"]))))
          ([BLOCK :x 667 :y (/ 68317 15) :w 177 :h 15.6 :elt 3123]
           ([LINE]
            ([INLINE :elt 3124]
             ([TEXT :x 667 :y (/ 136643 30) :w 141 :h 15 :text "Advertise Your Products"]))))
          ([BLOCK :x 667 :y (/ 68701 15) :w 177 :h 15.6 :elt 3125]
           ([LINE]
            ([INLINE :elt 3126]
             ([TEXT :x 667 :y (/ 137411 30) :w 117 :h 15 :text "Self-Publish with Us"]))))
          ([BLOCK :x 667 :y (/ 13817 3) :w 177 :h 16.3 :elt 3127]
           ([LINE]
            ([INLINE :elt 3128]
             ([TEXT :x 667 :y (/ 13814 3) :w 5 :h 17 :text "›"]))
            ([INLINE :elt 3129]
             ([TEXT :x 676 :y (/ 13820 3) :w 40 :h 15 :text "See all"]))))))
        ([MAGIC :x 854 :y (/ 65863 15) :w 65 :h 241.1 :elt 3130])
        ([MAGIC :x 919 :y (/ 65863 15) :w 249 :h 241.1 :elt 3131]
         ([BLOCK :x 929 :y (/ 65953 15) :w 229 :h 15.6 :elt 3132]
          ([LINE]
           ([TEXT :x 929 :y (/ 26377 6) :w 208 :h 17 :text "Amazon Payment Products"])))
         ([BLOCK :x 929 :y (/ 66397 15) :w 229 :h 169.2 :elt 3133]
          ([BLOCK :x 929 :y (/ 66397 15) :w 229 :h 15.6 :elt 3134]
           ([LINE]
            ([INLINE :elt 3135]
             ([TEXT :x 929 :y (/ 132803 30) :w 229 :h 15 :text "Amazon Rewards Visa Signature Cards"]))))
          ([BLOCK :x 929 :y (/ 66781 15) :w 229 :h 15.6 :elt 3136]
           ([LINE]
            ([INLINE :elt 3137]
             ([TEXT :x 929 :y (/ 133571 30) :w 143 :h 15 :text "Amazon.com Store Card"]))))
          ([BLOCK :x 929 :y (/ 13433 3) :w 229 :h 15.6 :elt 3138]
           ([LINE]
            ([INLINE :elt 3139]
             ([TEXT :x 929 :y (/ 134339 30) :w 203 :h 15 :text "Amazon.com Corporate Credit Line"]))))
          ([BLOCK :x 929 :y (/ 67549 15) :w 229 :h 15.6 :elt 3140]
           ([LINE]
            ([INLINE :elt 3141]
             ([TEXT :x 929 :y (/ 135107 30) :w 98 :h 15 :text "Shop with Points"]))))
          ([BLOCK :x 929 :y (/ 67933 15) :w 229 :h 15.6 :elt 3142]
           ([LINE]
            ([INLINE :elt 3143]
             ([TEXT :x 929 :y (/ 27175 6) :w 140 :h 15 :text "Credit Card Marketplace"]))))
          ([BLOCK :x 929 :y (/ 68317 15) :w 229 :h 15.6 :elt 3144]
           ([LINE]
            ([INLINE :elt 3145]
             ([TEXT :x 929 :y (/ 136643 30) :w 121 :h 15 :text "Reload Your Balance"]))))
          ([BLOCK :x 929 :y (/ 68701 15) :w 229 :h 15.6 :elt 3146]
           ([LINE]
            ([INLINE :elt 3147]
             ([TEXT :x 929 :y (/ 137411 30) :w 164 :h 15 :text "Amazon Currency Converter"]))))))
        ([MAGIC :x 1168 :y (/ 65863 15) :w 65 :h 241.1 :elt 3148])
        ([MAGIC :x 1233 :y (/ 65863 15) :w 221 :h 241.1 :elt 3149]
         ([BLOCK :x 1243 :y (/ 65953 15) :w 201 :h 15.6 :elt 3150]
          ([LINE]
           ([TEXT :x 1243 :y (/ 26377 6) :w 122 :h 17 :text "Let Us Help You"])))
         ([BLOCK :x 1243 :y (/ 66397 15) :w 201 :h 194.8 :elt 3151]
          ([BLOCK :x 1243 :y (/ 66397 15) :w 201 :h 15.6 :elt 3152]
           ([LINE]
            ([INLINE :elt 3153]
             ([TEXT :x 1243 :y (/ 132803 30) :w 78 :h 15 :text "Your Account"]))))
          ([BLOCK :x 1243 :y (/ 66781 15) :w 201 :h 15.6 :elt 3154]
           ([LINE]
            ([INLINE :elt 3155]
             ([TEXT :x 1243 :y (/ 133571 30) :w 69 :h 15 :text "Your Orders"]))))
          ([BLOCK :x 1243 :y (/ 13433 3) :w 201 :h 15.6 :elt 3156]
           ([LINE]
            ([INLINE :elt 3157]
             ([TEXT :x 1243 :y (/ 134339 30) :w 151 :h 15 :text "Shipping Rates & Policies"]))))
          ([BLOCK :x 1243 :y (/ 67549 15) :w 201 :h 15.6 :elt 3158]
           ([LINE]
            ([INLINE :elt 3159]
             ([TEXT :x 1243 :y (/ 135107 30) :w 86 :h 15 :text "Amazon Prime"]))))
          ([BLOCK :x 1243 :y (/ 67933 15) :w 201 :h 15.6 :elt 3160]
           ([LINE]
            ([INLINE :elt 3161]
             ([TEXT :x 1243 :y (/ 27175 6) :w 145 :h 15 :text "Returns & Replacements"]))))
          ([BLOCK :x 1243 :y (/ 68317 15) :w 201 :h 15.6 :elt 3162]
           ([LINE]
            ([INLINE :elt 3163]
             ([TEXT :x 1243 :y (/ 136643 30) :w 201 :h 15 :text "Manage Your Content and Devices"]))))
          ([BLOCK :x 1243 :y (/ 68701 15) :w 201 :h 15.6 :elt 3164]
           ([LINE]
            ([INLINE :elt 3165]
             ([TEXT :x 1243 :y (/ 137411 30) :w 107 :h 15 :text "Amazon Assistant"]))))
          ([BLOCK :x 1243 :y (/ 13817 3) :w 201 :h 15.6 :elt 3166]
           ([LINE]
            ([INLINE :elt 3167]
             ([TEXT :x 1243 :y (/ 138179 30) :w 26 :h 15 :text "Help"]))))))))
      ([BLOCK :x 0 :y (/ 140159 30) :w 1908 :h 1 :elt 3168])
      ([BLOCK :x 454 :y (/ 140489 30) :w 1000 :h 68 :elt 3169]
       ([LINE]
        ([INLINE :x 732.2 :y (/ 140489 30) :w 90.4 :h 68 :elt 3170]
         ([BLOCK :x 739.4 :y (/ 141389 30) :w 76 :h 23 :elt 3171]
          ([ANON]
           ([LINE]
            ([INLINE :elt 3172])))
          ([BLOCK :x 739.4 :y (/ 141389 30) :w 76 :h 23 :elt 3173])))
        ([INLINE :x 822.6 :y (/ 142199 30) :w 0 :h 0 :elt 3174]))
       ([LINE]
        ([INLINE :x 892.6 :y (/ 141029 30) :w 283.2 :h 33.5 :elt 3175]
         ([BLOCK :x 899.8 :y (/ 141029 30) :w 268.8 :h 33.5 :elt 3176]
          ([LINE]
           ([INLINE :x 899.8 :y (/ 141029 30) :w 117.2 :h 33.5 :elt 3178]
            ([LINE]
             ([INLINE :x 908.8 :y (/ 141299 30) :w 15 :h 15 :elt 3179])
             ([INLINE :x 923.8 :y (/ 70642 15) :w 58.6 :h 18 :elt 3180]
              ([LINE]
               ([TEXT :x 931.6 :y (/ 141329 30) :w 43 :h 15 :text "English"])))
             ([INLINE :x 994.4 :y (/ 141329 30) :w 15.6 :h 12 :elt 3181])))
           ([TEXT :x 1021 :y (/ 141359 30) :w 3 :h 14 :text " "])
           ([INLINE :x 1024 :y (/ 141029 30) :w 140.6 :h 33.5 :elt 3183]
            ([LINE]
             ([INLINE :x 1033 :y (/ 141359 30) :w 18 :h 12 :elt 3184])
             ([INLINE :x 1051 :y (/ 70642 15) :w 94.6 :h 18 :elt 3185]
              ([LINE]
               ([TEXT :x 1058.8 :y (/ 141329 30) :w 79 :h 15 :text "United States"])))))))))
       ([LINE]
        ([INLINE :x 1175.8 :y (/ 142199 30) :w 0 :h 0 :elt 3186])))
      ([BLOCK :x 0 :y (/ 143429 30) :w 1908 :h 347.9 :elt 3187]
       ([MAGIC :x 454 :y (/ 144329 30) :w 1000 :h 287.9 :elt 3188]
        ([MAGIC :x 454 :y (/ 144329 30) :w 1000 :h 287.9 :elt 3189]
         ([MAGIC :x 454 :y (/ 144329 30) :w 1000 :h (/ 2099 60) :elt 3190]
          ([MAGIC :x 454 :y (/ 144329 30) :w 116.5 :h (/ 2099 60) :elt 3191]
           ([INLINE :elt 3192]
            ([TEXT :x (/ 1849 4) :y (/ 288677 60) :w 72 :h 12 :text "Amazon Music"])
            ([INLINE :elt 3193])
            ([INLINE :x (/ 1849 4) :y (/ 289417 60) :w (/ 4141 60) :h 22 :elt 3194]
             ([LINE]
              ([TEXT :x (/ 1849 4) :y (/ 289417 60) :w 69 :h 11 :text "Stream millions"])
              ([INLINE :elt 3195]))
             ([LINE]
              ([TEXT :x (/ 1849 4) :y (/ 290077 60) :w 40 :h 11 :text " of songs"])))))
          ([MAGIC :x 570.5 :y (/ 144329 30) :w (/ 301 12) :h (/ 2099 60) :elt 3196])
          ([MAGIC :x (/ 7147 12) :y (/ 144329 30) :w 129.5 :h (/ 2099 60) :elt 3197]
           ([INLINE :elt 3198]
            ([TEXT :x (/ 3623 6) :y (/ 288677 60) :w 69 :h 12 :text "Amazon Drive"])
            ([INLINE :elt 3199])
            ([INLINE :x (/ 3623 6) :y (/ 289417 60) :w (/ 3901 60) :h 22 :elt 3200]
             ([LINE]
              ([TEXT :x (/ 3623 6) :y (/ 289417 60) :w 65 :h 11 :text "Cloud storage"])
              ([INLINE :elt 3201]))
             ([LINE]
              ([TEXT :x (/ 3623 6) :y (/ 290077 60) :w 61 :h 11 :text " from Amazon"])))))
          ([MAGIC :x (/ 8701 12) :y (/ 144329 30) :w (/ 301 12) :h (/ 2099 60) :elt 3202])
          ([MAGIC :x (/ 4501 6) :y (/ 144329 30) :w 118.5 :h (/ 2099 60) :elt 3203]
           ([INLINE :elt 3204]
            ([TEXT :x (/ 9101 12) :y (/ 288677 60) :w 21 :h 12 :text "6pm"])
            ([INLINE :elt 3205])
            ([INLINE :x (/ 9101 12) :y (/ 289417 60) :w 84 :h 22 :elt 3206]
             ([LINE]
              ([TEXT :x (/ 9101 12) :y (/ 289417 60) :w 55 :h 11 :text "Score deals"])
              ([INLINE :elt 3207]))
             ([LINE]
              ([TEXT :x (/ 9101 12) :y (/ 290077 60) :w 84 :h 11 :text " on fashion brands"])))))
          ([MAGIC :x (/ 2606 3) :y (/ 144329 30) :w (/ 301 12) :h (/ 2099 60) :elt 3208])
          ([MAGIC :x (/ 3575 4) :y (/ 144329 30) :w 102.5 :h (/ 2099 60) :elt 3209]
           ([INLINE :elt 3210]
            ([TEXT :x 902 :y (/ 288677 60) :w 50 :h 12 :text "AbeBooks"])
            ([INLINE :elt 3211])
            ([INLINE :x 902 :y (/ 289417 60) :w 60 :h 22 :elt 3212]
             ([LINE]
              ([TEXT :x 902 :y (/ 289417 60) :w 47 :h 11 :text "Books, art"])
              ([INLINE :elt 3213]))
             ([LINE]
              ([TEXT :x 902 :y (/ 290077 60) :w 60 :h 11 :text " & collectibles"])))))
          ([MAGIC :x (/ 3985 4) :y (/ 144329 30) :w (/ 301 12) :h (/ 2099 60) :elt 3214])
          ([MAGIC :x (/ 3064 3) :y (/ 144329 30) :w 122.5 :h (/ 2099 60) :elt 3215]
           ([INLINE :elt 3216]
            ([TEXT :x (/ 12355 12) :y (/ 288677 60) :w 22 :h 12 :text "ACX "])
            ([INLINE :elt 3217])
            ([INLINE :x (/ 12355 12) :y (/ 289417 60) :w (/ 6061 60) :h 22 :elt 3218]
             ([LINE]
              ([TEXT :x (/ 12355 12) :y (/ 289417 60) :w 101 :h 11 :text "Audiobook Publishing"])
              ([INLINE :elt 3219]))
             ([LINE]
              ([TEXT :x (/ 12355 12) :y (/ 290077 60) :w 52 :h 11 :text " Made Easy"])))))
          ([MAGIC :x (/ 6863 6) :y (/ 144329 30) :w (/ 301 12) :h (/ 2099 60) :elt 3220])
          ([MAGIC :x (/ 14027 12) :y (/ 144329 30) :w 130.5 :h (/ 2099 60) :elt 3221]
           ([INLINE :elt 3222]
            ([TEXT :x (/ 7063 6) :y (/ 288677 60) :w 27 :h 12 :text "Alexa"])
            ([INLINE :elt 3223])
            ([INLINE :x (/ 7063 6) :y (/ 289417 60) :w (/ 5581 60) :h 22 :elt 3224]
             ([LINE]
              ([TEXT :x (/ 7063 6) :y (/ 289417 60) :w 93 :h 11 :text "Actionable Analytics"])
              ([INLINE :elt 3225]))
             ([LINE]
              ([TEXT :x (/ 7063 6) :y (/ 290077 60) :w 54 :h 11 :text " for the Web"])))))
          ([MAGIC :x (/ 15593 12) :y (/ 144329 30) :w (/ 301 12) :h (/ 2099 60) :elt 3226])
          ([MAGIC :x 1324.5 :y (/ 144329 30) :w 129.5 :h (/ 2099 60) :elt 3227]
           ([INLINE :elt 3228]
            ([TEXT :x (/ 5331 4) :y (/ 288677 60) :w 88 :h 12 :text "Amazon Business"])
            ([INLINE :elt 3229])
            ([INLINE :x (/ 5331 4) :y (/ 289417 60) :w (/ 4021 60) :h 22 :elt 3230]
             ([LINE]
              ([TEXT :x (/ 5331 4) :y (/ 289417 60) :w 67 :h 11 :text "Everything For"])
              ([INLINE :elt 3231]))
             ([LINE]
              ([TEXT :x (/ 5331 4) :y (/ 290077 60) :w 66 :h 11 :text " Your Business"]))))))
         ([MAGIC :x 454 :y (/ 96919 20) :w 1000 :h 15.6 :elt 3232]
          ([MAGIC :x 454 :y (/ 96919 20) :w 116.5 :h 15.6 :elt 3233]
           ([TEXT :x (/ 2041 4) :y (/ 19385 4) :w 4 :h 15 :text " "])))
         ([MAGIC :x 454 :y (/ 97231 20) :w 1000 :h (/ 2099 60) :elt 3234]
          ([MAGIC :x 454 :y (/ 97231 20) :w 116.5 :h (/ 2099 60) :elt 3235]
           ([INLINE :elt 3236]
            ([TEXT :x (/ 1849 4) :y (/ 72928 15) :w 69 :h 12 :text "AmazonFresh"])
            ([INLINE :elt 3237])
            ([INLINE :x (/ 1849 4) :y 4874.2 :w 87 :h 22 :elt 3238]
             ([LINE]
              ([TEXT :x (/ 1849 4) :y 4874.2 :w 80 :h 11 :text "Groceries & More"])
              ([INLINE :elt 3239]))
             ([LINE]
              ([TEXT :x (/ 1849 4) :y 4885.2 :w 87 :h 11 :text " Right To Your Door"])))))
          ([MAGIC :x 570.5 :y (/ 97231 20) :w (/ 301 12) :h (/ 2099 60) :elt 3240])
          ([MAGIC :x (/ 7147 12) :y (/ 97231 20) :w 129.5 :h (/ 2099 60) :elt 3241]
           ([INLINE :elt 3242]
            ([TEXT :x (/ 3623 6) :y (/ 72928 15) :w 71 :h 12 :text "AmazonGlobal"])
            ([INLINE :elt 3243])
            ([INLINE :x (/ 3623 6) :y 4874.2 :w 65 :h 22 :elt 3244]
             ([LINE]
              ([TEXT :x (/ 3623 6) :y 4874.2 :w 55 :h 11 :text "Ship Orders"])
              ([INLINE :elt 3245]))
             ([LINE]
              ([TEXT :x (/ 3623 6) :y 4885.2 :w 65 :h 11 :text " Internationally"])))))
          ([MAGIC :x (/ 8701 12) :y (/ 97231 20) :w (/ 301 12) :h (/ 2099 60) :elt 3246])
          ([MAGIC :x (/ 4501 6) :y (/ 97231 20) :w 118.5 :h (/ 2099 60) :elt 3247]
           ([INLINE :elt 3248]
            ([TEXT :x (/ 9101 12) :y (/ 72928 15) :w 75 :h 12 :text "Home Services"])
            ([INLINE :elt 3249])
            ([INLINE :x (/ 9101 12) :y 4874.2 :w 102 :h 22 :elt 3250]
             ([LINE]
              ([TEXT :x (/ 9101 12) :y 4874.2 :w 79 :h 11 :text "Handpicked Pros"])
              ([INLINE :elt 3251]))
             ([LINE]
              ([TEXT :x (/ 9101 12) :y 4885.2 :w 102 :h 11 :text " Happiness Guarantee"])))))
          ([MAGIC :x (/ 2606 3) :y (/ 97231 20) :w (/ 301 12) :h (/ 2099 60) :elt 3252])
          ([MAGIC :x (/ 3575 4) :y (/ 97231 20) :w 102.5 :h (/ 2099 60) :elt 3253]
           ([INLINE :elt 3254]
            ([TEXT :x 902 :y (/ 72928 15) :w 76 :h 12 :text "Amazon Inspire"])
            ([INLINE :elt 3255])
            ([INLINE :x 902 :y 4874.2 :w 86 :h 22 :elt 3256]
             ([LINE]
              ([TEXT :x 902 :y 4874.2 :w 86 :h 11 :text "Digital Educational"])
              ([INLINE :elt 3257]))
             ([LINE]
              ([TEXT :x 902 :y 4885.2 :w 49 :h 11 :text " Resources"])))))
          ([MAGIC :x (/ 3985 4) :y (/ 97231 20) :w (/ 301 12) :h (/ 2099 60) :elt 3258])
          ([MAGIC :x (/ 3064 3) :y (/ 97231 20) :w 122.5 :h (/ 2099 60) :elt 3259]
           ([INLINE :elt 3260]
            ([TEXT :x (/ 12355 12) :y (/ 72928 15) :w 77 :h 12 :text "Amazon Rapids"])
            ([INLINE :elt 3261])
            ([INLINE :x (/ 12355 12) :y 4874.2 :w (/ 3961 60) :h 22 :elt 3262]
             ([LINE]
              ([TEXT :x (/ 12355 12) :y 4874.2 :w 66 :h 11 :text "Fun stories for"])
              ([INLINE :elt 3263]))
             ([LINE]
              ([TEXT :x (/ 12355 12) :y 4885.2 :w 66 :h 11 :text " kids on the go"])))))
          ([MAGIC :x (/ 6863 6) :y (/ 97231 20) :w (/ 301 12) :h (/ 2099 60) :elt 3264])
          ([MAGIC :x (/ 14027 12) :y (/ 97231 20) :w 130.5 :h (/ 2099 60) :elt 3265]
           ([INLINE :elt 3266]
            ([TEXT :x (/ 7063 6) :y (/ 72928 15) :w 103 :h 12 :text "Amazon Restaurants"])
            ([INLINE :elt 3267])
            ([INLINE :x (/ 7063 6) :y 4874.2 :w (/ 5101 60) :h 22 :elt 3268]
             ([LINE]
              ([TEXT :x (/ 7063 6) :y 4874.2 :w 85 :h 11 :text "Food delivery from"])
              ([INLINE :elt 3269]))
             ([LINE]
              ([TEXT :x (/ 7063 6) :y 4885.2 :w 76 :h 11 :text " local restaurants"])))))
          ([MAGIC :x (/ 15593 12) :y (/ 97231 20) :w (/ 301 12) :h (/ 2099 60) :elt 3270])
          ([MAGIC :x 1324.5 :y (/ 97231 20) :w 129.5 :h (/ 2099 60) :elt 3271]
           ([INLINE :elt 3272]
            ([TEXT :x (/ 5331 4) :y (/ 72928 15) :w 111 :h 12 :text "Amazon Web Services"])
            ([INLINE :elt 3273])
            ([INLINE :x (/ 5331 4) :y 4874.2 :w 92 :h 22 :elt 3274]
             ([LINE]
              ([TEXT :x (/ 5331 4) :y 4874.2 :w 70 :h 11 :text "Scalable Cloud"])
              ([INLINE :elt 3275]))
             ([LINE]
              ([TEXT :x (/ 5331 4) :y 4885.2 :w 92 :h 11 :text " Computing Services"]))))))
         ([MAGIC :x 454 :y (/ 73448 15) :w 1000 :h 15.6 :elt 3276]
          ([MAGIC :x 454 :y (/ 73448 15) :w 116.5 :h 15.6 :elt 3277]
           ([TEXT :x (/ 2041 4) :y (/ 29381 6) :w 4 :h 15 :text " "])))
         ([MAGIC :x 454 :y (/ 73682 15) :w 1000 :h (/ 2099 60) :elt 3278]
          ([MAGIC :x 454 :y (/ 73682 15) :w 116.5 :h (/ 2099 60) :elt 3279]
           ([INLINE :elt 3280]
            ([TEXT :x (/ 1849 4) :y (/ 98249 20) :w 35 :h 12 :text "Audible"])
            ([INLINE :elt 3281])
            ([INLINE :x (/ 1849 4) :y (/ 295487 60) :w 55 :h 22 :elt 3282]
             ([LINE]
              ([TEXT :x (/ 1849 4) :y (/ 295487 60) :w 46 :h 11 :text "Download"])
              ([INLINE :elt 3283]))
             ([LINE]
              ([TEXT :x (/ 1849 4) :y (/ 296147 60) :w 55 :h 11 :text " Audiobooks"])))))
          ([MAGIC :x 570.5 :y (/ 73682 15) :w (/ 301 12) :h (/ 2099 60) :elt 3284])
          ([MAGIC :x (/ 7147 12) :y (/ 73682 15) :w 129.5 :h (/ 2099 60) :elt 3285]
           ([INLINE :elt 3286]
            ([TEXT :x (/ 3623 6) :y (/ 98249 20) :w 79 :h 12 :text "AudiobookStand"])
            ([INLINE :elt 3287])
            ([INLINE :x (/ 3623 6) :y (/ 295487 60) :w (/ 5881 60) :h 22 :elt 3288]
             ([LINE]
              ([TEXT :x (/ 3623 6) :y (/ 295487 60) :w 98 :h 11 :text "Discount Audiobooks"])
              ([INLINE :elt 3289]))
             ([LINE]
              ([TEXT :x (/ 3623 6) :y (/ 296147 60) :w 34 :h 11 :text " on Disc"])))))
          ([MAGIC :x (/ 8701 12) :y (/ 73682 15) :w (/ 301 12) :h (/ 2099 60) :elt 3290])
          ([MAGIC :x (/ 4501 6) :y (/ 73682 15) :w 118.5 :h (/ 2099 60) :elt 3291]
           ([INLINE :elt 3292]
            ([TEXT :x (/ 9101 12) :y (/ 98249 20) :w 81 :h 12 :text "Book Depository"])
            ([INLINE :elt 3293])
            ([INLINE :x (/ 9101 12) :y (/ 295487 60) :w 86 :h 22 :elt 3294]
             ([LINE]
              ([TEXT :x (/ 9101 12) :y (/ 295487 60) :w 76 :h 11 :text "Books With Free"])
              ([INLINE :elt 3295]))
             ([LINE]
              ([TEXT :x (/ 9101 12) :y (/ 296147 60) :w 86 :h 11 :text " Delivery Worldwide"])))))
          ([MAGIC :x (/ 2606 3) :y (/ 73682 15) :w (/ 301 12) :h (/ 2099 60) :elt 3296])
          ([MAGIC :x (/ 3575 4) :y (/ 73682 15) :w 102.5 :h (/ 2099 60) :elt 3297]
           ([INLINE :elt 3298]
            ([TEXT :x 902 :y (/ 98249 20) :w 77 :h 12 :text "Box Office Mojo"])
            ([INLINE :elt 3299])
            ([INLINE :x 902 :y (/ 295487 60) :w 73 :h 22 :elt 3300]
             ([LINE]
              ([TEXT :x 902 :y (/ 295487 60) :w 50 :h 11 :text "Find Movie"])
              ([INLINE :elt 3301]))
             ([LINE]
              ([TEXT :x 902 :y (/ 296147 60) :w 73 :h 11 :text " Box Office Data"])))))
          ([MAGIC :x (/ 3985 4) :y (/ 73682 15) :w (/ 301 12) :h (/ 2099 60) :elt 3302])
          ([MAGIC :x (/ 3064 3) :y (/ 73682 15) :w 122.5 :h (/ 2099 60) :elt 3303]
           ([INLINE :elt 3304]
            ([TEXT :x (/ 12355 12) :y (/ 98249 20) :w 58 :h 12 :text "ComiXology"])
            ([INLINE :elt 3305])
            ([INLINE :x (/ 12355 12) :y (/ 295487 60) :w (/ 3841 60) :h 22 :elt 3306]
             ([LINE]
              ([TEXT :x (/ 12355 12) :y (/ 295487 60) :w 64 :h 11 :text "Thousands of"])
              ([INLINE :elt 3307]))
             ([LINE]
              ([TEXT :x (/ 12355 12) :y (/ 296147 60) :w 64 :h 11 :text " Digital Comics"])))))
          ([MAGIC :x (/ 6863 6) :y (/ 73682 15) :w (/ 301 12) :h (/ 2099 60) :elt 3308])
          ([MAGIC :x (/ 14027 12) :y (/ 73682 15) :w 130.5 :h (/ 2099 60) :elt 3309]
           ([INLINE :elt 3310]
            ([TEXT :x (/ 7063 6) :y (/ 98249 20) :w 64 :h 12 :text "CreateSpace"])
            ([INLINE :elt 3311])
            ([INLINE :x (/ 7063 6) :y (/ 295487 60) :w (/ 5881 60) :h 22 :elt 3312]
             ([LINE]
              ([TEXT :x (/ 7063 6) :y (/ 295487 60) :w 98 :h 11 :text "Indie Print Publishing"])
              ([INLINE :elt 3313]))
             ([LINE]
              ([TEXT :x (/ 7063 6) :y (/ 296147 60) :w 52 :h 11 :text " Made Easy"])))))
          ([MAGIC :x (/ 15593 12) :y (/ 73682 15) :w (/ 301 12) :h (/ 2099 60) :elt 3314])
          ([MAGIC :x 1324.5 :y (/ 73682 15) :w 129.5 :h (/ 2099 60) :elt 3315]
           ([INLINE :elt 3316]
            ([TEXT :x (/ 5331 4) :y (/ 98249 20) :w 51 :h 12 :text "DPReview"])
            ([INLINE :elt 3317])
            ([INLINE :x (/ 5331 4) :y (/ 295487 60) :w 60 :h 22 :elt 3318]
             ([LINE]
              ([TEXT :x (/ 5331 4) :y (/ 295487 60) :w 28 :h 11 :text "Digital"])
              ([INLINE :elt 3319]))
             ([LINE]
              ([TEXT :x (/ 5331 4) :y (/ 296147 60) :w 60 :h 11 :text " Photography"]))))))
         ([MAGIC :x 454 :y (/ 296827 60) :w 1000 :h 15.6 :elt 3320]
          ([MAGIC :x 454 :y (/ 296827 60) :w 116.5 :h 15.6 :elt 3321]
           ([TEXT :x (/ 2041 4) :y (/ 59369 12) :w 4 :h 15 :text " "])))
         ([MAGIC :x 454 :y (/ 297763 60) :w 1000 :h (/ 2099 60) :elt 3322]
          ([MAGIC :x 454 :y (/ 297763 60) :w 116.5 :h (/ 2099 60) :elt 3323]
           ([INLINE :elt 3324]
            ([TEXT :x (/ 1849 4) :y (/ 148891 30) :w 51 :h 12 :text "East Dane"])
            ([INLINE :elt 3325])
            ([INLINE :x (/ 1849 4) :y (/ 149261 30) :w (/ 4261 60) :h 22 :elt 3326]
             ([LINE]
              ([TEXT :x (/ 1849 4) :y (/ 149261 30) :w 71 :h 11 :text "Designer Men's"])
              ([INLINE :elt 3327]))
             ([LINE]
              ([TEXT :x (/ 1849 4) :y (/ 149591 30) :w 37 :h 11 :text " Fashion"])))))
          ([MAGIC :x 570.5 :y (/ 297763 60) :w (/ 301 12) :h (/ 2099 60) :elt 3328])
          ([MAGIC :x (/ 7147 12) :y (/ 297763 60) :w 129.5 :h (/ 2099 60) :elt 3329]
           ([INLINE :elt 3330]
            ([TEXT :x (/ 3623 6) :y (/ 148891 30) :w 31 :h 12 :text "Fabric"])
            ([INLINE :elt 3331])
            ([INLINE :x (/ 3623 6) :y (/ 149261 30) :w (/ 4501 60) :h 22 :elt 3332]
             ([LINE]
              ([TEXT :x (/ 3623 6) :y (/ 149261 30) :w 75 :h 11 :text "Sewing, Quilting"])
              ([INLINE :elt 3333]))
             ([LINE]
              ([TEXT :x (/ 3623 6) :y (/ 149591 30) :w 45 :h 11 :text " & Knitting"])))))
          ([MAGIC :x (/ 8701 12) :y (/ 297763 60) :w (/ 301 12) :h (/ 2099 60) :elt 3334])
          ([MAGIC :x (/ 4501 6) :y (/ 297763 60) :w 118.5 :h (/ 2099 60) :elt 3335]
           ([INLINE :elt 3336]
            ([TEXT :x (/ 9101 12) :y (/ 148891 30) :w 55 :h 12 :text "Goodreads"])
            ([INLINE :elt 3337])
            ([INLINE :x (/ 9101 12) :y (/ 149261 30) :w 92 :h 22 :elt 3338]
             ([LINE]
              ([TEXT :x (/ 9101 12) :y (/ 149261 30) :w 61 :h 11 :text "Book reviews"])
              ([INLINE :elt 3339]))
             ([LINE]
              ([TEXT :x (/ 9101 12) :y (/ 149591 30) :w 92 :h 11 :text " & recommendations"])))))
          ([MAGIC :x (/ 2606 3) :y (/ 297763 60) :w (/ 301 12) :h (/ 2099 60) :elt 3340])
          ([MAGIC :x (/ 3575 4) :y (/ 297763 60) :w 102.5 :h (/ 2099 60) :elt 3341]
           ([INLINE :elt 3342]
            ([TEXT :x 902 :y (/ 148891 30) :w 26 :h 12 :text "IMDb"])
            ([INLINE :elt 3343])
            ([INLINE :x 902 :y (/ 149261 30) :w 58 :h 22 :elt 3344]
             ([LINE]
              ([TEXT :x 902 :y (/ 149261 30) :w 51 :h 11 :text "Movies, TV"])
              ([INLINE :elt 3345]))
             ([LINE]
              ([TEXT :x 902 :y (/ 149591 30) :w 58 :h 11 :text " & Celebrities"])))))
          ([MAGIC :x (/ 3985 4) :y (/ 297763 60) :w (/ 301 12) :h (/ 2099 60) :elt 3346])
          ([MAGIC :x (/ 3064 3) :y (/ 297763 60) :w 122.5 :h (/ 2099 60) :elt 3347]
           ([INLINE :elt 3348]
            ([TEXT :x (/ 12355 12) :y (/ 148891 30) :w 43 :h 12 :text "IMDbPro"])
            ([INLINE :elt 3349])
            ([INLINE :x (/ 12355 12) :y (/ 149261 30) :w 106 :h 22 :elt 3350]
             ([LINE]
              ([TEXT :x (/ 12355 12) :y (/ 149261 30) :w 106 :h 11 :text "Get Info Entertainment"])
              ([INLINE :elt 3351]))
             ([LINE]
              ([TEXT :x (/ 12355 12) :y (/ 149591 30) :w 90 :h 11 :text " Professionals Need"])))))
          ([MAGIC :x (/ 6863 6) :y (/ 297763 60) :w (/ 301 12) :h (/ 2099 60) :elt 3352])
          ([MAGIC :x (/ 14027 12) :y (/ 297763 60) :w 130.5 :h (/ 2099 60) :elt 3353]
           ([INLINE :elt 3354]
            ([TEXT :x (/ 7063 6) :y (/ 148891 30) :w 62 :h 12 :text "Junglee.com"])
            ([INLINE :elt 3355])
            ([INLINE :x (/ 7063 6) :y (/ 149261 30) :w (/ 3481 60) :h 22 :elt 3356]
             ([LINE]
              ([TEXT :x (/ 7063 6) :y (/ 149261 30) :w 58 :h 11 :text "Shop Online"])
              ([INLINE :elt 3357]))
             ([LINE]
              ([TEXT :x (/ 7063 6) :y (/ 149591 30) :w 34 :h 11 :text " in India"])))))
          ([MAGIC :x (/ 15593 12) :y (/ 297763 60) :w (/ 301 12) :h (/ 2099 60) :elt 3358])
          ([MAGIC :x 1324.5 :y (/ 297763 60) :w 129.5 :h (/ 2099 60) :elt 3359]
           ([INLINE :elt 3360]
            ([TEXT :x (/ 5331 4) :y (/ 148891 30) :w 113 :h 12 :text "Kindle Direct Publishing"])
            ([INLINE :elt 3361])
            ([INLINE :x (/ 5331 4) :y (/ 149261 30) :w (/ 6301 60) :h 22 :elt 3362]
             ([LINE]
              ([TEXT :x (/ 5331 4) :y (/ 149261 30) :w 105 :h 11 :text "Indie Digital Publishing"])
              ([INLINE :elt 3363]))
             ([LINE]
              ([TEXT :x (/ 5331 4) :y (/ 149591 30) :w 52 :h 11 :text " Made Easy "]))))))
         ([MAGIC :x 454 :y 4997.7 :w 1000 :h 15.6 :elt 3364]
          ([MAGIC :x 454 :y 4997.7 :w 116.5 :h 15.6 :elt 3365]
           ([TEXT :x (/ 2041 4) :y 4998 :w 4 :h 15 :text " "])))
         ([MAGIC :x 454 :y 5013.3 :w 1000 :h (/ 2099 60) :elt 3366]
          ([MAGIC :x 454 :y 5013.3 :w 116.5 :h (/ 2099 60) :elt 3367]
           ([INLINE :elt 3368]
            ([TEXT :x (/ 1849 4) :y (/ 300817 60) :w 53 :h 12 :text " Prime Now"])
            ([INLINE :elt 3369])
            ([INLINE :x (/ 1849 4) :y (/ 100519 20) :w 100 :h 22 :elt 3370]
             ([LINE]
              ([TEXT :x (/ 1849 4) :y (/ 100519 20) :w 100 :h 11 :text "FREE 2-Hour Delivery"])
              ([INLINE :elt 3371]))
             ([LINE]
              ([TEXT :x (/ 1849 4) :y (/ 100739 20) :w 86 :h 11 :text " on Everyday Items"])))))
          ([MAGIC :x 570.5 :y 5013.3 :w (/ 301 12) :h (/ 2099 60) :elt 3372])
          ([MAGIC :x (/ 7147 12) :y 5013.3 :w 129.5 :h (/ 2099 60) :elt 3373]
           ([INLINE :elt 3374]
            ([TEXT :x (/ 3623 6) :y (/ 300817 60) :w 65 :h 12 :text "Prime Photos"])
            ([INLINE :elt 3375])
            ([INLINE :x (/ 3623 6) :y (/ 100519 20) :w 113 :h 22 :elt 3376]
             ([LINE]
              ([TEXT :x (/ 3623 6) :y (/ 100519 20) :w 113 :h 11 :text "Unlimited Photo Storage"])
              ([INLINE :elt 3377]))
             ([LINE]
              ([TEXT :x (/ 3623 6) :y (/ 100739 20) :w 73 :h 11 :text " Free With Prime"])))))
          ([MAGIC :x (/ 8701 12) :y 5013.3 :w (/ 301 12) :h (/ 2099 60) :elt 3378])
          ([MAGIC :x (/ 4501 6) :y 5013.3 :w 118.5 :h (/ 2099 60) :elt 3379]
           ([INLINE :elt 3380]
            ([TEXT :x (/ 9101 12) :y (/ 300817 60) :w 90 :h 12 :text "Prime Video Direct"])
            ([INLINE :elt 3381])
            ([INLINE :x (/ 9101 12) :y (/ 100519 20) :w (/ 4861 60) :h 22 :elt 3382]
             ([LINE]
              ([TEXT :x (/ 9101 12) :y (/ 100519 20) :w 81 :h 11 :text "Video Distribution"])
              ([INLINE :elt 3383]))
             ([LINE]
              ([TEXT :x (/ 9101 12) :y (/ 100739 20) :w 52 :h 11 :text " Made Easy"])))))
          ([MAGIC :x (/ 2606 3) :y 5013.3 :w (/ 301 12) :h (/ 2099 60) :elt 3384])
          ([MAGIC :x (/ 3575 4) :y 5013.3 :w 102.5 :h (/ 2099 60) :elt 3385]
           ([INLINE :elt 3386]
            ([TEXT :x 902 :y (/ 300817 60) :w 43 :h 12 :text "Shopbop"])
            ([INLINE :elt 3387])
            ([INLINE :x 902 :y (/ 100519 20) :w 73 :h 22 :elt 3388]
             ([LINE]
              ([TEXT :x 902 :y (/ 100519 20) :w 41 :h 11 :text "Designer"])
              ([INLINE :elt 3389]))
             ([LINE]
              ([TEXT :x 902 :y (/ 100739 20) :w 73 :h 11 :text " Fashion Brands"])))))
          ([MAGIC :x (/ 3985 4) :y 5013.3 :w (/ 301 12) :h (/ 2099 60) :elt 3390])
          ([MAGIC :x (/ 3064 3) :y 5013.3 :w 122.5 :h (/ 2099 60) :elt 3391]
           ([INLINE :elt 3392]
            ([TEXT :x (/ 12355 12) :y (/ 300817 60) :w 73 :h 12 :text "TenMarks.com"])
            ([INLINE :elt 3393])
            ([INLINE :x (/ 12355 12) :y (/ 100519 20) :w 85 :h 22 :elt 3394]
             ([LINE]
              ([TEXT :x (/ 12355 12) :y (/ 100519 20) :w 66 :h 11 :text "Math Activities"])
              ([INLINE :elt 3395]))
             ([LINE]
              ([TEXT :x (/ 12355 12) :y (/ 100739 20) :w 85 :h 11 :text " for Kids & Schools"])))))
          ([MAGIC :x (/ 6863 6) :y 5013.3 :w (/ 301 12) :h (/ 2099 60) :elt 3396])
          ([MAGIC :x (/ 14027 12) :y 5013.3 :w 130.5 :h (/ 2099 60) :elt 3397]
           ([INLINE :elt 3398]
            ([TEXT :x (/ 7063 6) :y (/ 300817 60) :w 99 :h 12 :text "Amazon Warehouse"])
            ([INLINE :elt 3399])
            ([INLINE :x (/ 7063 6) :y (/ 100519 20) :w 103 :h 22 :elt 3400]
             ([LINE]
              ([TEXT :x (/ 7063 6) :y (/ 100519 20) :w 70 :h 11 :text "Great Deals on"])
              ([INLINE :elt 3401]))
             ([LINE]
              ([TEXT :x (/ 7063 6) :y (/ 100739 20) :w 103 :h 11 :text " Quality Used Products "])))))
          ([MAGIC :x (/ 15593 12) :y 5013.3 :w (/ 301 12) :h (/ 2099 60) :elt 3402])
          ([MAGIC :x 1324.5 :y 5013.3 :w 129.5 :h (/ 2099 60) :elt 3403]
           ([INLINE :elt 3404]
            ([TEXT :x (/ 5331 4) :y (/ 300817 60) :w 101 :h 12 :text "Whole Foods Market"])
            ([INLINE :elt 3405])
            ([INLINE :x (/ 5331 4) :y (/ 100519 20) :w (/ 5581 60) :h 22 :elt 3406]
             ([LINE]
              ([TEXT :x (/ 5331 4) :y (/ 100519 20) :w 93 :h 11 :text "America’s Healthiest"])
              ([INLINE :elt 3407]))
             ([LINE]
              ([TEXT :x (/ 5331 4) :y (/ 100739 20) :w 64 :h 11 :text " Grocery Store"]))))))
         ([MAGIC :x 454 :y (/ 302897 60) :w 1000 :h 15.6 :elt 3408]
          ([MAGIC :x 454 :y (/ 302897 60) :w 116.5 :h 15.6 :elt 3409]
           ([TEXT :x (/ 2041 4) :y (/ 60583 12) :w 4 :h 15 :text " "])))
         ([MAGIC :x 454 :y (/ 303833 60) :w 1000 :h (/ 2099 60) :elt 3410]
          ([MAGIC :x 454 :y (/ 303833 60) :w 116.5 :h (/ 2099 60) :elt 3411]
           ([TEXT :x (/ 1849 4) :y 5064.2 :w 3 :h 12 :text " "]))
          ([MAGIC :x 570.5 :y (/ 303833 60) :w (/ 301 12) :h (/ 2099 60) :elt 3412])
          ([MAGIC :x (/ 7147 12) :y (/ 303833 60) :w 129.5 :h (/ 2099 60) :elt 3413]
           ([INLINE :elt 3414]
            ([TEXT :x (/ 3623 6) :y 5064.2 :w 60 :h 12 :text "Withoutabox"])
            ([INLINE :elt 3415])
            ([INLINE :x (/ 3623 6) :y (/ 76148 15) :w 61 :h 22 :elt 3416]
             ([LINE]
              ([TEXT :x (/ 3623 6) :y (/ 76148 15) :w 44 :h 11 :text "Submit to"])
              ([INLINE :elt 3417]))
             ([LINE]
              ([TEXT :x (/ 3623 6) :y (/ 76313 15) :w 61 :h 11 :text " Film Festivals"])))))
          ([MAGIC :x (/ 8701 12) :y (/ 303833 60) :w (/ 301 12) :h (/ 2099 60) :elt 3418])
          ([MAGIC :x (/ 4501 6) :y (/ 303833 60) :w 118.5 :h (/ 2099 60) :elt 3419]
           ([INLINE :elt 3420]
            ([TEXT :x (/ 9101 12) :y 5064.2 :w 28 :h 12 :text "Woot!"])
            ([INLINE :elt 3421])
            ([INLINE :x (/ 9101 12) :y (/ 76148 15) :w 62 :h 22 :elt 3422]
             ([LINE]
              ([TEXT :x (/ 9101 12) :y (/ 76148 15) :w 47 :h 11 :text "Deals and "])
              ([INLINE :elt 3423]))
             ([LINE]
              ([TEXT :x (/ 9101 12) :y (/ 76313 15) :w 62 :h 11 :text " Shenanigans"])))))
          ([MAGIC :x (/ 2606 3) :y (/ 303833 60) :w (/ 301 12) :h (/ 2099 60) :elt 3424])
          ([MAGIC :x (/ 3575 4) :y (/ 303833 60) :w 102.5 :h (/ 2099 60) :elt 3425]
           ([INLINE :elt 3426]
            ([TEXT :x 902 :y 5064.2 :w 37 :h 12 :text "Zappos"])
            ([INLINE :elt 3427])
            ([INLINE :x 902 :y (/ 76148 15) :w (/ 2401 60) :h 22 :elt 3428]
             ([LINE]
              ([TEXT :x 902 :y (/ 76148 15) :w 40 :h 11 :text "Shoes &"])
              ([INLINE :elt 3429]))
             ([LINE]
              ([TEXT :x 902 :y (/ 76313 15) :w 38 :h 11 :text " Clothing"])))))
          ([MAGIC :x (/ 3985 4) :y (/ 303833 60) :w (/ 301 12) :h (/ 2099 60) :elt 3430])
          ([MAGIC :x (/ 3064 3) :y (/ 303833 60) :w 122.5 :h (/ 2099 60) :elt 3431]
           ([INLINE :elt 3432]
            ([TEXT :x (/ 12355 12) :y 5064.2 :w 49 :h 12 :text "Souq.com"])
            ([INLINE :elt 3433])
            ([INLINE :x (/ 12355 12) :y (/ 76148 15) :w 72 :h 22 :elt 3434]
             ([LINE]
              ([TEXT :x (/ 12355 12) :y (/ 76148 15) :w 69 :h 11 :text "Shop Online in"])
              ([INLINE :elt 3435]))
             ([LINE]
              ([TEXT :x (/ 12355 12) :y (/ 76313 15) :w 72 :h 11 :text " the Middle East"])))))
          ([MAGIC :x (/ 6863 6) :y (/ 303833 60) :w (/ 301 12) :h (/ 2099 60) :elt 3436])
          ([MAGIC :x (/ 14027 12) :y (/ 303833 60) :w 130.5 :h (/ 2099 60) :elt 3437]
           ([INLINE :elt 3438]
            ([TEXT :x (/ 7063 6) :y 5064.2 :w 114 :h 12 :text "Subscribe with Amazon"])
            ([INLINE :elt 3439])
            ([INLINE :x (/ 7063 6) :y (/ 76148 15) :w 95 :h 22 :elt 3440]
             ([LINE]
              ([TEXT :x (/ 7063 6) :y (/ 76148 15) :w 63 :h 11 :text "Discover & try"])
              ([INLINE :elt 3441]))
             ([LINE]
              ([TEXT :x (/ 7063 6) :y (/ 76313 15) :w 95 :h 11 :text " subscription services"])))))
          ([MAGIC :x (/ 15593 12) :y (/ 303833 60) :w (/ 301 12) :h (/ 2099 60) :elt 3442])
          ([MAGIC :x 1324.5 :y (/ 303833 60) :w 129.5 :h (/ 2099 60) :elt 3443]
           ([TEXT :x (/ 5331 4) :y 5064.2 :w 3 :h 12 :text " "]))))))
      ([BLOCK :x 0 :y (/ 76933 15) :w 1908 :h 58 :elt 3444]
       ([LINE]
        ([INLINE :x 667.9 :y (/ 77083 15) :w 572.2 :h 18 :elt 3445]
         ([LINE]
          ([INLINE :elt 3446]
           ([INLINE :elt 3447]
            ([TEXT :x 675.1 :y (/ 77113 15) :w 97 :h 14 :text "Conditions of Use"])))
          ([INLINE :elt 3448]
           ([INLINE :elt 3449]
            ([TEXT :x 786.5 :y (/ 77113 15) :w 78 :h 14 :text "Privacy Notice"])))
          ([INLINE :elt 3450]
           ([INLINE :elt 3451]
            ([TEXT :x 878.9 :y (/ 77113 15) :w 103 :h 14 :text "Interest-Based Ads"])))
          ([INLINE :elt 3452]
           ([TEXT :x 989.1 :y (/ 77113 15) :w 251 :h 14 :text "© 1996-2018, Amazon.com, Inc. or its affiliates"])))))))
     ([BLOCK :x -1000000 :y -1000000 :w 1 :h 1 :elt 3453]
      ([LINE]
       ([INLINE :x -1000000 :y -999987 :w 1 :h 1 :elt 3454])))
     ([BLOCK :x -1000000 :y -1000000 :w 0 :h 1 :elt 3456]
      ([LINE]
       ([INLINE :x -1000000 :y -999986 :w 0 :h 0 :elt 3457]))))
    ([ANON]
     ([LINE]
      ([INLINE :elt 3465]
       ([TEXT :x 0 :y (/ 77833 15) :w 39 :h 15 :text "normal"]))
      ([BLOCK :x 0 :y (/ 78088 15) :w 0 :h 0 :elt 3466])
      ([TEXT :x 39 :y (/ 77833 15) :w 0 :h 15 :text " "])
      ([BLOCK :x 0 :y 0 :w 0 :h 0 :elt 3484])))))))

(define-problem doc-1
  :title "Amazon.com: Online Shopping for Electronics, Apparel, Computers, Books, DVDs & more"
  :url "file:///tmp/amazon.html"
  :sheets firefox doc-1
  :fonts doc-1
  :layouts doc-1
  :error "Error, 1ms is not a known unit"
  :features css:box-sizing css:min-height css:font-size css:max-width css:vertical-align css:position priority:important css:float css:overflow-x css:overflow-y css:before-after unknown-selector css:inherit css:white-space css:type-13-rule css:text-indent css:type-12-rule css:max-height css:min-width css:clear @media unit:ch color:rgba unknown-error tag:iframe empty-text tag:img display:inline-block tag:input display:unknown display:table tag:button display:list-item attr:dir float:6 exclusion-zone)

