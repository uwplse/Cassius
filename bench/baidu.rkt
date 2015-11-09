;; python get_bench.py --name baidu 'file:///tmp/baidu.html'

(define-header header
"")

;; From file:///tmp/baidu.html

(define-stylesheet doc-1
  ((tag body)
   [padding-top (padding/px 6)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   #;[position position/relative])
  ((or (tag p) (tag form) (tag ol) (tag ul) (tag li) (tag dl) (tag dt) (tag dd) (tag h3))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((tag input)
   [padding-top (padding/px 0)]
   [padding-bottom (padding/px 0)])
  ((or (tag table) (tag img))
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)])
  ((class container_l)
   [width (width/px 1222)])
  ((id content_left)
   [width (width/px 636)]
   [float float/left]
   [padding-left (padding/px 35)])
  ((id content_right)
   [border-left-width (border/px 1)]
   [float float/right])
  ((desc (class container_l) (id content_right))
   [width (width/px 434)])
  ((desc (id u) (tag a))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 5)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 5)])
  ((id head)
   [padding-left (padding/px 35)]
   [margin-bottom (margin/px 20)]
   [width (width/px 900)])
  ((class s_tab)
   [padding-top (padding/px 20)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [float float/left])
  ((class s_ipt_wr)
   [width (width/px 536)]
   [height (height/px 30)]
   [display display/inline-block]
   [margin-right (margin/px 5)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((class s_ipt)
   [width (width/px 523)]
   [height (height/px 22)]
   [margin-top (margin/px 5)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 7)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)])
  ((class s_btn)
   [width (width/px 95)]
   [height (height/px 32)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)])
  ((class s_btn_wr)
   [width (width/px 97)]
   [height (height/px 34)]
   [display display/inline-block])
  ((class bdsug)
   [display display/none]
   #;[position position/absolute]
   [width (width/px 538)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((desc (class bdsug) (tag li))
   [width (width/px 522)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 8)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 8)]
   #;[position position/relative])
  ((id page)
   [padding-left (padding/px 35)])
  ((or (desc (id page) (tag a)) (desc (id page) (tag strong)))
   [display display/inline-block]
   [height (height/px 66)]
   [text-align text-align/center]
   [margin-right (margin/px 9)])
  ((desc (id page) (class n))
   [height (height/px 34)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 18)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 18)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((desc (id page) (tag span))
   [display display/block])
  ((desc (id page) (class pc))
   [width (width/px 34)]
   [height (height/px 34)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((desc (id page) (class fk))
   [width (width/px 24)]
   [height (height/px 24)]
   [margin-bottom (margin/px 6)]
   [margin-left (margin/px 6)])
  ((desc (id page) (tag strong) (class pc))
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [width (width/px 36)]
   [height (height/px 36)])
  ((id rs)
   [width (width/px 900)]
   [padding-top (padding/px 8)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 8)]
   [padding-left (padding/px 0)]
   [margin-top (margin/px 20)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 15)])
  ((desc (id rs) (tag td))
   [width width/5%])
  ((desc (id rs) (tag th))
   [text-align text-align/left])
  ((desc (id rs) (class tt))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 20)])
  ((id foot)
   [height (height/px 20)]
   [text-align text-align/center])
  ((or (class to_zhidao) (class to_tieba) (class to_zhidao_bottom))
   [margin-top (margin/px 20)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 35)])
  ((desc (class to_tieba) (class c-icon-tieba))
   [float float/left])
  ((class t)
   [margin-bottom (margin/px 1)])
  ((class result)
   [width (width/px 438)])
  ((id mholder)
   [width (width/px 62)]
   #;[position position/relative]
   [margin-left (margin/px 9)]
   [margin-right (margin/px -12)]
   [display display/none])
  ((id mcon)
   [height (height/px 18)]
   #;[position position/absolute])
  ((desc (id mcon) (tag span))
   [display display/block])
  ((id mmenu)
   [width (width/px 56)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   #;[position position/absolute]
   [display display/none])
  ((desc (id mmenu) (tag a))
   [width width/100%]
   [height height/100%]
   [display display/block])
  ((desc (id mmenu) (class ln))
   [height (height/px 1)]
   [margin-top (margin/px -1)])
  ((class c-icons-outer)
   [display display/inline-block])
  ((class c-icons-inner)
   [margin-left (margin/px -4)])
  ((desc (class c-tip-icon) (tag i))
   [display display/inline-block])
  ((class c-tools)
   [display display/inline])
  ((id con-ar)
   [margin-bottom (margin/px 40)])
  ((desc (id con-ar) (class result-op))
   [margin-bottom (margin/px 28)])
  ((or (desc (id content_left) (class result-op)) (desc (id content_left) (class result)))
   [margin-bottom (margin/px 14)])
  ((desc (class general_image_pic) (tag a))
   [display display/block]
   [text-align text-align/left])
  ((class res-gap-right16)
   [margin-right (margin/px 16)])
  ((id ftcon)
   [display display/none])
  ((id u1)
   [display display/none])
  ((class s_ipt_wr)
   [height (height/px 32)])
  ((tag body)
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((class s_form)
   [height (height/px 55)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 10)])
  ((id result_logo)
   [float float/left]
   [margin-top (margin/px 7)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((desc (id result_logo) (tag img))
   [width (width/px 101)])
  ((id head)
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [width width/100%]
   [border-bottom-width (border/px 1)]
   #;[position position/fixed])
  ((class fm)
   #;[clear clear/none]
   [float float/left]
   [margin-top (margin/px 11)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 10)])
  ((id s_tab)
   [height (height/px 38)]
   [padding-top (padding/px 55)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 121)]
   [float float/none])
  ((or (desc (id s_tab) (tag a)) (desc (id s_tab) (tag b)))
   [width (width/px 54)]
   [display display/inline-block]
   [text-align text-align/center])
  ((desc (id s_tab) (tag b))
   [border-bottom-width (border/px 2)])
  ((id content_left)
   [width (width/px 540)]
   [padding-left (padding/px 121)]
   [padding-top (padding/px 5)])
  ((id content_right)
   [margin-top (margin/px 45)])
  ((id content_bottom)
   [width (width/px 540)]
   [padding-left (padding/px 121)])
  ((id page)
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 121)]
   [margin-top (margin/px 30)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 40)]
   [margin-left (margin/px 0)])
  ((or (class to_tieba) (class to_zhidao_bottom))
   [margin-top (margin/px 10)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 121)])
  ((class nums)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 121)]
   [height (height/px 42)])
  ((id rs)
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [margin-top (margin/px 6)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 121)]
   [width (width/px 600)])
  ((desc (id rs) (tag th))
   [width (width/px 175)])
  ((desc (id rs) (class tt))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((desc (id rs) (tag td))
   [width (width/px 5)])
  ((desc (id rs) (tag table))
   [width (width/px 540)])
  ((id help)
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 50)]
   [float float/right])
  ((desc (id help) (tag a))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 15)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 15)])
  ((id foot)
   [border-top-width (border/px 1)]
   [text-align text-align/left]
   [height (height/px 42)]
   [margin-top (margin/px 40)])
  ((class s_btn_wr)
   [width width/auto]
   [height height/auto]
   [border-bottom-width (border/px 1)])
  ((class s_btn)
   [width (width/px 100)]
   [height (height/px 34)]
   [border-bottom-width (border/px 1)])
  ((desc (class container_l) (id content_right))
   [width (width/px 384)])
  ((class container_l)
   [width (width/px 1212)])
  ((id lg)
   [display display/none])
  ((id m)
   [display display/none])
  ((id ftcon)
   [display display/none])
  ((desc (id head) (class headBlock))
   [margin-top (margin/px -5)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 6)]
   [margin-left (margin/px 121)])
  ((desc (id content_left) (class leftBlock))
   [margin-bottom (margin/px 14)]
   [padding-bottom (padding/px 5)]
   [border-bottom-width (border/px 1)])
  ((class hint_toprq_tips)
   #;[position position/relative]
   [width (width/px 537)]
   [height (height/px 19)]
   [display display/none])
  ((class hint_toprq_icon)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 4)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((class hint_toprq_tips_items)
   [width (width/px 444)]
   #;[position position/absolute])
  ((desc (class hint_toprq_tips_items) (tag div))
   [display display/inline-block]
   [float float/left]
   [height (height/px 19)]
   [margin-right (margin/px 18)])
  ((class nums)
   [width (width/px 538)])
  ((class head_nums_cont_outer)
   [height (height/px 40)]
   #;[position position/relative])
  ((desc (class search_tool_conter) (class c-gap-left))
   [margin-left (margin/px 23)])
  ((or (class search_tool) (class search_tool_close))
   [float float/right])
  ((class search_tool_conter)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 121)]
   [height (height/px 42)]
   [width (width/px 538)])
  ((class c-offset)
   [padding-left (padding/px 10)])
  ((class c-gap-top-small)
   [margin-top (margin/px 5)])
  ((class c-gap-top)
   [margin-top (margin/px 10)])
  ((class c-gap-bottom-small)
   [margin-bottom (margin/px 5)])
  ((class c-gap-bottom)
   [margin-bottom (margin/px 10)])
  ((class c-gap-left)
   [margin-left (margin/px 12)])
  ((class c-gap-left-small)
   [margin-left (margin/px 6)])
  ((class c-gap-right)
   [margin-right (margin/px 12)])
  ((class c-gap-right-small)
   [margin-right (margin/px 6)])
  ((class c-gap-left-large)
   [margin-left (margin/px 16)])
  ((class c-gap-icon-right-small)
   [margin-right (margin/px 5)])
  ((class c-gap-icon-right)
   [margin-right (margin/px 10)])
  ((class c-gap-icon-left-small)
   [margin-left (margin/px 5)])
  ((class c-container)
   [width (width/px 538)])
  ((class cr-content)
   [width (width/px 259)])
  ((class cr-offset)
   [padding-left (padding/px 17)])
  ((class cr-title-sub)
   [float float/right])
  ((class c-span4)
   [width (width/px 75)])
  ((class c-span6)
   [width (width/px 121)])
  ((class c-span18)
   [width (width/px 397)])
  ((class c-span24)
   [width (width/px 535)])
  ((or (class c-span2) (class c-span3) (class c-span4) (class c-span5) (class c-span6) (class c-span7) (class c-span8) (class c-span9) (class c-span10) (class c-span11) (class c-span12) (class c-span13) (class c-span14) (class c-span15) (class c-span16) (class c-span17) (class c-span18) (class c-span19) (class c-span20) (class c-span21) (class c-span22) (class c-span23) (class c-span24))
   [float float/left]
   [margin-right (margin/px 17)])
  ((class c-span-last)
   [margin-right (margin/px 0)])
  ((class c-span-last-s)
   [margin-right (margin/px 0)])
  ((desc (class container_l) (class cr-content))
   [width (width/px 351)])
  ((desc (class container_l) (class cr-content) (class c-span-last-s))
   [margin-right (margin/px 17)])
  ((class c-border)
   [width (width/px 518)]
   [padding-top (padding/px 9)]
   [padding-right (padding/px 9)]
   [padding-bottom (padding/px 9)]
   [padding-left (padding/px 9)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((desc (class c-border) (class c-gap-right))
   [margin-right (margin/px 10)])
  ((class c-vline)
   [display display/inline-block]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 3)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 3)]
   [border-left-width (border/px 1)]
   [width (width/px 0)]
   [height (height/px 12)])
  ((class c-icon)
   [display display/inline-block]
   [width (width/px 14)]
   [height (height/px 14)])
  ((or (class c-icon-star) (class c-icon-star-gray))
   [width (width/px 60)])
  ((or (class c-icon-qa-empty) (class c-icon-safeguard) (class c-icon-register-empty) (class c-icon-zan) (class c-icon-music) (class c-icon-music-gray) (class c-icon-location) (class c-icon-warning) (class c-icon-doc) (class c-icon-xls) (class c-icon-ppt) (class c-icon-pdf) (class c-icon-txt) (class c-icon-play-black) (class c-icon-gift) (class c-icon-baidu-share) (class c-icon-bear) (class c-icon-bear-border) (class c-icon-location-blue) (class c-icon-hotAirBall) (class c-icon-moon) (class c-icon-streetMap) (class c-icon-mv) (class c-icon-zhidao-s) (class c-icon-shopping))
   [width (width/px 16)]
   [height (height/px 16)])
  ((or (class c-icon-bear-circle) (class c-icon-warning-circle) (class c-icon-warning-triangle) (class c-icon-warning-circle-gray))
   [width (width/px 18)]
   [height (height/px 18)])
  ((or (class c-icon-tieba) (class c-icon-zhidao) (class c-icon-bear-p) (class c-icon-bear-pn))
   [width (width/px 24)]
   [height (height/px 24)])
  ((or (class c-icon-unfold) (class c-icon-fold) (class c-icon-chevron-unfold) (class c-icon-chevron-fold) (class c-icon-download) (class c-icon-lyric))
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((or (class c-icon-v) (class c-icon-hui) (class c-icon-bao) (class c-icon-person) (class c-icon-high-v) (class c-icon-phone) (class c-icon-nuo) (class c-icon-med) (class c-icon-air) (class c-icon-share2) (class c-icon-v1) (class c-icon-v2) (class c-icon-v3) (class c-icon-write))
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((or (class c-icon-v1) (class c-icon-v2) (class c-icon-v3) (class c-icon-v1-noborder) (class c-icon-v2-noborder) (class c-icon-v3-noborder) (class c-icon-v1-noborder-disable) (class c-icon-v2-noborder-disable) (class c-icon-v3-noborder-disable))
   [width (width/px 19)])
  ((or (class c-icon-download) (class c-icon-lyric))
   [width (width/px 16)]
   [height (height/px 16)])
  ((or (class c-icon-play-circle) (class c-icon-stop-circle))
   [width (width/px 18)]
   [height (height/px 18)])
  ((class c-recommend)
   [padding-top (padding/px 5)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 5)]
   [padding-left (padding/px 0)]
   [border-top-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width border/medium]
   [border-right-width (border/px 0)])
  ((desc (class c-recommend) (class c-icon))
   [margin-bottom (margin/px -4)])
  ((class c-text)
   [display display/inline-block]
   [padding-top (padding/px 2)]
   [padding-right (padding/px 2)]
   [padding-bottom (padding/px 2)]
   [padding-left (padding/px 2)]
   [text-align text-align/center])
  ((class c-text-info)
   [padding-left (padding/px 0)]
   [padding-right (padding/px 0)])
  ((desc (class c-text-info) (tag span))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 2)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 2)])
  ((class c-btn)
   [display display/inline-block]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 14)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 14)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [height (height/px 24)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   [text-align text-align/center])
  ((desc (class c-btn) (class c-icon))
   [margin-top (margin/px 5)])
  ((desc (class c-btn) (class c-icon))
   [float float/left])
  ((class c-img)
   [display display/block]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)])
  ((class c-img4)
   [width (width/px 75)])
  ((class c-img6)
   [width (width/px 121)])
  ((class c-table)
   [width width/100%])
  ((or (desc (class c-table) (tag th)) (desc (class c-table) (tag td)))
   [padding-left (padding/px 10)]
   [border-bottom-width (border/px 1)]
   [text-align text-align/left])
  (".cr-content .c-table th:first-child, .cr-content .c-table td:first-child"
   [padding-left (padding/px 0)])
  ((desc (class c-table) (tag th))
   [padding-top (padding/px 4)]
   [padding-bottom (padding/px 4)])
  ((desc (class c-table) (tag td))
   [padding-top (padding/px 6.5)]
   [padding-bottom (padding/px 6.5)])
  ((class c-tabs-nav)
   [border-bottom-width (border/px 1)])
  ((desc (class c-tabs-nav) (class c-tabs-nav-view))
   [margin-bottom (margin/px -1)])
  ((desc (class c-tabs-nav) (class c-tabs-nav-view) (class c-tabs-nav-li))
   [margin-bottom (margin/px 0)])
  ((desc (class c-tabs-nav) (class c-tabs-nav-more))
   [float float/left])
  ((desc (class c-tabs-nav) (tag li))
   [display display/inline-block]
   [margin-bottom (margin/px -1)]
   [padding-top (padding/px 3)]
   [padding-right (padding/px 15)]
   [padding-bottom (padding/px 3)]
   [padding-left (padding/px 15)]
   [border-top-width (border/px 2)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 1)])
  ((desc (class c-tabs-nav) (class c-tabs-nav-sep))
   [height (height/px 16)]
   [width (width/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [margin-bottom (margin/px 4)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 1)])
  ((id seth)
   [display display/none])
  ((id setf)
   [display display/none])
  ((class s_ipt_wr)
   [border-top-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   [display display/inline-block]
   [width (width/px 539)]
   [margin-right (margin/px 0)]
   [border-right-width (border/px 0)])
  ((class s_ipt)
   [width (width/px 526)]
   [height (height/px 22)]
   [margin-top (margin/px 6)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 7)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)])
  ((id u)
   #;[position position/absolute]
   [margin-top (margin/px 21)]
   [margin-right (margin/px 9)]
   [margin-bottom (margin/px 5)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((desc (id u) (tag a))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 7)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 7)])
  ((desc (class quickdelete-wrap) (tag input))
   [width (width/px 500)])
  ((desc (class wrapper_l) (class quickdelete-wrap) (tag input))
   [width (width/px 500)])
  ((class quickdelete)
   [width (width/px 32)]
   [height (height/px 32)]
   #;[position position/absolute]
   [display display/block])
  ((desc (class op-bk-polysemy-other) (tag span))
   [display display/block])
  ((class op_dict3_gap_small)
   [margin-right (margin/px 7)])
  ((class op_dict3_marginRight)
   [margin-right (margin/px 15)])
  ((desc (class op_dict3_english_result_table) (class op_dict_text1))
   [float float/left])
  ((desc (class op_dict3_english_result_table) (class op_dict_text2))
   [float float/left]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((class op_dict_fmp_flash_div)
   [height (height/px 1)]
   [width (width/px 1)]
   #;[position position/absolute])
  ((or (class op_dict3_how_read) (class op_dict3_mp3_play))
   [display display/block]
   [width (width/px 14)]
   [height (height/px 11)]
   [margin-right (margin/px 8)]
   [margin-top (margin/px 7)])
  ((class op_dict3_font24)
   [height (height/px 24)])
  ((or (class op_dict3_lineone_result) (class op_dict3_linetwo_result))
   [display display/none]
   [width (width/px 518)])
  ((class op_dict3_linetwo_result)
   [width (width/px 480)])
  ((desc (class op_dict3_lineone_result) (tag span))
   [float float/left]
   [width (width/px 471)])
  (".op_dict3_lineone_result span.op_dict3_lineone_result_tip"
   [width (width/px 47)])
  ((or (class op_dict3_all_trans) (class op_dict3_linetwo_result) (class op_dict3_more_example))
   [padding-left (padding/px 47)])
  ((class op_dict3_more_example)
   [display display/none])
  ((class op_dict3_read1)
   [float float/left])
  ((class op_dict3_readline)
   [margin-bottom (margin/px 12)])
  ((desc (class op_dict3_read1) (tag span))
   [height (height/px 24)]
   [float float/left])
  ((class op_dict3_extra)
   [border-top-width (border/px 1)]
   [padding-top (padding/px 6)]
   [margin-top (margin/px 6)])
  ((desc (class op_dict3_extra_transform) (tag span))
   [display display/inline-block]
   [margin-right (margin/px 12)])
  ((desc (class op-musicsongs-songs) (tag input))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((desc (class op-musicsongs-songs) (tag td))
   [padding-top (padding/px 8)]
   [padding-bottom (padding/px 6)])
  (".op-musicsongs-songs td.op-musicsongs-songs-icon"
   [padding-top (padding/px 7)]
   [padding-bottom (padding/px 7)])
  ((class op-musicsongs-earth)
   [display display/inline-block]
   [width (width/px 12)]
   [height (height/px 13)])
  ((class opui-music-icon)
   [height (height/px 17)]
   [width (width/px 18)]
   [display display/inline-block])
  ((desc (class op_sp_realtime_bigpic5_preBox) (tag img))
   [float float/left]
   [height (height/px 81)])
  ((class opr-recommends-merge-imgtext)
   [display display/block])
  ((class opr-recommends-merge-hide)
   [display display/none])
  ((class opr-recommends-merge-item)
   [text-align text-align/center])
  ((class opr-recommends-merge-mask)
   #;[position position/absolute]
   [width width/100%])
  ((class opr-recommends-merge-lastspan)
   [display display/none])
  ((desc (class container_l) (class opr-recommends-merge-lastspan))
   [display display/block])
  ((desc (class opr-toplist-table) (class opr-toplist-right))
   [text-align text-align/right])
  ((or (class opr-recommends-merge-p) (class opr-recommends-merge-img) (class opr-recommends-merge-mask))
   [height (height/px 75)])
  ((class head_nums_cont_outer)
   [width (width/px 810)])
  ((id help)
   [float float/left]
   [padding-left (padding/px 121)]))

(define-document (doc-1 #:width 1907 #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 1907 :h (/ 64051 30)]
   ([BLOCK :tag BODY :x 0 :y 0 :w 1907 :h (/ 64051 30)]
    ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h (/ 64051 30) :id wrapper :class (wrapper_l)]
     ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 56 :id head]
      ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 55 :class (head_wrapper)]
       ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 55 :class (s_form)]
        ([BLOCK :tag DIV :x 10 :y 0 :w 1897 :h 0 :class (s_form_wrapper)]
         ([MAGIC :tag A :x 10 :y 7 :w 101 :h 35.8 :id result_logo])
         ([MAGIC :tag FORM :x 121 :y 11 :w 640 :h 35 :id form :class (fm)]))
        ([ANON]))
       ([MAGIC :tag DIV :x 1746 :y 21 :w 152 :h 16 :id u])))
     ([MAGIC :tag DIV :x 0 :y 0 :w 1907 :h 93 :id s_tab :class (s_tab)])
     ([BLOCK :tag DIV :x 0 :y 93 :w 1907 :h (/ 61261 30) :id wrapper_wrapper]
      ([MAGIC :tag DIV :x 0 :y 93 :w 1212 :h (/ 58771 30) :id container :class (container_l)]
       ([BLOCK :tag DIV :x 810 :y 138 :w 402 :h 791.3 :id content_right :class (cr-offset)]
        ([MAGIC :tag TABLE :x 828 :y 138 #|:w 351|# :h 791.3 :mt 0 :mr 0 :mb 0 :ml 0]))
       ([MAGIC :tag DIV :x 0 :y 93 :w 810 :h 40 :class (head_nums_cont_outer OP_LOG)])
       ([MAGIC :tag DIV :x 0 :y 133 :w 661 :h (/ 50371 30) :id content_left])
       #;([BLOCK :tag DIV :x 0 :y 133 :w 661 :h (/ 50371 30) :id content_left]
        ([BLOCK :tag DIV :x 121 :y 138 :w 540 :h 25 :class (leftBlock)]
         ([BLOCK :tag DIV :x 121 :y 138 :w 537 :h 19 :class (hint_toprq_tips f13 se_common_hint) :id e10010]
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :class (hint_toprq_icon)]
             ([TEXT :x 145 :y 140 :w 56 :h 17]))))
          ([MAGIC :tag SPAN :x 216 :y 139 :w 444 :h 19 :class (hint_toprq_tips_items)])))
        ([BLOCK :tag DIV :x 121 :y 177 :w 538 #|:h 169.75|# :id 1 :class (result-op c-container xpath-log)]
         ([BLOCK :tag H3 :x 121 :y 177 :w 538 :h (/ 739 30) :class (t c-gap-bottom-small)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y (/ 2170 12) :w 32 :h 17]))
            ([TEXT :x 153 :y (/ 2158 12) :w 73 :h 20]))))
         ([MAGIC :tag DIV :x 121 :y (/ 6199 30) :w 538 :h 140.1 :class (c-row)]))
        ([BLOCK :tag DIV :x 121 :y 360.75 :w 538 #|:h (/ 4406 15)|# :id 2 :class (result-op c-container xpath-log)]
         ([BLOCK :tag H3 :x 121 :y 360.75 :w 538 :h (/ 739 30) :class (t c-gap-bottom-small)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y (/ 10937 30) :w 32 :h 17]))
            ([TEXT :x 153 :y (/ 10907 30) :w 73 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y (/ 5856 15) :w 538 :h (/ 2869 12) :class (c-border)]
          ([MAGIC :tag DIV :x 131 :y (/ 6006 15) :w 518 :h (/ 2629 12) :class (op_dict_content)])
          ([MAGIC :tag DIV :x 1906 :y (/ 9292 15) :w 1 :h 1 :class (op_dict_fmp_flash_div)]))
         ([MAGIC :tag DIV :x 121 :y (/ 9517 15) :w 538 :h 20 :class (c-gap-top-small)]))
        ([BLOCK :tag DIV :x 121 :y (/ 20055 30) :w 538 #|:h 236.7|# :id 3 :class (result-op c-container)]
         ([BLOCK :tag H3 :x 121 :y (/ 20055 30) :w 538 :h (/ 739 30) :class (t c-gap-bottom-small)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y 672.3 :w 32 :h 17]))
            ([TEXT :x 153 :y 671.3 :w 226 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y 698.1 :w 538 :h (/ 5611 30) :class (c-tabs test-tabs)]
          ([MAGIC :tag DIV :x 121 :y 698.1 :w 538 :h 28 :class (c-tabs-nav)])
          ([MAGIC :tag DIV :x 121 :y (/ 10892 15) :w 538 :h 159 :class (c-tabs-content)]))
         ([MAGIC :tag DIV :x 121 :y 885.15 :w 538 :h 20]))
        ([BLOCK :tag DIV :x 121 :y (/ 5515 6) :w 538 #|:h 203.125|# :id 4 :class (result-op c-container xpath-log)]
         ([BLOCK :tag H3 :x 121 :y (/ 5515 6) :w 538 :h (/ 739 30) :class (t)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y 939 :w 32 :h 17]))
            ([TEXT :x 153 :y 938 :w 112 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y 944.8 :w 538 #|:h (/ 2293 12)|# :class (c-offset)]
          ([BLOCK :tag DIV :x 131 :y 944.8 :w 528 :h 20 :class (c-gap-bottom-small)]
           ([LINE]
            ([INLINE :tag A]
             ([TEXT :x 131 :y 946.3 :w 216 :h 17])
             ([INLINE :tag EM]
              ([TEXT :x 347 :y 947.3 :w 29 :h 15]))
             ([TEXT :x 376 :y 947.3 :w 31 :h 15]))))
          ([BLOCK :tag DIV :x 131 :y (/ 11638 12) :w 528 :h 81 :class (c-row c-gap-bottom-small)]
           ([MAGIC :tag A :x 131 :y (/ 11638 12) :w 121 :h 81 :class (op_sp_realtime_bigpic5_preBox c-span6)])
           ([MAGIC :tag DIV :x 131 :y (/ 11638 12) :w 528 :h (/ 1201 15) :class (c-span-last)]))
          ([BLOCK :tag DIV :x 131 :y (/ 12670 12) :w 528 :h 20 :class (c-row)]
           ([MAGIC :tag SPAN :x 605 :y (/ 12670 12) :w 54 :h 20 :id e10016])
           ([MAGIC]))
          ([BLOCK :tag DIV :x 131 :y (/ 6455 6) :w 528 :h 20 :class (c-row)]
           ([MAGIC :tag SPAN :x 605 :y (/ 6455 6) :w 54 :h 20 :id e10018])
           ([MAGIC]))
          ([BLOCK :tag DIV :x 131 :y 1095.85 :w 528 :h 20 :class (c-row)]
           ([MAGIC :tag SPAN :x 605 :y 1095.85 :w 54 :h 20 :id e10020])
           ([MAGIC]))
          ([BLOCK :tag DIV :x 131 :y (/ 16738 15) :w 528 :h 20 :class (c-row)]
           ([MAGIC :tag SPAN :x 605 :y (/ 16738 15) :w 54 :h 20 :id e10022])
           ([MAGIC]))
          ([MAGIC :h (/ 1 60)])))
        ([BLOCK :tag DIV :x 121 :y 1149.9 :w 538 :h 85.7 :id 5 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y 1149.9 :w 538 :h (/ 739 30) :class (t)]
          ([LINE]
           ([INLINE :tag A]
            ([TEXT :x 121 :y 1152.7 :w 96 :h 20])
            ([INLINE :tag EM]
             ([TEXT :x 217 :y 1153.7 :w 35 :h 17]))
            ([TEXT :x 252 :y 1152.7 :w 216 :h 20]))))
         ([MAGIC :tag DIV :x 121 :y (/ 35265 30) :w 538 :h (/ 1201 30) :class (c-abstract)])
         ([MAGIC :tag DIV :x 121 :y 1215.55 :w 538 :h 20 :class (f13)]))
        ([BLOCK :tag DIV :x 121 :y (/ 37487 30) :w 538 :h 117.875 :id 6 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y (/ 37487 30) :w 538 :h (/ 739 30) :class (t)]
          ([LINE]
           ([INLINE :tag A]
            ([TEXT :x 121 :y (/ 18801 15) :w 43 :h 17])
            ([INLINE :tag EM]
             ([TEXT :x 164 :y (/ 18801 15) :w 32 :h 17]))
            ([TEXT :x 196 :y (/ 18786 15) :w 137 :h 20]))))
         ([MAGIC :tag P :x 121 :y 1275.2 :w 538 :h 20 :class (f13 m)])
         ([MAGIC :tag DIV :x 121 :y (/ 38857 30) :w 538 :h 60.05 :class (c-abstract)])
         ([MAGIC :tag DIV :x 121 :y (/ 20329 15) :w 538 :h 20 :class (f13)]))
        ([BLOCK :tag DIV :x 121 :y 1302.5 :w 538 :h 109.7 :id 7 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y 1302.5 :w 538 :h (/ 739 30) :class (t)]
          ([LINE]
           ([INLINE :tag A]
            ([TEXT :x 121 :y 1392.1 :w 57 :h 20])
            ([INLINE :tag EM]
             ([TEXT :x 178 :y 1393.1 :w 35 :h 17]))
            ([TEXT :x 213 :y 1392.1 :w 397 :h 20]))))
         ([MAGIC :tag DIV :x 121 :y (/ 17027 12) :w 538 :h (/ 1201 15) :class (c-row c-gap-top-small)]))
        ([BLOCK :tag DIV :x 121 :y 1539 :w 538 :h 85.7 :id 8 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y 1539 :w 538 :h (/ 739 30) :class (t)]
          ([LINE]
           ([INLINE :tag A]
            ([TEXT :x 121 :y 1515.8 :w 187 :h 20])
            ([INLINE :tag EM]
             ([TEXT :x 308 :y 1516.8 :w 35 :h 17]))
            ([TEXT :x 343 :y 1515.8 :w 264 :h 20]))))
         ([MAGIC :tag DIV :x 121 :y (/ 23079 15) :w 538 :h (/ 1201 30) :class (c-abstract)])
         ([MAGIC :tag DIV :x 121 :y 1578.65 :w 538 :h 20 :class (f13)]))
        ([BLOCK :tag DIV :x 121 :y (/ 4838 3) :w 538 :h 85.7 :id 9 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y (/ 4838 3) :w 538 :h (/ 739 30) :class (t)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y (/ 48495 30) :w 35 :h 17]))
            ([TEXT :x 156 :y (/ 48465 30) :w 266 :h 20]))))
         ([MAGIC :tag DIV :x 121 :y 1638.3 :w 538 :h (/ 1201 30) :class (c-abstract)])
         ([MAGIC :tag DIV :x 121 :y (/ 5035 3) :w 538 :h 20 :class (f13)]))
        ([BLOCK :tag DIV :x 121 :y 1712.35 :w 538 :h 85.7 :id 10 :class (result-op c-container)]
         ([BLOCK :tag H3 :x 121 :y 1712.35 :w 538 :h (/ 739 30) :class (t)]
          ([LINE]
           ([INLINE :tag A]
            ([TEXT :x 121 :y (/ 10291 6) :w 16 :h 20])
            ([INLINE :tag EM]
             ([TEXT :x 137 :y (/ 10297 6) :w 32 :h 17]))
            ([TEXT :x 169 :y (/ 10291 6) :w 48 :h 20])
            ([INLINE :tag EM]
             ([TEXT :x 217 :y (/ 10297 6) :w 32 :h 17]))
            ([TEXT :x 249 :y (/ 10291 6) :w 127 :h 20])
            ([INLINE :tag EM]
             ([TEXT :x 376 :y (/ 10297 6) :w 32 :h 17]))
            ([TEXT :x 408 :y (/ 10291 6) :w 109 :h 20]))))
         ([MAGIC :tag DIV :x 121 :y 1767 :w 538])
         ([MAGIC :tag DIV :x 121 :y 1778 :w 538 :h 0 :class (op_qidian_l)])
         ([MAGIC :tag DIV :x 121 :y 1778 :w 538 :h 20])))
       ([BLOCK :tag DIV :x 0 :y (/ 54361 30) #|:w 1212|# :h 0 :id e10026])
       ([MAGIC :tag P :x 121 :y (/ 54661 30) :w 1091 :h 24 :class (to_tieba)])
       ([MAGIC :tag DIV :x 121 :y (/ 55561 30) :w 600 :h 104 :id rs])
       ([MAGIC :tag DIV :x 0 :y (/ 59581 30) :w 1212 :h 66 :id page]))
      ([BLOCK :tag DIV :x 0 :y (/ 62761 30) :w 1907 :h 43 :id foot]
       ;; Why is :w 331 bad? Everything adds up. This is so weird.
       ([BLOCK :tag SPAN :x 0 :y (/ 62791 30) #|:w 331|# :h 42 :id help]
        ([LINE]
         ([INLINE :tag A]
          ([TEXT :x 136 :y (/ 63181 30) :w 24 :h 16]))
         ([INLINE :tag A]
          ([TEXT :x 190 :y (/ 63181 30) :w 24 :h 16]))
         ([INLINE :tag A :class (feedback)]
          ([TEXT :x 244 :y (/ 63181 30) :w 72 :h 16]))))))))))

(define-problem verify
  #:header header
  #:sheet doc-1
  #:documents doc-1)
