(define-stylesheet yoga
  ((tag body)
   [background-color (rgb 7 112 84)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [color (rgb 49 95 82)]
   [font-family "\"latoregular\""]
   [font-size (px 14)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((tag img)
   [border-top-width medium]
   [border-right-width medium]
   [border-bottom-width medium]
   [border-left-width medium]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color currentcolor]
   #;[border-right-color currentcolor]
   #;[border-bottom-color currentcolor]
   #;[border-left-color currentcolor]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset 0 0 0 0]
   #;[border-image-repeat stretch stretch])
  ((tag p)
   [line-height (px 30)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (tag p) (tag a))
   [color (rgb 49 95 82)])
  ((desc (tag p) (and (tag a) (pseudo-class hover)))
   [color (rgb 69 19 116)])
  ((id header)
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [max-width (px 960)])
  ((desc (id header) (tag h1))
   [font-size (px 50)]
   [font-weight normal]
   [line-height (px 50)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 30)]
   [padding-right (px 0)]
   [padding-bottom (px 30)]
   [padding-left (px 0)]
   [text-align center])
  ((desc (id header) (tag h1) (tag a))
   [color (rgb 153 250 153)]
   #;[text-decoration-color currentcolor]
   #;[text-decoration-line none]
   #;[text-decoration-style solid])
  ((desc (id header) (tag h1) (tag a) (tag span))
   [color (rgb 182 216 207)]
   [display block]
   [font-family "\"nixie_oneregular\""]
   [font-size (px 26)]
   #;[text-transform uppercase])
  ((desc (id header) (and (tag ul) (id navigation)))
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [text-align center])
  ((desc (id header) (and (tag ul) (id navigation)) (tag li))
   [display inline]
   [line-height (px 30)]
   [position relative])
  ((desc (id header) (and (tag ul) (id navigation)) (tag li) (tag a))
   [color (rgb 182 216 207)]
   [font-size (px 18)]
   [padding-top (px 0)]
   [padding-right (px 46)]
   [padding-bottom (px 0)]
   [padding-left (px 46)]
   [text-align center]
   #;[text-decoration-color currentcolor]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-transform uppercase])
  ((desc (id header) (and (tag ul) (id navigation)) (tag li) (and (tag a) (pseudo-class hover)))
   [color (rgb 211 163 255)])
  ((desc (id header) (and (tag ul) (id navigation)) (and (tag li) (class current)) (tag ul) (tag li) (and (tag a) (pseudo-class hover)))
   [color (rgb 211 163 255)])
  ((desc (id header) (and (tag ul) (id navigation)) (and (tag li) (class current)) (tag a))
   [color (rgb 153 250 153)])
  ((desc (id header) (and (tag ul) (id navigation)) (tag li) (tag ul))
   [display none]
   [left (px 0)]
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 11)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [position absolute]
   [top (px 12)])
  ((desc (id header) (and (tag ul) (id navigation)) (and (tag li) (pseudo-class hover)) (tag ul))
   [display block])
  ((desc (id header) (and (tag ul) (id navigation)) (tag li) (tag ul) (tag li))
   [background-color (rgb 7 112 84)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [display block]
   [height (px 46)]
   [line-height (px 46)])
  ((desc (id header) (and (tag ul) (id navigation)) (tag li) (tag ul) (tag li) (tag a))
   [padding-top (px 0)]
   [padding-right (px 20)]
   [padding-bottom (px 0)]
   [padding-left (px 20)])
  ((desc (id header) (and (tag ul) (id navigation)) (and (tag li) (class current)) (tag ul) (tag li) (tag a))
   [color (rgb 182 216 207)])
  ((id body)
   [background-color (rgb 255 255 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [margin-top (px 1)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [max-width (px 880)]
   [min-height (px 827)]
   [overflow-x hidden]
   [overflow-y hidden]
   [padding-top (px 45)]
   [padding-right (px 40)]
   [padding-bottom (px 46)]
   [padding-left (px 40)])
  ((child (id body) (tag h2))
   [color (rgb 33 165 30)]
   [font-family "\"nixie_oneregular\""]
   [font-size (px 35)]
   [font-weight normal]
   [line-height (px 30)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 44)]
   [padding-left (px 0)])
  ((desc (id body) (and (tag img) (class figure)))
   [display block]
   [float right]
   [margin-top (px 74)]
   [margin-right (px 38)]
   [margin-bottom (px 46)]
   [margin-left (px 0)]
   [max-width (% 100)]
   [width auto])
  ((desc (id body) (and (tag div) (id tagline)))
   [float left]
   [margin-top (px 110)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 25)]
   [max-width (px 510)])
  ((desc (id body) (and (tag div) (id tagline)) (tag h1))
   [background-color transparent]
   #;[background-image url("../images/bg-separator.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x center]
   #;[background-position-y bottom]
   #;[background-size auto auto]
   [color (rgb 33 165 30)]
   [font-family "\"nixie_oneregular\""]
   [font-size (px 100)]
   [font-weight normal]
   [line-height (px 100)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 55)]
   [padding-left (px 0)]
   [text-align center]
   #;[text-transform uppercase])
  ((desc (id body) (and (tag div) (id tagline)) (tag p))
   [color (rgb 33 165 30)]
   [font-family "\"nixie_oneregular\""]
   [font-size (px 100)]
   [line-height (px 100)]
   [padding-top (px 43)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [text-align center])
  ((desc (id body) (and (tag div) (class content)))
   [overflow-x hidden]
   [overflow-y hidden])
  ((child (desc (id body) (and (tag div) (class content))) (tag div))
   [float left]
   [width (px 510)])
  ((desc (id body) (and (tag div) (class content)) (tag h3))
   [font-family "\"nixie_oneregular\""]
   [font-size (px 23)]
   [font-weight normal]
   [line-height (px 30)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 25)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (id body) (tag form) (tag h3))
   [font-family "\"nixie_oneregular\""]
   [font-size (px 23)]
   [font-weight normal]
   [line-height (px 30)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 25)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (id body) (and (tag ul) (class blog)) (tag li) (tag h3))
   [font-family "\"nixie_oneregular\""]
   [font-size (px 23)]
   [font-weight normal]
   [line-height (px 30)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 25)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (id body) (and (tag div) (class content)) (and (tag h3) (pseudo-class first-child)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (id body) (and (tag div) (class content)) (tag div) (and (tag div) (class section) (pseudo-class first-child)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (id body) (and (tag div) (class content)) (and (tag img) (class figure)))
   [margin-top (px 0)]
   [margin-right (px 38)]
   [margin-bottom (px 46)]
   [margin-left (px 0)])
  ((desc (id body) (and (tag div) (class content)) (tag div) (and (tag div) (class section)))
   [padding-top (px 55)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [width (px 430)])
  ((desc (id body) (and (tag div) (class content)) (tag div) (and (tag div) (class section)) (tag span))
   [display block]
   [line-height (px 30)])
  ((desc (id body) (and (tag div) (class content)) (tag div) (tag ul))
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 65)]
   [padding-left (px 0)])
  ((desc (id body) (and (tag div) (class content)) (tag div) (tag ul) (tag li))
   [float left]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 83)]
   [width (px 207)])
  ((desc (id body) (and (tag div) (class content)) (tag div) (tag ul) (and (tag li) (pseudo-class first-child)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (id body) (and (tag div) (class content)) (tag div) (tag ul) (tag li) (tag img))
   [display block]
   [max-width (% 100)]
   [width auto])
  ((desc (id body) (and (tag div) (class content)) (tag div) (tag ul) (tag li) (tag h4))
   [font-family "\"nixie_oneregular\""]
   [font-size (px 18)]
   [font-weight normal]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 12)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [text-align center])
  ((desc (id body) (tag form))
   [margin-top (px 25)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [overflow-x hidden]
   [overflow-y hidden]
   [width (px 460)])
  ((desc (id body) (tag form) (tag label))
   [display block]
   [padding-top (px 15)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (id body) (tag form) (tag label) (tag span))
   [display block]
   [line-height (px 27)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 5)]
   [padding-left (px 0)])
  ((desc (id body) (tag form) (tag label) (tag input))
   [background-color (rgb 209 211 212)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color (rgb 182 216 207)]
   #;[border-right-color (rgb 182 216 207)]
   #;[border-bottom-color (rgb 182 216 207)]
   #;[border-left-color (rgb 182 216 207)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset 0 0 0 0]
   #;[border-image-repeat stretch stretch]
   [color (rgb 49 95 82)]
   [display block]
   [font-family "\"latoregular\""]
   [font-size (px 14)]
   [height (px 46)]
   [line-height (px 46)]
   [padding-top (px 0)]
   [padding-right (px 5)]
   [padding-bottom (px 0)]
   [padding-left (px 5)]
   [width (px 448)])
  ((desc (id body) (tag form) (tag label) (tag textarea))
   [background-color (rgb 209 211 212)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color (rgb 182 216 207)]
   #;[border-right-color (rgb 182 216 207)]
   #;[border-bottom-color (rgb 182 216 207)]
   #;[border-left-color (rgb 182 216 207)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset 0 0 0 0]
   #;[border-image-repeat stretch stretch]
   [color (rgb 49 95 82)]
   [display block]
   [font-family "\"latoregular\""]
   [font-size (px 14)]
   [height (px 250)]
   [line-height (px 30)]
   [overflow-x auto]
   [overflow-y auto]
   [padding-top (px 0)]
   [padding-right (px 5)]
   [padding-bottom (px 0)]
   [padding-left (px 5)]
   #;[resize none]
   [width (px 448)])
  ((desc (id body) (tag form) (and (tag input) (id send)))
   [background-color (rgb 7 112 84)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [border-top-width medium]
   [border-right-width medium]
   [border-bottom-width medium]
   [border-left-width medium]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color currentcolor]
   #;[border-right-color currentcolor]
   #;[border-bottom-color currentcolor]
   #;[border-left-color currentcolor]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset 0 0 0 0]
   #;[border-image-repeat stretch stretch]
   #;[border-top-left-radius (px 5)]
   #;[border-top-right-radius (px 5)]
   #;[border-bottom-right-radius (px 5)]
   #;[border-bottom-left-radius (px 5)]
   [color (rgb 153 250 153)]
   #;[cursor pointer]
   [font-family "\"latoregular\""]
   [font-size (px 14)]
   [float right]
   [height (px 30)]
   [margin-top (px 8)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [width (px 50)])
  ((desc (id body) (tag form) (and (tag input) (id send) (pseudo-class hover)))
   [background-color (rgb 211 163 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [color (rgb 0 0 0)])
  ((desc (id body) (and (tag ul) (class blog)))
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (id body) (and (tag ul) (class blog)) (tag li))
   [overflow-x hidden]
   [overflow-y hidden]
   [padding-top (px 104)]
   [padding-right (px 100)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (id body) (and (tag ul) (class blog)) (and (tag li) (pseudo-class first-child)))
   [padding-top (px 0)]
   [padding-right (px 100)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (id body) (and (tag ul) (class blog)) (tag li) (tag img))
   [display block]
   [float left]
   [margin-top (px 0)]
   [margin-right (px 20)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [max-width (% 100)]
   [width auto])
  ((desc (id body) (and (tag ul) (class blog)) (tag li) (tag h3))
   [line-height (px 20)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 8)]
   [padding-left (px 0)])
  ((desc (id body) (and (tag ul) (class blog)) (tag li) (tag h3) (tag a))
   [color (rgb 49 95 82)]
   #;[text-decoration-color currentcolor]
   #;[text-decoration-line none]
   #;[text-decoration-style solid])
  ((desc (id body) (and (tag div) (class content)) (and (tag div) (class sidebar)) (tag ul) (tag li) (tag h4) (tag a))
   [color (rgb 49 95 82)]
   #;[text-decoration-color currentcolor]
   #;[text-decoration-line none]
   #;[text-decoration-style solid])
  ((desc (id body) (and (tag ul) (class blog)) (tag li) (tag span))
   [display block]
   [line-height (px 30)])
  ((desc (id body) (and (tag div) (class content)) (and (tag div) (class article)) (tag span))
   [display block]
   [line-height (px 30)])
  ((desc (id body) (and (tag div) (class content)) (and (tag div) (class sidebar)) (tag ul) (tag li) (tag span))
   [display block]
   [line-height (px 30)])
  ((desc (id body) (and (tag div) (class content)) (and (tag div) (class article)))
   [width (px 570)])
  ((desc (id body) (and (tag div) (class content)) (and (tag div) (class article)) (tag img))
   [display block]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 9)]
   [margin-left (px 0)]
   [max-width (% 100)]
   [width auto])
  ((desc (id body) (and (tag div) (class content)) (and (tag div) (class article)) (tag p))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 30)]
   [padding-left (px 0)])
  ((desc (id body) (and (tag div) (class content)) (and (tag div) (class sidebar)))
   [float left]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 50)]
   [width (px 259)])
  ((desc (id body) (and (tag div) (class content)) (and (tag div) (class sidebar)) (tag ul))
   [padding-top (px 20)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (id body) (and (tag div) (class content)) (and (tag div) (class sidebar)) (tag ul) (tag li))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color (rgb 136 180 168)]
   [float none]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 18)]
   [padding-right (px 0)]
   [padding-bottom (px 28)]
   [padding-left (px 0)]
   [width auto])
  ((desc (id body) (and (tag div) (class content)) (and (tag div) (class sidebar)) (tag ul) (and (tag li) (pseudo-class first-child)))
   [border-top-width medium]
   [border-right-width medium]
   [border-bottom-width medium]
   [border-left-width medium]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color currentcolor]
   #;[border-right-color currentcolor]
   #;[border-bottom-color currentcolor]
   #;[border-left-color currentcolor]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset 0 0 0 0]
   #;[border-image-repeat stretch stretch]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 28)]
   [padding-left (px 0)])
  ((desc (id body) (and (tag div) (class content)) (and (tag div) (class sidebar)) (tag ul) (tag li) (tag h4))
   [line-height (px 30)]
   [text-align left])
  ((id footer)
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [max-width (px 960)]
   [overflow-x hidden]
   [overflow-y hidden]
   [padding-top (px 30)]
   [padding-right (px 0)]
   [padding-bottom (px 60)]
   [padding-left (px 0)])
  ((desc (id footer) (tag div))
   [float left]
   [width (px 500)])
  ((desc (id footer) (tag div) (tag span))
   [color (rgb 153 250 153)]
   [display block]
   [font-size (px 26)]
   [line-height (px 24)])
  ((desc (id footer) (tag div) (tag p))
   [color (rgb 182 216 207)]
   [font-size (px 12)]
   [line-height (px 30)])
  ((desc (id footer) (and (tag div) (id connect)))
   [float right]
   [overflow-x hidden]
   [overflow-y hidden]
   [width auto])
  ((desc (id footer) (and (tag div) (id connect)) (tag a))
   [background-color transparent]
   #;[background-image url("../images/icons.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [display block]
   [float left]
   [text-indent (px -99999)])
  ((desc (id footer) (and (tag div) (id connect)) (and (tag a) (id facebook)))
   #;[background-position-x (px 0)]
   #;[background-position-y (px 0)]
   [height (px 30)]
   [width (px 16)])
  ((desc (id footer) (and (tag div) (id connect)) (and (tag a) (id twitter)))
   #;[background-position-x (px 0)]
   #;[background-position-y (px -30)]
   [height (px 30)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 28)]
   [width (px 37)])
  ((desc (id footer) (and (tag div) (id connect)) (and (tag a) (id googleplus)))
   #;[background-position-x (px 0)]
   #;[background-position-y (px -61)]
   [height (px 32)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 19)]
   [width (px 32)])
  ((desc (id footer) (and (tag div) (id connect)) (and (tag a) (id googleplus)))
   #;[background-position-x (px 0)]
   #;[background-position-y (px -61)]
   [height (px 32)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 19)]
   [width (px 32)])
  ((desc (id footer) (and (tag div) (id connect)) (and (tag a) (id pinterest)))
   #;[background-position-x (px 0)]
   #;[background-position-y (px -94)]
   [height (px 30)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 23)]
   [width (px 30)])
  ((media (only (and screen (max-width (px 918)))) (id mobile-navigation))
   [background-color transparent]
   #;[background-image url("../images/mobile/mobile-menu.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (px 0)]
   #;[background-position-y (px 0)]
   #;[background-size auto auto]
   [display block]
   [height (px 50)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [position absolute]
   [right (px 0)]
   [top (px 20)]
   [width (px 50)]
   #;[z-index 1001])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (and (tag ul) (id navigation)) (tag li)))
   [background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [display block]
   [float none]
   [height auto]
   [line-height normal]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [text-align center]
   [width (% 100)])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (and (tag ul) (id navigation)) (and (tag li) (pseudo-class first-child))))
   [border-top-width medium]
   [border-right-width medium]
   [border-bottom-width medium]
   [border-left-width medium]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color currentcolor]
   #;[border-right-color currentcolor]
   #;[border-bottom-color currentcolor]
   #;[border-left-color currentcolor]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset 0 0 0 0]
   #;[border-image-repeat stretch stretch]
   [width (% 100)])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (and (tag ul) (id navigation)) (tag li) (tag ul) (and (tag li) (pseudo-class first-child))))
   [border-top-width medium]
   [border-right-width medium]
   [border-bottom-width medium]
   [border-left-width medium]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color currentcolor]
   #;[border-right-color currentcolor]
   #;[border-bottom-color currentcolor]
   #;[border-left-color currentcolor]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset 0 0 0 0]
   #;[border-image-repeat stretch stretch]
   [width (% 100)])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (and (tag ul) (id navigation)) (tag li) (tag a)))
   [background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color (rgb 153 250 153)]
   [color (rgb 255 255 255)]
   [display block]
   [font-family "Arial"]
   [font-size (em 0.8125)]
   [font-weight normal]
   [height (px 49)]
   [line-height (px 49)]
   [padding-top (px 0)]
   [padding-right (px 15)]
   [padding-bottom (px 0)]
   [padding-left (px 15)]
   [text-align left]
   [width auto])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (and (tag ul) (id navigation)) (tag li) (tag span)))
   [background-color transparent]
   #;[background-image url("../images/mobile/mobile-expand.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color (rgb 153 250 153)]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color (rgb 153 250 153)]
   [display block]
   [height (px 49)]
   [position absolute]
   [right (px 0)]
   [top (px 0)]
   [width (px 50)])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (and (tag ul) (id navigation)) (and (tag li) (class current)) (tag span)))
   [background-color transparent]
   #;[background-image url("../images/mobile/mobile-expand.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (and (tag ul) (id navigation)) (and (tag li) (class current)) (tag ul) (tag li) (tag a)))
   [background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [color (rgb 255 255 255)])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (and (tag ul) (id navigation)) (tag li) (and (tag a) (pseudo-class hover))))
   [background-color undefined]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [color (rgb 255 255 255)])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (and (tag ul) (id navigation)) (and (tag li) (class current)) (tag ul) (tag li) (and (tag a) (pseudo-class hover))))
   [background-color undefined]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [color (rgb 255 255 255)])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (and (tag ul) (id navigation)) (and (tag li) (class current)) (tag a)))
   [background-color undefined]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [color (rgb 255 255 255)])
  ((media (only (and screen (max-width (px 918)))) (child (desc (id header) (and (tag ul) (id navigation))) (and (tag li) (pseudo-class first-child)) (tag a)))
   [border-top-width medium]
   [border-right-width medium]
   [border-bottom-width medium]
   [border-left-width medium]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color currentcolor]
   #;[border-right-color currentcolor]
   #;[border-bottom-color currentcolor]
   #;[border-left-color currentcolor]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset 0 0 0 0]
   #;[border-image-repeat stretch stretch])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (and (tag ul) (id navigation)) (tag li) (tag ul)))
   [border-top-width (px 0)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color currentcolor]
   #;[border-right-color currentcolor]
   #;[border-bottom-color currentcolor]
   #;[border-left-color currentcolor]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset 0 0 0 0]
   #;[border-image-repeat stretch stretch]
   [display none]
   [left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[opacity 1]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [position relative]
   [top (px 0)]
   [width (% 100)])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (and (tag ul) (id navigation)) (tag li) (tag ul)))
   [display none])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (and (tag ul) (id navigation)) (and (tag li) (pseudo-class hover)) (tag ul)))
   [display none])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (and (tag ul) (id navigation)) (tag li) (tag ul) (tag li)))
   [background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-position-x (% 0)]
   #;[background-position-y (% 0)]
   #;[background-size auto auto]
   [height auto]
   [line-height normal]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [text-align left])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (and (tag ul) (id navigation)) (tag li) (tag ul) (tag li) (tag a)))
   [padding-top (px 0)]
   [padding-right (px 30)]
   [padding-bottom (px 0)]
   [padding-left (px 30)])
  ((media (only (and screen (max-width (px 918)))) (id header))
   [position relative]
   [width (% 90)])
  ((media (only (and screen (max-width (px 918)))) (desc (id header) (tag h1)))
   [padding-top (px 74)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((media (only (and screen (max-width (px 918)))) (id body))
   [margin-top (px 20)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [padding-top (px 45)]
   [padding-right (px 0)]
   [padding-bottom (px 46)]
   [padding-left (px 0)]
   [width (% 90)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag div) (id tagline))))
   [float none]
   [margin-top (px 20)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [width (% 90)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag div) (id tagline)) (tag h1)))
   #;[background-size 37% auto]
   [line-height (em 1)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 50)]
   [padding-left (px 0)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag div) (id tagline)) (tag p)))
   [font-size (em 5)]
   [line-height (em 1.25)]
   [padding-top (px 43)]
   [padding-right (px 10)]
   [padding-bottom (px 43)]
   [padding-left (px 10)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag img) (class figure))))
   [float none]
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [width (% 70)])
  ((media (only (and screen (max-width (px 918)))) (child (id body) (tag h2)))
   [padding-top (px 0)]
   [padding-right (px 20)]
   [padding-bottom (px 30)]
   [padding-left (px 20)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag div) (class content))))
   [padding-top (px 0)]
   [padding-right (px 20)]
   [padding-bottom (px 0)]
   [padding-left (px 20)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag div) (class content)) (tag div)))
   [float none]
   [width auto])
  ((media (only (and screen (max-width (px 918)))) (desc (id footer) (tag div)))
   [float none]
   [width auto])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag div) (class content)) (and (tag img) (class figure))))
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag div) (class content)) (tag div) (and (tag div) (class section))))
   [padding-top (px 30)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [width auto])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag div) (class content)) (tag div) (tag ul) (tag li)))
   [margin-top (px 0)]
   [margin-right (% 5)]
   [margin-bottom (px 0)]
   [margin-left (% 5)]
   [width (% 40)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag div) (class content)) (tag div) (tag ul) (and (tag li) (pseudo-class first-child))))
   [margin-top (px 0)]
   [margin-right (% 5)]
   [margin-bottom (px 0)]
   [margin-left (% 5)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (tag form)))
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [padding-top (px 0)]
   [padding-right (px 20)]
   [padding-bottom (px 0)]
   [padding-left (px 20)]
   [width auto])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (tag form) (tag h3)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag ul) (class blog)) (and (tag li) (pseudo-class first-child))))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (tag form) (tag label) (tag input)))
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 0)]
   [padding-top (px 0)]
   [padding-right (% 3)]
   [padding-bottom (px 0)]
   [padding-left (% 3)]
   [width (% 93)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (tag form) (tag label) (tag textarea)))
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 0)]
   [padding-top (px 0)]
   [padding-right (% 3)]
   [padding-bottom (px 0)]
   [padding-left (% 3)]
   [width (% 93)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (tag form) (and (tag input) (id send))))
   [margin-top (px 8)]
   [margin-right (px 2)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [text-align center])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag ul) (class blog))))
   [padding-top (px 0)]
   [padding-right (px 20)]
   [padding-bottom (px 0)]
   [padding-left (px 20)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag ul) (class blog)) (tag li)))
   [padding-top (px 30)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag ul) (class blog)) (tag li) (tag img)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 20)]
   [margin-left (px 0)]
   [width (% 100)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag ul) (class blog)) (tag li) (tag h3)))
   [line-height (em 1.35)])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag div) (class content)) (and (tag div) (class article))))
   [width auto])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag div) (class content)) (and (tag div) (class sidebar))))
   [float none]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [width auto])
  ((media (only (and screen (max-width (px 918)))) (desc (id body) (and (tag div) (class content)) (and (tag div) (class sidebar)) (tag ul) (and (tag li) (pseudo-class first-child))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((media (only (and screen (max-width (px 918)))) (id footer))
   [padding-top (px 20)]
   [padding-right (px 0)]
   [padding-bottom (px 20)]
   [padding-left (px 0)]
   [width (% 90)])
  ((media (only (and screen (max-width (px 918)))) (desc (id footer) (tag div) (tag span)))
   [line-height (em 1.25)]
   [text-align center])
  ((media (only (and screen (max-width (px 918)))) (desc (id footer) (tag div) (tag p)))
   [font-size (em 1.125)]
   [line-height (em 1.65)]
   [padding-top (px 20)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [text-align center])
  ((media (only (and screen (max-width (px 918)))) (desc (id footer) (and (tag div) (id connect))))
   [float none]
   [margin-top (px 30)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [max-width (px 185)])
  ((media (and screen (max-width (px 320))) (desc (id header) (tag h1)))
   [font-size (em 2.8125)])
  ((media (and screen (max-width (px 320))) (desc (id header) (tag h1) (tag a) (tag span)))
   [font-size (em 0.5)]
   [line-height (em 1.25)])
  ((media (and screen (max-width (px 320))) (desc (id body) (and (tag div) (id tagline)) (tag h1)))
   [font-size (em 4.375)])
  ((media (and screen (max-width (px 320))) (desc (id body) (and (tag div) (id tagline)) (tag p)))
   [font-size (em 3.125)])
  ((media (and screen (max-width (px 320))) (desc (id footer) (tag div) (tag p)))
   [font-size (em 1)]))

(define-fonts yoga
  [16 "serif" 400 normal 12 4 1.5 1.5 19]
  [14 "\"latoregular\"" 400 normal 11 3 1 1 16]
  [50 "\"latoregular\"" 400 normal 40 10 3 3 56]
  [26 "\"nixie_oneregular\"" 400 normal 21 5 2 2 30]
  [18 "\"latoregular\"" 400 normal 14 4 1.5 1.5 21]
  [100 "\"nixie_oneregular\"" 400 normal 80 20 7.5 7.5 115]
  [26 "\"latoregular\"" 400 normal 21 5 1.5 1.5 29]
  [12 "\"latoregular\"" 400 normal 10 2 0.5 0.5 13])

(define-layout (yoga :browser firefox :matched true :w 1267 :h 901 :fs 16)
 ([VIEW :w 1267 :spec (forall (a) (and (=> (matches a (id header)) (raw (ez.outside (ez.in a) a)))
                                       (=> (matches a (id body)) (= (top a outer) (bottom (prev a))))
                                       (=> (matches a (id footer)) (and (= (top a) (bottom (prev a) outer)) (= (width a) 960)))
                                       (= (top ?) 0.0) (= (left ?) 0.0)
                                       (onscreen a)))]
  ([BLOCK :x 0 :y 0 :w 1267 :h 1254.5 :elt 0]
   ([BLOCK :x 0 :y 0 :w 1267 :h 1254.5 :elt 1]
    ([BLOCK :x 153.5 :y 0 :w 960 :h 191.5 :elt 2
            :spec (forall (a)
                          (and (raw (no-margins ?)) (> (height ?) 0.0)
                               (=> (and (raw (ez.outside (ez.in ?) ?)) (onscreen ?))
                                   (and (raw (ez.inside (ez.out ?) ?)) (=> (is-interactive a) (onscreen a))))))]
     ([BLOCK :x 153.5 :y 0 :w 960 :h 160 :elt 3]
      ([ANON]
       ([LINE]
        ([INLINE :elt 4]
         ([TEXT :x 482 :y 27 :w 303 :h 56 :text "Belle & Carrie "]))))
      ([BLOCK :x 153.5 :y 80 :w 960 :h 50 :elt 5]
       ([LINE]
        ([TEXT :x 482.5 :y 90 :w 302 :h 30 :text "Rehabilitation Yoga"]))))
     ([ANON]
      ([LINE]
       ([INLINE :elt 6])))
     ([BLOCK :x 153.5 :y 160 :w 960 :h 31.5 :elt 7]
      ([LINE]
       ([INLINE :elt 8]
        ([INLINE :elt 9]
         ([TEXT :x 282.5 :y 164.5 :w 55 :h 21 :text "Home"]))
        ([TEXT :x 383.5 :y 168.5 :w 3 :h 16 :text " "]))
       ([INLINE :elt 10]
        ([INLINE :elt 11]
         ([TEXT :x 432.5 :y 164.5 :w 62 :h 21 :text "About"]))
        ([TEXT :x 540.5 :y 168.5 :w 3 :h 16 :text " "]))
       ([INLINE :elt 12]
        ([INLINE :elt 13]
         ([TEXT :x 589.5 :y 164.5 :w 73 :h 21 :text "Classes"]))
        ([TEXT :x 708.5 :y 168.5 :w 3 :h 16 :text " "])
        ([INLINE :elt 17]))
       ([INLINE :elt 18]
        ([INLINE :elt 19]
         ([TEXT :x 757.5 :y 164.5 :w 85 :h 21 :text "Contact"]))
        ([TEXT :x 888.5 :y 168.5 :w 3 :h 16 :text " "]))
       ([INLINE :elt 20]
        ([INLINE :elt 21]
         ([TEXT :x 937.5 :y 164.5 :w 47 :h 21 :text "Blog"]))
        ([TEXT :x 1030.5 :y 168.5 :w 0 :h 16 :text " "])))))
    ([BLOCK :x 153.5 :y 192.5 :w 960 :h 918 :elt 22
            :spec (forall (a)
                          (and (raw (non-negative-margins ?)) (> (height ?) 0.0)
                               (=> (raw (ez.outside (ez.in ?) ?)) (raw (ez.inside (ez.out ?) ?)))))]
     ([BLOCK :x 218.5 :y 347.5 :w 510 :h 498 :elt 23]
      ([BLOCK :x 218.5 :y 347.5 :w 510 :h 155 :elt 24]
       ([LINE]
        ([TEXT :x 328.5 :y 340 :w 290 :h 115 :text "Yoga"])))
      ([BLOCK :x 218.5 :y 502.5 :w 510 :h 343 :elt 25]
       ([LINE]
        ([TEXT :x 220 :y 538 :w 507 :h 115 :text " For Better "]))
       ([LINE]
        ([TEXT :x 262.5 :y 638 :w 422 :h 115 :text "Health & "]))
       ([LINE]
        ([TEXT :x 235 :y 738 :w 477 :h 115 :text "Flexibility "]))))
     ([BLOCK :x 752.5 :y 311.5 :w 283 :h 676 :elt 26]))
    ([BLOCK :x 153.5 :y 1110.5 :w 960 :h 144 :elt 27
            :spec (forall (a)
                          (and (raw (no-margins ?)) (> (height ?) 0.0)
                               (=> (and (raw (ez.outside (ez.in ?) ?)) (onscreen ?) (= (width ?) 960) (is-interactive a))
                                   (and (raw (ez.inside (ez.out ?) ?)) (onscreen a)))))]
     ([BLOCK :x 153.5 :y 1140.5 :w 500 :h 54 :elt 28]
      ([BLOCK :x 153.5 :y 1140.5 :w 500 :h 24 :elt 29]
       ([LINE]
        ([TEXT :x 153.5 :y 1138 :w 492 :h 29 :text "123 St. City Location, Country | 987654321"])))
      ([BLOCK :x 153.5 :y 1164.5 :w 500 :h 30 :elt 30]
       ([LINE]
        ([TEXT :x 153.5 :y 1173 :w 334 :h 13 :text " © 2023 by Belle & Carrie Rehabilitation Yoga. All rights reserved. "]))))
     ([BLOCK :x 928.5 :y 1140.5 :w 185 :h 32 :elt 31]
      ([BLOCK :x 928.5 :y 1140.5 :w 16 :h 30 :elt 32]
       ([LINE]
        ([TEXT :x -99070.5 :y 1140.5 :w 60 :h 16 :text "Facebook"])))
      ([BLOCK :x 972.5 :y 1140.5 :w 37 :h 30 :elt 33]
       ([LINE]
        ([TEXT :x -99026.5 :y 1140.5 :w 45 :h 16 :text "Twitter"])))
      ([BLOCK :x 1028.5 :y 1140.5 :w 32 :h 32 :elt 34]
       ([LINE]
        ([TEXT :x -98970.5 :y 1140.5 :w 52 :h 16 :text "Google+"])))
      ([BLOCK :x 1083.5 :y 1140.5 :w 30 :h 30 :elt 35]
       ([LINE]
        ([TEXT :x -98915.5 :y 1140.5 :w 57 :h 16 :text "Pinterest"])))))))))

(define-document yoga
  ([html :num 0]
   ([body :num 1]
    ([div :num 2 :id header]
     ([h1 :num 3]
      ([a :num 4] "Belle & Carrie "
       ([span :num 5] "Rehabilitation Yoga"))) " "
     ([span :num 6 :id mobile-navigation])
     ([ul :num 7 :id navigation]
      ([li :num 8 :class (current)] " "
       ([a :num 9] "Home") " ") " "
      ([li :num 10] " "
       ([a :num 11] "About") " ") " "
      ([li :num 12] " "
       ([a :num 13] "Classes") " "
       ([ul :num 14]
        ([li :num 15]
         ([a :num 16]))) " "
       ([span :num 17 :class (mobile-submenu)])) " "
      ([li :num 18] " "
       ([a :num 19] "Contact") " ") " "
      ([li :num 20] " "
       ([a :num 21] "Blog") " ")))
    ([div :num 22 :id body]
     ([div :num 23 :id tagline]
      ([h1 :num 24] "Yoga")
      ([p :num 25] " For Better Health & Flexibility ")) " "
     ([img :num 26 :class (figure) :w 283 :h 676]))
    ([div :num 27 :id footer]
     ([div :num 28]
      ([span :num 29] "123 St. City Location, Country | 987654321")
      ([p :num 30] " © 2023 by Belle & Carrie Rehabilitation Yoga. All rights reserved. ")) " "
     ([div :num 31 :id connect]
      ([a :num 32 :id facebook] "Facebook") " "
      ([a :num 33 :id twitter] "Twitter") " "
      ([a :num 34 :id googleplus] "Google+") " "
      ([a :num 35 :id pinterest] "Pinterest"))) " ")))

(define-problem yoga
  :title "Belle & Carrie Rehabilitation Yoga Web Template"
  :url "file:///tmp/cassius-get-bench.fKaFdo.zip/rehabilitation-yoga/rehabilitation-yoga/upload/index.html"
  :sheets yoga
  :fonts yoga
  :documents yoga
  :layouts yoga
  :error "Error, 0.5s is not a known unit"
  :features css:font-size css:max-width css:position css:min-height css:overflow-x css:overflow-y css:float css:text-indent @media unit:s color:rgba empty-text tag:img scrollbar float:2 unknown-error
  :test (forall (b) (=> (is-interactive b) (onscreen b))))
