;; python get_bench.py --name amazon 'file:///tmp/Amazon.html'

(define-header header
"")

;; From file:///tmp/Amazon.html

(define-stylesheet doc-1
  ((tag body)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 8)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 8)])
  ("html.a-js body, html.a-no-js body"
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((id navbar)
   #;[position position/relative]
   [margin-top (margin/px 0)]
   [margin-right (margin/px -8)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px -8)]
   [display display/block])
  ((desc (class a-js) (id navbar))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((or (id nav-belt) (desc (id navbar) (class nav-belt)))
   #;[position position/relative]
   [width width/100%])
  ((or (desc (id nav-belt) (class nav-fill)) (desc (id nav-belt) (class nav-left)) (desc (id nav-belt) (class nav-right)) (desc (id navbar) (class nav-belt) (class nav-fill)) (desc (id navbar) (class nav-belt) (class nav-left)) (desc (id navbar) (class nav-belt) (class nav-right)))
   [height (height/px 39)])
  ((or (id nav-main) (desc (id navbar) (class nav-main)))
   [width width/100%]
   [height (height/px 60)]
   [padding-top (padding/px 5)]
   #;[position position/relative])
  ((or (desc (id nav-main) (class nav-fill)) (desc (id nav-main) (class nav-left)) (desc (id nav-main) (class nav-right)) (desc (id navbar) (class nav-main) (class nav-fill)) (desc (id navbar) (class nav-main) (class nav-left)) (desc (id navbar) (class nav-main) (class nav-right)))
   [height (height/px 55)])
  ("#nav-main span.nav-arrow, #navbar .nav-main span.nav-arrow"
   [display display/none])
  ((id nav-tools)
   [float float/left]
   [padding-top (padding/px 4)]
   [padding-right (padding/px 7)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 32)])
  ((or (desc (id nav-tools) (class nav-a)) (desc (id navbar) (class nav-tools) (class nav-a)))
   #;[position position/relative]
   [float float/left]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 10)]
   [height (height/px 50)])
  ((or (desc (id nav-tools) (class nav-a-2)) (desc (id navbar) (class nav-tools) (class nav-a-2)))
   [padding-right (padding/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 1)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 1)]
   [display display/inline-block])
  ((or (desc (id nav-tools) (class nav-a-2) (class nav-line-1)) (desc (id nav-tools) (class nav-a-2) (class nav-line-2)) (desc (id nav-tools) (class nav-a-2) (class nav-line-3)) (desc (id nav-tools) (class nav-a-2) (class nav-line-4)) (desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-1)) (desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-2)) (desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-3)) (desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-4)))
   [float float/left]
   #;[clear clear/both]
   [display display/inline-block]
   [padding-right (padding/px 11)])
  ((or (desc (id nav-tools) (class nav-a-2) (class nav-line-1)) (desc (id nav-tools) (class nav-a-2) (class nav-line-3)) (desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-1)) (desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-3)))
   [height (height/px 14)]
   [margin-top (margin/px 9)])
  ((or (desc (id nav-tools) (class nav-a-2) (class nav-line-2)) (desc (id nav-tools) (class nav-a-2) (class nav-line-4)) (desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-2)) (desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-4)))
   [padding-bottom (padding/px 5)])
  ((or (desc (id nav-tools) (class nav-a-2) (class nav-line-2) (class nav-icon)) (desc (id nav-tools) (class nav-a-2) (class nav-line-4) (class nav-icon)) (desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-2) (class nav-icon)) (desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-4) (class nav-icon)))
   [display display/inline-block]
   [border-right-width (border/px 4)]
   [border-left-width (border/px 4)]
   [border-top-width (border/px 4)]
   [border-bottom-width (border/px 0)]
   [width (width/px 0)]
   [height (height/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 2)]
   [margin-left (margin/px 5)])
  ((or (desc (id nav-tools) (class nav-a-2) (class nav-line-3)) (desc (id nav-tools) (class nav-a-2) (class nav-line-4)) (desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-3)) (desc (id navbar) (class nav-tools) (class nav-a-2) (class nav-line-4)))
   [display display/none])
  ((or (desc (id nav-tools) (id nav-cart-count)) (desc (id navbar) (class nav-tools) (id nav-cart-count)))
   #;[position position/absolute]
   [width (width/px 20)]
   [text-align text-align/center])
  ((or (desc (id nav-tools) (id nav-cart) (class nav-cart-0)) (desc (id nav-tools) (class nav-cart) (class nav-cart-0)) (desc (id navbar) (class nav-tools) (id nav-cart) (class nav-cart-0)) (desc (id navbar) (class nav-tools) (class nav-cart) (class nav-cart-0)))
   [width (width/px 19)])
  ((or (desc (id nav-tools) (id nav-cart) (class nav-cart-icon)) (desc (id nav-tools) (class nav-cart) (class nav-cart-icon)) (desc (id navbar) (class nav-tools) (id nav-cart) (class nav-cart-icon)) (desc (id navbar) (class nav-tools) (class nav-cart) (class nav-cart-icon)))
   [display display/block]
   #;[position position/absolute]
   [width (width/px 38)]
   [height (height/px 26)])
  ((or (desc (id nav-tools) (id nav-cart) (class nav-line-1)) (desc (id nav-tools) (id nav-cart) (class nav-line-2)) (desc (id nav-tools) (class nav-cart) (class nav-line-1)) (desc (id nav-tools) (class nav-cart) (class nav-line-2)) (desc (id navbar) (class nav-tools) (id nav-cart) (class nav-line-1)) (desc (id navbar) (class nav-tools) (id nav-cart) (class nav-line-2)) (desc (id navbar) (class nav-tools) (class nav-cart) (class nav-line-1)) (desc (id navbar) (class nav-tools) (class nav-cart) (class nav-line-2)))
   [margin-left (margin/px 42)])
  ((id nav-shop)
   [float float/left]
   [padding-top (padding/px 4)]
   [padding-right (padding/px 27)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 6)])
  ((desc (id nav-shop) (class nav-a))
   #;[position position/relative]
   [float float/left]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 10)]
   [height (height/px 50)])
  ((desc (id nav-shop) (class nav-a-2))
   [padding-right (padding/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 1)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 1)]
   [display display/inline-block])
  ((or (desc (id nav-shop) (class nav-a-2) (class nav-line-1)) (desc (id nav-shop) (class nav-a-2) (class nav-line-2)))
   [float float/left]
   #;[clear clear/both]
   [display display/inline-block]
   [padding-right (padding/px 11)])
  ((desc (id nav-shop) (class nav-a-2) (class nav-line-1))
   [height (height/px 14)]
   [margin-top (margin/px 9)])
  ((desc (id nav-shop) (class nav-a-2) (class nav-line-2))
   [padding-bottom (padding/px 5)])
  ((desc (id nav-shop) (class nav-a-2) (class nav-line-2) (class nav-icon))
   [display display/inline-block]
   [border-right-width (border/px 4)]
   [border-left-width (border/px 4)]
   [border-top-width (border/px 4)]
   [border-bottom-width (border/px 0)]
   [width (width/px 0)]
   [height (height/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 2)]
   [margin-left (margin/px 5)])
  ((id nav-xshop-container)
   #;[position position/relative]
   [float float/left]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((id nav-xshop)
   [margin-top (margin/px 30)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((desc (class nav-xshop-small) (id nav-xshop))
   [margin-top (margin/px 20)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((desc (id nav-xshop) (class nav-a))
   [float float/left]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 10)]
   [margin-bottom (margin/px 25)])
  ("#nav-xshop .nav-a:first-child"
   [padding-left (padding/px 0)])
  ((id nav-swmslot)
   #;[position position/relative]
   [height (height/px 39)]
   [display display/inline])
  ((class nav-left)
   #;[position position/relative]
   [float float/left]
   [width width/auto]
   [display display/inline-block])
  ((class nav-right)
   #;[position position/relative]
   [float float/right]
   [width width/auto]
   [display display/inline-block])
  ((class nav-fill)
   [width width/auto])
  (".nav-action-button, .nav-action-button:link"
   [display display/block]
   [height (height/px 33)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 10)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 11)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   [text-align text-align/center])
  (".nav-action-button .nav-action-inner, .nav-action-button:link .nav-action-inner"
   [display display/block]
   [text-align text-align/center])
  ((class nav-column)
   [float float/left]
   #;[clear clear/none])
  ((class nav-column-notfirst)
   [margin-left (margin/px -12)])
  ((id nav-logo)
   #;[position position/relative]
   [float float/left]
   [padding-top (padding/px 9)]
   [padding-right (padding/px 22)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 18)]
   [height height/100%])
  ((desc (id nav-logo) (class nav-logo-link))
   #;[clear clear/both]
   [display display/inline-block])
  ((desc (id nav-logo) (class nav-logo-base))
   [float float/left]
   [width (width/px 96)]
   [height (height/px 29)])
  ((desc (id nav-logo) (class nav-logo-ext))
   [float float/left]
   [display display/none])
  ((desc (id nav-logo) (class nav-logo-locale))
   [float float/left]
   [display display/none]
   [margin-top (margin/px 6)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 1)])
  ((or (class nav-tpl-discoveryPanelList) (class nav-tpl-discoveryPanelSummary) (class nav-tpl-itemList))
   [width (width/px 210)])
  ((or (desc (class nav-tpl-discoveryPanelList) (class nav-item)) (desc (class nav-tpl-discoveryPanelSummary) (class nav-item)) (desc (class nav-tpl-itemList) (class nav-item)))
   #;[position position/relative]
   [display display/block]
   #;[clear clear/both]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 7)]
   [padding-left (padding/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((or (desc (class nav-tpl-discoveryPanelList) (class nav-text)) (desc (class nav-tpl-discoveryPanelSummary) (class nav-text)) (desc (class nav-tpl-itemList) (class nav-text)))
   [display display/block])
  ((or (desc (class nav-tpl-discoveryPanelList) (class nav-subtext)) (desc (class nav-tpl-discoveryPanelSummary) (class nav-subtext)) (desc (class nav-tpl-itemList) (class nav-subtext)))
   [display display/block])
  ((or (desc (class nav-tpl-discoveryPanelList) (class nav-title)) (desc (class nav-tpl-discoveryPanelSummary) (class nav-title)) (desc (class nav-tpl-itemList) (class nav-title)))
   [padding-bottom (padding/px 10)])
  ((or (desc (class nav-tpl-discoveryPanelList) (class nav-divider)) (desc (class nav-tpl-discoveryPanelSummary) (class nav-divider)) (desc (class nav-tpl-itemList) (class nav-divider)))
   #;[position position/relative]
   [display display/block]
   [height (height/px 1)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 9)]
   [margin-left (margin/px 0)])
  ((id nav-subnav)
   #;[position position/relative]
   [display display/none]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 9)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 3)]
   [border-top-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [height (height/px 33)])
  ((id navfooter)
   [margin-top (margin/px 30)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 8)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 7)]
   [padding-left (padding/px 0)])
  ((desc (id navfooter) (tag img))
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)])
  ((desc (id navfooter) (tag table))
   [width width/100%])
  ((desc (id navfooter) (tag td))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 10)])
  ("#navFooter table.navFooterVerticalColumn"
   [margin-top (margin/px 0)]
   [margin-right margin/auto]
   [margin-bottom (margin/px 0)]
   [margin-left margin/auto]
   [width width/auto])
  ((desc (class navFooterVerticalColumn) (class navFooterColSpacerInner))
   [width width/10%]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 15)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 15)])
  ((desc (class navFooterLinkCol) (tag ul))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((desc (class navFooterLinkCol) (tag ul) (tag li))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 8)]
   [margin-left (margin/px 0)])
  ((class navFooterColHead)
   [margin-top (margin/px 6)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 14)]
   [margin-left (margin/px 0)])
  ("div.navFooterLine"
   [text-align text-align/center])
  ("div.navFooterLogoLine"
   [margin-top (margin/px 30)]
   [margin-right (margin/px 8)]
   [margin-bottom (margin/px 4)]
   [margin-left (margin/px 8)])
  ((class navFooterLinkLine)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 8)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 8)])
  ((or (desc (class navFooterLinkLine) (tag span)) (desc (class navFooterLinkLine) (tag ul)))
   [display display/inline-block]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((desc (class navFooterLinkLine) (tag ul) (tag li))
   [display display/inline])
  (".navFooterLinkCol ul li.nav_a_carat"
   #;[position position/relative]
   [padding-left (padding/px 0)])
  (".navFooterLinkCol ul li.nav_a_carat a"
   [padding-left (padding/px 4)])
  ((or (desc (class navFooterPadItemLine) (tag a)) (desc (class navFooterPadItemLine) (tag span)))
   [padding-top (padding/px 0)]
   [padding-right padding/0.6em]
   [padding-bottom (padding/px 0)]
   [padding-left padding/0.6em])
  ((class navFooterDescLine)
   [margin-top (margin/px 20)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 14)]
   [margin-left (margin/px 0)])
  ((class navFooterDescSpacer)
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((desc (id navfooter) (class navFooterBackToTop))
   [margin-bottom (margin/px 25)])
  ((desc (id navfooter) (class navFooterBackToTop) (tag span))
   [display display/block]
   [text-align text-align/center]
   [padding-top (padding/px 15)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 15)]
   [padding-left (padding/px 0)])
  ((desc (id navfooter) (class navFooterDescItem))
   [padding-top (padding/px 0)]
   [padding-right padding/0.75em]
   [padding-bottom (padding/px 0)]
   [padding-left padding/0.75em]
   [text-align text-align/left])
  ((class navFooterDescText)
   [display display/block]
   [margin-bottom (margin/px 1)])
  ((id nav-swmslot)
   #;[position position/relative]
   [height (height/px 39)])
  ((id navswmholiday)
   [border-top-width border/medium]
   [border-right-width border/medium]
   [border-bottom-width border/medium]
   [border-left-width border/medium]
   [text-align text-align/right])
  ((id nav-search)
   #;[position position/relative]
   [display display/block]
   [width width/auto]
   [margin-top (margin/px 10)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((desc (id nav-search) (class nav-searchbar))
   [display display/block]
   #;[position position/relative])
  ((or (desc (id nav-search) (class nav-searchbar) (class nav-fill)) (desc (id nav-search) (class nav-searchbar) (class nav-left)) (desc (id nav-search) (class nav-searchbar) (class nav-right)))
   #;[position position/relative]
   [height (height/px 35)])
  ((desc (id nav-search) (class nav-search-scope))
   #;[position position/relative]
   [float float/left]
   [height (height/px 35)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-left (padding/px 5)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((desc (id nav-search) (class nav-search-facade))
   #;[position position/relative]
   [float float/left])
  ((desc (id nav-search) (class nav-search-facade) (class nav-search-label))
   [display display/block]
   [margin-right (margin/px 21)]
   [margin-left (margin/px 5)])
  ((desc (id nav-search) (class nav-search-facade) (class nav-icon))
   #;[position position/absolute]
   [border-right-width (border/px 4)]
   [border-left-width (border/px 4)]
   [border-top-width (border/px 4)]
   [border-bottom-width (border/px 0)]
   [width (width/px 0)]
   [height (height/px 0)])
  ((desc (id nav-search) (class nav-search-dropdown))
   #;[position position/absolute]
   [display display/block]
   [height (height/px 35)]
   [width width/auto]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)])
  ((desc (id nav-search) (class nav-search-submit))
   #;[position position/relative]
   [height (height/px 35)]
   [width (width/px 42)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((desc (id nav-search) (class nav-search-submit) (class nav-search-submit-text))
   #;[position position/absolute]
   [text-align text-align/center])
  ((desc (id nav-search) (class nav-search-submit) (class nav-input))
   #;[position position/relative]
   [display display/block]
   [height height/100%]
   [width width/100%]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [border-top-width border/medium]
   [border-right-width border/medium]
   [border-bottom-width border/medium]
   [border-left-width border/medium])
  ((desc (id nav-search) (class nav-search-field))
   #;[position position/relative]
   [height (height/px 35)]
   [border-top-width (border/px 1)]
   [border-bottom-width (border/px 1)])
  ((desc (id nav-search) (class nav-search-field) (class nav-input))
   #;[position position/absolute]
   [display display/block]
   [width width/100%]
   [padding-top (padding/px 6)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 6)]
   [padding-left (padding/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [height (height/px 33)])
  ((desc (id nav-search) (id nav-iss-attach))
   #;[position position/absolute]
   [width width/100%]
   [height (height/px 0)])
  ((id nav-flyout-iss-anchor)
   #;[position position/absolute]
   [width width/100%]
   [height (height/px 0)])
  ((desc (id nav-flyout-iss-anchor) (class nav-issFlyout))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((class nav-flyout)
   #;[position position/absolute]
   [display display/none]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   [padding-top (padding/px 14)]
   [padding-right (padding/px 14)]
   [padding-bottom (padding/px 14)]
   [padding-left (padding/px 14)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((desc (class nav-flyout) (class nav-arrow))
   [border-right-width (border/px 9)]
   [border-left-width (border/px 9)]
   [border-top-width (border/px 0)]
   [border-bottom-width (border/px 9)]
   [width (width/px 0)]
   [height (height/px 0)]
   #;[position position/absolute])
  ((desc (class nav-flyout) (class nav-arrow-inner))
   [border-right-width (border/px 9)]
   [border-left-width (border/px 9)]
   [border-top-width (border/px 0)]
   [border-bottom-width (border/px 9)]
   [width (width/px 0)]
   [height (height/px 0)]
   #;[position position/absolute])
  ((id nav-flyout-anchor)
   #;[position position/absolute]
   [width width/100%]
   [height (height/px 0)])
  ((class nav-coreFlyout)
   [margin-top (margin/px -3)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px -2)]
   [padding-bottom (padding/px 7)]
   [width (width/px 240)])
  ((desc (class nav-coreFlyout) (class nav-arrow))
   [margin-left (margin/px -1)])
  ((class nav-catFlyout)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((desc (class nav-catFlyout) (class nav-promo))
   #;[position position/absolute]
   [border-top-width border/medium]
   [border-right-width border/medium]
   [border-bottom-width border/medium]
   [border-left-width border/medium]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 14)])
  ((desc (class nav-catFlyout) (class nav-flyout-content))
   [float float/left]
   #;[clear clear/none]
   [width (width/px 238)]
   [padding-top (padding/px 14)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 8)]
   [padding-left (padding/px 0)])
  ((desc (class nav-catFlyout) (class nav-flyout-content) (class nav-item))
   #;[position position/relative]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 8)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 14)]
   [padding-right (padding/px 8)])
  ((desc (class nav-catFlyout) (class nav-flyout-content) (class nav-divider))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 7)]
   [margin-bottom (margin/px 9)]
   [margin-left (margin/px 14)])
  ((desc (class nav-catFlyout) (class nav-subcats))
   #;[position position/relative]
   [float float/left]
   [display display/none]
   [margin-left (margin/px 3)]
   [border-left-width (border/px 1)]
   #;[clear clear/none])
  ((desc (class nav-catFlyout) (class nav-subcat))
   #;[position position/relative]
   [display display/none]
   [padding-top (padding/px 15)]
   [width width/auto]
   [height height/100%])
  ((desc (class nav-catFlyout) (class nav-subcat) (class nav-item))
   [width (width/px 220)])
  ((desc (class nav-catFlyout) (class nav-subcat) (class nav-panel))
   [width (width/px 220)]
   [margin-right (margin/px 27)])
  ((desc (class nav-catFlyout) (class nav-subcat) (class nav-divider))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 7)]
   [margin-bottom (margin/px 9)]
   [margin-left (margin/px 20)]
   [width (width/px 220)])
  ((desc (class nav-catFlyout) (class nav-colcount-2))
   [width (width/px 499)])
  ((or (id nav-flyout-cart) (id nav-flyout-prime) (id nav-flyout-shopall) (id nav-flyout-wishlist) (id nav-flyout-youraccount))
   [margin-top (margin/px -6)])
  ((id nav-flyout-transientflyout)
   [margin-top (margin/px 8)]
   [width width/auto]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((desc (id nav-flyout-transientflyout) (class nav-arrow))
   [margin-left (margin/px -9)])
  ((desc (id nav-flyout-shopall) (class nav-arrow))
   [margin-left (margin/px -1)])
  ((id nav-flyout-ya-signin)
   [border-bottom-width (border/px 1)]
   [margin-bottom (margin/px 8)])
  ((desc (id nav-flyout-ya-signin) (class nav_pop_new_cust))
   [margin-top (margin/px 7)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 9)]
   [margin-left (margin/px 0)])
  ("#nav-flyout-ya-signin a.nav-a, #nav-flyout-ya-signin a.nav-a:link, #nav-flyout-ya-signin a.nav-a:visited"
   [display display/inline])
  ((desc (id nav-flyout-prime) (class nav-flyout-content))
   [width width/auto]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((id nav-flyout-primetooltip)
   [padding-top (padding/px 3)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 3)]
   [padding-left (padding/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 10)])
  ((desc (id nav-flyout-primetooltip) (class nav-arrow))
   #;[position position/absolute]
   [border-top-width (border/px 9)]
   [border-bottom-width (border/px 9)]
   [border-right-width (border/px 9)]
   [border-left-width (border/px 0)]
   [width (width/px 0)]
   [height (height/px 0)])
  ((desc (id nav-flyout-primetooltip) (class nav-arrow) (class nav-arrow-inner))
   #;[position position/absolute]
   [border-top-width (border/px 9)]
   [border-bottom-width (border/px 9)]
   [border-right-width (border/px 9)]
   [border-left-width (border/px 0)]
   [width (width/px 0)]
   [height (height/px 0)])
  ((desc (class nav-signin-tt) (class nav-arrow))
   [margin-left (margin/px -9)])
  ((id nav-signin-tooltip)
   [text-align text-align/center])
  ((desc (id nav-signin-tooltip) (class nav-signin-tooltip-footer))
   [padding-top (padding/px 10)])
  ((desc (id nav-signin-tooltip) (class nav-signin-tooltip-footer) (class nav-a))
   [padding-left (padding/px 3)])
  ((desc (id navbar) (id nav-search-submit-text))
   [width (width/px 21)]
   [height (height/px 21)])
  ((desc (id navbar) (id nav-logo))
   [width (width/px 186)])
  ((desc (id navbar) (id nav-search) (class nav-fill))
   [height (height/px 35)])
  ((desc (id navbar) (id nav-search) (class nav-search-scope))
   [border-left-width (border/px 1)]
   [border-top-width (border/px 1)]
   [border-bottom-width (border/px 1)])
  ((desc (id navbar) (id nav-search) (class nav-search-field))
   [border-top-width border/medium]
   [border-right-width border/medium]
   [border-bottom-width border/medium]
   [border-left-width border/medium])
  ((desc (id navbar) (id nav-search) (class nav-search-submit))
   [border-top-width border/medium]
   [border-right-width border/medium]
   [border-bottom-width border/medium]
   [border-left-width border/medium]
   [width (width/px 45)])
  ((desc (id navbar) (id nav-search) (id nav-search-submit-text))
   [width (width/px 21)]
   [height (height/px 21)])
  ((desc (id navbar) (id nav-search))
   [margin-top (margin/px 0)]
   [padding-top (padding/px 11)]
   [padding-right (padding/px 25)])
  ((desc (id navbar) (id nav-search) (class nav-searchbar))
   [margin-bottom (margin/px 0)])
  ((desc (id navbar) (id nav-xshop))
   [margin-top (margin/px 32)]
   [height (height/px 37)])
  ((desc (id navbar) (id nav-logo))
   [width (width/px 192)]
   [padding-top (padding/px 13)]
   [padding-right (padding/px 19)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 27)])
  ((desc (id navbar) (id nav-shop))
   [padding-top (padding/px 6)]
   [padding-right (padding/px 27)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 15)]
   [margin-top (margin/px 2)]
   [width (width/px 192)])
  ((desc (id navbar) (id nav-shop) (class nav-a))
   [height (height/px 44)])
  ((desc (id navbar) (id nav-tools))
   [padding-top (padding/px 6)]
   [margin-top (margin/px 2)])
  ((desc (id navbar) (id nav-tools) (class nav-a))
   [height (height/px 44)])
  ((or (desc (id navbar) (id nav-flyout-cart)) (desc (id navbar) (id nav-flyout-prime)) (desc (id navbar) (id nav-flyout-shopall)) (desc (id navbar) (id nav-flyout-wishlist)) (desc (id navbar) (id nav-flyout-youraccount)))
   [margin-top (margin/px -2)])
  ((or (tag article) (tag aside) (tag details) (tag figcaption) (tag figure) (tag footer) (tag header) (tag hgroup) (tag nav) (tag section))
   [display display/block])
  ((tag img)
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)])
  ((or (tag button) (tag input) (tag select) (tag textarea))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((tag body)
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  (".a-icon, .a-link-emphasis::after"
   [display display/inline-block])
  ((or (class a-icon-prime) (class a-prime-logo))
   [width (width/px 52)]
   [height (height/px 16)])
  (".a-icon-prime.a-icon-small, .a-prime-logo.a-icon-small"
   [width (width/px 47)]
   [height (height/px 15)])
  ((class a-icon-star-medium)
   [width (width/px 95)]
   [height (height/px 21)]
   [margin-right (margin/px 1)])
  ((or (class a-icon-next) (class a-icon-previous) (class a-icon-restart))
   [width (width/px 15)]
   [height (height/px 19)]
   [margin-top (margin/px 3)]
   [margin-right (margin/px 3)]
   [margin-bottom (margin/px 3)]
   [margin-left (margin/px 4)])
  ((class a-icon-next)
   [margin-top (margin/px 3)]
   [margin-right (margin/px 4)]
   [margin-bottom (margin/px 3)]
   [margin-left (margin/px 3)])
  ((or (class a-icon-text-separator) (class a-text-separator))
   [display display/inline-block]
   [margin-top (margin/px -2)]
   [margin-right margin/0.67375em]
   [margin-bottom (margin/px 0)]
   [margin-left margin/0.67375em]
   [width (width/px 1)]
   [height (height/px 14)])
  ((class a-icon-row)
   [display display/block])
  (".a-icon-row.a-spacing-none"
   [padding-bottom (padding/px 0)])
  ((class a-icon-alt)
   #;[position position/absolute]
   [display display/block]
   [width (width/px 1)]
   [height (height/px 1)])
  ((class a-icon-star)
   [width (width/px 80)]
   [height (height/px 18)])
  ((class a-icon-row)
   [padding-top (padding/px 1)]
   [padding-bottom (padding/px 1)])
  ((or (tag h1) (tag h2) (tag h3) (tag h4) (tag h5) (tag h6))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((or (tag h1) (tag h2) (tag h3) (tag h4))
   [padding-bottom (padding/px 4)])
  ("h1:last-child, h2:last-child, h3:last-child, h4:last-child"
   [padding-bottom (padding/px 0)])
  ((tag p)
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 14)]
   [margin-left (margin/px 0)])
  ("p:last-child"
   [margin-bottom (margin/px 0)])
  ("p + p"
   [margin-top (margin/px -4)])
  ((class a-row)
   [width width/100%])
  (".a-ws div.a-column, div.a-column"
   [margin-right margin/2%]
   [float float/left])
  ((or (desc (class a-row) (class a-span4)) (desc (class a-ws) (class a-row) (class a-ws-span4)))
   [width width/31.948%])
  ((or (desc (class a-row) (class a-span6)) (desc (class a-ws) (class a-row) (class a-ws-span6)))
   [width width/48.948%])
  ((or (desc (class a-row) (class a-span8)) (desc (class a-ws) (class a-row) (class a-ws-span8)))
   [width width/65.948%])
  (".a-column.a-span-last"
   [margin-right (margin/px 0)]
   [float float/right])
  (".a-ws .a-ws-span12, div.a-column.a-span-last"
   [margin-right (margin/px 0)]
   [float float/right])
  ((class a-button)
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   [display display/inline-block]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [text-align text-align/center])
  ((class a-button-text)
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [display display/block]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 11)]
   [text-align text-align/center])
  ("a.a-button-text, button.a-button-text"
   [width width/100%]
   [height height/100%])
  ((class a-button-inner)
   [display display/block]
   #;[position position/relative]
   [height (height/px 29)])
  ((class a-button-input)
   #;[position position/absolute]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [height height/100%]
   [width width/100%])
  ((class a-button-image)
   [height height/auto])
  ((desc (class a-button-image) (class a-button-inner))
   [padding-top (padding/px 6)]
   [padding-right (padding/px 6)]
   [padding-bottom (padding/px 6)]
   [padding-left (padding/px 6)]
   [height height/auto])
  ((or (class a-inline-block) (class aok-inline-block))
   [display display/inline-block])
  ((or (class a-spacing-none) (desc (class a-ws) (class a-ws-spacing-none)))
   [margin-bottom (margin/px 0)])
  ((or (class a-spacing-mini) (desc (class a-ws) (class a-ws-spacing-mini)))
   [margin-bottom (margin/px 6)])
  ((or (class a-spacing-medium) (desc (class a-ws) (class a-ws-spacing-medium)))
   [margin-bottom (margin/px 18)])
  ((class a-text-center)
   [text-align text-align/center])
  ((class a-text-right)
   [text-align text-align/right])
  ((or (class a-float-left) (class aok-float-left))
   [float float/left])
  ((class a-section)
   [margin-bottom (margin/px 22)])
  (".a-section:last-child"
   [margin-bottom (margin/px 0)])
  ((tag hr)
   [display display/block]
   [height (height/px 1)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [border-top-width (border/px 1)]
   [margin-top (margin/px 0)]
   [margin-bottom (margin/px 14)])
  ("a.a-link-child"
   [display display/inline-block]
   #;[position position/relative]
   [padding-left (padding/px 8)])
  ((tag table)
   [margin-bottom (margin/px 18)]
   [width width/100%])
  ("table:last-child"
   [margin-bottom (margin/px 0)])
  ("td:first-child, th:first-child"
   [padding-left (padding/px 0)])
  ("td:last-child, th:last-child"
   [padding-right (padding/px 0)])
  ("tr:last-child td, tr:last-child th"
   [padding-bottom (padding/px 0)])
  ("tr:first-child td, tr:first-child th"
   [padding-top (padding/px 0)])
  ((or (tag td) (tag th))
   [padding-top (padding/px 3)]
   [padding-right (padding/px 3)]
   [padding-bottom (padding/px 3)]
   [padding-left (padding/px 3)])
  ((tag ul)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 18)]
   [margin-left (margin/px 18)])
  ((tag ol)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 18)]
   [margin-left (margin/px 20)])
  ((or (tag ol) (tag ul))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((or (desc (tag ol) (tag li)) (desc (tag ul) (tag li)))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ("ol:last-child, ul:last-child"
   [margin-bottom (margin/px 0)])
  ("ol.a-nostyle, ul.a-nostyle"
   [margin-left (margin/px 0)])
  ("ol.a-horizontal, ul.a-horizontal"
   [display display/block]
   [margin-left (margin/px 0)])
  ("ol.a-horizontal li, ul.a-horizontal li"
   [display display/inline-block]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 10)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ("ol.a-horizontal li.a-last, ol.a-horizontal li:last-child, ul.a-horizontal li.a-last, ul.a-horizontal li:last-child"
   [margin-right (margin/px 0)])
  ((tag form)
   [margin-bottom (margin/px 14)])
  ((class a-popover-preload)
   [display display/none])
  ((class a-carousel-state)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((class a-carousel-header-row)
   [margin-bottom (margin/px 20)])
  ((desc (class a-carousel-header-row) (class a-span-last))
   [float float/right])
  ((class a-carousel-row-inner)
   #;[position position/relative]
   [height height/100%])
  ((desc (class a-carousel-has-buttons) (class a-carousel-center))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 40)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 40)])
  ((class a-carousel-left)
   [padding-left (padding/px 3)])
  ((class a-carousel-right)
   [text-align text-align/right]
   [padding-right (padding/px 3)])
  ((or (class a-carousel-left) (class a-carousel-right))
   [width (width/px 40)]
   [height height/100%]
   #;[position position/absolute])
  ((class a-carousel-viewport)
   [width width/100%])
  ((class a-carousel-button)
   #;[position position/relative]
   [margin-top (margin/px -16)])
  ("ol.a-carousel"
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [height height/100%])
  ((class a-carousel-card)
   [text-align text-align/left]
   [margin-left (margin/px 16)]
   [width (width/px 160)]
   [display display/inline-block])
  ((desc (class a-carousel-display-single) (class a-carousel-card))
   [width width/100%]
   [text-align text-align/center]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((or (desc (class gw-ftGr-desktop-hero) (class gw-hero-image) (class cropped-image-map-size) (tag img)) (desc (class gw-ftGr-desktop-hero) (class image-map) (class cropped-image-map-size) (tag img)))
   [height (height/px 300)]
   [width (width/px 1500)])
  ((or (desc (id gw-desktop-herotator) (class gw-hero-image) (class cropped-image-map-size)) (desc (id gw-desktop-herotator) (class image-map) (class cropped-image-map-size)))
   [height (height/px 300)]
   [width width/100%])
  ((id gw-desktop-herotator-controls)
   #;[position position/absolute]
   [height (height/px 0)]
   [width width/100%])
  ((desc (id gw-desktop-herotator-controls) (tag ol))
   [margin-top (margin/px 0)]
   [margin-right margin/auto]
   [margin-bottom (margin/px 0)]
   [margin-left margin/auto]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   #;[position position/relative])
  ((desc (id gw-desktop-herotator-controls) (tag ol) (tag li))
   [display display/none])
  ((desc (class gw-desktop-herotator-ready) (id gw-desktop-herotator-controls) (tag ol) (tag li))
   [display display/block]
   [float float/left]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 5)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 5)])
  ((desc (class gw-desktop-herotator-ready) (id gw-desktop-herotator-controls) (tag ol) (tag li) (tag a))
   [display display/block]
   [width (width/px 12)]
   [height (height/px 13)])
  ((id pagecontent)
   [width (width/px 1500)]
   [margin-top margin/auto]
   [margin-right margin/auto]
   [margin-bottom margin/auto]
   [margin-left margin/auto])
  ((desc (id pagecontent) (tag hr))
   [margin-top (margin/px 0)]
   [margin-right margin/auto]
   [margin-bottom (margin/px 0)]
   [margin-left margin/auto]
   [height (height/px 1)]
   [border-top-width border/medium]
   [border-right-width border/medium]
   [border-bottom-width border/medium]
   [border-left-width border/medium])
  ((desc (id sidebar) (tag hr))
   [width width/100%]
   [margin-top (margin/px 15)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 15)]
   [margin-left (margin/px 0)])
  ("#sidebar hr.desktop-ad-atf-hr"
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 15)]
   [margin-left (margin/px 0)])
  ((class billboardRowWrapper)
   [padding-top (padding/px 12)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 12)]
   [padding-left (padding/px 0)])
  ("#a-page .billboardRow a.a-link-normal"
   [padding-top padding/45.45%]
   #;[position position/relative]
   [display display/block]
   [margin-top margin/auto]
   [margin-right margin/auto]
   [margin-bottom margin/auto]
   [margin-left margin/auto])
  ((desc (id a-page) (class billboardRow) (tag img))
   #;[position position/absolute]
   [height height/100%])
  ((class billboard)
   [display display/inline-block]
   [width width/100%]
   [height height/100%]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 10)]
   [text-align text-align/center])
  ((id sidebar)
   #;[position position/relative]
   [padding-top (padding/px 10)]
   [padding-right (padding/px 23)]
   [padding-bottom (padding/px 10)]
   [padding-left (padding/px 23)])
  ((id btfcontent)
   [padding-top (padding/px 5)]
   [padding-right (padding/px 20)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 20)])
  ((or (class bestsellers) (class desktop-row) (class sidekick))
   [width width/100%])
  ((class displayAd)
   [padding-top (padding/px 5)]
   [width (width/px 300)]
   #;[position position/relative]
   [margin-left (margin/px -18)])
  ((id dar2)
   [height (height/px 270)])
  ((desc (id maincontent) (class slot-hr))
   [display display/none])
  ((desc (class first-carousel) (class feed-carousel-control))
   [display display/inline])
  ("div.feed-carousel"
   [width width/100%]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 5)]
   [margin-left (margin/px 0)]
   #;[position position/relative])
  ((desc (class feed-carousel) (class feed-carousel-viewport))
   [width width/100%]
   #;[position position/relative]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((desc (class feed-carousel) (class feed-carousel-shelf))
   [display display/inline-block]
   #;[position position/relative]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 14)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((desc (class feed-carousel) (class spinner))
   [display display/none]
   #;[position position/absolute]
   [text-align text-align/center]
   [padding-top (padding/px 50)])
  ((desc (class feed-carousel) (class feed-carousel-control))
   #;[position position/absolute]
   [height (height/px 100)]
   [width (width/px 45)]
   [text-align text-align/center]
   [display display/none])
  ((desc (class feed-carousel) (class feed-left))
   [padding-right (padding/px 5)])
  ((desc (class feed-carousel) (class feed-right))
   [padding-left (padding/px 5)])
  ((desc (class feed-carousel) (class feed-arrow))
   [display display/inline-block]
   #;[position position/relative]
   [height (height/px 22)]
   [width (width/px 13)]
   [margin-top (margin/px -11)])
  ((desc (class feed-carousel) (class feed-scrollbar))
   [display display/block]
   #;[position position/absolute]
   [height (height/px 6)]
   [width width/100%])
  ((desc (class feed-carousel) (class feed-scrollbar-track))
   [display display/block]
   [height (height/px 1)]
   [width width/100%]
   #;[position position/relative]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((desc (class feed-carousel) (class feed-scrollbar-thumb))
   [display display/none]
   [height (height/px 6)]
   [width (width/px 0)]
   #;[position position/absolute]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((class fresh-shoveler)
   [padding-top (padding/px 10)]
   [padding-right (padding/px 20)]
   [padding-bottom (padding/px 10)]
   [padding-left (padding/px 20)])
  ((desc (class fresh-shoveler) (class as-title-block))
   [margin-top (margin/px 10)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((desc (class fresh-shoveler) (class as-title-block-left))
   [display display/block]
   [width width/auto]
   [float float/left]
   [padding-bottom (padding/px 0)])
  ((desc (class fresh-shoveler) (class as-title-block-right))
   [display display/block]
   [width width/auto]
   [float float/left]
   [text-align text-align/right]
   [padding-left (padding/px 15)])
  ((desc (class fresh-shoveler) (class feed-carousel-card))
   [text-align text-align/center]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 10)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   #;[position position/relative])
  ((desc (class fresh-shoveler) (class feed-carousel) (class feed-carousel-card) (class product-image))
   [width width/auto]
   [height height/auto])
  ((desc (class fresh-shoveler) (class feed-carousel) (class feed-carousel-card))
   [display display/none])
  ((class cropped-image-map-size)
   #;[position position/relative]
   [width width/100%])
  ((class cropped-image-map-center-alignment)
   [text-align text-align/center]
   #;[position position/absolute])
  (".scalable-image-map a.a-link-normal"
   [display display/inline-block])
  ((id desktop-0)
   [margin-top (margin/px 20)]
   [margin-bottom (margin/px 20)])
  ((class billboardRow)
   [margin-bottom (margin/px 15)])
  ((desc (id pagecontent) (class billboardrow-hr))
   [margin-bottom (margin/px 20)])
  ((id nav-prime-tooltip)
   [padding-top (padding/px 0)]
   [padding-right (padding/px 20)]
   [padding-bottom (padding/px 2)]
   [padding-left (padding/px 20)])
  (".nav-npt-text-detail, a.nav-npt-a"
   [margin-top (margin/px 2)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 2)]
   [margin-left (margin/px 0)])
  ((class rhf-frame)
   [display display/none]
   #;[position position/relative])
  ((class rhf-border)
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 20)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 20)])
  ((class rhf-header)
   [padding-top (padding/px 10)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 3)]
   [padding-left (padding/px 10)]
   [text-align text-align/left])
  ((id rhf-shoveler)
   [padding-top (padding/px 10)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 10)]
   [padding-left (padding/px 10)])
  ((class rhf-footer)
   [padding-bottom (padding/px 14)])
  ((class rvi-container)
   [height (height/px 75)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 10)]
   #;[position position/relative])
  ((desc (class rvi-container) (class you-viewed))
   [display display/inline-block]
   [margin-right (margin/px 3)]
   [text-align text-align/right]
   [width (width/px 45)])
  ((desc (class rhf-footer) (class ybh-edit))
   [float float/right]
   [margin-top (margin/px 18)]
   [padding-left (padding/px 40)]
   [padding-right (padding/px 10)])
  ((or (desc (class ybh-edit) (class ybh-edit-arrow)) (desc (class ybh-edit) (class ybh-edit-link)))
   [display display/inline-block])
  ((desc (class ybh-edit) (class ybh-edit-arrow))
   [margin-top (margin/px -2)]
   [padding-right (padding/px 8)])
  ((desc (class ybh-edit) (class ybh-edit-link))
   [width (width/px 80)])
  ((class rhf-sign-in-button-box)
   [float float/right]
   [border-left-width (border/px 1)]
   [margin-right (margin/px -30)]
   [text-align text-align/center])
  ((class rhf-sign-in-button)
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-left (padding/px 20)]
   [padding-right (padding/px 20)])
  (".rhf-sign-in-button .action-button, .rhf-sign-in-button a.action-button:hover, .rhf-sign-in-button a.action-button:link, .rhf-sign-in-button a.action-button:active"
   [margin-bottom (margin/px 5)]
   [margin-top (margin/px 5)]
   [width (width/px 230)]
   [display display/block])
  (".rhf-sign-in-button .action-inner, a.action-button:link .action-inner, a.action-button:active .action-inner, a.action-button:hover .action-inner, a.action-button:visited .action-inner"
   [display display/block]
   [height (height/px 28)]
   #;[position position/relative]
   [text-align text-align/center])
  ((desc (class rvi-container) (class no-rvi-message))
   [float float/left])
  ((class rhf-divider)
   [border-top-width (border/px 1)]
   [height (height/px 23)]
   [margin-bottom (margin/px -6)])
  ((desc (class rvi-container) (class rhf-RVIs))
   [display display/inline-block]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 10)])
  ((desc (class rvi-container) (class rhf-RVIs) (tag a) (tag img))
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((id gw-asin-popover)
   [width width/100%]
   [height height/100%]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top padding/3%]
   [padding-right padding/3%]
   [padding-bottom padding/3%]
   [padding-left padding/3%]
   #;[position position/relative])
  ((or (id gw-popover-wrapper) (desc (id gw-asin-popover) (class content)) (desc (id gw-asin-popover) (class detailblock)))
   [height height/100%])
  ((desc (id gw-asin-popover) (class details))
   [width width/35%]
   [display display/inline-block])
  ((desc (id gw-asin-popover) (class imgblock))
   [display display/block]
   [margin-right margin/3%]
   [width width/60%]
   [height height/100%]
   [text-align text-align/center]
   [float float/left]
   #;[position position/relative])
  ("#gw-asin-popover img.product-image"
   [width width/auto]
   [height height/auto])
  ((desc (id gw-asin-popover) (class title))
   [display display/block]
   [margin-bottom (margin/px 12)])
  ((desc (id gw-asin-popover) (class pricing))
   [margin-bottom (margin/px 28)])
  ((desc (id gw-asin-popover) (class reviews))
   [display display/block]
   [margin-bottom (margin/px 36)])
  ((desc (id gw-asin-popover) (class a-button))
   [width width/100%])
  ((desc (id gw-asin-popover) (class loading))
   #;[position position/absolute]
   [margin-top (margin/px -50)]
   [text-align text-align/center]
   [display display/none])
  ((desc (id gw-asin-popover) (class close-icon))
   [height (height/px 36)]
   [width (width/px 36)]
   #;[position position/absolute])
  ((id gw-quick-look-btn)
   [display display/none]
   #;[position position/absolute]
   [margin-top margin/auto]
   [margin-right margin/auto]
   [margin-bottom margin/auto]
   [margin-left margin/auto]
   [width width/95%])
  ((id gw-quick-look-btn)
   [display display/inline-block])
  ((desc (class feed-carousel) (class feed-carousel-card) (class a-list-item))
   [text-align text-align/center]
   #;[position position/relative]
   [display display/inline-block])
  ((id gw-asin-popover)
   [height height/70%])
  ((id sims-section)
   [height height/30%])
  ((class sims-container)
   [height (height/px 141)]
   [width width/100%])
  ((class sims-wrapper)
   [height (height/px 2)]
   #;[position position/relative])
  ((class sims-header)
   [padding-top (padding/px 15)]
   #;[position position/relative])
  ((class sims-header-text)
   [margin-top (margin/px 0)]
   [margin-right margin/auto]
   [margin-bottom (margin/px 0)]
   [margin-left margin/auto]
   [display display/block]
   [text-align text-align/center])
  ((class sims-loading)
   [height (height/px 2)])
  ((desc (class sims-loading) (tag img))
   [height height/100%]
   [width width/100%])
  ((class sims-details)
   [height height/100%]
   [margin-left (margin/px 10)]))

(define-stylesheet doc-1-sketch
  ((tag body)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 8)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 8)])
  ((id navbar)
   #;[position position/relative]
   [margin-top (margin/px 0)]
   [margin-right (margin/px -8)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px -8)]
   [display display/block])
  ((desc (class a-js) (id navbar))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((or (id nav-belt) (desc (id navbar) (class nav-belt)))
   #;[position position/relative]
   [width width/100%])
  ((or (id nav-main) (desc (id navbar) (class nav-main)))
   [width width/100%]
   [height (height/px 60)]
   [padding-top (padding/px 5)]
   #;[position position/relative])
  ((id navfooter)
   [margin-top (margin/px 30)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 8)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 7)]
   [padding-left (padding/px 0)])
  ((desc (id navfooter) (tag table))
   [width width/100%])
  ((class navFooterLinkLine)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 8)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 8)])
  ((or (desc (class navFooterLinkLine) (tag span)) (desc (class navFooterLinkLine) (tag ul)))
   [display display/inline-block]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((class navFooterDescLine)
   [margin-top (margin/px 20)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 14)]
   [margin-left (margin/px 0)])
  ((desc (id navfooter) (class navFooterBackToTop))
   [margin-bottom (margin/px 25)])
  ((tag body)
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((tag table)
   [margin-bottom (margin/px 18)]
   [width width/100%])
  ((tag ul)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 18)]
   [margin-left (margin/px 18)])
  ((or (tag ol) (tag ul))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((id pagecontent)
   [width (width/px 1500)]
   [margin-top margin/auto]
   [margin-right margin/auto]
   [margin-bottom margin/auto]
   [margin-left margin/auto]))

(define-document (doc-1 #:width 1907 #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 1907 :h 4808.3 :class (a-transition a-transform a-opacity a-border-image a-border-radius a-box-shadow a-text-shadow a-touch-scrolling a-local-storage a-textarea-placeholder a-input-placeholder a-autofocus a-webworker a-history a-geolocation a-drag-drop a-svg a-canvas a-video a-audio a-js a-ws a-audio a-video a-canvas a-svg a-drag-drop a-geolocation a-history a-webworker a-autofocus a-input-placeholder a-textarea-placeholder a-local-storage a-touch-scrolling a-text-shadow a-box-shadow a-border-radius a-border-image a-opacity a-transform a-transition)]
   ([BLOCK :tag BODY :x 0 :y 0 :w 1907 :h 4808.3 :class (a-auix_ux_57388-c a-aui_49697-c a-aui_51744-c a-aui_55624-t1 a-aui_57326-c a-aui_58736-c a-aui_accessibility_49860-c a-aui_attr_validations_1_51371-c a-aui_bolt_54706-c a-aui_bolt_56525-t1 a-aui_ux_47524-t1 a-aui_ux_49594-c a-aui_ux_52290-c a-aui_ux_56217-c a-aui_ux_59374-c a-aui_ux_59797-c a-aui_ux_60000-c a-meter-animate)]
    ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 4808.3 :id a-page]
     ([BLOCK :tag HEADER :x 0 :y 0 :w 1907 :h 99 :class (nav-locale-us nav-lang-en nav-unrec nav-xshop-small)]
      ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 99 :id navbar :class (nav-sprite-v1 nav-bluebeacon nav-search-swap)]
       ([MAGIC :tag DIV :x 0 :y 0 :w 1907 :h 39 :id nav-belt])
       #;
       ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 39 :id nav-belt]
        ([BLOCK :tag DIV :x 0 :y 0 :w 192 :h 39 :class (nav-left) :id e10004]
         ([BLOCK :tag DIV :x 0 :y 0 :w 192 :h 39 :id nav-logo]
          ([MAGIC :tag A :x 27 :y 13 :w 96 :h 29 :mt 0 :mr 0 :mb 0 :ml 0 :class (nav-logo-link)])
          ([BLOCK :tag A :x 93 :y 31 :w 53 :h 11 :class (nav-logo-tagline nav-sprite nav-prime-try)]
           ([LINE]
            ([TEXT :x 93 :y 30.5 :w 53 :h 12])))))
        ([BLOCK :tag DIV :x 1507 :y 0 :w 400 :h 39 :class (nav-right)]
         ([BLOCK :tag DIV :x 1507 :y 9 :w 400 :h 39 :id navSwmHoliday]
          ([LINE]
           ([INLINE :tag IMG])))
         ([LINE]
          ([INLINE :tag DIV :id nav-swmslot])))
        ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 39 :class (nav-fill)]
         ([BLOCK :tag DIV :x 192 :y 0 :w 1315 :h 46 :id nav-search]
          ([BLOCK :tag DIV :x 192 :y 11 :w 1290 :h 0 :id nav-bar-left])
          ([BLOCK :tag FORM :x 192 :y 11 :w 1290 :h 35 :class (nav-searchbar)]
           ([BLOCK :tag DIV :x 192 :y 11 :w 46 :h 35 :class (nav-left)]
            ([BLOCK :tag DIV :x 192 :y 11 :w 46 :h 35 :class (nav-search-scope nav-sprite)]
             ([BLOCK :tag DIV :x 198 :y 13 :w 39 :h 33 :class (nav-search-facade)]
              ([BLOCK :tag SPAN :x 203 :y 13 :w 13 :h 33 :class (nav-search-label)]
               ([LINE]
                ([TEXT :x 203 :y 22.5 :w 13 :h 14])))
              ([BLOCK :tag I :x 221 :y 27 :w 8 :h 4 :class (nav-icon)]))
             ([MAGIC :tag SELECT :x 193 :y 11 :w 192 :h 35 :id searchDropdownBox :class (nav-search-dropdown searchSelect)])))
           ([BLOCK :tag DIV :x 1437 :y 11 :w 45 :h 35 :class (nav-right)]
            ([BLOCK :tag DIV :x 1437 :y 11 :w 45 :h 35 :class (nav-search-submit nav-sprite)]
             ([BLOCK :tag SPAN :x 1449 :y 18 :w 21 :h 21 :id nav-search-submit-text :class (nav-search-submit-text nav-sprite)]
              ([LINE]
               ([TEXT :x 1200.5 :y 17 :w 18 :h 15])))
             ([BLOCK :tag INPUT :x 1437 :y 11 :w 45 :h 35 :class (nav-input)])))
           ([BLOCK :tag DIV :x 238 :y 11 :w 1199 :h 35 :class (nav-fill)]
            ([BLOCK :tag DIV :x 238 :y 11 :w 1199 :h 35 :class (nav-search-field)]
             ([BLOCK :tag INPUT :x 238 :y 11 :w 1199 :h 33 :id twotabsearchtextbox :class (nav-input)]))
            ([BLOCK :tag DIV :x 238 :y 46 :w 1199 :h 0 :id nav-iss-attach])))))
        ([BLOCK :tag DIV :x 0 :y 39 :w 1907 :h 0 :id nav-flyout-iss-anchor])
        ([BLOCK :tag DIV :x 0 :y 39 :w 1907 :h 0 :id nav-flyout-anchor])
        ([BLOCK :tag DIV :x 0 :y 39 :w 1907 :h 0 :id nav-flyout-iss-anchor])
        ([BLOCK :tag DIV :x 0 :y 39 :w 1907 :h 0 :id nav-flyout-anchor]))
       ([MAGIC :tag DIV :x 0 :y 39 :w 1907 :h 60 :id nav-main :class (nav-sprite)])
       #;
       ([BLOCK :tag DIV :x 0 :y 39 :w 1907 :h 60 :id nav-main :class (nav-sprite)]
        ([BLOCK :tag DIV :x 0 :y 44 :w 192 :h 55 :class (nav-left)]
         ([BLOCK :tag DIV :x 0 :y 46 :w 192 :h 50 :id nav-shop]
          ([BLOCK :tag A :x 16 :y 53 :w 116 :h 44 :id nav-link-shopall :class (nav-a nav-a-2)]
           ([BLOCK :tag SPAN :x 26 :y 62 :w 55 :h 14 :class (nav-line-1)]
            ([LINE]
             ([TEXT :x 26 :y 62 :w 44 :h 14])))
           ([BLOCK :tag SPAN :x 26 :y 76 :w 106 :h 20 :class (nav-line-2)]
            ([LINE]
             ([TEXT :x 26 :y 75.5 :w 82 :h 16]))))))
        ([BLOCK :tag DIV :x 1494 :y 44 :w 413 :h 55 :class (nav-right)]
         ([BLOCK :tag DIV :x 1494 :y 46 :w 413 :h 50 :id nav-tools]
          ([BLOCK :tag A :x 1527 :y 53 :w 128 :h 44 :id nav-link-yourAccount :class (nav-a nav-a-2)]
           ([BLOCK :tag SPAN :x 1537 :y 62 :w 84 :h 14 :class (nav-line-1)]
            ([LINE]
             ([TEXT :x 1537 :y 62 :w 73 :h 14])))
           ([BLOCK :tag SPAN :x 1537 :y 76 :w 118 :h 20 :class (nav-line-2)]
            ([LINE]
             ([TEXT :x 1537 :y 75.5 :w 94 :h 16]))))
          ([BLOCK :tag A :x 1657 :y 53 :w 74 :h 44 :id nav-link-prime :class (nav-a nav-a-2)]
           ([BLOCK :tag SPAN :x 1667 :y 62 :w 27 :h 14 :class (nav-line-1)]
            ([LINE]
             ([TEXT :x 1667 :y 62 :w 16 :h 14])))
           ([BLOCK :tag SPAN :x 1667 :y 76 :w 64 :h 20 :class (nav-line-2)]
            ([LINE]
             ([TEXT :x 1667 :y 75.5 :w 40 :h 16]))))
          ([BLOCK :tag A :x 1733 :y 53 :w 59 :h 44 :id nav-link-wishlist :class (nav-a nav-a-2)]
           ([BLOCK :tag SPAN :x 1743 :y 62 :w 39 :h 14 :class (nav-line-1)]
            ([LINE]
             ([TEXT :x 1743 :y 62 :w 28 :h 14])))
           ([BLOCK :tag SPAN :x 1743 :y 76 :w 49 :h 20 :class (nav-line-2)]
            ([LINE]
             ([TEXT :x 1743 :y 75.5 :w 25 :h 16]))))
          ([BLOCK :tag A :x 1794 :y 53 :w 105 :h 44 :id nav-cart :class (nav-a nav-a-2)]
           ([BLOCK :tag SPAN :x 1846 :y 62 :w 11 :h 14 :class (nav-line-1)])
           ([BLOCK :tag SPAN :x 1846 :y 76 :w 53 :h 20 :class (nav-line-2)]
            ([LINE]
             ([TEXT :x 1846 :y 75.5 :w 29 :h 16])))
           ([BLOCK :tag SPAN :x 1804 :y 64 :w 38 :h 26 :class (nav-cart-icon nav-sprite)])
           ([BLOCK :tag SPAN :x 1817 :y 60 :w 19 :h 16 :id nav-cart-count :class (nav-cart-count nav-cart-0)]
            ([LINE]
             ([TEXT :x 1822 :y 59.5 :w 9 :h 17]))))))
        ([BLOCK :tag DIV :x 192 :y 44 :w 1302 :h 55 :class (nav-fill)]
         ([BLOCK :tag DIV :x 192 :y 44 :w 383 :h 69 :id nav-xshop-container]
          ([BLOCK :tag DIV :x 192 :y 76 :w 383 :h 37 :id nav-xshop]
           ([BLOCK :tag A :x 192 :y 76 :w 117 :h 12 :id nav-your-amazon :class (nav-a nav_a)]
            ([LINE]
             ([TEXT :x 192 :y 74.5 :w 107 :h 15])))
           ([BLOCK :tag A :x 309 :y 76 :w 100 :h 12 :class (nav-a)]
            ([LINE]
             ([TEXT :x 319 :y 74.5 :w 80 :h 15])))
           ([BLOCK :tag A :x 409 :y 76 :w 78 :h 12 :class (nav-a)]
            ([LINE]
             ([TEXT :x 419 :y 74.5 :w 58 :h 15])))
           ([BLOCK :tag A :x 487 :y 76 :w 42 :h 12 :class (nav-a)]
            ([LINE]
             ([TEXT :x 497 :y 74.5 :w 22 :h 15])))
           ([BLOCK :tag A :x 529 :y 76 :w 46 :h 12 :class (nav-a)]
            ([LINE]
             ([TEXT :x 539 :y 74.5 :w 26 :h 15])))))))))
     ([BLOCK :tag DIV :x 203.5 :y 99 :w 1500 :h 4709.3 :id pageContent :class (a-section a-spacing-none)]
      ([MAGIC :tag DIV :x 203.5 :y 99 :w 1500 :h 300 :id e10008])
      #;
      ([BLOCK :tag DIV :x 203.5 :y 99 :w 1500 :h 300 :id e10008]
       ([BLOCK :tag DIV :x 203.5 :y 99 :w 1500 :h 300 :id gw-desktop-herotator :class (a-section a-spacing-none gw-desktop-herotator-ready)]
        ([BLOCK :tag DIV :x 203.5 :y 99 :w 1500 :h 300 :class (a-carousel-container a-carousel-display-single a-carousel-transition-slide gw-desktop-herotator a-carousel-initialized) :id e10009]
         ([BLOCK :tag FORM :x 203.5 :y 99 :w 1500 :h 0 :class (a-carousel-state)])
         ([BLOCK :tag DIV :x 203.5 :y 99 :w 1500 :h 300 :class (a-row a-carousel-controls a-carousel-row)]
          ([BLOCK :tag DIV :x 203.5 :y 99 :w 1500 :h 300 :class (a-carousel-row-inner)]
           ([BLOCK :tag DIV :x 203.5 :y 99 :w 1500 :h 300 :class (a-carousel-col a-carousel-center)]
            ([BLOCK :tag DIV :x 203.5 :y 99 :w 1500 :h 300 :id anonCarousel1 :class (a-carousel-viewport)]
             ([BLOCK :tag OL :x -5796.5 :y 99 :w 9000 :h 300 :class (a-carousel) :id e10011]
              ([MAGIC :tag LI :x -5796.5 :y 99 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-carousel-card)])
              ([MAGIC :tag LI :x -4296.5 :y 99 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-carousel-card)])
              ([MAGIC :tag LI :x -2796.5 :y 99 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-carousel-card)])
              ([MAGIC :tag LI :x -1296.5 :y 99 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-carousel-card)])
              ([MAGIC :tag LI :x 203.5 :y 99 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-carousel-card)])
              ([MAGIC :tag LI :x 1703.5 :y 99 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-carousel-card)])))))))
        ([BLOCK :tag DIV :x 203.5 :y 399 :w 1500 :h 0 :id gw-desktop-herotator-controls]
         ([BLOCK :tag OL :x 887.5 :y 375 :w 132 :h 0 :id e10012]
          ([BLOCK :tag LI :x 887.5 :y 375 :w 22 :h 13]
           ([BLOCK :tag A :x 892.5 :y 375 :w 12 :h 13 :class (herotator-goToPage-1 gw-icon)]
            ([BLOCK :tag SPAN :x -9112.5 :y -9625 :w 235 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9112.5 :y -9623 :w 235 :h 15])))))
          ([BLOCK :tag LI :x 909.5 :y 375 :w 22 :h 13]
           ([BLOCK :tag A :x 914.5 :y 375 :w 12 :h 13 :class (herotator-goToPage-2 gw-icon)]
            ([BLOCK :tag SPAN :x -9112.5 :y -9625 :w 178 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9112.5 :y -9623 :w 178 :h 15])))))
          ([BLOCK :tag LI :x 931.5 :y 375 :w 22 :h 13]
           ([BLOCK :tag A :x 936.5 :y 375 :w 12 :h 13 :class (herotator-goToPage-3 gw-icon)]
            ([BLOCK :tag SPAN :x -9112.5 :y -9625 :w 141 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9112.5 :y -9623 :w 141 :h 15])))))
          ([BLOCK :tag LI :x 953.5 :y 375 :w 22 :h 13]
           ([BLOCK :tag A :x 958.5 :y 375 :w 12 :h 13 :class (herotator-goToPage-4 gw-icon)]
            ([BLOCK :tag SPAN :x -9112.5 :y -9625 :w 172 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9112.5 :y -9623 :w 172 :h 15])))))
          ([BLOCK :tag LI :x 975.5 :y 375 :w 22 :h 13]
           ([BLOCK :tag A :x 980.5 :y 375 :w 12 :h 13 :class (herotator-goToPage-5 gw-icon active)]
            ([BLOCK :tag SPAN :x -9112.5 :y -9625 :w 227 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9112.5 :y -9623 :w 227 :h 15])))))
          ([BLOCK :tag LI :x 997.5 :y 375 :w 22 :h 13]
           ([BLOCK :tag A :x 1002.5 :y 375 :w 12 :h 13 :class (herotator-goToPage-6 gw-icon)]
            ([BLOCK :tag SPAN :x -9112.5 :y -9625 :w 164 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9112.5 :y -9623 :w 164 :h 15])))))))))
      ([MAGIC :tag DIV :x 203.5 :y 399 :w 1500 :h 3020 :id gw-content-grid :class (a-fixed-right-flipped-grid)])
      #;
      ([BLOCK :tag DIV :x 203.5 :y 399 :w 1500 :h 3020 :id gw-content-grid :class (a-fixed-right-flipped-grid)]
       ([BLOCK :tag DIV :x 203.5 :y 399 :w 1500 :h 3020 :class (a-fixed-right-grid-inner)]
        ([BLOCK :tag DIV :x 203.5 :y 399 :w 1500 :h 3020 :class (a-section a-spacing-medium)]
         ([BLOCK :tag DIV :x 1393.5 :y 399 :w 310 :h 713 :id sidebar :class (a-fixed-right-grid-col a-col-right)]
          ([BLOCK :tag DIV :x 1398.5 :y 409 :w 300 :h 275 :id desktop-ad-atf :class (displayAd)]
           ([BLOCK :tag DIV :x 1398.5 :y 414 :w 300 :h 270 :id DAr2 :class (copilot-secure-display celwidget  text/x-dacx-safeframe)]
            ([LINE]
             ([INLINE :tag IFRAME]))))
          ([BLOCK :tag HR :x 1416.5 :y 684 :w 264 :h 1 :class (slot-hr desktop-ad-atf-hr)])
          ([BLOCK :tag DIV :x 1416.5 :y 700 :w 264 :h 170 :id desktop-sidekick-1 :class (sidekick)]
           ([BLOCK :tag DIV :x 1416.5 :y 700 :w 264 :h 170 :id image-map-ns_0C88T2HHAKKAZQD39580_4197_ :class (shogun-widget image-map gateway-desktop-link)]
            ([BLOCK :tag DIV :x 1416.5 :y 700 :w 264 :h 170 :class (cropped-image-map-size) :id e10015]
             ([BLOCK :tag DIV :x 888.5 :y 700 :w 1320 :h 170 :class (cropped-image-map-center-alignment)]
              ([MAGIC :tag SPAN :x 1416.5 :y 700 :w 264 :h 170 :mt 0 :mr 0 :mb 0 :ml 0])))))
          ([BLOCK :tag HR :x 1416.5 :y 885 :w 264 :h 1 :class (slot-hr desktop-sidekick-1-hr)])
          ([BLOCK :tag DIV :x 1416.5 :y 901 :w 264 :h 170 :id desktop-sidekick-2 :class (sidekick)]
           ([BLOCK :tag DIV :x 1416.5 :y 901 :w 264 :h 170 :id image-map-ns_0037F4EWCNYGYGP083AD_5192_ :class (shogun-widget image-map gateway-desktop-link)]
            ([BLOCK :tag DIV :x 1416.5 :y 901 :w 264 :h 170 :class (cropped-image-map-size) :id e10016]
             ([BLOCK :tag DIV :x 888.5 :y 901 :w 1320 :h 170 :class (cropped-image-map-center-alignment)]
              ([MAGIC :tag SPAN :x 1416.5 :y 901 :w 264 :h 170 :mt 0 :mr 0 :mb 0 :ml 0])))))
          ([BLOCK :tag HR :x 1416.5 :y 1086 :w 264 :h 1 :class (slot-hr desktop-sidekick-2-hr)])
          ([BLOCK :tag DIV :x 1416.5 :y 1102 :w 264 :h 0 :id sidebarbtf]))
         ([BLOCK :tag DIV :x 203.5 :y 399 :w 1190 :h 3020 :id mainContent :class (a-fixed-right-grid-col a-col-left)]
          ([BLOCK :tag DIV :x 203.5 :y 399 :w 1190 :h 3020 :id btfContent]
           ([BLOCK :tag DIV :x 223.5 :y 424 :w 1150 :h 200 :id desktop-0 :class (desktop-row)]
            ([BLOCK :tag DIV :x 223.5 :y 424 :w 1150 :h 200 :id image-map-ns_0E598WYK9VCQV9QKRVAG_20625_ :class (shogun-widget image-map gateway-desktop-link)]
             ([BLOCK :tag DIV :x 223.5 :y 424 :w 1150 :h 200 :class (cropped-image-map-size) :id e10018]
              ([BLOCK :tag DIV :x -2076.5 :y 424 :w 5750 :h 200 :class (cropped-image-map-center-alignment)]
               ([MAGIC :tag SPAN :x 223.5 :y 424 :w 1150 :h 200 :mt 0 :mr 0 :mb 0 :ml 0])))))
           ([BLOCK :tag DIV :x 223.5 :y 644 :w 1150 :h 285 :id desktop-1 :class (desktop-row)]
            ([BLOCK :tag DIV :x 223.5 :y 644 :w 1150 :h 285 :id uber-widget-ns_11WA577K9HGNEXPGFQJB_14687_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 243.5 :y 664 :w 1110 :h 35 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 243.5 :y 664 :w 295 :h 31.5 :class (as-title-block-left)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 243.5 :y 668.25 :w 295 :h 23]))))
              ([BLOCK :tag SPAN :x 538.5 :y 664 :w 76 :h 35 :class (as-title-block-right)]
               ([LINE]
                ([INLINE :tag A :class (a-link-normal)]
                 ([TEXT :x 553.5 :y 673.5 :w 61 :h 16])))))
             ([BLOCK :tag DIV :x 243.5 :y 699 :w 1110 :h 220 :class (a-section feed-carousel first-carousel hovering)]
              ([BLOCK :tag DIV :x 243.5 :y 699 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 243.5 :y 699 :w 5421.25 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]))
              ([BLOCK :tag A :x 243.5 :y 754 :w 45 :h 100 :class (feed-carousel-control feed-left feed-control-disabled)]
               ([MAGIC :tag SPAN :x 257 :y 793 :w 13 :h 22 :mt -11 :mr 0 :mb 0 :ml 0 :class (gw-icon feed-arrow)]))
              ([BLOCK :tag A :x 1308.5 :y 754 :w 45 :h 100 :class (feed-carousel-control feed-right)]
               ([MAGIC :tag SPAN :x 1327 :y 793 :w 13 :h 22 :mt -11 :mr 0 :mb 0 :ml 0 :class (gw-icon feed-arrow)]))
              ([BLOCK :tag SPAN :x 243.5 :y 913 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 243.5 :y 915 :w 1110 :h 1 :class (feed-scrollbar-track)]
                ([BLOCK :tag SPAN :x 243.5 :y 913 :w 213.05 :h 6 :class (feed-scrollbar-thumb) :id e10019]))))))
           ([BLOCK :tag DIV :x 223.5 :y 929 :w 1150 :h 285 :id desktop-2 :class (desktop-row)]
            ([BLOCK :tag DIV :x 223.5 :y 929 :w 1150 :h 285 :id uber-widget-ns_11WA577K9HGNEXPGFQJB_14718_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 243.5 :y 949 :w 1110 :h 35 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 243.5 :y 949 :w 575 :h 31.5 :class (as-title-block-left)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 243.5 :y 953.25 :w 575 :h 23]))))
              ([BLOCK :tag SPAN :x 818.5 :y 949 :w 76 :h 35 :class (as-title-block-right)]
               ([LINE]
                ([INLINE :tag A :class (a-link-normal)]
                 ([TEXT :x 833.5 :y 958.5 :w 61 :h 16])))))
             ([BLOCK :tag DIV :x 243.5 :y 984 :w 1110 :h 220 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 243.5 :y 984 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 243.5 :y 984 :w 2850 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]))
              ([BLOCK :tag SPAN :x 243.5 :y 1198 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 243.5 :y 1200 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 223.5 :y 1214 :w 1150 :h 239 :class (billboardRowWrapper)]
            ([BLOCK :tag DIV :x 223.5 :y 1226 :w 1150 :h 200 :class (a-row billboardRow)]
             ([BLOCK :tag DIV :x 223.5 :y 1226 :w 562.9 :h 200 :class (a-column a-span6)]
              ([MAGIC :tag DIV :x 223.5 :y 1226 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-1 :class (billboard)]))
             ([BLOCK :tag DIV :x 810.6 :y 1226 :w 562.9 :h 200 :class (a-column a-span6 a-span-last)]
              ([MAGIC :tag DIV :x 810.6 :y 1226 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-2 :class (billboard)]))))
           ([BLOCK :tag HR :x 223.5 :y 1453 :w 1150 :h 1 :class (billboardrow-hr)])
           ([BLOCK :tag DIV :x 223.5 :y 1474 :w 1150 :h 285 :id desktop-3 :class (desktop-row)]
            ([BLOCK :tag DIV :x 223.5 :y 1474 :w 1150 :h 285 :id uber-widget-ns_11WA577K9HGNEXPGFQJB_14721_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 243.5 :y 1494 :w 1110 :h 35 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 243.5 :y 1494 :w 268 :h 31.5 :class (as-title-block-left)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 243.5 :y 1498.25 :w 268 :h 23]))))
              ([BLOCK :tag SPAN :x 511.5 :y 1494 :w 76 :h 35 :class (as-title-block-right)]
               ([LINE]
                ([INLINE :tag A :class (a-link-normal)]
                 ([TEXT :x 526.5 :y 1503.5 :w 61 :h 16])))))
             ([BLOCK :tag DIV :x 243.5 :y 1529 :w 1110 :h 220 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 243.5 :y 1529 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 243.5 :y 1529 :w (/ 55799 12) :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]))
              ([BLOCK :tag SPAN :x 243.5 :y 1743 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 243.5 :y 1745 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 223.5 :y 1759 :w 1150 :h 285 :id desktop-4 :class (desktop-row)]
            ([BLOCK :tag DIV :x 223.5 :y 1759 :w 1150 :h 285 :id uber-widget-ns_11WA577K9HGNEXPGFQJB_14722_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 243.5 :y 1779 :w 1110 :h 35 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 243.5 :y 1779 :w 308 :h 31.5 :class (as-title-block-left)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 243.5 :y 1783.25 :w 308 :h 23]))))
              ([BLOCK :tag SPAN :x 551.5 :y 1779 :w 76 :h 35 :class (as-title-block-right)]
               ([LINE]
                ([INLINE :tag A :class (a-link-normal)]
                 ([TEXT :x 566.5 :y 1788.5 :w 61 :h 16])))))
             ([BLOCK :tag DIV :x 243.5 :y 1814 :w 1110 :h 220 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 243.5 :y 1814 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 243.5 :y 1814 :w 2993.55 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]))
              ([BLOCK :tag SPAN :x 243.5 :y 2028 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 243.5 :y 2030 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 223.5 :y 2044 :w 1150 :h 239 :class (billboardRowWrapper)]
            ([BLOCK :tag DIV :x 223.5 :y 2056 :w 1150 :h 200 :class (a-row billboardRow)]
             ([BLOCK :tag DIV :x 223.5 :y 2056 :w 562.9 :h 200 :class (a-column a-span6)]
              ([MAGIC :tag DIV :x 223.5 :y 2056 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-3 :class (billboard)]))
             ([BLOCK :tag DIV :x 810.6 :y 2056 :w 562.9 :h 200 :class (a-column a-span6 a-span-last)]
              ([MAGIC :tag DIV :x 810.6 :y 2056 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-4 :class (billboard)]))))
           ([BLOCK :tag HR :x 223.5 :y 2283 :w 1150 :h 1 :class (billboardrow-hr)])
           ([BLOCK :tag DIV :x 223.5 :y 2304 :w 1150 :h 285 :id desktop-5 :class (desktop-row)]
            ([BLOCK :tag DIV :x 223.5 :y 2304 :w 1150 :h 285 :id uber-widget-ns_11WA577K9HGNEXPGFQJB_14723_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 243.5 :y 2324 :w 1110 :h 35 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 243.5 :y 2324 :w 239 :h 31.5 :class (as-title-block-left)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 243.5 :y 2328.25 :w 239 :h 23]))))
              ([BLOCK :tag SPAN :x 482.5 :y 2324 :w 76 :h 35 :class (as-title-block-right)]
               ([LINE]
                ([INLINE :tag A :class (a-link-normal)]
                 ([TEXT :x 497.5 :y 2333.5 :w 61 :h 16])))))
             ([BLOCK :tag DIV :x 243.5 :y 2359 :w 1110 :h 220 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 243.5 :y 2359 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 243.5 :y 2359 :w (/ 97939 30) :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]))
              ([BLOCK :tag SPAN :x 243.5 :y 2573 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 243.5 :y 2575 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 223.5 :y 2589 :w 1150 :h 285 :id desktop-6 :class (desktop-row)]
            ([BLOCK :tag DIV :x 223.5 :y 2589 :w 1150 :h 285 :id uber-widget-ns_11WA577K9HGNEXPGFQJB_14724_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 243.5 :y 2609 :w 1110 :h 35 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 243.5 :y 2609 :w 315 :h 31.5 :class (as-title-block-left)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 243.5 :y 2613.25 :w 315 :h 23]))))
              ([BLOCK :tag SPAN :x 558.5 :y 2609 :w 76 :h 35 :class (as-title-block-right)]
               ([LINE]
                ([INLINE :tag A :class (a-link-normal)]
                 ([TEXT :x 573.5 :y 2618.5 :w 61 :h 16])))))
             ([BLOCK :tag DIV :x 243.5 :y 2644 :w 1110 :h 220 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 243.5 :y 2644 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 243.5 :y 2644 :w 3782 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]))
              ([BLOCK :tag SPAN :x 243.5 :y 2858 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 243.5 :y 2860 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 223.5 :y 2874 :w 1150 :h 239 :class (billboardRowWrapper)]
            ([BLOCK :tag DIV :x 223.5 :y 2886 :w 1150 :h 200 :class (a-row billboardRow)]
             ([BLOCK :tag DIV :x 223.5 :y 2886 :w 562.9 :h 200 :class (a-column a-span6)]
              ([MAGIC :tag DIV :x 223.5 :y 2886 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-5 :class (billboard)]))
             ([BLOCK :tag DIV :x 810.6 :y 2886 :w 562.9 :h 200 :class (a-column a-span6 a-span-last)]
              ([MAGIC :tag DIV :x 810.6 :y 2886 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-6 :class (billboard)]))))
           ([BLOCK :tag HR :x 223.5 :y 3113 :w 1150 :h 1 :class (billboardrow-hr)])
           ([BLOCK :tag DIV :x 223.5 :y 3134 :w 1150 :h 285 :id desktop-7 :class (desktop-row)]
            ([BLOCK :tag DIV :x 223.5 :y 3134 :w 1150 :h 285 :id asin-shoveler-ns_057D60DAAYCCRCXNHAW9_12964_ :class (a-section a-spacing-none shogun-widget asin-shoveler aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 243.5 :y 3154 :w 1110 :h 35 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 243.5 :y 3154 :w 279 :h 31.5 :class (as-title-block-left)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 243.5 :y 3158.25 :w 279 :h 23]))))
              ([BLOCK :tag SPAN :x 522.5 :y 3154 :w 77 :h 35 :class (as-title-block-right)]
               ([LINE]
                ([INLINE :tag A :class (a-link-normal)]
                 ([TEXT :x 537.5 :y 3163.5 :w 62 :h 16])))))
             ([BLOCK :tag DIV :x 243.5 :y 3189 :w 1110 :h 220 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 243.5 :y 3189 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 243.5 :y 3189 :w 3360 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]))
              ([BLOCK :tag SPAN :x 243.5 :y 3403 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 243.5 :y 3405 :w 1110 :h 1 :class (feed-scrollbar-track)]))))))))))
      ([ANON]
       ([LINE]
        ([INLINE :tag BR])))
      ([MAGIC :tag DIV :x 203.5 :y 3456 :w 1500 :h 600.3 :id rhf :class (copilot-secure-display)])
      #;
      ([BLOCK :tag DIV :x 203.5 :y 3456 :w 1500 :h 600.3 :id rhf :class (copilot-secure-display)]
       ([BLOCK :tag DIV :x 203.5 :y 3456 :w 1500 :h 600.3 :class (rhf-frame) :id e10021]
        ([BLOCK :tag DIV :x 203.5 :y 3456 :w 1500 :h 600.3 :id rhf-container]
         ([BLOCK :tag DIV :x 203.5 :y 3456 :w 1500 :h 600.3 :class (rhf-border)]
          ([BLOCK :tag DIV :x 224.5 :y 3457 :w 1458 :h 32 :class (rhf-header)]
           ([LINE]
            ([TEXT :x 234.5 :y 3465.5 :w 539 :h 22])))
          ([BLOCK :tag DIV :x 224.5 :y 3489 :w 1458 :h 460.3 :id rhf-shoveler]
           ([BLOCK :tag DIV :x 234.5 :y 3499 :w 1438 :h 440.3 :class (a-carousel-container a-carousel-display-swap a-carousel-transition-swap a-carousel-initialized)]
            ([BLOCK :tag FORM :x 234.5 :y 3499 :w 1438 :h 0 :class (a-carousel-state)])
            ([BLOCK :tag DIV :x 234.5 :y 3499 :w 1438 :h 27.3 :class (a-row a-carousel-header-row a-size-large)]
             ([BLOCK :tag DIV :x 234.5 :y 3499 :w 948.3 :h 27.3 :class (a-column a-span8)]
              ([BLOCK :tag H2 :x 234.5 :y 3499 :w 948.3 :h 27.3 :class (a-carousel-heading)]
               ([LINE]
                ([INLINE :tag SPAN :class (rhf-source-title)]
                 ([TEXT :x 234.5 :y 3506.15 :w 212 :h 17])))))
             ([BLOCK :tag DIV :x 1213.1 :y 3499 :w 459.4 :h 27.3 :class (a-column a-span4 a-span-last a-text-right)]
              ([LINE]
               ([INLINE :tag SPAN :class (a-carousel-pagination a-size-base) :id e10022]
                ([INLINE :tag SPAN :class (a-carousel-page-count)]
                 ([TEXT :x 1606.5 :y 3508.15 :w 34 :h 15])
                 ([INLINE :tag SPAN :class (a-carousel-page-current)]
                  ([TEXT :x 1640.5 :y 3508.15 :w 7 :h 15]))
                 ([TEXT :x 1647.5 :y 3508.15 :w 18 :h 15])
                 ([INLINE :tag SPAN :class (a-carousel-page-max)]
                  ([TEXT :x 1665.5 :y 3508.15 :w 7 :h 15])))))
              ([BLOCK :tag SPAN :x 1672.5 :y 3499 :w 30 :h 57 :class (a-carousel-accessibility-page-info a-offscreen)]
               ([LINE]
                ([TEXT :x 1672.5 :y 3501 :w 30 :h 15]))
               ([LINE]
                ([TEXT :x 1681.5 :y 3520 :w 21 :h 15]))
               ([LINE]
                ([TEXT :x 1695.5 :y 3539 :w 7 :h 15])))
              ([LINE])))
            ([BLOCK :tag SPAN :x 234.5 :y 3546.3 :w 980 :h 19 :class (aok-offscreen p13n-sc-offscreen)]
             ([LINE]
              ([TEXT :x 234.5 :y 3548.3 :w 980 :h 15])))
            ([BLOCK :tag DIV :x 234.5 :y 3546.3 :w 1438 :h 393 :class (a-row a-carousel-controls a-carousel-row a-carousel-has-buttons)]
             ([BLOCK :tag DIV :x 234.5 :y 3546.3 :w 1438 :h 393 :class (a-carousel-row-inner)]
              ([BLOCK :tag DIV :x 234.5 :y 3546.3 :w 40 :h 393 :class (a-carousel-col a-carousel-left) :id e10023]
               ([MAGIC :tag A :x 237.5 :y 3691.75 :w 36 :h 39 :mt -16 :mr 0 :mb 0 :ml 0 :id a-autoid-0 :class (a-button a-button-image a-carousel-button a-carousel-goto-prevpage)]))
              ([BLOCK :tag DIV :x 274.5 :y 3546.3 :w 1358 :h 393 :class (a-carousel-col a-carousel-center)]
               ([BLOCK :tag DIV :x 274.5 :y 3546.3 :w 1358 :h 393 :id anonCarousel2 :class (a-carousel-viewport)]
                ([BLOCK :tag OL :x 274.5 :y 3546.3 :w 1358 :h 393 :class (a-carousel)]
                 ([BLOCK :tag LI :x 304.5 :y 3546.3 :w 160 :h 393 :class (a-carousel-card a-float-left) :id e10025]
                  ([BLOCK :tag DIV :x 304.5 :y 3546.3 :w 160 :h 255 :class (a-section a-spacing-none p13nimp p13n-asin)]
                   ([ANON]
                    ([BLOCK :tag DIV :x 304.5 :y 3546.3 :w 160 :h 135 :class (a-section a-spacing-mini)]
                     ([LINE]
                      ([INLINE :tag IMG])))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([INLINE :tag SPAN]
                       ([TEXT :x 304.5 :y 3689.3 :w 149 :h 15]))))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([INLINE :tag SPAN]
                       ([TEXT :x 304.5 :y 3708.3 :w 68 :h 15])))))
                   ([BLOCK :tag DIV :x 304.5 :y 3725.3 :w 160 :h 18 :class (a-row a-size-small)]
                    ([LINE]
                     ([INLINE :tag SPAN :class (a-size-small a-color-base)]
                      ([TEXT :x 304.5 :y 3727.3 :w 44 :h 14]))))
                   ([BLOCK :tag DIV :x 304.5 :y 3743.3 :w 160 :h 20 :class (a-icon-row a-spacing-none)]
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([TEXT :x 384.5 :y 3745.3 :w 4 :h 15]))
                     ([INLINE :tag A :class (a-size-small a-link-normal)]
                      ([TEXT :x 388.5 :y 3746.3 :w 14 :h 14]))))
                   ([BLOCK :tag DIV :x 304.5 :y 3763.3 :w 160 :h 18 :class (a-row a-size-small)]
                    ([LINE]
                     ([INLINE :tag SPAN :class (a-size-small a-color-secondary)]
                      ([TEXT :x 304.5 :y 3765.3 :w 59 :h 14]))))
                   ([BLOCK :tag DIV :x 304.5 :y 3781.3 :w 160 :h 20 :class (a-row)]
                    ([LINE]
                     ([INLINE :tag SPAN :class (a-size-base a-color-price)]
                      ([TEXT :x 304.5 :y 3784.3 :w 39 :h 15]))
                     ([TEXT :x 343.5 :y 3784.3 :w 4 :h 15])
                     ([INLINE :tag SPAN :id e10026])))))
                 ([BLOCK :tag LI :x 494.5 :y 3546.3 :w 160 :h 393 :class (a-carousel-card a-float-left) :id e10027]
                  ([BLOCK :tag DIV :x 494.5 :y 3546.3 :w 160 :h 254 :class (a-section a-spacing-none p13nimp p13n-asin)]
                   ([ANON]
                    ([BLOCK :tag DIV :x 494.5 :y 3546.3 :w 160 :h 135 :class (a-section a-spacing-mini)]
                     ([LINE]
                      ([INLINE :tag IMG])))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([INLINE :tag SPAN]
                       ([TEXT :x 494.5 :y 3689.3 :w 150 :h 15]))))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([INLINE :tag SPAN]
                       ([TEXT :x 494.5 :y 3708.3 :w 118 :h 15]))))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([INLINE :tag SPAN]
                       ([TEXT :x 494.5 :y 3727.3 :w 123 :h 15])))))
                   ([BLOCK :tag DIV :x 494.5 :y 3744.3 :w 160 :h 18 :class (a-row a-size-small)]
                    ([MAGIC :tag A :x 494.5 :y 3744.3 :w 119 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-size-small a-link-child)]))
                   ([BLOCK :tag DIV :x 494.5 :y 3762.3 :w 160 :h 18 :class (a-row a-size-small)]
                    ([LINE]
                     ([INLINE :tag SPAN :class (a-size-small a-color-secondary)]
                      ([TEXT :x 494.5 :y 3764.3 :w 56 :h 14]))))
                   ([BLOCK :tag DIV :x 494.5 :y 3780.3 :w 160 :h 20 :class (a-row)]
                    ([LINE]
                     ([INLINE :tag SPAN :class (a-size-base a-color-price)]
                      ([TEXT :x 494.5 :y 3783.3 :w 39 :h 15]))
                     ([TEXT :x 533.5 :y 3783.3 :w 4 :h 15])
                     ([INLINE :tag SPAN :id e10028])))))
                 ([BLOCK :tag LI :x 684.5 :y 3546.3 :w 160 :h 393 :class (a-carousel-card a-float-left) :id e10029]
                  ([BLOCK :tag DIV :x 684.5 :y 3546.3 :w 160 :h 236 :class (a-section a-spacing-none p13nimp p13n-asin)]
                   ([ANON]
                    ([BLOCK :tag DIV :x 684.5 :y 3546.3 :w 160 :h 135 :class (a-section a-spacing-mini)]
                     ([LINE]
                      ([INLINE :tag IMG])))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([TEXT :x 684.5 :y 3689.3 :w 106 :h 15]))))
                   ([BLOCK :tag DIV :x 684.5 :y 3706.3 :w 160 :h 18 :class (a-row a-size-small)]
                    ([MAGIC :tag A :x 684.5 :y 3706.3 :w 94 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-size-small a-link-child)]))
                   ([BLOCK :tag DIV :x 684.5 :y 3724.3 :w 160 :h 20 :class (a-icon-row a-spacing-none)]
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([TEXT :x 764.5 :y 3726.3 :w 4 :h 15]))
                     ([INLINE :tag A :class (a-size-small a-link-normal)]
                      ([TEXT :x 768.5 :y 3727.3 :w 13 :h 14]))))
                   ([BLOCK :tag DIV :x 684.5 :y 3744.3 :w 160 :h 18 :class (a-row a-size-small)]
                    ([LINE]
                     ([INLINE :tag SPAN :class (a-size-small a-color-secondary)]
                      ([TEXT :x 684.5 :y 3746.3 :w 59 :h 14]))))
                   ([BLOCK :tag DIV :x 684.5 :y 3762.3 :w 160 :h 20 :class (a-row)]
                    ([LINE]
                     ([INLINE :tag SPAN :class (a-size-base a-color-price)]
                      ([TEXT :x 684.5 :y 3765.3 :w 39 :h 15]))
                     ([TEXT :x 723.5 :y 3765.3 :w 4 :h 15])
                     ([INLINE :tag SPAN :id e10030])))))
                 ([BLOCK :tag LI :x 874.5 :y 3546.3 :w 160 :h 393 :class (a-carousel-card a-float-left) :id e10031]
                  ([BLOCK :tag DIV :x 874.5 :y 3546.3 :w 160 :h 255 :class (a-section a-spacing-none p13nimp p13n-asin)]
                   ([ANON]
                    ([BLOCK :tag DIV :x 874.5 :y 3546.3 :w 160 :h 135 :class (a-section a-spacing-mini)]
                     ([LINE]
                      ([INLINE :tag IMG])))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([INLINE :tag SPAN]
                       ([TEXT :x 874.5 :y 3689.3 :w 156 :h 15]))))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([INLINE :tag SPAN]
                       ([TEXT :x 874.5 :y 3708.3 :w 80 :h 15])))))
                   ([BLOCK :tag DIV :x 874.5 :y 3725.3 :w 160 :h 18 :class (a-row a-size-small)]
                    ([MAGIC :tag A :x 874.5 :y 3725.3 :w 75 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-size-small a-link-child)]))
                   ([BLOCK :tag DIV :x 874.5 :y 3743.3 :w 160 :h 20 :class (a-icon-row a-spacing-none)]
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([TEXT :x 954.5 :y 3745.3 :w 4 :h 15]))
                     ([INLINE :tag A :class (a-size-small a-link-normal)]
                      ([TEXT :x 958.5 :y 3746.3 :w 7 :h 14]))))
                   ([BLOCK :tag DIV :x 874.5 :y 3763.3 :w 160 :h 18 :class (a-row a-size-small)]
                    ([LINE]
                     ([INLINE :tag SPAN :class (a-size-small a-color-secondary)]
                      ([TEXT :x 874.5 :y 3765.3 :w 56 :h 14]))))
                   ([BLOCK :tag DIV :x 874.5 :y 3781.3 :w 160 :h 20 :class (a-row)]
                    ([LINE]
                     ([INLINE :tag SPAN :class (a-size-base a-color-price)]
                      ([TEXT :x 874.5 :y 3784.3 :w 39 :h 15]))
                     ([TEXT :x 913.5 :y 3784.3 :w 4 :h 15])
                     ([INLINE :tag SPAN :id e10032])))))
                 ([BLOCK :tag LI :x 1064.5 :y 3546.3 :w 160 :h 393 :class (a-carousel-card a-float-left) :id e10033]
                  ([BLOCK :tag DIV :x 1064.5 :y 3546.3 :w 160 :h 255 :class (a-section a-spacing-none p13nimp p13n-asin)]
                   ([ANON]
                    ([BLOCK :tag DIV :x 1064.5 :y 3546.3 :w 160 :h 135 :class (a-section a-spacing-mini)]
                     ([LINE]
                      ([INLINE :tag IMG])))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([TEXT :x 1064.5 :y 3689.3 :w 116 :h 15])))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([TEXT :x 1064.5 :y 3708.3 :w 47 :h 15]))))
                   ([BLOCK :tag DIV :x 1064.5 :y 3725.3 :w 160 :h 18 :class (a-row a-size-small)]
                    ([MAGIC :tag A :x 1064.5 :y 3725.3 :w 42 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-size-small a-link-child)]))
                   ([BLOCK :tag DIV :x 1064.5 :y 3743.3 :w 160 :h 20 :class (a-icon-row a-spacing-none)]
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([TEXT :x 1144.5 :y 3745.3 :w 4 :h 15]))
                     ([INLINE :tag A :class (a-size-small a-link-normal)]
                      ([TEXT :x 1148.5 :y 3746.3 :w 14 :h 14]))))
                   ([BLOCK :tag DIV :x 1064.5 :y 3763.3 :w 160 :h 18 :class (a-row a-size-small)]
                    ([LINE]
                     ([INLINE :tag SPAN :class (a-size-small a-color-secondary)]
                      ([TEXT :x 1064.5 :y 3765.3 :w 56 :h 14]))))
                   ([BLOCK :tag DIV :x 1064.5 :y 3781.3 :w 160 :h 20 :class (a-row)]
                    ([LINE]
                     ([INLINE :tag SPAN :class (a-size-base a-color-price)]
                      ([TEXT :x 1064.5 :y 3784.3 :w 39 :h 15]))
                     ([TEXT :x 1103.5 :y 3784.3 :w 4 :h 15])
                     ([INLINE :tag SPAN :id e10034])))))
                 ([BLOCK :tag LI :x 1254.5 :y 3546.3 :w 160 :h 393 :class (a-carousel-card a-float-left) :id e10035]
                  ([BLOCK :tag DIV :x 1254.5 :y 3546.3 :w 160 :h 256 :class (a-section a-spacing-none p13nimp p13n-asin)]
                   ([ANON]
                    ([BLOCK :tag DIV :x 1254.5 :y 3546.3 :w 160 :h 135 :class (a-section a-spacing-mini)]
                     ([LINE]
                      ([INLINE :tag IMG])))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([INLINE :tag SPAN]
                       ([TEXT :x 1254.5 :y 3689.3 :w 140 :h 15]))))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([INLINE :tag SPAN]
                       ([TEXT :x 1254.5 :y 3708.3 :w 160 :h 15]))))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([INLINE :tag SPAN]
                       ([TEXT :x 1254.5 :y 3727.3 :w 147 :h 15]))))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([INLINE :tag SPAN]
                       ([TEXT :x 1254.5 :y 3746.3 :w 71 :h 15])))))
                   ([BLOCK :tag DIV :x 1254.5 :y 3763.3 :w 160 :h 20 :class (a-icon-row a-spacing-none)]
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([TEXT :x 1334.5 :y 3765.3 :w 4 :h 15]))
                     ([INLINE :tag A :class (a-size-small a-link-normal)]
                      ([TEXT :x 1338.5 :y 3766.3 :w 21 :h 14]))))
                   ([BLOCK :tag DIV :x 1254.5 :y 3783.3 :w 160 :h 19 :class (a-row)]
                    ([LINE]
                     ([INLINE :tag SPAN :class (a-size-base a-color-price)]
                      ([TEXT :x 1254.5 :y 3785.3 :w 46 :h 15]))))))
                 ([BLOCK :tag LI :x 1444.5 :y 3546.3 :w 160 :h 393 :class (a-carousel-card a-float-left) :id e10036]
                  ([BLOCK :tag DIV :x 1444.5 :y 3546.3 :w 160 :h 218 :class (a-section a-spacing-none p13nimp p13n-asin)]
                   ([ANON]
                    ([BLOCK :tag DIV :x 1444.5 :y 3546.3 :w 160 :h 135 :class (a-section a-spacing-mini)]
                     ([LINE]
                      ([INLINE :tag IMG])))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([TEXT :x 1444.5 :y 3689.3 :w 141 :h 15])))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([TEXT :x 1444.5 :y 3708.3 :w 139 :h 15])))
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([TEXT :x 1444.5 :y 3727.3 :w 20 :h 15]))))
                   ([BLOCK :tag DIV :x 1444.5 :y 3744.3 :w 160 :h 20 :class (a-icon-row a-spacing-none)]
                    ([LINE]
                     ([INLINE :tag A :class (a-link-normal)]
                      ([TEXT :x 1524.5 :y 3746.3 :w 4 :h 15]))
                     ([INLINE :tag A :class (a-size-small a-link-normal)]
                      ([TEXT :x 1528.5 :y 3747.3 :w 14 :h 14])))))))))
              ([BLOCK :tag DIV :x 1632.5 :y 3546.3 :w 40 :h 393 :class (a-carousel-col a-carousel-right) :id e10037]
               ([MAGIC :tag A :x 1633.5 :y 3691.75 :w 36 :h 39 :mt -16 :mr 0 :mb 0 :ml 0 :id a-autoid-1 :class (a-button a-button-image a-carousel-button a-carousel-goto-nextpage)]))))))
          ([BLOCK :tag DIV :x 224.5 :y 3949.3 :w 1458 :h 23 :class (rhf-divider)])
          ([BLOCK :tag DIV :x 224.5 :y 3966.3 :w 1458 :h 89 :class (rhf-footer)]
           ([BLOCK :tag DIV :x 224.5 :y 3966.3 :w 1458 :h 75 :class (rvi-container)]
            ([BLOCK :tag DIV :x 1431.5 :y 3966.3 :w 271 :h 68 :class (rhf-sign-in-button-box)]
             ([BLOCK :tag DIV :x 1432.5 :y 3966.3 :w 270 :h 68 :class (rhf-sign-in-button)]
              ([BLOCK :tag DIV :x 1452.5 :y 3966.3 :w 230 :h 15 :class (rhf-sign-in-title)]
               ([LINE]
                ([TEXT :x 1464 :y 3966.3 :w 207 :h 15])))
              ([BLOCK :tag A :x 1452.5 :y 3986.3 :w 230 :h 28 :class (action-button)]
               ([BLOCK :tag SPAN :x 1452.5 :y 3986.3 :w 230 :h 28 :class (action-inner)]
                ([LINE]
                 ([TEXT :x 1548.5 :y 3993.3 :w 38 :h 14]))))
              ([BLOCK :tag DIV :x 1452.5 :y 4019.3 :w 230 :h 15 :class (rhf-sign-in-tooltip-new-customer)]
               ([LINE]
                ([TEXT :x 1502 :y 4020.8 :w 80 :h 12])
                ([INLINE :tag A :class (sign-in-tooltip-link)]
                 ([TEXT :x 1582 :y 4020.8 :w 51 :h 12]))))))
            ([BLOCK :tag DIV :x 1285.5 :y 3984.3 :w 146 :h 75 :class (ybh-edit)]
             ([MAGIC :tag DIV :x 1325.5 :y 3982.3 :w 12 :h 11 :mt -2 :mr 0 :mb 0 :ml 0 :class (ybh-edit-arrow)])
             ([TEXT :x 1337.5 :y 4014.3 :w 4 :h 15])
             ([MAGIC :tag DIV :x 1341.5 :y 3984.3 :w 80 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (ybh-edit-link)]))
            ([MAGIC :tag SPAN :x 234.5 :y 3991.8 :w 45 :h 26 :mt 0 :mr 3 :mb 0 :ml 0 :class (you-viewed)])
            ([TEXT :x 282.5 :y 3996.3 :w 4 :h 15])
            ([MAGIC :tag SPAN :x 286.5 :y 3967.3 :w 70 :h 75 :mt 0 :mr 0 :mb 0 :ml 0 :id rhfAsinRow-9814436569 :class (rhf-RVIs)])
            ([TEXT :x 356.5 :y 3996.3 :w 4 :h 15])
            ([MAGIC :tag SPAN :x 360.5 :y 3967.3 :w 70 :h 75 :mt 0 :mr 0 :mb 0 :ml 0 :id rhfAsinRow-B000XQ4LQU :class (rhf-RVIs)]))
           ([BLOCK :tag DIV :x 224.5 :y 4041.3 :w 1458 :h 0 :id e10038]))))))
      ([ANON]
       ([LINE]
        ([INLINE :tag BR])))
      ([BLOCK :tag DIV :x 203.5 :y 4105.3 :w 1500 :h 695 :id navFooter]
       ([MAGIC :tag DIV :x 203.5 :y 4105.3 :w 1500 :h 49 :class (navFooterBackToTop)])
       ([MAGIC :tag TABLE :x (/ 6106 15) :y 4179.3 :w 1092.85 :h 248.7 :class (navFooterVerticalColumn)])
       ([MAGIC :tag DIV :x 211.5 :y 4458 :w 1484 :h 24 :class (navFooterLine navFooterLogoLine)])
       ([BLOCK :tag DIV :x 211.5 :y 4486 :w 1484 :h 18 :class (navFooterLine navFooterLinkLine navFooterPadItemLine)]
        ([MAGIC :tag UL :x 630.2 :y 4486 :w 646.6 :h 18]))
       ([BLOCK :tag DIV :x 203.5 :y 4524 :w 1500 :h 237.3 :class (navFooterLine navFooterLinkLine navFooterDescLine)]
        ([MAGIC :tag TABLE :x 203.5 :y 4524 :w 1500 :h 237.3]))
       ([BLOCK :tag DIV :x 211.5 :y 4775.3 :w 1484 :h 18 :class (navFooterLine navFooterLinkLine navFooterPadItemLine)]
        ([MAGIC :tag UL :x 696.7 :y 4775.3 :w 513.6 :h 18]))) 
      ([BLOCK :tag DIV :x 203.5 :y 4808.3 :w 1500 :h 0 :id SponsoredLinksGateway]))))))

(define-problem verify
  ;#:test (forall (a b) (=> (is-no-box (real-fbox a)) (is-no-box (real-fbox b)) (not (overlap a b))))
  #:header header
  #:sheet doc-1
  #:documents doc-1)

(define-problem check
  #:test (forall (a b)
                 (=> (and (is-box/text (type a)) (is-tag/table (tagname (get/elt (element b)))))
                     (or (not (overlaps a b)) (= (pbox a) b))))
  #:sheet doc-1-sketch
  #:documents (strip-positions doc-1))

(define-problem debug
  #:header header
  #:sheet doc-1
  #:documents doc-1)
