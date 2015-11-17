;; python get_bench.py --name google 'file:///tmp/hello - Google Search.html'

(define-header header
"")

;; From file:///tmp/hello - Google Search.html

(define-stylesheet doc-1
  ((id logo)
   [display display/block]
   [height (height/px 37)]
   #;[overflow-x overflow-x/hidden]
   #;[overflow-y overflow-y/hidden]
   #;[position position/relative]
   [width (width/px 95)])
  ((id logocont)
   #;[z-index z-index/1]
   [padding-left (padding/px 13)]
   [padding-right (padding/px 10)]
   [margin-top (margin/px -2)]
   [padding-top (padding/px 6)])
  ((id gs_st0)
   #;[line-height (line-height/px 38)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 8)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 8)]
   [margin-top (margin/px -1)]
   #;[position position/static])
  ((id sblsbb)
   [text-align text-align/center]
   #;[border-bottom-left-radius (border/px 0)]
   #;[border-top-left-radius (border/px 0)]
   [height (height/px 40)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [width (width/px 40)]
   #;[min-width (min-width/px 38)]
   #;[background-color background-color/rgb(66, 133, 244)]
   #;[background-image background-image/none]
   [border-top-width border/medium]
   [border-right-width border/medium]
   [border-bottom-width border/medium]
   [border-left-width border/medium]
   #;[border-top-style border/none]
   #;[border-right-style border/none]
   #;[border-bottom-style border/none]
   #;[border-left-style border/none]
   #;[border-top-color border/-moz-use-text-color]
   #;[border-right-color border/-moz-use-text-color]
   #;[border-bottom-color border/-moz-use-text-color]
   #;[border-left-color border/-moz-use-text-color]
   #;[border-image-source border/none]
   #;[border-image-slice border/100% 100% 100% 100%]
   #;[border-image-width border/1 1 1 1]
   #;[border-image-outset (border/px 0)]
   #;[border-image-repeat border/stretch stretch])
  ((id sbds)
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   #;[border-top-style border/none]
   #;[border-right-style border/none]
   #;[border-bottom-style border/none]
   #;[border-left-style border/none]
   #;[border-top-color border/-moz-use-text-color]
   #;[border-right-color border/-moz-use-text-color]
   #;[border-bottom-color border/-moz-use-text-color]
   #;[border-left-color border/-moz-use-text-color]
   #;[border-image-source border/none]
   #;[border-image-slice border/100% 100% 100% 100%]
   #;[border-image-width border/1 1 1 1]
   #;[border-image-outset (border/px 0)]
   #;[border-image-repeat border/stretch stretch]
   [margin-left (margin/px 0)])
  ((id sfopt)
   [display display/inline-block]
   [float float/right]
   #;[line-height line-height/normal])
  ((id sform)
   [height (height/px 34)])
  ((id searchform)
   [width width/100%])
  ((id pocs)
   #;[background-color background-color/rgb(255, 241, 168)]
   #;[background-image background-image/none]
   #;[background-repeat background-repeat/repeat]
   #;[background-attachment background-attachment/scroll]
   #;[background-position (background-position/px 0)]
   #;[background-clip background-clip/border-box]
   #;[background-origin background-origin/padding-box]
   #;[background-size background-size/auto auto]
   #;[color color/rgb(0, 0, 0)]
   #;[font-size (font-size/px (/ 40 3))]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 5)]
   [padding-right (padding/px 7)]
   [padding-bottom (padding/px 5)]
   [padding-left (padding/px 7)])
  ((id cnt)
   [padding-top (padding/px 15)])
  ((tag body)
   #;[color color/rgb(0, 0, 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   #;[overflow-y overflow-y/scroll])
  ((tag body)
   #;[background-color background-color/rgb(255, 255, 255)]
   #;[background-image background-image/none]
   #;[background-repeat background-repeat/repeat]
   #;[background-attachment background-attachment/scroll]
   #;[background-position (background-position/px 0)]
   #;[background-clip background-clip/border-box]
   #;[background-origin background-origin/padding-box]
   #;[background-size background-size/auto auto])
  ((id rhs_block)
   [padding-bottom (padding/px 15)])
  ((or (tag h1) (tag ol) (tag ul) (tag li))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((desc (id nav) (tag a))
   [display display/block])
  ((desc (id nav) (tag td))
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [text-align text-align/center])
  ((id res)
   [padding-right (padding/px 16)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 16)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 16)])
  ((id rhs)
   [display display/block]
   [margin-left (margin/px 712)]
   [padding-bottom (padding/px 10)]
   #;[min-width (min-width/px 268)])
  ((id nyc)
   #;[bottom (bottom/px 0)]
   [display display/none]
   #;[left (left/px 0)]
   [margin-left (margin/px 663)]
   #;[min-width (min-width/px 317)]
   #;[overflow-x overflow-x/hidden]
   #;[overflow-y overflow-y/hidden]
   #;[position position/fixed]
   #;[right (right/px 0)]
   #;[visibility visibility/visible])
  ((or (tag ol) (tag ul) (tag li))
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   #;[border-top-style border/none]
   #;[border-right-style border/none]
   #;[border-bottom-style border/none]
   #;[border-left-style border/none]
   #;[border-top-color border/-moz-use-text-color]
   #;[border-right-color border/-moz-use-text-color]
   #;[border-bottom-color border/-moz-use-text-color]
   #;[border-left-color border/-moz-use-text-color]
   #;[border-image-source border/none]
   #;[border-image-slice border/100% 100% 100% 100%]
   #;[border-image-width border/1 1 1 1]
   #;[border-image-outset (border/px 0)]
   #;[border-image-repeat border/stretch stretch]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)])
  ((or (desc (id cnt) (id center_col)) (desc (id cnt) (id foot)))
   [width (width/px 528)])
  ((id gbar)
   [margin-left (margin/px 8)]
   [height (height/px 20)])
  ((id guser)
   [margin-right (margin/px 8)]
   [padding-bottom (padding/px 5)])
  ((id center_col)
   [margin-left (margin/px 138)]
   [margin-right (margin/px 254)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 8)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 8)])
  ((id subform_ctrl)
   [height (height/px 11)]
   #;[font-size (font-size/px 11)]
   [margin-right (margin/px 480)]
   #;[position position/relative]
   #;[z-index z-index/99])
  ((id res)
   [border-top-width (border/px 0)]
   [border-right-width (border/px 0)]
   [border-bottom-width (border/px 0)]
   [border-left-width (border/px 0)]
   #;[border-top-style border/none]
   #;[border-right-style border/none]
   #;[border-bottom-style border/none]
   #;[border-left-style border/none]
   #;[border-top-color border/-moz-use-text-color]
   #;[border-right-color border/-moz-use-text-color]
   #;[border-bottom-color border/-moz-use-text-color]
   #;[border-left-color border/-moz-use-text-color]
   #;[border-image-source border/none]
   #;[border-image-slice border/100% 100% 100% 100%]
   #;[border-image-width border/1 1 1 1]
   #;[border-image-outset (border/px 0)]
   #;[border-image-repeat border/stretch stretch]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 8)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 8)])
  ((id ires)
   [padding-top (padding/px 6)])
  ((id tbbc)
   #;[background-color background-color/rgb(235, 239, 249)]
   #;[background-image background-image/none]
   #;[background-repeat background-repeat/repeat]
   #;[background-attachment background-attachment/scroll]
   #;[background-position (background-position/px 0)]
   #;[background-clip background-clip/border-box]
   #;[background-origin background-origin/padding-box]
   #;[background-size background-size/auto auto]
   [margin-bottom (margin/px 4)])
  ((desc (id tbbc) (tag dfn))
   [padding-top (padding/px 4)]
   [padding-right (padding/px 4)]
   [padding-bottom (padding/px 4)]
   [padding-left (padding/px 4)])
  ((or (desc (id fll) (tag a)) (desc (id bfl) (tag a)))
   #;[color color/rgb(26, 13, 171)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 12)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 12)]
   #;[text-decoration-color text-decoration-color/-moz-use-text-color]
   #;[text-decoration-line text-decoration-line/none]
   #;[text-decoration-style text-decoration-style/solid])
  ((id rcnt)
   [margin-top (margin/px 3)])
  ((id appbar)
   #;[background-color background-color/white]
   #;[background-image background-image/none]
   #;[background-repeat background-repeat/repeat]
   #;[background-attachment background-attachment/scroll]
   #;[background-position (background-position/px 0)]
   #;[background-clip background-clip/border-box]
   #;[background-origin background-origin/padding-box]
   #;[background-size background-size/auto auto]
   [width width/100%])
  ((id main)
   [width width/100%])
  ((id ab_ctls)
   [float float/right]
   #;[position position/relative]
   #;[right (right/px 28)]
   #;[z-index z-index/3])
  ((id ab_opt_icon)
   [height (height/px 17)]
   [margin-top (margin/px -2)]
   [width (width/px 17)])
  ((id top_nav))
  ((id tbpi)
   [margin-top (margin/px 0)])
  ((id tbrt)
   [margin-top (margin/px -20)])
  ((id resultstats)
   [padding-left (padding/px 16)]
   [padding-top (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-right (padding/px 8)])
  ((id subform_ctrl)
   [margin-left (margin/px 149)])
  ((id tsf)
   [width (width/px 833)])
  ((id ataw)
   [margin-left (margin/px 120)])
  ((desc (id hdtb-more-mn) (tag a))
   [display display/block]
   [padding-top (padding/px 6)]
   [padding-right (padding/px 16)]
   [padding-bottom (padding/px 6)]
   [padding-left (padding/px 16)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)])
  ((id hdtbsum)
   #;[background-color background-color/rgb(255, 255, 255)]
   #;[background-image background-image/none]
   #;[background-repeat background-repeat/repeat]
   #;[background-attachment background-attachment/scroll]
   #;[background-position (background-position/px 0)]
   #;[background-clip background-clip/border-box]
   #;[background-origin background-origin/padding-box]
   #;[background-size background-size/auto auto]
   [border-bottom-width (border/px 1)]
   #;[border-bottom-style border/solid]
   #;[border-bottom-color border/rgb(235, 235, 235)]
   [height (height/px 40)]
   #;[line-height (line-height/px 35)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   #;[position position/relative]
   #;[z-index z-index/102])
  ((id hdtbsum)
   [height (height/px 59)])
  ((id hdtb-msb)
   [display display/inline-block]
   [float float/left]
   #;[position position/relative]
   #;[white-space white-space/nowrap])
  ((id hdtb-more)
   [display display/inline-block]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 16)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 16)]
   #;[position position/relative])
  ((id viewport)
   #;[position position/absolute]
   #;[top (top/px 0)]
   [width width/100%])
  ((desc (id mss) (tag p))
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [padding-top (padding/px 5)])
  ((id imagebox_bigimages))
  ((id imagebox_bigimages)
   [margin-bottom (margin/px 16)])
  ((id iur)
   [padding-bottom (padding/px 16)])
  ((tag g-img)
   [display display/block])
  ((id brs))
  ((id brs)
   [margin-bottom (margin/px 16)])
  ((id fbarcnt)
   [display display/block])
  ((id fbar)
   #;[background-color background-color/rgb(242, 242, 242)]
   #;[background-image background-image/none]
   #;[background-repeat background-repeat/repeat]
   #;[background-attachment background-attachment/scroll]
   #;[background-position (background-position/px 0)]
   #;[background-clip background-clip/border-box]
   #;[background-origin background-origin/padding-box]
   #;[background-size background-size/auto auto]
   [border-top-width (border/px 1)]
   #;[border-top-style border/solid]
   #;[border-top-color border/rgb(228, 228, 228)]
   #;[line-height (line-height/px 40)]
   #;[min-width (min-width/px 980)])
  ((id fuser)
   [float float/right])
  ((desc (id hdtb) (tag form))
   [display display/inline])
  ((id hdtb-mn-gp)
   [display display/inline-block]
   [width (width/px 120)])
  ((id gbq2)
   [display display/block])
  ((id gbqf)
   [display display/block]
   [margin-top (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   [margin-right (margin/px 60)]
   #;[white-space white-space/nowrap])
  ((id gbqfb)
   [border-top-width (border/px 1)]
   [border-right-width (border/px 1)]
   [border-bottom-width (border/px 1)]
   [border-left-width (border/px 1)]
   #;[border-top-style border/solid]
   #;[border-right-style border/solid]
   #;[border-bottom-style border/solid]
   #;[border-left-style border/solid]
   #;[border-top-color border/transparent]
   #;[border-right-color border/transparent]
   #;[border-bottom-color border/transparent]
   #;[border-left-color border/transparent]
   #;[border-image-source border/none]
   #;[border-image-slice border/100% 100% 100% 100%]
   #;[border-image-width border/1 1 1 1]
   #;[border-image-outset (border/px 0)]
   #;[border-image-repeat border/stretch stretch]
   #;[border-bottom-left-radius (border/px 0)]
   #;[border-top-left-radius (border/px 0)]
   [height (height/px 30)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   #;[outline-width outline-width/medium]
   #;[outline-style outline-style/none]
   #;[outline-color outline-color/-moz-use-text-color]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   [width (width/px 60)]
   #;[box-shadow box-shadow/none]
   #;[box-sizing box-sizing/border-box]
   #;[background-color background-color/transparent]
   #;[background-image background-image/-moz-linear-gradient(center top , rgb(67, 135, 253), rgb(70, 131, 234))]
   #;[background-repeat background-repeat/repeat]
   #;[background-attachment background-attachment/scroll]
   #;[background-position (background-position/px 0)]
   #;[background-clip background-clip/border-box]
   #;[background-origin background-origin/padding-box]
   #;[background-size background-size/auto auto])
  ((or (id gbqfq) (id gbqfqb) (id gbqfqc))
   #;[background-color background-color/transparent]
   #;[background-image background-image/none]
   #;[background-repeat background-repeat/repeat]
   #;[background-attachment background-attachment/scroll]
   #;[background-position (background-position/px 0)]
   #;[background-clip background-clip/border-box]
   #;[background-origin background-origin/padding-box]
   #;[background-size background-size/auto auto]
   [border-top-width border/medium]
   [border-right-width border/medium]
   [border-bottom-width border/medium]
   [border-left-width border/medium]
   #;[border-top-style border/none]
   #;[border-right-style border/none]
   #;[border-bottom-style border/none]
   #;[border-left-style border/none]
   #;[border-top-color border/-moz-use-text-color]
   #;[border-right-color border/-moz-use-text-color]
   #;[border-bottom-color border/-moz-use-text-color]
   #;[border-left-color border/-moz-use-text-color]
   #;[border-image-source border/none]
   #;[border-image-slice border/100% 100% 100% 100%]
   #;[border-image-width border/1 1 1 1]
   #;[border-image-outset (border/px 0)]
   #;[border-image-repeat border/stretch stretch]
   [height (height/px 20)]
   [margin-top (margin/px 4)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   #;[vertical-align vertical-align/top]
   [width width/100%])
  ((id gbqfbwa)
   [display display/none]
   [text-align text-align/center]
   [height (height/px 0)])
  ((id e10002)
   #;[top (top/px 0)]
   #;[left (left/px 0)]
   #;[right (right/px 0)]
   [width width/100%])
  ((id e10003)
   [margin-top (margin/px -15)]
   #;[visibility visibility/visible])
  ((id e10006)
   [text-align text-align/left])
  ((id e10010)
   [height (height/px 38)])
  ((id e10023)
   [width (width/px 0)])
  ((id e10024)
   [width (width/px 0)])
  ((id e10025)
   #;[visibility visibility/visible]
   [padding-top (padding/px 0)])
  ((id e10026)
   [padding-top (padding/px 0)]
   [padding-right (padding/px 8)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 8)])
  ((id e10027)
   [height (height/px 65)]
   [width (width/px 116)])
  ((id e10029)
   [margin-left (margin/px 125)])
  ((id e10032)
   [margin-top (margin/px 3)])
  ((id e10033)
   [margin-right (margin/px -3)])
  ((id e10035)
   #;[overflow-x overflow-x/hidden]
   #;[overflow-y overflow-y/hidden]
   [width (width/px 178)]
   [height (height/px 101)])
  ((id e10038)
   [margin-left (margin/px 188)])
  ((id e10047)
   [padding-top (padding/px 0)]
   [padding-right (padding/px 8)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 8)])
  ((id e10049)
   [text-align text-align/left])
  ((id e10051)
   #;[position position/relative]
   [height height/auto]
   #;[visibility visibility/visible])
  ((id slim_appbar)
   [margin-left (margin/px 120)])
  ((id e101)
   [width (width/px 1250)])
  ((desc (id fbar) (tag a))
   [padding-left (padding/px 27)])
  ((id swml)
   [margin-left (margin/px 135)])
  ((id e102)
   [margin-left (margin/px -27)]))

(define-stylesheet doc-1-sketch
  ((id searchform)
   [width width/100%])
  ((id cnt)
   [padding-top (padding/px 15)])
  ((tag body)
   #;[color color/rgb(0, 0, 0)]
   [margin-top (margin/px 0)]
   [margin-right (margin/px 0)]
   [margin-bottom (margin/px 0)]
   [margin-left (margin/px 0)]
   #;[overflow-y overflow-y/scroll])
  ((id appbar)
   #;[background-color background-color/white]
   #;[background-image background-image/none]
   #;[background-repeat background-repeat/repeat]
   #;[background-attachment background-attachment/scroll]
   #;[background-position (background-position/px 0)]
   #;[background-clip background-clip/border-box]
   #;[background-origin background-origin/padding-box]
   #;[background-size background-size/auto auto]
   [width width/100%])
  ((id main)
   [width width/100%])
  ((id hdtbsum)
   #;[background-color background-color/rgb(255, 255, 255)]
   #;[background-image background-image/none]
   #;[background-repeat background-repeat/repeat]
   #;[background-attachment background-attachment/scroll]
   #;[background-position (background-position/px 0)]
   #;[background-clip background-clip/border-box]
   #;[background-origin background-origin/padding-box]
   #;[background-size background-size/auto auto]
   [border-bottom-width (border/px 1)]
   #;[border-bottom-style border/solid]
   #;[border-bottom-color border/rgb(235, 235, 235)]
   [height (height/px 40)]
   #;[line-height (line-height/px 35)]
   [padding-top (padding/px 0)]
   [padding-right (padding/px 0)]
   [padding-bottom (padding/px 0)]
   [padding-left (padding/px 0)]
   #;[position position/relative]
   #;[z-index z-index/102])
  ((id hdtbsum)
   [height (height/px 59)])
  ((id viewport)
   #;[position position/absolute]
   #;[top (top/px 0)]
   [width width/100%])
  ((id fbar)
   #;[background-color background-color/rgb(242, 242, 242)]
   #;[background-image background-image/none]
   #;[background-repeat background-repeat/repeat]
   #;[background-attachment background-attachment/scroll]
   #;[background-position (background-position/px 0)]
   #;[background-clip background-clip/border-box]
   #;[background-origin background-origin/padding-box]
   #;[background-size background-size/auto auto]
   [border-top-width (border/px 1)]
   #;[border-top-style border/solid]
   #;[border-top-color border/rgb(228, 228, 228)]
   #;[line-height (line-height/px 40)]
   #;[min-width (min-width/px 980)])
  ((id slim_appbar)
   [margin-left (margin/px 120)])
  ((id e101)
   [width (width/px 1250)])
  ((desc (id fbar) (tag a))
   [padding-left (padding/px 27)])
  ((id swml)
   [margin-left (margin/px 135)])
  ((id e102)
   [margin-left (margin/px -27)]))

(define-document (doc-1 #:width 1907 #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 1907 #|:h 0|#]
   ([BLOCK :tag BODY :x 0 :y 0 :w 1907 #|:h 0|# :id gsr]
    ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 1882 :id viewport]
     ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 0 :id doc-info])
     ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 0 :id cst])
     ([MAGIC :tag DIV :x 0 :y 15 :w 1907 :h 44 :id searchform])
     #;([BLOCK :tag DIV :x 0 :y 15 :w 1907 :h 44 :id searchform]
      ([BLOCK :tag DIV :x 0 :y 15 :w 1907 :h 0 :id gb]
       ([BLOCK :tag DIV :x 0 :y 15 :w 1907 :h 0 :id gbw]
        ([BLOCK :tag DIV :x 0 :y 15 :w 1907 :h 0 :id e10002]
         ([MAGIC :tag DIV :x 1652 :y 15 :w 255 :h 30 :mt 0 :mr 0 :mb 0 :ml 0 :class (gb_La gb_oe gb_R gb_ne gb_T)]))))
      ([BLOCK :tag FORM :x 0 :y 6 :w 784 :h 45 :id tsf]
       ([BLOCK :tag DIV :x 0 :y 6 :w 784 :h 0 :id tophf])
       ([BLOCK :tag DIV :x 0 :y 6 :w 784 :h 45]
        ([BLOCK :tag DIV :x 0 :y 4 :w 120 :h 43 :id logocont]
         ([BLOCK :tag H1 :x 13 :y 10 :w 95 :h 37]
          ([BLOCK :tag A :x 13 :y 10 :w 95 :h 37 :id logo])))
        ([BLOCK :tag DIV :x 126 :y 6 :w 638 :h 45]
         ([BLOCK :tag DIV :x 126 :y 9 :w 638 :h 40 :id sbtc]
          ([BLOCK :tag DIV :x 126 :y 9 :w 638 :h 40]
           ([BLOCK :tag DIV :x 764 :y 9 :w 0 :h 28 :id sfopt]
            ([BLOCK :tag DIV :x 780 :y 12 :w 0 :h 0]
             ([BLOCK :tag DIV :x 780 :y 12 :w 0 :h 0 :id ss-bar])))
           ([BLOCK :tag DIV :x 715 :y 9 :w 40 :h 40]
            ([BLOCK :tag DIV :x 715 :y 9 :w 40 :h 40 :id e10009]
             ([BLOCK :tag DIV :x 715 :y 9 :w 40 :h 40 :id sbds]
              ([BLOCK :tag DIV :x 715 :y 9 :w 40 :h 40 :id sblsbb]
               ([MAGIC :tag BUTTON :x 715 :y 9 :w 40 :h 30 :mt 0 :mr 0 :mb 0 :ml 0 :class (lsb)])))))
           ([BLOCK :tag DIV :x 126 :y 9 :w 589 :h 40 :id sfdiv]
            ([BLOCK :tag DIV :x 127 :y 10 :w 588 :h 38 :id e10010]
             ([BLOCK :tag DIV :x 127 :y 10 :w 0 :h 38 :id sb_chc0])
             ([BLOCK :tag DIV :x 127 :y 10 :w 588 :h 38 :id sb_ifc0]
              ([BLOCK :tag DIV :x 136 :y 15 :w 570 :h 0 :id gs_lc0]
               ([BLOCK :tag INPUT :x 136 :y 15 :w 570 :h 26 :id lst-ib])
               ([BLOCK :tag DIV :x 136 :y 15 :w 0 :h 26 :id gs_sc0])
               ([BLOCK :tag INPUT :x 136 :y 15 :w 570 :h 26 :id gs_taif0])
               ([BLOCK :tag INPUT :x 136 :y 15 :w 570 :h 26 :id gs_htif0])))))))
         ([BLOCK :tag DIV :x 126 :y 49 :w 638 :h 0])))))
     ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 0 :id gac_scont])
     ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 1882 :id main]
      ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 0 :id lb])
      ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 0 :id ilrpc])
      ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 0 :id easter-egg])
      ([BLOCK :tag DIV :x 0 :y 0 :w 1907 :h 1882 :id cnt]
       ([MAGIC :tag DIV :x 0 :y 15 :w 1250 :h 45 :id e101])
       #;([BLOCK :tag DIV :x 0 :y 15 :w 1250 :h 45 :id e101]
        ([BLOCK :tag DIV :x 0 :y 15 :w 1250 :h 34 :id sfcnt]
         ([BLOCK :tag DIV :x 0 :y 15 :w 1250 :h 34 :id sform]))
        ([BLOCK :tag DIV :x 0 :y 49 :w 1250 :h 0 :id dc])
        ([BLOCK :tag DIV :x 229 :y 49 :w 541 :h 11 :id subform_ctrl]))
       ([BLOCK :tag DIV :x 0 :y 60 :w 1907 :h 60 :id top_nav]
        ([BLOCK :tag DIV :x 0 :y 60 :w 1907 :h 60]
         ([BLOCK :tag DIV :x 0 :y 60 :w 1907 :h 60 :id hdtb]
          ([BLOCK :tag DIV :x 0 :y 60 :w 1907 :h 60 :id hdtbsum]
           #;([BLOCK :tag DIV :x 0 :y 60 :w 1907 :h 0 :id hdtb-s]
            ([MAGIC :tag DIV :x 0 :y 60 :w 666 :h 59 :id hdtb-msb])
            ([BLOCK :tag DIV :x 0 :y 60 :w 666 :h 59 :id hdtb-msb]
             ([MAGIC :tag DIV :x 128 :y 62 :w 45 :h 57 :mt 2 :mr 8 :mb 0 :ml 128 :class (hdtb-mitem hdtb-msel hdtb-imb)])
             ([MAGIC :tag DIV :x 181 :y 62 :w 74 :h 54 :mt 0 :mr 0 :mb 0 :ml 0 :class (hdtb-mitem hdtb-imb)])
             ([MAGIC :tag DIV :x 255 :y 62 :w 72 :h 54 :mt 0 :mr 0 :mb 0 :ml 0 :class (hdtb-mitem hdtb-imb)])
             ([MAGIC :tag DIV :x 327 :y 62 :w 62 :h 54 :mt 0 :mr 0 :mb 0 :ml 0 :class (hdtb-mitem hdtb-imb)])
             ([MAGIC :tag DIV :x 389 :y 62 :w 86 :h 54 :mt 0 :mr 0 :mb 0 :ml 0 :class (hdtb-mitem hdtb-imb)])
             ([MAGIC :tag A :x 475 :y 62 :w 67 :h 54 :mt 0 :mr 0 :mb 0 :ml 0 :id hdtb-more])
             ([MAGIC :tag A :x 551 :y 74.5 :w 91 :h 29 :mt 0 :mr 24 :mb 0 :ml 9 :id hdtb-tls :class (hdtb-tl)]))
            ([MAGIC :tag OL :x 1791 :y 60 :w 88 :h 54 :id ab_ctls]))))))
       ([BLOCK :tag DIV :x 0 :y 120 :w 1907 :h 0 :id before-appbar])
       ([BLOCK :tag DIV :x 0 :y 120 :w 1907 :h 43 :id appbar]
        ([BLOCK :tag DIV :x 0 :y 120 :w 1907 :h 43 :id extabar]
         ([BLOCK :tag DIV :x 0 :y 120 :w 1907 :h 43 :id topabar]
          ([BLOCK :tag DIV :x 120 :y 120 :w 1787 :h 43 :id slim_appbar]
           ([MAGIC :tag DIV :x 120 :y 120 :w 1787 :h 43 :id sbfrm_l]))))
        ([BLOCK :tag DIV :x 0 :y 163 :w 1907 :h 0]))
       ([MAGIC :tag DIV :x 0 :y 163 :w 1250 :h 0 :id ucs])
       ([MAGIC :tag DIV :x 0 :y 166 :w 1250 :h 1632])
       #;([BLOCK :tag DIV :x 0 :y 166 :w 1250 :h 1632]
        ([BLOCK :tag DIV :x 0 :y 166 :w 1250 :h 1632 :id rcnt]
         ([BLOCK :tag DIV :x 120 :y 166 :w 1130 :h 0 :id ataw]
          ([BLOCK :tag DIV :x 120 :y 166 :w 1130 :h 0 :id atvcap]))
         ([BLOCK :tag DIV :x 0 :y 166 :w 1250 :h 0 :id bcenter]
          ([BLOCK :tag DIV :x 0 :y 166 :w 1250 :h 0 :id gko-srp-sp])
          ([BLOCK :tag DIV :x 0 :y 166 :w 0 :h 0 :id e10023]))
         ([BLOCK :tag DIV :x 0 :y 166 :w 0 :h 1632 :id e10024]
          ([BLOCK :tag DIV :x 120 :y 166 :w 544 :h 1602 :id center_col]
           ([BLOCK :tag DIV :x 128 :y 166 :w 528 :h 0 :id taw]
            ([BLOCK :tag DIV :x 128 :y 166 :w 528 :h 0])
            ([BLOCK :tag DIV :x 128 :y 166 :w 528 :h 0 :id e10026]
             ([BLOCK :tag DIV :x 136 :y 166 :w 512 :h 0]))
            ([BLOCK :tag DIV :x 128 :y 166 :w 528 :h 0 :id tvcap]))
           ([BLOCK :tag DIV :x 128 :y 166 :w 528 :h 1359 :id res]
            ([BLOCK :tag DIV :x 136 :y 166 :w 512 :h 0 :id topstuff])
            ([BLOCK :tag DIV :x 136 :y 166 :w 512 :h 1359 :id search]
             ([BLOCK :tag DIV :x 136 :y 166 :w 512 :h 1359]
              ([BLOCK :tag H2 :x 136 :y (/ -285769 12) :w 1 :h 1]
               ([LINE]
                ([TEXT :x 136 :y (/ -285769 12) :w 79 :h 27]))
               ([LINE]
                ([TEXT :x 136 :y (/ -285445 12) :w 86 :h 27])))
              ([BLOCK :tag DIV :x 136 :y 166 :w 512 :h 1359 :id ires]
               ([MAGIC :tag OL :x 136 :y 172 :w 512 :h 1353 :id rso :ml 0 :mr 0 :mt 0 :mb 0])))))
           ([BLOCK :tag DIV :x 128 :y 1541 :w 528 :h 0 :id bottomads])
           ([MAGIC :tag DIV :x 128 :y 1541 :w 528 :h 142 :id extrares])
           ([BLOCK :tag DIV :x 128 :y 1541 :w 528 :h 142 :id extrares]
            ([BLOCK :tag DIV :x 136 :y 1541 :w 512 :h 142 :id botstuff]
             ([BLOCK :tag DIV :x 136 :y 1541 :w 512 :h 142]
              ([BLOCK :tag OL :x 136 :y 1541 :w 512 :h 0 :id bres])
              ([BLOCK :tag DIV :x 136 :y 1541 :w 512 :h 125 :id brs]
               ([BLOCK :tag H3 :x 136 :y 1541 :w 512 :h 25 :id e10049]
                ([LINE]
                 ([TEXT :x 136 :y 1540 :w 199 :h 20])))
               ([BLOCK :tag DIV :x 136 :y 1566 :w 512 :h 0]
                ([BLOCK :tag DIV :x 136 :y 1565 :w 186 :h 101]
                 ([BLOCK :tag P :x 136 :y 1565 :w 170 :h 25]
                  ([LINE]
                   ([INLINE :tag A]
                    ([INLINE :tag B]
                     ([TEXT :x 136 :y 1572.5 :w 110 :h 15]))
                    ([TEXT :x 246 :y 1572.5 :w 31 :h 15]))))
                 ([BLOCK :tag P :x 136 :y 1590 :w 170 :h 25]
                  ([LINE]
                   ([INLINE :tag A]
                    ([TEXT :x 136 :y 1597.5 :w 31 :h 15])
                    ([INLINE :tag B]
                     ([TEXT :x 167 :y 1597.5 :w 56 :h 15])))))
                 ([BLOCK :tag P :x 136 :y 1615 :w 170 :h 25]
                  ([LINE]
                   ([INLINE :tag A]
                    ([TEXT :x 136 :y 1622.5 :w 31 :h 15])
                    ([INLINE :tag B]
                     ([TEXT :x 167 :y 1622.5 :w 76 :h 15])))))
                 ([BLOCK :tag P :x 136 :y 1640 :w 170 :h 25]
                  ([LINE]
                   ([INLINE :tag A]
                    ([TEXT :x 136 :y 1647.5 :w 31 :h 15])
                    ([INLINE :tag B]
                     ([TEXT :x 167 :y 1647.5 :w 139 :h 15]))))))
                ([BLOCK :tag DIV :x 322 :y 1565 :w 151 :h 101]
                 ([BLOCK :tag P :x 322 :y 1565 :w 135 :h 25]
                  ([LINE]
                   ([INLINE :tag A]
                    ([TEXT :x 322 :y 1572.5 :w 31 :h 15])
                    ([INLINE :tag B]
                     ([TEXT :x 353 :y 1572.5 :w 33 :h 15])))))
                 ([BLOCK :tag P :x 322 :y 1590 :w 135 :h 25]
                  ([LINE]
                   ([INLINE :tag A]
                    ([TEXT :x 322 :y 1597.5 :w 31 :h 15])
                    ([INLINE :tag B]
                     ([TEXT :x 353 :y 1597.5 :w 31 :h 15])))))
                 ([BLOCK :tag P :x 322 :y 1615 :w 135 :h 25]
                  ([LINE]
                   ([INLINE :tag A]
                    ([TEXT :x 322 :y 1622.5 :w 31 :h 15])
                    ([INLINE :tag B]
                     ([TEXT :x 353 :y 1622.5 :w 67 :h 15])))))
                 ([BLOCK :tag P :x 322 :y 1640 :w 135 :h 25]
                  ([LINE]
                   ([INLINE :tag A]
                    ([TEXT :x 322 :y 1647.5 :w 31 :h 15])
                    ([INLINE :tag B]
                     ([TEXT :x 353 :y 1647.5 :w 104 :h 15]))))))))
              ([BLOCK :tag HR :x 128 :y 1682 :w 528 :h 1]))))
           ([BLOCK :tag DIV :x 128 :y 1713 :w 528 :h 55]
            ([BLOCK :tag DIV :x 128 :y 1713 :w 528 :h 55 :id foot]
             ([BLOCK :tag DIV :x 128 :y 1713 :w 528 :h 0 :id cljs])
             ([ANON]
              ([BLOCK :tag DIV :x 128 :y 1713 :w 528 :h 55 :id navcnt]
               ([MAGIC :tag TABLE :x 238 :y 1713 :w 308 :h 55 :mt 30 :mr 0 :mb 30 :ml 0 :id nav]))
              ([LINE]
               ([INLINE :tag SPAN])))
             ([BLOCK :tag DIV :x 128 :y 1798 :w 528 :h 0 :id gfn])
             ([ANON]
              ([LINE]
               ([INLINE :tag SPAN])))))))
         ([BLOCK :tag DIV :x 0 :y 166 :w 980 :h 25 :id rhscol]
          ([BLOCK :tag DIV :x 702 :y 166 :w 278 :h 25 :id rhs]
           ([BLOCK :tag DIV :x 702 :y 166 :w 278 :h 15 :id rhs_block])))
         ([BLOCK :tag DIV :x 0 :y 1798 :w 1250 :h 0 :id e10050]))
        ([BLOCK :tag DIV :x 0 :y 1798 :w 1250 :h 0 :id bfoot]))
       ([BLOCK :tag DIV :x 0 :y 1798 :w 1907 :h 84 :id footcnt]
        ([BLOCK :tag DIV :x 0 :y 1798 :w 1907 :h 84]
         ([BLOCK :tag DIV :x 0 :y 1798 :w 1907 :h 84 :id fbarcnt]
          ([BLOCK :tag DIV :x 0 :y 1798 :w 1907 :h 84 :id fbar]
           ([MAGIC :tag DIV :x 135 :y 1817 :w 1772 :h 25 :id swml])
           ([BLOCK :tag DIV :x -27 :y 1842 :w 1934 :h 40 :id e102]
            ([LINE]
             ([INLINE :tag SPAN]
              ([INLINE :tag SPAN]
               ([INLINE :tag A]
                ([TEXT :x 135 :y 1854.5 :w 26 :h 15]))
               ([TEXT :x 161 :y 1854.5 :w 4 :h 15])
               ([INLINE :tag A]
                ([TEXT :x 192 :y 1854.5 :w 90 :h 15]))
               ([INLINE :tag A]
                ([TEXT :x 309 :y 1854.5 :w 42 :h 15]))
               ([TEXT :x 351 :y 1854.5 :w 4 :h 15])
               ([INLINE :tag A]
                ([TEXT :x 382 :y 1854.5 :w 35 :h 15]))))))))))))))))

(define-problem verify
  #:header header
  #:sheet doc-1
  #:documents doc-1)

(define-problem sketch
  #:header header
  #:sheet doc-1-sketch
  #:documents doc-1)
