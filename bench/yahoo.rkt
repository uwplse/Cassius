;; python get_bench.py --name yahoo 'file:///tmp/Yahoo.html'

(define-header header
"")

;; From file:///tmp/Yahoo.html

(define-stylesheet doc-1
  ((tag img)
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)])
  ((tag body)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((tag fieldset)
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((or (tag h1) (tag h2) (tag h3) (tag h4) (tag h5) (tag h6) (tag p) (tag dl) (tag ol) (tag ul) (tag dd) (tag blockquote))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((or (tag ol) (tag ul))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((tag i)
   [display display/inline-block])
  ((class fl-l)
   [float float/left])
  ((class fl-r)
   [float float/right])
  ((class p-xs)
   [padding-top (padding/px 5)]
   [padding-right (padding/px 5)]
   [padding-bottom (padding/px 5)]
   [padding-left (padding/px 5)])
  ((class p-l)
   [padding-top (padding/px 20)]
   [padding-right (padding/px 20)]
   [padding-bottom (padding/px 20)]
   [padding-left (padding/px 20)])
  ((class pb-xxs)
   [padding-bottom (padding/px 3)])
  ((class pt-xs)
   [padding-top (padding/px 5)])
  ((class pr-xs)
   [padding-right (padding/px 5)])
  ((class pb-xs)
   [padding-bottom (padding/px 5)])
  ((class pl-xs)
   [padding-left (padding/px 5)])
  ((class pt-s)
   [padding-top (padding/px 10)])
  ((class pb-s)
   [padding-bottom (padding/px 10)])
  ((class pl-s)
   [padding-left (padding/px 10)])
  ((class pr-m)
   [padding-right (padding/px 15)])
  ((class pt-l)
   [padding-top (padding/px 20)])
  ((class pb-l)
   [padding-bottom (padding/px 20)])
  ((class pl-l)
   [padding-left (padding/px 20)])
  ((class pb-xl)
   [padding-bottom (padding/px 25)])
  ((class m-a)
   [margin-top margin/auto]
   [margin-right margin/auto]
   [margin-bottom margin/auto]
   [margin-left margin/auto])
  ((class mt-xxs)
   [margin-top (margin/px 3)])
  ((class mt-xs)
   [margin-top (margin/px 5)])
  ((class mr-xs)
   [margin-right (margin/px 5)])
  ((class mb-xs)
   [margin-bottom (margin/px 5)])
  ((class ml-xs)
   [margin-left (margin/px 5)])
  ((class mt-s)
   [margin-top (margin/px 10)])
  ((class mb-s)
   [margin-bottom (margin/px 10)])
  ((class ml-s)
   [margin-left (margin/px 10)])
  ((class mr-l)
   [margin-right (margin/px 20)])
  ((class mb-l)
   [margin-bottom (margin/px 20)])
  ((class mt-xl)
   [margin-top (margin/px 25)])
  ((class w-25)
   [width width/25%])
  ((class w-30)
   [width width/30%])
  ((class w-33)
   [width width/33.33%])
  ((class w-40)
   [width width/40%])
  ((class w-42)
   [width width/42%])
  ((class w-49)
   [width width/49%])
  ((class w-50)
   [width width/50%])
  ((class w-70)
   [width width/70%])
  ((class w-100)
   [width width/100%])
  ("img.w-100"
   [width width/100%]
   [height height/auto])
  ((class d-ib)
   [display display/inline-block])
  ((class d-b)
   [display display/block])
  ((class d-n)
   [display display/none])
  ((class dn)
   [display display/none])
  ((class ta-c)
   [text-align text-align/center])
  ((class vh)
   #;[position position/absolute]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [height (height/px 1)]
   [width (width/px 1)])
  ((class ta-c)
   [text-align text-align/center])
  ((class ta-l)
   [text-align text-align/left])
  ((class ta-r)
   [text-align text-align/right])
  ((desc (class type_stream) (class icon-overlay))
   #;[position position/absolute]
   [width width/100%]
   [height height/100%])
  ((or (desc (class type_fptoday) (class video-icon) (tag i)) (desc (class type_hrtoday) (class video-icon) (tag i)) (desc (class type_stream) (class video-icon) (tag i)) (desc (class type_stream) (class gallery-icon) (tag i)) (desc (class app-wrapper) (class video-icon) (tag i)) (desc (class type_sportsevents) (class video-icon) (tag i)))
   [float float/left]
   [height (height/px 12)]
   [width (width/px 17)])
  ((or (desc (class type_fptoday) (class video-icon-mdm)) (desc (class type_hrtoday) (class video-icon-mdm)) (desc (class type_stream) (class video-icon-mdm)) (desc (class app-wrapper) (class video-icon-mdm)))
   #;[position position/absolute]
   [width width/100%])
  ((or (desc (class type_fptoday) (class video-icon-mdm) (tag i)) (desc (class type_hrtoday) (class video-icon-mdm) (tag i)) (desc (class type_stream) (class video-icon-mdm) (tag i)) (desc (class app-wrapper) (class video-icon-mdm) (tag i)) (desc (class type_sportsevents) (class video-icon-mdm) (tag i)))
   [float float/left]
   [height (height/px 24)]
   [width (width/px 33)])
  ((or (desc (id masthead) (class more-search)) (desc (id masthead) (class y-social-login-menu)) (class navrail-fav-menu) (class navrail-more-menu) (desc (class y-tooltip-interests) (class tooltip)) (class popover))
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((class side-buttons)
   [padding-bottom (padding/px 5)]
   #;[position position/absolute])
  ((class side-button)
   [width (width/px 24)]
   [height (height/px 24)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [float float/left]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 1)]
   [margin-left (margin/px 1)])
  ((desc (class y-tooltip) (class pointer))
   #;[position position/absolute]
   [display display/block])
  ((desc (class jsenabled) (class app-tab) (class app-wrapper))
   [padding-bottom (padding/px 36)])
  ((desc (class jsenabled) (class app-tab-menu) (class app-wrapper))
   [padding-bottom (padding/px 0)])
  ((desc (class jsenabled) (class app-tab) (class tab))
   [display display/none])
  ((desc (class jsenabled) (class tab-wrapper) (class tab))
   [float float/left])
  ((desc (class jsenabled) (class app-tab) (class panel))
   #;[clear clear/left]
   [padding-top (padding/px 10)]
   [display display/none])
  ((desc (class jsenabled) (class app-tab) (class show-panel))
   [display display/block])
  (".jsenabled .app-tab .tab-wrapper h3.on"
   [display display/block])
  (".jsenabled .app-tab h3.loaded"
   [display display/block])
  ((desc (class jsenabled) (class app-tab) (class tab-wrapper))
   [border-top-width (border/px 1)]
   #;[position position/absolute]
   [width width/99.3%]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 12)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 12)])
  ((desc (class jsenabled) (class app-tab) (class tab-wrapper) (tag h3))
   #;[position position/relative]
   [padding-top (padding/px 8)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [text-align text-align/center])
  ((desc (class y-tablist) (tag li))
   [float float/left])
  ((desc (class y-tablist) (tag a))
   [display display/block])
  ((desc (class y-tabpanels) (class tabpanel))
   [display display/none])
  (".y-tabpanels .tabpanel.selected"
   [display display/block])
  (".y-tablist.vertical li"
   [float float/none])
  (".y-tablist.collapsed li"
   [display display/none])
  (".y-tablist.collapsed li.selected"
   [display display/block])
  ((class y-carousel)
   #;[position position/relative]
   [text-align text-align/left]
   [width width/100%])
  ((desc (class jsenabled) (class y-carousel) (class y-carousel-list) (class y-panel))
   [float float/left]
   #;[position position/relative]
   [display display/inline])
  #;((or (tag html) (tag body))
   [height height/100%])
  ((or (class guest-module) (class main-row-wrapper) (class main-col-wrapper))
   [width (width/px 1200)]
   [margin-top margin/auto]
   [margin-right margin/auto]
   [margin-bottom margin/auto]
   [margin-left margin/auto])
  ((class rail)
   [width (width/px 153)]
   [display display/inline])
  ((desc (class type_masthead_default) (class logo-container))
   [width (width/px 153)])
  ((or (class sticky-rail-left-holder) (class sticky-rail-right-holder))
   [padding-bottom (padding/px 1)])
  ((class main-col)
   #;[width width/66.3%]
   [float float/left])
  ((class rail-col)
   [width (width/px 153)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   #;[position position/absolute])
  ((desc (class main-col) (class type_masthead_default) (class logo-container))
   [width (width/px 149)]
   [padding-right (padding/px 0)]
   [margin-left (margin/px -5)])
  ((id stream)
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   [margin-bottom (margin/px 20)])
  ((id hero-col)
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [margin-left (margin/px 153)])
  ((desc (class rail) (tag a))
   [display display/block]
   [padding-top (padding/px 5)]
   [padding-bottom (padding/px 5)])
  ((or (desc (class col-3) (class type_subfooter)) (desc (class main-2) (class type_subfooter)))
   [margin-top (margin/px 20)]
   [margin-right (margin/px 60)]
   [margin-bottom (margin/px 20)]
   [margin-left (margin/px 12)])
  ((or (desc (class col-3) (class type_subfooter) (tag li)) (desc (class main-2) (class type_subfooter) (tag li)))
   [margin-bottom margin/0.7em]
   [margin-right margin/2em])
  ((class back-to-top)
   #;[position position/relative]
   [display display/none])
  ((desc (class fixed-enabled) (class back-to-top))
   [display display/inline-block]
   #;[position position/absolute]
   [padding-top (padding/px 12)]
   [padding-right (padding/px 12)]
   [padding-bottom (padding/px 12)]
   [padding-left (padding/px 12)])
  ((desc (class back-to-top) (tag button))
   [width (width/px 22)]
   [height (height/px 24)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [display display/inline-block])
  ((desc (class billboard-layout) (class rail-col))
   #;[position position/relative]
   [float float/left]
   [width (width/px 153)])
  ((desc (class billboard-layout) (class col-3))
   [width (width/px 380.8)]
   ;[width width/33.7%]
   [float float/right])
  ((desc (class billboard-layout) (id hero-col))
   [margin-left (margin/px 154)]
   [margin-right (margin/px 380.8)]
   #;[margin-right margin/33.7%])
  ((desc (class billboard-layout) (class hero-col-wrapper))
   #;[clear clear/both]
   [display display/inline-block]
   [width width/100%])
  ((desc (class billboard-layout) (id ad-north-base))
   [float float/right]
   [width (width/px 970)]
   [margin-right (margin/px 5)])
  ((tag body)
   [padding-top (padding/px 86)])
  ((desc (class type_universalheader) (class uni-wrapper))
   [width width/100%]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((or (desc (class uh-more-menu) (tag a)) (desc (class type_universalheader) (tag a)))
   [display display/inline-block])
  ((desc (class type_universalheader) (class first-item))
   [margin-left (margin/px 0)])
  ((desc (class type_universalheader) (tag li))
   [padding-top (padding/px 3)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [height (height/px 19)]
   [float float/none]
   [display display/inline-block]
   [margin-left (margin/px 16)]
   [margin-right (margin/px 16)])
  ((desc (class type_universalheader) (class dropdown-label-text))
   [margin-right (margin/px 4)])
  ((desc (class type_universalheader) (class drop-arrow))
   [height (height/px 2)]
   [width (width/px 10)]
   [padding-bottom (padding/px 5)]
   [display display/inline-block])
  ((desc (class type_universalheader) (class uh-more-menu))
   #;[position position/absolute]
   [border-top-width (border/px 0)]
   [padding-top (padding/px 8)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 8)]
   [padding-left (padding/px 0)]
   [margin-left (margin/px -1)]
   [width width/auto])
  ((desc (class type_universalheader) (class uh-more-menu) (tag li))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [height height/auto]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [display display/block])
  ((desc (class type_universalheader) (id uh-more-link) (tag a))
   [padding-top (padding/px 4)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 1)]
   [padding-left (padding/px 12)]
   #;[position position/relative])
  ((desc (class type_universalheader) (id uh-more-link) (class uh-more-menu) (tag a))
   [padding-top (padding/px 6)]
   [padding-right (padding/px 12)]
   [padding-bottom (padding/px 6)]
   [padding-left (padding/px 12)]
   [display display/block])
  ((desc (class type_universalheader) (id home-icon))
   [width (width/px 16)]
   [height (height/px 16)]
   [margin-top (margin/px -3)]
   [margin-right (margin/px 5)])
  ((desc (class type_universalheader) (tag a))
   [padding-top (padding/px 1)])
  ((desc (class type_universalheader) (id uh-more-link))
   [border-left-width (border/px 1)]
   [border-right-width (border/px 1)]
   [margin-left (margin/px 4)]
   [padding-top (padding/px 0)]
   #;[position position/relative]
   [height (height/px 20)])
  ((desc (class type_universalheader) (class uni-wrapper) (tag ul))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 10)])
  ((desc (class uni-dark-purple) (class type_universalheader) (class uh-more-menu))
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((class type_intlselectorfull)
   [float float/right]
   [margin-top (margin/px 2)]
   [margin-right (margin/px 20)]
   #;[position position/relative]
   #;[direction direction/ltr])
  ((desc (class type_intlselectorfull) (class intl-selectorfull))
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   #;[position position/relative])
  ((desc (class type_intlselectorfull) (class header-intl-icon))
   [width (width/px 20)]
   [height (height/px 13)]
   [margin-right (margin/px 3)]
   [margin-top (margin/px -1)])
  ((desc (class type_intlselectorfull) (class intl-selectorfull) (class drop-arrow))
   [padding-bottom (padding/px 4)])
  ((desc (class type_intlselectorfull) (class y-tooltip-intlselectorfull) (class tooltip))
   [width (width/px 650)]
   [margin-top (margin/px -2)])
  ((or (desc (class type_intlselectorfull) (class y-tooltip-intlselectorfull) (class content)) (desc (class type_intlselectorfull) (class y-tooltip-intlselectorfull-helpmsg) (class content)))
   [padding-top (padding/px 20)]
   [padding-right (padding/px 20)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 20)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   #;[position position/relative])
  ((desc (class type_intlselectorfull) (class pointer))
   [height (height/px 8)]
   [width (width/px 13)])
  ((class type_tabbar)
   #;[position position/absolute]
   [width width/30%])
  ((desc (class type_tabbar) (class tiles))
   [float float/right]
   [margin-right (margin/px 15)])
  ((desc (class type_tabbar) (class type_tuc) (class y-menu))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((desc (class type_tabbar) (class type_tuc) (class login-menu-pointer))
   [width (width/px 16)]
   [height (height/px 8)]
   #;[position position/absolute]
   [display display/none])
  ((desc (class type_tabbar) (class tab-user) (class tab-icon))
   [width (width/px 26)]
   [height (height/px 24)])
  ((or (desc (class y-social-login-menu) (class login-btn-yahoo)) (desc (class y-social-login-menu) (class login-btn-facebook)))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 20)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 20)])
  ((desc (class y-social-login-menu) (class sign-up-btn))
   [margin-top (margin/px 20)]
   [margin-right (margin/px 20)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 20)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((desc (class y-social-login-menu) (class sign-up))
   [display display/inline])
  ((desc (class type_tabbar) (class tiles) (class tab))
   [display display/inline-block])
  ((desc (class type_tabbar) (class tab))
   #;[position position/relative]
   [height height/100%])
  ((desc (class main-col) (class type_tabbar) (class tiles))
   [margin-right (margin/px 0)])
  ((or (desc (class type_tabbar) (class tab-caption)) (desc (class type_tabbar) (class tab-label)))
   [padding-left (padding/px 1)])
  ((desc (class type_tabbar) (class tab-label) (tag em))
   [display display/inline-block])
  ((desc (class type_tabbar) (class tiles) (class tab))
   [border-top-width (border/px 0)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 1)])
  ((desc (class type_tabbar) (class tab-user))
   [margin-right (margin/px 20)])
  ((desc (class type_tabbar) (class tiles) (class tab-mail))
   [padding-left (padding/px 0)]
   [padding-right (padding/px 10)])
  ((desc (class type_tabbar) (class tiles) (class tab-icon))
   [display display/inline-block]
   #;[position position/relative]
   [margin-right (margin/px 6)])
  ((or (desc (class type_tuc_default) (class login-btn)) (desc (class type_tuc_default) (class login-btn)) (desc (class type_tuc_default) (class sign-up-btn)))
   [display display/block])
  ((desc (id stream) (class type_login))
   [display display/none])
  ((desc (class type_login) (class title))
   [margin-right (margin/px 0)])
  ((desc (class type_login) (class btns))
   [padding-bottom (padding/px 40)])
  ((desc (class login-svc) (tag i))
   [height (height/px 22)]
   [width (width/px 22)]
   #;[position position/absolute])
  ((class login-btn-small)
   #;[position position/relative]
   [display display/inline-block]
   [padding-top (padding/px 5)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 5)]
   [padding-left (padding/px 32)]
   [width (width/px 73)]
   [height (height/px 18)]
   [text-align text-align/center])
  ((desc (id masthead) (class login-btn-small))
   [display display/block]
   [margin-top margin/auto]
   [margin-right margin/auto]
   [margin-bottom margin/auto]
   [margin-left margin/auto]
   [width width/auto])
  ("a.login-btn-purple"
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((desc (class type_tabbar) (class tab-mail))
   [padding-left padding/3.846em]
   [border-left-width (border/px 0)])
  ((desc (class type_tabbar) (class tiles) (class tab-mail))
   [border-left-width (border/px 0)])
  ((desc (class type_tabbar) (class tab-mail) (class tab-icon))
   [width (width/px 31)]
   [height (height/px 24)])
  ((desc (class type_trendingnow_default) (class tnmod-container))
   #;[position position/absolute]
   [width width/50%]
   [height (height/px 31)])
  ((desc (class type_trendingnow_default) (class num))
   [text-align text-align/right])
  ((desc (class sasb-trendingnow) (id masthead) (class type_trendingnow_default) (class app))
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [margin-left (margin/px 155)])
  ((desc (class sasb-trendingnow) (id masthead) (class type_trendingnow_default) (class app-wrapper))
   [margin-top (margin/px 41)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 11)]
   [margin-left (margin/px 0)]
   #;[position position/relative]
   [width width/61%])
  ((desc (class sasb-trendingnow) (id masthead) (class type_trendingnow_default) (class app) (class app-heading))
   [margin-top (margin/px -1.5)]
   [float float/left]
   [width width/auto]
   [text-align text-align/right])
  ((desc (id masthead) (class trending-icon))
   [width (width/px 27)]
   [height (height/px 11)])
  ((desc (class sasb-trendingnow) (id masthead) (class trendingnow_trend-list))
   #;[position position/relative]
   [height (height/px 12)]
   [width width/auto])
  ((desc (class sasb-trendingnow) (id masthead) (class type_trendingnow_default) (class app) (class app-heading-mt))
   [margin-top (margin/px -2)])
  ((desc (class sasb-trendingnow) (id masthead) (class app_trendingnow-blocks) (class trendingnow_trend-list))
   [height height/auto])
  ((desc (class sasb-trendingnow) (id masthead) (class type_trendingnow_default) (class trendingnow_trend-list) (tag li))
   [margin-left (margin/px 15)]
   #;[position position/relative])
  ((or (desc (class sasb-trendingnow) (id masthead) (class type_trendingnow_default) (class num)) (desc (class sasb-trendingnow) (id masthead) (class type_trendingnow_default) (class tnmod-container)))
   [display display/none])
  ((class type_ads)
   [text-align text-align/center])
  ((desc (class type_ads) (class no-ad))
   [margin-bottom (margin/px 0)])
  ((desc (class type_ads) (class DBI))
   [display display/block])
  ((or (desc (class type_ads) (class fpad)) (desc (class type_ads) (class lrec)) (desc (class type_ads) (class lrec2)))
   [margin-bottom (margin/px 20)])
  ((desc (class type_ads) (class mast))
   [margin-bottom (margin/px 10)])
  ((class type_navrail)
   [margin-left (margin/px 10)])
  ((desc (class type_navrail) (tag li) (tag i))
   [margin-right (margin/px 10)]
   [width (width/px 20)]
   [height (height/px 20)])
  ((or (desc (class type_navrail) (class navrail-fav-menu-pointer)) (desc (class type_navrail) (class navrail-more-menu-pointer)))
   [width (width/px 9)]
   [height (height/px 17)]
   [display display/inline-block]
   #;[position position/absolute])
  ((desc (class type_navrail) (class navrail-more-menu-arrow))
   [width (width/px 6)]
   [height (height/px 10)]
   [display display/inline-block]
   [margin-left (margin/px 3)])
  ((or (class navrail-fav-menu) (class navrail-more-menu))
   [padding-top (padding/px 10)]
   [padding-right (padding/px 20)]
   [padding-bottom (padding/px 10)]
   [padding-left (padding/px 20)])
  ((class navrail-more-menu)
   [width (width/px 290)])
  ((desc (class type_navrail) (class more-link))
   [display display/inline-block])
  ((desc (class type_navrail) (class more-sites))
   #;[position position/relative]
   [padding-bottom (padding/px 10)]
   [margin-bottom (margin/px 10)])
  ((or (desc (class navrail-fav-menu) (tag li)) (desc (class navrail-more-menu) (tag li)))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((or (desc (class navrail-fav-menu) (tag li) (tag a)) (desc (class navrail-more-menu) (tag li) (tag a)))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((desc (class navrail-more-menu) (class divider))
   [border-top-width (border/px 1)]
   [margin-top (margin/px 10)])
  ((desc (class navrail-more-menu) (class learn-more))
   [padding-top (padding/px 15)]
   [padding-bottom (padding/px 0)])
  ((desc (class type_navrail) (class ad-rsch))
   [display display/none])
  ((desc (class type_navrail) (class favs))
   [border-top-width (border/px 1)]
   [padding-top (padding/px 6)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 6)]
   [padding-left (padding/px 0)])
  (".type_navrail ul.bd-b, .type_navrail .more-favs"
   [border-bottom-width (border/px 1)]
   [margin-bottom (margin/px 20)])
  ((desc (class rail) (class type_navrail) (class promoapp-link))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [width (width/px 76)]
   [height (height/px 24)])
  ((desc (class type_navrail) (class promoapp-msg))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 4)])
  ((class type_adsfallback_default)
   [display display/none]
   #;[position position/relative]
   [margin-bottom (margin/px 20)])
  ((desc (class type_trendingnowcarousel) (class tn-wrapper))
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   [margin-bottom (margin/px 20)]
   [padding-top (padding/px 10)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 10)]
   [padding-left (padding/px 10)])
  ((desc (class type_trendingnowcarousel) (class num))
   [text-align text-align/right])
  ((desc (class type_trendingnowcarousel) (class tn-main) (class list-title) (class img-sprite))
   [height (height/px 9)]
   [width (width/px 20)])
  ((desc (class type_games) (class game-item))
   [padding-left (padding/px 8)]
   [width width/30%])
  ((desc (class type_games) (class games-list) (class first))
   [padding-left (padding/px 0)]
   [padding-bottom (padding/px 0)])
  ((desc (class type_games) (class game-item) (tag img))
   [height height/auto]
   [width width/100%])
  ((desc (class type_dailyfantasy) (class df_countdown))
   [border-bottom-width (border/px 2)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px -10)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px -10)])
  ((desc (class type_dailyfantasy) (class df_header))
   [margin-bottom (margin/px 5)])
  ((desc (class type_dailyfantasy) (class df_contest))
   [width width/65%])
  ((desc (class type_dailyfantasy) (class df_contest_row))
   [margin-top (margin/px 0)]
   [margin-right (margin/px -10)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px -10)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 10)]
   [border-bottom-width (border/px 1)])
  ((desc (class type_dailyfantasy) (class df_btn))
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((desc (class type_dailyfantasy) (class df_more))
   [margin-top (margin/px 0)]
   [margin-right (margin/px -10)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px -10)])
  ((desc (class type_livenationpromo) (class live-nation-promo))
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   [margin-bottom (margin/px 20)]
   [padding-top (padding/px 10)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 10)]
   [padding-left (padding/px 10)]
   [margin-top (margin/px -10)])
  ((desc (class type_livenationpromo) (class event-link))
   [display display/inline-block]
   [float float/left])
  ((desc (class type_livenationpromo) (class cta))
   [display display/inline-block]
   [padding-top (padding/px 2)]
   [padding-right (padding/px 6)]
   [padding-bottom (padding/px 2)]
   [padding-left (padding/px 6)]
   [margin-right (margin/px 7)])
  ((desc (class type_livenationpromo) (class calendar))
   [float float/right]
   [display display/inline-block]
   [border-left-width (border/px 1)]
   [padding-top (padding/px 2)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 2)]
   [padding-left (padding/px 6)])
  ((class app)
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   [margin-bottom (margin/px 20)])
  ((class app-wrapper)
   [margin-top (margin/px 8)]
   [margin-right (margin/px 10)]
   [margin-bottom (margin/px 10)]
   [margin-left (margin/px 10)]
   #;[position position/relative])
  ((or (desc (class app) (class app-title)) (desc (class app) (class app-heading)))
   [margin-top (margin/px 2)])
  ((desc (class app) (class app-ctas))
   [display display/none]
   #;[position position/absolute])
  ((desc (class no-touch) (class app) (class app-ctas))
   [display display/block])
  ((desc (class jsenabled) (class app) (class cta))
   [width (width/px 23)]
   [height (height/px 23)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 1)]
   #;[position position/relative]
   [display display/inline-block])
  ((class app-close-button)
   [width (width/px 11)]
   [height (height/px 12)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)])
  ((desc (class app) (class app-search-icon))
   #;[position position/absolute]
   [width (width/px 14)]
   [height (height/px 14)])
  ((desc (class app) (class quotes-prompt))
   [text-align text-align/center])
  ((desc (class type_topheadlines) (class app-heading))
   [margin-bottom (margin/px 0)])
  ((desc (class type_topheadlines) (class headline-link))
   [margin-left (margin/px 15)])
  ((desc (class type_topheadlines) (class hl-list) (tag li))
   [margin-top (margin/px 7)])
  ((desc (class type_topheadlines) (class divider))
   [border-top-width (border/px 1)]
   [margin-top (margin/px 9)]
   [padding-top (padding/px 11)])
  ((desc (class type_topheadlines) (class yahoo-content) (tag li))
   [padding-top (padding/px 7)]
   [padding-left (padding/px 50)])
  ((desc (class type_topheadlines) (class src))
   [display display/block])
  ((desc (class type_topheadlines) (class ed-img))
   [width (width/px 40)]
   [height (height/px 40)]
   #;[position position/absolute]
   [display display/block]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   [margin-right (margin/px 10)])
  ((desc (class type_topheadlines) (class yahoo-content) (class headline-link))
   [margin-left (margin/px 0)]
   [display display/block])
  ((desc (class type_topheadlines) (class yahoo-content) (class headline-link) (tag a))
   [display display/block])
  ((desc (class type_topheadlines) (class app-topheadlines))
   [padding-bottom (padding/px 5)])
  ((class type_magpromote)
   [margin-bottom (margin/px 20)])
  ((desc (class type_magpromote) (class promoimg))
   [display display/block]
   [width width/50%]
   [float float/right]
   #;[position position/relative])
  ((desc (class type_magpromote) (class bpic))
   [display display/block]
   [height (height/px 190)]
   [width width/100%])
  ((desc (class type_magpromote) (class hdline))
   [padding-top (padding/px 8)]
   [padding-right (padding/px 12)]
   [padding-bottom (padding/px 12)]
   [padding-left (padding/px 12)])
  ((desc (class type_magpromote) (class lt) (class title))
   [display display/block]
   [margin-bottom (margin/px 6)])
  ((desc (class type_magpromote) (class lt) (class summary))
   [height height/5.8em]
   [margin-bottom (margin/px 8)])
  ((desc (class type_magpromote) (class footer))
   #;[position position/absolute]
   [margin-bottom (margin/px 12)])
  ((desc (class type_magpromote) (class footer) (class img-sprite))
   [height (height/px 12)]
   [width (width/px 20)])
  ((desc (class type_weather) (class current) (tag img))
   [margin-top (margin/px -18)])
  ((desc (class type_weather) (class scale) (class unit))
   [padding-top (padding/px 8)]
   [padding-right (padding/px 4)]
   [padding-bottom (padding/px 8)]
   [padding-left (padding/px 4)])
  ((desc (class type_location) (class loc-picker-icon))
   [width (width/px 10)]
   [height (height/px 14)])
  ((class fin-icon)
   [width (width/px 14)]
   [height (height/px 13)]
   [margin-top (margin/px 4)]
   [margin-right (margin/px 5)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 10)])
  ((desc (class type_finance_default) (class quotes-form))
   [height (height/px 23)]
   #;[position position/relative]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((desc (class type_finance_default) (class quotes-form) (class quotes-input))
   [padding-top (padding/px 3)]
   [padding-right (padding/px 3)]
   [padding-bottom (padding/px 3)]
   [padding-left (padding/px 20)])
  ((desc (class type_finance_default) (class quotes-btn))
   [display display/none])
  ((desc (class type_sportacular_default) (class list-big) (class gameWrapper))
   [border-top-width (border/px 1)]
   [padding-top (padding/px 4)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 2)]
   [padding-left (padding/px 0)])
  ((desc (class type_sportacular_default) (class list-big) (class game1))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)])
  ((desc (class type_sportacular_default) (class list-big) (tag h4))
   [width width/15%])
  ((desc (class type_sportacular_default) (class list-big) (class gameWrapper) (tag ul))
   [width width/85%])
  ((desc (class type_sportacular_default) (class list-big) (class state))
   [margin-left margin/-2%])
  ((desc (class type_sportacular_default) (class list-big) (class panel))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 13)]
   [padding-left (padding/px 0)])
  ((or (desc (class type_sportacular_default) (class list-big) (class pregame) (class team)) (desc (class type_sportacular_default) (class list-big) (class pregame) (class separator)))
   [padding-top (padding/px 8)])
  ((desc (class type_sportacular_default) (class list-big) (class separator))
   [width (width/px 12)])
  ((or (desc (class type_sportacular) (class sports-form) (class sports-input)) (id sportssearch))
   [padding-top (padding/px 3)]
   [padding-right (padding/px 3)]
   [padding-bottom (padding/px 3)]
   [padding-left (padding/px 20)])
  ((desc (class type_sportacular_default) (class sports-form))
   [height (height/px 23)]
   #;[position position/relative]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((desc (class app-flickr) (class app-items))
   #;[clear clear/left]
   [margin-left (margin/px -5)]
   #;[position position/relative])
  ((desc (class app-flickr) (class app-items) (tag li))
   [float float/left]
   [width width/20%]
   [border-left-width (border/px 5)])
  (".app-flickr .app-items li:nth-child(5) ~ li"
   [border-top-width (border/px 5)])
  ((desc (class app-items) (tag img))
   [width width/100%]
   [height height/auto])
  ((desc (class type_topvideos_default) (class grid) (class video-list))
   [margin-top (margin/px -8)]
   [margin-left (margin/px -8)])
  ((desc (class type_topvideos_default) (class grid) (class video-unit))
   [display display/inline-block]
   [width width/50%]
   [border-top-width (border/px 8)]
   [border-left-width (border/px 8)])
  ((desc (class type_topvideos_default) (class grid) (class video-unit) (class title) (tag a))
   [height height/2.5em]
   [text-align text-align/left])
  ((desc (class type_topvideos_default) (class grid) (class video-unit) (class title))
   #;[position position/relative]
   [padding-top (padding/px 5)])
  ((desc (class type_topvideos_default) (class grid) (tag img))
   [width width/100%]
   [height height/auto]
   #;[position position/relative])
  ((desc (class type_topvideos) (class videos-input))
   [padding-top (padding/px 3)]
   [padding-right (padding/px 3)]
   [padding-bottom (padding/px 3)]
   [padding-left (padding/px 20)])
  ((desc (class type_topvideos) (class videos-form))
   [margin-top (margin/px 5)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((desc (class type_horoscope) (class change-sign))
   [padding-left (padding/px 10)])
  ((desc (class type_horoscope) (class horoscope-icon))
   [width (width/px 64)]
   [height (height/px 64)])
  ((desc (class type_comics_default) (class y-tablist))
   #;[position position/absolute]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((desc (class type_comics_default) (class y-tablist) (tag a))
   [display display/inline-block]
   [width width/80%])
  ((desc (class type_comics_default) (class y-tablist) (tag li))
   [width (width/px 96)]
   [padding-top (padding/px 4)]
   [padding-right (padding/px 4)]
   [padding-bottom (padding/px 4)]
   [padding-left (padding/px 4)])
  (".type_comics_default .y-tablist li.selected"
   [width (width/px 120)])
  (".type_comics_default .y-tablist.collapsed li.selected"
   [display display/block])
  (".type_comics_default .y-tablist i.selected-icon"
   [width (width/px 10)]
   [margin-right (margin/px 5)]
   [height (height/px 8)])
  (".type_comics_default .y-tablist.collapsed .selected i.selected-icon"
   [width (width/px 5)])
  ((desc (class type_comics_default) (class y-tablist) (class dd-icon))
   #;[position position/absolute]
   [width (width/px 9)]
   [height (height/px 6)])
  ((class type_fptoday)
   [margin-bottom (margin/px 12)])
  ((desc (class type_fptoday) (tag h3))
   [margin-bottom (margin/px 5)])
  ((desc (class type_fptoday) (class main-image))
   [display display/block]
   [width width/100%]
   [height (height/px 215)]
   [text-align text-align/left]
   #;[position position/relative])
  ((desc (class type_fptoday) (class fptoday-img))
   [margin-left (margin/px -318)]
   #;[position position/relative]
   [display display/block]
   [margin-top (margin/px -125)])
  ((desc (class type_fptoday) (class fptoday-container))
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((desc (class type_fptoday) (class y-carousel-list) (class item))
   [text-align text-align/center]
   [width width/20%]
   [display display/inline-block]
   [padding-top (padding/px 9)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 6)]
   [padding-left (padding/px 0)]
   #;[position position/relative])
  ((desc (class type_fptoday) (class footer-img-holder))
   [height (height/px 45)]
   [display display/block]
   #;[position position/relative]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 6)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 6)]
   [text-align text-align/left])
  ((desc (class type_fptoday) (class footer-img))
   [height (height/px 45)]
   [width (width/px 120)]
   [margin-left (margin/px -60)]
   #;[position position/relative]
   [display display/block])
  ((desc (class type_fptoday) (class y-carousel-list) (class item-label))
   [display display/block]
   [padding-bottom (padding/px 5)]
   [height height/2.5em]
   [margin-top (margin/px 3)]
   [margin-right (margin/px 6)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 6)])
  ((desc (class type_fptoday) (class y-nav))
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((desc (class type_fptoday) (class y-carousel) (class y-carousel-list))
   [width width/100%])
  ((desc (class type_fptoday) (class y-carousel) (class y-carousel-list) (class y-panel))
   [border-top-width (border/px 1)]
   [display display/inline-block]
   [float float/none]
   [width width/100%])
  ((desc (class type_fptoday) (class y-nav-count))
   [float float/left]
   [margin-top (margin/px 2)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 2)])
  ((desc (class type_fptoday) (class y-nav-buttons))
   [float float/right]
   [padding-right (padding/px 1)])
  ((desc (class type_fptoday) (class y-nav-buttons) (tag a))
   [width (width/px 22)]
   [height (height/px 21)])
  ((desc (class type_fptoday) (class more-link))
   [display display/inline-block])
  ((or (desc (class type_fptoday) (class hide)) (desc (class fptoday-slider) (class hide)))
   [display display/none])
  ((desc (class type_fptoday) (class pos-2) (class package-body))
   [width width/100%]
   [padding-top (padding/px 7)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 8)]
   [padding-left (padding/px 0)])
  ((or (desc (class type_fptoday) (class pos-2) (class main-title)) (desc (class type_fptoday) (class pos-2) (class body-text)))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 36)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 13)])
  ((desc (class type_fptoday) (class overlay-enabled) (class main-image))
   [height (height/px 250)])
  ((desc (class type_fptoday) (class overlay-enabled) (class more-link) (class video-icon))
   #;[position position/relative]
   [margin-right (margin/px 3)])
  ((desc (class type_fptoday) (class overlay-enabled) (class more-link) (class video-icon) (tag i))
   [float float/left])
  ((desc (class type_fptoday) (class overlay-enabled) (class y-carousel) (class y-carousel-list) (class y-panel))
   [border-top-width (border/px 0)])
  ((desc (class type_fptoday) (class overlay-enabled) (class footer-img-holder))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [height (height/px 48)])
  ((desc (class type_fptoday) (class overlay-enabled) (class item-label))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 7)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 5)]
   [padding-right (padding/px 6)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 6)])
  ((desc (class type_fptoday) (class overlay-enabled) (class footer-img))
   [width (width/px 128)]
   [height (height/px 48)]
   [margin-left (margin/px -64)])
  ((desc (class type_fptoday) (class overlay-enabled) (class item))
   #;[position position/relative]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 5)]
   [padding-left (padding/px 0)])
  ((desc (class type_fptoday) (class overlay-enabled) (class selected))
   [border-bottom-width (border/px 5)]
   [padding-bottom (padding/px 0)])
  (".type_fptoday .overlay-enabled .empty, .type_fptoday .overlay-enabled .item:last-child"
   [border-right-width (border/px 0)]
   [margin-right (margin/px 0)])
  (".type_fptoday .overlay-enabled.navigation"
   [height (height/px 26)])
  ((desc (class type_fptoday) (class overlay-enabled) (class y-nav-count))
   #;[position position/absolute]
   [margin-right margin/-1.5em])
  ((desc (class type_fptoday) (class overlay-enabled) (class y-nav-buttons) (class playpause))
   #;[position position/absolute]
   [margin-left margin/2em]
   [width (width/px 10)]
   [height (height/px 14)]
   [padding-top (padding/px 1)]
   [padding-right (padding/px 2)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 4)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((desc (class type_fptoday) (class overlay-enabled) (class y-nav-buttons) (class playpause) (class img-sprite))
   [display display/block]
   [width (width/px 4)]
   [height (height/px 12)]
   [padding-top (padding/px 2)]
   [padding-right (padding/px 2)]
   [padding-bottom (padding/px 2)]
   [padding-left (padding/px 2)])
  (".type_fptoday .overlay-enabled .y-nav-buttons a.prev .img-sprite, .type_fptoday .overlay-enabled .y-nav-buttons a.next .img-sprite"
   [display display/block]
   [width (width/px 23)]
   [height (height/px 28)])
  ((desc (class type_fptoday) (class overlay-enabled) (class y-nav-buttons) (class ti))
   [display display/block])
  ((desc (class type_fptoday) (class overlay-enabled) (class carousel-container))
   [border-top-width (border/px 1)])
  ((desc (class type_fptoday) (class navigation-overlay-enabled) (class y-nav-count))
   [margin-right (margin/px 0)]
   [text-align text-align/right]
   [padding-top (padding/px 4)]
   [padding-right (padding/px 4)]
   [padding-bottom (padding/px 3)]
   [padding-left (padding/px 4)]
   [height (height/px 13)])
  ((desc (class type_fptoday) (class navigation-overlay-enabled) (class y-nav-buttons) (class playpause))
   [margin-right (margin/px 0)]
   [padding-top (padding/px 1)]
   [padding-right (padding/px 1)]
   [padding-bottom (padding/px 1)]
   [padding-left (padding/px 4)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [height (height/px 18)]
   [width (width/px 17)])
  ((desc (class type_fptoday) (class navigation-overlay-enabled) (class y-nav-buttons) (class playpause) (class img-sprite))
   [display display/block]
   [width (width/px 7)]
   [height (height/px 11)]
   [padding-top (padding/px 2)]
   [padding-right (padding/px 4)]
   [padding-bottom (padding/px 1)]
   [padding-left (padding/px 4)])
  (".type_fptoday .navigation-overlay-enabled.navigation"
   [height (height/px 0)])
  ((desc (class type_fptoday) (class footer-bookends) (class carousel-container))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 22)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 22)])
  ((or (desc (class type_fptoday) (class footer-bookends) (class y-nav-buttons) (class prev)) (desc (class type_fptoday) (class footer-bookends) (class y-nav-buttons) (class next)))
   [height (height/px 92)]
   [width (width/px 22)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)])
  (".type_fptoday .footer-bookends .y-nav-buttons a.next .img-sprite"
   [margin-left (margin/px 3)])
  (".type_fptoday .footer-bookends .y-nav-buttons a.prev .img-sprite, .type_fptoday .footer-bookends .y-nav-buttons a.next .img-sprite"
   [margin-top (margin/px 32)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 6)]
   [width (width/px 11)])
  (".type_fptoday .footer-bookends .y-nav-buttons a.prev .img-sprite"
   [margin-left (margin/px 5)])
  (".type_fptoday .footer-bookends .y-nav-buttons a.next .img-sprite"
   [margin-right (margin/px 7)])
  ((desc (class type_fptoday) (class overlay-enabled) (class package-body) (class main-title) (tag a))
   [display display/block])
  ((desc (class type_fptoday) (class reserve-controls))
   [display display/inline-block]
   [width (width/px 90)]
   [float float/right]
   [margin-right (margin/px -30)])
  ((desc (class type_fstream) (class filter-bar-section))
   #;[position position/relative]
   [margin-top (margin/px -1)]
   [margin-right (margin/px -1)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px -1)])
  ((desc (class type_fstream) (class tab-list))
   [padding-left (padding/px 15)])
  ((desc (class type_fstream) (class dropdown-label-text))
   [height (height/px 25)]
   [padding-top (padding/px 8)]
   [padding-right (padding/px 25)]
   [padding-bottom (padding/px 2)]
   [padding-left (padding/px 10)])
  ((desc (class type_fstream) (class drop-arrow))
   [height (height/px 4)]
   [width (width/px 10)]
   #;[position position/absolute]
   [margin-top (margin/px 15)]
   [padding-bottom (padding/px 4)])
  ((desc (class type_fstream) (class list-container))
   #;[position position/absolute]
   [border-left-width (border/px 1)]
   [border-top-width (border/px 0)]
   [display display/none]
   [padding-top (padding/px 12)]
   [padding-right (padding/px 17)]
   [padding-bottom (padding/px 7)]
   [padding-left (padding/px 17)]
   [width (width/px 124)])
  ((desc (class type_fstream) (class tab-list) (class filter-item))
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [display display/inline-block]
   [height (height/px 25)]
   [padding-top (padding/px 8)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 2)]
   [padding-left (padding/px 0)])
  ((desc (class type_fstream) (class recommended-label))
   [display display/block]
   [padding-top (padding/px 15)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 5)]
   [padding-left (padding/px 0)])
  ((desc (class type_fstream) (class filter-name))
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [text-align text-align/left]
   [margin-top (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 5)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 5)]
   [padding-left (padding/px 0)]
   [margin-right (margin/px 15)])
  ((desc (class type_fstream) (class tab-list) (class filter-selected) (class filter-name))
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)])
  ((desc (class type_fstream) (class list-container) (class filter-name))
   [display display/block]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 10)]
   [padding-left (padding/px 0)])
  (".type_stream > ul li:last-child"
   [border-bottom-width (border/px 0)])
  (".type_stream li, .type_stream div.strm-error-msg"
   [padding-top (padding/px 9)]
   [padding-right (padding/px 36)]
   [padding-bottom (padding/px 9)]
   [padding-left (padding/px 12)]
   #;[position position/relative]
   [border-bottom-width (border/px 1)])
  ((desc (class type_stream) (class notice))
   [border-top-width (border/px 1)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 0)]
   [padding-top (padding/px 12)]
   [padding-right (padding/px 12)]
   [padding-bottom (padding/px 12)]
   [padding-left (padding/px 12)])
  ((desc (class type_stream) (class notice) (tag button))
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   [margin-top (margin/px 0)]
   [margin-right margin/auto]
   [margin-bottom (margin/px 0)]
   [margin-left margin/auto]
   [padding-top (padding/px 12)]
   [padding-right (padding/px 12)]
   [padding-bottom (padding/px 12)]
   [padding-left (padding/px 12)]
   [width width/100%])
  ((desc (class type_stream) (tag h3))
   [margin-right (margin/px 47)])
  ((desc (class type_stream) (class img))
   [height (height/px 82)]
   [margin-top (margin/px 3)]
   #;[position position/relative]
   [width (width/px 82)])
  ((desc (class type_stream) (class thumb-left))
   [float float/left]
   [margin-right (margin/px 12)])
  ((desc (class type_stream) (tag ul) (tag li) (class wrapper))
   [height height/100%]
   [width width/100%])
  ((desc (class type_stream) (class attribution))
   [padding-right (padding/px 30)])
  ((desc (class type_stream) (class source))
   [margin-right (margin/px 6)])
  ((desc (class type_stream) (class off-network-icon))
   [height (height/px 12)]
   [width (width/px 11)]
   [margin-left (margin/px 3)])
  ((desc (class type_stream) (class interest-list))
   #;[position position/absolute]
   [margin-left (margin/px 10)])
  ((desc (class type_stream) (class interest-list) (class interest-wrap))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   #;[position position/static]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [margin-right (margin/px 10)])
  ((or (desc (class type_stream) (class featured) (class interest-list)) (desc (class type_stream) (class fb-friends) (class first-interest-filter)))
   [margin-left (margin/px 0)])
  ((desc (class type_stream) (class loading))
   [display display/none])
  ((desc (class jsenabled) (class type_stream) (class loading))
   [display display/block])
  ((desc (class y-tooltip-stream) (class tooltip))
   [text-align text-align/center])
  ((desc (class y-tooltip-stream) (class content))
   [padding-top (padding/px 5)]
   [padding-right (padding/px 10)]
   [padding-bottom (padding/px 5)]
   [padding-left (padding/px 10)])
  ((desc (class y-tooltip-stream) (class pointer))
   [border-top-width (border/px 6)]
   [border-right-width (border/px 6)]
   [border-left-width (border/px 6)]
   [border-bottom-width (border/px 3)]
   [height (height/px 0)]
   [margin-left (margin/px -2)]
   [width (width/px 0)])
  ((or (desc (class type_stream) (class video-icon) (class play-now)) (desc (class type_stream) (class gallery-icon) (class view-now)))
   [margin-left (margin/px 3)])
  ((desc (class type_stream) (class video-icon-mdm) (class play-now-mdm))
   [margin-left (margin/px 40)]
   [margin-top (margin/px 4)])
  ((or (desc (class type_stream) (class video-icon-lrg) (class play-now-lrg)) (desc (class type_stream) (class video-icon-mdm) (class play-now-mdm)))
   [display display/block])
  ((desc (class type_stream) (class adlink) (tag i))
   [height (height/px 13)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 1)]
   [margin-bottom (margin/px 3)]
   [margin-left (margin/px 2)]
   [width (width/px 13)])
  ((or (desc (class type_stream) (class side-buttons)) (desc (class type_stream) (class foot-buttons)) (desc (class type_stream) (class side-button)) (desc (class type_stream) (class interest-list)))
   [display display/none])
  ((or (desc (class no-touch) (class type_stream) (class side-buttons)) (desc (class no-touch) (class type_stream) (class foot-buttons)) (desc (class no-touch) (class type_stream) (class side-button)))
   [display display/block])
  ((desc (class no-touch) (class type_stream) (class interest-list))
   [display display/inline-block])
  (".type_stream u.imgstretch"
   [width (width/px 82)]
   [height (height/px 82)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  (".type_stream u.ftrimgstretch"
   [width width/50%]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((desc (class type_stream) (class rmx-ad) (tag h3))
   [margin-right (margin/px 70)])
  ((desc (class type_stream) (class featured))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((desc (class type_stream) (class featured) (class body-wrap) (tag h3))
   [margin-right (margin/px 0)])
  ((desc (class type_stream) (class featured) (class body))
   [padding-top (padding/px 8)]
   [padding-right (padding/px 20)]
   [padding-bottom (padding/px 8)]
   [padding-left (padding/px 12)])
  ((desc (class type_stream) (class featured-ads) (class featured-image))
   [height height/auto]
   [padding-bottom padding/24.7%])
  ((desc (class type_stream) (class featured-image))
   #;[position position/relative]
   [width width/50%]
   [float float/right]
   [height (height/px 169)])
  ((desc (class type_stream) (class featured) (tag h3))
   [margin-right (margin/px 0)])
  ((desc (class type_stream) (class featured) (tag h3) (tag a))
   [display display/block])
  ((desc (class type_stream) (class featured) (class adlink))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 3)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 3)])
  ((or (desc (class dev-desktop) (class type_stream) (class featured-ads) (class adlink)) (desc (class dev-desktop) (class type_stream) (class featured-cm-ads) (class adlink)))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 1)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 1)])
  ((desc (class dev-desktop) (class type_stream) (class featured-ads) (class ad-link-icon))
   #;[position position/relative]
   [display display/inline-block])
  ((desc (class dev-desktop) (class type_stream) (class ad-link-icon) (tag i))
   [width (width/px 22)]
   [height (height/px 24)])
  ((or (desc (class dev-desktop) (class type_stream) (class featured-ads) (class adlink) (tag i)) (desc (class dev-desktop) (class type_stream) (class featured-cm-ads) (class adlink) (tag i)))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [height (height/px 13)])
  ((desc (class type_stream) (class ad-link-icon))
   #;[position position/relative]
   [display display/inline-block])
  ((desc (class dev-desktop) (class type_stream) (class js-inline-video) (class js-video-target))
   [padding-bottom (padding/px 0)]
   [height (height/px 169)])
  ((id masthead)
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [width width/100%]
   #;[position position/absolute])
  ((desc (id masthead) (class main-row-wrapper))
   [padding-top (padding/px 25)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 24)]
   [padding-left (padding/px 0)]
   #;[position position/relative]
   [height (height/px 37)])
  ((tag body)
   [padding-top (padding/px 60)])
  ((desc (class type_masthead_default) (class mh-wrap))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((desc (class type_masthead_default) (class logo-container))
   [float float/left])
  ((desc (id masthead) (class searchwrapper))
   [margin-top (margin/px 1)])
  ((desc (id masthead) (class searchwrapper))
   #;[position position/relative]
   [margin-top margin/auto]
   [margin-right margin/auto]
   [margin-bottom margin/auto]
   [margin-left margin/auto]
   [width width/96%])
  ((desc (class type_masthead_default) (class searchwrapper-border))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [height (height/px 34)]
   [width width/100%]
   #;[position position/relative])
  ((desc (class type_masthead_default) (class searchwrapper-inner))
   [height (height/px 32)]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   #;[position position/absolute])
  ((desc (class type_masthead_default) (class input-query))
   [height (height/px 32)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   [width width/100%]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((desc (class type_masthead_default) (class input-wrapper))
   [height (height/px 32)]
   #;[position position/absolute]
   [padding-left (padding/px 8)])
  ((desc (class type_masthead_default) (class button-wrapper))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [margin-left (margin/px -2)]
   [height (height/px 31)]
   #;[position position/absolute]
   [text-align text-align/center]
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-left-width (border/px 1)]
   [border-bottom-width (border/px 2)])
  ((or (desc (class type_masthead_default) (class colour2)) (desc (class type_masthead_default) (class colour3)))
   [height (height/px 32)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)])
  ((desc (class type_masthead_default) (class searchsubmit))
   [width (width/px 88)]
   [height (height/px 31)]
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)])
  ((desc (class type_masthead_default) (class btn120) (class searchsubmit))
   [width (width/px 120)])
  ((desc (class type_masthead_default) (class btn120) (class searchsubmit))
   [height (height/px 33)])
  ((class troll-pointer)
   [width (width/px 16)]
   [height (height/px 8)]
   #;[position position/absolute]
   [display display/none])
  ((desc (class type_masthead_default) (class blueanimation) (class searchwrapper-inner))
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  (".type_masthead_default.loaded .blueanimation .searchwrapper-inner"
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)])
  ((desc (class main-col) (class type_masthead_default) (class logo-container))
   [width width/auto])
  ((desc (class type_masthead_default) (class hood))
   #;[position position/absolute]
   [width width/100%])
  ((desc (class type_masthead_default) (class hood) (class sa-window))
   [display display/none])
  ((desc (class type_masthead_default) (class hood) (class sa-drawer-container))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 1)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 1)])
  (".jsenabled .type_masthead_default .hood a.sa-drawer"
   [display display/block]
   [width (width/px 33)]
   [height (height/px 17)]
   [margin-left margin/2em]
   #;[position position/relative])
  (".type_masthead_default .hood a.sa-drawer"
   [display display/none])
  ((or (desc (class type_masthead_default) (class hood) (class rc-bl)) (desc (class type_masthead_default) (class hood) (class rc-br)))
   [display display/none])
  (".jsenabled .type_masthead_default .hide-completely, .jsenabled .type_masthead_default .hood a.hide-completely"
   [display display/none])
  ((class y-logo-new)
   [width (width/px 142)]
   [height (height/px 37)]
   [display display/block])
  ; !important
  ((id yui_3_8_1_1_1446778050697_132)
   [padding-top (padding/px 86)])
  ((class guest-module)
   [width (width/px 1200)])
  ((class main-row-wrapper)
   [width (width/px 1130)]))

(define-document (doc-1 #:width 1907 #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 1907 #|:h 985|# :id yui_3_8_1_1_1446778050697_541 :class (dev-desktop uni-purple-border ua-ff ua-unknown ua-ff41  bkt321 https mast-enabled  uni-dark-purple sasb-trendingnow jsenabled no-touch flash-0 yui3-js-enabled jsenabled no-touch flash-0)]
   ([BLOCK :tag BODY :x 0 :y 0 :w 1907 #|:h 1071|# :id yui_3_8_1_1_1446778050697_132 :class (yui3-skin-sam ua-ff ua-unknown ua-ff41  bkt321 https mast-enabled  uni-dark-purple sasb-trendingnow ltr fixed-enabled)]
    ([MAGIC :tag DIV :x 0 :y 0 :w 1907 :h 108 :id masthead :class (main-col billboard-layout cf)]
     ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 22 :id default-p_30345868 :class (mod view_default)]
      ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 22 :id default-p_30345868-bd :class (bd type_universalheader type_universalheader_default)]
       ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 22 :class (bg-container)]
        ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 0 :id default-p_30345957 :class (mod view_default)]
         ([BLOCK :tag DIV :x 1832 :y 2 :w 55 :h 19 :id default-p_30345957-bd :class (bd type_intlselectorfull type_intlselectorfull_default)]
          ([BLOCK :tag DIV :x 1832 :y 2 :w 55 :h 0 :id yui_3_8_1_1_1446778050697_181 :class (y-tooltip y-tooltip-intlselectorfull)])
          ([MAGIC :tag BUTTON :x 1832 :y 2 :w 55 :h 19 :mt 0 :mr 0 :mb 0 :ml 0 :class (intl-selectorfull)])))
        ([BLOCK :tag DIV :x 0 :y 0 :w 1200 :h 22 :class (uni-wrapper guest-module cf)]
         ([MAGIC :tag UL :x 10 :y 0 :w 1190 :h 22 :class (fz-xs)])))))
     ([BLOCK :tag DIV :x 388.5 :y 22 :w 1130 :h 86 :class (main-row-wrapper)]
      ([BLOCK :tag DIV :x 388.5 :y 47 :w 1130 :h 0 :id default-p_13838465 :class (mod view_default)]
       ([BLOCK :tag DIV :x 388.5 :y 47 :w 1130 :h 0 :id default-p_13838465-bd :class (bd type_masthead type_masthead_default loaded)]
        ([MAGIC :tag DIV :x 388.5 :y 47 :w 1130 :h 0 :class (mh-wrap us clearfix y-fp-pg-grad   lightbg )]
         ([MAGIC :tag DIV :x 383.5 :y 47 :w 147 :h 37 :class (logo-container)]
          ([BLOCK :tag H1 :x 383.5 :y 47 :w 147 :h 37]
           ([BLOCK :tag A :x 388.5 :y 47 :w 142 :h 37 :id yucs-logo-ani :class (y-logo-new ml-xs ti)]
            ([LINE]
             ([TEXT :x -25585.5 :y 46.75 :w 73 :h 33])))))
         ([MAGIC :tag FORM :x 543.5 :y 47 :w (/ 8896 15) :h 34 :id p_13838465-searchform :class (search-form)])
         #;([BLOCK :tag FORM :x 543.5 :y 47 :w (/ 8896 15) :h 34 :id p_13838465-searchform :class (search-form)]
          ([BLOCK :tag FIELDSET :x 543.5 :y 47 :w (/ 8896 15) :h 34 :class (compact-enabled-fieldset)]
           ([BLOCK :tag LEGEND :x 543.5 :y 47 :w 1 :h 1 :id aria-legend :class (vh)]
            ([LINE]
             ([TEXT :x 543.5 :y (/ 1399 30) :w 37 :h 17]))
            ([LINE]
             ([TEXT :x 543.5 :y 62.9 :w 41 :h 17])))
           ([BLOCK :tag LABEL :x 543.5 :y 47 :w 1 :h 1 :class (search-label vh)]
            ([LINE]
             ([INLINE :tag SPAN :id p_13838465-aria-label])
             ([TEXT :x 543.5 :y (/ 1399 30) :w 45 :h 17])))
           ([BLOCK :tag DIV :x (/ 16661 30) :y 47 :w (/ 1708 3) :h 34 :id p_13838465-searchwrapper :class (searchwrapper tabpanel selected sasb blueanimation btn120 )]
            ([BLOCK :tag DIV :x (/ 16661 30) :y 47 :w (/ 1708 3) :h 34 :class (searchwrapper-border y-srch-brdr)]
             ([BLOCK :tag DIV :x (/ 16661 30) :y 47 :w (/ 1333 3) :h 34 :id fp-search-bdr :class (searchwrapper-inner  y-glbl-srch-bg-img clearfix )]
              ([BLOCK :tag DIV :x (/ 16691 30) :y 48 :w (/ 1327 3) :h 32 :class (input-wrapper)]
               ([LINE]
                ([INLINE :tag INPUT :id p_13838465-p :class (input-query input-long med-large   compact-input-enabled)])))
              ([ANON]
               ([LINE]
                ([INLINE :tag SPAN :class (rc-tl y-mast-sprite)])
                ([INLINE :tag SPAN :class (rc-tr y-mast-sprite)])
                ([INLINE :tag SPAN :class (rc-bl y-mast-sprite)])
                ([INLINE :tag SPAN :class (rc-br y-mast-sprite)]))))
             ([BLOCK :tag SPAN :x 1004.7 :y 47 :w 120 :h 32 :class (button-wrapper colour3)]
              ([MAGIC :tag BUTTON :x 1004.7 :y 47 :w 120 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :id search-submit :class (searchsubmit med-large y-fp-pg-grad)])))
            ([ANON]
             ([LINE]
              ([INLINE :tag SPAN :class (ds-r y-mast-sprite)])))
            ([BLOCK :tag DIV :x (/ 16661 30) :y 97 :w (/ 1708 3) :h 0 :id p_13838465-hood :class (hood ds-b)]
             ([BLOCK :tag DIV :x (/ 16691 30) :y 97 :w (/ 1702 3) :h 0 :class (sa-drawer-container y-mast-sprite y-mast-ln-dk)]
              ([BLOCK :tag DIV :x (/ 16691 30) :y 97 :w (/ 1702 3) :h 0 :class (drawer-innerborder y-mast-ln-lt)])))))))
        #;([BLOCK :tag DIV :x 388.5 :y 47 :w 1 :h 1 :class (aria-announce vh)]
         ([BLOCK :tag P :x 388.5 :y 47 :w 1 :h 0]))))
      ([BLOCK :tag DIV :x 388.5 :y 47 :w 1130 :h 0 :id default-p_30345610 :class (mod view_default)]
       ([MAGIC :tag DIV :x 1179.5 :y 50 :w 339 :h 30.45 :id default-p_30345610-bd :class (bd type_tabbar type_tabbar_default)]
        #;([BLOCK :tag DIV :x 1179.5 :y 50 :w 339 :h 0 :class (clearfix)]
         ([BLOCK :tag H2 :x 1179.5 :y 50 :w 1 :h 1 :class (header-date y-txt-1 vh)]
          ([LINE]
           ([TEXT :x 1179.5 :y 49.7 :w 88 :h 25]))
          ([LINE]
           ([TEXT :x 1179.5 :y (/ 889 12) :w 91 :h 25]))
          ([LINE]
           ([TEXT :x 1179.5 :y (/ 1477 15) :w 16 :h 25]))
          ([LINE]
           ([TEXT :x 1179.5 :y 122.85 :w 44 :h 25])))
         ([BLOCK :tag UL :x 1272.5 :y 50 :w 246 :h 30.45 :id p_30345610-tiles :class (tiles)]
          ([MAGIC :tag LI :x 1272.5 :y 50.55 :w 80 :h 29.9 :mt 0 :mr 0 :mb 0 :ml 0 :class (tab tab-my)])
          ([MAGIC :tag LI :x 1352.5 :y 50 :w 74 :h 30.45 :mt 0 :mr 20 :mb 0 :ml 0 :class (tab tab-user)])
          ([MAGIC :tag LI :x 1446.5 :y 50 :w 72 :h 30.45 :mt 0 :mr 0 :mb 0 :ml 0 :class (tab tab-mail)])))))
      ([BLOCK :tag DIV :x 388.5 :y 47 :w 1130 :h 0 :id default-p_30345998 :class (mod view_default)])))
    ([ANON :h 86])
    ([BLOCK :tag DIV :x 0 :y 86 :w 1907 :h 0 :id y-assetctop]
     ([BLOCK :tag DIV :x 0 :y 86 :w 1907 :h 0 :id default-p_30346008 :class (mod view_default)]
      ([BLOCK :tag DIV :x 0 :y 86 :w 1907 :h 0 :id default-p_30346008-bd :class (bd type_assetcollector type_assetcollector_default)])))
    ([BLOCK :tag DIV :x 0 :y 108 :w 1907 :h 4206.6 :id nav-col :class (main-row billboard-layout cf)]
     ([MAGIC :tag DIV :x 388.5 :y 108 :w 1130 :h 4206.6 :id yui_3_8_1_1_1446778050697_540 :class (main-col-wrapper)])
     #;([BLOCK :tag DIV :x 388.5 :y 108 :w 1130 :h 3455.7 :id yui_3_8_1_1_1446778050697_540 :class (main-col-wrapper)]
      ([BLOCK :tag DIV :x 543.5 :y 108 :w 970 :h 0 :id ad-north-base]
       ([BLOCK :tag DIV :x 543.5 :y 108 :w 970 :h 0 :id default-p_30345978 :class (mod view_default)]
        ([BLOCK :tag DIV :x 543.5 :y 108 :w 970 :h 0 :id default-p_30345978-bd :class (bd type_ads type_ads_default)]
         ([BLOCK :tag DIV :x 543.5 :y 108 :w 970 :h 0 :class (mast no-ad)]
          ([BLOCK :tag DIV :x 543.5 :y 108 :w 970 :h 0 :id fp-adsMAST]
           ([BLOCK :tag DIV :x 543.5 :y 108 :w 970 :h 0 :id fp-adsMAST-iframe])))))
       ([BLOCK :tag DIV :x 543.5 :y 108 :w 970 :h 0 :id ad-north]))
      ([BLOCK :tag DIV :x 388.5 :y 108 :w 153 :h 811.5 :id nav-col-holder :class (rail rail-col)]
       ([BLOCK :tag DIV :x 388.5 :y 108 :w 153 :h 0 :class (sticky-pholder)])
       ([BLOCK :tag DIV :x 388.5 :y 108 :w 153 :h 811.5 :class (sticky-rail-left-holder)]
        ([BLOCK :tag DIV :x 388.5 :y 108 :w 153 :h 810.5 :id Navigation :class (pr-m)]
         ([BLOCK :tag DIV :x 388.5 :y 108 :w 138 :h 810.5 :id default-p_30345789 :class (mod view_default)]
          ([BLOCK :tag DIV :x 398.5 :y 108 :w 128 :h 810.5 :id default-p_30345789-bd :class (bd type_navrail type_navrail_default)]
           ([BLOCK :tag UL :x 398.5 :y 108 :w 128 :h 633.75 :class (navlist)]
            ([MAGIC :tag LI :x 398.5 :y 108 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 138 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 168 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 198 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 228 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 258 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 288 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 318 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 348 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 378 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 408 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 438 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 468 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 498 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 528 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 558 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 588 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 618 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 648 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 678 :w 128 :h 30 :mt 0 :mr 0 :mb 0 :ml 0])
            ([MAGIC :tag LI :x 398.5 :y 708 :w 128 :h 33.75 :mt 0 :mr 0 :mb 10 :ml 0 :class (more-sites)]))
           ([BLOCK :tag UL :x 398.5 :y 751.75 :w 128 :h 42.75 :class (favs bd-b)]
            ([MAGIC :tag LI :x 398.5 :y 758.75 :w 128 :h 28.75 :mt 0 :mr 0 :mb 0 :ml 0]))
           ([BLOCK :tag DIV :x 398.5 :y 814.5 :w 128 :h 0 :class (ad-rsch) :id e10001]
            ([BLOCK :tag DIV :x 398.5 :y 814.5 :w 128 :h 0 :id default-p_30345830_afd :class (mod view_default)]
             ([BLOCK :tag DIV :x 398.5 :y 814.5 :w 128 :h 0 :id default-p_30345830_afd-bd :class (bd type_adsfallback type_adsfallback_default)]
              ([BLOCK :tag DIV :x 398.5 :y 814.5 :w 128 :h 0 :id yset_params])
              ([BLOCK :tag DIV :x 398.5 :y 814.5 :w 128 :h 0 :id p_30345830_afd-promotion :class (y-hdr-ln homepage hp-hidden cf fz-xs)]
               ([BLOCK :tag DIV :x 398.5 :y 814.5 :w 128 :h 0 :class (promotion)])))))
           ([BLOCK :tag DIV :x 398.5 :y 814.5 :w 128 :h 0 :class (ad-tl1)]
            ([BLOCK :tag DIV :x 398.5 :y 814.5 :w 128 :h 0 :id default-p_30344913_a08 :class (mod view_default)]
             ([BLOCK :tag DIV :x 398.5 :y 814.5 :w 128 :h 0 :id default-p_30344913_a08-bd :class (bd type_ads type_ads_default)]
              ([BLOCK :tag DIV :x 398.5 :y 814.5 :w 128 :h 0 :class (tl1-fallback tl1 tl1-reserve)]))))
           ([BLOCK :tag DIV :x 398.5 :y 819.5 :w 128 :h 99 :class (promoapp pos-r mt-xl)]
            ([LINE]
             ([INLINE :tag IMG])
             ([TEXT :x 446.5 :y 864.5 :w 4 :h 17]))))))))
      ([BLOCK :tag DIV :x 1137.7 :y 108 :w 380.8 :h 4206.6 :id Aside :class (col-3)]
       ([BLOCK :tag DIV :x 1137.7 :y 108 :w 380.8 :h 4206.6 :class (pl-l pr-xs)]
        ([BLOCK :tag DIV :x 1157.7 :y 108 :w 355.8 :h 0 :class (sticky-pholder)])
        ([BLOCK :tag DIV :x 1157.7 :y 108 :w 355.8 :h 4206.6 :class (sticky-rail-right-holder)]
         ([BLOCK :tag DIV :x 1157.7 :y 108 :w 355.8 :h (/ 538 3) :id default-p_30345986 :class (mod view_default)]
          ([BLOCK :tag DIV :x 1157.7 :y 108 :w 355.8 :h (/ 538 3) :id default-p_30345986-bd :class (bd type_trendingnowcarousel type_trendingnowcarousel_default)]
           ([BLOCK :tag DIV :x 1157.7 :y 108 :w 355.8 :h (/ 538 3) :class (tn-wrapper tn-topic-wrapper )]
            ([BLOCK :tag UL :x 1168.7 :y 119 :w 333.8 :h (/ 472 3) :class (topics-wrapper)]
             ([MAGIC :tag LI :x 1168.7 :y 119 :w 333.8 :h (/ 472 3) :mt 0 :mr 0 :mb 0 :ml 0 :class (list-wrapper selected tn-main)])))))
         ([BLOCK :tag DIV :x 1157.7 :y (/ 922 3) :w 355.8 :h 0 :id default-p_30345997 :class (mod view_default)]
          ([BLOCK :tag DIV :x 1157.7 :y (/ 922 3) :w 355.8 :h 0 :id default-p_30345997-bd :class (bd type_games type_games_default)]))
         ([BLOCK :tag DIV :x 1157.7 :y (/ 922 3) :w 355.8 :h 0 :id default-p_30346014 :class (mod view_default)]
          ([BLOCK :tag DIV :x 1157.7 :y (/ 922 3) :w 355.8 :h 0 :id default-p_30346014-bd :class (bd type_dailyfantasy type_dailyfantasy_default)]))
         ([BLOCK :tag DIV :x 1157.7 :y (/ 892 3) :w 355.8 :h 42.25 :id default-p_30346000 :class (mod view_default)]
          ([BLOCK :tag DIV :x 1157.7 :y (/ 892 3) :w 355.8 :h 42.25 :id default-p_30346000-bd :class (bd type_livenationpromo type_livenationpromo_default)]
           ([BLOCK :tag DIV :x 1157.7 :y (/ 892 3) :w 355.8 :h 42.25 :class (live-nation-promo cf)]
            ([BLOCK :tag SPAN :x 1168.7 :y (/ 925 3) :w 182 :h 20.25 :class (event-link ell)]
             ([LINE]
              ([INLINE :tag SPAN :class (title ell)]
               ([TEXT :x 1258.7 :y 309.95 :w 92 :h 17]))))
            ([BLOCK :tag SPAN :x 1431.5 :y (/ 925 3) :w 71 :h 20.25 :class (calendar)]
             ([LINE]
              ([TEXT :x 1438.5 :y (/ 9299 30) :w 64 :h 17])))
            ([LINE]
             ([INLINE :tag A])))))
         ([BLOCK :tag DIV :x 1157.7 :y (/ 4315 12) :w 355.8 :h 0 :id default-p_13923486 :class (mod view_default)]
          ([BLOCK :tag DIV :x 1157.7 :y (/ 4315 12) :w 355.8 :h 0 :id default-p_13923486-bd :class (bd type_ads type_ads_default)]
           ([BLOCK :tag DIV :x 1157.7 :y (/ 4315 12) :w 355.8 :h 0 :class (fpad no-ad)])))
         ([BLOCK :tag DIV :x 1157.7 :y (/ 4315 12) :w 355.8 :h 250 :id default-p_30345987 :class (mod view_default)]
          ([BLOCK :tag DIV :x 1157.7 :y (/ 4315 12) :w 355.8 :h 250 :id default-p_30345987-bd :class (bd type_ads type_ads_default)]
           ([BLOCK :tag DIV :x 1157.7 :y (/ 4315 12) :w 355.8 :h 250 :class (lrec DBI)]
            ([BLOCK :tag DIV :x 1157.7 :y (/ 4315 12) :w 355.8 :h 250 :id fp-adsLREC]
             ([MAGIC :tag DIV :x 1185.6 :y (/ 4315 12) :w 300 :h 250 :mt 0 :mr 0 :mb 0 :ml 0 :id sb_rel_fp-adsLREC-iframe :class (darla)])))))
         ([BLOCK :tag DIV :x 1157.7 :y (/ 7555 12) :w 355.8 :h 0 :id default-p_30346003 :class (mod view_default)]
          ([BLOCK :tag DIV :x 1157.7 :y (/ 7555 12) :w 355.8 :h 0 :id default-p_30346003-bd :class (bd type_trendingnowcarousel type_trendingnowcarousel_default)]))
         ([BLOCK :tag DIV :x 1157.7 :y (/ 7555 12) :w 355.8 :h (/ 9929 3) :id default-p_30345823 :class (mod view_default)]
          ([BLOCK :tag DIV :x 1157.7 :y (/ 7555 12) :w 355.8 :h (/ 9929 3) :id default-p_30345823-bd :class (bd type_appscontainer type_appscontainer_default)]
           ([BLOCK :tag DIV :x 1157.7 :y (/ 7555 12) :w 355.8 :h 453.5 :id default-p_30345940 :class (mod view_default)]
            ([BLOCK :tag DIV :x 1157.7 :y (/ 7555 12) :w 355.8 :h 453.5 :id default-p_30345940-bd :class (bd type_topheadlines type_topheadlines_default)]
             ([BLOCK :tag DIV :x 1157.7 :y (/ 7555 12) :w 355.8 :h 453.5 :class (app pos-r cf app-topheadlines)]
              ([BLOCK :tag DIV :x 1168.7 :y (/ 7663 12) :w 333.8 :h 428.5 :class (app-wrapper)]
               ([BLOCK :tag H2 :x 1168.7 :y (/ 7663 12) :w 333.8 :h 22.5 :class (fz-xl app-heading mb-s)]
                ([LINE]
                 ([TEXT :x 1168.7 :y (/ 3827 6) :w 119 :h 24])))
               ([BLOCK :tag OL :x 1168.7 :y (/ 8017 12) :w 333.8 :h 155 :class (hl-list yahoo-content)]
                ([MAGIC :tag LI :x 1168.7 :y (/ 8017 12) :w 333.8 :h 47 :mt 7 :mr 0 :mb 0 :ml 0 :class (pos-r)])
                ([MAGIC :tag LI :x 1168.7 :y (/ 8665 12) :w 333.8 :h 47 :mt 7 :mr 0 :mb 0 :ml 0 :class (pos-r)])
                ([MAGIC :tag LI :x 1168.7 :y (/ 9313 12) :w 333.8 :h 47 :mt 7 :mr 0 :mb 0 :ml 0 :class (pos-r)]))
               ([BLOCK :tag H3 :x 1168.7 :y (/ 9985 12) :w 333.8 :h 34.5 :class (fz-xl mb-s divider)]
                ([LINE]
                 ([TEXT :x 1168.7 :y (/ 2530 3) :w 92 :h 24])))
               ([BLOCK :tag OL :x 1168.7 :y (/ 10519 12) :w 333.8 :h 190.5 :class (hl-list world-content)]
                ([MAGIC :tag LI :x 1168.7 :y (/ 10519 12) :w 333.8 :h 32.5 :mt 7 :mr 0 :mb 0 :ml 0 :class (pos-r)])
                ([MAGIC :tag LI :x 1168.7 :y (/ 10993 12) :w 333.8 :h 32.5 :mt 7 :mr 0 :mb 0 :ml 0 :class (pos-r)])
                ([MAGIC :tag LI :x 1168.7 :y (/ 11467 12) :w 333.8 :h 32.5 :mt 7 :mr 0 :mb 0 :ml 0 :class (pos-r)])
                ([MAGIC :tag LI :x 1168.7 :y (/ 11941 12) :w 333.8 :h 32.5 :mt 7 :mr 0 :mb 0 :ml 0 :class (pos-r)])
                ([MAGIC :tag LI :x 1168.7 :y (/ 12415 12) :w 333.8 :h 32.5 :mt 7 :mr 0 :mb 0 :ml 0 :class (pos-r)]))
               ([BLOCK :tag DIV :x 1493.5 :y (/ 7663 12) :w 24 :h 23 :class (app-ctas z-1 v-h)]
                ([MAGIC :tag A :x 1494.5 :y (/ 7663 12) :w 23 :h 23 :mt 0 :mr 0 :mb 0 :ml 1 :class (cta rapidnofollow remove-cta img-sprite halt d-ib)]))))))
           ([BLOCK :tag DIV :x 1157.7 :y (/ 13237 12) :w 355.8 :h 190 :id default-p_30345980 :class (mod view_default)]
            ([BLOCK :tag DIV :x 1157.7 :y (/ 13237 12) :w 355.8 :h 190 :id default-p_30345980-bd :class (bd type_magpromote type_magpromote_default)]
             ([BLOCK :tag DIV :x 1157.7 :y (/ 13237 12) :w 355.8 :h 190 :class (templ cf katie-couric)]
              ([BLOCK :tag A :x 1335.6 :y (/ 13237 12) :w 177.9 :h 190 :class (promoimg)]
               ([BLOCK :tag SPAN :x 1335.6 :y (/ 13237 12) :w 177.9 :h 190 :class (bpic) :id e10004]))
              ([BLOCK :tag DIV :x 1157.7 :y (/ 13237 12) :w (/ 5203 30) :h 139 :class (hdline w-42)]
               ([BLOCK :tag DIV :x 1169.7 :y (/ 13333 12) :w (/ 4483 30) :h 111 :class (lt)]
                ([BLOCK :tag SPAN :x 1169.7 :y (/ 13333 12) :w (/ 4483 30) :h 18 :class (title fz-s)]
                 ([LINE]
                  ([TEXT :x 1169.7 :y (/ 13321 12) :w 88 :h 20])))
                ([BLOCK :tag P :x 1169.7 :y (/ 13621 12) :w (/ 4483 30) :h 87 :class (summary fz-l)]
                 ([LINE]
                  ([TEXT :x 1169.7 :y (/ 13609 12) :w 140 :h 20]))
                 ([LINE]
                  ([TEXT :x 1169.7 :y (/ 13825 12) :w 134 :h 20]))
                 ([LINE]
                  ([TEXT :x 1169.7 :y (/ 14041 12) :w 87 :h 20]))
                 ([LINE]
                  ([TEXT :x 1169.7 :y (/ 14257 12) :w 63 :h 20])))
                ([LINE]
                 ([INLINE :tag A :class (prlink)])))
               ([BLOCK :tag A :x 1169.7 :y (/ 3787 3) :w 98 :h 18.75 :class (footer fz-s)]
                ([LINE]
                 ([INLINE :tag SPAN :class (watchnow)]
                  ([TEXT :x 1189.7 :y 1182.875 :w 78 :h 20]))))))))
           ([BLOCK :tag DIV :x 1157.7 :y (/ 15757 12) :w 355.8 :h 159 :id default-p_63794 :class (mod view_default)]
            ([BLOCK :tag DIV :x 1157.7 :y (/ 15757 12) :w 355.8 :h 159 :id default-p_63794-bd :class (bd type_weather type_weather_default)]
             ([BLOCK :tag DIV :x 1157.7 :y (/ 15757 12) :w 355.8 :h 159 :class (app pos-r cf app-weather)]
              ([BLOCK :tag DIV :x 1168.7 :y (/ 15865 12) :w 333.8 :h 139 :class (app-wrapper)]
               ([BLOCK :tag H2 :x 1168.7 :y (/ 15865 12) :w 1 :h 1 :class (vh)]
                ([LINE]
                 ([TEXT :x 1168.7 :y (/ 39653 30) :w 74 :h 25])))
               ([BLOCK :tag H3 :x 1168.7 :y (/ 15865 12) :w 333.8 :h 18 :class (app-heading accent va-m fz-xl)]
                ([BLOCK :tag DIV :x 1168.7 :y (/ 15865 12) :w 333.8 :h 18 :class (type_location loc-picker lh-100)]
                 ([BLOCK :tag DIV :x 1168.7 :y (/ 15865 12) :w 333.8 :h 18 :class (loc-picker-handle)]
                  ([LINE]
                   ([INLINE :tag B :class (loc-picker-link)]
                    ([INLINE :tag SPAN :class (loc-city)]
                     ([TEXT :x 1168.7 :y (/ 15829 12) :w 56 :h 24])))
                   ([TEXT :x 1224.7 :y (/ 15829 12) :w 5 :h 24])))))
               ([BLOCK :tag UL :x 1168.7 :y (/ 16081 12) :w 333.8 :h 121 :class (fz-xxs cf  conditions)]
                ([MAGIC :tag LI :x 1168.7 :y (/ 16081 12) :w 333.8 :h 35 :mt 0 :mr 0 :mb 0 :ml 0 :class (pos-r cf current)])
                ([MAGIC :tag LI :x 1168.7 :y (/ 16621 12) :w 111.25 :h 76 :mt 0 :mr 0 :mb 0 :ml 0 :class (pos-r fl-l w-33 ta-c today)])
                ([MAGIC :tag LI :x 1279.95 :y (/ 16621 12) :w 111.25 :h 76 :mt 0 :mr 0 :mb 0 :ml 0 :class (pos-r fl-l w-33 ta-c tomorrow)])
                ([MAGIC :tag LI :x 1391.2 :y (/ 16621 12) :w 111.25 :h 76 :mt 0 :mr 0 :mb 0 :ml 0 :class (pos-r fl-l w-33 ta-c thirdday)]))
               ([BLOCK :tag DIV :x 1493.5 :y (/ 15865 12) :w 24 :h 23 :class (app-ctas z-1 v-h)]
                ([MAGIC :tag A :x 1494.5 :y (/ 15865 12) :w 23 :h 23 :mt 0 :mr 0 :mb 0 :ml 1 :class (cta rapidnofollow remove-cta img-sprite halt d-ib)]))))))
           ([BLOCK :tag DIV :x 1157.7 :y (/ 17905 12) :w 355.8 :h 209.7 :id default-p_93109 :class (mod view_default)]
            ([BLOCK :tag DIV :x 1157.7 :y (/ 17905 12) :w 355.8 :h 209.7 :id default-p_93109-bd :class (bd type_finance type_finance_default)]
             ([BLOCK :tag DIV :x 1157.7 :y (/ 17905 12) :w 355.8 :h 209.7 :class (app pos-r cf app-quotes app-tab app-tab-tabs)]
              ([BLOCK :tag DIV :x 1168.7 :y (/ 18013 12) :w 333.8 :h 189.7 :class (app-wrapper)]
               ([BLOCK :tag H2 :x 1168.7 :y (/ 18013 12) :w 333.8 :h 22.5 :class (fz-xl app-heading mb-s)]
                ([LINE]
                 ([TEXT :x 1168.7 :y (/ 4501 3) :w 63 :h 24])
                 ([INLINE :tag B :class (fz-xs)]
                  ([INLINE :tag A]
                   ([TEXT :x 1231.7 :y (/ 4516 3) :w 87 :h 17])))))
               ([BLOCK :tag DIV :x 1157.7 :y (/ 50093 30) :w 355.45 :h 21 :class (tab-tabs tab-wrapper tab-tabs-loaded)]
                ([BLOCK :tag DIV :x 1169.7 :y (/ 50123 30) :w 331.45 :h 0 :class (wrapper)]
                 ([BLOCK :tag H3 :x 1169.7 :y (/ 50123 30) :w 41 :h 20 :class (app-sub-heading tab  fz-xxs mr-l pb-xs  selected on  fw-b loaded)]
                  ([LINE]
                   ([TEXT :x 1169.7 :y 1572.5 :w 41 :h 15])))
                 ([BLOCK :tag H3 :x 1230.7 :y (/ 50123 30) :w 57 :h 20 :class (app-sub-heading tab  fz-xxs mr-l pb-xs tab-disabled  loaded)]
                  ([LINE]
                   ([TEXT :x 1230.7 :y 1572.5 :w 57 :h 15])))))
               ([BLOCK :tag DL :x 1168.7 :y (/ 18403 12) :w 333.8 :h 98.2 :class (panel markets cf lh-162 fz-xs pb-xl show-panel quote-percent)]
                ([BLOCK :tag DT :x 1168.7 :y (/ 18523 12) :w (/ 4005 30) :h (/ 316 15) :class (cl-l fl-l w-40)]
                 ([BLOCK :tag A :x 1168.7 :y (/ 18523 12) :w (/ 4005 30) :h (/ 316 15) :class (ell d-b)]
                  ([LINE]
                   ([TEXT :x 1168.7 :y (/ 23184 15) :w 52 :h 17]))))
                ([BLOCK :tag DD :x (/ 39067 30) :y (/ 18523 12) :w 83.45 :h (/ 316 15) :class (fl-l w-25 ta-r)]
                 ([LINE]
                  ([TEXT :x (/ 4007 3) :y (/ 23184 15) :w 50 :h 17])))
                ([BLOCK :tag DD :x (/ 42071 30) :y (/ 18523 12) :w (/ 1502 15) :h (/ 316 15) :class (fl-r w-30 ta-r ell down list)]
                 ([BLOCK :tag I :x (/ 42371 30) :y (/ 18571 12) :w 14 :h 13 :class (fin-icon fl-l)])
                 ([ANON]
                  ([LINE]
                   ([TEXT :x 1461.5 :y (/ 23184 15) :w 41 :h 17]))))
                ([BLOCK :tag DT :x 1168.7 :y 1564.65 :w (/ 4005 30) :h (/ 316 15) :class (cl-l fl-l w-40)]
                 ([BLOCK :tag A :x 1168.7 :y 1564.65 :w (/ 4005 30) :h (/ 316 15) :class (ell d-b)]
                  ([LINE]
                   ([TEXT :x 1168.7 :y 1566.7 :w 121 :h 17]))))
                ([BLOCK :tag DD :x (/ 39067 30) :y 1564.65 :w 83.45 :h (/ 316 15) :class (fl-l w-25 ta-r)]
                 ([LINE]
                  ([TEXT :x (/ 4007 3) :y 1566.7 :w 50 :h 17])))
                ([BLOCK :tag DD :x (/ 42071 30) :y 1564.65 :w (/ 1502 15) :h (/ 316 15) :class (fl-r w-30 ta-r ell down list)]
                 ([BLOCK :tag I :x (/ 42371 30) :y 1568.65 :w 14 :h 13 :class (fin-icon fl-l)])
                 ([ANON]
                  ([LINE]
                   ([TEXT :x 1461.5 :y 1566.7 :w 41 :h 17]))))
                ([BLOCK :tag DT :x 1168.7 :y 1486.625 :w (/ 4005 30) :h (/ 316 15) :class (cl-l fl-l w-40)]
                 ([BLOCK :tag A :x 1168.7 :y 1486.625 :w (/ 4005 30) :h (/ 316 15) :class (ell d-b)]
                  ([LINE]
                   ([TEXT :x 1168.7 :y 1587.75 :w 117 :h 17]))))
                ([BLOCK :tag DD :x (/ 39067 30) :y 1486.625 :w 83.45 :h (/ 316 15) :class (fl-l w-25 ta-r)]
                 ([LINE]
                  ([TEXT :x (/ 3986 3) :y 1587.75 :w 57 :h 17])))
                ([BLOCK :tag DD :x (/ 42071 30) :y 1486.625 :w (/ 1502 15) :h (/ 316 15) :class (fl-r w-30 ta-r ell down list)]
                 ([BLOCK :tag I :x (/ 42371 30) :y 1490.375 :w 14 :h 13 :class (fin-icon fl-l)])
                 ([ANON]
                  ([LINE]
                   ([TEXT :x 1461.5 :y 1587.75 :w 41 :h 17])))))
               ([BLOCK :tag FORM :x 1168.7 :y (/ 48653 30) :w 333.8 :h 23 :class (quotes-form w-100)]
                ([BLOCK :tag LABEL :x 1168.7 :y (/ 48653 30) :w 1 :h 1 :class (vh)]
                 ([LINE]
                  ([TEXT :x 1168.7 :y (/ 9727 6) :w 26 :h 15]))
                 ([LINE]
                  ([TEXT :x 1168.7 :y (/ 19619 12) :w 75 :h 15])))
                ([BLOCK :tag I :x 1173.7 :y (/ 48953 30) :w 14 :h 14 :class (fl-l img-sprite app-search-icon)])
                ([ANON]
                 ([LINE]
                  ([INLINE :tag INPUT :class (quotes-input p-xs mt-xs mb-xs fz-xs w-100 quotes-input-inactive)]))))
               ([BLOCK :tag DIV :x 1493.5 :y (/ 18013 12) :w 24 :h 23 :class (app-ctas z-1 v-h)]
                ([MAGIC :tag A :x 1494.5 :y (/ 18013 12) :w 23 :h 23 :mt 0 :mr 0 :mb 0 :ml 1 :class (cta rapidnofollow remove-cta img-sprite halt d-ib)]))))))
           ([BLOCK :tag DIV :x 1157.7 :y (/ 51653 30) :w 355.8 :h 281.5 :id default-p_30345807 :class (mod view_default)]
            ([BLOCK :tag DIV :x 1157.7 :y (/ 51653 30) :w 355.8 :h 281.5 :id default-p_30345807-bd :class (bd type_sportacular type_sportacular_default)]
             ([BLOCK :tag DIV :x 1157.7 :y (/ 51653 30) :w 355.8 :h 281.5 :class (app pos-r cf app-scores app-tab app-tab-tabs list-big)]
              ([BLOCK :tag DIV :x 1168.7 :y (/ 51923 30) :w 333.8 :h 261.5 :class (app-wrapper)]
               ([BLOCK :tag H2 :x 1168.7 :y (/ 51923 30) :w 333.8 :h 22.5 :class (fz-xl app-heading mb-s)]
                ([LINE]
                 ([TEXT :x 1168.7 :y (/ 51901 30) :w 61 :h 24])
                 ([INLINE :tag B :class (fz-xs)]
                  ([INLINE :tag A]
                   ([TEXT :x 1229.7 :y (/ 52051 30) :w 79 :h 17])))))
               ([BLOCK :tag DIV :x 1157.7 :y 1848.125 :w 355.45 :h 21 :class (tab-tabs tab-wrapper tab-tabs-loaded)]
                ([BLOCK :tag DIV :x 1169.7 :y 1849 :w 331.45 :h 0 :class (wrapper)]
                 ([BLOCK :tag H3 :x 1169.7 :y 1849 :w 22 :h 20 :class (app-sub-heading tab mr-l pb-xs fz-xxs live on selected fw-b loaded)]
                  ([LINE]
                   ([TEXT :x 1169.7 :y (/ 59363 30) :w 22 :h 15])))
                 ([BLOCK :tag H3 :x 1211.7 :y 1849 :w 37 :h 20 :class (app-sub-heading tab mr-l pb-xs fz-xxs results  loaded)]
                  ([LINE]
                   ([TEXT :x 1211.7 :y (/ 59363 30) :w 37 :h 15])))
                 ([BLOCK :tag H3 :x 1268.7 :y 1849 :w 54 :h 20 :class (app-sub-heading tab mr-l pb-xs fz-xxs coming-up  loaded)]
                  ([LINE]
                   ([TEXT :x 1268.7 :y (/ 59363 30) :w 54 :h 15])))
                 ([BLOCK :tag H3 :x 1342.7 :y 1849 :w 52 :h 20 :class (app-sub-heading tab mr-l pb-xs fz-xxs my-teams  loaded)]
                  ([LINE]
                   ([TEXT :x 1342.7 :y (/ 59363 30) :w 52 :h 15])))))
               ([BLOCK :tag DIV :x 1168.7 :y 1653.125 :w 333.8 :h 170 :class (panel cf   live show-panel)]
                ([BLOCK :tag DIV :x 1168.7 :y 1653.125 :w 333.8 :h 34 :class (gameWrapper va-m d-ib-wrap game1 inprogress)]
                 ([MAGIC :tag H4 :x 1168.7 :y (/ 21257 12) :w (/ 751 15) :h 16.25 :mt 0 :mr 0 :mb 0 :ml 0 :class (fz-xs d-ib va-m)])
                 ([MAGIC :tag UL :x (/ 36563 30) :y 1653.125 :w 266 :h 32.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (ov-h d-ib d-ib-wrap va-m imagesOn)])
                 ([TEXT :x (/ 45075 30) :y (/ 53101 30) :w (/ 84 15) :h 17]))
                ([BLOCK :tag DIV :x 1168.7 :y 1685 :w 333.8 :h 41 :class (gameWrapper va-m d-ib-wrap game2 inprogress)]
                 ([MAGIC :tag H4 :x 1168.7 :y (/ 21725 12) :w (/ 751 15) :h 16.25 :mt 0 :mr 0 :mb 0 :ml 0 :class (fz-xs d-ib va-m)])
                 ([MAGIC :tag UL :x (/ 36563 30) :y 1689.625 :w 266 :h 32.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (ov-h d-ib d-ib-wrap va-m imagesOn)])
                 ([TEXT :x (/ 45075 30) :y (/ 54271 30) :w (/ 84 15) :h 17]))
                ([BLOCK :tag DIV :x 1168.7 :y 1723.375 :w 333.8 :h 41 :class (gameWrapper va-m d-ib-wrap game3 inprogress)]
                 ([MAGIC :tag H4 :x 1168.7 :y (/ 22217 12) :w (/ 751 15) :h 16.25 :mt 0 :mr 0 :mb 0 :ml 0 :class (fz-xs d-ib va-m)])
                 ([MAGIC :tag UL :x (/ 36563 30) :y 1728.125 :w 266 :h 32.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (ov-h d-ib d-ib-wrap va-m imagesOn)])
                 ([TEXT :x (/ 45075 30) :y (/ 55501 30) :w (/ 84 15) :h 17]))
                ([BLOCK :tag DIV :x 1168.7 :y 1761.875 :w 333.8 :h 41 :class (gameWrapper va-m d-ib-wrap game4 inprogress)]
                 ([MAGIC :tag H4 :x 1168.7 :y (/ 22709 12) :w (/ 751 15) :h 16.25 :mt 0 :mr 0 :mb 0 :ml 0 :class (fz-xs d-ib va-m)])
                 ([MAGIC :tag UL :x (/ 36563 30) :y 1766.5 :w 266 :h 32.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (ov-h d-ib d-ib-wrap va-m imagesOn)])
                 ([TEXT :x (/ 45075 30) :y (/ 56731 30) :w (/ 84 15) :h 17])))
               ([BLOCK :tag FORM :x 1168.7 :y 1803.125 :w 333.8 :h 23 :class (sports-form w-100)]
                ([BLOCK :tag LABEL :x 1168.7 :y 1803.125 :w 1 :h 1 :class (vh)]
                 ([LINE]
                  ([TEXT :x 1168.7 :y (/ 5768 3) :w 21 :h 15]))
                 ([LINE]
                  ([TEXT :x 1168.7 :y (/ 23237 12) :w 24 :h 15])))
                ([BLOCK :tag I :x 1173.7 :y 1812.5 :w 14 :h 14 :class (fl-l img-sprite app-search-icon)])
                ([ANON]
                 ([LINE]
                  ([INLINE :tag INPUT :id sportsSearch :class (sports-input p-xs mt-xs mb-xs fz-xs w-100 sports-input-inactive)])))
                ([BLOCK :tag INPUT :x 1502.5 :y 1803.125 :w 1 :h 1 :class (quotes-btn vh rapidnofollow)]))
               ([BLOCK :tag DIV :x 1493.5 :y (/ 51923 30) :w 24 :h 23 :class (app-ctas z-1 v-h)]
                ([MAGIC :tag A :x 1494.5 :y (/ 51923 30) :w 23 :h 23 :mt 0 :mr 0 :mb 0 :ml 1 :class (cta rapidnofollow remove-cta img-sprite halt d-ib)]))))))
           ([BLOCK :tag DIV :x 1157.7 :y 1896.875 :w 355.8 :h 211.75 :id default-p_30345818 :class (mod view_default)]
            ([BLOCK :tag DIV :x 1157.7 :y 1896.875 :w 355.8 :h 211.75 :id default-p_30345818-bd :class (bd type_flickr type_flickr_default)]
             ([BLOCK :tag DIV :x 1157.7 :y 1896.875 :w 355.8 :h 211.75 :class (app pos-r cf app-flickr)]
              ([BLOCK :tag DIV :x 1168.7 :y 1905.25 :w 333.8 :h 191.75 :class (app-wrapper)]
               ([BLOCK :tag H2 :x 1168.7 :y 1905.25 :w 333.8 :h 22.5 :class (fz-xl app-heading mb-s)]
                ([LINE]
                 ([INLINE :tag A :class (no-link-color)]
                  ([INLINE :tag B]
                   ([TEXT :x 1168.7 :y (/ 30473 15) :w 43 :h 24]))
                  ([TEXT :x 1211.7 :y (/ 30473 15) :w 5 :h 24])
                  ([INLINE :tag IMG :class (lzbg) :id e10005]))))
               ([BLOCK :tag H3 :x 1168.7 :y (/ 61944 30) :w 333.8 :h 18.75 :class (app-sub-heading fz-s mb-s)]
                ([LINE]
                 ([TEXT :x 1168.7 :y (/ 12385 6) :w 188 :h 20])
                 ([INLINE :tag A]
                  ([TEXT :x 1356.7 :y (/ 12385 6) :w 50 :h 20]))))
               ([BLOCK :tag UL :x 1163.7 :y (/ 31403 15) :w 338.8 :h 130.5 :class (app-items mt-s cf)]
                ([MAGIC :tag LI :x 1163.7 :y (/ 31403 15) :w 67.75 :h 62.75 :mt 0 :mr 0 :mb 0 :ml 0])
                ([MAGIC :tag LI :x 1231.45 :y (/ 31403 15) :w 67.75 :h 62.75 :mt 0 :mr 0 :mb 0 :ml 0])
                ([MAGIC :tag LI :x 1299.2 :y (/ 31403 15) :w 67.75 :h 62.75 :mt 0 :mr 0 :mb 0 :ml 0])
                ([MAGIC :tag LI :x 1366.95 :y (/ 31403 15) :w 67.75 :h 62.75 :mt 0 :mr 0 :mb 0 :ml 0])
                ([MAGIC :tag LI :x 1434.7 :y (/ 31403 15) :w 67.75 :h 62.75 :mt 0 :mr 0 :mb 0 :ml 0])
                ([MAGIC :tag LI :x 1163.7 :y 2021.5 :w 67.75 :h 67.75 :mt 0 :mr 0 :mb 0 :ml 0])
                ([MAGIC :tag LI :x 1231.45 :y 2021.5 :w 67.75 :h 67.75 :mt 0 :mr 0 :mb 0 :ml 0])
                ([MAGIC :tag LI :x 1299.2 :y 2021.5 :w 67.75 :h 67.75 :mt 0 :mr 0 :mb 0 :ml 0])
                ([MAGIC :tag LI :x 1366.95 :y 2021.5 :w 67.75 :h 67.75 :mt 0 :mr 0 :mb 0 :ml 0])
                ([MAGIC :tag LI :x 1434.7 :y 2021.5 :w 67.75 :h 67.75 :mt 0 :mr 0 :mb 0 :ml 0]))
               ([BLOCK :tag DIV :x 1493.5 :y 1905.25 :w 24 :h 23 :class (app-ctas z-1 v-h)]
                ([MAGIC :tag A :x 1494.5 :y 1905.25 :w 23 :h 23 :mt 0 :mr 0 :mb 0 :ml 1 :class (cta rapidnofollow remove-cta img-sprite halt d-ib)]))))))
           ([BLOCK :tag DIV :x 1157.7 :y (/ 67651 30) :w 355.8 :h (/ 7643 15) :id default-p_30345835 :class (mod view_default)]
            ([BLOCK :tag DIV :x 1157.7 :y (/ 67651 30) :w 355.8 :h (/ 7643 15) :id default-p_30345835-bd :class (bd type_topvideos type_topvideos_default)]
             ([BLOCK :tag DIV :x 1157.7 :y (/ 67651 30) :w 355.8 :h (/ 7643 15) :class (app pos-r cf app-featured videos grid)]
              ([BLOCK :tag DIV :x 1168.7 :y (/ 67921 30) :w 333.8 :h (/ 7343 15) :class (app-wrapper)]
               ([BLOCK :tag H2 :x 1168.7 :y (/ 67921 30) :w 333.8 :h 22.5 :class (fz-xl app-heading mb-s)]
                ([LINE]
                 ([TEXT :x 1168.7 :y 2121.875 :w 137 :h 24])
                 ([INLINE :tag B :class (fz-xs)]
                  ([INLINE :tag A]
                   ([TEXT :x 1305.7 :y 2126.5 :w 82 :h 17])))))
               ([BLOCK :tag UL :x 1160.7 :y (/ 34328 15) :w 341.8 :h (/ 12721 30) :class (video-list)]
                ([MAGIC :tag LI :x 1160.7 :y (/ 34328 15) :w 170.9 :h 208.4 :mt 0 :mr 0 :mb 0 :ml 0 :class (video-unit )])
                ([MAGIC :tag LI :x 1331.6 :y (/ 34328 15) :w 170.9 :h 208.4 :mt 0 :mr 0 :mb 0 :ml 0 :class (video-unit )])
                ([MAGIC :tag LI :x 1160.7 :y 2500.55 :w 170.9 :h 208.4 :mt 0 :mr 0 :mb 0 :ml 0 :class (video-unit )])
                ([MAGIC :tag LI :x 1331.6 :y 2500.55 :w 170.9 :h 208.4 :mt 0 :mr 0 :mb 0 :ml 0 :class (video-unit )]))
               ([BLOCK :tag FORM :x 1168.7 :y (/ 81527 30) :w 333.8 :h 36 :class (videos-form w-100 pos-r)]
                ([BLOCK :tag LABEL :x 1168.7 :y (/ 81527 30) :w 1 :h 1 :class (vh)]
                 ([LINE]
                  ([TEXT :x 1168.7 :y 2716.95 :w 35 :h 15]))
                 ([LINE]
                  ([TEXT :x 1168.7 :y 2730.7 :w 32 :h 15])))
                ([BLOCK :tag I :x 1173.7 :y (/ 81827 30) :w 14 :h 14 :class (fl-l img-sprite app-search-icon)])
                ([ANON]
                 ([LINE]
                  ([INLINE :tag INPUT :class (videos-input p-xs pt-s mt-xs fz-xs w-100 videos-input-inactive)])))
                ([BLOCK :tag INPUT :x 1168.7 :y (/ 82607 30) :w 1 :h 1 :class (videos-btn vh rapidnofollow)]))
               ([BLOCK :tag DIV :x 1493.5 :y (/ 67921 30) :w 24 :h 23 :class (app-ctas z-1 v-h)]
                ([MAGIC :tag A :x 1494.5 :y (/ 67921 30) :w 23 :h 23 :mt 0 :mr 0 :mb 0 :ml 1 :class (cta rapidnofollow remove-cta img-sprite halt d-ib)]))))))
           ([BLOCK :tag DIV :x 1157.7 :y (/ 83537 30) :w 355.8 :h 173.9 :id default-p_30345990 :class (mod view_default)]
            ([BLOCK :tag DIV :x 1157.7 :y (/ 83537 30) :w 355.8 :h 173.9 :id default-p_30345990-bd :class (bd type_games type_games_default)]
             ([BLOCK :tag DIV :x 1157.7 :y (/ 83537 30) :w 355.8 :h 173.9 :class (app pos-r cf app-games app-tab app-tab-menu)]
              ([BLOCK :tag DIV :x 1168.7 :y (/ 83807 30) :w 333.8 :h 153.9 :class (app-wrapper)]
               ([BLOCK :tag H2 :x 1168.7 :y (/ 83807 30) :w 333.8 :h 22.5 :class (fz-xl app-heading mb-s)]
                ([LINE]
                 ([TEXT :x 1168.7 :y (/ 33514 12) :w 185 :h 24])))
               ([BLOCK :tag DIV :x 1168.7 :y (/ 42391 15) :w 333.8 :h (/ 1577 15) :class (y-tabpanels)]
                ([BLOCK :tag DIV :x 1168.7 :y (/ 42391 15) :w 333.8 :h (/ 1577 15) :class (tabpanel selected recommended)]
                 ([BLOCK :tag UL :x 1168.7 :y (/ 42391 15) :w 333.8 :h (/ 1577 15) :class (recommended games-list pt-xs)]
                  ([MAGIC :tag LI :x 1168.7 :y (/ 42466 15) :w (/ 1502 15) :h (/ 1502 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (game-item first d-ib v-at ov-h)])
                  ([TEXT :x (/ 7613 6) :y 2830.7 :w 4 :h 17])
                  ([MAGIC :tag LI :x (/ 7637 6) :y (/ 42466 15) :w (/ 1622 15) :h (/ 1502 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (game-item  d-ib v-at ov-h)])
                  ([TEXT :x (/ 41429 30) :y 2830.7 :w 4 :h 17])
                  ([MAGIC :tag LI :x (/ 41549 30) :y (/ 42466 15) :w (/ 1622 15) :h (/ 1502 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (game-item  d-ib v-at ov-h)]))))
               ([ANON]
                ([LINE]
                 ([INLINE :tag A :class (more-games-link)]
                  ([TEXT :x 1168.7 :y (/ 17585 6) :w 86 :h 17]))))
               ([BLOCK :tag DIV :x 1493.5 :y (/ 83807 30) :w 24 :h 23 :class (app-ctas z-1 v-h)]
                ([MAGIC :tag A :x 1494.5 :y (/ 83807 30) :w 23 :h 23 :mt 0 :mr 0 :mb 0 :ml 1 :class (cta rapidnofollow remove-cta img-sprite halt d-ib)]))))))
           ([BLOCK :tag DIV :x 1157.7 :y 2978.45 :w 355.8 :h 234 :id default-p_30346013 :class (mod view_default)]
            ([BLOCK :tag DIV :x 1157.7 :y 2978.45 :w 355.8 :h 234 :id default-p_30346013-bd :class (bd type_dailyfantasy type_dailyfantasy_default)]
             ([BLOCK :tag DIV :x 1157.7 :y 2978.45 :w 355.8 :h 234 :class (app pos-r cf app-dailyfantasy)]
              ([BLOCK :tag DIV :x 1168.7 :y 2987.45 :w 333.8 :h 214 :class (app-wrapper)]
               ([BLOCK :tag H2 :x 1168.7 :y 2987.45 :w 333.8 :h 22.5 :class (fz-xl app-heading mb-s df_header)]
                ([LINE]
                 ([TEXT :x 1168.7 :y 2986.7 :w 223 :h 24])))
               ([BLOCK :tag DIV :x 1158.7 :y 3014.95 :w 353.8 :h 28.25 :id df_countdown :class (df_countdown pb-s pl-s fz-xs)]
                ([LINE]
                 ([TEXT :x 1168.7 :y (/ 36175 12) :w 137 :h 17])
                 ([INLINE :tag SPAN :id df_clock]
                  ([TEXT :x 1305.7 :y (/ 36175 12) :w 50 :h 17]))))
               ([BLOCK :tag UL :x 1168.7 :y 3043.2 :w 333.8 :h 132 :class (df_contests)]
                ([MAGIC :tag LI :x 1158.7 :y 3043.2 :w 353.8 :h 44 :mt 0 :mr -10 :mb 0 :ml -10 :class (fz-xs va-m df_contest_row)])
                ([MAGIC :tag LI :x 1158.7 :y 3087.2 :w 353.8 :h 44 :mt 0 :mr -10 :mb 0 :ml -10 :class (fz-xs va-m df_contest_row)])
                ([MAGIC :tag LI :x 1158.7 :y 3131.2 :w 353.8 :h 44 :mt 0 :mr -10 :mb 0 :ml -10 :class (fz-xs va-m df_contest_row)]))
               ([BLOCK :tag DIV :x 1158.7 :y 3175.2 :w 353.8 :h 26.25 :class (df_more ta-c pt-s)]
                ([LINE]
                 ([INLINE :tag A]
                  ([TEXT :x 1272.1 :y (/ 19109 6) :w 127 :h 17]))))
               ([BLOCK :tag DIV :x 1493.5 :y 2987.45 :w 24 :h 23 :class (app-ctas z-1 v-h)]
                ([MAGIC :tag A :x 1494.5 :y 2987.45 :w 23 :h 23 :mt 0 :mr 0 :mb 0 :ml 1 :class (cta rapidnofollow remove-cta img-sprite halt d-ib)]))))))
           ([BLOCK :tag DIV :x 1157.7 :y 3232.45 :w 355.8 :h 279.25 :id default-p_63802 :class (mod view_default)]
            ([BLOCK :tag DIV :x 1157.7 :y 3232.45 :w 355.8 :h 279.25 :id default-p_63802-bd :class (bd type_horoscope type_horoscope_default)]
             ([BLOCK :tag DIV :x 1157.7 :y 3232.45 :w 355.8 :h 279.25 :class (app pos-r cf app-horoscopes)]
              ([BLOCK :tag DIV :x 1168.7 :y 3241.45 :w 333.8 :h 259.25 :class (app-wrapper)]
               ([BLOCK :tag H2 :x 1168.7 :y 3241.45 :w 333.8 :h 22.5 :class (fz-xl app-heading mb-s)]
                ([LINE]
                 ([TEXT :x 1168.7 :y 3240.7 :w 101 :h 24])
                 ([INLINE :tag B :class (fz-xs)]
                  ([INLINE :tag A]
                   ([TEXT :x 1269.7 :y 3245.7 :w 92 :h 17])))))
               ([MAGIC :tag UL :x 1168.7 :y 3273.95 :w 333.8 :h 226.75 :mt 0 :mr 0 :mb 0 :ml 0 :class (horoscope-signs d-ib w-100 fz-xs)])
               ([BLOCK :tag DIV :x 1493.5 :y 3241.45 :w 24 :h 23 :class (app-ctas z-1 v-h)]
                ([MAGIC :tag A :x 1494.5 :y 3241.45 :w 23 :h 23 :mt 0 :mr 0 :mb 0 :ml 1 :class (cta rapidnofollow remove-cta img-sprite halt d-ib)]))))))
           ([BLOCK :tag DIV :x 1157.7 :y 3531.7 :w 355.8 :h 407.55 :id default-p_30345876 :class (mod view_default)]
            ([BLOCK :tag DIV :x 1157.7 :y 3531.7 :w 355.8 :h 407.55 :id default-p_30345876-bd :class (bd type_comics type_comics_default)]
             ([BLOCK :tag DIV :x 1157.7 :y 3531.7 :w 355.8 :h 407.55 :class (app pos-r cf app-comics app-tab app-tab-menu)]
              ([BLOCK :tag DIV :x 1168.7 :y 3540.7 :w 333.8 :h 387.55 :class (app-wrapper)]
               ([BLOCK :tag H2 :x 1168.7 :y 3540.7 :w 333.8 :h 22.5 :class (fz-xl app-heading mb-s)]
                ([LINE]
                 ([TEXT :x 1168.7 :y 3539.95 :w 60 :h 24])))
               ([BLOCK :tag UL :x 1342.5 :y 3540.7 :w 130 :h (/ 448 15) :id yui_3_8_1_1_1446778050697_386 :class (collapsed y-tablist vertical)]
                ([BLOCK :tag LI :x 1343.5 :y 3541.7 :w 128 :h (/ 418 15) :id yui_3_8_1_1_1446778050697_389 :class (selected loaded)]
                 ([MAGIC :tag I :x 1347.5 :y 3554.45 :w 5 :h 8 :mt 0 :mr 5 :mb 0 :ml 0 :class (img-sprite selected-icon)])
                 ([MAGIC :tag A :x 1357.5 :y 3545.7 :w 96 :h 16.25 :mt 0 :mr 0 :mb 0 :ml 0 :class (rapidnofollow ell)])
                 ([BLOCK :tag I :x 1456.5 :y 3550.7 :w 9 :h 6 :class (img-sprite dd-icon dda ddmenu)])))
               ([BLOCK :tag DIV :x 1168.7 :y 3573.2 :w 333.8 :h 355.05 :class (comics-wrapper pos-r)]
                ([BLOCK :tag DIV :x 1168.7 :y 3573.2 :w 333.8 :h 355.05 :class (y-tabpanels)]
                 ([BLOCK :tag DIV :x 1168.7 :y 3573.2 :w 333.8 :h 355.05 :class (tabpanel cf dilbert selected)]
                  ([ANON]
                   ([LINE]
                    ([INLINE :tag A]
                     ([INLINE :tag IMG :class (comic magnify w-100 mb-xs lzbg) :id e10006]))))
                  ([BLOCK :tag A :x 1168.7 :y 3912 :w 333.8 :h 16.25 :class (d-b ta-r)]
                   ([LINE]
                    ([TEXT :x 1446.5 :y (/ 117349 30) :w 56 :h 17]))))))
               ([BLOCK :tag DIV :x 1493.5 :y 3540.7 :w 24 :h 23 :class (app-ctas z-1 v-h)]
                ([MAGIC :tag A :x 1494.5 :y 3540.7 :w 23 :h 23 :mt 0 :mr 0 :mb 0 :ml 1 :class (cta rapidnofollow remove-cta img-sprite halt d-ib)]))))))))
         ([BLOCK :tag DIV :x 1157.7 :y 3959.25 :w 355.8 :h 250 :id default-p_30345989 :class (mod view_default)]
          ([BLOCK :tag DIV :x 1157.7 :y 3959.25 :w 355.8 :h 250 :id default-p_30345989-bd :class (bd type_ads type_ads_default)]
           ([BLOCK :tag DIV :x 1157.7 :y 3959.25 :w 355.8 :h 250 :class (lrec2 lrec2-reserve)]
            ([BLOCK :tag DIV :x 1157.7 :y 3959.25 :w 355.8 :h 0 :id fp-adsLREC2]
             ([BLOCK :tag DIV :x 1157.7 :y 3959.25 :w 355.8 :h 0 :id fp-adsLREC2-iframe])))))
         ([BLOCK :tag DIV :x 1157.7 :y 4229.25 :w 355.8 :h 0 :id fpad2])
         ([BLOCK :tag DIV :x 1157.7 :y 4229.25 :w 355.8 :h 64.35 :id default-p_24803755 :class (mod view_default)]
          ([BLOCK :tag DIV :x 1169.7 :y 4229.25 :w 283.8 :h 64.35 :id default-p_24803755-bd :class (bd type_subfooter type_subfooter_default)]
           ([BLOCK :tag UL :x 1169.7 :y 4229.25 :w 283.8 :h 64.35 :class (fz-xxs dimmed)]
            ([MAGIC :tag LI :x 1169.7 :y 4229.25 :w 62 :h 13.75 :mt 0 :mr 22 :mb 7.7 :ml 0 :class (d-ib)])
            ([MAGIC :tag LI :x 1253.7 :y 4229.25 :w 32 :h 13.75 :mt 0 :mr 22 :mb 7.7 :ml 0 :class (d-ib)])
            ([MAGIC :tag LI :x 1307.7 :y 4229.25 :w 89 :h 13.75 :mt 0 :mr 22 :mb 7.7 :ml 0 :class (d-ib)])
            ([MAGIC :tag LI :x 1169.7 :y 4250.7 :w 46 :h 13.75 :mt 0 :mr 22 :mb 7.7 :ml 0 :class (d-ib)])
            ([MAGIC :tag LI :x 1237.7 :y 4250.7 :w 69 :h 13.75 :mt 0 :mr 22 :mb 7.7 :ml 0 :class (d-ib)])
            ([MAGIC :tag LI :x 1328.7 :y 4250.7 :w 40 :h 13.75 :mt 0 :mr 22 :mb 7.7 :ml 0 :class (d-ib)])
            ([MAGIC :tag LI :x 1390.7 :y 4250.7 :w 22 :h 13.75 :mt 0 :mr 22 :mb 7.7 :ml 0 :class (d-ib)])
            ([MAGIC :tag LI :x 1169.7 :y 4272.15 :w 49 :h 13.75 :mt 0 :mr 22 :mb 7.7 :ml 0 :class (d-ib)]))))
         ([BLOCK :tag DIV :x 1157.7 :y 4313.6 :w 355.8 :h 0 :id default-p_15014391 :class (mod view_default)]
          ([BLOCK :tag DIV :x 1157.7 :y 4313.6 :w 355.8 :h 0 :id default-p_15014391-bd :class (bd type_ads type_ads_default)]
           ([BLOCK :tag DIV :x 1157.7 :y 4313.6 :w 355.8 :h 0 :class (hdln2-fallback hdln2)])))
         ([BLOCK :tag DIV :x 1861 :y 4254.6 :w 46 :h 48 :class (back-to-top )]
          ([LINE]
           ([INLINE :tag SPAN :class (new-stories-notif fz-xs)]))))))
      ([BLOCK :tag DIV :x 542.5 :y 108 :w 595.2 :h 3455.7 :id hero-col :class (main-col1)]
       ([MAGIC :tag DIV :x 542.5 :y 108 :w 595.2 :h 3455.7 :mt 0 :mr 0 :mb 0 :ml 0 :id Main :class (hero-col-wrapper)]))))
    ([BLOCK :tag DIV :x 0 :y 4292.6 :w 1907 :h 0 :id y-footer])
    ([BLOCK :tag DIV :x 0 :y 4292.6 :w 1907 :h 0 :id y-subfooter])
    ([BLOCK :tag DIV :x 0 :y 4292.6 :w 1907 :h 0 :id y-assetcbottom]
     ([BLOCK :tag DIV :x 0 :y 4292.6 :w 1907 :h 0 :id default-p_30345988 :class (mod view_default)]
      ([BLOCK :tag DIV :x 0 :y 4292.6 :w 1907 :h 0 :id default-p_30345988-bd :class (bd type_assetcollector type_assetcollector_default)]
       ([BLOCK :tag DIV :x 0 :y 4292.6 :w 1907 :h 0 :id darla-assets]))))
    ([BLOCK :tag DIV :x 0 :y 4292.6 :w 1907 :h 0 :id y-width])
    ([BLOCK :tag DIV :x 0 :y 4292.6 :w 1907 :h 0 :id y-min-width]))))

(define-problem verify
  #:header header
  #:sheet doc-1
  #:documents doc-1)

