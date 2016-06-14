;; python get_bench.py --name alexa/baidu 'file:///home/pavpan/cassius/bench/alexa/baidu.html'

(define-header header
"")

;; From file:///home/pavpan/cassius/bench/alexa/baidu.html

(define-stylesheet doc-1
  ((and (tag body))
   #;[color rgb(51, 51, 51)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [padding-top (px 6)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [position relative]
   #;[min-width (px 900)])
  ((or (and (tag p)) (and (tag form)) (and (tag ol)) (and (tag ul)) (and (tag li)) (and (tag dl)) (and (tag dt)) (and (tag dd)) (and (tag h3)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside])
  ((and (tag input))
   [padding-top (px 0)]
   [padding-bottom (px 0)]
   [box-sizing border-box])
  ((or (and (tag table)) (and (tag img)))
   [border-top-width (px 0)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (class logo))
   [width (px 117)]
   [height (px 38)]
   #;[cursor pointer])
  ((and (class p1))
   #;[line-height (% 120)]
   [margin-left (px -16)])
  ((and (class p2))
   [width (% 100)]
   #;[line-height (% 120)]
   [margin-left (px -16)])
  ((and (class container_s))
   [width (px 1002)])
  ((and (class container_l))
   [width (px 1222)])
  ((and (id content_left))
   [width (px 636)]
   [float left]
   [padding-left (px 35)])
  ((and (id content_right))
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(225, 225, 225)]
   [float right])
  ((desc (and (class container_s)) (and (id content_right)))
   [width (px 271)])
  ((desc (and (class container_l)) (and (id content_right)))
   [width (px 434)])
  ((and (class content_none))
   [padding-left (px 35)])
  ((and (id u))
   #;[color rgb(153, 153, 153)]
   #;[white-space nowrap]
   [position absolute]
   [right (px 10)]
   [top (px 4)]
   #;[z-index 299])
  ((desc (and (id u)) (and (tag a)))
   #;[color rgb(0, 0, 204)]
   [margin-top (px 0)]
   [margin-right (px 5)]
   [margin-bottom (px 0)]
   [margin-left (px 5)])
  ((desc (and (id u)) (and (class reg)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id u)) (and (class last)))
   [margin-right (px 0)])
  ((desc (and (id u)) (and (class un)))
   #;[font-weight bold]
   [margin-right (px 5)])
  ((desc (and (id u)) (and (tag ul)))
   [width (% 100)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(155, 155, 155)]
   #;[border-right-color rgb(155, 155, 155)]
   #;[border-bottom-color rgb(155, 155, 155)]
   #;[border-left-color rgb(155, 155, 155)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((desc (and (id u)) (and (tag li)))
   [height (px 25)])
  ((desc (and (id u)) (and (tag li)) (and (tag a)))
   [width (% 100)]
   [height (px 25)]
   #;[line-height (px 25)]
   [display block]
   [text-align left]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-indent (px 6)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id u)) (and (tag li) (class nl)))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(235, 235, 235)])
  ((and (id user))
   [display inline-block])
  ((and (id user_center))
   [position relative]
   [display inline-block])
  ((desc (and (id user_center)) (and (class user_center_btn)))
   [margin-right (px 5)])
  ((and (class userMenu))
   [width (px 64)]
   [position absolute]
   [right (px 7)]
   [top (px 15)]
   [padding-top (px 4)]
   [display none])
  ((and (id head))
   [padding-left (px 35)]
   [margin-bottom (px 20)]
   [width (px 900)])
  ((and (class fm))
   #;[clear both]
   [position relative]
   #;[z-index 297])
  ((and (class s_nav))
   [height (px 45)])
  ((desc (and (class s_nav)) (and (class s_logo)))
   [margin-right (px 20)]
   [float left])
  ((desc (and (class s_nav)) (and (class s_logo)) (and (tag img)))
   [border-top-width (px 0)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [display block])
  ((and (class s_tab))
   #;[line-height (px 18)]
   [padding-top (px 20)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [float left])
  ((and (class s_ipt_wr))
   [width (px 536)]
   [height (px 30)]
   [display inline-block]
   [margin-right (px 5)]
   #;[background-position (px 0)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-top-color rgb(123, 123, 123)]
   #;[border-right-color rgb(182, 182, 182)]
   #;[border-bottom-color rgb(182, 182, 182)]
   #;[border-left-color rgb(123, 123, 123)]
   #;[vertical-align top])
  ((and (class s_ipt))
   [width (px 523)]
   [height (px 22)]
   #;[font-family arial]
   #;[font-style normal]
   #;[font-weight normal]
   #;[font-size (px 16)]
   #;[line-height (px 18)]
   #;[font-size-adjust none]
   #;[font-stretch normal]
   #;[font-feature-settings normal]
   #;[font-language-override normal]
   #;[font-kerning auto]
   #;[font-synthesis weight style]
   #;[font-variant-alternates normal]
   #;[font-variant-caps normal]
   #;[font-variant-east-asian normal]
   #;[font-variant-ligatures normal]
   #;[font-variant-numeric normal]
   #;[font-variant-position normal]
   [margin-top (px 5)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 7)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-top-width (px 0)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color])
  ((and (class s_btn))
   [width (px 95)]
   [height (px 32)]
   #;[font-size (px 14)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[background-color rgb(221, 221, 221)]
   #;[background-position (px 0)]
   [border-top-width (px 0)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[cursor pointer])
  ((and (class s_btn_wr))
   [width (px 97)]
   [height (px 34)]
   [display inline-block]
   #;[background-position -120px -48px]
   #;[z-index (px 0)]
   #;[vertical-align top])
  ((and (class sethf))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[font-size (px 14)])
  ((and (class set_h))
   [display none])
  ((and (class set_f))
   [display none])
  ((and (class shouji))
   [margin-left (px 19)])
  ((desc (and (id head)) (and (class bdsug)))
   [top (px 33)])
  ((desc (and (id search)) (and (tag form)))
   [position relative])
  ((desc (and (id search)) (and (tag form)) (and (class bdsug)))
   [bottom (px 33)])
  ((and (class bdsug))
   [display none]
   [position absolute]
   #;[z-index 1]
   [width (px 538)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(204, 204, 204)]
   #;[border-right-color rgb(204, 204, 204)]
   #;[border-bottom-color rgb(204, 204, 204)]
   #;[border-left-color rgb(204, 204, 204)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[box-shadow 1px 1px 3px rgb(237, 237, 237)])
  ((desc (and (class bdsug)) (and (tag li)))
   [width (px 522)]
   #;[color rgb(0, 0, 0)]
   #;[font-family arial]
   #;[font-style normal]
   #;[font-weight normal]
   #;[font-size (px 14)]
   #;[font-size-adjust none]
   #;[font-stretch normal]
   #;[font-feature-settings normal]
   #;[font-language-override normal]
   #;[font-kerning auto]
   #;[font-synthesis weight style]
   #;[font-variant-alternates normal]
   #;[font-variant-caps normal]
   #;[font-variant-east-asian normal]
   #;[font-variant-ligatures normal]
   #;[font-variant-numeric normal]
   #;[font-variant-position normal]
   #;[line-height (px 22)]
   [padding-top (px 0)]
   [padding-right (px 8)]
   [padding-bottom (px 0)]
   [padding-left (px 8)]
   [position relative]
   #;[cursor default])
  ((and (class bdsug-store-del))
   #;[font-size (px 12)]
   #;[color rgb(102, 102, 102)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line underline]
   #;[text-decoration-style solid]
   [position absolute]
   [right (px 8)]
   [top (px 0)]
   #;[cursor pointer]
   [display none])
  ((desc (and (class bdsug-s)) (and (class bdsug-store-del)))
   [display inline-block])
  ((and (class bdsug-ala))
   [display inline-block]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(230, 230, 230)])
  ((desc (and (class bdsug-ala)) (and (tag h3)))
   #;[line-height (px 14)]
   #;[background-color transparent]
   #;[background-image url("//www.baidu.com/img/sug_bd.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position left center]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [margin-top (px 8)]
   [margin-right (px 0)]
   [margin-bottom (px 5)]
   [margin-left (px 0)]
   #;[font-size (px 12)]
   #;[font-weight normal]
   #;[color rgb(123, 123, 123)]
   [padding-left (px 20)])
  ((desc (and (class bdsug-ala)) (and (tag p)))
   #;[font-size (px 14)]
   #;[font-weight bold]
   [padding-left (px 20)])
  ((desc (and (class bdsug)) (and (class bdsug-direct)))
   [width auto]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(241, 241, 241)])
  ((desc (and (class bdsug)) (and (class bdsug-direct)) (and (tag p)))
   #;[color rgb(0, 0, 204)]
   #;[font-weight bold]
   #;[line-height (px 34)]
   [padding-top (px 0)]
   [padding-right (px 8)]
   [padding-bottom (px 0)]
   [padding-left (px 8)]
   #;[cursor pointer]
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class bdsug)) (and (class bdsug-direct)) (and (tag p)) (and (tag img)))
   [width (px 16)]
   [height (px 16)]
   [margin-top (px 7)]
   [margin-right (px 6)]
   [margin-bottom (px 9)]
   [margin-left (px 0)]
   #;[vertical-align middle])
  ((desc (and (class bdsug)) (and (class bdsug-direct)) (and (tag p)) (and (tag span)))
   [margin-left (px 8)])
  ((desc (and (class bdsug)) (and (class bdsug-direct)) (and (tag p)) (and (tag i)))
   #;[font-size (px 12)]
   #;[line-height (% 100)]
   #;[font-style normal]
   #;[font-weight normal]
   #;[color rgb(255, 255, 255)]
   #;[background-color rgb(43, 153, 255)]
   [display inline]
   [text-align center]
   [padding-top (px 1)]
   [padding-right (px 5)]
   [padding-bottom (px 1)]
   [padding-left (px 5)]
   [margin-left (px 8)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class bdsug)) (and (class bdsug-pcDirect)))
   #;[color rgb(0, 0, 0)]
   #;[font-size (px 14)]
   #;[line-height (px 30)]
   [height (px 30)]
   #;[background-color rgb(248, 248, 248)])
  ((desc (and (class bdsug)) (and (class bdsug-pc-direct-tip)))
   [position absolute]
   [right (px 15)]
   [top (px 8)]
   [width (px 55)]
   [height (px 15)]
   [display block]
   #;[background-color transparent]
   #;[background-image url("http://s1.bdstatic.com/r/www/cache/static/global/img/pc_direct_ffda303e.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (class bdsug)) (and (class bdsug-pc-direct-tip-is)))
   [position absolute]
   [right (px 15)]
   [top (px 3)]
   [width (px 55)]
   [height (px 15)]
   [display block]
   #;[background-color transparent]
   #;[background-image url("http://s1.bdstatic.com/r/www/cache/static/global/img/pc_direct_ffda303e.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (class bdsug)) (and (class bdsug-newicon)))
   #;[color rgb(146, 146, 146)]
   #;[opacity 0.7]
   #;[font-size (px 12)]
   [display inline-block]
   #;[line-height (px 22)]
   #;[letter-spacing (px 2)])
  ((and (id tb_mr))
   #;[color rgb(0, 0, 204)]
   #;[cursor pointer]
   [position relative]
   #;[z-index 298])
  ((and (id page))
   #;[font-family arial]
   #;[font-style normal]
   #;[font-weight normal]
   #;[font-size (px 14)]
   #;[line-height normal]
   #;[font-size-adjust none]
   #;[font-stretch normal]
   #;[font-feature-settings normal]
   #;[font-language-override normal]
   #;[font-kerning auto]
   #;[font-synthesis weight style]
   #;[font-variant-alternates normal]
   #;[font-variant-caps normal]
   #;[font-variant-east-asian normal]
   #;[font-variant-ligatures normal]
   #;[font-variant-numeric normal]
   #;[font-variant-position normal]
   #;[white-space nowrap]
   [padding-left (px 35)])
  ((or (desc (and (id page)) (and (tag a))) (desc (and (id page)) (and (tag strong))))
   [display inline-block]
   #;[vertical-align text-bottom]
   [height (px 66)]
   [text-align center]
   #;[line-height (px 34)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-right (px 9)]
   #;[background-color white]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  (("#page .n:hover, #page a:hover .pc" (or))
   #;[background-color rgb(242, 248, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(51, 136, 255)]
   #;[border-right-color rgb(51, 136, 255)]
   #;[border-bottom-color rgb(51, 136, 255)]
   #;[border-left-color rgb(51, 136, 255)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((desc (and (id page)) (and (class n)))
   [height (px 34)]
   [padding-top (px 0)]
   [padding-right (px 18)]
   [padding-bottom (px 0)]
   [padding-left (px 18)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(225, 226, 227)]
   #;[border-right-color rgb(225, 226, 227)]
   #;[border-bottom-color rgb(225, 226, 227)]
   #;[border-left-color rgb(225, 226, 227)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((desc (and (id page)) (and (tag span)))
   [display block])
  ((desc (and (id page)) (and (class pc)))
   [width (px 34)]
   [height (px 34)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(225, 226, 227)]
   #;[border-right-color rgb(225, 226, 227)]
   #;[border-bottom-color rgb(225, 226, 227)]
   #;[border-left-color rgb(225, 226, 227)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[cursor pointer])
  ((desc (and (id page)) (and (class fk)))
   [width (px 24)]
   [height (px 24)]
   [margin-bottom (px 6)]
   [margin-left (px 6)]
   #;[cursor pointer])
  ((desc (and (id page)) (and (class fk)) (and (class c-icon-bear-pn)))
   [top (px -3)]
   [position relative])
  ((desc (and (id page)) (and (class fkd)) (and (class c-icon-bear-pn)))
   [top (px 3)]
   [position relative])
  ((desc (and (id page)) (and (class fk_cur)) (and (class c-icon-bear-p)))
   [top (px -2)]
   [position relative])
  ((desc (and (id page)) (and (tag strong)) (and (class pc)))
   [border-top-width (px 0)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [width (px 36)]
   [height (px 36)]
   #;[line-height (px 36)])
  ((desc (and (id page)) (and (class nums)))
   [display inline-block]
   #;[vertical-align text-bottom]
   [height (px 36)]
   #;[line-height (px 36)]
   [margin-left (px 10)])
  ((and (id rs))
   [width (px 900)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [padding-top (px 8)]
   [padding-right (px 0)]
   [padding-bottom (px 8)]
   [padding-left (px 0)]
   [margin-top (px 20)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 15)])
  ((desc (and (id rs)) (and (tag td)))
   [width (% 5)])
  ((desc (and (id rs)) (and (tag th)))
   #;[font-size (px 14)]
   #;[font-weight normal]
   #;[line-height (px 19)]
   #;[white-space nowrap]
   [text-align left]
   #;[vertical-align top])
  ((desc (and (id rs)) (and (class tt)))
   #;[font-weight bold]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 20)])
  ((and (id rs_top))
   #;[font-size (px 14)]
   [margin-bottom (px 22)])
  ((desc (and (id rs_top)) (and (tag a)))
   [margin-right (px 18)])
  ((desc (and (id container)) (and (class rs)))
   [margin-top (px 30)]
   [margin-right (px 0)]
   [margin-bottom (px 20)]
   [margin-left (px 0)]
   [padding-top (px 5)]
   [padding-right (px 0)]
   [padding-bottom (px 15)]
   #;[font-size (px 14)]
   [width (px 540)]
   [padding-left (px 121)]
   [position relative]
   #;[background-color rgb(250, 250, 250)])
  ((desc (and (id content_left)) (and (class rs)))
   [margin-left (px -121)])
  ((desc (and (id container)) (and (class rs)) (and (tag table)))
   [width (px 540)])
  ((desc (and (id container)) (and (class rs)) (and (tag td)))
   [width (px 5)])
  ((desc (and (id container)) (and (class rs)) (and (tag th)))
   #;[font-size (px 14)]
   #;[font-weight normal]
   #;[white-space nowrap]
   [text-align left]
   #;[vertical-align top]
   [width (px 175)]
   #;[line-height (px 22)])
  ((desc (and (id container)) (and (class rs)) (and (class tt)))
   #;[font-weight bold]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[line-height (px 30)]
   #;[font-size (px 16)])
  ((desc (and (id container)) (and (class rs)) (and (tag a)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [height (px 24)]
   [width (px 173)]
   [display inline-block]
   #;[line-height (px 25)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(235, 235, 235)]
   #;[border-right-color rgb(235, 235, 235)]
   #;[border-bottom-color rgb(235, 235, 235)]
   #;[border-left-color rgb(235, 235, 235)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [text-align center]
   #;[vertical-align middle]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   #;[color rgb(51, 51, 51)]
   #;[background-color rgb(255, 255, 255)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid])
  ((desc (and (class c-tip-con)) (and (class c-tip-menu-b)) (and (tag ul)))
   [width (px 100)])
  ((desc (and (class c-tip-con)) (and (class c-tip-menu-b)) (and (tag ul)))
   [text-align center])
  ((desc (and (class c-tip-con)) (and (class c-tip-menu-b)) (and (tag li)) (and (tag a)))
   [display block]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[cursor pointer]
   #;[background-color rgb(255, 255, 255)]
   [padding-top (px 3)]
   [padding-right (px 0)]
   [padding-bottom (px 3)]
   [padding-left (px 0)]
   #;[color rgb(102, 102, 102)])
  ((".c-tip-con .c-tip-menu-b li a:hover" (or))
   [display block]
   #;[background-color rgb(235, 235, 235)])
  ((and (id search))
   [width (px 900)]
   [padding-top (px 35)]
   [padding-right (px 0)]
   [padding-bottom (px 16)]
   [padding-left (px 35)])
  ((desc (and (id search)) (and (class s_help)))
   [position relative]
   [top (px 10)])
  ((and (id foot))
   [height (px 20)]
   #;[line-height (px 20)]
   #;[color rgb(119, 119, 204)]
   #;[background-color rgb(230, 230, 230)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [text-align center])
  ((and (class site_tip))
   #;[font-size (px 12)]
   [margin-bottom (px 20)])
  ((and (class site_tip_icon))
   [width (px 56)]
   [height (px 56)]
   #;[background-color transparent]
   #;[background-image url("//www.baidu.com/aladdin/img/tools/tools-3.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position -288px 0px]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((or (and (class to_zhidao)) (and (class to_tieba)) (and (class to_zhidao_bottom)))
   #;[font-size (px 16)]
   #;[line-height (px 24)]
   [margin-top (px 20)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 35)])
  ((desc (and (class to_tieba)) (and (class c-icon-tieba)))
   [float left])
  ((and (class f))
   #;[line-height (% 115)]
   #;[font-size (% 100)]
   [width 33.7em]
   #;[word-break break-all]
   #;[word-wrap break-word])
  ((and (class h))
   [margin-left (px 8)]
   [width (% 100)])
  ((and (class r))
   #;[word-break break-all]
   [width (px 238)])
  ((and (class t))
   #;[font-weight normal]
   #;[font-size medium]
   [margin-bottom (px 1)])
  ((and (class pl))
   [padding-left (px 3)]
   [height (px 8)]
   [padding-right (px 2)]
   #;[font-size (px 14)])
  ((and (class htb))
   [margin-bottom (px 5)])
  ((or (and (tag div) (class blog)) (and (tag div) (class bbs)))
   #;[color rgb(112, 112, 112)]
   [padding-top (px 2)]
   #;[font-size (px 13)])
  ((and (class result))
   [width (px 438.1)]
   #;[table-layout fixed])
  ((and (class tools))
   [position absolute]
   [top (px 10)]
   #;[white-space nowrap])
  ((and (id mHolder))
   [width (px 62)]
   [position relative]
   #;[z-index 296]
   [top (px -18)]
   [margin-left (px 9)]
   [margin-right (px -12)]
   [display none])
  ((and (id mCon))
   [height (px 18)]
   [position absolute]
   [top (px 3)]
   #;[cursor pointer]
   #;[line-height (px 18)])
  ((desc (and (class wrapper_l)) (and (id mCon)))
   [right (px 7)])
  ((desc (and (id mCon)) (and (tag span)))
   #;[color rgb(0, 0, 204)]
   #;[cursor default]
   [display block])
  ((desc (and (id mCon)) (and (class hw)))
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line underline]
   #;[text-decoration-style solid]
   #;[cursor pointer]
   [display inline-block])
  ((desc (and (id mCon)) (and (class pinyin)))
   [display inline-block])
  ((desc (and (id mCon)) (and (class c-icon-chevron-unfold2)))
   [margin-left (px 5)])
  ((and (id mMenu))
   [width (px 56)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(155, 155, 155)]
   #;[border-right-color rgb(155, 155, 155)]
   #;[border-bottom-color rgb(155, 155, 155)]
   #;[border-left-color rgb(155, 155, 155)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [position absolute]
   [right (px 7)]
   [top (px 23)]
   [display none]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (id mMenu)) (and (tag a)))
   [width (% 100)]
   [height (% 100)]
   #;[color rgb(0, 0, 204)]
   [display block]
   #;[line-height (px 22)]
   #;[text-indent (px 6)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid])
  ((desc (and (id mMenu)) (and (class ln)))
   [height (px 1)]
   #;[background-color rgb(235, 235, 235)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[font-size (px 1)]
   #;[line-height (px 1)]
   [margin-top (px -1)])
  ((and (class op_LAMP))
   #;[background-color transparent]
   #;[background-image url("/cache/global/img/aladdinIcon-1.0.gif")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[color rgb(119, 119, 204)]
   [display inline-block]
   #;[font-size (px 13)]
   [height (px 12)]
   [width (px 16)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid])
  ((and (class EC_mr15))
   [margin-left (px 0)])
  ((and (class pd15))
   [padding-left (px 0)])
  ((and (class map_1))
   [width 30em]
   #;[font-size (% 80)]
   #;[line-height (% 145)])
  ((and (class map_2))
   [width 25em]
   #;[font-size (% 80)]
   #;[line-height (% 145)])
  ((and (class favurl))
   #;[background-repeat no-repeat]
   #;[background-position (px 0)]
   [padding-left (px 20)])
  ((and (class dan_tip))
   #;[font-size (px 12)]
   [margin-top (px 4)])
  ((and (class hit_top))
   #;[line-height (px 18)]
   [margin-top (px 0)]
   [margin-right (px 15)]
   [margin-bottom (px 10)]
   [margin-left (px 0)]
   [width (px 516)])
  ((desc (and (class hit_top)) (and (class c-icon-bear)))
   [height (px 18)]
   [margin-right (px 4)])
  ((or (and (id rs_top_new)) (and (class hit_top_new)))
   [width (px 538)]
   #;[font-size (px 13)]
   #;[line-height 1.54]
   #;[word-wrap break-word]
   #;[word-break break-all]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 14)]
   [margin-left (px 0)])
  ((and (class zhannei-si))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 10)]
   [margin-left (px 121)])
  ((and (class zhannei-si-none))
   [margin-top (px 10)]
   [margin-right (px 0)]
   [margin-bottom (px -10)]
   [margin-left (px 121)])
  ((and (class zhannei-search))
   [margin-top (px 10)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 121)]
   #;[color rgb(153, 153, 153)]
   #;[font-size (px 14)])
  ((".c-clearfix::after" (or))
   #;[content "."]
   [display block]
   [height (px 0)]
   #;[clear both]
   #;[visibility hidden])
  ((and (class c-icons-outer))
   [overflow-x hidden]
   [overflow-y hidden]
   [display inline-block]
   #;[vertical-align bottom])
  ((and (class c-icons-inner))
   [margin-left (px -4)])
  ((or (desc (and (class c-container)) (and (tag table) (class result))) (desc (and (class c-container)) (and (tag table) (class result-op))))
   [width (% 100)])
  ((desc (and (class c-container)) (and (tag td) (class f)))
   #;[font-size (px 13)]
   #;[line-height 1.54]
   [width auto])
  ((desc (and (class c-container)) (and (class vd_newest_main)))
   [width auto])
  ((and (class c-customicon))
   [display inline-block]
   [width (px 16)]
   [height (px 16)]
   #;[vertical-align text-bottom]
   #;[font-style normal]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class c-tip-icon)) (and (tag i)))
   [display inline-block]
   #;[cursor pointer])
  ((and (class c-tip-con))
   [position absolute]
   #;[z-index 1]
   [top (px 22)]
   [left (px -35)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgba(0, 0, 0, 0.2)]
   #;[border-right-color rgba(0, 0, 0, 0.2)]
   #;[border-bottom-color rgba(0, 0, 0, 0.2)]
   #;[border-left-color rgba(0, 0, 0, 0.2)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[transition-property opacity]
   #;[transition-duration 0.218s]
   #;[transition-timing-function ease]
   #;[transition-delay (px 0)]
   #;[box-shadow (px 0)]
   [padding-top (px 5)]
   [padding-right (px 0)]
   [padding-bottom (px 5)]
   [padding-left (px 0)]
   [display none]
   #;[font-size (px 12)]
   #;[line-height (px 20)])
  ((and (class c-tip-arrow))
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   [display block]
   [position absolute]
   [top (px -16)])
  ((and (class c-tip-arrow-down))
   [top auto]
   [bottom (px 0)])
  ((or (desc (and (class c-tip-arrow)) (and (tag em))) (desc (and (class c-tip-arrow)) (and (tag ins))))
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   [display block]
   [position absolute]
   [border-top-width (px 8)]
   [border-right-width (px 8)]
   [border-bottom-width (px 8)]
   [border-left-width (px 8)]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-top-style dashed]
   [border-right-style dashed]
   [border-bottom-style solid]
   [border-left-style dashed])
  ((desc (and (class c-tip-arrow)) (and (tag ins)))
   #;[border-bottom-color rgb(255, 255, 255)]
   [top (px 2)])
  ((or (desc (and (class c-tip-arrow-down)) (and (tag em))) (desc (and (class c-tip-arrow-down)) (and (tag ins))))
   [border-top-style solid]
   [border-right-style dashed]
   [border-bottom-style dashed]
   [border-left-style dashed]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent])
  ((desc (and (class c-tip-arrow-down)) (and (tag ins)))
   #;[border-top-color rgb(255, 255, 255)]
   [top (px -2)])
  ((desc (and (class c-tip-con)) (and (class c-tip-title)))
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 10)]
   [display inline-block]
   [width (px 239)])
  ((desc (and (class c-tip-con)) (and (class c-tip-info)))
   #;[color rgb(102, 102, 102)]
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 1)]
   [margin-left (px 10)]
   [width (px 239)])
  ((desc (and (class c-tip-con)) (and (class c-tip-cer)))
   [width (px 370)]
   #;[color rgb(102, 102, 102)]
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 1)]
   [margin-left (px 10)])
  ((desc (and (class c-tip-con)) (and (class c-tip-title)))
   [width auto])
  ((desc (and (class c-tip-con)) (and (class c-tip-item-i)))
   [padding-top (px 3)]
   [padding-right (px 0)]
   [padding-bottom (px 3)]
   [padding-left (px 20)]
   #;[line-height (px 14)])
  ((desc (and (class c-tip-con)) (and (class c-tip-item-i)) (and (class c-tip-item-icon)))
   [margin-left (px -20)])
  ((desc (and (class c-tip-con)) (and (class c-tip-menu)) (and (tag ul)))
   [width (px 74)])
  ((desc (and (class c-tip-con)) (and (class c-tip-menu)) (and (tag ul)))
   [text-align center])
  ((desc (and (class c-tip-con)) (and (class c-tip-menu)) (and (tag li)) (and (tag a)))
   [display block]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[cursor pointer]
   #;[background-color rgb(255, 255, 255)]
   [padding-top (px 3)]
   [padding-right (px 0)]
   [padding-bottom (px 3)]
   [padding-left (px 0)]
   #;[color rgb(0, 0, 208)])
  ((".c-tip-con .c-tip-menu li a:hover" (or))
   [display block]
   #;[background-color rgb(235, 235, 235)])
  ((desc (and (class c-tip-con)) (and (class c-tip-notice)))
   [width (px 239)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)])
  ((and (class c-tip-close))
   [right (px 10)]
   [position absolute]
   #;[cursor pointer])
  ((and (class ecard))
   [height (px 86)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class c-tools))
   [display inline])
  ((and (class c-tools-share))
   [width (px 239)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)])
  ((and (class c-fanyi))
   [display none]
   [width (px 20)]
   [height (px 20)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(209, 209, 209)]
   #;[border-right-color rgb(209, 209, 209)]
   #;[border-bottom-color rgb(209, 209, 209)]
   #;[border-left-color rgb(209, 209, 209)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[cursor pointer]
   [position absolute]
   [margin-left (px 516)]
   [text-align center]
   #;[color rgb(51, 51, 51)]
   #;[line-height (px 22)]
   #;[opacity 0.9]
   #;[background-color rgb(255, 255, 255)])
  ((or (and (class c-fanyi-title)) (and (class c-fanyi-abstract)))
   [display none])
  ((and (class icp_info))
   #;[color rgb(102, 102, 102)]
   [margin-top (px 2)]
   #;[font-size (px 13)])
  ((or (and (class icon-gw)) (and (class icon-unsafe-icon)))
   #;[background-color rgb(44, 153, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[vertical-align text-bottom]
   [height (px 16)]
   [padding-top (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 6)]
   [padding-right (px 6)]
   #;[line-height (px 16)]
   #;[font-size (px 12)]
   #;[font-family simsun]
   [margin-left (px 10)]
   [overflow-x hidden]
   [overflow-y hidden]
   [display inline-block]
   #;[border-top-left-radius (px 1)]
   #;[border-top-right-radius (px 1)]
   #;[border-bottom-right-radius (px 1)]
   #;[border-bottom-left-radius (px 1)]
   #;[color rgb(255, 255, 255)])
  (("a.icon-gw:active" (or))
   [height (px 15)]
   #;[line-height (px 15)]
   [padding-left (px 5)]
   #;[background-color rgb(28, 128, 217)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(20, 89, 151)]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(20, 89, 151)])
  ((and (id con-at))
   [margin-bottom (px 11)]
   [padding-left (px 121)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(235, 235, 235)])
  ((desc (and (class wrapper_l)) (and (id con-at)) (and (class result-op)))
   [width (px 1058)])
  ((desc (and (class wrapper_s)) (and (id con-at)) (and (class result-op)))
   [width (px 869)])
  ((and (id con-ar))
   [margin-bottom (px 40)])
  ((desc (and (id con-ar)) (and (class result-op)))
   [margin-bottom (px 28)]
   #;[font-size (px 13)]
   #;[line-height (px (/ 593 30))])
  ((and (class result_hidden))
   [position absolute]
   [top (px -10000)]
   [left (px -10000)])
  ((or (desc (and (id content_left)) (and (class result-op))) (desc (and (id content_left)) (and (class result))))
   [margin-bottom (px 14)]
   #;[border-collapse collapse])
  ((or (desc (and (id content_left)) (and (class c-border)) (and (class result-op))) (desc (and (id content_left)) (and (class c-border)) (and (class result))))
   [margin-bottom (px 25)])
  (("#content_left .c-border .result-op:last-child, #content_left .c-border .result:last-child" (or))
   [margin-bottom (px 12)])
  ((or (desc (and (id content_left)) (and (class result)) (and (class f))) (desc (and (id content_left)) (and (class result-op)) (and (class f))))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class subLink_factory)) (and (tag td)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class subLink_factory)) (and (tag td) (class rightTd)))
   [text-align right])
  ((and (class subLink_factory_right))
   [width (% 100)])
  ((desc (and (class subLink_factory_left)) (and (tag td)))
   [padding-right (px 26)])
  ((desc (and (class subLink_factory_left)) (and (tag td) (class last)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class subLink_factory_left)) (and (tag td) (class first)))
   [padding-right (px 75)])
  ((desc (and (class subLink_factory_right)) (and (tag td)))
   [width (px 90)])
  ((desc (and (class subLink_factory_right)) (and (tag td) (class first)))
   [width auto])
  ((desc (and (class general_image_pic)) (and (tag a)))
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position center center]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [display block]
   [overflow-x hidden]
   [overflow-y hidden]
   [text-align left])
  ((and (class res_top_banner))
   [height (px 36)]
   [text-align left]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(227, 227, 227)]
   #;[background-color rgb(247, 247, 247)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[font-size (px 13)]
   [padding-left (px 8)]
   #;[color rgb(51, 51, 51)]
   [position relative]
   #;[z-index 302])
  ((desc (and (class res_top_banner)) (and (class res_top_banner_icon)))
   #;[background-position (px 0)]
   [width (px 18)]
   [height (px 18)]
   [margin-top (px 9)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class res_top_banner)) (and (class res_top_banner_icon_baiduapp)))
   #;[background-color transparent]
   #;[background-image url("http://s1.bdstatic.com/r/www/cache/static/global/img/baiduappLogo_7db5fd3c.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [width (px 24)]
   [height (px 24)]
   [margin-top (px 3)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [position relative]
   [top (px 3)])
  ((desc (and (class res_top_banner)) (and (class res_top_banner_icon_windows)))
   #;[background-color transparent]
   #;[background-image url("http://s1.bdstatic.com/r/www/cache/static/global/img/winlogo_c525f65f.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [width (px 18)]
   [height (px 18)]
   [margin-top (px 9)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class res_top_banner)) (and (class res_top_banner_download)))
   [display inline-block]
   [width (px 65)]
   #;[line-height (px 21)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 10)]
   #;[color rgb(51, 51, 51)]
   #;[background-color rgb(251, 251, 251)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(180, 182, 184)]
   #;[border-right-color rgb(180, 182, 184)]
   #;[border-bottom-color rgb(180, 182, 184)]
   #;[border-left-color rgb(180, 182, 184)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [text-align center]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid])
  ((".res_top_banner .res_top_banner_download:hover" (or))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(51, 136, 255)]
   #;[border-right-color rgb(51, 136, 255)]
   #;[border-bottom-color rgb(51, 136, 255)]
   #;[border-left-color rgb(51, 136, 255)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((".res_top_banner .res_top_banner_download:active" (or))
   #;[background-color rgb(240, 240, 240)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(180, 182, 184)]
   #;[border-right-color rgb(180, 182, 184)]
   #;[border-bottom-color rgb(180, 182, 184)]
   #;[border-left-color rgb(180, 182, 184)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((desc (and (class res_top_banner)) (and (class res_top_banner_close)))
   #;[background-position -672px -144px]
   #;[cursor pointer]
   [position absolute]
   [right (px 10)]
   [top (px 10)])
  ((and (class res_top_banner_for_win))
   [height (px 34)]
   [text-align left]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(240, 240, 240)]
   #;[background-color rgb(253, 253, 253)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[font-size (px 13)]
   [padding-left (px 12)]
   #;[color rgb(51, 51, 51)]
   [position relative]
   #;[z-index 302])
  ((desc (and (class res_top_banner_for_win)) (and (class res_top_banner_download)))
   [display inline-block]
   [width auto]
   #;[line-height (px 21)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 16)]
   #;[color rgb(51, 51, 51)]
   [text-align left]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line underline]
   #;[text-decoration-style solid])
  ((desc (and (class res_top_banner_for_win)) (and (class res_top_banner_icon_windows)))
   #;[background-color transparent]
   #;[background-image url("http://s1.bdstatic.com/r/www/cache/static/global/img/winlogo_c525f65f.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [width (px 18)]
   [height (px 18)]
   [margin-top (px 8)]
   [margin-right (px 8)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class res_top_banner_for_win)) (and (class res_top_banner_close)))
   #;[background-position -672px -144px]
   #;[cursor pointer]
   [position absolute]
   [right (px 10)]
   [top (px 10)])
  ((and (class res-gap-right16))
   [margin-right (px 16)])
  ((and (class res-border-top))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(243, 243, 243)])
  ((and (class res-border-bottom))
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(243, 243, 243)])
  ((and (class res-queryext-pos))
   [position relative]
   [top (px 1)])
  ((and (class c-trust-ecard))
   [height (px 86)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (id ftCon))
   [display none])
  ((and (id qrcode))
   [display none])
  ((and (id pad-version))
   [display none])
  ((and (id index_guide))
   [display none])
  ((and (id index_logo))
   [display none])
  ((and (id u1))
   [display none])
  ((and (class s_ipt_wr))
   [height (px 32)])
  ((and (tag body))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((".s_form::after, .s_tab::after" (or))
   #;[content "."]
   [display block]
   [height (px 0)]
   #;[clear both]
   #;[visibility hidden])
  ((and (class s_form))
   [height (px 55)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 10)])
  ((and (id result_logo))
   [float left]
   [margin-top (px 7)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id result_logo)) (and (tag img)))
   [width (px 101)])
  ((and (id head))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [width (% 100)]
   #;[z-index 301]
   #;[min-width (px 1000)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(235, 235, 235)]
   [position fixed])
  ((and (class fm))
   #;[clear none]
   [float left]
   [margin-top (px 11)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 10)])
  ((and (id s_tab))
   #;[background-color rgb(248, 248, 248)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[line-height (px 36)]
   [height (px 38)]
   [padding-top (px 55)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 121)]
   [float none])
  ((or (desc (and (id s_tab)) (and (tag a))) (desc (and (id s_tab)) (and (tag b))))
   [width (px 54)]
   [display inline-block]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [text-align center]
   #;[color rgb(102, 102, 102)]
   #;[font-size (px 14)])
  ((desc (and (id s_tab)) (and (tag b)))
   [border-bottom-width (px 2)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(51, 136, 255)]
   #;[font-weight bold]
   #;[color rgb(50, 50, 50)])
  ((and (id content_left))
   [width (px 540)]
   [padding-left (px 121)]
   [padding-top (px 5)])
  ((and (id content_right))
   [margin-top (px 45)])
  ((and (id content_bottom))
   [width (px 540)]
   [padding-left (px 121)])
  ((and (id page))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 121)]
   [margin-top (px 30)]
   [margin-right (px 0)]
   [margin-bottom (px 40)]
   [margin-left (px 0)])
  ((or (and (class to_tieba)) (and (class to_zhidao_bottom)))
   [margin-top (px 10)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 121)])
  ((and (class nums))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 121)]
   [height (px 42)]
   #;[line-height (px 42)])
  ((and (id rs))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 6)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 121)]
   [width (px 600)])
  ((desc (and (id rs)) (and (tag th)))
   [width (px 175)]
   #;[line-height (px 22)])
  ((desc (and (id rs)) (and (class tt)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[line-height (px 30)])
  ((desc (and (id rs)) (and (tag td)))
   [width (px 5)])
  ((desc (and (id rs)) (and (tag table)))
   [width (px 540)])
  ((and (id help))
   #;[background-color rgb(245, 246, 245)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 50)]
   [float right])
  ((desc (and (id help)) (and (tag a)))
   #;[color rgb(119, 119, 119)]
   [padding-top (px 0)]
   [padding-right (px 15)]
   [padding-bottom (px 0)]
   [padding-left (px 15)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid])
  ((and (id foot))
   #;[background-color rgb(245, 246, 245)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(235, 235, 235)]
   [text-align left]
   [height (px 42)]
   #;[line-height (px 42)]
   [margin-top (px 40)])
  ((desc (and (id foot)) (and (class foot_c)))
   [float left]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 121)])
  ((and (class content_none))
   [padding-top (px 45)]
   [padding-right (px 0)]
   [padding-bottom (px 25)]
   [padding-left (px 121)])
  ((desc (and (class nors)) (and (tag li)))
   #;[color rgb(51, 51, 51)]
   #;[line-height (px 28)]
   #;[font-size (px 13)]
   #;[font-family "宋体"]
   [padding-left (px 30)]
   #;[list-style-position inside]
   #;[list-style-type disc])
  ((and (id mCon))
   [top (px 5)])
  ((and (class s_btn_wr))
   [width auto]
   [height auto]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color transparent])
  ((and (class s_btn))
   [width (px 100)]
   [height (px 34)]
   #;[color white]
   #;[letter-spacing (px 1)]
   #;[background-color rgb(51, 133, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(45, 120, 244)]
   #;[outline-width medium]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color])
  ((and (class s_btn) (class btnhover))
   #;[background-color rgb(49, 126, 243)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(40, 104, 200)]
   #;[box-shadow 1px 1px 1px rgb(204, 204, 204)])
  ((or (desc (and (id wrapper_wrapper)) (and (class container_l)) (and (class EC_ppim_top))) (desc (and (id wrapper_wrapper)) (and (class container_xl)) (and (class EC_ppim_top))))
   [width (px 640)])
  ((desc (and (id wrapper_wrapper)) (and (class container_s)) (and (class EC_ppim_top)))
   [width (px 570)])
  ((desc (and (id head)) (and (class c-icon-bear-round)))
   [display none])
  ((desc (and (class container_l)) (and (id content_right)))
   [width (px 384)])
  ((and (class container_l))
   [width (px 1212)])
  ((desc (and (class container_xl)) (and (id content_right)))
   [width (px 384)])
  ((and (class container_xl))
   [width (px 1257)])
  ((and (class index_tab_top))
   [display none])
  ((and (class index_tab_bottom))
   [display none])
  ((and (id lg))
   [display none])
  ((and (id m))
   [display none])
  ((and (id ftCon))
   [display none])
  ((and (id ent_sug))
   [position absolute]
   [margin-top (px 141)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 130)]
   #;[font-size (px 13)]
   #;[color rgb(102, 102, 102)])
  ((and (class foot_fixed_bottom))
   [position fixed]
   [bottom (px 0)]
   [width (% 100)])
  ((desc (and (id head)) (and (class headBlock)))
   [margin-top (px -5)]
   [margin-right (px 0)]
   [margin-bottom (px 6)]
   [margin-left (px 121)])
  ((desc (and (id content_left)) (and (class leftBlock)))
   [margin-bottom (px 14)]
   [padding-bottom (px 5)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(243, 243, 243)])
  ((and (class hint_toprq_tips))
   [position relative]
   [width (px 537)]
   [height (px 19)]
   #;[line-height (px 19)]
   [overflow-x hidden]
   [overflow-y hidden]
   [display none])
  ((and (class hint_toprq_icon))
   [margin-top (px 0)]
   [margin-right (px 4)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (class hint_toprq_tips_items))
   [width (px 444)]
   #;[max-height (px 38)]
   [position absolute]
   [left (px 95)]
   [top (px 1)])
  ((desc (and (class hint_toprq_tips_items)) (and (tag div)))
   [display inline-block]
   [float left]
   [height (px 19)]
   [margin-right (px 18)]
   #;[white-space nowrap]
   #;[word-break keep-all])
  ((and (class translateContent))
   #;[max-width (px 350)]
   [width (px 350)])
  ((desc (and (class translateContent)) (and (class translateTool)))
   [height (px 16)]
   [margin-top (px -3)]
   [margin-right (px 2)]
   [margin-bottom (px -3)]
   [margin-left (px 2)])
  ((or (desc (and (class translateContent)) (and (class action-translate))) (desc (and (class translateContent)) (and (class action-search))))
   [display inline-block]
   [width (px 20)]
   [height (px 16)]
   #;[background-color transparent]
   #;[background-image url("http://s1.bdstatic.com/r/www/cache/static/global/img/translate_tool_icon_a480477c.gif")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (class translateContent)) (and (class action-translate)))
   #;[background-position (px 0)]
   [border-right-width (px 1)]
   [border-right-style solid]
   #;[border-right-color rgb(220, 220, 220)])
  ((and (class nums))
   [width (px 538)])
  ((and (class head_nums_cont_outer))
   [height (px 40)]
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative])
  ((and (class head_nums_cont_inner))
   [position relative])
  ((desc (and (class search_tool_conter)) (and (class c-gap-left)))
   [margin-left (px 23)])
  ((or (and (class search_tool)) (and (class search_tool_close)))
   [float right])
  ((and (class search_tool_conter))
   #;[font-size (px 12)]
   #;[color rgb(102, 102, 102)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 121)]
   [height (px 42)]
   [width (px 538)]
   #;[line-height (px 42)])
  ((desc (and (class c-tip-con)) (and (class c-tip-langfilter)) (and (tag ul)))
   [width (px 80)]
   [text-align left]
   #;[color rgb(102, 102, 102)])
  ((desc (and (class c-tip-con)) (and (class c-tip-langfilter)) (and (tag li)) (and (tag span)))
   #;[text-indent (px 15)]
   [padding-top (px 3)]
   [padding-right (px 0)]
   [padding-bottom (px 3)]
   [padding-left (px 0)]
   #;[color rgb(153, 153, 153)]
   [display block])
  ((desc (and (class c-tip-con)) (and (class c-tip-timerfilter)) (and (tag ul)))
   [width (px 115)]
   [text-align left]
   #;[color rgb(102, 102, 102)])
  ((desc (and (class c-tip-con)) (and (class c-tip-timerfilter-ft)) (and (tag ul)))
   [width (px 180)])
  ((desc (and (class c-tip-con)) (and (class c-tip-timerfilter-si)) (and (tag ul)))
   [width (px 206)]
   [padding-top (px 7)]
   [padding-right (px 10)]
   [padding-bottom (px 10)]
   [padding-left (px 10)])
  ((desc (and (class c-tip-con)) (and (class c-tip-timerfilter)) (and (tag li)) (and (tag span)))
   #;[text-indent (px 15)]
   [padding-top (px 3)]
   [padding-right (px 0)]
   [padding-bottom (px 3)]
   [padding-left (px 0)]
   #;[color rgb(153, 153, 153)]
   [display block])
  ((and (class c-tip-custom))
   [padding-top (px 0)]
   [padding-right (px 15)]
   [padding-bottom (px 10)]
   [padding-left (px 15)]
   [position relative])
  ((desc (and (class c-tip-custom)) (and (tag hr)))
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [height (px 0)]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(235, 235, 235)])
  ((desc (and (class c-tip-custom)) (and (tag p)))
   #;[color rgb(182, 182, 182)]
   [height (px 25)]
   #;[line-height (px 25)]
   [margin-top (px 2)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 0)])
  ((desc (and (class c-tip-custom)) (and (class c-tip-custom-et)))
   [margin-bottom (px 7)])
  ((or (and (class c-tip-custom-input)) (and (class c-tip-si-input)))
   [display inline-block]
   #;[font-size (px 11)]
   #;[color rgb(51, 51, 51)]
   [margin-left (px 4)]
   [padding-top (px 0)]
   [padding-right (px 2)]
   [padding-bottom (px 0)]
   [padding-left (px 2)]
   [width (% 74)]
   [height (px 16)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(235, 235, 235)]
   #;[border-right-color rgb(235, 235, 235)]
   #;[border-bottom-color rgb(235, 235, 235)]
   #;[border-left-color rgb(235, 235, 235)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   [box-sizing content-box]
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative])
  ((or (and (class c-tip-custom-input-focus)) (and (class c-tip-si-input-focus)))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(51, 133, 255)]
   #;[border-right-color rgb(51, 133, 255)]
   #;[border-bottom-color rgb(51, 133, 255)]
   #;[border-left-color rgb(51, 133, 255)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((desc (and (class c-tip-timerfilter-si)) (and (class c-tip-si-input)))
   [width (px 138)]
   [height (px 22)]
   #;[line-height (px 22)]
   #;[vertical-align (px 0)]
   [padding-top (px 0)]
   [padding-right (px 5)]
   [padding-bottom (px 0)]
   [padding-left (px 5)]
   [margin-left (px 0)])
  ((or (desc (and (class c-tip-con)) (and (class c-tip-timerfilter)) (and (tag li)) (and (class c-tip-custom-submit))) (desc (and (class c-tip-con)) (and (class c-tip-timerfilter)) (and (tag li)) (and (class c-tip-timerfilter-si-submit))))
   [display inline]
   [padding-top (px 4)]
   [padding-right (px 10)]
   [padding-bottom (px 4)]
   [padding-left (px 10)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[color rgb(51, 51, 51)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(216, 216, 216)]
   #;[border-right-color rgb(216, 216, 216)]
   #;[border-bottom-color rgb(216, 216, 216)]
   #;[border-left-color rgb(216, 216, 216)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[font-family inherit]
   #;[font-weight normal]
   [text-align center]
   #;[vertical-align (px 0)]
   #;[background-color rgb(249, 249, 249)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color])
  ((".c-tip-con .c-tip-timerfilter li .c-tip-custom-submit:hover, .c-tip-con .c-tip-timerfilter li .c-tip-timerfilter-si-submit:hover" (or))
   [display inline]
   #;[border-top-color rgb(56, 139, 255)]
   #;[border-right-color rgb(56, 139, 255)]
   #;[border-bottom-color rgb(56, 139, 255)]
   #;[border-left-color rgb(56, 139, 255)])
  ((or (and (class c-tip-timerfilter-si-error)) (and (class c-tip-timerfilter-custom-error)))
   [display none]
   #;[color rgb(51, 133, 255)]
   [padding-left (px 4)])
  ((and (class c-tip-timerfilter-custom-error))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px -5)]
   [margin-right (px -13)]
   [margin-bottom (px 7)]
   [margin-left (px 0)])
  ((and (id c-tip-custom-calenderCont))
   [position absolute]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[white-space nowrap]
   [padding-top (px 5)]
   [padding-right (px 10)]
   [padding-bottom (px 5)]
   [padding-left (px 10)]
   #;[color rgb(0, 0, 0)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(228, 228, 228)]
   #;[border-right-color rgb(228, 228, 228)]
   #;[border-bottom-color rgb(228, 228, 228)]
   #;[border-left-color rgb(228, 228, 228)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[box-shadow (px 0)])
  ((desc (and (id c-tip-custom-calenderCont)) (and (tag p)))
   [text-align center]
   [padding-top (px 2)]
   [padding-right (px 0)]
   [padding-bottom (px 4)]
   [padding-left (px 0)])
  ((desc (and (class op_cal)) (and (tag table)))
   #;[background-color rgb(238, 239, 234)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[border-collapse separate])
  ((or (and (class op_btn_pre_month)) (and (class op_btn_next_month)))
   #;[cursor pointer]
   [display block]
   [margin-top (px 6)])
  ((and (class op_btn_pre_month))
   [float left]
   #;[background-position (px 0)])
  ((and (class op_btn_next_month))
   [float right]
   #;[background-position -18px -46px])
  ((desc (and (class op_cal)) (and (class op_mon_pre1)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class op_mon)) (and (tag th)))
   [text-align center]
   #;[font-size (px 12)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[font-weight bold]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(255, 255, 255)]
   #;[border-right-color rgb(255, 255, 255)]
   #;[border-bottom-color rgb(255, 255, 255)]
   #;[border-left-color rgb(255, 255, 255)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class op_mon)) (and (tag td)))
   [text-align center]
   #;[cursor pointer])
  ((desc (and (class op_mon)) (and (tag h5)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 4)]
   [padding-bottom (px 0)]
   [padding-left (px 4)]
   [text-align center]
   #;[font-size (px 14)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [height (px 28)]
   #;[line-height (px 28)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(245, 245, 245)]
   [margin-bottom (px 5)])
  ((desc (and (class op_mon)) (and (tag td)))
   [padding-top (px 0)]
   [padding-right (px 5)]
   [padding-bottom (px 0)]
   [padding-left (px 5)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(255, 255, 255)]
   #;[border-right-color rgb(255, 255, 255)]
   #;[border-bottom-color rgb(255, 255, 255)]
   #;[border-left-color rgb(255, 255, 255)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[font-size (px 12)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [height (% 100)])
  ((desc (and (class op_mon)) (and (tag td) (class op_mon_day_hover)))
   #;[color rgb(0, 0, 0)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(39, 141, 242)]
   #;[border-right-color rgb(39, 141, 242)]
   #;[border-bottom-color rgb(39, 141, 242)]
   #;[border-left-color rgb(39, 141, 242)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((desc (and (class op_mon)) (and (tag td) (class op_mon_day_selected)))
   #;[color rgb(255, 255, 255)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(39, 141, 242)]
   #;[border-right-color rgb(39, 141, 242)]
   #;[border-bottom-color rgb(39, 141, 242)]
   #;[border-left-color rgb(39, 141, 242)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(39, 141, 242)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((or (and (class zhannei-si-none)) (and (class zhannei-si)) (and (class hit_quet)) (and (class zhannei-search)))
   [display none])
  ((and (class c-frame))
   [margin-bottom (px 18)])
  ((and (class c-offset))
   [padding-left (px 10)])
  ((and (class c-gap-top-small))
   [margin-top (px 5)])
  ((and (class c-gap-top))
   [margin-top (px 10)])
  ((and (class c-gap-bottom-small))
   [margin-bottom (px 5)])
  ((and (class c-gap-bottom))
   [margin-bottom (px 10)])
  ((and (class c-gap-left))
   [margin-left (px 12)])
  ((and (class c-gap-left-small))
   [margin-left (px 6)])
  ((and (class c-gap-right))
   [margin-right (px 12)])
  ((and (class c-gap-right-small))
   [margin-right (px 6)])
  ((and (class c-gap-right-large))
   [margin-right (px 16)])
  ((and (class c-gap-left-large))
   [margin-left (px 16)])
  ((and (class c-gap-icon-right-small))
   [margin-right (px 5)])
  ((and (class c-gap-icon-right))
   [margin-right (px 10)])
  ((and (class c-gap-icon-left-small))
   [margin-left (px 5)])
  ((and (class c-gap-icon-left))
   [margin-left (px 10)])
  ((and (class c-container))
   [width (px 538)]
   #;[font-size (px 13)]
   #;[line-height 1.54]
   #;[word-wrap break-word])
  ((desc (and (class c-container)) (and (class c-container)))
   [width auto])
  ((desc (and (class c-default)) (and (class t)))
   [margin-bottom (px 0)])
  ((and (class cr-content))
   [width (px 259)]
   #;[font-size (px 13)]
   #;[line-height 1.54]
   #;[color rgb(51, 51, 51)]
   #;[word-wrap break-word]
   #;[word-break normal])
  ((and (class cr-offset))
   [padding-left (px 17)])
  ((and (class cr-title-sub))
   [float right]
   #;[font-size (px 13)]
   #;[font-weight normal])
  ((".c-row::after" (or))
   [display block]
   [height (px 0)]
   #;[content ""]
   #;[clear both]
   #;[visibility hidden])
  ((and (class c-span2))
   [width (px 29)])
  ((and (class c-span3))
   [width (px 52)])
  ((and (class c-span4))
   [width (px 75)])
  ((and (class c-span5))
   [width (px 98)])
  ((and (class c-span6))
   [width (px 121)])
  ((and (class c-span7))
   [width (px 144)])
  ((and (class c-span8))
   [width (px 167)])
  ((and (class c-span9))
   [width (px 190)])
  ((and (class c-span10))
   [width (px 213)])
  ((and (class c-span11))
   [width (px 236)])
  ((and (class c-span12))
   [width (px 259)])
  ((and (class c-span13))
   [width (px 282)])
  ((and (class c-span14))
   [width (px 305)])
  ((and (class c-span15))
   [width (px 328)])
  ((and (class c-span16))
   [width (px 351)])
  ((and (class c-span17))
   [width (px 374)])
  ((and (class c-span18))
   [width (px 397)])
  ((and (class c-span19))
   [width (px 420)])
  ((and (class c-span20))
   [width (px 443)])
  ((and (class c-span21))
   [width (px 466)])
  ((and (class c-span22))
   [width (px 489)])
  ((and (class c-span23))
   [width (px 512)])
  ((and (class c-span24))
   [width (px 535)])
  ((or (and (class c-span2)) (and (class c-span3)) (and (class c-span4)) (and (class c-span5)) (and (class c-span6)) (and (class c-span7)) (and (class c-span8)) (and (class c-span9)) (and (class c-span10)) (and (class c-span11)) (and (class c-span12)) (and (class c-span13)) (and (class c-span14)) (and (class c-span15)) (and (class c-span16)) (and (class c-span17)) (and (class c-span18)) (and (class c-span19)) (and (class c-span20)) (and (class c-span21)) (and (class c-span22)) (and (class c-span23)) (and (class c-span24)))
   [float left]
   [margin-right (px 17)]
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside])
  ((and (class c-span-last))
   [margin-right (px 0)])
  ((and (class c-span-last-s))
   [margin-right (px 0)])
  ((desc (and (class container_l)) (and (class cr-content)))
   [width (px 351)])
  ((desc (and (class container_l)) (and (class cr-content)) (and (class c-span-last-s)))
   [margin-right (px 17)])
  ((desc (and (class container_l)) (and (class cr-content-narrow)))
   [width (px 259)])
  ((desc (and (class container_l)) (and (class cr-content-narrow)) (and (class c-span-last-s)))
   [margin-right (px 0)])
  ((and (class c-border))
   [width (px 518)]
   [padding-top (px 9)]
   [padding-right (px 9)]
   [padding-bottom (px 9)]
   [padding-left (px 9)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(227, 227, 227)]
   #;[border-left-color rgb(227, 227, 227)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-bottom-color rgb(224, 224, 224)]
   #;[border-right-color rgb(236, 236, 236)]
   #;[box-shadow 1px 2px 1px rgba(0, 0, 0, 0.07)])
  ((desc (and (class c-border)) (and (class c-gap-left)))
   [margin-left (px 10)])
  ((desc (and (class c-border)) (and (class c-gap-left-small)))
   [margin-left (px 5)])
  ((desc (and (class c-border)) (and (class c-gap-right)))
   [margin-right (px 10)])
  ((desc (and (class c-border)) (and (class c-gap-right-small)))
   [margin-right (px 5)])
  ((desc (and (class c-border)) (and (class c-border)))
   [width auto]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [border-top-width (px 0)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[box-shadow none])
  ((desc (and (class c-border)) (and (class c-span2)))
   [width (px 34)])
  ((desc (and (class c-border)) (and (class c-span3)))
   [width (px 56)])
  ((desc (and (class c-border)) (and (class c-span4)))
   [width (px 78)])
  ((desc (and (class c-border)) (and (class c-span5)))
   [width (px 100)])
  ((desc (and (class c-border)) (and (class c-span6)))
   [width (px 122)])
  ((desc (and (class c-border)) (and (class c-span7)))
   [width (px 144)])
  ((desc (and (class c-border)) (and (class c-span8)))
   [width (px 166)])
  ((desc (and (class c-border)) (and (class c-span9)))
   [width (px 188)])
  ((desc (and (class c-border)) (and (class c-span10)))
   [width (px 210)])
  ((desc (and (class c-border)) (and (class c-span11)))
   [width (px 232)])
  ((desc (and (class c-border)) (and (class c-span12)))
   [width (px 254)])
  ((desc (and (class c-border)) (and (class c-span13)))
   [width (px 276)])
  ((desc (and (class c-border)) (and (class c-span14)))
   [width (px 298)])
  ((desc (and (class c-border)) (and (class c-span15)))
   [width (px 320)])
  ((desc (and (class c-border)) (and (class c-span16)))
   [width (px 342)])
  ((desc (and (class c-border)) (and (class c-span17)))
   [width (px 364)])
  ((desc (and (class c-border)) (and (class c-span18)))
   [width (px 386)])
  ((desc (and (class c-border)) (and (class c-span19)))
   [width (px 408)])
  ((desc (and (class c-border)) (and (class c-span20)))
   [width (px 430)])
  ((desc (and (class c-border)) (and (class c-span21)))
   [width (px 452)])
  ((desc (and (class c-border)) (and (class c-span22)))
   [width (px 474)])
  ((desc (and (class c-border)) (and (class c-span23)))
   [width (px 496)])
  ((desc (and (class c-border)) (and (class c-span24)))
   [width (px 518)])
  ((or (desc (and (class c-border)) (and (class c-span2))) (desc (and (class c-border)) (and (class c-span3))) (desc (and (class c-border)) (and (class c-span4))) (desc (and (class c-border)) (and (class c-span5))) (desc (and (class c-border)) (and (class c-span6))) (desc (and (class c-border)) (and (class c-span7))) (desc (and (class c-border)) (and (class c-span8))) (desc (and (class c-border)) (and (class c-span9))) (desc (and (class c-border)) (and (class c-span10))) (desc (and (class c-border)) (and (class c-span11))) (desc (and (class c-border)) (and (class c-span12))) (desc (and (class c-border)) (and (class c-span13))) (desc (and (class c-border)) (and (class c-span14))) (desc (and (class c-border)) (and (class c-span15))) (desc (and (class c-border)) (and (class c-span16))) (desc (and (class c-border)) (and (class c-span17))) (desc (and (class c-border)) (and (class c-span18))) (desc (and (class c-border)) (and (class c-span19))) (desc (and (class c-border)) (and (class c-span20))) (desc (and (class c-border)) (and (class c-span21))) (desc (and (class c-border)) (and (class c-span22))) (desc (and (class c-border)) (and (class c-span23))) (desc (and (class c-border)) (and (class c-span24))))
   [margin-right (px 10)])
  ((desc (and (class c-border)) (and (class c-span-last)))
   [margin-right (px 0)])
  ((and (class c-loading))
   [display block]
   [width (px 50)]
   [height (px 50)]
   #;[background-color transparent]
   #;[background-image url("//www.baidu.com/aladdin/img/tools/loading.gif")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (class c-vline))
   [display inline-block]
   [margin-top (px 0)]
   [margin-right (px 3)]
   [margin-bottom (px 0)]
   [margin-left (px 3)]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(221, 221, 221)]
   [width (px 0)]
   [height (px 12)])
  ((and (class c-icon))
   [display inline-block]
   [width (px 14)]
   [height (px 14)]
   #;[vertical-align text-bottom]
   #;[font-style normal]
   [overflow-x hidden]
   [overflow-y hidden])
  ((or (and (class c-icon-unfold)) (and (class c-icon-fold)) (and (class c-icon-chevron-unfold)) (and (class c-icon-chevron-fold)))
   [width (px 12)]
   [height (px 12)])
  ((or (and (class c-icon-star)) (and (class c-icon-star-gray)))
   [width (px 60)])
  ((or (and (class c-icon-qa-empty)) (and (class c-icon-safeguard)) (and (class c-icon-register-empty)) (and (class c-icon-zan)) (and (class c-icon-music)) (and (class c-icon-music-gray)) (and (class c-icon-location)) (and (class c-icon-warning)) (and (class c-icon-doc)) (and (class c-icon-xls)) (and (class c-icon-ppt)) (and (class c-icon-pdf)) (and (class c-icon-txt)) (and (class c-icon-play-black)) (and (class c-icon-gift)) (and (class c-icon-baidu-share)) (and (class c-icon-bear)) (and (class c-icon-bear-border)) (and (class c-icon-location-blue)) (and (class c-icon-hotAirBall)) (and (class c-icon-moon)) (and (class c-icon-streetMap)) (and (class c-icon-mv)) (and (class c-icon-zhidao-s)) (and (class c-icon-shopping)))
   [width (px 16)]
   [height (px 16)])
  ((or (and (class c-icon-bear-circle)) (and (class c-icon-warning-circle)) (and (class c-icon-warning-triangle)) (and (class c-icon-warning-circle-gray)))
   [width (px 18)]
   [height (px 18)])
  ((or (and (class c-icon-tieba)) (and (class c-icon-zhidao)) (and (class c-icon-bear-p)) (and (class c-icon-bear-pn)))
   [width (px 24)]
   [height (px 24)])
  ((or (and (class c-icon-ball-blue)) (and (class c-icon-ball-red)))
   [width (px 38)]
   [height (px 38)])
  ((or (and (class c-icon-unfold)) (and (class c-icon-fold)) (and (class c-icon-chevron-unfold)) (and (class c-icon-chevron-fold)) (and (class c-icon-download)) (and (class c-icon-lyric)))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(216, 216, 216)]
   #;[border-right-color rgb(216, 216, 216)]
   #;[border-bottom-color rgb(216, 216, 216)]
   #;[border-left-color rgb(216, 216, 216)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[cursor pointer])
  ((or (and (class c-icon-v)) (and (class c-icon-hui)) (and (class c-icon-bao)) (and (class c-icon-person)) (and (class c-icon-high-v)) (and (class c-icon-phone)) (and (class c-icon-nuo)) (and (class c-icon-fan)) (and (class c-icon-med)) (and (class c-icon-air)) (and (class c-icon-share2)) (and (class c-icon-v1)) (and (class c-icon-v2)) (and (class c-icon-v3)) (and (class c-icon-write)) (and (class c-icon-R)))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[cursor pointer]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent])
  ((or (and (class c-icon-v1)) (and (class c-icon-v2)) (and (class c-icon-v3)) (and (class c-icon-v1-noborder)) (and (class c-icon-v2-noborder)) (and (class c-icon-v3-noborder)) (and (class c-icon-v1-noborder-disable)) (and (class c-icon-v2-noborder-disable)) (and (class c-icon-v3-noborder-disable)))
   [width (px 19)])
  ((or (and (class c-icon-download)) (and (class c-icon-lyric)))
   [width (px 16)]
   [height (px 16)])
  ((or (and (class c-icon-play-circle)) (and (class c-icon-stop-circle)))
   [width (px 18)]
   [height (px 18)])
  ((or (and (class c-icon-play-circle-middle)) (and (class c-icon-stop-circle-middle)))
   [width (px 24)]
   [height (px 24)])
  ((or (and (class c-icon-play-black-large)) (and (class c-icon-stop-black-large)))
   [width (px 36)]
   [height (px 36)])
  ((or (and (class c-icon-play-black-larger)) (and (class c-icon-stop-black-larger)))
   [width (px 52)]
   [height (px 52)])
  ((and (class c-icon-star-gray))
   [position relative])
  ((desc (and (class c-icon-star-gray)) (and (class c-icon-star)))
   [position absolute]
   [top (px 0)]
   [left (px 0)])
  ((and (class c-icon-pic))
   [width (px 16)]
   #;[background-position -336px -168px])
  ((and (class c-icon-video))
   [width (px 18)]
   #;[background-position -384px -168px])
  ((and (class c-icon-new-corner))
   [width (px 15)]
   #;[background-position -576px -168px])
  ((and (class c-icon-right-large))
   [width (px 18)]
   #;[background-position -624px -168px])
  ((and (class c-icon-warning-triangle))
   [width (px 24)]
   #;[background-position -48px -216px])
  ((and (class c-recommend))
   #;[font-size (px 0)]
   [padding-top (px 5)]
   [padding-right (px 0)]
   [padding-bottom (px 5)]
   [padding-left (px 0)]
   [border-top-width (px 1)]
   [border-bottom-width (px 1)]
   [border-top-style solid]
   [border-bottom-style solid]
   #;[border-top-color rgb(243, 243, 243)]
   #;[border-bottom-color rgb(243, 243, 243)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-left-width medium]
   [border-left-style none]
   #;[border-left-color -moz-use-text-color]
   [border-right-width (px 0)]
   [border-right-style none]
   #;[border-right-color -moz-use-text-color])
  ((desc (and (class c-recommend)) (and (class c-icon)))
   [margin-bottom (px -4)])
  ((and (class c-recommend-notopline))
   [padding-top (px 0)]
   [border-top-width (px 0)]
   [border-top-style none]
   #;[border-top-color -moz-use-text-color])
  ((and (class c-recommend-vline))
   [display inline-block]
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px -2)]
   [margin-left (px 10)]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(216, 216, 216)]
   [width (px 0)]
   [height (px 12)])
  ((and (class c-text))
   [display inline-block]
   [padding-top (px 2)]
   [padding-right (px 2)]
   [padding-bottom (px 2)]
   [padding-left (px 2)]
   [text-align center]
   #;[vertical-align text-bottom]
   #;[font-size (px 12)]
   #;[line-height (% 100)]
   #;[font-style normal]
   #;[font-weight normal]
   #;[color rgb(255, 255, 255)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class c-text-info))
   [padding-left (px 0)]
   [padding-right (px 0)]
   #;[font-weight bold]
   #;[color rgb(43, 153, 255)])
  ((desc (and (class c-text-info)) (and (tag span)))
   [padding-top (px 0)]
   [padding-right (px 2)]
   [padding-bottom (px 0)]
   [padding-left (px 2)]
   #;[font-weight normal])
  ((and (class c-text-empty))
   [padding-top (px 1)]
   [padding-bottom (px 1)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(216, 216, 216)]
   #;[border-right-color rgb(216, 216, 216)]
   #;[border-bottom-color rgb(216, 216, 216)]
   #;[border-left-color rgb(216, 216, 216)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[cursor pointer]
   #;[color rgb(35, 185, 253)]
   #;[background-color rgb(255, 255, 255)])
  ((and (class c-text-mult))
   [padding-left (px 5)]
   [padding-right (px 5)])
  ((and (class c-btn))
   [display inline-block]
   [padding-top (px 0)]
   [padding-right (px 14)]
   [padding-bottom (px 0)]
   [padding-left (px 14)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [height (px 24)]
   #;[line-height (px 25)]
   #;[font-size (px 13)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(216, 216, 216)]
   #;[border-right-color rgb(216, 216, 216)]
   #;[border-bottom-color rgb(216, 216, 216)]
   #;[border-left-color rgb(216, 216, 216)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[cursor pointer]
   #;[font-family inherit]
   #;[font-weight normal]
   [text-align center]
   #;[vertical-align middle]
   #;[background-color rgb(249, 249, 249)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color])
  ((and (tag button) (class c-btn))
   [height (px 26)])
  (("button.c-btn::-moz-focus-inner" (or))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [border-top-width (px 0)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((desc (and (class c-btn)) (and (class c-icon)))
   [margin-top (px 5)])
  ((".c-btn-disable:hover" (or))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(216, 216, 216)]
   #;[border-right-color rgb(216, 216, 216)]
   #;[border-bottom-color rgb(216, 216, 216)]
   #;[border-left-color rgb(216, 216, 216)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[cursor default])
  ((and (class c-btn-mini))
   [padding-left (px 5)]
   [padding-right (px 5)]
   [height (px 18)]
   #;[line-height (px 18)]
   #;[font-size (px 12)])
  ((and (tag button) (class c-btn-mini))
   [height (px 20)])
  ((desc (and (class c-btn-mini)) (and (class c-icon)))
   [margin-top (px 2)])
  ((and (class c-btn-large))
   [height (px 28)]
   #;[line-height (px 28)]
   #;[font-size (px 14)]
   #;[font-family "微软雅黑","黑体"])
  ((and (tag button) (class c-btn-large))
   [height (px 30)])
  ((desc (and (class c-btn-large)) (and (class c-icon)))
   [margin-top (px 7)])
  ((desc (and (class c-btn)) (and (class c-icon)))
   [float left])
  ((and (class c-dropdown2))
   [position relative]
   [display inline-block]
   [width (% 100)]
   [height (px 26)]
   #;[line-height (px 26)]
   #;[font-size (px 13)]
   #;[vertical-align middle]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   #;[background-color rgb(255, 255, 255)]
   #;[word-wrap normal]
   #;[word-break normal])
  ((desc (and (class c-dropdown2)) (and (class c-dropdown2-btn-group)))
   [position relative]
   [height (px 24)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(153, 153, 153)]
   #;[border-left-color rgb(153, 153, 153)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-bottom-color rgb(216, 216, 216)]
   #;[border-right-color rgb(216, 216, 216)])
  ((desc (and (class c-dropdown2)) (and (class c-dropdown2-btn)))
   [height (px 24)]
   [padding-left (px 10)]
   [padding-right (px 10)]
   #;[cursor default]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[white-space nowrap])
  ((desc (and (class c-dropdown2)) (and (class c-dropdown2-btn-icon)))
   [position absolute]
   [top (px 0)]
   [right (px 0)]
   [width (px 23)]
   [height (px 24)]
   #;[line-height (px 24)]
   #;[background-color rgb(255, 255, 255)]
   [padding-top (px 0)]
   [padding-right (px 1)]
   [padding-bottom (px 0)]
   [padding-left (px 10)])
  ((desc (and (class c-dropdown2)) (and (class c-dropdown2-btn-icon-border)))
   [height (px 24)]
   [width (px 23)]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(217, 217, 217)]
   [text-align center])
  ((desc (and (class c-dropdown2)) (and (class c-dropdown2-menu)))
   [position absolute]
   [left (px 0)]
   [top (% 100)]
   [width (% 100)]
   [overflow-x hidden]
   [overflow-y hidden]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(187, 187, 187)]
   #;[border-right-color rgb(187, 187, 187)]
   #;[border-bottom-color rgb(187, 187, 187)]
   #;[border-left-color rgb(187, 187, 187)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[visibility hidden])
  ((desc (and (class c-dropdown2)) (and (class c-dropdown2-menu-inner)))
   [overflow-x hidden]
   [overflow-y hidden])
  ((or (desc (and (class c-dropdown2-common)) (and (tag ul))) (desc (and (class c-dropdown2-common)) (and (tag li))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside])
  ((desc (and (class c-dropdown2-common)) (and (class c-dropdown2-option)))
   [height (px 26)]
   #;[line-height (px 26)]
   #;[font-size (px 12)]
   #;[color rgb(51, 51, 51)]
   #;[white-space nowrap]
   #;[cursor pointer]
   [padding-left (px 10)])
  ((desc (and (class c-dropdown2-common)) (and (class c-dropdown2-menu-group)) (and (class c-dropdown2-group)))
   [padding-left (px 10)]
   #;[font-weight bold]
   #;[cursor default])
  ((desc (and (class c-dropdown2-common)) (and (class c-dropdown2-menu-group)) (and (class c-dropdown2-option)))
   [padding-left (px 20)])
  ((and (class c-img))
   [display block]
   #;[min-height (px 1)]
   [border-top-width (px 0)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (class c-img3))
   [width (px 52)])
  ((and (class c-img4))
   [width (px 75)])
  ((and (class c-img6))
   [width (px 121)])
  ((and (class c-img7))
   [width (px 144)])
  ((and (class c-img12))
   [width (px 259)])
  ((and (class c-img15))
   [width (px 328)])
  ((and (class c-img18))
   [width (px 397)])
  ((desc (and (class c-border)) (and (class c-img3)))
   [width (px 56)])
  ((desc (and (class c-border)) (and (class c-img4)))
   [width (px 78)])
  ((desc (and (class c-border)) (and (class c-img7)))
   [width (px 144)])
  ((desc (and (class c-border)) (and (class c-img12)))
   [width (px 254)])
  ((desc (and (class c-border)) (and (class c-img15)))
   [width (px 320)])
  ((desc (and (class c-border)) (and (class c-img18)))
   [width (px 386)])
  ((and (class c-index))
   [display inline-block]
   [padding-top (px 1)]
   [padding-right (px 0)]
   [padding-bottom (px 1)]
   [padding-left (px 0)]
   #;[color rgb(255, 255, 255)]
   [width (px 14)]
   #;[line-height (% 100)]
   #;[font-size (px 12)]
   [text-align center]
   #;[background-color rgb(142, 185, 245)])
  ((and (class c-input))
   [display inline-block]
   [padding-top (px 0)]
   [padding-right (px 4)]
   [padding-bottom (px 0)]
   [padding-left (px 4)]
   [height (px 24)]
   #;[font-size (px 13)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(153, 153, 153)]
   #;[border-left-color rgb(153, 153, 153)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-bottom-color rgb(216, 216, 216)]
   #;[border-right-color rgb(216, 216, 216)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   [box-sizing content-box]
   #;[vertical-align top]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class c-input)) (and (class c-icon)))
   [float right]
   [margin-top (px 6)])
  ((desc (and (class c-input)) (and (class c-icon-left)))
   [float left]
   [margin-right (px 4)])
  ((desc (and (class c-input)) (and (tag input)))
   [float left]
   [height (px 22)]
   [margin-top (px 2)]
   #;[font-size (px 13)]
   [border-top-width (px 0)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color])
  ((and (class c-input))
   [width (px 180)])
  ((desc (and (class c-input)) (and (tag input)))
   [width (px 162)])
  ((and (class c-input-xmini))
   [width (px 65)])
  ((desc (and (class c-input-xmini)) (and (tag input)))
   [width (px 47)])
  ((and (class c-input-mini))
   [width (px 88)])
  ((desc (and (class c-input-mini)) (and (tag input)))
   [width (px 70)])
  ((and (class c-input-small))
   [width (px 157)])
  ((desc (and (class c-input-small)) (and (tag input)))
   [width (px 139)])
  ((and (class c-input-large))
   [width (px 203)])
  ((desc (and (class c-input-large)) (and (tag input)))
   [width (px 185)])
  ((and (class c-input-xlarge))
   [width (px 341)])
  ((desc (and (class c-input-xlarge)) (and (tag input)))
   [width (px 323)])
  ((and (class c-input12))
   [width (px 249)])
  ((desc (and (class c-input12)) (and (tag input)))
   [width (px 231)])
  ((and (class c-input20))
   [width (px 433)])
  ((desc (and (class c-input20)) (and (tag input)))
   [width (px 415)])
  ((desc (and (class c-border)) (and (class c-input)))
   [width (px 178)])
  ((desc (and (class c-border)) (and (class c-input)) (and (tag input)))
   [width (px 160)])
  ((desc (and (class c-border)) (and (class c-input-xmini)))
   [width (px 68)])
  ((desc (and (class c-border)) (and (class c-input-xmini)) (and (tag input)))
   [width (px 50)])
  ((desc (and (class c-border)) (and (class c-input-mini)))
   [width (px 90)])
  ((desc (and (class c-border)) (and (class c-input-mini)) (and (tag input)))
   [width (px 72)])
  ((desc (and (class c-border)) (and (class c-input-small)))
   [width (px 156)])
  ((desc (and (class c-border)) (and (class c-input-small)) (and (tag input)))
   [width (px 138)])
  ((desc (and (class c-border)) (and (class c-input-large)))
   [width (px 200)])
  ((desc (and (class c-border)) (and (class c-input-large)) (and (tag input)))
   [width (px 182)])
  ((desc (and (class c-border)) (and (class c-input-xlarge)))
   [width (px 332)])
  ((desc (and (class c-border)) (and (class c-input-xlarge)) (and (tag input)))
   [width (px 314)])
  ((desc (and (class c-border)) (and (class c-input12)))
   [width (px 244)])
  ((desc (and (class c-border)) (and (class c-input12)) (and (tag input)))
   [width (px 226)])
  ((desc (and (class c-border)) (and (class c-input20)))
   [width (px 420)])
  ((desc (and (class c-border)) (and (class c-input20)) (and (tag input)))
   [width (px 402)])
  ((".c-numberset::after" (or))
   [display block]
   [height (px 0)]
   #;[content ""]
   #;[clear both]
   #;[visibility hidden])
  ((desc (and (class c-numberset)) (and (tag li)))
   [float left]
   [margin-right (px 17)]
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside])
  ((desc (and (class c-numberset)) (and (class c-numberset-last)))
   [margin-right (px 0)])
  ((desc (and (class c-numberset)) (and (tag a)))
   [display block]
   [width (px 50)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [text-align center]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(216, 216, 216)]
   #;[border-right-color rgb(216, 216, 216)]
   #;[border-bottom-color rgb(216, 216, 216)]
   #;[border-left-color rgb(216, 216, 216)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[cursor pointer])
  ((desc (and (class c-border)) (and (class c-numberset)) (and (tag li)))
   [margin-right (px 10)])
  ((desc (and (class c-border)) (and (class c-numberset)) (and (class c-numberset-last)))
   [margin-right (px 0)])
  ((desc (and (class c-border)) (and (class c-numberset)) (and (tag a)))
   [width (px 54)])
  ((and (class c-table))
   [width (% 100)]
   #;[border-collapse collapse]
   #;[border-spacing (px 0)])
  ((or (desc (and (class c-table)) (and (tag th))) (desc (and (class c-table)) (and (tag td))))
   [padding-left (px 10)]
   #;[line-height 1.54]
   #;[font-size (px 13)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(243, 243, 243)]
   [text-align left])
  ((".cr-content .c-table th:first-child, .cr-content .c-table td:first-child" (or))
   [padding-left (px 0)])
  ((desc (and (class c-table)) (and (tag th)))
   [padding-top (px 4)]
   [padding-bottom (px 4)]
   #;[font-weight normal]
   #;[color rgb(102, 102, 102)]
   #;[border-top-color rgb(240, 240, 240)]
   #;[border-right-color rgb(240, 240, 240)]
   #;[border-bottom-color rgb(240, 240, 240)]
   #;[border-left-color rgb(240, 240, 240)]
   #;[white-space nowrap]
   #;[background-color rgb(250, 250, 250)])
  ((desc (and (class c-table)) (and (tag td)))
   [padding-top (px 6.5)]
   [padding-bottom (px 6.5)])
  ((desc (and (class c-table-hasimg)) (and (tag td)))
   [padding-top (px 10)]
   [padding-bottom (px 10)])
  ((desc (and (class c-table-noborder)) (and (tag td)))
   [border-bottom-width (px 0)]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color])
  ((and (class c-tabs-nav-movetop))
   [margin-top (px -10)]
   [margin-right (px -9)]
   [margin-bottom (px 0)]
   [margin-left (px -10)]
   [position relative])
  ((and (class c-tabs-nav))
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(217, 217, 217)]
   #;[background-color rgb(250, 250, 250)]
   #;[line-height 1.54]
   #;[font-size (px 0)])
  ((".c-tabs-nav::after" (or))
   [display block]
   [height (px 0)]
   #;[content ""]
   #;[clear both]
   #;[visibility hidden])
  ((desc (and (class c-tabs-nav)) (and (class c-tabs-nav-btn)))
   [float right]
   #;[background-color rgb(250, 250, 250)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((or (desc (and (class c-tabs-nav)) (and (class c-tabs-nav-btn)) (and (class c-tabs-nav-btn-prev))) (desc (and (class c-tabs-nav)) (and (class c-tabs-nav-btn)) (and (class c-tabs-nav-btn-next))))
   [float left]
   [padding-top (px 6)]
   [padding-right (px 2)]
   [padding-bottom (px 6)]
   [padding-left (px 2)]
   #;[cursor pointer])
  ((desc (and (class c-tabs-nav)) (and (class c-tabs-nav-view)))
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-bottom (px -1)])
  ((desc (and (class c-tabs-nav)) (and (class c-tabs-nav-view)) (and (class c-tabs-nav-li)))
   [margin-bottom (px 0)])
  ((desc (and (class c-tabs-nav)) (and (class c-tabs-nav-more)))
   [float left]
   #;[white-space nowrap])
  ((desc (and (class c-tabs-nav)) (and (tag li)))
   [display inline-block]
   [margin-bottom (px -1)]
   [padding-top (px 3)]
   [padding-right (px 15)]
   [padding-bottom (px 3)]
   [padding-left (px 15)]
   #;[vertical-align bottom]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 2)]
   [border-right-width (px 1)]
   [border-bottom-width (px 0)]
   [border-left-width (px 1)]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside]
   #;[cursor pointer]
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class c-tabs-nav)) (and (class c-tabs-nav-sep)))
   [height (px 16)]
   [width (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-bottom (px 4)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 0)]
   [border-right-width (px 1)]
   [border-bottom-width (px 0)]
   [border-left-width (px 1)]
   #;[border-top-color transparent]
   #;[border-right-color rgb(255, 255, 255)]
   #;[border-bottom-color transparent]
   #;[border-left-color rgb(222, 222, 222)])
  ((desc (and (class c-tabs)) (and (class c-tabs)) (and (class c-tabs-nav)))
   [padding-top (px 10)]
   [padding-right (px 0)]
   [padding-bottom (px 5)]
   [padding-left (px 0)]
   [border-top-width (px 0)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 255, 255)])
  ((desc (and (class c-tabs)) (and (class c-tabs)) (and (class c-tabs-nav)) (and (tag li)))
   [padding-top (px 0)]
   [padding-right (px 5)]
   [padding-bottom (px 0)]
   [padding-left (px 5)]
   [position static]
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 10)]
   [border-top-width (px 0)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[cursor pointer]
   #;[white-space nowrap])
  ((desc (and (class c-tabs)) (and (class c-tabs)) (and (class c-tabs-nav)) (and (class c-tabs-nav-sep)))
   [height (px 11)]
   [width (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 4)]
   [margin-left (px 0)]
   [border-top-width (px 0)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(216, 216, 216)])
  ((and (class c-tag))
   [padding-top (px 3)]
   [margin-bottom (px 3)]
   [height 1.7em]
   #;[font-size (px 13)]
   #;[line-height 1.4em]
   #;[transition-property height]
   #;[transition-duration 0.3s]
   #;[transition-timing-function ease-in]
   #;[transition-delay (px 0)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((".c-tag::after" (or))
   [display block]
   [height (px 0)]
   #;[content ""]
   #;[clear both]
   #;[visibility hidden])
  ((and (class c-tag-cont))
   [overflow-x hidden]
   [overflow-y hidden])
  ((or (and (class c-tag-type)) (and (class c-tag-li)) (and (class c-tag-more)) (desc (and (class c-tag-cont)) (and (tag span))))
   [margin-top (px 2)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 0)])
  ((or (and (class c-tag-type)) (and (class c-tag-li)) (desc (and (class c-tag-cont)) (and (tag span))))
   [float left])
  ((or (and (class c-tag-li)) (desc (and (class c-tag-cont)) (and (tag span))))
   [padding-top (px 0)]
   [padding-right (px 4)]
   [padding-bottom (px 0)]
   [padding-left (px 4)]
   [display inline-block]
   [margin-right (px 12)]
   #;[white-space nowrap]
   #;[cursor pointer]
   #;[color rgb(0, 0, 204)])
  ((and (class c-tag-more))
   [float right]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[cursor pointer])
  ((and (class c-tool))
   [display inline-block]
   [width (px 56)]
   [height (px 56)]
   #;[background-color transparent]
   #;[background-image url("//www.baidu.com/aladdin/img/tools/tools-5.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (class c-tool-kefu))
   [width (px 121)]
   #;[background-position -432px 0px])
  ((and (id debug))
   [display none])
  ((and (id seth))
   [display none])
  ((and (id setf))
   [display none])
  ((and (id sekj))
   [margin-left (px 14)])
  ((or (and (id st)) (and (id sekj)))
   [display none])
  ((and (class s_ipt_wr))
   [border-top-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [display inline-block]
   #;[vertical-align top]
   [width (px 539)]
   [margin-right (px 0)]
   [border-right-width (px 0)]
   #;[border-top-color rgb(184, 184, 184)]
   #;[border-right-color transparent]
   #;[border-bottom-color rgb(204, 204, 204)]
   #;[border-left-color rgb(184, 184, 184)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class wrapper_s)) (and (class s_ipt_wr)))
   [width (px 439)])
  ((desc (and (class wrapper_s)) (and (class s_ipt)))
   [width (px 434)])
  ((desc (and (class wrapper_s)) (and (class s_ipt_tip)))
   [width (px 434)])
  ((and (class s_ipt_tip))
   #;[color rgb(170, 170, 170)]
   [position absolute]
   #;[z-index -10]
   #;[font-family arial]
   #;[font-style normal]
   #;[font-weight normal]
   #;[font-size (px 16)]
   #;[font-size-adjust none]
   #;[font-stretch normal]
   #;[font-feature-settings normal]
   #;[font-language-override normal]
   #;[font-kerning auto]
   #;[font-synthesis weight style]
   #;[font-variant-alternates normal]
   #;[font-variant-caps normal]
   #;[font-variant-east-asian normal]
   #;[font-variant-ligatures normal]
   #;[font-variant-numeric normal]
   #;[font-variant-position normal]
   [height (px 32)]
   #;[line-height (px 32)]
   [padding-left (px 7)]
   [overflow-x hidden]
   [overflow-y hidden]
   [width (px 526)])
  ((and (class s_ipt))
   [width (px 526)]
   [height (px 22)]
   #;[font-family arial]
   #;[font-style normal]
   #;[font-weight normal]
   #;[font-size (px 16)]
   #;[line-height (px 18)]
   #;[font-size-adjust none]
   #;[font-stretch normal]
   #;[font-feature-settings normal]
   #;[font-language-override normal]
   #;[font-kerning auto]
   #;[font-synthesis weight style]
   #;[font-variant-alternates normal]
   #;[font-variant-caps normal]
   #;[font-variant-east-asian normal]
   #;[font-variant-ligatures normal]
   #;[font-variant-numeric normal]
   #;[font-variant-position normal]
   [margin-top (px 6)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 7)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-top-width (px 0)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color])
  ((and (id kw))
   [position relative])
  ((or (and (class bdpfmenu)) (and (class usermenu)))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(209, 209, 209)]
   #;[border-right-color rgb(209, 209, 209)]
   #;[border-bottom-color rgb(209, 209, 209)]
   #;[border-left-color rgb(209, 209, 209)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [position absolute]
   [width (px 105)]
   [top (px 36)]
   #;[z-index 302]
   #;[box-shadow 1px 1px 5px rgb(209, 209, 209)])
  ((or (desc (and (class bdpfmenu)) (and (tag a))) (desc (and (class usermenu)) (and (tag a))))
   [display block]
   [text-align left]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 9)]
   [padding-bottom (px 0)]
   [padding-left (px 9)]
   #;[line-height (px 26)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid])
  ((and (id u))
   #;[z-index 301]
   [position absolute]
   [right (px 0)]
   [top (px 0)]
   [margin-top (px 21)]
   [margin-right (px 9)]
   [margin-bottom (px 5)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class wrapper_s)) (and (id u)))
   [margin-right (px 3)])
  ((desc (and (id u)) (and (tag a)))
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line underline]
   #;[text-decoration-style solid]
   #;[color rgb(51, 51, 51)]
   [margin-top (px 0)]
   [margin-right (px 7)]
   [margin-bottom (px 0)]
   [margin-left (px 7)])
  ((desc (and (id u)) (and (class back_org)))
   #;[color rgb(102, 102, 102)]
   [float left]
   [display inline-block]
   [height (px 24)]
   #;[line-height (px 24)])
  ((desc (and (id u)) (and (class bri)))
   [display inline-block]
   [width (px 24)]
   [height (px 24)]
   [float left]
   #;[line-height (px 24)]
   #;[color transparent]
   #;[background-color transparent]
   #;[background-image url("http://s1.bdstatic.com/r/www/cache/static/home/img/icons_c3b33b92.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position 4px 3px]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size 300px 18px]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (id mCon)) (and (id imeSIcon)))
   #;[background-position -408px -144px]
   [margin-left (px 0)])
  ((and (class bdpfmenu))
   [width (px 70)])
  ((and (class usermenu))
   [width (px 68)]
   [right (px 8)])
  ((desc (and (id wrapper)) (and (class bdnuarrow)))
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   [display block]
   [position absolute]
   [top (px -10)]
   [left (% 50)]
   [margin-left (px -5)])
  ((or (desc (and (id wrapper)) (and (class bdnuarrow)) (and (tag em))) (desc (and (id wrapper)) (and (class bdnuarrow)) (and (tag i))))
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   [display block]
   [position absolute]
   [border-top-width (px 5)]
   [border-right-width (px 5)]
   [border-bottom-width (px 5)]
   [border-left-width (px 5)]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-top-style dashed]
   [border-right-style dashed]
   [border-bottom-style solid]
   [border-left-style dashed])
  ((desc (and (id wrapper)) (and (class bdnuarrow)) (and (tag em)))
   #;[border-bottom-color rgb(216, 216, 216)]
   [top (px -1)])
  ((desc (and (id wrapper)) (and (class bdnuarrow)) (and (tag i)))
   #;[border-bottom-color rgb(255, 255, 255)]
   [top (px 0)])
  ((and (id prefpanel))
   #;[background-color rgb(250, 250, 250)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [display none]
   #;[opacity (px 0)]
   [position fixed]
   [top (px -359)]
   #;[z-index 500]
   [width (% 100)]
   #;[min-width (px 960)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(235, 235, 235)])
  ((and (id kw_tip))
   #;[cursor default]
   [display none]
   [margin-top (px 1)])
  ((and (id bds-message-wrapper))
   [top (px 43)])
  ((and (class quickdelete-wrap))
   [position relative])
  ((desc (and (class quickdelete-wrap)) (and (tag input)))
   [width (px 500)])
  ((desc (and (class wrapper_l)) (and (class quickdelete-wrap)) (and (tag input)))
   [width (px 500)])
  ((desc (and (class wrapper_s)) (and (class quickdelete-wrap)) (and (tag input)))
   [width (px 402)])
  ((and (class quickdelete))
   [width (px 32)]
   [height (px 32)]
   #;[background-color transparent]
   #;[background-image url("http://s1.bdstatic.com/r/www/cache/static/global/img/quickdelete_9c14b01a.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[background-position 10px 10px]
   [position absolute]
   [display block])
  ((and (class op_dict3_gap_small))
   [margin-right (px 7)])
  ((desc (and (class op_dict3_chinese_result)) (and (tag span)))
   [float left]
   [height (px 24)]
   #;[line-height (px 24)]
   [margin-bottom (px 12)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class op_dict3_marginBottom))
   [margin-bottom (px 12)])
  ((and (class op_dict3_marginRight))
   [margin-right (px 15)])
  ((and (class op_dict3_english_result_table))
   #;[line-height (px 20)]
   [margin-bottom (px 9)])
  ((desc (and (class op_dict3_english_result_table)) (and (class op_dict_exp)))
   #;[color rgb(51, 51, 51)]
   [margin-right (px 0)])
  ((desc (and (class op_dict3_english_result_table)) (and (class op_dict_text1)))
   [float left]
   #;[min-width (px 37)]
   #;[color rgb(153, 153, 153)]
   #;[white-space nowrap])
  ((desc (and (class op_dict3_english_result_table)) (and (class op_dict_text2)))
   [float left]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[max-height (px 60)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[word-break normal])
  ((and (class op_dict3_chineselong_result))
   #;[font-size (px 24)]
   #;[line-height (px 24)]
   [width (px 518)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[white-space nowrap]
   #;[text-overflow ellipsis])
  ((and (class op_dict_fmp_flash_div))
   [height (px 1)]
   [width (px 1)]
   [position absolute]
   [right (px 0)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((or (and (class op_dict3_how_read)) (and (class op_dict3_mp3_play)))
   [display block]
   [width (px 14)]
   [height (px 11)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[background-color transparent]
   #;[background-image url("//www.baidu.com/aladdin/img/dic3/iconall.gif")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [margin-right (px 8)]
   [margin-top (px 7)])
  ((and (class op_dict3_font24))
   #;[font-size (px 24)]
   #;[font-family arial]
   [height (px 24)]
   #;[line-height (px 24)])
  ((and (class op_dict3_font14))
   #;[font-size (px 14)]
   [position relative])
  ((and (class op_dict3_font16))
   #;[font-size (px 16)]
   [position relative])
  ((or (desc (and (class op_dict3_how_read)) (and (tag a))) (desc (and (class op_dict3_how_read)) (and (tag span))))
   [display block])
  ((desc (and (class op_dict3_how_read)) (and (tag a)))
   [width (px 15)]
   [height (px 15)])
  ((or (and (class op_dict3_lineone_result)) (and (class op_dict3_linetwo_result)))
   [display none]
   [width (px 518)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis]
   #;[word-break normal]
   #;[line-height (px 20)])
  ((and (class op_dict3_linetwo_result))
   [width (px 480)])
  ((desc (and (class op_dict3_lineone_result)) (and (tag span)))
   [float left]
   [width (px 471)])
  ((desc (and (class op_dict3_lineone_result)) (and (tag span) (class op_dict3_lineone_result_tip)))
   [width (px 47)]
   #;[color rgb(153, 153, 153)])
  ((and (class op_dict3_linetwo_result))
   [padding-left (px 47)]
   [margin-bottom (px 9)])
  ((and (class op_dict3_read1))
   [float left])
  ((and (class op_dict3_readline))
   #;[line-height (px 24)]
   [margin-bottom (px 12)])
  ((desc (and (class op_dict3_read1)) (and (tag span)))
   [height (px 24)]
   #;[line-height (px 24)]
   [float left])
  ((and (class op_dict3_extra))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(242, 242, 242)]
   [padding-top (px 13)]
   [margin-top (px 13)])
  ((desc (and (class op_dict3_extra_transform)) (and (tag span)))
   [display inline-block]
   #;[color rgb(102, 102, 102)]
   [margin-right (px 12)])
  ((desc (and (class op_dict3_extra_polyphone)) (and (tag a)))
   [display inline-block]
   [margin-right (px 12)])
  ((desc (and (class op_dict3_other_line)) (and (tag td)))
   [padding-top (px 5)])
  ((desc (and (class op_dict_text2)) (and (tag span)))
   [margin-right (px 12)]
   [display inline-block]
   [margin-bottom (px 2)])
  ((desc (and (class op_dict3_morelink)) (and (tag a)))
   [margin-right (px 12)]
   [display inline-block])
  ((and (class op_dict3_morelink))
   [margin-bottom (px 2)]
   [padding-left (px 47)])
  ((desc (and (class op_dict3_extra_confused_p)) (and (tag span)))
   [margin-right (px 4)]
   [display inline-block])
  ((and (class op_dict3_extra_confused_p))
   [margin-right (px 6)]
   [margin-bottom (px 4)])
  ((and (class op_dict3_tabs_nav))
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [padding-bottom (px 12)])
  ((and (class op_dict3_tabs_content))
   [padding-top (px 12)]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(242, 242, 242)])
  ((and (class op_dict3_duoyinzi))
   [float left])
  ((desc (and (class op_dict3_tabs_nav)) (and (class op_dict3_nav_li)))
   #;[color rgb(0, 0, 204)]
   [height (px 14)]
   #;[line-height (px 14)]
   [text-align center]
   [padding-top (px 2)]
   [padding-right (px 2)]
   [padding-bottom (px 2)]
   [padding-left (px 2)]
   [margin-right (px 12)]
   [margin-left (px 8)]
   [display inline-block]
   #;[cursor pointer])
  ((and (class op_dict3_polyphone))
   [margin-bottom (px 12)])
  ((and (class op_dict3_netmeans))
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis])
  ((desc (and (class op_dict3_xingjinci)) (and (tag a)))
   [margin-right (px 4)])
  ((and (class op_dict3_liju_read))
   [display inline-block]
   [position relative]
   [top (px 2)]
   [left (px 4)]
   [margin-top (px -2)])
  ((and (class op_dict3_inlineblock))
   [display inline-block]
   #;[color rgb(51, 51, 51)])
  ((and (class op_dict3_extra_confused_firstp))
   [margin-bottom (px 4)])
  ((desc (and (class op-bk-polysemy-other)) (and (tag span)))
   [display block])
  ((or (desc (and (class op-bk-polysemy-oneother)) (and (class op-bk-polysemy-move))) (desc (and (class op-bk-polysemy-oneother)) (and (tag span))))
   [margin-left (px 0)])
  ((and (class op-bk-polysemy-focus))
   [height (px 22)]
   #;[line-height 1.69em]
   [margin-bottom (px 2)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class op-bk-polysemy-focustext))
   [float left]
   [display inline-block]
   [height (px 22)]
   [padding-top (px 0)]
   [padding-right (px 8)]
   [padding-bottom (px 0)]
   [padding-left (px 30)]
   #;[background-color rgb(50, 136, 255)]
   #;[background-image url("//www.baidu.com/aladdin/img/bk_polysemy/bk_polyicon.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position 5px 0px]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[color rgb(255, 255, 255)])
  ((desc (and (class op-bk-polysemy-focus)) (and (tag a)))
   [display inline-block]
   [height (px 22)]
   #;[line-height 1.69em]
   [float left]
   [border-right-width (px 2)]
   [border-right-style solid]
   #;[border-right-color rgb(255, 255, 255)]
   #;[background-color rgb(245, 245, 245)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [padding-top (px 0)]
   [padding-right (px 8)]
   [padding-bottom (px 0)]
   [padding-left (px 8)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[color rgb(51, 51, 51)])
  ((and (class op-bk-polysemy-focusf))
   [height (px 23)]
   #;[line-height 1.69em]
   [margin-bottom (px 2)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class op-bk-polysemy-focusleft))
   [float left]
   [display inline-block]
   [height (px 21)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(51, 136, 255)]
   #;[border-right-color rgb(51, 136, 255)]
   #;[border-bottom-color rgb(51, 136, 255)]
   #;[border-left-color rgb(51, 136, 255)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((or (and (class op-bk-polysemy-focusrightf)) (and (class op-bk-polysemy-focustextf)))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(240, 240, 240)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(240, 240, 240)])
  ((and (class op-bk-polysemy-focustextf))
   [float left]
   [display inline-block]
   [height (px 21)]
   [padding-left (px 10)])
  ((and (class op-bk-polysemy-focusrightf))
   [float left]
   [display inline-block]
   [height (px 21)]
   [border-right-width (px 1)]
   [border-right-style solid]
   #;[border-right-color rgb(240, 240, 240)])
  ((desc (and (class op-bk-polysemy-focusrightf)) (and (tag span)))
   [display inline-block]
   [float left]
   #;[color rgb(204, 204, 204)])
  ((desc (and (class op-bk-polysemy-focusrightf)) (and (tag a)))
   [display inline-block]
   [height (px 21)]
   #;[line-height 1.54em]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line underline]
   #;[text-decoration-style solid]
   [border-top-width medium]
   [border-right-width medium]
   [border-bottom-width medium]
   [border-left-width medium]
   [border-top-style none]
   [border-right-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [float left]
   [padding-top (px 0)]
   [padding-right (px 8)]
   [padding-bottom (px 0)]
   [padding-left (px 8)]
   #;[color rgb(0, 0, 204)])
  ((desc (and (class op-bk-polysemy-focusrightf)) (and (tag a) (class op-bk-polysemy_focusrfirst)))
   [padding-left (px 4)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[color rgb(0, 0, 204)])
  ((and (class op-bk-polysemy-album))
   [position relative]
   [width (% 100)]
   [display block])
  ((and (class op-bk-polysemy-albumPr))
   [position relative])
  ((and (class op-bk-polysemy-albumMore))
   [display block]
   [width (% 100)]
   [height (px 18)]
   #;[line-height (px 18)]
   #;[background-color rgba(82, 82, 82, 0.6)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[color rgb(255, 255, 255)]
   [position absolute]
   [bottom (px 0)]
   [left (px 0)]
   [text-align center])
  ((and (class op-bk-polysemy-albumBorder))
   [width (% 99)]
   [height (% 99)]
   [position absolute]
   [border-right-width (px 1)]
   [border-right-style solid]
   #;[border-right-color rgb(191, 191, 191)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(191, 191, 191)]
   [right (px -2)]
   [bottom (px -2)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[z-index 59])
  ((and (class op-bk-polysemy-albumBorderSec))
   [right (px -4)]
   [bottom (px -4)])
  ((desc (and (class op-singer-v2-songs)) (and (tag input)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class op-singer-v2-songs)) (and (tag td)))
   [padding-top (px 7)]
   [padding-bottom (px 6)]
   #;[line-height 1.1])
  ((desc (and (class op-singer-v2-songs)) (and (tag td) (class op-singer-v2-songs-icon)))
   [padding-top (px 7)]
   [padding-bottom (px 7)]
   #;[line-height 1])
  ((desc (and (class op-singer-v2-songs)) (and (tag th) (class op-singer-v2-songs-iconpl)))
   [padding-left (px 13)])
  ((desc (and (class op-singer-v2-songs)) (and (tag td) (class op-singer-v2-songs-charge)))
   [padding-top (px 6.5)]
   [padding-bottom (px 6.5)]
   #;[line-height 1.54])
  ((desc (and (class op-singer-v2-songs)) (and (tag td) (class op-singer-v2-songs-nopadding)))
   [padding-left (px 0)])
  ((desc (and (class op-singer-v2-songs)) (and (tag td) (class op-singer-v2-songs-lpadding)))
   [padding-left (px 2)])
  ((and (class op-singer-v2-info))
   [position relative])
  ((and (class op-singer-v2-logo))
   [position absolute]
   [top (px 0)]
   [right (px 0)]
   [width (px 64)]
   [height (px 21)]
   #;[background-color transparent]
   #;[background-image url("//www.baidu.com/aladdin/img/music/logo.jpg")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (class op-singer-v2-musician-logo))
   [position absolute]
   [top (px 0)]
   [right (px 0)]
   [width (px 64)]
   [height (px 21)]
   #;[background-color transparent]
   #;[background-image url("//www.baidu.com/aladdin/img/music/musician_logo.jpg")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (class op-singer-v2-earth))
   [display inline-block]
   [width (px 12)]
   [height (px 14)]
   #;[background-color transparent]
   #;[background-image url("//www.baidu.com/aladdin/img/zx_mussong/earth.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((or (and (class op-singer-v2-songs-songname)) (and (class op-singer-v2-songs-songv2)))
   #;[white-space nowrap]
   #;[text-overflow ellipsis]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class op-singer-v2-songs-songname))
   [padding-left (px 10)])
  ((and (class op-singer-v2-songs-songv2))
   [width (px 165)])
  ((and (class op-singer-v2-hot1))
   [width (px 100)]
   [position relative]
   [height (px 6)]
   #;[background-color rgb(255, 255, 255)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class op-singer-v2-hot2))
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [height (% 100)]
   #;[background-color rgb(229, 229, 229)])
  ((and (class op-singer-v2-mv))
   [position relative]
   [top (px 2)])
  ((and (class op-singer-v2-icon-piao))
   [float left]
   [margin-top (px 5)]
   [width (px 14)]
   [height (px 14)]
   #;[background-color transparent]
   #;[background-image url("//www.baidu.com/aladdin/img/music/piao.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[vertical-align text-bottom])
  ((and (class opui-music-icon))
   #;[background-color transparent]
   #;[background-image url("//www.baidu.com/aladdin/other/base/icon_music6.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [height (px 17)]
   [width (px 18)]
   [display inline-block]
   #;[vertical-align text-bottom]
   #;[font-style normal]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class opui-music-icon-download-gray))
   #;[background-position -212px 0px]
   [height (px 18)])
  ((and (class opui-music-icon-lrc-gray))
   #;[background-position -184px 0px]
   [height (px 18)])
  ((and (class opui-music-icon-play-gray))
   #;[background-position -156px 0px]
   [height (px 18)])
  ((and (id ala_img_report))
   [display none]
   #;[font-size (px 13)])
  ((and (id ala_img_pics))
   [position relative])
  ((desc (and (id ala_img_pics)) (and (tag input)))
   [position absolute]
   [display none]
   [bottom (px 3)]
   [right (px 3)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(204, 204, 204)]
   #;[border-right-color rgb(204, 204, 204)]
   #;[border-bottom-color rgb(204, 204, 204)]
   #;[border-left-color rgb(204, 204, 204)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(250, 250, 250)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [width (px 36)]
   [height (px 23)]
   [padding-top (px 0)]
   [padding-right (px 4)]
   [padding-bottom (px 0)]
   [padding-left (px 4)]
   [text-align center]
   #;[cursor pointer]
   #;[opacity 0.8]
   #;[white-space nowrap])
  ((and (id ala_img_bigpic))
   [display inline-block]
   [position relative]
   [float left]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[vertical-align middle]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color])
  ((and (id ala_img_hoverview))
   [position absolute]
   [display none]
   [width (px 0)]
   [height (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   #;[box-shadow (px 0)])
  ((and (class opr-recommends-merge-imgtext))
   [display block])
  ((and (class opr-recommends-merge-hide))
   [display none])
  ((and (class opr-recommends-merge-p))
   [position relative])
  ((and (class opr-recommends-merge-item))
   [text-align center])
  ((and (class opr-recommends-merge-mask))
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [width (% 100)]
   #;[background-color transparent]
   #;[background-image radial-gradient(closest-side at center center , rgba(255, 255, 255, 0), rgba(0, 0, 0, 0.03))]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (class opr-recommends-merge-layerbtn))
   [position absolute]
   [right (px 0)]
   [bottom (px 0)]
   [width 1.23em]
   [height 1.23em]
   #;[background-color transparent]
   #;[background-image url("//www.baidu.com/aladdin/img/right_recommends/layericon.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (class opr-recommends-merge-layer))
   [padding-top (px 4)]
   [padding-right (px 9)]
   [padding-bottom (px 4)]
   [padding-left (px 9)]
   [width (px 350)])
  ((and (class opr-recommends-merge-lastspan))
   [display none])
  ((and (class opr-recommends-merge-mbGap))
   [margin-bottom (px 28)])
  ((desc (and (class container_l)) (and (class opr-recommends-merge-lastspan)))
   [display block])
  ((desc (and (class container_l)) (and (class cr-content-narrow)) (and (class opr-recommends-merge-lastspan)))
   [display none])
  ((and (class opr-recommends-merge-dodge-wrap))
   [margin-bottom (px 24)]
   #;[font-size 1.1em])
  ((or (and (class opr-recommends-merge-p)) (and (class opr-recommends-merge-img)) (and (class opr-recommends-merge-mask)))
   [height (px 75)])
  ((or (desc (and (class opr-recommends-merge-item-vertical)) (and (class opr-recommends-merge-p))) (desc (and (class opr-recommends-merge-item-vertical)) (and (class opr-recommends-merge-img))))
   [height (px 100)])
  ((and (class op_img_content))
   [position relative]
   [width (px 538)])
  ((and (id swfsocketdiv)) :style
   [height (px 0)]
   [width (px 0)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (id swfEveryCookieWrap)) :style
   [width (px 0)]
   [height (px 0)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (id wrapper)) :style
   [display block])
  ((and (id quickdelete)) :style
   [top (px 0)]
   [right (px 0)]
   [display block])
  ((and (id wrapper_wrapper)) :style
   [display block])
  ((and (id con-ar)) :style
   [position static])
  ((and (id e10001)) :style
   [text-align right])
  ((and (id e10002)) :style
   [top (px -40)])
  ((and (id e10003)) :style
   [display inline-block])
  ((and (id e10004)) :style
   [display none])
  ((and (id e10005)) :style
   [display none])
  ((and (id e10006)) :style
   [height (px 75)])
  ((and (id e10007)) :style
   [height (px 75)])
  ((and (id e10012)) :style
   [display none])
  ((and (id e10017)) :style
   [display none])
  ((and (id e10018)) :style
   [display none])
  ((and (id e10019)) :style
   [display none])
  ((and (id e10020)) :style
   [display none])
  ((and (id e10025)) :style
   [display none])
  ((and (id ala_img_results)) :style
   [width (px 538)])
  ((and (id ala_img_pics)) :style
   [width (px 538)])
  ((and (id e10026)) :style
   [display inline-block]
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[vertical-align middle]
   #;[outline-width medium]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   [margin-left (px 0)]
   [width (px 140)]
   [height (px 105)])
  ((and (id e10027)) :style
   [height (px 105)]
   [width (px 141)]
   [margin-left (px 0)])
  ((and (id e10028)) :style
   [height (px 105)]
   [width (px 141)]
   [margin-left (px 0)])
  ((and (id e10029)) :style
   [display inline-block]
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[vertical-align middle]
   #;[outline-width medium]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   [margin-left (px 0)]
   [width (px 80)]
   [height (px 105)])
  ((and (id e10030)) :style
   [height (px 105)]
   [width (px 82)]
   [margin-left (px -1)])
  ((and (id e10031)) :style
   [height (px 105)]
   [width (px 82)]
   [margin-left (px -1)])
  ((and (id e10032)) :style
   [display inline-block]
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[vertical-align middle]
   #;[outline-width medium]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   [margin-left (px 0)]
   [width (px 162)]
   [height (px 105)])
  ((and (id e10033)) :style
   [height (px 105)]
   [width (px 164)]
   [margin-left (px -1)])
  ((and (id e10034)) :style
   [height (px 105)]
   [width (px 164)]
   [margin-left (px -1)])
  ((and (id e10035)) :style
   [display inline-block]
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[vertical-align middle]
   #;[outline-width medium]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   [margin-left (px 0)]
   [width (px 156)]
   [height (px 105)])
  ((and (id e10036)) :style
   [height (px 105)]
   [width (px 158)]
   [margin-left (px -1)])
  ((and (id e10037)) :style
   [height (px 105)]
   [width (px 158)]
   [margin-left (px -1)])
  ((and (id e10038)) :style
   [display none])
  ((and (id e10043)) :style
   #;[clear both]
   [height (px 0)])
  ((and (id help)) :style
   [float left]
   [padding-left (px 121)])
  ((and (id fxdriver-screenshot-canvas)) :style
   [display none]))

(define-document (doc-1 #:width 1728 #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 1728 :h (/ 60373 30)]
   ([BLOCK :tag BODY :x 0 :y 0 :w 1728 :h (/ 60373 30)]
    ([BLOCK :tag DIV :x 0 :y 0 :w 0 :h 0 :id swfsocketdiv]
     ([LINE]
      ([INLINE :tag OBJECT :id socketswf])))
    ([BLOCK :tag DIV :x 0 :y 0 :w 0 :h 0 :id swfEveryCookieWrap]
     ([LINE]
      ([INLINE :tag OBJECT :id sharedObjectBIDUPSID])))
    ([BLOCK :tag DIV :x 0 :y 0 :w 0 :h 0 :id swfsocketdiv])
    ([BLOCK :tag DIV :x 0 :y 0 :w 0 :h 0 :id swfEveryCookieWrap]
     ([BLOCK :tag DIV :x 0 :y 0 :w 0 :h 0 :id swfEveryCookie]))
    ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h (/ 60373 30) :id wrapper :class (wrapper_l)]
     ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 56 :id head]
      ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 55 :class (head_wrapper)]
       ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 55 :class (s_form)]
        ([BLOCK :tag DIV :x 10 :y 0 :w 1718 :h 0 :class (s_form_wrapper)]
         ([BLOCK :tag A :x 10 :y 7 :w 101 :h 35.8 :id result_logo]
          ([LINE]
           ([INLINE :tag IMG])))
         ([BLOCK :tag FORM :x 121 :y 11 :w 640 :h 35 :id form :class (fm)]
          ([MAGIC :tag SPAN :x 121 :y 11 :w 540 :h 34 :mt 0 :mr 0 :mb 0 :ml 0 :class (bg s_ipt_wr iptfocus quickdelete-wrap)]
           ([INLINE :tag INPUT :id kw :class (s_ipt)])
           ([BLOCK :tag A :x 629 :y 12 :w 32 :h 32 :id quickdelete :class (quickdelete)])
           ([BLOCK :tag A :x 629 :y 12 :w 32 :h 32 :id quickdelete :class (quickdelete)])
           ([BLOCK :tag A :x 629 :y 12 :w 32 :h 32 :id quickdelete :class (quickdelete)]))
          ([MAGIC :tag SPAN :x 661 :y 11 :w 100 :h 35 :mt 0 :mr 0 :mb 0 :ml 0 :class (bg s_btn_wr)]
           ([INLINE :tag INPUT :id su :class (bg s_btn)]))
          ([BLOCK :tag SPAN :x 761 :y 21 :w 0 :h 0 :class (tools)]))))
       ([BLOCK :tag DIV :x 1567 :y 21 :w 152 :h 16 :id u]
        ([ANON]
         ([LINE]
          ([INLINE :tag A :class (toindex)]
           ([TEXT :x 1574 :y 21 :w 48 :h 16]))
          ([INLINE :tag A :class (pf)]
           ([TEXT :x 1636 :y 21 :w 24 :h 16]))))
        ([MAGIC :tag I :x 1660 :y 22 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down)])
        ([ANON]
         ([LINE]
          ([INLINE :tag A :class (lb)]
           ([TEXT :x 1688 :y 21 :w 24 :h 16])))))))
     ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 93 :id s_tab :class (s_tab)]
      ([MAGIC :tag B :x 121 :y 55.5 :w 54 :h 38 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 133 :y 65.5 :w 30 :h 17]))
      ([MAGIC :tag A :x 175 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 188 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 229 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 242 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 283 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 296 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 337 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 350 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 391 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 404 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 445 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 458 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 499 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 512 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 553 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 566 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 607 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 616 :y 65.5 :w 36 :h 17])))
     ([BLOCK :tag DIV :x 0 :y 93 :w 1728 :h (/ 57583 30) :id wrapper_wrapper]
      ([BLOCK :tag DIV :x 0 :y 93 :w 1212 :h (/ 55093 30) :id container :class (container_l)]
       ([BLOCK :tag DIV :x 810 :y 138 :w 402 :h (/ 9994 15) :id content_right :class (cr-offset)]
        ([MAGIC :tag TABLE :x 828 :y 138 :w 351 :h (/ 9994 15) :mt 0 :mr 0 :mb 0 :ml 0]
         ([MAGIC :tag TBODY :x 828 :y 138 :w 351 :h (/ 9994 15) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TR :x 828 :y 138 :w 351 :h (/ 9994 15) :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 828 :y 138 :w 351 :h (/ 9994 15) :mt 0 :mr 0 :mb 0 :ml 0]
            ([BLOCK :tag DIV :x 828 :y 138 :w 351 :h (/ 9394 15) :id con-ar :class (result_hidden)]
             ([BLOCK :tag DIV :x 828 :y 138 :w 351 :h (/ 8704 15) :class (result-op xpath-log)]
              ([BLOCK :tag DIV :x 828 :y 138 :w 351 :h (/ 8704 15) :class (cr-content )]
               ([BLOCK :tag DIV :x 828 :y 138 :w 351 :h (/ 8704 15) :class (opr-recommends-merge-content)]
                ([BLOCK :tag DIV :x 828 :y 138 :w 351 :h (/ 271 15) :class (cr-title c-clearfix)]
                 ([BLOCK :tag A :x 1133 :y 138 :w 46 :h (/ 503 30) :class (cr-title-sub opr-recommends-merge-more-btn)]
                  ([ANON]
                   ([LINE]
                    ([INLINE :tag SPAN]
                     ([TEXT :x 1133 :y 137.9 :w 26 :h 17]))))
                  ([MAGIC :tag I :x 1165 :y 139.9 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 6 :class (c-icon c-icon-chevron-bottom c-gap-left-small)]))
                 ([ANON]
                  ([LINE]
                   ([INLINE :tag SPAN]
                    ([TEXT :x 828 :y (/ 4171 30) :w 60 :h 17])))))
                ([BLOCK :tag DIV :x 828 :y (/ 2491 15) :w 351 :h 140 :class (opr-recommends-merge-panel opr-recommends-merge-mbGap)]
                 ([BLOCK :tag DIV :x 828 :y (/ 2491 15) :w 351 :h 140 :class (c-row c-gap-top)]
                  ([BLOCK :tag DIV :x 828 :y (/ 2491 15) :w 75 :h 140 :class (c-span4  opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 828 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 828 :y (/ 2491 15) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 828 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 828 :y (/ 3691 15) :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 839.5 :y (/ 7427 30) :w 52 :h 17]))))
                   ([BLOCK :tag DIV :x 828 :y (/ 3193 12) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 828 :y (/ 3193 12) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 920 :y (/ 2491 15) :w 75 :h 140 :class (c-span4  opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 920 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 920 :y (/ 2491 15) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 920 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 920 :y (/ 3691 15) :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 931.5 :y (/ 7427 30) :w 52 :h 17]))))
                   ([BLOCK :tag DIV :x 920 :y (/ 3193 12) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 920 :y (/ 3193 12) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 1012 :y (/ 2491 15) :w 75 :h 140 :class (c-span4  c-span-last-s opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 1012 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 1012 :y (/ 2491 15) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 1012 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 1012 :y (/ 3691 15) :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 1023.5 :y (/ 7427 30) :w 52 :h 17]))))
                   ([BLOCK :tag DIV :x 1012 :y (/ 3193 12) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 1012 :y (/ 3193 12) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 1104 :y (/ 2491 15) :w 75 :h 140 :class (c-span4  c-span-last opr-recommends-merge-lastspan opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 1104 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 1104 :y (/ 2491 15) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 1104 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 1104 :y (/ 3691 15) :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 1122 :y (/ 7427 30) :w 39 :h 17]))))
                   ([BLOCK :tag DIV :x 1104 :y (/ 3193 12) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 1104 :y (/ 3193 12) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))))
                ([BLOCK :tag DIV :x 828 :y (/ 4009 12) :w 351 :h (/ 271 15) :class (cr-title c-clearfix)]
                 ([BLOCK :tag A :x 1133 :y (/ 4009 12) :w 46 :h (/ 503 30) :class (cr-title-sub opr-recommends-merge-more-btn)]
                  ([ANON]
                   ([LINE]
                    ([INLINE :tag SPAN]
                     ([TEXT :x 1133 :y (/ 10019 30) :w 26 :h 17]))))
                  ([MAGIC :tag I :x 1165 :y (/ 10079 30) :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 6 :class (c-icon c-icon-chevron-bottom c-gap-left-small)]))
                 ([ANON]
                  ([LINE]
                   ([INLINE :tag SPAN]
                    ([TEXT :x 828 :y 335.1 :w 90 :h 17])))))
                ([BLOCK :tag DIV :x 828 :y 362.15 :w 351 :h 140 :class (opr-recommends-merge-panel opr-recommends-merge-mbGap)]
                 ([BLOCK :tag DIV :x 828 :y 362.15 :w 351 :h 140 :class (c-row c-gap-top)]
                  ([BLOCK :tag DIV :x 828 :y 362.15 :w 75 :h 140 :class (c-span4  opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 828 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 828 :y 362.15 :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 828 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 828 :y 442.15 :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 852.5 :y 443.65 :w 26 :h 17]))))
                   ([BLOCK :tag DIV :x 828 :y (/ 2773 6) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 828 :y (/ 2773 6) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 920 :y 362.15 :w 75 :h 140 :class (c-span4  opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 920 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 920 :y 362.15 :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 920 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 920 :y 442.15 :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 925 :y 443.65 :w 65 :h 17]))))
                   ([BLOCK :tag DIV :x 920 :y (/ 2773 6) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 920 :y (/ 2773 6) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 1012 :y 362.15 :w 75 :h 140 :class (c-span4  c-span-last-s opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 1012 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 1012 :y 362.15 :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 1012 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 1012 :y 442.15 :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 1030 :y 443.65 :w 39 :h 17]))))
                   ([BLOCK :tag DIV :x 1012 :y (/ 2773 6) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 1012 :y (/ 2773 6) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 1104 :y 362.15 :w 75 :h 140 :class (c-span4  c-span-last opr-recommends-merge-lastspan opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 1104 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 1104 :y 362.15 :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 1104 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 1104 :y 442.15 :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 1115 :y 443.65 :w 53 :h 17]))))
                   ([BLOCK :tag DIV :x 1104 :y (/ 2773 6) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 1104 :y (/ 2773 6) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))))
                ([BLOCK :tag DIV :x 828 :y (/ 3181 6) :w 351 :h (/ 271 15) :class (cr-title c-clearfix)]
                 ([BLOCK :tag A :x 1133 :y (/ 3181 6) :w 46 :h (/ 503 30) :class (cr-title-sub opr-recommends-merge-more-btn)]
                  ([ANON]
                   ([LINE]
                    ([INLINE :tag SPAN]
                     ([TEXT :x 1133 :y 530.05 :w 26 :h 17]))))
                  ([MAGIC :tag I :x 1165 :y 532.05 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 6 :class (c-icon c-icon-chevron-bottom c-gap-left-small)]))
                 ([ANON]
                  ([LINE]
                   ([INLINE :tag SPAN]
                    ([TEXT :x 828 :y 531.2 :w 75 :h 17])))))
                ([BLOCK :tag DIV :x 828 :y (/ 16747 30) :w 351 :h (/ 4801 30) :class (opr-recommends-merge-panel)]
                 ([BLOCK :tag DIV :x 828 :y (/ 16747 30) :w 351 :h (/ 4801 30) :class (c-row c-gap-top)]
                  ([BLOCK :tag DIV :x 828 :y (/ 16747 30) :w 75 :h (/ 4801 30) :class (c-span4  opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 828 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 828 :y (/ 16747 30) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 828 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 828 :y (/ 19147 30) :w 75 :h (/ 1201 30) :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 833 :y (/ 9596 15) :w 65 :h 17])))
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 852.5 :y 659.75 :w 26 :h 17]))))
                   ([BLOCK :tag DIV :x 828 :y (/ 10174 15) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 828 :y (/ 10174 15) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 920 :y (/ 16747 30) :w 75 :h 140 :class (c-span4  opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 920 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 920 :y (/ 16747 30) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 920 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 920 :y (/ 19147 30) :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 931.5 :y (/ 9596 15) :w 52 :h 17]))))
                   ([BLOCK :tag DIV :x 920 :y 658.25 :w 75 :h 40]
                    ([BLOCK :tag IMG :x 920 :y 658.25 :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 1012 :y (/ 16747 30) :w 75 :h (/ 4801 30) :class (c-span4  c-span-last-s opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 1012 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 1012 :y (/ 16747 30) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 1012 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 1012 :y (/ 19147 30) :w 75 :h (/ 1201 30) :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 1017 :y (/ 9596 15) :w 65 :h 17])))
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 1043 :y 659.75 :w 13 :h 17]))))
                   ([BLOCK :tag DIV :x 1012 :y (/ 10174 15) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 1012 :y (/ 10174 15) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 1104 :y (/ 16747 30) :w 75 :h 140 :class (c-span4  c-span-last opr-recommends-merge-lastspan opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 1104 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 1104 :y (/ 16747 30) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 1104 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 1104 :y (/ 19147 30) :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 1115.5 :y (/ 9596 15) :w 52 :h 17]))))
                   ([BLOCK :tag DIV :x 1104 :y 658.25 :w 75 :h 40]
                    ([BLOCK :tag IMG :x 1104 :y 658.25 :w 74 :h 40 :class (opr-recommends-merge-imgtext)]))))))))
             ([BLOCK :tag DIV :x 828 :y (/ 11194 15) :w 351 :h 18 :id e10001]
              ([LINE]
               ([INLINE :tag A :class (c-gray c-feedback)]
                ([TEXT :x 1107 :y (/ 11209 15) :w 72 :h 16])))))
            ([BLOCK :tag DIV :x 828 :y (/ 12064 15) :w 351 :h 0]))))))
       ([BLOCK :tag DIV :x 0 :y 93 :w 810 :h 40 :class (head_nums_cont_outer OP_LOG)]
        ([BLOCK :tag DIV :x 0 :y 53 :w 810 :h 84 :id e10002 :class (head_nums_cont_inner)]
         ([BLOCK :tag DIV :x 121 :y 53 :w 538 :h 42 :class (search_tool_conter)]
          ([BLOCK :tag SPAN :x 597 :y 53 :w 62 :h 42 :class (c-gap-left-samll search_tool_close)]
           ([MAGIC :tag I :x 597 :y 67 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon searchTool-up c-icon-chevron-top-gray-s)])
           ([ANON]
            ([LINE]
             ([TEXT :x 611 :y 66 :w 48 :h 16]))))
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :class (search_tool_la)]
             ([TEXT :x 121 :y 66 :w 48 :h 16]))))
          ([MAGIC :tag I :x 169 :y 67 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down)])
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :class (search_tool_tf c-gap-left)]
             ([TEXT :x 206 :y 66 :w 48 :h 16]))))
          ([MAGIC :tag I :x 254 :y 67 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down)])
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :class (search_tool_ft c-gap-left)]
             ([TEXT :x 291 :y 66 :w 84 :h 16]))))
          ([MAGIC :tag I :x 375 :y 67 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down)])
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :class (search_tool_si c-gap-left)]
             ([TEXT :x 412 :y 66 :w 60 :h 16]))))
          ([MAGIC :tag I :x 472 :y 67 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down)])
          ([ANON]
           ([LINE])))
         ([BLOCK :tag DIV :x 121 :y 95 :w 538 :h 42 :class (nums)]
          ([BLOCK :tag DIV :x 597 :y 95 :w 62 :h 42 :class (search_tool)]
           ([MAGIC :tag I :x 597 :y 109 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon searchTool-spanner c-icon-setting)])
           ([ANON]
            ([LINE]
             ([TEXT :x 611 :y 108 :w 48 :h 16]))))
          ([ANON]
           ([LINE]
            ([TEXT :x 121 :y 108 :w 199 :h 16]))))))
       ([BLOCK :tag DIV :x 0 :y 133 :w 661 :h (/ 47713 30) :id content_left]
        ([BLOCK :tag DIV :x 121 :y 138 :w 538 :h (/ 615 30) :class (hit_top_new)]
         ([BLOCK :tag DIV :x 121 :y 138 :w 538 :h (/ 615 30) :class (c-gap-bottom-small f13)]
          ([MAGIC :tag I :x 121 :y 139 :w 18 :h 18 :mt 0 :mr 6 :mb 0 :ml 0 :class (c-icon c-icon-bear-circle c-gap-right-small res-queryext-pos)])
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :class (c-gray)]
             ([INLINE :tag STRONG]
              ([TEXT :x 145 :y 140 :w 98 :h 17])
              ([INLINE :tag A]
               ([TEXT :x 243 :y 140 :w 56 :h 17]))))))))
        ([BLOCK :tag DIV :x 121 :y (/ 5175 30) :w 538 :h (/ 3986 15) :id 1 :class (result-op c-container xpath-log)]
         ([BLOCK :tag H3 :x 121 :y (/ 5175 30) :w 538 :h (/ 739 30) :class (t c-gap-bottom-small)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y (/ 529 3) :w 53 :h 17]))
            ([TEXT :x 174 :y (/ 526 3) :w 73 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y 202.15 :w 538 :h (/ 2533 12) :class (c-border)]
          ([BLOCK :tag DIV :x 131 :y 212.15 :w 518 :h (/ 2293 12) :class (op_dict_content)]
           ([BLOCK :tag DIV :x 131 :y 212.15 :w 518 :h 24 :class (op_dict3_readline c-clearfix)]
            ([BLOCK :tag DIV :x 131 :y 212.15 :w 317 :h 24 :class (op_dict3_read1)]
             ([MAGIC :tag TABLE :x 131 :y 212.15 :w 317 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (op_dict_table)]
              ([MAGIC :tag TBODY :x 131 :y 212.15 :w 317 :h 24 :mt 0 :mr 0 :mb 0 :ml 0]
               ([MAGIC :tag TR :x 131 :y 212.15 :w 317 :h 24 :mt 0 :mr 0 :mb 0 :ml 0]
                ([MAGIC :tag TD :x 131 :y 212.15 :w 95 :h 24 :mt 0 :mr 0 :mb 0 :ml 0]
                 ([BLOCK :tag SPAN :x 131 :y 212.15 :w 80 :h 24 :class (op_dict3_font24 op_dict3_marginRight)]
                  ([LINE]
                   ([TEXT :x 131 :y 210.65 :w 80 :h 27]))))
                ([MAGIC :tag TD :x 226 :y 212.15 :w 111 :h 24 :mt 0 :mr 0 :mb 0 :ml 0]
                 ([BLOCK :tag SPAN :x 226 :y 212.15 :w 14 :h 24 :class (op_dict3_font14 op_dict3_gap_small)]
                  ([LINE]
                   ([TEXT :x 226 :y 216.15 :w 14 :h 17])))
                 ([BLOCK :tag SPAN :x 247 :y 212.15 :w 61 :h 24 :class (op_dict3_font16 op_dict3_gap_small)]
                  ([LINE]
                   ([TEXT :x 247 :y 215.65 :w 61 :h 17])))
                 ([BLOCK :tag SPAN :x 315 :y 212.15 :w 22 :h 24]
                  ([BLOCK :tag A :x 315 :y 219.15 :w 14 :h 11 :class (op_dict3_how_read)])))
                ([MAGIC :tag TD :x 337 :y 212.15 :w 111 :h 24 :mt 0 :mr 0 :mb 0 :ml 0]
                 ([BLOCK :tag SPAN :x 337 :y 212.15 :w 14 :h 24 :class (op_dict3_font14 op_dict3_gap_small)]
                  ([LINE]
                   ([TEXT :x 337 :y 216.15 :w 14 :h 17])))
                 ([BLOCK :tag SPAN :x 358 :y 212.15 :w 61 :h 24 :class (op_dict3_font16 op_dict3_gap_small)]
                  ([LINE]
                   ([TEXT :x 358 :y 215.65 :w 61 :h 17])))
                 ([BLOCK :tag SPAN :x 426 :y 212.15 :w 22 :h 24]
                  ([BLOCK :tag A :x 426 :y 219.15 :w 14 :h 11 :class (op_dict3_how_read)]))))))))
           ([MAGIC :tag TABLE :x 131 :y 248.15 :w 103 :h 20 :mt 0 :mr 0 :mb 9 :ml 0 :class (op_dict3_english_result_table)]
            ([MAGIC :tag TBODY :x 131 :y 248.15 :w 103 :h 20 :mt 0 :mr 0 :mb 0 :ml 0]
             ([MAGIC :tag TR :x 131 :y 248.15 :w 103 :h 20 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TD :x 131 :y 248.15 :w 47 :h 20 :mt 0 :mr 0 :mb 0 :ml 0]
               ([BLOCK :tag SPAN :x 131 :y 248.15 :w 37 :h 20 :class (op_dict_text1 c-gap-right)]
                ([LINE]
                 ([TEXT :x 131 :y 250.65 :w 11 :h 15]))))
              ([MAGIC :tag TD :x 178 :y 248.15 :w 56 :h 20 :mt 0 :mr 0 :mb 0 :ml 0]
               ([BLOCK :tag SPAN :x 178 :y 248.15 :w 56 :h 20 :class (op_dict_text2)]
                ([LINE]
                 ([TEXT :x 178 :y 249.65 :w 56 :h 17])))))))
           ([MAGIC :tag TABLE :x 131 :y (/ 1663 6) :w 259 :h 22 :mt 0 :mr 0 :mb 9 :ml 0 :class (op_dict3_english_result_table op_dict3_else)]
            ([MAGIC :tag TBODY :x 131 :y (/ 1663 6) :w 259 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
             ([MAGIC :tag TR :x 131 :y (/ 1663 6) :w 259 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TD :x 131 :y (/ 1663 6) :w 47 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
               ([BLOCK :tag SPAN :x 131 :y (/ 1663 6) :w 37 :h 20 :class (op_dict_text1 c-gap-right)]
                ([LINE]
                 ([TEXT :x 131 :y (/ 836 3) :w 34 :h 17]))))
              ([MAGIC :tag TD :x 178 :y (/ 1663 6) :w 212 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
               ([BLOCK :tag SPAN :x 178 :y (/ 1663 6) :w 212 :h 22 :class (op_dict_text2 op_dict3_else_items)]
                ([MAGIC :tag SPAN :x 178 :y (/ 1663 6) :w 200 :h 20 :mt 0 :mr 12 :mb 2 :ml 0 :class (op_dict3_xingjinci)]
                 ([TEXT :x 178 :y (/ 836 3) :w 56 :h 17])
                 ([INLINE :tag A]
                  ([TEXT :x 234 :y (/ 839 3) :w 45 :h 15]))
                 ([TEXT :x 283 :y (/ 839 3) :w 4 :h 15])
                 ([INLINE :tag A]
                  ([TEXT :x 287 :y (/ 839 3) :w 38 :h 15]))
                 ([TEXT :x 329 :y (/ 839 3) :w 4 :h 15])
                 ([INLINE :tag A]
                  ([TEXT :x 333 :y (/ 839 3) :w 41 :h 15]))))))))
           ([BLOCK :tag P :x 131 :y (/ 3698 12) :w 518 :h 20 :class (op_dict3_morelink)]
            ([MAGIC :tag A :x 178 :y (/ 3698 12) :w 52 :h 20 :mt 0 :mr 12 :mb 0 :ml 0]
             ([TEXT :x 178 :y 309.7 :w 52 :h 17]))
            ([ANON]
             ([LINE]
              ([TEXT :x 242 :y 310.7 :w 4 :h 15])))
            ([MAGIC :tag A :x 246 :y (/ 3698 12) :w 52 :h 20 :mt 0 :mr 12 :mb 0 :ml 0]
             ([TEXT :x 246 :y 309.7 :w 52 :h 17])))
           ([BLOCK :tag DIV :x 131 :y 341.2 :w 518 :h (/ 1861 30) :class (op_dict3_extra)]
            ([BLOCK :tag DIV :x 131 :y 355.2 :w 518 :h (/ 1441 30) :class (op_dict3_extra_confused)]
             ([BLOCK :tag P :x 131 :y 355.2 :w 518 :h 20 :class (op_dict3_extra_confused_firstp)]
              ([LINE]
               ([TEXT :x 131 :y 356.7 :w 56 :h 17])))
             ([MAGIC :tag P :x 131 :y (/ 11377 30) :w 132 :h 20 :mt 0 :mr 6 :mb 4 :ml 0 :id e10003 :class (op_dict3_extra_confused_p)]
              ([MAGIC :tag SPAN :x 131 :y (/ 11377 30) :w 47 :h 20 :mt 0 :mr 4 :mb 0 :ml 0]
               ([INLINE :tag A]
                ([TEXT :x 131 :y 357.875 :w 47 :h 15])))
              ([TEXT :x 182 :y 357.875 :w 4 :h 15])
              ([MAGIC :tag SPAN :x 186 :y (/ 11377 30) :w 73 :h 20 :mt 0 :mr 4 :mb 0 :ml 0]
               ([TEXT :x 186 :y 356.875 :w 73 :h 17]))))))
          ([BLOCK :tag DIV :x 1727 :y (/ 12097 30) :w 1 :h 1 :class (op_dict_fmp_flash_div)]
           ([LINE]
            ([INLINE :tag EMBED :id op_dict_fmp_flash_1454705471151]))))
         ([BLOCK :tag DIV :x 121 :y (/ 12547 30) :w 538 :h 20 :class (c-gap-top-small)]
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :class (c-showurl)]
             ([TEXT :x 121 :y (/ 6311 15) :w 95 :h 15]))))
          ([MAGIC :tag I :x 216 :y (/ 6326 15) :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :id tools_12991445509015342431_1 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))))))
        ([BLOCK :tag DIV :x 121 :y 452.25 :w 538 :h 121.625 :id 2 :class (result-op c-container xpath-log)]
         ([BLOCK :tag H3 :x 121 :y 452.25 :w 538 :h (/ 739 30) :class (t c-gap-bottom-small)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y (/ 6841 15) :w 57 :h 17]))
            ([TEXT :x 178 :y (/ 6826 15) :w 73 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y 481.9 :w 538 :h (/ 1201 12) :class (c-row)]
          ([BLOCK :tag DIV :x 121 :y 481.9 :w 535 :h (/ 1201 12) :class (c-span24 c-span-last)]
           ([BLOCK :tag P :x 121 :y 481.9 :w 535 :h 20]
            ([LINE]
             ([TEXT :x 121 :y (/ 7251 15) :w 127 :h 17])))
           ([BLOCK :tag P :x 121 :y 501.9 :w 535 :h 20]
            ([LINE]
             ([INLINE :tag SPAN :class (c-gap-right)]
              ([TEXT :x 121 :y 503.4 :w 91 :h 17]))))
           ([BLOCK :tag P :x 121 :y (/ 6263 12) :w 535 :h 20]
            ([LINE]
             ([INLINE :tag EM]
              ([TEXT :x 121 :y (/ 6293 12) :w 47 :h 15]))
             ([TEXT :x 168 :y (/ 6281 12) :w 327 :h 17])))
           ([BLOCK :tag P :x 121 :y (/ 8129 15) :w 535 :h 20]
            ([LINE]
             ([INLINE :tag A :class (c-gap-right-small op-se-listen-recommend)]
              ([TEXT :x 121 :y (/ 16303 30) :w 52 :h 17]))
             ([TEXT :x 179 :y (/ 16333 30) :w 4 :h 15])
             ([INLINE :tag A :class (c-gap-right-small op-se-listen-recommend)]
              ([TEXT :x 183 :y (/ 16303 30) :w 52 :h 17]))))
           ([BLOCK :tag P :x 121 :y 561.95 :w 535 :h 20 :class ( op-bk-polysemy-move)]
            ([ANON]
             ([LINE]
              ([INLINE :tag SPAN :class (c-showurl)]
               ([TEXT :x 121 :y 564.45 :w 103 :h 15]))))
            ([MAGIC :tag I :x 224 :y 565.45 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
            ([ANON]
             ([LINE]
              ([INLINE :tag SPAN :id tools_13337321428023985492_2 :class (c-tools)]
               ([INLINE :tag A :class (c-tip-icon)]))))))))
        ([BLOCK :tag DIV :x 121 :y (/ 17879 30) :w 538 :h 109.7 :id 3 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y (/ 17879 30) :w 538 :h (/ 739 30) :class (t c-title-en)]
          ([LINE]
           ([INLINE :tag A]
            ([TEXT :x 121 :y (/ 17993 30) :w 45 :h 17])
            ([INLINE :tag EM]
             ([TEXT :x 166 :y (/ 17993 30) :w 57 :h 17]))
            ([TEXT :x 223 :y (/ 17993 30) :w 307 :h 17]))))
         ([BLOCK :tag DIV :x 121 :y 625.6 :w 538 :h (/ 1201 15) :class (c-row c-gap-top-small)]
          ([BLOCK :tag DIV :x 121 :y 625.6 :w 121 :h 75 :class (general_image_pic c-span6)]
           ([BLOCK :tag A :x 121 :y 625.6 :w 121 :h 75 :id e10006 :class (c-img6)]
            ([BLOCK :tag IMG :x 121 :y 625.6 :w 121 :h 75 :id e10007 :class (c-img c-img6)])))
          ([BLOCK :tag DIV :x 259 :y 625.6 :w 397 :h (/ 1201 15) :class (c-span18 c-span-last)]
           ([BLOCK :tag DIV :x 259 :y 625.6 :w 397 :h 20 :class (m)]
            ([LINE]
             ([TEXT :x 259 :y 627.1 :w 186 :h 17])
             ([INLINE :tag A :class (m)]
              ([TEXT :x 445 :y 627.1 :w 52 :h 17]))))
           ([BLOCK :tag DIV :x 259 :y (/ 9684 15) :w 397 :h (/ 1201 30) :class (c-abstract c-abstract-en)]
            ([LINE]
             ([TEXT :x 259 :y 648.1 :w 38 :h 15])
             ([INLINE :tag EM]
              ([TEXT :x 297 :y 648.1 :w 47 :h 15]))
             ([TEXT :x 344 :y 648.1 :w 306 :h 15]))
            ([LINE]
             ([TEXT :x 259 :y (/ 10022 15) :w 325 :h 15])))
           ([BLOCK :tag DIV :x 259 :y 685.65 :w 397 :h 20 :class (f13)]
            ([ANON]
             ([LINE]
              ([INLINE :tag A :id e10008 :class (c-showurl)]
               ([TEXT :x 259 :y 688.15 :w 139 :h 15]))))
            ([MAGIC :tag I :x 398 :y 689.15 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
            ([ANON]
             ([LINE]
              ([INLINE :tag DIV :id tools_5691720681783251077_3 :class (c-tools)]
               ([INLINE :tag A :class (c-tip-icon)]))))
            ([MAGIC :tag SPAN :x 412 :y 685.65 :w 0 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icons-outer)]
             ([INLINE :tag SPAN :class (c-icons-inner)]))
            ([ANON]
             ([LINE]
              ([TEXT :x 412 :y 688.15 :w 12 :h 15])
              ([INLINE :tag A :class (m)]
               ([TEXT :x 424 :y 687.15 :w 52 :h 17]))))))))
        ([BLOCK :tag DIV :x 121 :y (/ 2159 3) :w 538 :h 85.7 :id 4 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y (/ 2159 3) :w 538 :h (/ 739 30) :class (t)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y (/ 21705 30) :w 53 :h 17]))
            ([TEXT :x 174 :y (/ 21675 30) :w 89 :h 20])
            ([INLINE :tag EM]
             ([TEXT :x 263 :y (/ 21705 30) :w 53 :h 17]))
            ([TEXT :x 316 :y (/ 21675 30) :w 290 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y 745.3 :w 538 :h (/ 1201 30) :class (c-abstract)]
          ([LINE]
           ([TEXT :x 121 :y 746.8 :w 173 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 294 :y 747.8 :w 45 :h 15]))
           ([TEXT :x 339 :y 746.8 :w 69 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 408 :y 747.8 :w 45 :h 15]))
           ([TEXT :x 453 :y 746.8 :w 69 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 522 :y 747.8 :w 45 :h 15]))
           ([TEXT :x 567 :y 746.8 :w 43 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 610 :y 747.8 :w 45 :h 15])))
          ([LINE]
           ([TEXT :x 121 :y (/ 9202 12) :w 56 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 177 :y (/ 9214 12) :w 45 :h 15]))
           ([TEXT :x 222 :y (/ 9202 12) :w 56 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 278 :y (/ 9214 12) :w 45 :h 15]))
           ([TEXT :x 323 :y (/ 9202 12) :w 117 :h 17])))
         ([BLOCK :tag DIV :x 121 :y (/ 2356 3) :w 538 :h 20 :class (f13)]
          ([ANON]
           ([LINE]
            ([INLINE :tag A :id e10010 :class (c-showurl)]
             ([TEXT :x 121 :y (/ 4727 6) :w 90 :h 15])
             ([INLINE :tag B]
              ([TEXT :x 211 :y (/ 4727 6) :w 45 :h 15]))
             ([TEXT :x 256 :y (/ 4727 6) :w 4 :h 15]))))
          ([MAGIC :tag I :x 260 :y (/ 4733 6) :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
          ([ANON]
           ([LINE]
            ([INLINE :tag DIV :id tools_3681082031080138747_4 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))))
          ([MAGIC :tag SPAN :x 274 :y (/ 2356 3) :w 24 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icons-outer)]
           ([INLINE :tag SPAN :class (c-icons-inner)]
            ([MAGIC :tag SPAN :x 273 :y (/ 4727 6) :w 1 :h 12 :mt 0 :mr 3 :mb 0 :ml 3 :class (c-vline)])
            ([INLINE :tag SPAN :class (c-trust-as vstar)]
             ([MAGIC :tag A :x 277 :y (/ 4721 6) :w 21 :h 16 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-v c-icon-v1)]))))
          ([ANON]
           ([LINE]
            ([TEXT :x 298 :y (/ 4727 6) :w 12 :h 15])
            ([INLINE :tag A :class (m)]
             ([TEXT :x 310 :y (/ 4721 6) :w 52 :h 17]))
            ([INLINE :tag SPAN]
             ([TEXT :x 362 :y (/ 4727 6) :w 12 :h 15])
             ([INLINE :tag A :class (m)]
              ([TEXT :x 374 :y (/ 4721 6) :w 52 :h 17])))))))
        ([BLOCK :tag DIV :x 121 :y 819.35 :w 538 :h 302.7 :id 5 :class (result-op c-container)]
         ([BLOCK :tag H3 :x 121 :y 819.35 :w 538 :h (/ 739 30) :class (t c-gap-bottom-small)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y (/ 4939 6) :w 53 :h 17]))
            ([TEXT :x 174 :y (/ 4933 6) :w 178 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y 863 :w 538 :h (/ 7591 30) :class (c-tabs test-tabs)]
          ([BLOCK :tag DIV :x 121 :y 863 :w 538 :h 28 :class (c-tabs-nav)]
           ([BLOCK :tag DIV :x 121 :y 863 :w 538 :h 28 :class (c-tabs-nav-view)]
            ([BLOCK :tag UL :x 121 :y 863 :w 525 :h 28 :class (c-tabs-nav-more)]
             ([MAGIC :tag LI :x 121 :y 863 :w 102 :h 28 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-tabs-nav-li OP_LOG_BTN c-tabs-nav-selected)]
              ([MAGIC :tag B :x 137 :y (/ 25635 30) :w 18 :h 17 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-baidu)])
              ([TEXT :x 155 :y (/ 25665 30) :w 52 :h 17]))
             ([MAGIC :tag LI :x 223 :y 857 :w 2 :h 16 :mt 0 :mr 0 :mb 4 :ml 0 :id e10013 :class (c-tabs-nav-sep)])
             ([MAGIC :tag LI :x 225 :y 863 :w 102 :h 28 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-tabs-nav-li OP_LOG_BTN)]
              ([MAGIC :tag B :x 241 :y (/ 25635 30) :w 18 :h 17 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-xiami)])
              ([TEXT :x 259 :y (/ 25665 30) :w 52 :h 17]))
             ([MAGIC :tag LI :x 327 :y 857 :w 2 :h 16 :mt 0 :mr 0 :mb 4 :ml 0 :id e10014 :class (c-tabs-nav-sep)])
             ([MAGIC :tag LI :x 329 :y 863 :w 102 :h 28 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-tabs-nav-li OP_LOG_BTN)]
              ([MAGIC :tag B :x 345 :y (/ 25635 30) :w 18 :h 17 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-kuwo)])
              ([TEXT :x 363 :y (/ 25665 30) :w 52 :h 17]))
             ([MAGIC :tag LI :x 431 :y 857 :w 2 :h 16 :mt 0 :mr 0 :mb 4 :ml 0 :id e10015 :class (c-tabs-nav-sep)])
             ([MAGIC :tag LI :x 433 :y 863 :w 115 :h 28 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-tabs-nav-li OP_LOG_BTN)]
              ([MAGIC :tag B :x 449 :y (/ 25635 30) :w 18 :h 17 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-wangyi)])
              ([TEXT :x 467 :y (/ 25665 30) :w 65 :h 17]))
             ([MAGIC :tag LI :x 548 :y 857 :w 2 :h 16 :mt 0 :mr 0 :mb 4 :ml 0 :id e10016 :class (c-tabs-nav-sep)])
             ([MAGIC :tag LI :x 550 :y 863 :w 96 :h 28 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-tabs-nav-li OP_LOG_BTN)]
              ([MAGIC :tag B :x 566 :y (/ 25635 30) :w 18 :h 17 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-qq)])
              ([TEXT :x 584 :y (/ 25665 30) :w 46 :h 17])))))
          ([BLOCK :tag DIV :x 121 :y 877 :w 538 :h 225 :class (c-tabs-content)]
           ([MAGIC :tag TABLE :x 121 :y 877 :w 538 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-table op-singer-v2-songs)]
            ([MAGIC :tag TBODY :x 121 :y 877 :w 538 :h 200 :mt 0 :mr 0 :mb 0 :ml 0]
             ([MAGIC :tag TR :x 121 :y 877 :w 538 :h 35 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-table-nohihead)]
              ([MAGIC :tag TH :x 121 :y 877 :w 24 :h 35 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag INPUT :class (op-singer-v2-checkall)]))
              ([MAGIC :tag TH :x 145 :y 877 :w 64 :h 35 :mt 0 :mr 0 :mb 0 :ml 0]
               ([TEXT :x 155 :y (/ 26565 30) :w 26 :h 17]))
              ([MAGIC :tag TH :x 209 :y 877 :w 312 :h 35 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon op-singer-v2-songs-iconpl)]
               ([MAGIC :tag A :x 222 :y 881 :w 127 :h 26 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-btn op-singer-v2-select-btn)]
                ([BLOCK :tag I :x 237 :y 887 :w 14 :h 14 :class (c-icon c-icon-play-blue c-gap-icon-right-small op-singer-v2-btn-icon)])
                ([TEXT :x 256 :y 886 :w 78 :h 17])))
              ([MAGIC :tag TH :x 521 :y 877 :w 46 :h 35 :mt 0 :mr 0 :mb 0 :ml 0]
               ([TEXT :x 531 :y (/ 26565 30) :w 26 :h 17]))
              ([MAGIC :tag TH :x 567 :y 877 :w 46 :h 35 :mt 0 :mr 0 :mb 0 :ml 0]
               ([TEXT :x 577 :y (/ 26565 30) :w 26 :h 17]))
              ([MAGIC :tag TH :x 613 :y 877 :w 46 :h 35 :mt 0 :mr 0 :mb 0 :ml 0]
               ([TEXT :x 623 :y (/ 26565 30) :w 26 :h 17])))
             ([MAGIC :tag TR :x 121 :y 912 :w 538 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TD :x 121 :y 912 :w 24 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag INPUT :class (op-singer-v2-check)]))
              ([MAGIC :tag TD :x 145 :y 912 :w 36 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag SPAN :class (c-gray)]
                ([TEXT :x 155 :y 921 :w 14 :h 15])))
              ([MAGIC :tag TD :x 181 :y 912 :w 28 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([MAGIC :tag SPAN :x 191 :y (/ 5521 6) :w 12 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-earth)]))
              ([MAGIC :tag TD :x 209 :y 912 :w 134 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-lpadding)]
               ([BLOCK :tag DIV :x 211 :y 921.35 :w 131 :h 14.3 :class (op-singer-v2-songs-songname)]
                ([LINE]
                 ([INLINE :tag A]
                  ([TEXT :x 221 :y 921 :w 14 :h 15])))))
              ([MAGIC :tag TD :x 343 :y 912 :w 181 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-nopadding)]
               ([BLOCK :tag DIV :x 343 :y 921.35 :w 165 :h 14.3 :class (op-singer-v2-songs-songv2)]
                ([LINE]
                 ([INLINE :tag A :class (op-se-listen-recommend)]
                  ([TEXT :x 343 :y 920 :w 140 :h 17])))))
              ([MAGIC :tag TD :x 521 :y 912 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 531 :y 919 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-play-circle)]))
              ([MAGIC :tag TD :x 567 :y 912 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag SPAN :x 577 :y 919 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-lrc-gray)]))
              ([MAGIC :tag TD :x 613 :y 912 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 623 :y 919 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-download op-se-listen-recommend)])))
             ([MAGIC :tag TR :x 121 :y 945 :w 538 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TD :x 121 :y 945 :w 24 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag INPUT :class (op-singer-v2-check)]))
              ([MAGIC :tag TD :x 145 :y 945 :w 36 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag SPAN :class (c-gray)]
                ([TEXT :x 155 :y 954 :w 14 :h 15])))
              ([MAGIC :tag TD :x 181 :y 945 :w 28 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([MAGIC :tag SPAN :x 191 :y (/ 5719 6) :w 12 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-earth)]))
              ([MAGIC :tag TD :x 209 :y 945 :w 134 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-lpadding)]
               ([BLOCK :tag DIV :x 211 :y 954.35 :w 131 :h 14.3 :class (op-singer-v2-songs-songname)]
                ([LINE]
                 ([INLINE :tag A]
                  ([TEXT :x 221 :y 954 :w 112 :h 15])))))
              ([MAGIC :tag TD :x 343 :y 945 :w 181 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-nopadding)]
               ([BLOCK :tag DIV :x 343 :y 954.35 :w 165 :h 14.3 :class (op-singer-v2-songs-songv2)]
                ([LINE]
                 ([INLINE :tag A :class (op-se-listen-recommend)]
                  ([TEXT :x 343 :y 953 :w 147 :h 17])))))
              ([MAGIC :tag TD :x 521 :y 945 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 531 :y 952 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-play-circle)]))
              ([MAGIC :tag TD :x 567 :y 945 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 577 :y 952 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-lyric)]))
              ([MAGIC :tag TD :x 613 :y 945 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 623 :y 952 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-download op-se-listen-recommend)])))
             ([MAGIC :tag TR :x 121 :y 978 :w 538 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TD :x 121 :y 978 :w 24 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag INPUT :class (op-singer-v2-check)]))
              ([MAGIC :tag TD :x 145 :y 978 :w 36 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag SPAN :class (c-gray)]
                ([TEXT :x 155 :y 987 :w 14 :h 15])))
              ([MAGIC :tag TD :x 181 :y 978 :w 28 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([MAGIC :tag SPAN :x 191 :y (/ 5917 6) :w 12 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-earth)]))
              ([MAGIC :tag TD :x 209 :y 978 :w 134 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-lpadding)]
               ([BLOCK :tag DIV :x 211 :y 987.35 :w 131 :h 14.3 :class (op-singer-v2-songs-songname)]
                ([LINE]
                 ([INLINE :tag A]
                  ([TEXT :x 221 :y 987 :w 70 :h 15])))))
              ([MAGIC :tag TD :x 343 :y 978 :w 181 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-nopadding)]
               ([BLOCK :tag DIV :x 343 :y 987.35 :w 165 :h 14.3 :class (op-singer-v2-songs-songv2)]
                ([LINE]
                 ([INLINE :tag A :class (op-se-listen-recommend)]
                  ([TEXT :x 343 :y 986 :w 75 :h 17])))))
              ([MAGIC :tag TD :x 521 :y 978 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 531 :y 985 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-play-circle)]))
              ([MAGIC :tag TD :x 567 :y 978 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag SPAN :x 577 :y 985 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-lrc-gray)]))
              ([MAGIC :tag TD :x 613 :y 978 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 623 :y 985 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-download op-se-listen-recommend)])))
             ([MAGIC :tag TR :x 121 :y 1011 :w 538 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TD :x 121 :y 1011 :w 24 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag INPUT :class (op-singer-v2-check)]))
              ([MAGIC :tag TD :x 145 :y 1011 :w 36 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag SPAN :class (c-gray)]
                ([TEXT :x 155 :y 1020 :w 14 :h 15])))
              ([MAGIC :tag TD :x 181 :y 1011 :w 28 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([MAGIC :tag SPAN :x 191 :y (/ 6115 6) :w 12 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-earth)]))
              ([MAGIC :tag TD :x 209 :y 1011 :w 134 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-lpadding)]
               ([BLOCK :tag DIV :x 211 :y 1020.35 :w 131 :h 14.3 :class (op-singer-v2-songs-songname)]
                ([LINE]
                 ([INLINE :tag A]
                  ([TEXT :x 221 :y 1020 :w 63 :h 15])))))
              ([MAGIC :tag TD :x 343 :y 1011 :w 181 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-nopadding)]
               ([TEXT :x 343 :y 1020 :w 4 :h 15]))
              ([MAGIC :tag TD :x 521 :y 1011 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 531 :y 1018 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-play-circle)]))
              ([MAGIC :tag TD :x 567 :y 1011 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag SPAN :x 577 :y 1018 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-lrc-gray)]))
              ([MAGIC :tag TD :x 613 :y 1011 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 623 :y 1018 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-download op-se-listen-recommend)])))
             ([MAGIC :tag TR :x 121 :y 1044 :w 538 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TD :x 121 :y 1044 :w 24 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag INPUT :class (op-singer-v2-check)]))
              ([MAGIC :tag TD :x 145 :y 1044 :w 36 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag SPAN :class (c-gray)]
                ([TEXT :x 155 :y 1053 :w 14 :h 15])))
              ([MAGIC :tag TD :x 181 :y 1044 :w 28 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([MAGIC :tag SPAN :x 191 :y (/ 6313 6) :w 12 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-earth)]))
              ([MAGIC :tag TD :x 209 :y 1044 :w 134 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-lpadding)]
               ([BLOCK :tag DIV :x 211 :y 1053.35 :w 131 :h 14.3 :class (op-singer-v2-songs-songname)]
                ([LINE]
                 ([INLINE :tag A]
                  ([TEXT :x 221 :y 1053 :w 75 :h 15])))))
              ([MAGIC :tag TD :x 343 :y 1044 :w 181 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-nopadding)]
               ([BLOCK :tag DIV :x 343 :y 1053.35 :w 165 :h 14.3 :class (op-singer-v2-songs-songv2)]
                ([LINE]
                 ([INLINE :tag A :class (op-se-listen-recommend)]
                  ([TEXT :x 343 :y 1052 :w 129 :h 17])))))
              ([MAGIC :tag TD :x 521 :y 1044 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 531 :y 1051 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-play-circle)]))
              ([MAGIC :tag TD :x 567 :y 1044 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag SPAN :x 577 :y 1051 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-lrc-gray)]))
              ([MAGIC :tag TD :x 613 :y 1044 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 623 :y 1051 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-download op-se-listen-recommend)])))))
           ([BLOCK :tag DIV :x 121 :y 1082 :w 538 :h 20 :class (c-gap-top-small)]
            ([LINE]
             ([INLINE :tag A :class (op-singer-v2-more)]
              ([TEXT :x 121 :y 1083.5 :w 26 :h 17])
              ([INLINE :tag EM]
               ([TEXT :x 147 :y 1084.5 :w 45 :h 15]))
              ([TEXT :x 192 :y 1083.5 :w 39 :h 17]))))))
         ([BLOCK :tag DIV :x 121 :y 1102 :w 538 :h 20]
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :class (c-showurl)]
             ([TEXT :x 121 :y (/ 33135 30) :w 103 :h 15]))))
          ([MAGIC :tag I :x 224 :y (/ 33165 30) :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :id tools_14343896468837079761_5 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))))))
        ([BLOCK :tag DIV :x 121 :y (/ 34081 30) :w 538 :h 105.7 :id 6 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y (/ 34081 30) :w 538 :h (/ 739 30) :class (t c-title-en)]
          ([LINE]
           ([INLINE :tag A]
            ([TEXT :x 121 :y 1139.85 :w 55 :h 17])
            ([INLINE :tag EM]
             ([TEXT :x 176 :y 1139.85 :w 57 :h 17]))
            ([TEXT :x 233 :y 1139.85 :w 240 :h 17]))))
         ([BLOCK :tag DIV :x 121 :y (/ 3485 3) :w 538 :h (/ 1201 30) :class (c-abstract c-abstract-en)]
          ([LINE]
           ([TEXT :x 121 :y (/ 6985 6) :w 83 :h 15])
           ([INLINE :tag EM]
            ([TEXT :x 204 :y (/ 6985 6) :w 47 :h 15]))
           ([TEXT :x 251 :y (/ 6985 6) :w 403 :h 15]))
          ([LINE]
           ([TEXT :x 121 :y (/ 14210 12) :w 154 :h 15])))
         ([BLOCK :tag DIV :x 121 :y 1201.7 :w 538 :h 20 :class (sitelink-simple)]
          ([LINE]
           ([INLINE :tag A :class (c-gap-right)]
            ([TEXT :x 121 :y 1204.2 :w 69 :h 15]))
           ([INLINE :tag A :class (c-gap-right)]
            ([TEXT :x 202 :y 1204.2 :w 70 :h 15]))
           ([INLINE :tag A :class (c-gap-right)]
            ([TEXT :x 284 :y 1204.2 :w 45 :h 15]))
           ([INLINE :tag A]
            ([TEXT :x 341 :y 1204.2 :w 124 :h 15]))))
         ([BLOCK :tag DIV :x 121 :y 1145.375 :w 538 :h 20 :class (f13)]
          ([ANON]
           ([LINE]
            ([INLINE :tag A :id e10021 :class (c-showurl)]
             ([TEXT :x 121 :y (/ 36727 30) :w 139 :h 15]))))
          ([MAGIC :tag I :x 260 :y (/ 36757 30) :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
          ([ANON]
           ([LINE]
            ([INLINE :tag DIV :id tools_17529551308722024056_6 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))))
          ([MAGIC :tag SPAN :x 274 :y 1145.375 :w 0 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icons-outer)]
           ([INLINE :tag SPAN :class (c-icons-inner)]))
          ([ANON]
           ([LINE]
            ([TEXT :x 274 :y (/ 36727 30) :w 12 :h 15])
            ([INLINE :tag A :class (m)]
             ([TEXT :x 286 :y (/ 36697 30) :w 52 :h 17]))
            ([INLINE :tag SPAN]
             ([TEXT :x 338 :y (/ 36727 30) :w 12 :h 15])
             ([INLINE :tag A :class (m)]
              ([TEXT :x 350 :y (/ 36697 30) :w 52 :h 17])))
            ([TEXT :x 402 :y (/ 36727 30) :w 12 :h 15])
            ([INLINE :tag A :class (m)]
             ([TEXT :x 414 :y (/ 36697 30) :w 52 :h 17]))))))
        ([BLOCK :tag DIV :x 121 :y (/ 18836 15) :w 538 :h 85.7 :id 7 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y (/ 18836 15) :w 538 :h (/ 739 30) :class (t)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y 1259.55 :w 53 :h 17]))
            ([TEXT :x 174 :y 1258.55 :w 89 :h 20])
            ([INLINE :tag EM]
             ([TEXT :x 263 :y 1259.55 :w 53 :h 17]))
            ([TEXT :x 316 :y 1258.55 :w 301 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y (/ 38441 30) :w 538 :h (/ 1201 30) :class (c-abstract)]
          ([LINE]
           ([TEXT :x 121 :y (/ 19243 15) :w 216 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 337 :y (/ 19258 15) :w 45 :h 15]))
           ([TEXT :x 382 :y (/ 19243 15) :w 69 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 451 :y (/ 19258 15) :w 45 :h 15]))
           ([TEXT :x 496 :y (/ 19243 15) :w 69 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 565 :y (/ 19258 15) :w 45 :h 15]))
           ([TEXT :x 610 :y (/ 19243 15) :w 39 :h 17]))
          ([LINE]
           ([TEXT :x 121 :y 1302.9 :w 173 :h 17])))
         ([BLOCK :tag DIV :x 121 :y 1321.4 :w 538 :h 20 :class (f13)]
          ([ANON]
           ([LINE]
            ([INLINE :tag A :id e10023 :class (c-showurl)]
             ([TEXT :x 121 :y 1323.9 :w 43 :h 15])
             ([INLINE :tag B]
              ([TEXT :x 164 :y 1323.9 :w 45 :h 15]))
             ([TEXT :x 209 :y 1323.9 :w 4 :h 15]))))
          ([MAGIC :tag I :x 213 :y 1324.9 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
          ([ANON]
           ([LINE]
            ([INLINE :tag DIV :id tools_16220006361359376573_7 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))))
          ([MAGIC :tag SPAN :x 227 :y 1321.4 :w 0 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icons-outer)]
           ([INLINE :tag SPAN :class (c-icons-inner)]))
          ([ANON]
           ([LINE]
            ([TEXT :x 227 :y 1323.9 :w 12 :h 15])
            ([INLINE :tag A :class (m)]
             ([TEXT :x 239 :y 1322.9 :w 52 :h 17]))
            ([INLINE :tag SPAN]
             ([TEXT :x 291 :y 1323.9 :w 12 :h 15])
             ([INLINE :tag A :class (m)]
              ([TEXT :x 303 :y 1322.9 :w 52 :h 17])))))))
        ([BLOCK :tag DIV :x 121 :y (/ 16265 12) :w 538 :h 154.65 :id 8 :class (result-op c-container xpath-log)]
         ([BLOCK :tag H3 :x 121 :y (/ 16265 12) :w 538 :h (/ 739 30) :class (t c-gap-bottom-small)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y (/ 40777 30) :w 53 :h 17]))
            ([TEXT :x 174 :y (/ 40747 30) :w 73 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y 1385.05 :w 538 :h 105 :id ala_img_results :class (op_img_content)]
          ([BLOCK :tag DIV :x 121 :y 1385.05 :w 538 :h 105 :id ala_img_pics]
           ([MAGIC :tag A :x 121 :y 1385.05 :w 140 :h 105 :mt 0 :mr 0 :mb 0 :ml 0 :id e10026]
            ([INLINE :tag IMG :id e10027]))
           ([MAGIC :tag A :x 261 :y 1385.05 :w 80 :h 105 :mt 0 :mr 0 :mb 0 :ml 0 :id e10029]
            ([INLINE :tag IMG :id e10030]))
           ([MAGIC :tag A :x 341 :y 1385.05 :w 162 :h 105 :mt 0 :mr 0 :mb 0 :ml 0 :id e10032]
            ([INLINE :tag IMG :id e10033]))
           ([MAGIC :tag A :x 503 :y 1385.05 :w 156 :h 105 :mt 0 :mr 0 :mb 0 :ml 0 :id e10035]
            ([INLINE :tag IMG :id e10036]))))
         ([ANON]
          ([LINE]
           ([INLINE :tag SPAN :id ala_img_desc :class (c-showurl)]
            ([INLINE :tag SPAN :class (c-showurl)]
             ([TEXT :x 121 :y 1492.55 :w 103 :h 15]))
            ([INLINE :tag SPAN :id tools_14085810265887252366_8 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))
            ([TEXT :x 238 :y 1492.55 :w 12 :h 15])
            ([INLINE :tag A]
             ([TEXT :x 250 :y 1491.55 :w 112 :h 17])))))
         ([MAGIC :tag I :x 224 :y 1493.55 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
         ([ANON]
          ([LINE])))
        ([BLOCK :tag DIV :x 121 :y (/ 22861 15) :w 538 :h 85.7 :id 9 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y (/ 22861 15) :w 538 :h (/ 739 30) :class (t c-title-en)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y 1527.9 :w 57 :h 17]))
            ([TEXT :x 178 :y 1527.9 :w 240 :h 17]))))
         ([BLOCK :tag DIV :x 121 :y 1549.7 :w 538 :h (/ 1201 30) :class (c-abstract c-abstract-en)]
          ([LINE]
           ([TEXT :x 121 :y 1552.2 :w 487 :h 15])
           ([INLINE :tag EM]
            ([TEXT :x 608 :y 1552.2 :w 47 :h 15]))
           ([TEXT :x 655 :y 1552.2 :w 4 :h 15]))
          ([LINE]
           ([TEXT :x 121 :y (/ 47167 30) :w 334 :h 15])))
         ([BLOCK :tag DIV :x 121 :y (/ 23846 15) :w 538 :h 20 :class (f13)]
          ([ANON]
           ([LINE]
            ([INLINE :tag A :id e10039 :class (c-showurl)]
             ([TEXT :x 121 :y (/ 47767 30) :w 139 :h 15]))))
          ([MAGIC :tag I :x 260 :y (/ 47797 30) :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
          ([ANON]
           ([LINE]
            ([INLINE :tag DIV :id tools_1246506936876385692_9 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))))
          ([MAGIC :tag SPAN :x 274 :y (/ 23846 15) :w 0 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icons-outer)]
           ([INLINE :tag SPAN :class (c-icons-inner)]))
          ([ANON]
           ([LINE]
            ([TEXT :x 274 :y (/ 47767 30) :w 12 :h 15])
            ([INLINE :tag A :class (m)]
             ([TEXT :x 286 :y (/ 47737 30) :w 52 :h 17]))
            ([INLINE :tag SPAN]
             ([TEXT :x 338 :y (/ 47767 30) :w 12 :h 15])
             ([INLINE :tag A :class (m)]
              ([TEXT :x 350 :y (/ 47737 30) :w 52 :h 17])))
            ([TEXT :x 402 :y (/ 47767 30) :w 12 :h 15])
            ([INLINE :tag A :class (m)]
             ([TEXT :x 414 :y (/ 47737 30) :w 52 :h 17]))))))
        ([BLOCK :tag DIV :x 121 :y 1623.75 :w 538 :h 85.7 :id 10 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y 1623.75 :w 538 :h (/ 739 30) :class (t)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y (/ 48827 30) :w 57 :h 17]))
            ([TEXT :x 178 :y (/ 48797 30) :w 45 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y (/ 24741 15) :w 538 :h (/ 1201 30) :class (c-abstract)]
          ([LINE]
           ([TEXT :x 121 :y 1650.9 :w 41 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 162 :y 1651.9 :w 47 :h 15]))
           ([TEXT :x 209 :y 1650.9 :w 398 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 607 :y 1651.9 :w 47 :h 15])))
          ([LINE]
           ([TEXT :x 121 :y 1670.9 :w 264 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 385 :y 1671.9 :w 47 :h 15]))
           ([TEXT :x 432 :y 1670.9 :w 81 :h 17])))
         ([BLOCK :tag DIV :x 121 :y (/ 20273 12) :w 538 :h 20 :class (f13)]
          ([ANON]
           ([LINE]
            ([INLINE :tag A :id e10041 :class (c-showurl)]
             ([TEXT :x 121 :y (/ 20303 12) :w 136 :h 15])
             ([INLINE :tag B]
              ([TEXT :x 257 :y (/ 20303 12) :w 7 :h 15]))
             ([TEXT :x 264 :y (/ 20303 12) :w 16 :h 15]))))
          ([MAGIC :tag I :x 280 :y (/ 20315 12) :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
          ([ANON]
           ([LINE]
            ([INLINE :tag DIV :id tools_18088649634398589249_10 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))))
          ([MAGIC :tag SPAN :x 294 :y (/ 20273 12) :w 24 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icons-outer)]
           ([INLINE :tag SPAN :class (c-icons-inner)]
            ([MAGIC :tag SPAN :x 293 :y (/ 20303 12) :w 1 :h 12 :mt 0 :mr 3 :mb 0 :ml 3 :class (c-vline)])
            ([INLINE :tag SPAN :class (c-trust-as vstar)]
             ([MAGIC :tag A :x 297 :y (/ 20291 12) :w 21 :h 16 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-v c-icon-v1)]))))
          ([ANON]
           ([LINE]
            ([TEXT :x 318 :y (/ 20303 12) :w 12 :h 15])
            ([INLINE :tag A :class (m)]
             ([TEXT :x 330 :y (/ 20291 12) :w 52 :h 17]))
            ([INLINE :tag SPAN]
             ([TEXT :x 382 :y (/ 20303 12) :w 12 :h 15])
             ([INLINE :tag A :class (m)]
              ([TEXT :x 394 :y (/ 20291 12) :w 52 :h 17]))))))))
       ([MAGIC :tag DIV :x 0 :y (/ 51703 30) :w 1212 :h 0 :mt 0 :mr 0 :mb 0 :ml 0 :id e10043])
       ([BLOCK :tag DIV :x 121 :y (/ 51883 30) :w 600 :h 104 :id rs]
        ([BLOCK :tag DIV :x 121 :y (/ 51883 30) :w 600 :h 30 :class (tt)]
         ([LINE]
          ([TEXT :x 121 :y (/ 26024 15) :w 68 :h 20])))
        ([MAGIC :tag TABLE :x 121 :y (/ 52783 30) :w 540 :h 74 :mt 0 :mr 0 :mb 0 :ml 0]
         ([MAGIC :tag TBODY :x 123 :y (/ 52843 30) :w 536 :h 70 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TR :x 123 :y (/ 52843 30) :w 536 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TH :x 123 :y (/ 52843 30) :w (/ 2597 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 123 :y (/ 52933 30) :w 107 :h 17])))
           ([MAGIC :tag TD :x (/ 4472 15) :y (/ 52843 30) :w (/ 73 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0])
           ([MAGIC :tag TH :x 305 :y (/ 52843 30) :w (/ 2576 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 305 :y (/ 52933 30) :w 56 :h 17])))
           ([MAGIC :tag TD :x (/ 7181 15) :y (/ 52843 30) :w (/ 73 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0])
           ([MAGIC :tag TH :x 485.6 :y (/ 52843 30) :w 173.4 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 485.6 :y (/ 52933 30) :w 76 :h 16]))))
          ([MAGIC :tag TR :x 123 :y (/ 53563 30) :w 536 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TH :x 123 :y (/ 53563 30) :w (/ 2597 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 123 :y (/ 53653 30) :w 75 :h 17])))
           ([MAGIC :tag TD :x (/ 4472 15) :y (/ 53563 30) :w (/ 73 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0])
           ([MAGIC :tag TH :x 305 :y (/ 53563 30) :w (/ 2576 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 305 :y (/ 53653 30) :w 42 :h 17])))
           ([MAGIC :tag TD :x (/ 7181 15) :y (/ 53563 30) :w (/ 73 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0])
           ([MAGIC :tag TH :x 485.6 :y (/ 53563 30) :w 173.4 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 485.6 :y (/ 53653 30) :w 56 :h 17]))))
          ([MAGIC :tag TR :x 123 :y (/ 54283 30) :w 536 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TH :x 123 :y (/ 54283 30) :w (/ 2597 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 123 :y (/ 54373 30) :w 53 :h 16])))
           ([MAGIC :tag TD :x (/ 4472 15) :y (/ 54283 30) :w (/ 73 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0])
           ([MAGIC :tag TH :x 305 :y (/ 54283 30) :w (/ 2576 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 305 :y (/ 54373 30) :w 28 :h 17])))
           ([MAGIC :tag TD :x (/ 7181 15) :y (/ 54283 30) :w (/ 73 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0])
           ([MAGIC :tag TH :x 485.6 :y (/ 54283 30) :w 173.4 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 485.6 :y (/ 54373 30) :w 117 :h 16])))))))
       ([BLOCK :tag DIV :x 0 :y (/ 55903 30) :w 1212 :h 66 :id page]
        ([MAGIC :tag STRONG :x 121 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 127 :y (/ 55903 30) :w 24 :h 24 :class (fk fk_cur)]
          ([MAGIC :tag I :x 127 :y (/ 55873 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-p)]))
         ([BLOCK :tag SPAN :x 121 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 135 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 166 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 172 :y (/ 55903 30) :w 24 :h 24 :class (fk fkd)]
          ([MAGIC :tag I :x 172 :y (/ 56023 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 166 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 180 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 211 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 217 :y (/ 55903 30) :w 24 :h 24 :class (fk)]
          ([MAGIC :tag I :x 217 :y (/ 55843 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 211 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 225 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 256 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 262 :y (/ 55903 30) :w 24 :h 24 :class (fk fkd)]
          ([MAGIC :tag I :x 262 :y (/ 56023 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 256 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 270 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 301 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 307 :y (/ 55903 30) :w 24 :h 24 :class (fk)]
          ([MAGIC :tag I :x 307 :y (/ 55843 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 301 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 315 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 346 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 352 :y (/ 55903 30) :w 24 :h 24 :class (fk fkd)]
          ([MAGIC :tag I :x 352 :y (/ 56023 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 346 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 360 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 391 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 397 :y (/ 55903 30) :w 24 :h 24 :class (fk)]
          ([MAGIC :tag I :x 397 :y (/ 55843 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 391 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 405 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 436 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 442 :y (/ 55903 30) :w 24 :h 24 :class (fk fkd)]
          ([MAGIC :tag I :x 442 :y (/ 56023 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 436 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 450 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 481 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 487 :y (/ 55903 30) :w 24 :h 24 :class (fk)]
          ([MAGIC :tag I :x 487 :y (/ 55843 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 481 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 495 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 526 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 532 :y (/ 55903 30) :w 24 :h 24 :class (fk fkd)]
          ([MAGIC :tag I :x 532 :y (/ 56023 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 526 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 536 :y (/ 57103 30) :w 16 :h 16]))))
        ([MAGIC :tag A :x 571 :y (/ 56803 30) :w 88 :h 36 :mt 0 :mr 9 :mb 0 :ml 0 :class (n)]
         ([TEXT :x 590 :y (/ 57103 30) :w 50 :h 17])))
       ([BLOCK :tag DIV :x 0 :y (/ 59083 30) :w 661 :h 0 :id content_bottom]))
      ([BLOCK :tag DIV :x 0 :y (/ 59083 30) :w 1728 :h 43 :id foot]
       ([BLOCK :tag SPAN :x 0 :y (/ 59113 30) :w 331 :h 42 :id help]
        ([LINE]
         ([INLINE :tag A]
          ([TEXT :x 136 :y (/ 59503 30) :w 24 :h 16]))
         ([INLINE :tag A]
          ([TEXT :x 190 :y (/ 59503 30) :w 24 :h 16]))
         ([INLINE :tag A :class (feedback)]
          ([TEXT :x 244 :y (/ 59503 30) :w 72 :h 16])))))
      ([BLOCK :tag DIV :x 0 :y (/ 60373 30) :w 1728 :h 0 :id c-tips-container :class (c-tips-container)])))
    ([BLOCK :tag DIV :x 0 :y (/ 60373 30) :w 1728 :h 0 :id c-tips-container :class (c-tips-container)]))))

(define-problem doc-1
  "cassius_百度搜索"
  #:url "file:///home/pavpan/cassius/bench/alexa/baidu.html"
  #:header header
  #:sheet doc-1
  #:documents doc-1
  #:features (position min-width box-sizing % float white-space clear overflow-x overflow-y unknown-selector em s max-height max-width min-height inline-block tables unknown-display))

(define-document (doc-1 #:width (between 800 1920) #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 1728 :h (/ 60373 30)]
   ([BLOCK :tag BODY :x 0 :y 0 :w 1728 :h (/ 60373 30)]
    ([BLOCK :tag DIV :x 0 :y 0 :w 0 :h 0 :id swfsocketdiv]
     ([LINE]
      ([INLINE :tag OBJECT :id socketswf])))
    ([BLOCK :tag DIV :x 0 :y 0 :w 0 :h 0 :id swfEveryCookieWrap]
     ([LINE]
      ([INLINE :tag OBJECT :id sharedObjectBIDUPSID])))
    ([BLOCK :tag DIV :x 0 :y 0 :w 0 :h 0 :id swfsocketdiv])
    ([BLOCK :tag DIV :x 0 :y 0 :w 0 :h 0 :id swfEveryCookieWrap]
     ([BLOCK :tag DIV :x 0 :y 0 :w 0 :h 0 :id swfEveryCookie]))
    ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h (/ 60373 30) :id wrapper :class (wrapper_l)]
     ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 56 :id head]
      ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 55 :class (head_wrapper)]
       ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 55 :class (s_form)]
        ([BLOCK :tag DIV :x 10 :y 0 :w 1718 :h 0 :class (s_form_wrapper)]
         ([BLOCK :tag A :x 10 :y 7 :w 101 :h 35.8 :id result_logo]
          ([LINE]
           ([INLINE :tag IMG])))
         ([BLOCK :tag FORM :x 121 :y 11 :w 640 :h 35 :id form :class (fm)]
          ([MAGIC :tag SPAN :x 121 :y 11 :w 540 :h 34 :mt 0 :mr 0 :mb 0 :ml 0 :class (bg s_ipt_wr iptfocus quickdelete-wrap)]
           ([INLINE :tag INPUT :id kw :class (s_ipt)])
           ([BLOCK :tag A :x 629 :y 12 :w 32 :h 32 :id quickdelete :class (quickdelete)])
           ([BLOCK :tag A :x 629 :y 12 :w 32 :h 32 :id quickdelete :class (quickdelete)])
           ([BLOCK :tag A :x 629 :y 12 :w 32 :h 32 :id quickdelete :class (quickdelete)]))
          ([MAGIC :tag SPAN :x 661 :y 11 :w 100 :h 35 :mt 0 :mr 0 :mb 0 :ml 0 :class (bg s_btn_wr)]
           ([INLINE :tag INPUT :id su :class (bg s_btn)]))
          ([BLOCK :tag SPAN :x 761 :y 21 :w 0 :h 0 :class (tools)]))))
       ([BLOCK :tag DIV :x 1567 :y 21 :w 152 :h 16 :id u]
        ([ANON]
         ([LINE]
          ([INLINE :tag A :class (toindex)]
           ([TEXT :x 1574 :y 21 :w 48 :h 16]))
          ([INLINE :tag A :class (pf)]
           ([TEXT :x 1636 :y 21 :w 24 :h 16]))))
        ([MAGIC :tag I :x 1660 :y 22 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down)])
        ([ANON]
         ([LINE]
          ([INLINE :tag A :class (lb)]
           ([TEXT :x 1688 :y 21 :w 24 :h 16])))))))
     ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 93 :id s_tab :class (s_tab)]
      ([MAGIC :tag B :x 121 :y 55.5 :w 54 :h 38 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 133 :y 65.5 :w 30 :h 17]))
      ([MAGIC :tag A :x 175 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 188 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 229 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 242 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 283 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 296 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 337 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 350 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 391 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 404 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 445 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 458 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 499 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 512 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 553 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 566 :y 65.5 :w 28 :h 17]))
      ([MAGIC :tag A :x 607 :y 55.5 :w 54 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
       ([TEXT :x 616 :y 65.5 :w 36 :h 17])))
     ([BLOCK :tag DIV :x 0 :y 93 :w 1728 :h (/ 57583 30) :id wrapper_wrapper]
      ([BLOCK :tag DIV :x 0 :y 93 :w 1212 :h (/ 55093 30) :id container :class (container_l)]
       ([BLOCK :tag DIV :x 810 :y 138 :w 402 :h (/ 9994 15) :id content_right :class (cr-offset)]
        ([MAGIC :tag TABLE :x 828 :y 138 :w 351 :h (/ 9994 15) :mt 0 :mr 0 :mb 0 :ml 0]
         ([MAGIC :tag TBODY :x 828 :y 138 :w 351 :h (/ 9994 15) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TR :x 828 :y 138 :w 351 :h (/ 9994 15) :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 828 :y 138 :w 351 :h (/ 9994 15) :mt 0 :mr 0 :mb 0 :ml 0]
            ([BLOCK :tag DIV :x 828 :y 138 :w 351 :h (/ 9394 15) :id con-ar :class (result_hidden)]
             ([BLOCK :tag DIV :x 828 :y 138 :w 351 :h (/ 8704 15) :class (result-op xpath-log)]
              ([BLOCK :tag DIV :x 828 :y 138 :w 351 :h (/ 8704 15) :class (cr-content )]
               ([BLOCK :tag DIV :x 828 :y 138 :w 351 :h (/ 8704 15) :class (opr-recommends-merge-content)]
                ([BLOCK :tag DIV :x 828 :y 138 :w 351 :h (/ 271 15) :class (cr-title c-clearfix)]
                 ([BLOCK :tag A :x 1133 :y 138 :w 46 :h (/ 503 30) :class (cr-title-sub opr-recommends-merge-more-btn)]
                  ([ANON]
                   ([LINE]
                    ([INLINE :tag SPAN]
                     ([TEXT :x 1133 :y 137.9 :w 26 :h 17]))))
                  ([MAGIC :tag I :x 1165 :y 139.9 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 6 :class (c-icon c-icon-chevron-bottom c-gap-left-small)]))
                 ([ANON]
                  ([LINE]
                   ([INLINE :tag SPAN]
                    ([TEXT :x 828 :y (/ 4171 30) :w 60 :h 17])))))
                ([BLOCK :tag DIV :x 828 :y (/ 2491 15) :w 351 :h 140 :class (opr-recommends-merge-panel opr-recommends-merge-mbGap)]
                 ([BLOCK :tag DIV :x 828 :y (/ 2491 15) :w 351 :h 140 :class (c-row c-gap-top)]
                  ([BLOCK :tag DIV :x 828 :y (/ 2491 15) :w 75 :h 140 :class (c-span4  opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 828 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 828 :y (/ 2491 15) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 828 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 828 :y (/ 3691 15) :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 839.5 :y (/ 7427 30) :w 52 :h 17]))))
                   ([BLOCK :tag DIV :x 828 :y (/ 3193 12) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 828 :y (/ 3193 12) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 920 :y (/ 2491 15) :w 75 :h 140 :class (c-span4  opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 920 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 920 :y (/ 2491 15) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 920 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 920 :y (/ 3691 15) :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 931.5 :y (/ 7427 30) :w 52 :h 17]))))
                   ([BLOCK :tag DIV :x 920 :y (/ 3193 12) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 920 :y (/ 3193 12) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 1012 :y (/ 2491 15) :w 75 :h 140 :class (c-span4  c-span-last-s opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 1012 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 1012 :y (/ 2491 15) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 1012 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 1012 :y (/ 3691 15) :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 1023.5 :y (/ 7427 30) :w 52 :h 17]))))
                   ([BLOCK :tag DIV :x 1012 :y (/ 3193 12) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 1012 :y (/ 3193 12) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 1104 :y (/ 2491 15) :w 75 :h 140 :class (c-span4  c-span-last opr-recommends-merge-lastspan opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 1104 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 1104 :y (/ 2491 15) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 1104 :y (/ 2491 15) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 1104 :y (/ 3691 15) :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 1122 :y (/ 7427 30) :w 39 :h 17]))))
                   ([BLOCK :tag DIV :x 1104 :y (/ 3193 12) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 1104 :y (/ 3193 12) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))))
                ([BLOCK :tag DIV :x 828 :y (/ 4009 12) :w 351 :h (/ 271 15) :class (cr-title c-clearfix)]
                 ([BLOCK :tag A :x 1133 :y (/ 4009 12) :w 46 :h (/ 503 30) :class (cr-title-sub opr-recommends-merge-more-btn)]
                  ([ANON]
                   ([LINE]
                    ([INLINE :tag SPAN]
                     ([TEXT :x 1133 :y (/ 10019 30) :w 26 :h 17]))))
                  ([MAGIC :tag I :x 1165 :y (/ 10079 30) :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 6 :class (c-icon c-icon-chevron-bottom c-gap-left-small)]))
                 ([ANON]
                  ([LINE]
                   ([INLINE :tag SPAN]
                    ([TEXT :x 828 :y 335.1 :w 90 :h 17])))))
                ([BLOCK :tag DIV :x 828 :y 362.15 :w 351 :h 140 :class (opr-recommends-merge-panel opr-recommends-merge-mbGap)]
                 ([BLOCK :tag DIV :x 828 :y 362.15 :w 351 :h 140 :class (c-row c-gap-top)]
                  ([BLOCK :tag DIV :x 828 :y 362.15 :w 75 :h 140 :class (c-span4  opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 828 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 828 :y 362.15 :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 828 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 828 :y 442.15 :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 852.5 :y 443.65 :w 26 :h 17]))))
                   ([BLOCK :tag DIV :x 828 :y (/ 2773 6) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 828 :y (/ 2773 6) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 920 :y 362.15 :w 75 :h 140 :class (c-span4  opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 920 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 920 :y 362.15 :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 920 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 920 :y 442.15 :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 925 :y 443.65 :w 65 :h 17]))))
                   ([BLOCK :tag DIV :x 920 :y (/ 2773 6) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 920 :y (/ 2773 6) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 1012 :y 362.15 :w 75 :h 140 :class (c-span4  c-span-last-s opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 1012 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 1012 :y 362.15 :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 1012 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 1012 :y 442.15 :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 1030 :y 443.65 :w 39 :h 17]))))
                   ([BLOCK :tag DIV :x 1012 :y (/ 2773 6) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 1012 :y (/ 2773 6) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 1104 :y 362.15 :w 75 :h 140 :class (c-span4  c-span-last opr-recommends-merge-lastspan opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 1104 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 1104 :y 362.15 :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 1104 :y 362.15 :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 1104 :y 442.15 :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 1115 :y 443.65 :w 53 :h 17]))))
                   ([BLOCK :tag DIV :x 1104 :y (/ 2773 6) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 1104 :y (/ 2773 6) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))))
                ([BLOCK :tag DIV :x 828 :y (/ 3181 6) :w 351 :h (/ 271 15) :class (cr-title c-clearfix)]
                 ([BLOCK :tag A :x 1133 :y (/ 3181 6) :w 46 :h (/ 503 30) :class (cr-title-sub opr-recommends-merge-more-btn)]
                  ([ANON]
                   ([LINE]
                    ([INLINE :tag SPAN]
                     ([TEXT :x 1133 :y 530.05 :w 26 :h 17]))))
                  ([MAGIC :tag I :x 1165 :y 532.05 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 6 :class (c-icon c-icon-chevron-bottom c-gap-left-small)]))
                 ([ANON]
                  ([LINE]
                   ([INLINE :tag SPAN]
                    ([TEXT :x 828 :y 531.2 :w 75 :h 17])))))
                ([BLOCK :tag DIV :x 828 :y (/ 16747 30) :w 351 :h (/ 4801 30) :class (opr-recommends-merge-panel)]
                 ([BLOCK :tag DIV :x 828 :y (/ 16747 30) :w 351 :h (/ 4801 30) :class (c-row c-gap-top)]
                  ([BLOCK :tag DIV :x 828 :y (/ 16747 30) :w 75 :h (/ 4801 30) :class (c-span4  opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 828 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 828 :y (/ 16747 30) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 828 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 828 :y (/ 19147 30) :w 75 :h (/ 1201 30) :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 833 :y (/ 9596 15) :w 65 :h 17])))
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 852.5 :y 659.75 :w 26 :h 17]))))
                   ([BLOCK :tag DIV :x 828 :y (/ 10174 15) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 828 :y (/ 10174 15) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 920 :y (/ 16747 30) :w 75 :h 140 :class (c-span4  opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 920 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 920 :y (/ 16747 30) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 920 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 920 :y (/ 19147 30) :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 931.5 :y (/ 9596 15) :w 52 :h 17]))))
                   ([BLOCK :tag DIV :x 920 :y 658.25 :w 75 :h 40]
                    ([BLOCK :tag IMG :x 920 :y 658.25 :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 1012 :y (/ 16747 30) :w 75 :h (/ 4801 30) :class (c-span4  c-span-last-s opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 1012 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 1012 :y (/ 16747 30) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 1012 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 1012 :y (/ 19147 30) :w 75 :h (/ 1201 30) :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 1017 :y (/ 9596 15) :w 65 :h 17])))
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 1043 :y 659.75 :w 13 :h 17]))))
                   ([BLOCK :tag DIV :x 1012 :y (/ 10174 15) :w 75 :h 40]
                    ([BLOCK :tag IMG :x 1012 :y (/ 10174 15) :w 74 :h 40 :class (opr-recommends-merge-imgtext)])))
                  ([BLOCK :tag DIV :x 1104 :y (/ 16747 30) :w 75 :h 140 :class (c-span4  c-span-last opr-recommends-merge-lastspan opr-recommends-merge-item )]
                   ([BLOCK :tag DIV :x 1104 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-p)]
                    ([BLOCK :tag IMG :x 1104 :y (/ 16747 30) :w 75 :h 75 :class (c-img c-img4 opr-recommends-merge-img)])
                    ([ANON]
                     ([LINE]
                      ([INLINE :tag A])))
                    ([BLOCK :tag A :x 1104 :y (/ 16747 30) :w 75 :h 75 :class (opr-recommends-merge-mask)]))
                   ([BLOCK :tag DIV :x 1104 :y (/ 19147 30) :w 75 :h 20 :class (c-gap-top-small)]
                    ([LINE]
                     ([INLINE :tag A]
                      ([TEXT :x 1115.5 :y (/ 9596 15) :w 52 :h 17]))))
                   ([BLOCK :tag DIV :x 1104 :y 658.25 :w 75 :h 40]
                    ([BLOCK :tag IMG :x 1104 :y 658.25 :w 74 :h 40 :class (opr-recommends-merge-imgtext)]))))))))
             ([BLOCK :tag DIV :x 828 :y (/ 11194 15) :w 351 :h 18 :id e10001]
              ([LINE]
               ([INLINE :tag A :class (c-gray c-feedback)]
                ([TEXT :x 1107 :y (/ 11209 15) :w 72 :h 16])))))
            ([BLOCK :tag DIV :x 828 :y (/ 12064 15) :w 351 :h 0]))))))
       ([BLOCK :tag DIV :x 0 :y 93 :w 810 :h 40 :class (head_nums_cont_outer OP_LOG)]
        ([BLOCK :tag DIV :x 0 :y 53 :w 810 :h 84 :id e10002 :class (head_nums_cont_inner)]
         ([BLOCK :tag DIV :x 121 :y 53 :w 538 :h 42 :class (search_tool_conter)]
          ([BLOCK :tag SPAN :x 597 :y 53 :w 62 :h 42 :class (c-gap-left-samll search_tool_close)]
           ([MAGIC :tag I :x 597 :y 67 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon searchTool-up c-icon-chevron-top-gray-s)])
           ([ANON]
            ([LINE]
             ([TEXT :x 611 :y 66 :w 48 :h 16]))))
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :class (search_tool_la)]
             ([TEXT :x 121 :y 66 :w 48 :h 16]))))
          ([MAGIC :tag I :x 169 :y 67 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down)])
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :class (search_tool_tf c-gap-left)]
             ([TEXT :x 206 :y 66 :w 48 :h 16]))))
          ([MAGIC :tag I :x 254 :y 67 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down)])
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :class (search_tool_ft c-gap-left)]
             ([TEXT :x 291 :y 66 :w 84 :h 16]))))
          ([MAGIC :tag I :x 375 :y 67 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down)])
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :class (search_tool_si c-gap-left)]
             ([TEXT :x 412 :y 66 :w 60 :h 16]))))
          ([MAGIC :tag I :x 472 :y 67 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down)])
          ([ANON]
           ([LINE])))
         ([BLOCK :tag DIV :x 121 :y 95 :w 538 :h 42 :class (nums)]
          ([BLOCK :tag DIV :x 597 :y 95 :w 62 :h 42 :class (search_tool)]
           ([MAGIC :tag I :x 597 :y 109 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon searchTool-spanner c-icon-setting)])
           ([ANON]
            ([LINE]
             ([TEXT :x 611 :y 108 :w 48 :h 16]))))
          ([ANON]
           ([LINE]
            ([TEXT :x 121 :y 108 :w 199 :h 16]))))))
       ([BLOCK :tag DIV :x 0 :y 133 :w 661 :h (/ 47713 30) :id content_left]
        ([BLOCK :tag DIV :x 121 :y 138 :w 538 :h (/ 615 30) :class (hit_top_new)]
         ([BLOCK :tag DIV :x 121 :y 138 :w 538 :h (/ 615 30) :class (c-gap-bottom-small f13)]
          ([MAGIC :tag I :x 121 :y 139 :w 18 :h 18 :mt 0 :mr 6 :mb 0 :ml 0 :class (c-icon c-icon-bear-circle c-gap-right-small res-queryext-pos)])
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :class (c-gray)]
             ([INLINE :tag STRONG]
              ([TEXT :x 145 :y 140 :w 98 :h 17])
              ([INLINE :tag A]
               ([TEXT :x 243 :y 140 :w 56 :h 17]))))))))
        ([BLOCK :tag DIV :x 121 :y (/ 5175 30) :w 538 :h (/ 3986 15) :id 1 :class (result-op c-container xpath-log)]
         ([BLOCK :tag H3 :x 121 :y (/ 5175 30) :w 538 :h (/ 739 30) :class (t c-gap-bottom-small)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y (/ 529 3) :w 53 :h 17]))
            ([TEXT :x 174 :y (/ 526 3) :w 73 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y 202.15 :w 538 :h (/ 2533 12) :class (c-border)]
          ([BLOCK :tag DIV :x 131 :y 212.15 :w 518 :h (/ 2293 12) :class (op_dict_content)]
           ([BLOCK :tag DIV :x 131 :y 212.15 :w 518 :h 24 :class (op_dict3_readline c-clearfix)]
            ([BLOCK :tag DIV :x 131 :y 212.15 :w 317 :h 24 :class (op_dict3_read1)]
             ([MAGIC :tag TABLE :x 131 :y 212.15 :w 317 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (op_dict_table)]
              ([MAGIC :tag TBODY :x 131 :y 212.15 :w 317 :h 24 :mt 0 :mr 0 :mb 0 :ml 0]
               ([MAGIC :tag TR :x 131 :y 212.15 :w 317 :h 24 :mt 0 :mr 0 :mb 0 :ml 0]
                ([MAGIC :tag TD :x 131 :y 212.15 :w 95 :h 24 :mt 0 :mr 0 :mb 0 :ml 0]
                 ([BLOCK :tag SPAN :x 131 :y 212.15 :w 80 :h 24 :class (op_dict3_font24 op_dict3_marginRight)]
                  ([LINE]
                   ([TEXT :x 131 :y 210.65 :w 80 :h 27]))))
                ([MAGIC :tag TD :x 226 :y 212.15 :w 111 :h 24 :mt 0 :mr 0 :mb 0 :ml 0]
                 ([BLOCK :tag SPAN :x 226 :y 212.15 :w 14 :h 24 :class (op_dict3_font14 op_dict3_gap_small)]
                  ([LINE]
                   ([TEXT :x 226 :y 216.15 :w 14 :h 17])))
                 ([BLOCK :tag SPAN :x 247 :y 212.15 :w 61 :h 24 :class (op_dict3_font16 op_dict3_gap_small)]
                  ([LINE]
                   ([TEXT :x 247 :y 215.65 :w 61 :h 17])))
                 ([BLOCK :tag SPAN :x 315 :y 212.15 :w 22 :h 24]
                  ([BLOCK :tag A :x 315 :y 219.15 :w 14 :h 11 :class (op_dict3_how_read)])))
                ([MAGIC :tag TD :x 337 :y 212.15 :w 111 :h 24 :mt 0 :mr 0 :mb 0 :ml 0]
                 ([BLOCK :tag SPAN :x 337 :y 212.15 :w 14 :h 24 :class (op_dict3_font14 op_dict3_gap_small)]
                  ([LINE]
                   ([TEXT :x 337 :y 216.15 :w 14 :h 17])))
                 ([BLOCK :tag SPAN :x 358 :y 212.15 :w 61 :h 24 :class (op_dict3_font16 op_dict3_gap_small)]
                  ([LINE]
                   ([TEXT :x 358 :y 215.65 :w 61 :h 17])))
                 ([BLOCK :tag SPAN :x 426 :y 212.15 :w 22 :h 24]
                  ([BLOCK :tag A :x 426 :y 219.15 :w 14 :h 11 :class (op_dict3_how_read)]))))))))
           ([MAGIC :tag TABLE :x 131 :y 248.15 :w 103 :h 20 :mt 0 :mr 0 :mb 9 :ml 0 :class (op_dict3_english_result_table)]
            ([MAGIC :tag TBODY :x 131 :y 248.15 :w 103 :h 20 :mt 0 :mr 0 :mb 0 :ml 0]
             ([MAGIC :tag TR :x 131 :y 248.15 :w 103 :h 20 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TD :x 131 :y 248.15 :w 47 :h 20 :mt 0 :mr 0 :mb 0 :ml 0]
               ([BLOCK :tag SPAN :x 131 :y 248.15 :w 37 :h 20 :class (op_dict_text1 c-gap-right)]
                ([LINE]
                 ([TEXT :x 131 :y 250.65 :w 11 :h 15]))))
              ([MAGIC :tag TD :x 178 :y 248.15 :w 56 :h 20 :mt 0 :mr 0 :mb 0 :ml 0]
               ([BLOCK :tag SPAN :x 178 :y 248.15 :w 56 :h 20 :class (op_dict_text2)]
                ([LINE]
                 ([TEXT :x 178 :y 249.65 :w 56 :h 17])))))))
           ([MAGIC :tag TABLE :x 131 :y (/ 1663 6) :w 259 :h 22 :mt 0 :mr 0 :mb 9 :ml 0 :class (op_dict3_english_result_table op_dict3_else)]
            ([MAGIC :tag TBODY :x 131 :y (/ 1663 6) :w 259 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
             ([MAGIC :tag TR :x 131 :y (/ 1663 6) :w 259 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TD :x 131 :y (/ 1663 6) :w 47 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
               ([BLOCK :tag SPAN :x 131 :y (/ 1663 6) :w 37 :h 20 :class (op_dict_text1 c-gap-right)]
                ([LINE]
                 ([TEXT :x 131 :y (/ 836 3) :w 34 :h 17]))))
              ([MAGIC :tag TD :x 178 :y (/ 1663 6) :w 212 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
               ([BLOCK :tag SPAN :x 178 :y (/ 1663 6) :w 212 :h 22 :class (op_dict_text2 op_dict3_else_items)]
                ([MAGIC :tag SPAN :x 178 :y (/ 1663 6) :w 200 :h 20 :mt 0 :mr 12 :mb 2 :ml 0 :class (op_dict3_xingjinci)]
                 ([TEXT :x 178 :y (/ 836 3) :w 56 :h 17])
                 ([INLINE :tag A]
                  ([TEXT :x 234 :y (/ 839 3) :w 45 :h 15]))
                 ([TEXT :x 283 :y (/ 839 3) :w 4 :h 15])
                 ([INLINE :tag A]
                  ([TEXT :x 287 :y (/ 839 3) :w 38 :h 15]))
                 ([TEXT :x 329 :y (/ 839 3) :w 4 :h 15])
                 ([INLINE :tag A]
                  ([TEXT :x 333 :y (/ 839 3) :w 41 :h 15]))))))))
           ([BLOCK :tag P :x 131 :y (/ 3698 12) :w 518 :h 20 :class (op_dict3_morelink)]
            ([MAGIC :tag A :x 178 :y (/ 3698 12) :w 52 :h 20 :mt 0 :mr 12 :mb 0 :ml 0]
             ([TEXT :x 178 :y 309.7 :w 52 :h 17]))
            ([ANON]
             ([LINE]
              ([TEXT :x 242 :y 310.7 :w 4 :h 15])))
            ([MAGIC :tag A :x 246 :y (/ 3698 12) :w 52 :h 20 :mt 0 :mr 12 :mb 0 :ml 0]
             ([TEXT :x 246 :y 309.7 :w 52 :h 17])))
           ([BLOCK :tag DIV :x 131 :y 341.2 :w 518 :h (/ 1861 30) :class (op_dict3_extra)]
            ([BLOCK :tag DIV :x 131 :y 355.2 :w 518 :h (/ 1441 30) :class (op_dict3_extra_confused)]
             ([BLOCK :tag P :x 131 :y 355.2 :w 518 :h 20 :class (op_dict3_extra_confused_firstp)]
              ([LINE]
               ([TEXT :x 131 :y 356.7 :w 56 :h 17])))
             ([MAGIC :tag P :x 131 :y (/ 11377 30) :w 132 :h 20 :mt 0 :mr 6 :mb 4 :ml 0 :id e10003 :class (op_dict3_extra_confused_p)]
              ([MAGIC :tag SPAN :x 131 :y (/ 11377 30) :w 47 :h 20 :mt 0 :mr 4 :mb 0 :ml 0]
               ([INLINE :tag A]
                ([TEXT :x 131 :y 357.875 :w 47 :h 15])))
              ([TEXT :x 182 :y 357.875 :w 4 :h 15])
              ([MAGIC :tag SPAN :x 186 :y (/ 11377 30) :w 73 :h 20 :mt 0 :mr 4 :mb 0 :ml 0]
               ([TEXT :x 186 :y 356.875 :w 73 :h 17]))))))
          ([BLOCK :tag DIV :x 1727 :y (/ 12097 30) :w 1 :h 1 :class (op_dict_fmp_flash_div)]
           ([LINE]
            ([INLINE :tag EMBED :id op_dict_fmp_flash_1454705471151]))))
         ([BLOCK :tag DIV :x 121 :y (/ 12547 30) :w 538 :h 20 :class (c-gap-top-small)]
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :class (c-showurl)]
             ([TEXT :x 121 :y (/ 6311 15) :w 95 :h 15]))))
          ([MAGIC :tag I :x 216 :y (/ 6326 15) :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :id tools_12991445509015342431_1 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))))))
        ([BLOCK :tag DIV :x 121 :y 452.25 :w 538 :h 121.625 :id 2 :class (result-op c-container xpath-log)]
         ([BLOCK :tag H3 :x 121 :y 452.25 :w 538 :h (/ 739 30) :class (t c-gap-bottom-small)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y (/ 6841 15) :w 57 :h 17]))
            ([TEXT :x 178 :y (/ 6826 15) :w 73 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y 481.9 :w 538 :h (/ 1201 12) :class (c-row)]
          ([BLOCK :tag DIV :x 121 :y 481.9 :w 535 :h (/ 1201 12) :class (c-span24 c-span-last)]
           ([BLOCK :tag P :x 121 :y 481.9 :w 535 :h 20]
            ([LINE]
             ([TEXT :x 121 :y (/ 7251 15) :w 127 :h 17])))
           ([BLOCK :tag P :x 121 :y 501.9 :w 535 :h 20]
            ([LINE]
             ([INLINE :tag SPAN :class (c-gap-right)]
              ([TEXT :x 121 :y 503.4 :w 91 :h 17]))))
           ([BLOCK :tag P :x 121 :y (/ 6263 12) :w 535 :h 20]
            ([LINE]
             ([INLINE :tag EM]
              ([TEXT :x 121 :y (/ 6293 12) :w 47 :h 15]))
             ([TEXT :x 168 :y (/ 6281 12) :w 327 :h 17])))
           ([BLOCK :tag P :x 121 :y (/ 8129 15) :w 535 :h 20]
            ([LINE]
             ([INLINE :tag A :class (c-gap-right-small op-se-listen-recommend)]
              ([TEXT :x 121 :y (/ 16303 30) :w 52 :h 17]))
             ([TEXT :x 179 :y (/ 16333 30) :w 4 :h 15])
             ([INLINE :tag A :class (c-gap-right-small op-se-listen-recommend)]
              ([TEXT :x 183 :y (/ 16303 30) :w 52 :h 17]))))
           ([BLOCK :tag P :x 121 :y 561.95 :w 535 :h 20 :class ( op-bk-polysemy-move)]
            ([ANON]
             ([LINE]
              ([INLINE :tag SPAN :class (c-showurl)]
               ([TEXT :x 121 :y 564.45 :w 103 :h 15]))))
            ([MAGIC :tag I :x 224 :y 565.45 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
            ([ANON]
             ([LINE]
              ([INLINE :tag SPAN :id tools_13337321428023985492_2 :class (c-tools)]
               ([INLINE :tag A :class (c-tip-icon)]))))))))
        ([BLOCK :tag DIV :x 121 :y (/ 17879 30) :w 538 :h 109.7 :id 3 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y (/ 17879 30) :w 538 :h (/ 739 30) :class (t c-title-en)]
          ([LINE]
           ([INLINE :tag A]
            ([TEXT :x 121 :y (/ 17993 30) :w 45 :h 17])
            ([INLINE :tag EM]
             ([TEXT :x 166 :y (/ 17993 30) :w 57 :h 17]))
            ([TEXT :x 223 :y (/ 17993 30) :w 307 :h 17]))))
         ([BLOCK :tag DIV :x 121 :y 625.6 :w 538 :h (/ 1201 15) :class (c-row c-gap-top-small)]
          ([BLOCK :tag DIV :x 121 :y 625.6 :w 121 :h 75 :class (general_image_pic c-span6)]
           ([BLOCK :tag A :x 121 :y 625.6 :w 121 :h 75 :id e10006 :class (c-img6)]
            ([BLOCK :tag IMG :x 121 :y 625.6 :w 121 :h 75 :id e10007 :class (c-img c-img6)])))
          ([BLOCK :tag DIV :x 259 :y 625.6 :w 397 :h (/ 1201 15) :class (c-span18 c-span-last)]
           ([BLOCK :tag DIV :x 259 :y 625.6 :w 397 :h 20 :class (m)]
            ([LINE]
             ([TEXT :x 259 :y 627.1 :w 186 :h 17])
             ([INLINE :tag A :class (m)]
              ([TEXT :x 445 :y 627.1 :w 52 :h 17]))))
           ([BLOCK :tag DIV :x 259 :y (/ 9684 15) :w 397 :h (/ 1201 30) :class (c-abstract c-abstract-en)]
            ([LINE]
             ([TEXT :x 259 :y 648.1 :w 38 :h 15])
             ([INLINE :tag EM]
              ([TEXT :x 297 :y 648.1 :w 47 :h 15]))
             ([TEXT :x 344 :y 648.1 :w 306 :h 15]))
            ([LINE]
             ([TEXT :x 259 :y (/ 10022 15) :w 325 :h 15])))
           ([BLOCK :tag DIV :x 259 :y 685.65 :w 397 :h 20 :class (f13)]
            ([ANON]
             ([LINE]
              ([INLINE :tag A :id e10008 :class (c-showurl)]
               ([TEXT :x 259 :y 688.15 :w 139 :h 15]))))
            ([MAGIC :tag I :x 398 :y 689.15 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
            ([ANON]
             ([LINE]
              ([INLINE :tag DIV :id tools_5691720681783251077_3 :class (c-tools)]
               ([INLINE :tag A :class (c-tip-icon)]))))
            ([MAGIC :tag SPAN :x 412 :y 685.65 :w 0 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icons-outer)]
             ([INLINE :tag SPAN :class (c-icons-inner)]))
            ([ANON]
             ([LINE]
              ([TEXT :x 412 :y 688.15 :w 12 :h 15])
              ([INLINE :tag A :class (m)]
               ([TEXT :x 424 :y 687.15 :w 52 :h 17]))))))))
        ([BLOCK :tag DIV :x 121 :y (/ 2159 3) :w 538 :h 85.7 :id 4 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y (/ 2159 3) :w 538 :h (/ 739 30) :class (t)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y (/ 21705 30) :w 53 :h 17]))
            ([TEXT :x 174 :y (/ 21675 30) :w 89 :h 20])
            ([INLINE :tag EM]
             ([TEXT :x 263 :y (/ 21705 30) :w 53 :h 17]))
            ([TEXT :x 316 :y (/ 21675 30) :w 290 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y 745.3 :w 538 :h (/ 1201 30) :class (c-abstract)]
          ([LINE]
           ([TEXT :x 121 :y 746.8 :w 173 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 294 :y 747.8 :w 45 :h 15]))
           ([TEXT :x 339 :y 746.8 :w 69 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 408 :y 747.8 :w 45 :h 15]))
           ([TEXT :x 453 :y 746.8 :w 69 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 522 :y 747.8 :w 45 :h 15]))
           ([TEXT :x 567 :y 746.8 :w 43 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 610 :y 747.8 :w 45 :h 15])))
          ([LINE]
           ([TEXT :x 121 :y (/ 9202 12) :w 56 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 177 :y (/ 9214 12) :w 45 :h 15]))
           ([TEXT :x 222 :y (/ 9202 12) :w 56 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 278 :y (/ 9214 12) :w 45 :h 15]))
           ([TEXT :x 323 :y (/ 9202 12) :w 117 :h 17])))
         ([BLOCK :tag DIV :x 121 :y (/ 2356 3) :w 538 :h 20 :class (f13)]
          ([ANON]
           ([LINE]
            ([INLINE :tag A :id e10010 :class (c-showurl)]
             ([TEXT :x 121 :y (/ 4727 6) :w 90 :h 15])
             ([INLINE :tag B]
              ([TEXT :x 211 :y (/ 4727 6) :w 45 :h 15]))
             ([TEXT :x 256 :y (/ 4727 6) :w 4 :h 15]))))
          ([MAGIC :tag I :x 260 :y (/ 4733 6) :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
          ([ANON]
           ([LINE]
            ([INLINE :tag DIV :id tools_3681082031080138747_4 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))))
          ([MAGIC :tag SPAN :x 274 :y (/ 2356 3) :w 24 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icons-outer)]
           ([INLINE :tag SPAN :class (c-icons-inner)]
            ([MAGIC :tag SPAN :x 273 :y (/ 4727 6) :w 1 :h 12 :mt 0 :mr 3 :mb 0 :ml 3 :class (c-vline)])
            ([INLINE :tag SPAN :class (c-trust-as vstar)]
             ([MAGIC :tag A :x 277 :y (/ 4721 6) :w 21 :h 16 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-v c-icon-v1)]))))
          ([ANON]
           ([LINE]
            ([TEXT :x 298 :y (/ 4727 6) :w 12 :h 15])
            ([INLINE :tag A :class (m)]
             ([TEXT :x 310 :y (/ 4721 6) :w 52 :h 17]))
            ([INLINE :tag SPAN]
             ([TEXT :x 362 :y (/ 4727 6) :w 12 :h 15])
             ([INLINE :tag A :class (m)]
              ([TEXT :x 374 :y (/ 4721 6) :w 52 :h 17])))))))
        ([BLOCK :tag DIV :x 121 :y 819.35 :w 538 :h 302.7 :id 5 :class (result-op c-container)]
         ([BLOCK :tag H3 :x 121 :y 819.35 :w 538 :h (/ 739 30) :class (t c-gap-bottom-small)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y (/ 4939 6) :w 53 :h 17]))
            ([TEXT :x 174 :y (/ 4933 6) :w 178 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y 863 :w 538 :h (/ 7591 30) :class (c-tabs test-tabs)]
          ([BLOCK :tag DIV :x 121 :y 863 :w 538 :h 28 :class (c-tabs-nav)]
           ([BLOCK :tag DIV :x 121 :y 863 :w 538 :h 28 :class (c-tabs-nav-view)]
            ([BLOCK :tag UL :x 121 :y 863 :w 525 :h 28 :class (c-tabs-nav-more)]
             ([MAGIC :tag LI :x 121 :y 863 :w 102 :h 28 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-tabs-nav-li OP_LOG_BTN c-tabs-nav-selected)]
              ([MAGIC :tag B :x 137 :y (/ 25635 30) :w 18 :h 17 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-baidu)])
              ([TEXT :x 155 :y (/ 25665 30) :w 52 :h 17]))
             ([MAGIC :tag LI :x 223 :y 857 :w 2 :h 16 :mt 0 :mr 0 :mb 4 :ml 0 :id e10013 :class (c-tabs-nav-sep)])
             ([MAGIC :tag LI :x 225 :y 863 :w 102 :h 28 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-tabs-nav-li OP_LOG_BTN)]
              ([MAGIC :tag B :x 241 :y (/ 25635 30) :w 18 :h 17 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-xiami)])
              ([TEXT :x 259 :y (/ 25665 30) :w 52 :h 17]))
             ([MAGIC :tag LI :x 327 :y 857 :w 2 :h 16 :mt 0 :mr 0 :mb 4 :ml 0 :id e10014 :class (c-tabs-nav-sep)])
             ([MAGIC :tag LI :x 329 :y 863 :w 102 :h 28 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-tabs-nav-li OP_LOG_BTN)]
              ([MAGIC :tag B :x 345 :y (/ 25635 30) :w 18 :h 17 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-kuwo)])
              ([TEXT :x 363 :y (/ 25665 30) :w 52 :h 17]))
             ([MAGIC :tag LI :x 431 :y 857 :w 2 :h 16 :mt 0 :mr 0 :mb 4 :ml 0 :id e10015 :class (c-tabs-nav-sep)])
             ([MAGIC :tag LI :x 433 :y 863 :w 115 :h 28 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-tabs-nav-li OP_LOG_BTN)]
              ([MAGIC :tag B :x 449 :y (/ 25635 30) :w 18 :h 17 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-wangyi)])
              ([TEXT :x 467 :y (/ 25665 30) :w 65 :h 17]))
             ([MAGIC :tag LI :x 548 :y 857 :w 2 :h 16 :mt 0 :mr 0 :mb 4 :ml 0 :id e10016 :class (c-tabs-nav-sep)])
             ([MAGIC :tag LI :x 550 :y 863 :w 96 :h 28 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-tabs-nav-li OP_LOG_BTN)]
              ([MAGIC :tag B :x 566 :y (/ 25635 30) :w 18 :h 17 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-qq)])
              ([TEXT :x 584 :y (/ 25665 30) :w 46 :h 17])))))
          ([BLOCK :tag DIV :x 121 :y 877 :w 538 :h 225 :class (c-tabs-content)]
           ([MAGIC :tag TABLE :x 121 :y 877 :w 538 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-table op-singer-v2-songs)]
            ([MAGIC :tag TBODY :x 121 :y 877 :w 538 :h 200 :mt 0 :mr 0 :mb 0 :ml 0]
             ([MAGIC :tag TR :x 121 :y 877 :w 538 :h 35 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-table-nohihead)]
              ([MAGIC :tag TH :x 121 :y 877 :w 24 :h 35 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag INPUT :class (op-singer-v2-checkall)]))
              ([MAGIC :tag TH :x 145 :y 877 :w 64 :h 35 :mt 0 :mr 0 :mb 0 :ml 0]
               ([TEXT :x 155 :y (/ 26565 30) :w 26 :h 17]))
              ([MAGIC :tag TH :x 209 :y 877 :w 312 :h 35 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon op-singer-v2-songs-iconpl)]
               ([MAGIC :tag A :x 222 :y 881 :w 127 :h 26 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-btn op-singer-v2-select-btn)]
                ([BLOCK :tag I :x 237 :y 887 :w 14 :h 14 :class (c-icon c-icon-play-blue c-gap-icon-right-small op-singer-v2-btn-icon)])
                ([TEXT :x 256 :y 886 :w 78 :h 17])))
              ([MAGIC :tag TH :x 521 :y 877 :w 46 :h 35 :mt 0 :mr 0 :mb 0 :ml 0]
               ([TEXT :x 531 :y (/ 26565 30) :w 26 :h 17]))
              ([MAGIC :tag TH :x 567 :y 877 :w 46 :h 35 :mt 0 :mr 0 :mb 0 :ml 0]
               ([TEXT :x 577 :y (/ 26565 30) :w 26 :h 17]))
              ([MAGIC :tag TH :x 613 :y 877 :w 46 :h 35 :mt 0 :mr 0 :mb 0 :ml 0]
               ([TEXT :x 623 :y (/ 26565 30) :w 26 :h 17])))
             ([MAGIC :tag TR :x 121 :y 912 :w 538 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TD :x 121 :y 912 :w 24 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag INPUT :class (op-singer-v2-check)]))
              ([MAGIC :tag TD :x 145 :y 912 :w 36 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag SPAN :class (c-gray)]
                ([TEXT :x 155 :y 921 :w 14 :h 15])))
              ([MAGIC :tag TD :x 181 :y 912 :w 28 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([MAGIC :tag SPAN :x 191 :y (/ 5521 6) :w 12 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-earth)]))
              ([MAGIC :tag TD :x 209 :y 912 :w 134 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-lpadding)]
               ([BLOCK :tag DIV :x 211 :y 921.35 :w 131 :h 14.3 :class (op-singer-v2-songs-songname)]
                ([LINE]
                 ([INLINE :tag A]
                  ([TEXT :x 221 :y 921 :w 14 :h 15])))))
              ([MAGIC :tag TD :x 343 :y 912 :w 181 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-nopadding)]
               ([BLOCK :tag DIV :x 343 :y 921.35 :w 165 :h 14.3 :class (op-singer-v2-songs-songv2)]
                ([LINE]
                 ([INLINE :tag A :class (op-se-listen-recommend)]
                  ([TEXT :x 343 :y 920 :w 140 :h 17])))))
              ([MAGIC :tag TD :x 521 :y 912 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 531 :y 919 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-play-circle)]))
              ([MAGIC :tag TD :x 567 :y 912 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag SPAN :x 577 :y 919 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-lrc-gray)]))
              ([MAGIC :tag TD :x 613 :y 912 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 623 :y 919 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-download op-se-listen-recommend)])))
             ([MAGIC :tag TR :x 121 :y 945 :w 538 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TD :x 121 :y 945 :w 24 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag INPUT :class (op-singer-v2-check)]))
              ([MAGIC :tag TD :x 145 :y 945 :w 36 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag SPAN :class (c-gray)]
                ([TEXT :x 155 :y 954 :w 14 :h 15])))
              ([MAGIC :tag TD :x 181 :y 945 :w 28 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([MAGIC :tag SPAN :x 191 :y (/ 5719 6) :w 12 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-earth)]))
              ([MAGIC :tag TD :x 209 :y 945 :w 134 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-lpadding)]
               ([BLOCK :tag DIV :x 211 :y 954.35 :w 131 :h 14.3 :class (op-singer-v2-songs-songname)]
                ([LINE]
                 ([INLINE :tag A]
                  ([TEXT :x 221 :y 954 :w 112 :h 15])))))
              ([MAGIC :tag TD :x 343 :y 945 :w 181 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-nopadding)]
               ([BLOCK :tag DIV :x 343 :y 954.35 :w 165 :h 14.3 :class (op-singer-v2-songs-songv2)]
                ([LINE]
                 ([INLINE :tag A :class (op-se-listen-recommend)]
                  ([TEXT :x 343 :y 953 :w 147 :h 17])))))
              ([MAGIC :tag TD :x 521 :y 945 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 531 :y 952 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-play-circle)]))
              ([MAGIC :tag TD :x 567 :y 945 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 577 :y 952 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-lyric)]))
              ([MAGIC :tag TD :x 613 :y 945 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 623 :y 952 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-download op-se-listen-recommend)])))
             ([MAGIC :tag TR :x 121 :y 978 :w 538 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TD :x 121 :y 978 :w 24 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag INPUT :class (op-singer-v2-check)]))
              ([MAGIC :tag TD :x 145 :y 978 :w 36 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag SPAN :class (c-gray)]
                ([TEXT :x 155 :y 987 :w 14 :h 15])))
              ([MAGIC :tag TD :x 181 :y 978 :w 28 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([MAGIC :tag SPAN :x 191 :y (/ 5917 6) :w 12 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-earth)]))
              ([MAGIC :tag TD :x 209 :y 978 :w 134 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-lpadding)]
               ([BLOCK :tag DIV :x 211 :y 987.35 :w 131 :h 14.3 :class (op-singer-v2-songs-songname)]
                ([LINE]
                 ([INLINE :tag A]
                  ([TEXT :x 221 :y 987 :w 70 :h 15])))))
              ([MAGIC :tag TD :x 343 :y 978 :w 181 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-nopadding)]
               ([BLOCK :tag DIV :x 343 :y 987.35 :w 165 :h 14.3 :class (op-singer-v2-songs-songv2)]
                ([LINE]
                 ([INLINE :tag A :class (op-se-listen-recommend)]
                  ([TEXT :x 343 :y 986 :w 75 :h 17])))))
              ([MAGIC :tag TD :x 521 :y 978 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 531 :y 985 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-play-circle)]))
              ([MAGIC :tag TD :x 567 :y 978 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag SPAN :x 577 :y 985 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-lrc-gray)]))
              ([MAGIC :tag TD :x 613 :y 978 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 623 :y 985 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-download op-se-listen-recommend)])))
             ([MAGIC :tag TR :x 121 :y 1011 :w 538 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TD :x 121 :y 1011 :w 24 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag INPUT :class (op-singer-v2-check)]))
              ([MAGIC :tag TD :x 145 :y 1011 :w 36 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag SPAN :class (c-gray)]
                ([TEXT :x 155 :y 1020 :w 14 :h 15])))
              ([MAGIC :tag TD :x 181 :y 1011 :w 28 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([MAGIC :tag SPAN :x 191 :y (/ 6115 6) :w 12 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-earth)]))
              ([MAGIC :tag TD :x 209 :y 1011 :w 134 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-lpadding)]
               ([BLOCK :tag DIV :x 211 :y 1020.35 :w 131 :h 14.3 :class (op-singer-v2-songs-songname)]
                ([LINE]
                 ([INLINE :tag A]
                  ([TEXT :x 221 :y 1020 :w 63 :h 15])))))
              ([MAGIC :tag TD :x 343 :y 1011 :w 181 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-nopadding)]
               ([TEXT :x 343 :y 1020 :w 4 :h 15]))
              ([MAGIC :tag TD :x 521 :y 1011 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 531 :y 1018 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-play-circle)]))
              ([MAGIC :tag TD :x 567 :y 1011 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag SPAN :x 577 :y 1018 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-lrc-gray)]))
              ([MAGIC :tag TD :x 613 :y 1011 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 623 :y 1018 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-download op-se-listen-recommend)])))
             ([MAGIC :tag TR :x 121 :y 1044 :w 538 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TD :x 121 :y 1044 :w 24 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag INPUT :class (op-singer-v2-check)]))
              ([MAGIC :tag TD :x 145 :y 1044 :w 36 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([INLINE :tag SPAN :class (c-gray)]
                ([TEXT :x 155 :y 1053 :w 14 :h 15])))
              ([MAGIC :tag TD :x 181 :y 1044 :w 28 :h 33 :mt 0 :mr 0 :mb 0 :ml 0]
               ([MAGIC :tag SPAN :x 191 :y (/ 6313 6) :w 12 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-earth)]))
              ([MAGIC :tag TD :x 209 :y 1044 :w 134 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-lpadding)]
               ([BLOCK :tag DIV :x 211 :y 1053.35 :w 131 :h 14.3 :class (op-singer-v2-songs-songname)]
                ([LINE]
                 ([INLINE :tag A]
                  ([TEXT :x 221 :y 1053 :w 75 :h 15])))))
              ([MAGIC :tag TD :x 343 :y 1044 :w 181 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-nopadding)]
               ([BLOCK :tag DIV :x 343 :y 1053.35 :w 165 :h 14.3 :class (op-singer-v2-songs-songv2)]
                ([LINE]
                 ([INLINE :tag A :class (op-se-listen-recommend)]
                  ([TEXT :x 343 :y 1052 :w 129 :h 17])))))
              ([MAGIC :tag TD :x 521 :y 1044 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 531 :y 1051 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-play-circle)]))
              ([MAGIC :tag TD :x 567 :y 1044 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag SPAN :x 577 :y 1051 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (opui-music-icon opui-music-icon-lrc-gray)]))
              ([MAGIC :tag TD :x 613 :y 1044 :w 46 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (op-singer-v2-songs-icon)]
               ([MAGIC :tag A :x 623 :y 1051 :w 18 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-download op-se-listen-recommend)])))))
           ([BLOCK :tag DIV :x 121 :y 1082 :w 538 :h 20 :class (c-gap-top-small)]
            ([LINE]
             ([INLINE :tag A :class (op-singer-v2-more)]
              ([TEXT :x 121 :y 1083.5 :w 26 :h 17])
              ([INLINE :tag EM]
               ([TEXT :x 147 :y 1084.5 :w 45 :h 15]))
              ([TEXT :x 192 :y 1083.5 :w 39 :h 17]))))))
         ([BLOCK :tag DIV :x 121 :y 1102 :w 538 :h 20]
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :class (c-showurl)]
             ([TEXT :x 121 :y (/ 33135 30) :w 103 :h 15]))))
          ([MAGIC :tag I :x 224 :y (/ 33165 30) :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
          ([ANON]
           ([LINE]
            ([INLINE :tag SPAN :id tools_14343896468837079761_5 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))))))
        ([BLOCK :tag DIV :x 121 :y (/ 34081 30) :w 538 :h 105.7 :id 6 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y (/ 34081 30) :w 538 :h (/ 739 30) :class (t c-title-en)]
          ([LINE]
           ([INLINE :tag A]
            ([TEXT :x 121 :y 1139.85 :w 55 :h 17])
            ([INLINE :tag EM]
             ([TEXT :x 176 :y 1139.85 :w 57 :h 17]))
            ([TEXT :x 233 :y 1139.85 :w 240 :h 17]))))
         ([BLOCK :tag DIV :x 121 :y (/ 3485 3) :w 538 :h (/ 1201 30) :class (c-abstract c-abstract-en)]
          ([LINE]
           ([TEXT :x 121 :y (/ 6985 6) :w 83 :h 15])
           ([INLINE :tag EM]
            ([TEXT :x 204 :y (/ 6985 6) :w 47 :h 15]))
           ([TEXT :x 251 :y (/ 6985 6) :w 403 :h 15]))
          ([LINE]
           ([TEXT :x 121 :y (/ 14210 12) :w 154 :h 15])))
         ([BLOCK :tag DIV :x 121 :y 1201.7 :w 538 :h 20 :class (sitelink-simple)]
          ([LINE]
           ([INLINE :tag A :class (c-gap-right)]
            ([TEXT :x 121 :y 1204.2 :w 69 :h 15]))
           ([INLINE :tag A :class (c-gap-right)]
            ([TEXT :x 202 :y 1204.2 :w 70 :h 15]))
           ([INLINE :tag A :class (c-gap-right)]
            ([TEXT :x 284 :y 1204.2 :w 45 :h 15]))
           ([INLINE :tag A]
            ([TEXT :x 341 :y 1204.2 :w 124 :h 15]))))
         ([BLOCK :tag DIV :x 121 :y 1145.375 :w 538 :h 20 :class (f13)]
          ([ANON]
           ([LINE]
            ([INLINE :tag A :id e10021 :class (c-showurl)]
             ([TEXT :x 121 :y (/ 36727 30) :w 139 :h 15]))))
          ([MAGIC :tag I :x 260 :y (/ 36757 30) :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
          ([ANON]
           ([LINE]
            ([INLINE :tag DIV :id tools_17529551308722024056_6 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))))
          ([MAGIC :tag SPAN :x 274 :y 1145.375 :w 0 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icons-outer)]
           ([INLINE :tag SPAN :class (c-icons-inner)]))
          ([ANON]
           ([LINE]
            ([TEXT :x 274 :y (/ 36727 30) :w 12 :h 15])
            ([INLINE :tag A :class (m)]
             ([TEXT :x 286 :y (/ 36697 30) :w 52 :h 17]))
            ([INLINE :tag SPAN]
             ([TEXT :x 338 :y (/ 36727 30) :w 12 :h 15])
             ([INLINE :tag A :class (m)]
              ([TEXT :x 350 :y (/ 36697 30) :w 52 :h 17])))
            ([TEXT :x 402 :y (/ 36727 30) :w 12 :h 15])
            ([INLINE :tag A :class (m)]
             ([TEXT :x 414 :y (/ 36697 30) :w 52 :h 17]))))))
        ([BLOCK :tag DIV :x 121 :y (/ 18836 15) :w 538 :h 85.7 :id 7 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y (/ 18836 15) :w 538 :h (/ 739 30) :class (t)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y 1259.55 :w 53 :h 17]))
            ([TEXT :x 174 :y 1258.55 :w 89 :h 20])
            ([INLINE :tag EM]
             ([TEXT :x 263 :y 1259.55 :w 53 :h 17]))
            ([TEXT :x 316 :y 1258.55 :w 301 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y (/ 38441 30) :w 538 :h (/ 1201 30) :class (c-abstract)]
          ([LINE]
           ([TEXT :x 121 :y (/ 19243 15) :w 216 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 337 :y (/ 19258 15) :w 45 :h 15]))
           ([TEXT :x 382 :y (/ 19243 15) :w 69 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 451 :y (/ 19258 15) :w 45 :h 15]))
           ([TEXT :x 496 :y (/ 19243 15) :w 69 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 565 :y (/ 19258 15) :w 45 :h 15]))
           ([TEXT :x 610 :y (/ 19243 15) :w 39 :h 17]))
          ([LINE]
           ([TEXT :x 121 :y 1302.9 :w 173 :h 17])))
         ([BLOCK :tag DIV :x 121 :y 1321.4 :w 538 :h 20 :class (f13)]
          ([ANON]
           ([LINE]
            ([INLINE :tag A :id e10023 :class (c-showurl)]
             ([TEXT :x 121 :y 1323.9 :w 43 :h 15])
             ([INLINE :tag B]
              ([TEXT :x 164 :y 1323.9 :w 45 :h 15]))
             ([TEXT :x 209 :y 1323.9 :w 4 :h 15]))))
          ([MAGIC :tag I :x 213 :y 1324.9 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
          ([ANON]
           ([LINE]
            ([INLINE :tag DIV :id tools_16220006361359376573_7 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))))
          ([MAGIC :tag SPAN :x 227 :y 1321.4 :w 0 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icons-outer)]
           ([INLINE :tag SPAN :class (c-icons-inner)]))
          ([ANON]
           ([LINE]
            ([TEXT :x 227 :y 1323.9 :w 12 :h 15])
            ([INLINE :tag A :class (m)]
             ([TEXT :x 239 :y 1322.9 :w 52 :h 17]))
            ([INLINE :tag SPAN]
             ([TEXT :x 291 :y 1323.9 :w 12 :h 15])
             ([INLINE :tag A :class (m)]
              ([TEXT :x 303 :y 1322.9 :w 52 :h 17])))))))
        ([BLOCK :tag DIV :x 121 :y (/ 16265 12) :w 538 :h 154.65 :id 8 :class (result-op c-container xpath-log)]
         ([BLOCK :tag H3 :x 121 :y (/ 16265 12) :w 538 :h (/ 739 30) :class (t c-gap-bottom-small)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y (/ 40777 30) :w 53 :h 17]))
            ([TEXT :x 174 :y (/ 40747 30) :w 73 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y 1385.05 :w 538 :h 105 :id ala_img_results :class (op_img_content)]
          ([BLOCK :tag DIV :x 121 :y 1385.05 :w 538 :h 105 :id ala_img_pics]
           ([MAGIC :tag A :x 121 :y 1385.05 :w 140 :h 105 :mt 0 :mr 0 :mb 0 :ml 0 :id e10026]
            ([INLINE :tag IMG :id e10027]))
           ([MAGIC :tag A :x 261 :y 1385.05 :w 80 :h 105 :mt 0 :mr 0 :mb 0 :ml 0 :id e10029]
            ([INLINE :tag IMG :id e10030]))
           ([MAGIC :tag A :x 341 :y 1385.05 :w 162 :h 105 :mt 0 :mr 0 :mb 0 :ml 0 :id e10032]
            ([INLINE :tag IMG :id e10033]))
           ([MAGIC :tag A :x 503 :y 1385.05 :w 156 :h 105 :mt 0 :mr 0 :mb 0 :ml 0 :id e10035]
            ([INLINE :tag IMG :id e10036]))))
         ([ANON]
          ([LINE]
           ([INLINE :tag SPAN :id ala_img_desc :class (c-showurl)]
            ([INLINE :tag SPAN :class (c-showurl)]
             ([TEXT :x 121 :y 1492.55 :w 103 :h 15]))
            ([INLINE :tag SPAN :id tools_14085810265887252366_8 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))
            ([TEXT :x 238 :y 1492.55 :w 12 :h 15])
            ([INLINE :tag A]
             ([TEXT :x 250 :y 1491.55 :w 112 :h 17])))))
         ([MAGIC :tag I :x 224 :y 1493.55 :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
         ([ANON]
          ([LINE])))
        ([BLOCK :tag DIV :x 121 :y (/ 22861 15) :w 538 :h 85.7 :id 9 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y (/ 22861 15) :w 538 :h (/ 739 30) :class (t c-title-en)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y 1527.9 :w 57 :h 17]))
            ([TEXT :x 178 :y 1527.9 :w 240 :h 17]))))
         ([BLOCK :tag DIV :x 121 :y 1549.7 :w 538 :h (/ 1201 30) :class (c-abstract c-abstract-en)]
          ([LINE]
           ([TEXT :x 121 :y 1552.2 :w 487 :h 15])
           ([INLINE :tag EM]
            ([TEXT :x 608 :y 1552.2 :w 47 :h 15]))
           ([TEXT :x 655 :y 1552.2 :w 4 :h 15]))
          ([LINE]
           ([TEXT :x 121 :y (/ 47167 30) :w 334 :h 15])))
         ([BLOCK :tag DIV :x 121 :y (/ 23846 15) :w 538 :h 20 :class (f13)]
          ([ANON]
           ([LINE]
            ([INLINE :tag A :id e10039 :class (c-showurl)]
             ([TEXT :x 121 :y (/ 47767 30) :w 139 :h 15]))))
          ([MAGIC :tag I :x 260 :y (/ 47797 30) :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
          ([ANON]
           ([LINE]
            ([INLINE :tag DIV :id tools_1246506936876385692_9 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))))
          ([MAGIC :tag SPAN :x 274 :y (/ 23846 15) :w 0 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icons-outer)]
           ([INLINE :tag SPAN :class (c-icons-inner)]))
          ([ANON]
           ([LINE]
            ([TEXT :x 274 :y (/ 47767 30) :w 12 :h 15])
            ([INLINE :tag A :class (m)]
             ([TEXT :x 286 :y (/ 47737 30) :w 52 :h 17]))
            ([INLINE :tag SPAN]
             ([TEXT :x 338 :y (/ 47767 30) :w 12 :h 15])
             ([INLINE :tag A :class (m)]
              ([TEXT :x 350 :y (/ 47737 30) :w 52 :h 17])))
            ([TEXT :x 402 :y (/ 47767 30) :w 12 :h 15])
            ([INLINE :tag A :class (m)]
             ([TEXT :x 414 :y (/ 47737 30) :w 52 :h 17]))))))
        ([BLOCK :tag DIV :x 121 :y 1623.75 :w 538 :h 85.7 :id 10 :class (result c-container )]
         ([BLOCK :tag H3 :x 121 :y 1623.75 :w 538 :h (/ 739 30) :class (t)]
          ([LINE]
           ([INLINE :tag A]
            ([INLINE :tag EM]
             ([TEXT :x 121 :y (/ 48827 30) :w 57 :h 17]))
            ([TEXT :x 178 :y (/ 48797 30) :w 45 :h 20]))))
         ([BLOCK :tag DIV :x 121 :y (/ 24741 15) :w 538 :h (/ 1201 30) :class (c-abstract)]
          ([LINE]
           ([TEXT :x 121 :y 1650.9 :w 41 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 162 :y 1651.9 :w 47 :h 15]))
           ([TEXT :x 209 :y 1650.9 :w 398 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 607 :y 1651.9 :w 47 :h 15])))
          ([LINE]
           ([TEXT :x 121 :y 1670.9 :w 264 :h 17])
           ([INLINE :tag EM]
            ([TEXT :x 385 :y 1671.9 :w 47 :h 15]))
           ([TEXT :x 432 :y 1670.9 :w 81 :h 17])))
         ([BLOCK :tag DIV :x 121 :y (/ 20273 12) :w 538 :h 20 :class (f13)]
          ([ANON]
           ([LINE]
            ([INLINE :tag A :id e10041 :class (c-showurl)]
             ([TEXT :x 121 :y (/ 20303 12) :w 136 :h 15])
             ([INLINE :tag B]
              ([TEXT :x 257 :y (/ 20303 12) :w 7 :h 15]))
             ([TEXT :x 264 :y (/ 20303 12) :w 16 :h 15]))))
          ([MAGIC :tag I :x 280 :y (/ 20315 12) :w 14 :h 14 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-triangle-down-g)])
          ([ANON]
           ([LINE]
            ([INLINE :tag DIV :id tools_18088649634398589249_10 :class (c-tools)]
             ([INLINE :tag A :class (c-tip-icon)]))))
          ([MAGIC :tag SPAN :x 294 :y (/ 20273 12) :w 24 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icons-outer)]
           ([INLINE :tag SPAN :class (c-icons-inner)]
            ([MAGIC :tag SPAN :x 293 :y (/ 20303 12) :w 1 :h 12 :mt 0 :mr 3 :mb 0 :ml 3 :class (c-vline)])
            ([INLINE :tag SPAN :class (c-trust-as vstar)]
             ([MAGIC :tag A :x 297 :y (/ 20291 12) :w 21 :h 16 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-v c-icon-v1)]))))
          ([ANON]
           ([LINE]
            ([TEXT :x 318 :y (/ 20303 12) :w 12 :h 15])
            ([INLINE :tag A :class (m)]
             ([TEXT :x 330 :y (/ 20291 12) :w 52 :h 17]))
            ([INLINE :tag SPAN]
             ([TEXT :x 382 :y (/ 20303 12) :w 12 :h 15])
             ([INLINE :tag A :class (m)]
              ([TEXT :x 394 :y (/ 20291 12) :w 52 :h 17]))))))))
       ([MAGIC :tag DIV :x 0 :y (/ 51703 30) :w 1212 :h 0 :mt 0 :mr 0 :mb 0 :ml 0 :id e10043])
       ([BLOCK :tag DIV :x 121 :y (/ 51883 30) :w 600 :h 104 :id rs]
        ([BLOCK :tag DIV :x 121 :y (/ 51883 30) :w 600 :h 30 :class (tt)]
         ([LINE]
          ([TEXT :x 121 :y (/ 26024 15) :w 68 :h 20])))
        ([MAGIC :tag TABLE :x 121 :y (/ 52783 30) :w 540 :h 74 :mt 0 :mr 0 :mb 0 :ml 0]
         ([MAGIC :tag TBODY :x 123 :y (/ 52843 30) :w 536 :h 70 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TR :x 123 :y (/ 52843 30) :w 536 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TH :x 123 :y (/ 52843 30) :w (/ 2597 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 123 :y (/ 52933 30) :w 107 :h 17])))
           ([MAGIC :tag TD :x (/ 4472 15) :y (/ 52843 30) :w (/ 73 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0])
           ([MAGIC :tag TH :x 305 :y (/ 52843 30) :w (/ 2576 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 305 :y (/ 52933 30) :w 56 :h 17])))
           ([MAGIC :tag TD :x (/ 7181 15) :y (/ 52843 30) :w (/ 73 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0])
           ([MAGIC :tag TH :x 485.6 :y (/ 52843 30) :w 173.4 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 485.6 :y (/ 52933 30) :w 76 :h 16]))))
          ([MAGIC :tag TR :x 123 :y (/ 53563 30) :w 536 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TH :x 123 :y (/ 53563 30) :w (/ 2597 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 123 :y (/ 53653 30) :w 75 :h 17])))
           ([MAGIC :tag TD :x (/ 4472 15) :y (/ 53563 30) :w (/ 73 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0])
           ([MAGIC :tag TH :x 305 :y (/ 53563 30) :w (/ 2576 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 305 :y (/ 53653 30) :w 42 :h 17])))
           ([MAGIC :tag TD :x (/ 7181 15) :y (/ 53563 30) :w (/ 73 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0])
           ([MAGIC :tag TH :x 485.6 :y (/ 53563 30) :w 173.4 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 485.6 :y (/ 53653 30) :w 56 :h 17]))))
          ([MAGIC :tag TR :x 123 :y (/ 54283 30) :w 536 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TH :x 123 :y (/ 54283 30) :w (/ 2597 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 123 :y (/ 54373 30) :w 53 :h 16])))
           ([MAGIC :tag TD :x (/ 4472 15) :y (/ 54283 30) :w (/ 73 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0])
           ([MAGIC :tag TH :x 305 :y (/ 54283 30) :w (/ 2576 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 305 :y (/ 54373 30) :w 28 :h 17])))
           ([MAGIC :tag TD :x (/ 7181 15) :y (/ 54283 30) :w (/ 73 15) :h 22 :mt 0 :mr 0 :mb 0 :ml 0])
           ([MAGIC :tag TH :x 485.6 :y (/ 54283 30) :w 173.4 :h 22 :mt 0 :mr 0 :mb 0 :ml 0]
            ([INLINE :tag A]
             ([TEXT :x 485.6 :y (/ 54373 30) :w 117 :h 16])))))))
       ([BLOCK :tag DIV :x 0 :y (/ 55903 30) :w 1212 :h 66 :id page]
        ([MAGIC :tag STRONG :x 121 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 127 :y (/ 55903 30) :w 24 :h 24 :class (fk fk_cur)]
          ([MAGIC :tag I :x 127 :y (/ 55873 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-p)]))
         ([BLOCK :tag SPAN :x 121 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 135 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 166 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 172 :y (/ 55903 30) :w 24 :h 24 :class (fk fkd)]
          ([MAGIC :tag I :x 172 :y (/ 56023 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 166 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 180 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 211 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 217 :y (/ 55903 30) :w 24 :h 24 :class (fk)]
          ([MAGIC :tag I :x 217 :y (/ 55843 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 211 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 225 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 256 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 262 :y (/ 55903 30) :w 24 :h 24 :class (fk fkd)]
          ([MAGIC :tag I :x 262 :y (/ 56023 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 256 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 270 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 301 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 307 :y (/ 55903 30) :w 24 :h 24 :class (fk)]
          ([MAGIC :tag I :x 307 :y (/ 55843 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 301 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 315 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 346 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 352 :y (/ 55903 30) :w 24 :h 24 :class (fk fkd)]
          ([MAGIC :tag I :x 352 :y (/ 56023 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 346 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 360 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 391 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 397 :y (/ 55903 30) :w 24 :h 24 :class (fk)]
          ([MAGIC :tag I :x 397 :y (/ 55843 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 391 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 405 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 436 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 442 :y (/ 55903 30) :w 24 :h 24 :class (fk fkd)]
          ([MAGIC :tag I :x 442 :y (/ 56023 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 436 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 450 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 481 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 487 :y (/ 55903 30) :w 24 :h 24 :class (fk)]
          ([MAGIC :tag I :x 487 :y (/ 55843 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 481 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 495 :y (/ 57103 30) :w 8 :h 16]))))
        ([MAGIC :tag A :x 526 :y (/ 55903 30) :w 36 :h 66 :mt 0 :mr 9 :mb 0 :ml 0]
         ([BLOCK :tag SPAN :x 532 :y (/ 55903 30) :w 24 :h 24 :class (fk fkd)]
          ([MAGIC :tag I :x 532 :y (/ 56023 30) :w 24 :h 24 :mt 0 :mr 0 :mb 0 :ml 0 :class (c-icon c-icon-bear-pn)]))
         ([BLOCK :tag SPAN :x 526 :y (/ 56803 30) :w 36 :h 36 :class (pc)]
          ([LINE]
           ([TEXT :x 536 :y (/ 57103 30) :w 16 :h 16]))))
        ([MAGIC :tag A :x 571 :y (/ 56803 30) :w 88 :h 36 :mt 0 :mr 9 :mb 0 :ml 0 :class (n)]
         ([TEXT :x 590 :y (/ 57103 30) :w 50 :h 17])))
       ([BLOCK :tag DIV :x 0 :y (/ 59083 30) :w 661 :h 0 :id content_bottom]))
      ([BLOCK :tag DIV :x 0 :y (/ 59083 30) :w 1728 :h 43 :id foot]
       ([BLOCK :tag SPAN :x 0 :y (/ 59113 30) :w 331 :h 42 :id help]
        ([LINE]
         ([INLINE :tag A]
          ([TEXT :x 136 :y (/ 59503 30) :w 24 :h 16]))
         ([INLINE :tag A]
          ([TEXT :x 190 :y (/ 59503 30) :w 24 :h 16]))
         ([INLINE :tag A :class (feedback)]
          ([TEXT :x 244 :y (/ 59503 30) :w 72 :h 16])))))
      ([BLOCK :tag DIV :x 0 :y (/ 60373 30) :w 1728 :h 0 :id c-tips-container :class (c-tips-container)])))
    ([BLOCK :tag DIV :x 0 :y (/ 60373 30) :w 1728 :h 0 :id c-tips-container :class (c-tips-container)]))))

(define-problem verify
  #:test (forall (a b)
                 (=>
                  (and
                   (not (= a b))
                   (or (is-box/text (type a))
                       (and (not (is-nil-elt (element a)))
                            (is-tag/a (tagname (get/elt (element a))))))
                   (or (is-box/text (type b))
                       (and (not (is-nil-elt (element b)))
                            (is-tag/a (tagname (get/elt (element b)))))))
                  (not (overlaps a b))))
  #:sheet doc-1
  #:documents doc-1)
