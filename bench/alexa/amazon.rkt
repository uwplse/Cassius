;; python get_bench.py --name alexa/amazon 'file:///home/pavpan/cassius/bench/alexa/amazon.html'

(define-header header
"")

;; From file:///home/pavpan/cassius/bench/alexa/amazon.html

(define-stylesheet doc-1
  ((or (and (class nav-hidden)) (and (class nav-hidden-aria)))
   [position absolute]
   [left (px -10000)]
   [top auto]
   [width (px 1)]
   [height (px 1)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (tag body))
   [margin-top (px 0)]
   [margin-right (px 8)]
   [margin-bottom (px 0)]
   [margin-left (px 8)])
  ((or (desc (and (tag html) (class a-js)) (and (tag body))) (desc (and (tag html) (class a-no-js)) (and (tag body))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (class site-stripe-margin-control))
   [margin-top (px 0)]
   [margin-right (px -8)]
   [margin-bottom (px 0)]
   [margin-left (px -8)])
  ((or (desc (and (tag html) (class a-js)) (and (class site-stripe-margin-control))) (desc (and (tag html) (class a-no-js)) (and (class site-stripe-margin-control))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (id navbar))
   [position relative]
   [top (px 0)]
   [left (px 0)]
   #;[z-index 198]
   #;[font-family arial,sans-serif]
   #;[font-size (px 12)]
   #;[line-height (px 12)]
   [margin-top (px 0)]
   [margin-right (px -8)]
   [margin-bottom (px 0)]
   [margin-left (px -8)]
   [display block]
   #;[min-width (px 1000)])
  ((or (desc (and (tag html) (class a-js)) (and (id navbar))) (desc (and (tag html) (class a-no-js)) (and (id navbar))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id navbar)) (and (class nav-ie-min-width)))
   [display none])
  ((desc (and (id navbar)) (and *))
   [box-sizing border-box])
  ((desc (and (id navbar) (class nav-fixed)) (and (id nav-main)))
   [position fixed]
   [top (px 0)]
   [left (px 0)]
   [height (px 56)]
   [padding-top (px 0)])
  ((or (desc (and (id navbar) (class nav-fixed)) (and (id nav-shop))) (desc (and (id navbar) (class nav-fixed)) (and (id nav-tools))))
   [padding-top (px 4)])
  ((desc (and (id navbar)) (and (id nav-logo-borderfade)) (and (class nav-fade-mask)))
   [width (px 39)])
  ((desc (and (id navbar)) (and (id nav-AssociateStripe)) (and (tag div)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [left (px 0)])
  ((desc (and (id navbar)) (and (id nav-search)))
   [margin-top (px 0)]
   [padding-top (px 11)]
   [padding-right (px 25)])
  ((desc (and *) (and (tag html)) (and (id navbar)) (and (id nav-search)))
   [position absolute])
  ((desc (and (id navbar)) (and (id nav-search)) (and (class nav-searchbar)))
   [margin-bottom (px 0)])
  ((desc (and (id navbar)) (and (id nav-search)) (and (class nav-searchbar)) (and (class nav-fill)))
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (id navbar)) (and (id nav-search) (class nav-fixed)))
   [height (px 55)]
   [position fixed]
   [top (px 0)]
   [padding-top (px 10)]
   [padding-right (px 25)]
   [padding-bottom (px 10)]
   [padding-left (px 25)])
  ((and (id nav-supra))
   [position absolute]
   [bottom (px 42)]
   #;[cursor default])
  ((or (and (id nav-belt)) (desc (and (id navbar)) (and (class nav-belt))))
   [position relative]
   [width (% 100)]
   #;[font-size (px 14)]
   #;[z-index 5])
  ((or (desc (and (class nav-xshop-large)) (and (id nav-belt)) (and (class nav-fill))) (desc (and (class nav-xshop-large)) (and (id nav-belt)) (and (class nav-left))) (desc (and (class nav-xshop-large)) (and (id nav-belt)) (and (class nav-right))) (desc (and (class nav-xshop-large)) (and (id navbar)) (and (class nav-belt)) (and (class nav-fill))) (desc (and (class nav-xshop-large)) (and (id navbar)) (and (class nav-belt)) (and (class nav-left))) (desc (and (class nav-xshop-large)) (and (id navbar)) (and (class nav-belt)) (and (class nav-right))))
   [height (px 50)])
  ((or (desc (and (id nav-belt)) (and (class nav-fill))) (desc (and (id nav-belt)) (and (class nav-left))) (desc (and (id nav-belt)) (and (class nav-right))) (desc (and (id navbar)) (and (class nav-belt)) (and (class nav-fill))) (desc (and (id navbar)) (and (class nav-belt)) (and (class nav-left))) (desc (and (id navbar)) (and (class nav-belt)) (and (class nav-right))))
   [height (px 39)])
  ((or (desc (and (id nav-belt)) (and (class nav-fill))) (desc (and (id navbar)) (and (class nav-belt)) (and (class nav-fill))))
   [overflow-x visible]
   [overflow-y visible])
  ((or (and (id nav-main)) (desc (and (id navbar)) (and (class nav-main))))
   [width (% 100)]
   [height (px 60)]
   [padding-top (px 5)]
   [position relative]
   #;[transform translate3d(0px, 0px, 0px)]
   #;[z-index 4]
   #;[background-position (px 0)])
  ((or (desc (and (id nav-main)) (and (class nav-fill))) (desc (and (id nav-main)) (and (class nav-left))) (desc (and (id nav-main)) (and (class nav-right))) (desc (and (id navbar)) (and (class nav-main)) (and (class nav-fill))) (desc (and (id navbar)) (and (class nav-main)) (and (class nav-left))) (desc (and (id navbar)) (and (class nav-main)) (and (class nav-right))))
   [height (px 55)])
  ((or (desc (and (id nav-main)) (and (tag span) (class nav-arrow))) (desc (and (id navbar)) (and (class nav-main)) (and (tag span) (class nav-arrow))))
   [display none])
  ((and (id nav-logo-borderfade))
   [height (px 1)]
   #;[line-height (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[background-color rgb(231, 231, 231)]
   [position relative])
  ((desc (and (id nav-logo-borderfade)) (and (class nav-fade)))
   [position absolute]
   [left (px 10)]
   [height (px 1)]
   [width (px 98)]
   #;[line-height (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[background-position -10px -320px]
   #;[background-color rgb(255, 255, 255)])
  ((desc (and (id nav-logo-borderfade)) (and (class nav-fade-mask)))
   [position absolute]
   [left (px 0)]
   [top (px -1)]
   [height (px 3)]
   [width (px 10)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[line-height (px 0)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and *) (and (tag html)) (and (id nav-logo-borderfade)))
   [display none])
  ((and (id nav-tools))
   [float left]
   [padding-top (px 6)]
   [padding-right (px 7)]
   [padding-bottom (px 0)]
   [padding-left (px 32)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [margin-top (px 2)])
  ((or (desc (and (id nav-tools)) (and (class nav-a))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-a))))
   [position relative]
   [float left]
   [top (px 1)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   #;[line-height (px 44)]
   [height (px 44)])
  (("#nav-tools .nav-a:focus, #nav-tools .nav-a:hover, #navbar .nav-tools .nav-a:focus, #navbar .nav-tools .nav-a:hover" (or))
   [top (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [height (px 44)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(221, 221, 221)]
   #;[border-right-color rgb(221, 221, 221)]
   #;[border-left-color rgb(221, 221, 221)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-bottom-color rgb(204, 204, 204)]
   #;[box-shadow (px 0)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)])
  ((or (desc (and (id nav-tools)) (and (class nav-a-2))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-a-2))))
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
  ((or (desc (and (id nav-tools)) (and (class nav-a-2)) (and (class nav-line-1))) (desc (and (id nav-tools)) (and (class nav-a-2)) (and (class nav-line-2))) (desc (and (id nav-tools)) (and (class nav-a-2)) (and (class nav-line-3))) (desc (and (id nav-tools)) (and (class nav-a-2)) (and (class nav-line-4))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-a-2)) (and (class nav-line-1))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-a-2)) (and (class nav-line-2))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-a-2)) (and (class nav-line-3))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-a-2)) (and (class nav-line-4))))
   [float left]
   #;[clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 11)]
   #;[font-family arial,sans-serif]
   #;[color rgb(0, 0, 0)])
  ((or (desc (and (id nav-tools)) (and (class nav-a-2)) (and (class nav-line-1))) (desc (and (id nav-tools)) (and (class nav-a-2)) (and (class nav-line-3))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-a-2)) (and (class nav-line-1))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-a-2)) (and (class nav-line-3))))
   #;[font-size (px 12)]
   #;[line-height (px 14)]
   [height (px 14)]
   #;[font-weight 400]
   [margin-top (px 9)])
  ((or (desc (and (id nav-tools)) (and (class nav-a-2)) (and (class nav-line-2))) (desc (and (id nav-tools)) (and (class nav-a-2)) (and (class nav-line-4))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-a-2)) (and (class nav-line-2))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-a-2)) (and (class nav-line-4))))
   #;[font-size (px 14)]
   #;[line-height (px 15)]
   #;[font-weight 700]
   [padding-bottom (px 5)])
  ((or (desc (and (id nav-tools)) (and (class nav-a-2)) (and (class nav-line-2)) (and (class nav-icon))) (desc (and (id nav-tools)) (and (class nav-a-2)) (and (class nav-line-4)) (and (class nav-icon))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-a-2)) (and (class nav-line-2)) (and (class nav-icon))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-a-2)) (and (class nav-line-4)) (and (class nav-icon))))
   [display inline-block]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-right-width (px 4)]
   [border-left-width (px 4)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   [border-top-width (px 4)]
   [border-top-style solid]
   #;[border-top-color rgb(96, 96, 96)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 5)]
   #;[visibility hidden])
  ((or (desc (and (id nav-tools)) (and (class nav-a-2)) (and (class nav-line-3))) (desc (and (id nav-tools)) (and (class nav-a-2)) (and (class nav-line-4))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-a-2)) (and (class nav-line-3))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-a-2)) (and (class nav-line-4))))
   [display none])
  ((or (desc (and (id nav-tools)) (and (class nav-truncate)) (and (class nav-line-1))) (desc (and (id nav-tools)) (and (class nav-truncate)) (and (class nav-line-3))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-truncate)) (and (class nav-line-1))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-truncate)) (and (class nav-line-3))))
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
   #;[font-family arial,sans-serif])
  ((or (desc (and *) (and (tag html)) (and (id nav-tools)) (and (class nav-truncate)) (and (class nav-line-1))) (desc (and *) (and (tag html)) (and (id nav-tools)) (and (class nav-truncate)) (and (class nav-line-3))) (desc (and *) (and (tag html)) (and (id navbar)) (and (class nav-tools)) (and (class nav-truncate)) (and (class nav-line-1))) (desc (and *) (and (tag html)) (and (id navbar)) (and (class nav-tools)) (and (class nav-truncate)) (and (class nav-line-3))))
   [width (px 118)])
  ((or (desc (and (id nav-tools)) (and (class nav-truncate)) (and (class nav-line-2))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-truncate)) (and (class nav-line-2))))
   [padding-top (px 23)])
  ((or (desc (and (id nav-tools)) (and (class nav-counter))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-counter))))
   [display inline-block]
   [box-sizing content-box]
   [width (px 13)]
   [height (px 13)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 4)]
   #;[line-height (px 13)]
   #;[font-family "lucida grande",tahoma,verdana,sans-serif]
   #;[font-size (px 11)]
   #;[font-weight 700]
   [text-align center]
   #;[color rgb(228, 121, 17)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(228, 121, 17)]
   #;[border-right-color rgb(228, 121, 17)]
   #;[border-bottom-color rgb(228, 121, 17)]
   #;[border-left-color rgb(228, 121, 17)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-top-left-radius (px 2)]
   #;[border-top-right-radius (px 2)]
   #;[border-bottom-right-radius (px 2)]
   #;[border-bottom-left-radius (px 2)])
  ((or (desc (and (id nav-tools)) (and (id nav-cart-count))) (desc (and (id navbar)) (and (class nav-tools)) (and (id nav-cart-count))))
   #;[color rgb(228, 121, 17)]
   #;[font-weight 700]
   #;[font-family arial,sans-serif]
   [position absolute]
   #;[line-height (px 16)]
   [width (px 20)]
   [text-align center])
  ((or (desc (and (id nav-tools)) (and (id nav-cart)) (and (class nav-cart-0))) (desc (and (id nav-tools)) (and (class nav-cart)) (and (class nav-cart-0))) (desc (and (id navbar)) (and (class nav-tools)) (and (id nav-cart)) (and (class nav-cart-0))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-cart)) (and (class nav-cart-0))))
   [left (px 23)]
   [top (px 9)]
   #;[font-size (px 16)]
   [width (px 19)])
  ((or (desc (and (id nav-tools)) (and (id nav-cart)) (and (class nav-cart-1))) (desc (and (id nav-tools)) (and (class nav-cart)) (and (class nav-cart-1))) (desc (and (id navbar)) (and (class nav-tools)) (and (id nav-cart)) (and (class nav-cart-1))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-cart)) (and (class nav-cart-1))))
   [left (px 23)]
   [top (px 9)]
   #;[font-size (px 16)]
   [width (px 19)])
  ((or (desc (and (id nav-tools)) (and (id nav-cart)) (and (class nav-cart-10))) (desc (and (id nav-tools)) (and (class nav-cart)) (and (class nav-cart-10))) (desc (and (id navbar)) (and (class nav-tools)) (and (id nav-cart)) (and (class nav-cart-10))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-cart)) (and (class nav-cart-10))))
   [left (px 23)]
   [top (px 8)]
   #;[font-size (px 14)]
   [width (px 20)])
  ((or (desc (and (id nav-tools)) (and (id nav-cart)) (and (class nav-cart-20))) (desc (and (id nav-tools)) (and (class nav-cart)) (and (class nav-cart-20))) (desc (and (id navbar)) (and (class nav-tools)) (and (id nav-cart)) (and (class nav-cart-20))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-cart)) (and (class nav-cart-20))))
   [left (px 23)]
   [top (px 8)]
   #;[font-size (px 14)]
   [width (px 20)])
  ((or (desc (and (id nav-tools)) (and (id nav-cart)) (and (class nav-cart-100))) (desc (and (id nav-tools)) (and (class nav-cart)) (and (class nav-cart-100))) (desc (and (id navbar)) (and (class nav-tools)) (and (id nav-cart)) (and (class nav-cart-100))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-cart)) (and (class nav-cart-100))))
   [left (px 23)]
   [top (px 8)]
   #;[font-size (px 11)]
   [width (px 20)])
  ((or (desc (and (id nav-tools)) (and (id nav-cart)) (and (class nav-cart-icon))) (desc (and (id nav-tools)) (and (class nav-cart)) (and (class nav-cart-icon))) (desc (and (id navbar)) (and (class nav-tools)) (and (id nav-cart)) (and (class nav-cart-icon))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-cart)) (and (class nav-cart-icon))))
   [display block]
   [overflow-x hidden]
   [overflow-y hidden]
   [position absolute]
   [left (px 10)]
   [top (px 11)]
   #;[background-position -10px -340px]
   [width (px 38)]
   [height (px 26)])
  ((or (desc (and (id nav-tools)) (and (id nav-cart)) (and (class nav-line-1))) (desc (and (id nav-tools)) (and (id nav-cart)) (and (class nav-line-2))) (desc (and (id nav-tools)) (and (class nav-cart)) (and (class nav-line-1))) (desc (and (id nav-tools)) (and (class nav-cart)) (and (class nav-line-2))) (desc (and (id navbar)) (and (class nav-tools)) (and (id nav-cart)) (and (class nav-line-1))) (desc (and (id navbar)) (and (class nav-tools)) (and (id nav-cart)) (and (class nav-line-2))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-cart)) (and (class nav-line-1))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-cart)) (and (class nav-line-2))))
   [margin-left (px 42)])
  ((or (desc (and (id nav-tools)) (and (class nav-unrec)) (and (id nav-link-yourAccount)) (and (class nav-icon))) (desc (and (id navbar)) (and (class nav-tools)) (and (class nav-unrec)) (and (id nav-link-yourAccount)) (and (class nav-icon))))
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-right-width (px 4)]
   [border-left-width (px 4)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   [border-top-width (px 4)]
   [border-top-style solid]
   #;[border-top-color rgb(96, 96, 96)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)])
  ((and (id nav-shop))
   [float left]
   [padding-top (px 6)]
   [padding-right (px 27)]
   [padding-bottom (px 0)]
   [padding-left (px 15)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [margin-top (px 2)]
   [width (px 192)])
  ((desc (and (id nav-shop)) (and (class nav-a)))
   #;[line-height (px 44)]
   [height (px 44)]
   [position relative]
   [float left]
   [top (px 1)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 10)])
  (("#nav-shop .nav-a:focus, #nav-shop .nav-a:hover" (or))
   [top (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [height (px 44)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(221, 221, 221)]
   #;[border-right-color rgb(221, 221, 221)]
   #;[border-left-color rgb(221, 221, 221)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-bottom-color rgb(204, 204, 204)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[box-shadow (px 0)])
  ((desc (and (id nav-shop)) (and (class nav-a-2)))
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
  ((or (desc (and (id nav-shop)) (and (class nav-a-2)) (and (class nav-line-1))) (desc (and (id nav-shop)) (and (class nav-a-2)) (and (class nav-line-2))))
   [float left]
   #;[clear both]
   [display inline-block]
   #;[white-space nowrap]
   [padding-right (px 11)]
   #;[font-family arial,sans-serif]
   #;[color rgb(0, 0, 0)])
  ((desc (and (id nav-shop)) (and (class nav-a-2)) (and (class nav-line-1)))
   #;[font-size (px 12)]
   #;[line-height (px 14)]
   [height (px 14)]
   #;[font-weight 400]
   [margin-top (px 9)])
  ((desc (and (id nav-shop)) (and (class nav-a-2)) (and (class nav-line-2)))
   #;[font-size (px 14)]
   #;[line-height (px 15)]
   #;[font-weight 700]
   [padding-bottom (px 5)])
  ((desc (and (id nav-shop)) (and (class nav-a-2)) (and (class nav-line-2)) (and (class nav-icon)))
   [display inline-block]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-right-width (px 4)]
   [border-left-width (px 4)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   [border-top-width (px 4)]
   [border-top-style solid]
   #;[border-top-color rgb(96, 96, 96)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 5)]
   #;[visibility hidden])
  ((and (id nav-xshop-container))
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
  ((desc (and (class nav-cobranded)) (and (id nav-xshop-container)))
   [margin-left (px 43)])
  ((desc (and *) (and (tag html)) (and (id nav-xshop-container)))
   [margin-left (px 20)])
  ((and (id nav-xshop-container) (class nav-fixed))
   [display none])
  ((desc (and *) (and (tag html)) (and (id nav-link-gifting)))
   [margin-top (px -2)])
  ((and (id nav-xshop))
   [margin-top (px 30)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [height (px 37)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class nav-xshop-small)) (and (id nav-xshop)))
   [margin-top (px 32)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id nav-xshop)) (and (class nav-a)))
   [float left]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   [margin-bottom (px 25)]
   #;[font-family arial,sans-serif]
   #;[font-size (px 13)])
  (("#nav-xshop .nav-a:first-child" (or (id nav-recently-viewed)))
   [padding-left (px 0)])
  ((desc (and (id nav-xshop)) (and (class nav-a)) (and (class nav-icon)))
   [display inline-block]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-right-width (px 4)]
   [border-left-width (px 4)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   [border-top-width (px 4)]
   [border-top-style solid]
   #;[border-top-color rgb(96, 96, 96)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 5)]
   #;[visibility hidden])
  ((desc (and (id nav-link-gifting)) (and (class nav-line-2)) (and (class nav-arrow)))
   [display inline-block]
   [border-right-width (px 4)]
   [border-left-width (px 4)]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-top-width (px 4)]
   [border-top-style solid]
   #;[border-top-color rgb(96, 96, 96)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 5)]
   #;[visibility hidden])
  ((and (id nav-swmslot))
   [position relative]
   [height (px 39)]
   [display inline]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (id nav-cover))
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [width (% 100)]
   [height (% 100)]
   [display none]
   #;[background-color rgb(0, 0, 0)]
   #;[opacity 0.6]
   #;[transform translate3d(0px, 0px, 0px)]
   #;[z-index 4])
  ((and (class nav-left))
   [position relative]
   [float left]
   [width auto]
   [display inline-block])
  ((and (class nav-right))
   [position relative]
   [float right]
   [width auto]
   [display inline-block])
  ((and (class nav-fill))
   [width auto]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[white-space nowrap])
  ((".nav-action-button, .nav-action-button:link" (or))
   [display block]
   [height (px 33)]
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 11)]
   #;[cursor pointer]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
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
   #;[border-top-color rgb(200, 148, 17)]
   #;[border-right-color rgb(176, 130, 15)]
   #;[border-bottom-color rgb(153, 113, 13)]
   #;[border-left-color rgb(176, 130, 15)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[box-shadow (px 0)]
   #;[background-color transparent]
   #;[background-image -moz-linear-gradient(center top , rgb(248, 227, 173), rgb(238, 186, 55))]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [text-align center]
   #;[vertical-align middle]
   #;[color rgb(17, 17, 17)]
   #;[font-family arial,sans-serif]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[line-height (px 30)]
   #;[font-size (px 13)])
  ((".nav-action-button .nav-action-inner, .nav-action-button:link .nav-action-inner" (or))
   #;[color rgb(17, 17, 17)]
   [display block]
   [text-align center])
  ((and (class nav-column))
   [float left]
   #;[clear none])
  ((and (class nav-column-notfirst))
   [margin-left (px -12)])
  ((and (id nav-logo))
   [position relative]
   [float left]
   #;[line-height (px 0)]
   [height (% 100)]
   [width (px 192)]
   [padding-top (px 13)]
   [padding-right (px 19)]
   [padding-bottom (px 0)]
   [padding-left (px 27)])
  ((desc (and (id nav-logo)) (and (class nav-logo-link)))
   #;[clear both]
   [display inline-block]
   #;[cursor pointer])
  ((desc (and (id nav-logo)) (and (class nav-logo-base)))
   [float left]
   #;[text-indent (px -500)]
   #;[background-position -10px -51px]
   [width (px 96)]
   [height (px 29)])
  ((desc (and (id nav-logo)) (and (class nav-logo-ext)))
   [float left]
   [display none])
  ((desc (and (id nav-logo)) (and (class nav-logo-locale)))
   [float left]
   [display none]
   [margin-top (px 6)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 1)])
  ((desc (and (id nav-logo)) (and (class nav-logo-tagline)))
   [position absolute]
   [top (px 32)]
   [left (px 92)]
   #;[font-size (px 11)]
   #;[line-height (px 11)]
   #;[font-family arial,sans-serif]
   #;[white-space nowrap]
   #;[color rgb(72, 163, 198)]
   #;[background-repeat no-repeat]
   #;[background-position -1000px 0px]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line underline]
   #;[text-decoration-style solid]
   #;[font-weight 700])
  ((and (id nav-logo) (class nav-paladin))
   [width (px 194)])
  ((desc (and (id nav-logo) (class nav-paladin)) (and (class nav-logo-tagline)))
   [left (px 79)]
   [top (px 30)])
  ((desc (and (class nav-xshop-large)) (and (id nav-logo)))
   [padding-top (px 17)]
   [padding-right (px 40)]
   [padding-bottom (px 0)]
   [padding-left (px 18)])
  ((desc (and (class nav-xshop-large)) (and (id nav-logo)) (and (class nav-logo-base)))
   #;[background-position -10px -10px]
   [width (px 109)]
   [height (px 33)])
  ((desc (and (class nav-xshop-large)) (and (id nav-logo)) (and (class nav-logo-tagline)))
   [top (px 39)]
   [left (px 93)])
  ((desc (and (class nav-xshop-large)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [margin-top (px 2)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 2)])
  ((desc (and (class nav-cobranded)) (and (id nav-logo)))
   [padding-right (px 50)])
  ((desc (and (id nav-logo)) (and (class nav-cobrand)))
   [position absolute]
   [display block]
   [right (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[background-position right center]
   #;[background-repeat no-repeat]
   [margin-right (px 10)]
   [top (px 14)])
  ((desc (and (id nav-logo)) (and (class nav-cobrand)) (and (class nav-cobrand-divider)))
   [float left]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(231, 231, 231)])
  ((desc (and (class nav-xshop-large)) (and (id nav-logo)) (and (class nav-cobrand)))
   [top (px 17)]
   [margin-top (px -13)]
   [height (px 41)]
   [width (px 46)])
  ((desc (and (class nav-xshop-large)) (and (id nav-logo)) (and (class nav-cobrand)) (and (class nav-cobrand-divider)))
   [height (px 20)]
   [margin-top (px 11.5)])
  ((desc (and (class nav-xshop-small)) (and (id nav-logo)) (and (class nav-cobrand)))
   [top (px 9)]
   [margin-top (px -6)]
   [height (px 30)]
   [width (px 37)])
  ((desc (and (class nav-xshop-small)) (and (id nav-logo)) (and (class nav-cobrand)) (and (class nav-cobrand-divider)))
   [height (px 17)]
   [margin-top (px 6)])
  ((desc (and (class nav-locale-au)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [display block]
   #;[background-position -270px -249px]
   [width (px 40)]
   [height (px 14)])
  ((desc (and (class nav-locale-at)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [display block]
   #;[background-position -270px -189px]
   [width (px 12)]
   [height (px 14)])
  ((desc (and (class nav-locale-br)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [display block]
   #;[background-position -270px -229px]
   [width (px 39)]
   [height (px 14)])
  ((desc (and (class nav-locale-ca)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [display block]
   #;[background-position -270px -209px]
   [width (px 14)]
   [height (px 14)])
  ((desc (and (class nav-locale-de)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [display block]
   #;[background-position -270px -169px]
   [width (px 15)]
   [height (px 14)])
  ((desc (and (class nav-locale-es)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [display block]
   #;[background-position -270px -149px]
   [width (px 14)]
   [height (px 14)])
  ((desc (and (class nav-locale-fr)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [display block]
   #;[background-position -270px -129px]
   [width (px 11)]
   [height (px 14)])
  ((desc (and (class nav-locale-gb)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [display block]
   #;[background-position -270px -9px]
   [width (px 30)]
   [height (px 14)])
  ((desc (and (class nav-locale-in)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [display block]
   #;[background-position -270px -109px]
   [width (px 11)]
   [height (px 14)])
  ((desc (and (class nav-locale-it)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [display block]
   #;[background-position -270px -89px]
   [width (px 9)]
   [height (px 14)])
  ((desc (and (class nav-locale-nl)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [display block]
   #;[background-position -270px -269px]
   [width (px 40)]
   [height (px 14)])
  ((desc (and (class nav-locale-jp)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [display block]
   #;[background-position -270px -69px]
   [width (px 27)]
   [height (px 14)])
  ((desc (and (class nav-locale-mx)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [display block]
   #;[background-position -270px -49px]
   [width (px 49)]
   [height (px 14)])
  ((desc (and (class nav-locale-ru)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [display block]
   #;[background-position -270px -29px]
   [width (px 13)]
   [height (px 14)])
  ((desc (and (class nav-locale-uk)) (and (id nav-logo)) (and (class nav-logo-locale)))
   [display block]
   #;[background-position -270px -9px]
   [width (px 30)]
   [height (px 14)])
  ((desc (and (id nav-logo) (class nav-prime-1)) (and (class nav-logo-tagline)))
   #;[background-position -160px -10px]
   [width (px 39)]
   [height (px 10)])
  ((desc (and (id nav-logo) (class nav-prime-2)) (and (class nav-logo-tagline)))
   #;[background-position -160px -69px]
   [width (px 64)]
   [height (px 10)])
  ((desc (and (id nav-logo) (class nav-prime-3)) (and (class nav-logo-tagline)))
   #;[background-position -160px -69px]
   [width (px 64)]
   [height (px 10)])
  ((desc (and (id nav-logo)) (and (class nav-prime-try)))
   [top (px 31)]
   [left (px 93)])
  ((desc (and (class nav-xshop-large)) (and (id nav-logo) (class nav-paladin)))
   [padding-top (px 22)]
   [padding-right (px 40)]
   [padding-bottom (px 0)]
   [padding-left (px 18)])
  ((desc (and (class nav-xshop-large)) (and (id nav-logo) (class nav-paladin)) (and (class nav-logo-base)))
   #;[background-position -10px -90px]
   [width (px 76)]
   [height (px 23)])
  ((desc (and (class nav-xshop-large)) (and (id nav-logo) (class nav-paladin)) (and (class nav-logo-tagline)))
   [top (px 38)]
   [left (px 70)])
  ((desc (and (class nav-xshop-large)) (and (id nav-logo) (class nav-paladin)) (and (class nav-logo-locale)))
   [margin-top (px 2)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 2)])
  ((desc (and (class nav-xshop-small)) (and (id nav-logo) (class nav-paladin)))
   [padding-top (px 14)]
   [padding-right (px 40)]
   [padding-bottom (px 0)]
   [padding-left (px 18)])
  ((desc (and (class nav-xshop-small)) (and (id nav-logo) (class nav-paladin)) (and (class nav-logo-base)))
   #;[background-position -10px -90px]
   [width (px 76)]
   [height (px 23)])
  ((desc (and (class nav-xshop-small)) (and (id nav-logo) (class nav-paladin)) (and (class nav-logo-tagline)))
   [top (px 30)]
   [left (px 70)])
  ((desc (and (class nav-xshop-small)) (and (id nav-logo) (class nav-paladin)) (and (class nav-logo-locale)))
   [margin-top (px 2)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 2)])
  ((desc (and (id nav-logo) (class nav-paladin)) (and (class nav-logo-ext)))
   [position relative]
   [display block]
   [top (px -6)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 3)]
   #;[background-position -10px -171px]
   [width (px 51)]
   [height (px 19)])
  ((or (and (class nav-tpl-discoveryPanelList)) (and (class nav-tpl-discoveryPanelSummary)) (and (class nav-tpl-itemList)))
   [width (px 210)])
  ((or (desc (and (class nav-tpl-discoveryPanelList)) (and (class nav-item))) (desc (and (class nav-tpl-discoveryPanelSummary)) (and (class nav-item))) (desc (and (class nav-tpl-itemList)) (and (class nav-item))))
   [position relative]
   [display block]
   #;[clear both]
   #;[font-family arial,sans-serif]
   #;[line-height (px 16)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 7)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[cursor default])
  ((or (desc (and (class nav-tpl-discoveryPanelList)) (and (class nav-text))) (desc (and (class nav-tpl-discoveryPanelSummary)) (and (class nav-text))) (desc (and (class nav-tpl-itemList)) (and (class nav-text))))
   [display block]
   #;[font-size (px 13)]
   #;[color rgb(68, 68, 68)]
   #;[font-weight 400]
   #;[white-space normal]
   #;[word-wrap break-word])
  ((or (desc (and (class nav-tpl-discoveryPanelList)) (and (class nav-content))) (desc (and (class nav-tpl-discoveryPanelSummary)) (and (class nav-content))) (desc (and (class nav-tpl-itemList)) (and (class nav-content))))
   [display block]
   #;[font-size (px 13)]
   #;[color rgb(68, 68, 68)]
   #;[font-weight 400]
   #;[white-space normal]
   #;[word-wrap break-word])
  ((or (desc (and (class nav-tpl-discoveryPanelList)) (and (class nav-subtext))) (desc (and (class nav-tpl-discoveryPanelSummary)) (and (class nav-subtext))) (desc (and (class nav-tpl-itemList)) (and (class nav-subtext))))
   [display block]
   #;[font-size (px 11)]
   #;[line-height (px 13)]
   #;[font-weight 400]
   #;[color rgb(153, 153, 153)]
   #;[white-space normal])
  ((or (desc (and (class nav-tpl-discoveryPanelList)) (and (class nav-title))) (desc (and (class nav-tpl-discoveryPanelSummary)) (and (class nav-title))) (desc (and (class nav-tpl-itemList)) (and (class nav-title))))
   [padding-bottom (px 10)]
   [left (px 20)])
  ((".nav-tpl-discoveryPanelList .nav-link:focus .nav-icon, .nav-tpl-discoveryPanelList .nav-link:hover .nav-icon, .nav-tpl-discoveryPanelSummary .nav-link:focus .nav-icon, .nav-tpl-discoveryPanelSummary .nav-link:hover .nav-icon, .nav-tpl-itemList .nav-link:focus .nav-icon, .nav-tpl-itemList .nav-link:hover .nav-icon" (or))
   [display none])
  ((or (desc (and (class nav-tpl-discoveryPanelList)) (and (class nav-divider))) (desc (and (class nav-tpl-discoveryPanelSummary)) (and (class nav-divider))) (desc (and (class nav-tpl-itemList)) (and (class nav-divider))))
   [position relative]
   [display block]
   #;[line-height (px 1)]
   [height (px 1)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[background-color rgb(238, 238, 238)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 9)]
   [margin-left (px 0)])
  ((desc (and (class nav-tpl-itemListDeepBrowse)) (and (class nav-item)))
   [position relative]
   [display block]
   #;[clear both]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 7)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[cursor default])
  ((desc (and (class nav-tpl-itemListDeepBrowse)) (and (class nav-text)))
   [display inline]
   #;[font-size (px 13)]
   #;[color rgb(102, 102, 102)]
   #;[font-weight 400]
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis]
   #;[font-family arial,sans-serif]
   #;[line-height (px 16)])
  ((desc (and (class nav-tpl-itemListDeepBrowse)) (and (class nav-subcat-divider)))
   [margin-top (px 0)]
   [margin-right (px 14)]
   [margin-bottom (px 0)]
   [margin-left (px 14)]
   [border-top-width (px 1)]
   [border-top-style dotted]
   #;[border-top-color rgb(221, 221, 221)]
   [width (px 518)])
  ((desc (and (class nav-tpl-itemListDeepBrowse)) (and (class nav-subcat-section)))
   [position relative]
   [padding-top (px 7)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 14)]
   [margin-bottom (px 0)]
   [margin-left (px 14)]
   #;[line-height (px 17)])
  ((desc (and (class nav-tpl-itemListDeepBrowse)) (and (class nav-subcat-section)) (and (class nav-subcat-title)))
   [display block]
   [left (px 0)]
   [width (px 96)]
   [text-align right]
   #;[font-size (px 13)]
   [float left])
  ((desc (and (class nav-tpl-itemListDeepBrowse)) (and (class nav-subcat-section)) (and (class nav-subcat-title)) (and (class nav-item)))
   [padding-left (px 0)])
  ((desc (and (class nav-tpl-itemListDeepBrowse)) (and (class nav-subcat-section)) (and (class nav-subcat-links)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 101)])
  ((desc (and (class nav-tpl-itemListDeepBrowse)) (and (class nav-subcat-section)) (and (class nav-subcat-links)) (and (class nav-item)))
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(204, 204, 204)]
   #;[white-space nowrap]
   #;[color rgb(102, 102, 102)]
   [width auto]
   [padding-top (px 0)]
   [padding-right (px 9)]
   [padding-bottom (px 0)]
   [padding-left (px 8)]
   [margin-bottom (px 5)]
   [display inline-block]
   [margin-right (px -4)])
  ((or (desc (and (class nav-tpl-itemListDeepBrowse)) (and (class nav-subcat-section)) (and (class nav-subcat-links)) (and (class nav-first))) (desc (and (class nav-tpl-itemListDeepBrowse)) (and (class nav-subcat-section)) (and (class nav-subcat-links)) (and (class nav_linestart))))
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
   [padding-left (px 10)])
  ((desc (and (class nav-tpl-itemListDeepBrowse)) (and (class nav-title) (class nav-item)))
   [display block]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 8)]
   [margin-left (px 0)]
   [height (px 18)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 15)])
  ((".nav-tpl-itemListDeepBrowse .nav-active a.nav-text:active .nav-icon, .nav-tpl-itemListDeepBrowse .nav-active a.nav-text:hover .nav-icon" (or))
   [display none])
  ((desc (and (class nav-tpl-itemListDeepBrowse)) (and (class nav-link) (class nav-carat)))
   [margin-top (px 0)]
   [margin-right (px 8)]
   [margin-bottom (px 0)]
   [margin-left (px 14)])
  ((desc (and (class nav-tpl-itemListDeepBrowse)) (and (class nav-divider)))
   [position relative]
   [display block]
   #;[line-height (px 1)]
   [height (px 1)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[background-color rgb(238, 238, 238)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (class nav-tpl-notificationsList)) (and (class nav-title)))
   #;[font-size (px 17)]
   #;[font-weight 700]
   #;[line-height 1]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((".nav-tpl-notificationsList .nav-item + .nav-item" (or))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(238, 238, 238)]
   [margin-top (px 14)]
   #;[min-height (px 65)]
   [padding-top (px 14)]
   [position relative])
  ((desc (and (class nav-tpl-notificationsList)) (and (class nav-noti-list-image)))
   [float left]
   [height (px 65)]
   [width (px 65)])
  ((desc (and (class nav-tpl-notificationsList)) (and (class nav-noti-list-image)) (and (class nav-noti-list-image-tag)))
   [display block]
   [height auto]
   [margin-top (px 4)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   #;[max-height (% 100)]
   #;[max-width (% 100)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   [width (% 100)])
  ((or (desc (and (class nav-tpl-notificationsList)) (and (class nav-noti-list-with-image)) (and (class nav-noti-list-content))) (desc (and (class nav-tpl-notificationsList)) (and (class nav-noti-list-with-image)) (and (class nav-noti-list-heading))))
   [margin-left (px 79)])
  ((desc (and (class nav-tpl-notificationsList)) (and (class nav-noti-list-x)))
   #;[color rgb(170, 170, 170)]
   #;[cursor pointer]
   [display none]
   #;[font-size (px 20)]
   #;[line-height (px 20)]
   [position absolute]
   [right (px 0)]
   [top (px 14)])
  ((".nav-tpl-notificationsList .nav-item:hover .nav-noti-list-x" (or))
   [display block])
  ((or (and (class nav-tpl-discoveryPanelList)) (and (class nav-tpl-discoveryPanelSummary)))
   [width auto])
  ((or (desc (and (class nav-tpl-discoveryPanelList)) (and (class nav-item))) (desc (and (class nav-tpl-discoveryPanelSummary)) (and (class nav-item))))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [width (px 215)])
  ((or (desc (and (class nav-tpl-discoveryPanelList)) (and (class nav-dp-left-column))) (desc (and (class nav-tpl-discoveryPanelSummary)) (and (class nav-dp-left-column))))
   [width (px 80)]
   [height (px 65)]
   [display table-cell]
   #;[vertical-align middle]
   [padding-right (px 15)])
  ((or (desc (and (class nav-tpl-discoveryPanelList)) (and (class nav-dp-right-column))) (desc (and (class nav-tpl-discoveryPanelSummary)) (and (class nav-dp-right-column))))
   [display table-cell]
   #;[vertical-align middle]
   [width (px 135)])
  ((or (desc (and (class nav-tpl-discoveryPanelList)) (and (class nav-dp-secondary-row))) (desc (and (class nav-tpl-discoveryPanelSummary)) (and (class nav-dp-secondary-row))))
   [margin-top (px 8)])
  ((or (desc (and (class nav-tpl-discoveryPanelList)) (and (class nav-divider))) (desc (and (class nav-tpl-discoveryPanelSummary)) (and (class nav-divider))))
   [margin-top (px 7)]
   [margin-right (px 0)]
   [margin-bottom (px 7)]
   [margin-left (px 0)])
  ((or (desc (and (class nav-tpl-discoveryPanelList)) (and (class nav-divider-container))) (desc (and (class nav-tpl-discoveryPanelSummary)) (and (class nav-divider-container))))
   [height (px 7)])
  ((and (class nav-tpl-flyoutError))
   [padding-top (px 12)]
   [padding-right (px 14)]
   [padding-bottom (px 7)]
   [padding-left (px 14)])
  ((desc (and (class nav-tpl-flyoutError)) (and (class nav-title)))
   [display block]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[font-family arial,sans-serif]
   #;[font-size (px 16)]
   #;[font-weight 700]
   #;[line-height (px 16)]
   #;[color rgb(51, 51, 51)]
   #;[cursor default]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 7)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class nav-tpl-flyoutError)) (and (class nav-paragraph)))
   [display block]
   #;[font-family arial,sans-serif]
   #;[font-size (px 13)]
   #;[line-height (px 16)]
   #;[color rgb(51, 51, 51)]
   #;[cursor pointer]
   [padding-top (px 6)]
   [padding-right (px 0)]
   [padding-bottom (px 12)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid])
  ((desc (and (class nav-tpl-flyoutError)) (and (class nav-action-button)))
   [margin-top (px 8)]
   [margin-right (px 0)]
   [margin-bottom (px 8)]
   [margin-left (px 0)])
  ((desc (and (class nav-subnav)) (and (id nav-subnav)))
   [display block])
  ((and (id nav-subnav))
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
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgba(0, 0, 0, 0.17)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgba(0, 0, 0, 0.1)]
   #;[white-space nowrap]
   [height (px 33)]
   #;[background-color rgb(250, 250, 250)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  (("#nav-subnav a.nav-locked:hover" (or))
   #;[color rgb(255, 153, 0)]
   [border-bottom-width (px 2)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(255, 153, 0)])
  ((desc (and (id nav-subnav)) (and (class nav-a)))
   [position relative]
   [float left]
   [height (px 31)]
   #;[line-height (px 33)]
   #;[color rgb(51, 51, 51)]
   #;[font-size (px 12)]
   [padding-top (px 0)]
   [padding-right (px 11)]
   [padding-bottom (px 0)]
   [padding-left (px 11)])
  (("#nav-subnav .nav-a:hover" (or))
   #;[color rgb(228, 121, 17)]
   [border-bottom-width (px 2)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(255, 153, 0)])
  ((desc (and (id nav-subnav)) (and (class nav-a) (class nav-hasAtext)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (id nav-subnav)) (and (class nav-a) (class nav-hasAtext)) (and (class nav-arrow)))
   [display none])
  ((desc (and (id nav-subnav)) (and (class nav-hasArrow)))
   [padding-right (px 20)])
  (("#nav-subnav .nav-hasArrow:focus, #nav-subnav .nav-hasArrow:hover" (or))
   [border-bottom-width (px 0)]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color])
  ((desc (and (id nav-subnav)) (and (class nav-hasArrow)) (and (class nav-arrow)))
   [position absolute]
   [top (px 14)]
   [right (px 11)]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-right-width (px 3)]
   [border-left-width (px 3)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   [border-top-width (px 3)]
   [border-top-style solid]
   #;[border-top-color rgb(160, 160, 160)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   #;[line-height (px 0)]
   #;[font-size (px 3)])
  ((desc (and *) (and (tag html)) (and (id nav-subnav)) (and (class nav-hasArrow)) (and (class nav-arrow)))
   [top (px 17)])
  (("#nav-subnav .nav-hasImage:focus, #nav-subnav .nav-hasImage:hover" (or))
   [border-bottom-width (px 0)]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color])
  ((desc (and (id nav-subnav)) (and (class nav-categ-image)))
   [width auto]
   [padding-top (px 5)])
  ((desc (and (id nav-subnav)) (and (class nav-right)))
   [float right])
  ((desc (and (id nav-subnav)) (and (class nav-image-abs-right)))
   [margin-right (px -20)])
  ((or (desc (and (id nav-subnav)) (and (class nav-categ-image))) (desc (and (id nav-subnav)) (and (class nav-image))))
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
   #;[outline-color -moz-use-text-color]
   #;[vertical-align baseline])
  ((desc (and (id nav-subnav)) (and (class nav-subnav-item-image)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id nav-subnav)) (and (class nav-subnav-item-image)) (and (class nav_a)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class nav-tpl-subnav)) (and (class nav_sv_fo_scheduled)))
   [overflow-x hidden]
   [overflow-y hidden]
   #;[white-space nowrap])
  ((desc (and (class nav-tpl-subnav)) (and (class nav_sv_fo_v_ul)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class nav-tpl-subnav)) (and (class nav_sv_fo_v_column)))
   [float left]
   [padding-left (px 22)]
   #;[font-family arial,sans-serif]
   #;[font-size (px 12)])
  ((desc (and (class nav-tpl-subnav)) (and (class nav_sv_fo_v_li)))
   #;[list-style-type none]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class nav-tpl-subnav)) (and (class nav_sv_fo_v_first)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class nav-tpl-subnav)) (and (class nav_sv_fo_v_topspacer)))
   [padding-top (px 10)]
   [margin-top (px 7)]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(204, 204, 204)])
  ((desc (and (class nav-tpl-subnav)) (and (class nav_sv_fo_v_bottomspacer)))
   [padding-bottom (px 3)]
   [margin-bottom (px 5)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(204, 204, 204)])
  ((desc (and (class nav-tpl-subnav)) (and (class nav_sv_fo_v)))
   [width (% 100)])
  ((desc (and (class nav-tpl-subnav)) (and (class nav_sv_fo_v_button)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 10)]
   [margin-left (px 0)])
  ((desc (and (class nav-tpl-subnav)) (and (class nav_sv_fo_v_list)))
   [float left])
  ((and (id navFooter))
   [margin-top (px 30)]
   [margin-right (px 0)]
   [margin-bottom (px 8)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 7)]
   [padding-left (px 0)])
  ((and (id navFooter) (class navFooterWithStripe))
   [margin-top (px 30)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((or (desc (and (tag html) (class a-js)) (and (class navFooterMobileStripe))) (desc (and (tag html) (class a-no-js)) (and (class navFooterMobileStripe))))
   [margin-top (px 10)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (class navFooterMobileStripe))
   [display block]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(216, 216, 216)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(216, 216, 216)]
   #;[line-height (px 50)]
   [text-align center]
   [margin-top (px 10)]
   [margin-right (px -8)]
   [margin-bottom (px 0)]
   [margin-left (px -8)]
   #;[background-color rgb(242, 242, 242)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[font-weight 700]
   #;[min-width (px 1000)]
   #;[font-size large])
  ((desc (and (id navFooter)) (and (tag img)))
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
  ((desc (and (id navFooter)) (and (tag table)))
   [width (% 100)])
  ((desc (and (id navFooter)) (and (tag td)))
   #;[font-family arial,sans-serif]
   #;[font-size (px 13)]
   #;[line-height (% 120)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)])
  ((desc (and (id navFooter)) (and (tag table) (class navFooterVerticalColumn)))
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [width auto])
  ((desc (and (class navFooterThreeColumn)) (and (class navFooterColSpacerOuter)))
   [width (% 35)]
   [padding-top (px 0)]
   [padding-right (px 15)]
   [padding-bottom (px 0)]
   [padding-left (px 15)])
  ((desc (and (class navFooterThreeColumn)) (and (class navFooterColSpacerInner)))
   [width (% 15)]
   [padding-top (px 0)]
   [padding-right (px 15)]
   [padding-bottom (px 0)]
   [padding-left (px 15)])
  ((desc (and (class navFooterVerticalColumn)) (and (class navFooterColSpacerInner)))
   [width (% 10)]
   [padding-top (px 0)]
   [padding-right (px 15)]
   [padding-bottom (px 0)]
   [padding-left (px 15)])
  ((desc (and (class navFooterLinkCol)) (and (tag ul)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class navFooterLinkCol)) (and (tag ul)) (and (tag li)))
   #;[list-style-type none]
   #;[white-space nowrap]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 8)]
   [margin-left (px 0)])
  ((desc (and (tag ul) (class navFooterCondensed)) (and (tag li)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 4)]
   [margin-left (px 0)])
  ((and (class navFooterColHead))
   #;[font-family arial,sans-serif]
   #;[color rgb(51, 51, 51)]
   #;[font-size (px 16)]
   [margin-top (px 6)]
   [margin-right (px 0)]
   [margin-bottom (px 14)]
   [margin-left (px 0)]
   #;[white-space nowrap])
  ((and (tag div) (class navFooterLine))
   #;[font-family arial,sans-serif]
   #;[color rgb(118, 118, 118)]
   #;[font-size (px 11)]
   [text-align center]
   #;[line-height (px 18)])
  ((and (tag div) (class navFooterLogoLine))
   [margin-top (px 30)]
   [margin-right (px 8)]
   [margin-bottom (px 4)]
   [margin-left (px 8)]
   #;[font-size (px 1)]
   #;[line-height (px 0)])
  ((and (class navFooterLinkLine))
   [margin-top (px 0)]
   [margin-right (px 8)]
   [margin-bottom (px 0)]
   [margin-left (px 8)])
  ((and (class navFooterDLicense))
   [text-align center]
   [margin-top (px 8)]
   [margin-right (px 8)]
   [margin-bottom (px 0)]
   [margin-left (px 8)])
  ((or (desc (and (class navFooterLinkLine)) (and (tag span))) (desc (and (class navFooterLinkLine)) (and (tag ul))))
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
  ((desc (and (class navFooterLinkLine)) (and (tag ul)) (and (tag li)))
   [display inline])
  ((desc (and (class navFooterLineDivider)) (and (tag ul)) (and (tag li)))
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(153, 153, 153)])
  ((desc (and (class navFooterLinkCol)) (and (tag ul)) (and (tag li) (class nav_a_carat)))
   [position relative]
   [padding-left (px 0)])
  ((desc (and (class navFooterLinkCol)) (and (tag ul)) (and (tag li) (class nav_a_carat)) (and (tag span) (class nav_a_carat)))
   [top (px 0)]
   #;[font-size (px 15)]
   #;[color rgb(228, 121, 17)]
   #;[font-weight 700]
   #;[line-height (px 15)])
  ((desc (and (class navFooterLinkCol)) (and (tag ul)) (and (tag li) (class nav_a_carat)) (and (tag a)))
   [padding-left (px 4)])
  ((desc (and (class navFooterLineDivider)) (and (tag ul)) (and (tag li) (class nav_first)))
   [border-left-width (px 0)]
   [border-left-style none]
   #;[border-left-color -moz-use-text-color])
  ((and (class navFooterDLicenseLine))
   [text-align center]
   #;[line-height (px 20)])
  ((or (desc (and (class navFooterPadItemLine)) (and (tag a))) (desc (and (class navFooterPadItemLine)) (and (tag span))))
   [padding-top (px 0)]
   [padding-right (px 6.6)]
   [padding-bottom (px 0)]
   [padding-left (px 6.6)])
  ((and (class navFooterDescLine))
   [margin-top (px 20)]
   [margin-right (px 0)]
   [margin-bottom (px 14)]
   [margin-left (px 0)])
  ((and (class navFooterDescSpacer))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (id navFooter)) (and (class navFooterBackToTop)))
   #;[background-color rgb(243, 243, 243)]
   [margin-bottom (px 25)])
  ((desc (and (id navFooter)) (and (class navFooterBackToTop)) (and (tag span)))
   [display block]
   [text-align center]
   #;[color rgb(17, 17, 17)]
   [padding-top (px 15)]
   [padding-right (px 0)]
   [padding-bottom (px 15)]
   [padding-left (px 0)])
  ((desc (and (id navFooter)) (and (class navFooterDescItem)))
   #;[font-size (px 11)]
   [padding-top (px 0)]
   [padding-right (px 8.25)]
   [padding-bottom (px 0)]
   [padding-left (px 8.25)]
   #;[vertical-align top]
   [text-align left]
   #;[line-height (% 115)])
  ((and (class navFooterDescText))
   #;[font-size (px 10)]
   #;[color rgb(118, 118, 118)]
   #;[line-height (% 110)]
   [display block]
   [margin-bottom (px 1)])
  ((and (id navFooter) (class navGreyFooter))
   [margin-top (px 30)]
   [margin-right (px -8)]
   [margin-bottom (px -8)]
   [margin-left (px -8)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (id navFooter) (class navGreyFooter)) (and (class navFooterColHead)))
   #;[font-weight 400]
   #;[line-height (px 22)]
   #;[font-size (px 17)]
   #;[color rgb(51, 51, 51)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 16)]
   [margin-left (px 0)])
  ((desc (and (id navFooter) (class navGreyFooter)) (and (tag div) (class navFooterLogoLine)))
   [margin-top (px 30)]
   [margin-right (px 8)]
   [margin-bottom (px 10)]
   [margin-left (px 8)])
  ((desc (and (id navFooter) (class navGreyFooter)) (and (class navFooterLinkLine)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id navFooter) (class navGreyFooter)) (and (class navFooterPadItemLine)))
   [margin-bottom (px 10)])
  ((desc (and (id navFooter) (class navGreyFooter)) (and (class navFooterDescLine)))
   [margin-top (px 24)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 36)]
   [padding-right (px 0)]
   [padding-bottom (px 40)]
   [padding-left (px 0)]
   #;[background-color rgb(243, 243, 243)]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(221, 221, 221)])
  ((and (id navSwmSlot))
   [position relative])
  ((and (id nav-swmslot))
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden]
   [height (px 39)]
   [top (px 9)])
  (("#nav-swm-slot .nav_a, #nav-swm-slot .nav_a:link, #nav-swm-slot .nav_a:visited" (or))
   [text-align right]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [position absolute]
   [right (px 20)])
  (("#nav-swm-slot .nav-swm-primary, #nav-swm-slot .nav-swm-primary:link, #nav-swm-slot .nav-swm-primary:visited" (or))
   #;[color rgb(0, 75, 145)]
   #;[font-size (px 12)]
   [bottom (px 4)])
  ((desc (and (id nav-swm-slot)) (and (class nav-swm-secondary)))
   #;[color rgb(153, 153, 153)]
   #;[font-size (px 11)]
   [bottom (px 18)])
  ((and (id navSwmHoliday))
   #;[background-repeat no-repeat]
   #;[background-position right bottom]
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
   [text-align right]
   #;[background-size inherit])
  ((desc (and (id navSwmHoliday)) (and (class nav-imageHref)))
   [display block]
   [height (% 100)])
  ((desc (and (id navSwmHoliday)) (and (class navSwmHolidayUl)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 8)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((or (desc (and (id navSwmHoliday)) (and (class navSwmHolidayHead))) (desc (and (id navSwmHoliday)) (and (class navSwmHolidayNote))) (desc (and (id navSwmHoliday)) (and (class navSwmHolidaySubhead))))
   #;[list-style-type none]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (tag div) (id navSwmHoliday) (class nav-focus))
   [border-top-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(204, 204, 204)]
   #;[border-bottom-color rgb(204, 204, 204)]
   #;[border-left-color rgb(204, 204, 204)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-right-width medium]
   [border-right-style none]
   #;[border-right-color -moz-use-text-color]
   [margin-top (px 1)]
   [margin-right (px 0)]
   [margin-bottom (px 1)]
   [margin-left (px 0)])
  ((desc (and (tag header)) (and (id navbar)) (and (class srch_sggst_flyout)))
   [margin-left (px -1)]
   [margin-top (px -1)])
  ((and (id nav-search-label))
   [position relative]
   [display inline-block]
   [float left]
   #;[line-height (px 35)]
   #;[color rgb(51, 51, 51)]
   #;[font-weight 700]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 10)]
   #;[font-family arial,sans-serif])
  ((and (id nav-search))
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
  ((desc (and (class nav-maxw-search)) (and (id nav-search)))
   #;[max-width (px 660)]
   [width (px 660)])
  ((desc (and (id nav-search)) (and (class nav-searchbar)))
   [display block]
   [position relative]
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 4)])
  ((or (desc (and (id nav-search)) (and (class nav-searchbar)) (and (class nav-fill))) (desc (and (id nav-search)) (and (class nav-searchbar)) (and (class nav-left))) (desc (and (id nav-search)) (and (class nav-searchbar)) (and (class nav-right))))
   [position relative]
   [height (px 35)])
  ((or (desc (and *) (and (tag html)) (and (id nav-search)) (and (class nav-searchbar)) (and (class nav-fill))) (desc (and *) (and (tag html)) (and (id nav-search)) (and (class nav-searchbar)) (and (class nav-left))) (desc (and *) (and (tag html)) (and (id nav-search)) (and (class nav-searchbar)) (and (class nav-right))))
   [height (px 36)])
  ((desc (and (id nav-search)) (and (class nav-search-scope)))
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
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-right-color rgb(205, 205, 205)]
   #;[border-bottom-color rgb(205, 205, 205)]
   #;[border-left-color rgb(205, 205, 205)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-top-color rgb(189, 189, 189)]
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 4)]
   #;[background-position (px 0)])
  ((desc (and *) (and (tag html)) (and (id nav-search)) (and (class nav-search-scope)))
   [margin-right (px -3)])
  ((desc (and (id nav-search)) (and (class nav-search-facade)))
   [position relative]
   [float left]
   #;[cursor default]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (id nav-search)) (and (class nav-search-facade)) (and (class nav-search-label)))
   [display block]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[white-space nowrap]
   #;[text-overflow ellipsis]
   #;[color rgb(119, 119, 119)]
   #;[font-size (px 12)]
   #;[line-height (px 33)]
   [margin-right (px 21)]
   [margin-left (px 5)])
  ((desc (and (id nav-search)) (and (class nav-search-facade)) (and (class nav-icon)))
   [position absolute]
   [top (px 14)]
   [right (px 8)]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-right-width (px 4)]
   [border-left-width (px 4)]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   [border-top-width (px 4)]
   [border-top-style solid]
   #;[border-top-color rgb(160, 160, 160)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)])
  ((desc (and (id nav-search)) (and (class nav-search-dropdown)))
   [position absolute]
   [display block]
   [top (px -1)]
   [left (px 0)]
   [height (px 35)]
   [width auto]
   #;[font-family arial,sans-serif]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[cursor pointer]
   #;[opacity (px 0)]
   #;[visibility visible]
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
   #;[line-height (px 35)])
  ((desc (and *) (and (tag html)) (and (id nav-search)) (and (class nav-search-dropdown)))
   [top (px 6)])
  ((desc (and (id nav-search)) (and (class nav-search-submit)))
   [position relative]
   [top (px 0)]
   [right (px 0)]
   [height (px 35)]
   [width (px 42)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[cursor pointer]
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
   #;[border-top-color rgb(72, 80, 89)]
   #;[border-right-color rgb(44, 49, 55)]
   #;[border-bottom-color rgb(54, 60, 67)]
   #;[border-left-color rgb(72, 80, 89)]
   #;[background-color rgb(91, 98, 106)]
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 0)]
   #;[background-position (px 0)])
  ((desc (and *) (and (tag html)) (and (id nav-search)) (and (class nav-search-submit)))
   [margin-left (px -4)]
   [width (px 57)])
  ((desc (and (id nav-search)) (and (class nav-search-submit)) (and (class nav-search-submit-text)))
   [position absolute]
   [left (px 11)]
   [top (px 10)]
   #;[font-weight 700]
   #;[color rgb(255, 255, 255)]
   #;[font-size (px 13)]
   #;[line-height (px 13)]
   #;[font-family arial,sans-serif]
   #;[vertical-align middle]
   [text-align center]
   #;[text-shadow (px 0)])
  ((desc (and *) (and (tag html)) (and (id nav-search)) (and (class nav-search-submit)) (and (class nav-search-submit-text)))
   [left (px 19)]
   [top (px 9)])
  ((desc (and (id nav-search)) (and (class nav-search-submit)) (and (class nav-input)))
   [position relative]
   [display block]
   [height (% 100)]
   [width (% 100)]
   #;[font-size (px 14)]
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
   #;[outline-color -moz-use-text-color]
   #;[color rgb(255, 255, 255)]
   #;[background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
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
   #;[text-indent (px -1000)]
   #;[line-height (px 1)])
  (("#nav-search .nav-search-submit .nav-input::-moz-focus-inner" (or))
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
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (id nav-search)) (and (class nav-search-field)))
   [position relative]
   [height (px 35)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(189, 189, 189)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(205, 205, 205)])
  ((desc (and (id nav-search)) (and (class nav-search-field)) (and (class nav-input)))
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [display block]
   [width (% 100)]
   #;[line-height (px 15)]
   [padding-top (px 6)]
   [padding-right (px 10)]
   [padding-bottom (px 6)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
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
   [height (px 33)]
   #;[font-family arial,sans-serif]
   #;[font-size (px 15)]
   #;[background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[color rgb(17, 17, 17)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   #;[box-shadow none]
   #;[text-indent (px 8)])
  ((desc (and *) (and (tag html)) (and (id nav-search)) (and (class nav-search-field)) (and (class nav-input)))
   [height (px 33)]
   [padding-top (px 8)]
   [padding-bottom (px 8)])
  ((desc (and (id nav-search)) (and (id nav-iss-attach)))
   [position absolute]
   [bottom (px 0)]
   [left (px 0)]
   [width (% 100)]
   [height (px 0)]
   #;[line-height 1])
  ((desc (and (id navbar)) (and (class srch_sggst_flyout)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-left (px -1)]
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)])
  ((desc (and (id navbar)) (and (class srch_sggst_flyout)) (and (id srch_sggst)))
   [position relative]
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
   [margin-top (px 3)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 0)])
  ((desc (and (id navbar)) (and (class srch_sggst_flyout)) (and (id srch_sggst)) (and (id two-pane-table)))
   [margin-bottom (px 12)])
  ((desc (and (id navbar)) (and (class srch_sggst_flyout)) (and (id srch_sggst)) (and (class iss_pop_tl)))
   [width (px 19)])
  ((desc (and (id navbar)) (and (class srch_sggst_flyout)) (and (id srch_sggst)) (and (class suggest_link_over)) (and (class xcat-arrow)))
   #;[background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-top-width (px 8)]
   [border-bottom-width (px 8)]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   [border-right-width (px 0)]
   [border-left-width (px 8)]
   [border-left-style solid]
   #;[border-left-color rgb(216, 216, 216)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)])
  ((desc (and (id navbar)) (and (tag div) (id srch_sggst)))
   #;[box-shadow none]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-right-color rgb(221, 221, 221)]
   #;[border-bottom-color rgb(221, 221, 221)]
   #;[border-left-color rgb(221, 221, 221)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(238, 238, 238)]
   [margin-top (px 13)]
   [margin-left (px -5)])
  ((and (class suggest_link))
   #;[background-color rgb(255, 255, 255)]
   [padding-top (px 2)]
   [padding-right (px 6)]
   [padding-bottom (px 2)]
   [padding-left (px 6)])
  ((desc (and (id navbar)) (and (class suggest_link)))
   [padding-top (px 1)]
   [padding-right (px 10)]
   [padding-bottom (px 1)]
   [padding-left (px 10)]
   #;[line-height (px 24)]
   #;[font-size (px 14)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id navbar)) (and (tag ul) (class promo_list)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [border-top-width medium]
   [border-top-style none]
   #;[border-top-color -moz-use-text-color]
   #;[background-color rgb(255, 255, 255)]
   #;[list-style-type none])
  ((desc (and (id navbar)) (and (tag ul) (class promo_list)) (and (tag li)))
   #;[clear both]
   [overflow-x hidden]
   [overflow-y hidden]
   [padding-top (px 7)]
   [padding-right (px 10)]
   [padding-bottom (px 7)]
   [padding-left (px 10)]
   #;[white-space normal]
   #;[line-height (px 20)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id navbar)) (and (tag ul) (class promo_list)) (and (tag li)) (and (class promo_image)))
   [float left]
   [width (px 40)]
   [height (px 40)]
   #;[background-repeat no-repeat]
   #;[background-position center center])
  ((desc (and (id navbar)) (and (tag ul) (class promo_list)) (and (tag li)) (and (class promo_cat)))
   #;[font-weight 700]
   [margin-left (px 50)])
  ((desc (and (id navbar)) (and (tag ul) (class promo_list)) (and (tag li)) (and (class promo_title)))
   #;[line-height (px 13)]
   [margin-left (px 50)])
  ((and (class suggest_nm))
   [display block])
  ((or (desc (and (class suggest_link)) (and (class suggest_category_without_keyword))) (desc (and (class suggest_link_over)) (and (class suggest_category_without_keyword))))
   [padding-left (px 10)])
  ((and (class sx_line_holder))
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(221, 221, 221)]
   [margin-top (px 2)]
   [margin-right (px 5)]
   [margin-bottom (px 2)]
   [margin-left (px 5)])
  ((and (id srch_sggst))
   #;[background-color rgb(255, 255, 255)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(221, 221, 221)]
   #;[border-right-color rgb(221, 221, 221)]
   #;[border-bottom-color rgb(221, 221, 221)]
   #;[border-left-color rgb(221, 221, 221)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[color rgb(0, 0, 0)]
   [position absolute]
   [text-align left]
   #;[z-index 250])
  ((desc (and (id navbar)) (and (id srch_sggst)))
   #;[box-shadow (px 0)]
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
   #;[border-image-repeat stretch stretch])
  ((and (id sugdivhdr))
   #;[color rgb(136, 136, 136)]
   #;[font-size (px 10)]
   #;[line-height (px 12)]
   [padding-right (px 4)]
   [text-align right])
  ((and (id srch_sggst) (class two-pane))
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
   #;[background-color transparent])
  ((and (id two-pane-table))
   #;[table-layout fixed]
   [width (% 100)]
   #;[empty-cells show])
  ((desc (and (id two-pane-table)) (and (class iss-spacer-row)))
   [height (px 26)])
  ((desc (and (id srch_sggst) (class two-pane)) (and (class main-suggestions)))
   [border-right-width (px 1)]
   [border-right-style solid]
   #;[border-right-color rgb(216, 216, 216)]
   #;[color rgb(51, 51, 51)]
   #;[background-color rgb(255, 255, 255)]
   #;[vertical-align top])
  ((desc (and (id srch_sggst) (class two-pane)) (and (class main-suggestion)))
   [padding-left (px 0)]
   #;[cursor pointer])
  ((desc (and (id srch_sggst) (class two-pane)) (and (class xcat-arrow)))
   [float right]
   [margin-top (px 5)]
   [margin-right (px 0)]
   [margin-bottom (px 3)]
   [margin-left (px 5)]
   #;[visibility hidden])
  ((and (class iss_pop_tl))
   [width (px 45)]
   [height (px 8)]
   #;[background-position (px 0)])
  ((and (class iss_pop_tr))
   [width (px 45)]
   [height (px 8)]
   #;[background-position -45px -88px])
  ((and (class nav-cat-indicator))
   [width (px 7)]
   [height (px 16)]
   #;[background-position -130px -30px])
  ((desc (and (id srch_sggst)) (and (class imeSpacing)))
   [margin-top (px 50)])
  ((desc (and (id srch_sggst)) (and (class imePadding)))
   [padding-top (px 50)])
  ((and (id nav-flyout-iss-anchor))
   [position absolute]
   [bottom (px 0)]
   [left (px 0)]
   [width (% 100)]
   [height (px 0)]
   #;[line-height (px 0)]
   #;[z-index 100])
  ((desc (and (id nav-flyout-iss-anchor)) (and (class nav-issFlyout)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (class nav-flyout))
   [position absolute]
   [display none]
   [overflow-x visible]
   [overflow-y visible]
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
   #;[border-top-color rgb(187, 187, 187)]
   #;[border-right-color rgb(187, 187, 187)]
   #;[border-bottom-color rgb(187, 187, 187)]
   #;[border-left-color rgb(187, 187, 187)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [box-sizing border-box]
   [padding-top (px 14)]
   [padding-right (px 14)]
   [padding-bottom (px 14)]
   [padding-left (px 14)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[box-shadow (px 0)]
   #;[font-size (px 13)]
   #;[font-family arial,sans-serif]
   #;[line-height normal])
  ((desc (and (class nav-flyout)) (and (class nav-arrow)))
   [border-top-style solid]
   [border-right-style solid]
   [border-left-style solid]
   [border-right-width (px 9)]
   [border-left-width (px 9)]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-left-color transparent]
   [border-top-width (px 0)]
   [border-bottom-width (px 9)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(204, 204, 204)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   [position absolute]
   [top (px -9)])
  ((desc (and (class nav-flyout)) (and (class nav-arrow-inner)))
   [border-top-style solid]
   [border-right-style solid]
   [border-left-style solid]
   [border-right-width (px 9)]
   [border-left-width (px 9)]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-left-color transparent]
   [border-top-width (px 0)]
   [border-bottom-width (px 9)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(255, 255, 255)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   [position absolute]
   [top (px 1)]
   [left (px -9)])
  ((desc (and *) (and (tag html)) (and (id nav-flyout-anchor)) (and (class nav-flyout)) (and (class nav-spinner)))
   [height (px 200)]
   [width (px 200)])
  ((and (id nav-flyout-anchor))
   [position absolute]
   [bottom (px 0)]
   [left (px 0)]
   [width (% 100)]
   [height (px 0)]
   #;[line-height (px 0)]
   #;[z-index 100])
  ((desc (and (id navbar)) (and (class nav-flyout-sidePanel)))
   [position absolute]
   [display none]
   [top (px 0)]
   [right (% 100)]
   [width (px 240)]
   [height (% 100)]
   [margin-top (px -1)]
   [margin-right (px -1)]
   [margin-bottom (px -1)]
   [margin-left (px -1)]
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
   [overflow-x hidden]
   [overflow-y hidden]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 3)]
   #;[box-shadow -2px 2px 4px 0px rgba(0, 0, 0, 0.13)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [box-sizing content-box])
  ((and (class nav-flyout-sidePanel-content))
   [position relative]
   [padding-top (px 14)]
   [padding-right (px 14)]
   [padding-bottom (px 14)]
   [padding-left (px 14)]
   [height (% 100)])
  ((and (class nav-coreFlyout))
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
  ((desc (and (class nav-coreFlyout)) (and (class nav-arrow)))
   [margin-left (px -1)])
  ((and (class nav-cartFlyout))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px -3)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px -2)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)])
  ((desc (and (class nav-cartFlyout)) (and (class nav-arrow)))
   [margin-left (px -1)])
  ((desc (and (class nav-cartFlyout)) (and (class nav-tpl-error)))
   [padding-top (px 14)]
   [padding-right (px 0)]
   [padding-bottom (px 7)]
   [padding-left (px 0)])
  ((desc (and (id nav-flyout-anchor)) (and (class nav-subnavFlyout-nudged)))
   [margin-top (px 12)])
  ((and (class nav-subnavFlyout))
   [margin-top (px -1)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px -2)]
   [padding-top (px 12)]
   [padding-right (px 14)]
   [padding-bottom (px 7)]
   [padding-left (px 14)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[border-top-color rgb(231, 231, 231)]
   #;[border-right-color rgb(231, 231, 231)]
   #;[border-bottom-color rgb(231, 231, 231)]
   #;[border-left-color rgb(231, 231, 231)])
  ((desc (and *) (and (tag html)) (and (class nav-subnavFlyout)))
   [margin-top (px -2)])
  ((desc (and (class nav-subnavFlyout)) (and (class nav-arrow)))
   [margin-left (px -1)])
  ((or (desc (and (class nav-fullWidthFlyout)) (and (class nav-flyout-content))) (desc (and (class nav-fullWidthSubnavFlyout)) (and (class nav-flyout-content))))
   #;[min-height (px 120)]
   [width (% 100)])
  ((or (and (class nav-fullWidthFlyout) (class nav-asinsubnav-flyout)) (and (class nav-fullWidthSubnavFlyout) (class nav-asinsubnav-flyout)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class nav-fullWidthSubnavFlyout)) (and (class nav-flyout-content)))
   [padding-left (px 17)])
  ((and (class nav-catFlyout))
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
   #;[border-image-repeat stretch stretch])
  ((desc (and *) (and (tag html)) (and (id nav-flyout-anchor)) (and (class nav-catFlyout)) (and (class nav-spinner)))
   [height (px 200)]
   [width (px 200)])
  ((desc (and (class nav-catFlyout)) (and (class nav-promo)))
   [position absolute]
   [bottom (px -15)]
   [right (px 0)]
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
   [margin-right (px 0)]
   #;[max-width none]
   [margin-bottom (px 14)])
  ((desc (and (class nav-catFlyout)) (and (class nav-flyout-content)))
   [float left]
   #;[clear none]
   [width (px 238)]
   [padding-top (px 14)]
   [padding-right (px 0)]
   [padding-bottom (px 8)]
   [padding-left (px 0)])
  ((desc (and (class nav-catFlyout)) (and (class nav-flyout-content)) (and (class nav-item)))
   [position relative]
   [margin-top (px 0)]
   [margin-right (px 8)]
   [margin-bottom (px 0)]
   [margin-left (px 14)]
   #;[text-overflow ellipsis]
   [padding-right (px 8)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid])
  ((desc (and (class nav-catFlyout)) (and (class nav-flyout-content)) (and (class nav-item)) (and (class nav-image)))
   [float left]
   [margin-right (px 14)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
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
   #;[border-image-repeat stretch stretch])
  ((desc (and (class nav-catFlyout)) (and (class nav-flyout-content)) (and (class nav-hasPanel)) (and (class nav-text)))
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis])
  ((desc (and *) (and (tag html)) (and (class nav-catFlyout)) (and (class nav-flyout-content)) (and (class nav-hasPanel)) (and (class nav-text)))
   [width (px 200)])
  ((desc (and (class nav-catFlyout)) (and (class nav-flyout-content)) (and (class nav-hasPanel)) (and (class nav-badge)))
   #;[text-transform uppercase]
   #;[color rgb(255, 255, 255)]
   #;[background-color rgb(80, 156, 38)]
   [padding-top (px 1)]
   [padding-right (px 4)]
   [padding-bottom (px 1)]
   [padding-left (px 4)]
   #;[border-top-left-radius (px 5)]
   #;[border-top-right-radius (px 5)]
   #;[border-bottom-right-radius (px 5)]
   #;[border-bottom-left-radius (px 5)]
   #;[font-size (px 10)]
   #;[font-weight 700]
   [margin-left (px 5)]
   [display inline-block])
  ((desc (and (class nav-catFlyout)) (and (class nav-flyout-content)) (and (class nav-divider)))
   [margin-top (px 0)]
   [margin-right (px 7)]
   [margin-bottom (px 9)]
   [margin-left (px 14)])
  ((desc (and (class nav-catFlyout)) (and (class nav-flyout-content) (class nav-tpl-itemListDeepBrowse)))
   [width (px 168)])
  ((desc (and (class nav-catFlyout)) (and (class nav-flyout-content) (class nav-tpl-itemListDeepBrowse)) (and (class nav-item)))
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 14)]
   [padding-top (px 5)]
   [padding-right (px 8)]
   [padding-bottom (px 5)]
   [padding-left (px 0)])
  ((desc (and (class nav-catFlyout)) (and (class nav-flyout-content) (class nav-tpl-itemListDeepBrowse)) (and (class nav-cat-first)))
   [padding-top (px 0)]
   [padding-right (px 8)]
   [padding-bottom (px 5)]
   [padding-left (px 0)])
  ((desc (and (class nav-catFlyout)) (and (class nav-flyout-content) (class nav-tpl-itemListDeepBrowse)) (and (class nav-divider)))
   [margin-top (px 5)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 14)])
  ((desc (and (class nav-catFlyout)) (and (class nav-flyout-content) (class nav-tpl-itemListDeepBrowse)) (and (class nav-carat)))
   [padding-top (px 10)]
   [padding-right (px 8)]
   [padding-bottom (px 7)]
   [padding-left (px 0)])
  ((desc (and (class nav-catFlyout)) (and (class nav-tpl-flyoutError)))
   [padding-top (px 12)]
   [padding-right (px 14)]
   [padding-bottom (px 7)]
   [padding-left (px 14)])
  ((desc (and (class nav-catFlyout)) (and (class nav-subcats)))
   [position relative]
   [float left]
   [display none]
   [margin-left (px 3)]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(238, 238, 238)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[clear none])
  ((desc (and (class nav-catFlyout)) (and (class nav-subcat)))
   [position relative]
   [display none]
   [padding-top (px 15)]
   [width auto]
   [height (% 100)])
  ((desc (and (class nav-catFlyout)) (and (class nav-subcat)) (and (class nav-item)))
   [left (px 20)]
   [width (px 220)])
  ((desc (and (class nav-catFlyout)) (and (class nav-subcat) (class nav-tpl-itemListDeepBrowse)))
   [width (px 546)])
  ((desc (and (class nav-catFlyout)) (and (class nav-subcat) (class nav-tpl-itemListDeepBrowse)) (and (class nav-item)))
   [left (px 0)]
   [width auto])
  ((desc (and (class nav-catFlyout)) (and (class nav-subcat)) (and (class nav-panel)))
   [width (px 220)]
   [margin-right (px 27)])
  ((desc (and (class nav-catFlyout)) (and (class nav-subcat)) (and (class nav-panel)) (and (class nav-link)))
   [left (px 20)])
  ((desc (and (class nav-catFlyout)) (and (class nav-subcat)) (and (class nav-panel)) (and (class nav-link)) (and (class nav_tag)))
   [display block]
   #;[font-size (px 11)]
   #;[line-height (px 13)]
   #;[font-weight 400]
   #;[color rgb(153, 153, 153)]
   #;[white-space normal])
  ((desc (and (class nav-catFlyout)) (and (class nav-subcat)) (and (class nav-divider)))
   [margin-top (px 0)]
   [margin-right (px 7)]
   [margin-bottom (px 9)]
   [margin-left (px 20)]
   [width (px 220)])
  ((or (desc (and (class nav-catFlyout)) (and (class nav-colcount-0))) (desc (and (class nav-catFlyout)) (and (class nav-colcount-1))))
   [width (px 260)])
  ((desc (and (class nav-catFlyout)) (and (class nav-colcount-2)))
   [width (px 499)])
  ((desc (and (class nav-catFlyout)) (and (class nav-colcount-3)))
   [width (px 720)])
  ((or (and (id nav-flyout-cart)) (and (id nav-flyout-prime)) (and (id nav-flyout-shopAll)) (and (id nav-flyout-wishlist)) (and (id nav-flyout-yourAccount)))
   [margin-top (px -2)])
  ((and (id nav-flyout-transientFlyout))
   [margin-top (px 8)]
   [width auto]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (id nav-flyout-transientFlyout)) (and (class nav-arrow)))
   [margin-left (px -9)])
  ((desc (and (id nav-flyout-shopAll)) (and (class nav-arrow)))
   [margin-left (px -1)])
  ((and (id nav-flyout-timeline))
   [margin-top (px 4)])
  ((desc (and (id nav-flyout-timeline)) (and (class nav-arrow)))
   [margin-left (px 0)])
  ((and (class nav-tooltip-close))
   [width (px 12)]
   [height (px 12)]
   [position absolute]
   [top (px 10)]
   [right (px 10)]
   #;[font-weight 700]
   #;[font-size (px 20)]
   #;[background-position -86px -8px])
  ((and (id nav-flyout-ya-signin))
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(238, 238, 238)]
   #;[font-size (px 11)]
   [margin-bottom (px 8)])
  ((desc (and (id nav-flyout-ya-signin)) (and (class nav_pop_new_cust)))
   #;[color rgb(51, 51, 51)]
   [margin-top (px 7)]
   [margin-right (px 0)]
   [margin-bottom (px 9)]
   [margin-left (px 0)])
  (("#nav-flyout-ya-signin a.nav-a, #nav-flyout-ya-signin a.nav-a:link, #nav-flyout-ya-signin a.nav-a:visited" (or))
   #;[font-size (px 11)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[color rgb(0, 85, 170)]
   [display inline])
  (("#nav-flyout-ya-signin a.nav-a:active, #nav-flyout-ya-signin a.nav-a:hover" (or))
   #;[font-size (px 11)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line underline]
   #;[text-decoration-style solid]
   #;[color rgb(228, 121, 17)]
   [display inline])
  ((or (and (id nav-flyout-wl-alexa)) (and (id nav-flyout-wl-items)))
   [display none]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(238, 238, 238)]
   [margin-bottom (px 8)])
  ((or (desc (and (id nav-flyout-wl-alexa)) (and (class nav-title))) (desc (and (id nav-flyout-wl-items)) (and (class nav-title))))
   [display none])
  ((or (desc (and *) (and (tag html)) (and (id nav-flyout-wl-alexa) (class nav-spinner))) (desc (and *) (and (tag html)) (and (id nav-flyout-wl-items) (class nav-spinner))))
   [height (px 50)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)))
   [margin-top (px 3)])
  ((desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)))
   [left auto])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-column)))
   #;[vertical-align top]
   [padding-top (px 0)]
   [padding-right (px 20)]
   [padding-bottom (px 0)]
   [padding-left (px 20)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-column-first)) (and (class nav-avatar-container)))
   [width (% 100)]
   [height (px 220)]
   [float left]
   [position relative]
   [text-align center])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-column-first)) (and (class nav-avatar-container)) (and (class nav-image)))
   #;[background-color rgb(221, 221, 221)]
   [margin-top (px 40)]
   [margin-right auto]
   [margin-bottom (px 40)]
   [margin-left auto])
  ((or (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-column-first)) (and (class nav-avatar-container)) (and (class nav-avatar-image))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-column-first)) (and (class nav-avatar-container)) (and (class nav-image))))
   [width (px 150)]
   [height (px 150)]
   #;[border-top-left-radius (% 50)]
   #;[border-top-right-radius (% 50)]
   #;[border-bottom-right-radius (% 50)]
   #;[border-bottom-left-radius (% 50)]
   [position relative]
   [display block])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-column-first)) (and (class nav-profile-greeting)))
   [text-align center]
   [position relative]
   [float left]
   [width (% 100)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis]
   #;[white-space nowrap])
  ((or (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-column-first)) (and (class nav-profile-greeting)) (and (class nav-item))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-column-first)) (and (class nav-profile-greeting)) (and (class nav-link))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-column-first)) (and (class nav-profile-greeting)) (and (class nav-text))))
   [display inline]
   #;[line-height (% 120)]
   #;[white-space nowrap])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-flyout-sidePanel-content)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-flyout-sidePanel-content)) (and (class nav-noti-title)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 10)]
   [margin-left (px 0)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-panel)) (and (class nav-divider)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 10)]
   [margin-left (px 0)]
   [height (px 0)]
   #;[background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-flyout-ya-signin)))
   [margin-top (px 10)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [width (% 70)]
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
   #;[border-image-repeat stretch stretch])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-flyout-ya-signin)) (and (class nav-action-button)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-noti-content)) (and (class nav-noti-item)))
   #;[border-top-color rgb(221, 221, 221)]
   #;[border-right-color rgb(221, 221, 221)]
   #;[border-bottom-color rgb(221, 221, 221)]
   #;[border-left-color rgb(221, 221, 221)]
   [width auto])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-flyout-sidePanel)))
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
   [right auto]
   #;[box-shadow none]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [width auto]
   [position relative])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-tpl-notificationsList)) (and (class nav-item)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-tpl-notificationsList)) (and (class nav-item) (class nav-title)))
   [padding-bottom (px 10)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-tpl-notificationsList)) (and (class nav-noti-list-image)))
   [float none]
   [width (px 100)]
   [height (px 100)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-tpl-notificationsList)) (and (class nav-noti-list-heading)))
   #;[font-size (px 15)]
   [padding-top (px 10)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-tpl-notificationsList)) (and (class nav-noti-list-text)))
   [display block]
   #;[font-size (px 13)]
   #;[line-height 1.3]
   #;[font-family arial,sans-serif]
   [padding-top (px 5)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[color rgb(0, 0, 0)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-tpl-notificationsList)) (and (class nav-noti-list-subtext)))
   [display block])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-tpl-notificationsList)) (and (class nav-noti-list-content)))
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-tpl-notificationsList)) (and (class nav-noti-list-x)))
   [top (px 0)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-tpl-discoveryPanelList)) (and (class nav-item)))
   [width auto])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id bia-hcb-widget)) (and (class bia-title)))
   [display none])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id bia-hcb-widget)) (and (class bia-item-image)))
   [text-align center]
   [height (px 65)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id bia-hcb-widget)) (and (class bia-item-image)) (and (tag a)))
   [display block])
  ((or (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id bia-hcb-widget)) (and (class bia-item-image)) (and (tag a))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class csr-hcb-content)) (and (class csr-hcb-image))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-tpl-discoveryPanelList)) (and (class nav-dp-left-column))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-tpl-notificationsList)) (and (class nav-noti-list-image))))
   [position relative]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class csr-hcb-image)))
   [text-align center])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class csr-hcb-image)) (and (tag img)))
   [width auto]
   [height (px 130)])
  (("#navbar.nav-expanded-flyouts #nav-flyout-profile #bia-hcb-widget .bia-item-image a::before, #navbar.nav-expanded-flyouts #nav-flyout-profile .csr-hcb-content .csr-hcb-image::before, #navbar.nav-expanded-flyouts #nav-flyout-profile .nav-tpl-discoveryPanelList .nav-dp-left-column::before, #navbar.nav-expanded-flyouts #nav-flyout-profile .nav-tpl-notificationsList .nav-noti-list-image::before" (or))
   [display block]
   #;[content ""]
   [position absolute]
   [top (px 0)]
   [bottom (px 0)]
   [left (px 0)]
   [right (px 0)]
   #;[pointer-events none])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-flyout-pr-items)) (and (class nav-title)))
   [display none])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-flyout-pr-items)) (and (class nav-panel)))
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(241, 241, 241)]
   [margin-bottom (px 5)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-spinner)))
   #;[min-height (px 40)]
   [margin-bottom (px 20)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-profile-bottom-bia-wrapper)))
   [width (% 100)]
   [float left]
   #;[background-color rgb(241, 241, 241)])
  ((desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-profile-bottom-bia-wrapper)))
   [width (px 1000)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-profile-bottom-bia-wrapper)) (and (class bia-item)))
   [width (% 33)]
   [margin-bottom (px 0)])
  ((desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-profile-bottom-bia-wrapper)) (and (class bia-item)))
   [float left])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-profile-bottom-bia-wrapper)) (and (class bia-item)) (and (class bia-title)))
   [display none])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-profile-bottom-bia-wrapper)) (and (class bia-item)) (and (class bia-item-data)))
   [margin-top (px 15)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-profile-bottom-bia-wrapper)) (and (class bia-item)) (and (class bia-item-data)) (and (class bia-action-button)))
   [margin-top (px 6)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-profile-bottom-bia-wrapper)) (and (class bia-item)) (and (class bia-item-image)))
   [text-align center]
   [margin-right (px 10)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-profile-bottom-bia-wrapper)) (and (class bia-item)) (and (class bia-item-image)) (and (tag a)))
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [position relative]
   [display block])
  (("#navbar.nav-expanded-flyouts #nav-flyout-profile #nav-profile-bottom-bia-wrapper .bia-item .bia-item-image a::before" (or))
   [display block]
   #;[content ""]
   [position absolute]
   [top (px 0)]
   [bottom (px 0)]
   [left (px 0)]
   [right (px 0)]
   #;[background-color rgba(0, 0, 0, 0.06)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-profile-bottom-bia)))
   #;[min-width (px 960)]
   #;[max-width (px 1300)]
   [margin-top (px 5)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [width (px 1300)])
  ((desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-profile-bottom-bia)))
   [width (px 1000)]
   [padding-top (px 5)]
   [padding-right (px 0)]
   [padding-bottom (px 5)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-bia-title-column)))
   [width (% 25)]
   [margin-top (px 30)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-bia-item-column)))
   [width (% 75)]
   #;[border-top-color rgb(255, 255, 255)]
   #;[border-right-color rgb(255, 255, 255)]
   #;[border-bottom-color rgb(255, 255, 255)]
   #;[border-left-color rgb(255, 255, 255)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (id nav-bia-title)) (and (class bia-header)))
   #;[color rgb(68, 68, 68)]
   #;[font-size (px 16)]
   #;[font-weight 700]
   [float right]
   [margin-right (px 30)])
  ((and (id nav-cart-flyout))
   [width (px 240)]
   [padding-top (px 0)]
   [padding-right (px 18)]
   [padding-bottom (px 0)]
   [padding-left (px 18)])
  ((or (desc (and (id nav-cart-flyout)) (and (class nav-ajax-error-msg))) (desc (and (id nav-cart-flyout)) (and (class nav-ajax-message))))
   [display none])
  ((desc (and (id nav-cart-flyout)) (and (class nav-dynamic-empty)))
   [display none])
  ((desc (and (id nav-cart-flyout) (class nav-empty)) (and (class nav-dynamic-empty)))
   [display block])
  ((desc (and *) (and (tag html)) (and (id nav-cart-flyout)) (and (class nav-spinner)))
   [height (px 40)])
  ((desc (and (id nav-cart-flyout) (class nav-empty)) (and (class nav-dynamic-full)))
   [display none])
  ((desc (and (id nav-cart-flyout)) (and (id nav-cart-footer)))
   [width (% 100)]
   [margin-top (px 4)]
   [margin-right (px 0)]
   [margin-bottom (px 14)]
   [margin-left (px 0)]
   [text-align right])
  ((desc (and (id nav-cart-flyout)) (and (id nav-cart-footer)) (and (class nav-action-button)))
   [display inline-block]
   [width (% 100)]
   [height auto]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id nav-cart-flyout)) (and (id nav-cart-footer)) (and (class nav-action-button)) (and (class nav-action-inner)))
   #;[line-height (px 16)]
   [padding-top (px 6)]
   [padding-right (px 10)]
   [padding-bottom (px 8)]
   [padding-left (px 10)])
  ((desc (and (id nav-cart-flyout)) (and (id nav-cart-footer)) (and (class nav-action-button)) (and (id nav-cart-menu-button-count)))
   [padding-top (px 0)]
   [padding-right (px 3)]
   [padding-bottom (px 0)]
   [padding-left (px 3)]
   [display inline-block])
  ((desc (and (id nav-cart-flyout) (class nav-ajax-success)) (and (id nav-cart-menu-button-count)))
   [display inline-block])
  ((desc (and (id nav-cart-flyout) (class nav-cart-dividers)) (and (id nav-cart-footer)))
   [margin-top (px 14)]
   [margin-right (px 0)]
   [margin-bottom (px 14)]
   [margin-left (px 0)])
  ((desc (and (id nav-cart-flyout)) (and (class nav-cart-content)))
   [display none]
   [position relative]
   [width (% 100)]
   [box-sizing border-box]
   #;[font-size (px 13)]
   #;[color rgb(51, 51, 51)])
  ((desc (and (id nav-cart-flyout) (class nav-cart-dividers)) (and (class nav-cart-content)))
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(231, 231, 231)])
  ((or (desc (and (id nav-cart-flyout)) (and (class nav-ajax-error-msg))) (desc (and (id nav-cart-flyout)) (and (class nav-ajax-message))) (desc (and (id nav-cart-flyout)) (and (class nav-dynamic-empty))))
   [margin-top (px 14)]
   [margin-right (px 0)]
   [margin-bottom (px 14)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (id nav-cart-flyout)) (and (class nav-cart-title)))
   [display none]
   [margin-top (px 14)]
   [margin-right (px 8)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[font-weight 700]
   #;[line-height (px 19)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[color rgb(51, 51, 51)])
  ((desc (and (id nav-cart-flyout)) (and (class nav-cart-subtitle)))
   [display none])
  ((desc (and (id nav-cart-flyout)) (and (class nav-cart-subtitle)) (and (class nav-cart-subtitle-item)))
   #;[color rgb(136, 136, 136)]
   #;[font-size (px 12)]
   #;[font-family arial,sans-serif]
   [height (px 19)]
   #;[line-height (px 19)]
   [padding-top (px 0)]
   [padding-right (px 8)]
   [padding-bottom (px 0)]
   [padding-left (px 8)]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(205, 205, 205)])
  ((desc (and (id nav-cart-flyout)) (and (class nav-cart-subtitle)) (and (class nav-firstChild)))
   [padding-left (px 0)]
   [border-left-width (px 0)]
   [border-left-style none]
   #;[border-left-color -moz-use-text-color])
  ((desc (and (id nav-cart-flyout)) (and (class nav-cart-subtitle)) (and (class nav-lastChild)))
   [padding-right (px 0)])
  ((desc (and (id nav-cart-flyout)) (and (class nav-cart-items)))
   [width (% 100)]
   [margin-top (px 14)]
   [margin-right (px 0)]
   [margin-bottom (px 3)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[list-style-type none]
   [overflow-x auto]
   [overflow-y auto])
  ((desc (and (id nav-cart-flyout)) (and (class nav-cart-items)) (and (class nav-cart-item)))
   [float left]
   [width (% 100)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 10)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[list-style-type none])
  ((desc (and (id nav-cart-flyout)) (and (class nav-cart-items)) (and (class nav-cart-item)) (and (class nav-cart-item-link)))
   [position relative]
   [display block]
   #;[min-height (px 40)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 50)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[line-height (px 13)]
   [box-sizing border-box]
   #;[font-size (px 12)]
   #;[font-family arial,sans-serif]
   #;[color rgb(136, 136, 136)])
  ((desc (and (id nav-cart-flyout)) (and (class nav-cart-items)) (and (class nav-cart-item)) (and (class nav-cart-item-image)))
   [position absolute]
   [left (px 0)]
   [top (px 0)]
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
   [width (px 40)]
   [height (px 40)])
  ((or (desc (and (id nav-cart-flyout)) (and (class nav-cart-items)) (and (class nav-cart-item)) (and (class nav-cart-item-buyingPrice))) (desc (and (id nav-cart-flyout)) (and (class nav-cart-items)) (and (class nav-cart-item)) (and (class nav-cart-item-quantity))) (desc (and (id nav-cart-flyout)) (and (class nav-cart-items)) (and (class nav-cart-item)) (and (class nav-cart-item-title))) (desc (and (id nav-cart-flyout)) (and (class nav-cart-items)) (and (class nav-cart-item)) (and (class nav-cart-item-weight))) (desc (and (id nav-cart-flyout)) (and (class nav-cart-items)) (and (class nav-cart-item)) (and (class nav-cart-scarcity))) (desc (and (id nav-cart-flyout)) (and (class nav-cart-items)) (and (class nav-cart-item)) (and (class nav-cart-scarcity-nostock))))
   [display block]
   #;[line-height (px 14)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[color rgb(136, 136, 136)])
  ((desc (and (id nav-cart-flyout)) (and (class nav-cart-items)) (and (class nav-cart-item)) (and (class nav-cart-item-title)))
   #;[color rgb(0, 102, 192)]
   [width (px 152)])
  ((desc (and (id nav-cart-flyout)) (and (class nav-cart-items)) (and (class nav-cart-item-break)))
   [display block]
   #;[line-height (px 0)]
   [height (px 0)]
   [width (% 100)]
   #;[clear both])
  ((and (id nav-cart-flyout) (class nav-cart-double))
   [width (px 480)])
  ((desc (and (id nav-cart-flyout) (class nav-cart-double)) (and (class nav-cart-items)) (and (class nav-cart-item)))
   [float left]
   [width (% 50)])
  ((desc (and (id nav-cart-flyout) (class nav-cart-double)) (and (id nav-cart-footer)) (and (class nav-action-button)))
   [width (% 50)])
  ((desc (and (id nav-cart-flyout) (class nav-cart-double)) (and (class nav-cart-subtitle)) (and (class nav-firstChild)))
   [padding-left (px 8)]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(205, 205, 205)])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)))
   [width (px 220)]
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
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[line-height 1em]
   [position fixed]
   [top (px 0)]
   [height (% 100)]
   #;[z-index 1]
   [display block]
   [right (px -220)])
  ((desc (and *) (and (tag html)) (and (id navbar)) (and (id nav-flyout-ewc)))
   [position absolute])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-flyout-head)))
   #;[background-position (px 0)]
   [position relative]
   #;[background-color rgb(255, 255, 255)]
   [height (px 99)]
   [text-align center]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(35, 47, 62)]
   [padding-top (px 47)])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-flyout-body)))
   [position relative]
   #;[background-color rgb(255, 255, 255)]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(202, 202, 202)]
   [height (% 100)])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-flyout-body) (class nav-ewc-unpinbody)))
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(34, 47, 63)])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-flyout-tail)))
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [width (px 8)]
   [height (% 100)]
   #;[background-color orange]
   #;[z-index -1])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-ewc-pin-tail)))
   [display none]
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [width (px 10)]
   [height (% 100)]
   #;[background-color rgb(35, 47, 62)]
   #;[z-index -1])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-ewc-pin-tail)) (and (class nav-ewc-pin-button)))
   [position absolute]
   [left (px -20)]
   [width (px 22)]
   [height (px 40)]
   #;[background-color rgb(35, 47, 62)]
   #;[border-top-left-radius (px 2)]
   #;[border-top-right-radius (px 2)]
   #;[border-bottom-right-radius (px 2)]
   #;[border-bottom-left-radius (px 2)])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-ewc-pin-tail)) (and (class nav-ewc-pin-arrow)))
   [position absolute]
   [left (px 9)]
   [top (px 15)]
   #;[background-color rgb(35, 47, 62)])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-ewc-pin-tail) (class nav-ewc-pin)))
   [left (px -10)])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-ewc-pin-tail) (class nav-ewc-pin)) (and (class nav-ewc-pin-arrow)))
   [border-top-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 5)]
   [border-bottom-width (px 5)]
   #;[border-top-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   [border-right-width (px 5)]
   [border-right-style solid]
   #;[border-right-color rgb(168, 172, 178)]
   [border-left-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-ewc-pin-tail) (class nav-ewc-pin)) (and (class nav-ewc-pin-ttc-open)))
   [display block])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-ewc-pin-tail) (class nav-ewc-unpin)) (and (class nav-ewc-pin-arrow)))
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-top-width (px 5)]
   [border-bottom-width (px 5)]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   [border-right-width (px 0)]
   [border-left-width (px 5)]
   [border-left-style solid]
   #;[border-left-color rgb(168, 172, 178)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-ewc-pin-tail) (class nav-ewc-unpin)) (and (class nav-ewc-pin-ttc-close)))
   [display block])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-ewc-pin-tt)))
   [position absolute]
   [left (px -125)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[background-color rgb(68, 76, 85)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(47, 53, 59)]
   #;[border-right-color rgb(47, 53, 59)]
   #;[border-bottom-color rgb(47, 53, 59)]
   #;[border-left-color rgb(47, 53, 59)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[color rgb(255, 255, 255)]
   #;[font-size (px 13)]
   [padding-top (px 8)]
   [padding-right (px 10)]
   [padding-bottom (px 8)]
   [padding-left (px 10)]
   [width (px 95)]
   [text-align center]
   [display none])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-ewc-pin-tt)) (and (class nav-ewc-pin-tt-arrow)))
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-top-width (px 7)]
   [border-bottom-width (px 7)]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   [border-right-width (px 0)]
   [border-left-width (px 7)]
   [border-left-style solid]
   #;[border-left-color rgb(47, 53, 59)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   [position absolute]
   [right (px -7)]
   [top (px 7)])
  ((or (desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-ewc-pin-ttc-close))) (desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-ewc-pin-ttc-open))))
   [display none])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-cart)))
   [float none]
   [margin-top (px 5)])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-cart)) (and (class nav-line-2)) (and (class nav-icon)))
   [display none])
  (("#navbar #nav-flyout-ewc .nav-cart:focus, #navbar #nav-flyout-ewc .nav-cart:hover" (or))
   [top (px 1)]
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
   #;[box-shadow none])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc) (class nav-click-ewc)) (and (class nav-flyout-head)))
   [height (px 99)]
   [padding-top (px 8)])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc) (class nav-click-ewc)) (and (class nav-ewc-links)))
   [height (px 39)]
   [padding-top (px 5)]
   [margin-bottom (px 2)]
   [text-align right])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc) (class nav-click-ewc)) (and (class nav-ewc-links)) (and (tag a)))
   #;[color rgb(255, 255, 255)]
   #;[font-weight 700]
   [padding-right (px 12)]
   [margin-right (px 8)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [position relative])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc) (class nav-click-ewc)) (and (class nav-ewc-links)) (and (class nav-ewc-close-link)))
   [float left]
   [margin-left (px 8)])
  ((desc (and (id navbar)) (and (id nav-flyout-ewc) (class nav-click-ewc)) (and (class nav-ewc-links)) (and (class nav-arrow)))
   #;[background-position -110px -360px]
   [width (px 6)]
   [height (px 8)]
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
   [top (px 4)]
   [right (px 0)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)))
   [padding-right (px 212)])
  ((desc (and (class nav-ewc-persistent-hover) (class a-js)) (and (tag body)))
   [padding-right (px 220)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id nav-tools)))
   [padding-right (px 0)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id navbar)) (and (id nav-cart)))
   [width (px 220)]
   [padding-left (px 75)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id navbar)) (and (id nav-cart)) (and (class nav-cart-icon)))
   [left (px 75)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id navbar)) (and (id nav-cart)) (and (class nav-cart-count)))
   [left (px 88)])
  ((".nav-ewc-persistent-hover body #navbar #nav-cart:focus, .nav-ewc-persistent-hover body #navbar #nav-cart:hover" (or))
   [top (px 1)]
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
   #;[box-shadow none]
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 0)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id navbar) (class nav-pinned)) (and (id nav-main)))
   [right (px 0)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (class nav-divider)))
   [display none])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id navbar) (class nav-pinned)) (and (id nav-search)))
   [right (px 342)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id navbar)) (and (id nav-flyout-ewc)) (and (class nav-ewc-close-link)))
   [display none])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id miniATFUDP)))
   [margin-right (px 220)]
   [width auto])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (class pantry-shelf-outer)) (and (class pantry-shelf-header)))
   [width auto]
   [left (px 0)]
   [right (px 220)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (class airstream-header-container)) (and (class airstream-pin-to-top)))
   [right (px 220)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id navbar)))
   [margin-right (px -220)])
  ((or (desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id navbar)) (and (id nav-main))) (desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id navbar)) (and (class nav-main))))
   [width auto])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id navbar)) (and (class nav-fullWidthSubnavFlyout)))
   [margin-right (px 220)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id nav-subnav)))
   [margin-right (px 220)])
  ((or (desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id nav-upnav))) (desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id nav-upnav-airy))) (desc (and (class nav-ewc-persistent-hover) (class a-js)) (and (tag body)) (and (id nav-upnav))) (desc (and (class nav-ewc-persistent-hover) (class a-js)) (and (tag body)) (and (id nav-upnav-airy))))
   [margin-right (px -220)])
  ((".nav-ewc-persistent-hover body .MusicCartBar[style~=\"fixed;\"]" (or))
   [right (px 220)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (class MusicCartBarFullCSS)))
   [left auto]
   [right (px 220)])
  ((or (desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (class aiv-container-flex))) (desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (class aiv-container-limited))))
   [width (px 1320)]
   [padding-right (px 220)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id dv-product-details)) (and (id rhf)))
   [width (px 1320)]
   [padding-right (px 220)])
  ((child (desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id dv-product-details)) (and (tag body))) (and (tag center)))
   [width (px 1320)]
   [padding-right (px 220)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (class dp-main-meta)))
   [width (px 760)]
   [padding-right (px 220)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (class episode-list)) (and (tag li)) (and (tag p)))
   [width (px 990)]
   [padding-right (px 220)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (class aiv-container-limited)))
   [width (px 1480)]
   [padding-right (px 220)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (class aiv-container-flex)))
   [width (px 1640)]
   [padding-right (px 220)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (class dp-main-meta)))
   [width (px 780)]
   [padding-right (px 220)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (class episode-list)) (and (tag li)) (and (tag p)))
   [width (px 990)]
   [padding-right (px 220)])
  ((desc (and (class nav-ewc-persistent-hover)) (and (tag body)) (and (id sf-home)) (and (id panel1b)))
   [right (px 230)])
  ((and (id nav_browse_flyout))
   [position relative]
   [overflow-x visible]
   [overflow-y visible]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (id nav_browse_flyout)) (and (id nav_cats)))
   [padding-top (px 14)]
   [padding-right (px 0)]
   [padding-bottom (px 8)]
   [padding-left (px 0)]
   [position relative]
   [width (px 240)])
  ((desc (and (id nav_browse_flyout)) (and (id nav_cats)) (and (tag a) (class nav_a)))
   [display inline])
  ((desc (and (id nav_browse_flyout)) (and (id nav_cats)) (and (class nav_pop_li)))
   #;[white-space nowrap]
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 14)]
   #;[text-overflow ellipsis]
   [text-align left])
  ((desc (and (id nav_browse_flyout)) (and (id nav_subcats_wrap)))
   [display none]
   [position absolute]
   [top (px 0)]
   [left (px 241)]
   [height (% 100)]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(238, 238, 238)])
  ((desc (and (id nav_browse_flyout)) (and (id nav_subcats_wrap)) (and (class nav_browse_subcat)))
   [display none]
   [position relative]
   [top (px 0)]
   [left (px 0)]
   [height (% 100)]
   [width (px 260)])
  ((desc (and (id nav_browse_flyout)) (and (id nav_subcats_wrap)) (and (class nav_super_cat)))
   [width (px 500)])
  ((desc (and (id nav_browse_flyout)) (and (id nav_subcats_wrap)) (and (class nav_browse_cat_head)))
   #;[color rgb(228, 121, 17)]
   #;[font-size (px 18)]
   [overflow-x visible]
   [overflow-y visible]
   [padding-bottom (px 10)]
   #;[white-space normal])
  ((or (desc (and (id nav_browse_flyout)) (and (id nav_subcats_wrap)) (and (tag ul) (class nav_browse_cat2_ul))) (desc (and (id nav_browse_flyout)) (and (id nav_subcats_wrap)) (and (tag ul) (class nav_browse_cat_ul))))
   [width (px 220)]
   [padding-top (px 15)]
   [position absolute]
   [overflow-x visible]
   [overflow-y visible])
  ((desc (and (id nav_browse_flyout)) (and (id nav_subcats_wrap)) (and (tag ul) (class nav_browse_cat_ul)))
   [left (px 20)])
  ((desc (and (id nav_browse_flyout)) (and (id nav_subcats_wrap)) (and (tag ul) (class nav_browse_cat2_ul)))
   [left (px 255)])
  ((and (id nav-flyout-prime))
   [box-sizing content-box])
  ((desc (and (id nav-flyout-prime)) (and (class nav-flyout-content)))
   [box-sizing content-box]
   [width auto]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[min-width (px 200)])
  ((and (id nav-flyout-primeTooltip))
   [padding-top (px 3)]
   [padding-right (px 0)]
   [padding-bottom (px 3)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 10)]
   #;[max-width (px 705)]
   [top (px -38)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[z-index 300]
   [width (px 705)])
  ((desc (and (id nav-flyout-primeTooltip)) (and (class nav-arrow)))
   [position absolute]
   [left (px -9)]
   [top (px 23)]
   [border-top-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 9)]
   [border-bottom-width (px 9)]
   #;[border-top-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   [border-right-width (px 9)]
   [border-right-style solid]
   #;[border-right-color rgb(187, 187, 187)]
   [border-left-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)])
  ((desc (and (id nav-flyout-primeTooltip)) (and (class nav-arrow)) (and (class nav-arrow-inner)))
   [position absolute]
   [left (px 1)]
   [top (px -9)]
   [border-top-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 9)]
   [border-bottom-width (px 9)]
   #;[border-top-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   [border-right-width (px 9)]
   [border-right-style solid]
   #;[border-right-color rgb(255, 255, 255)]
   [border-left-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)])
  ((and (class nav-prime-tt))
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   [margin-top (px -3)])
  ((desc (and *) (and (tag html)) (and (class nav-signin-tt)))
   [width (px 165)])
  ((desc (and (class nav-signin-tt)) (and (class nav-arrow)))
   [left (% 50)]
   [margin-left (px -9)])
  ((and (id nav-signin-tooltip))
   [text-align center])
  ((desc (and (id nav-signin-tooltip)) (and (class nav-signin-tooltip-footer)))
   [padding-top (px 10)]
   #;[color rgb(51, 51, 51)]
   #;[font-size (px 11)])
  ((desc (and (id nav-signin-tooltip)) (and (class nav-signin-tooltip-footer)) (and (class nav-a)))
   #;[color rgb(0, 85, 170)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [padding-left (px 3)])
  ((and (class csr-tooltip-nav))
   [margin-top (px -3)])
  ((and (class nav-noti-content))
   [position relative]
   [top (px 0)]
   #;[font-family arial,sans-serif]
   #;[font-size (px 12)]
   [height (% 100)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[color rgb(68, 68, 68)])
  ((and (class nav-noti-title))
   #;[font-size (px 16)]
   #;[font-weight 700]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 9)]
   [margin-left (px 0)])
  ((and (class nav-noti-item))
   [display block]
   [position relative]
   [padding-top (px 10)]
   [padding-right (px 14)]
   [padding-bottom (px 9)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[line-height (px 17)]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(204, 204, 204)]
   #;[color rgb(68, 68, 68)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color])
  ((and (id nav-noti-empty))
   [display none]
   #;[color rgb(153, 153, 153)])
  ((and (class nav-noti-x))
   [position absolute]
   [top (px 9)]
   [right (px -1)]
   #;[font-family arial,sans-serif]
   #;[font-size (px 20)]
   #;[color rgb(187, 187, 187)]
   #;[background-color rgb(255, 255, 255)]
   #;[cursor pointer]
   [display none])
  ((or (desc (and (class nav-noti-hover)) (and (class nav-noti-x))) (desc (and (class nav-noti-touch)) (and (class nav-noti-x))))
   [display block])
  ((and (id nav-noti-all))
   [position absolute]
   [width (% 100)]
   [bottom (px 0)]
   [left (px 0)]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(204, 204, 204)]
   #;[background-color rgb(255, 255, 255)])
  ((desc (and (id nav-noti-all)) (and (class nav_a)))
   [display block]
   [padding-top (px 10)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (class nav-noti-link))
   [display block])
  ((and (id nav-platinum))
   [position relative]
   [height (px 64)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class nav-platinum-subnav))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [text-align center])
  ((desc (and (class nav-platinum-subnav)) (and (class nav-subnav-item)))
   [display inline]
   #;[list-style-type none]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [border-left-width (px 1)]
   [border-left-style solid])
  ((or (desc (and (class nav-platinum-subnav)) (and (tag a) (class nav-platinum-logo))) (desc (and (class nav-platinum-subnav)) (and (tag li) (class nav-first))) (desc (and (class nav-platinum-subnav)) (and (tag li) (class nav-platinum-logo))))
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
   #;[border-image-repeat stretch stretch])
  ((desc (and (id nav-platinum) (class nav-platinum-fix)) (and (class nav-platinum-subnav)) (and (tag a) (class nav-platinum-logo)))
   [height (px 64)]
   #;[background-color transparent]
   #;[background-image none]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position center center]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [display inline-block])
  ((or (and (id nav-timeline-tooltip-wrapper)) (and (id nav-timeline-wrapper)))
   [display none])
  ((and (id nav-timeline))
   [position relative]
   #;[color rgb(85, 85, 85)]
   [float left]
   [width (% 100)]
   #;[max-height (px 265)])
  ((desc (and *) (and (tag html)) (and (id nav-timeline)))
   [height (px 265)])
  ((and (id nav-recently-viewed))
   [margin-bottom (px 20)]
   [height (px 17)])
  ((or (and (id nav-timeline-data)) (and (id nav-timeline-error-content)))
   [padding-top (px 35)]
   [padding-right (px 0)]
   [padding-bottom (px 30)]
   [padding-left (px 0)]
   [top (px 15)]
   [position relative]
   [float left]
   [text-align center])
  ((or (and (id nav-timeline-data) (class nav-center)) (and (id nav-timeline-error-content)))
   [float none])
  ((or (and (id nav-timeline-error)) (and (id nav-timeline-error-content)) (and (class nav-timeline-large-text)))
   #;[font-family arial,sans-serif]
   [margin-bottom (px 42)])
  ((or (desc (and (id nav-timeline-error)) (and (class nav-line-1))) (desc (and (id nav-timeline-error)) (and (class nav-title))) (desc (and (id nav-timeline-error-content)) (and (class nav-line-1))) (desc (and (id nav-timeline-error-content)) (and (class nav-title))) (desc (and (class nav-timeline-large-text)) (and (class nav-line-1))) (desc (and (class nav-timeline-large-text)) (and (class nav-title))))
   #;[font-weight 500]
   #;[font-size (px 24)]
   [display block]
   #;[color rgb(68, 68, 68)])
  ((or (desc (and (id nav-timeline-error)) (and (class nav-line-2))) (desc (and (id nav-timeline-error)) (and (class nav-paragraph))) (desc (and (id nav-timeline-error-content)) (and (class nav-line-2))) (desc (and (id nav-timeline-error-content)) (and (class nav-paragraph))) (desc (and (class nav-timeline-large-text)) (and (class nav-line-2))) (desc (and (class nav-timeline-large-text)) (and (class nav-paragraph))))
   #;[font-size (px 14)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[color rgb(118, 118, 118)]
   #;[white-space normal])
  ((or (desc (and (id nav-timeline-error)) (and (class nav-access-image))) (desc (and (id nav-timeline-error-content)) (and (class nav-access-image))) (desc (and (class nav-timeline-large-text)) (and (class nav-access-image))))
   #;[background-position (px 0)]
   [display block]
   [float left]
   [width (px 140)]
   [height (px 42)])
  ((and (id nav-timeline-history))
   [margin-top (px 40)]
   [margin-right (px 0)]
   [margin-bottom (px 50)]
   [margin-left (px 0)])
  ((desc (and (id nav-timeline-history)) (and (class nav-line-2)))
   [width (px 160)]
   [float left])
  ((and (class nav-timeline-item))
   [float left]
   [position relative]
   [width (px 165)]
   #;[direction ltr])
  ((and (class nav-history-box))
   [width auto]
   [text-align left]
   [margin-top (px 0)]
   [margin-right (px 20)]
   [margin-bottom (px 0)]
   [margin-left (px 20)])
  ((and (class nav-timeline-img-holder))
   [width (px 125)]
   [height (px 125)]
   [margin-top (px 0)]
   [margin-right (px 20)]
   [margin-bottom (px 25)]
   [margin-left (px 20)]
   #;[background-color rgb(221, 221, 221)])
  ((and (class nav-timeline-img))
   [height (px 125)]
   [width (px 125)]
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [display block]
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
   #;[border-image-repeat stretch stretch])
  ((and (class nav-timeline-title))
   [text-align center]
   [top (px 0)]
   [margin-top (px 0)]
   [margin-right (px 19)]
   [margin-bottom (px 0)]
   [margin-left (px 19)]
   [width (px 128)]
   [height (px 150)]
   #;[background-position (px 0)])
  ((desc (and (class nav-timeline-title)) (and (class nav-line-1)))
   [display block])
  ((and (class nav-timeline-search-term))
   [display block]
   #;[font-size (px 14)]
   [padding-top (px 3)]
   [padding-right (px 5)]
   [padding-bottom (px 0)]
   [padding-left (px 5)]
   #;[white-space normal]
   #;[word-wrap break-word]
   #;[color rgb(17, 17, 17)])
  ((and (class nav-timeline-text))
   [margin-top (px 48)]
   #;[font-size (px 12)]
   #;[color rgb(153, 153, 153)]
   #;[font-family arial,sans-serif]
   [position absolute]
   [width (px 125)])
  ((desc (and *) (and (tag html)) (and (class nav-timeline-text)))
   [left (px 20)])
  ((or (and (class nav-item-no-image)) (and (class nav-item-status)))
   #;[color rgb(255, 255, 255)]
   #;[background-color rgb(68, 68, 68)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   [width (px 125)]
   [position absolute]
   [padding-top (px 5)]
   [padding-right (px 0)]
   [padding-bottom (px 5)]
   [padding-left (px 0)]
   [top (px 45)]
   [left (px 20)]
   #;[font-size (px 14)]
   #;[font-family arial,sans-serif]
   #;[font-weight 600]
   [height (px 32)]
   #;[opacity 0.95])
  ((and (class nav-item-no-image))
   [height (px 125)]
   [top (px 0)]
   [padding-top (px 50)]
   #;[background-color rgb(221, 221, 221)])
  ((and (class nav-checkmark))
   [width (px 30)]
   [height (px 19)]
   [display inline-block]
   #;[background-position -50px -4px])
  ((and (class nav-status-text))
   [position relative]
   [top (px -3)]
   [right (px 2)]
   #;[line-height (px 20)])
  ((and (class nav-status-date))
   [display block]
   #;[font-size (px 10)]
   [margin-top (px -6)]
   #;[font-weight 400]
   #;[color rgb(204, 204, 204)]
   #;[line-height (px 10)])
  ((and (id nav-timeline-view-history))
   #;[background-color rgb(254, 189, 105)]
   #;[color rgb(51, 51, 51)]
   #;[font-size (px 14)]
   [height (px 125)]
   #;[border-top-left-radius (% 50)]
   #;[border-top-right-radius (% 50)]
   #;[border-bottom-right-radius (% 50)]
   #;[border-bottom-left-radius (% 50)]
   [padding-top (px 48)])
  ((and (class nav-timeline-decorator))
   [position relative]
   [height (px 10)])
  ((and (class nav-timeline-dot))
   [width (px 10)]
   [height (px 10)]
   #;[border-top-left-radius (% 50)]
   #;[border-top-right-radius (% 50)]
   #;[border-bottom-right-radius (% 50)]
   #;[border-bottom-left-radius (% 50)]
   #;[background-color rgb(255, 154, 1)]
   [position absolute]
   [left (px 76)])
  ((desc (and *) (and (tag html)) (and (class nav-timeline-dot)))
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class nav-timeline-line))
   [border-top-width (px 10)]
   [border-top-style solid]
   #;[border-top-color rgb(243, 243, 243)]
   [float left]
   [width (% 100)])
  ((desc (and *) (and (tag html)) (and (class nav-timeline-line)))
   [margin-left (px 3)]
   [position absolute])
  ((and (class nav-edge))
   [width (% 50)])
  ((desc (and *) (and (tag html)) (and (class nav-edge)))
   [width (px 0)])
  ((and (class nav-start))
   [float right])
  ((desc (and *) (and (tag html)) (and (class nav-start)))
   [width (px 165)])
  ((and (class nav-timeline-date))
   [text-align center]
   [margin-top (px 10)]
   #;[font-size (px 12)]
   #;[color rgb(85, 85, 85)]
   #;[font-family arial,sans-serif])
  ((and (id nav-timeline-recent-products))
   [float left]
   [padding-left (px 25)])
  ((desc (and (id nav-timeline-recent-products)) (and (class nav-a)))
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[color rgb(0, 85, 170)]
   [padding-left (px 10)])
  ((and (class nav-timeline-tt))
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   [margin-left (px 51)]
   #;[cursor pointer])
  ((desc (and *) (and (tag html)) (and (class nav-timeline-tt)))
   [width (px 300)])
  ((desc (and (class nav-timeline-tt)) (and (class nav-arrow)))
   [left (% 50)]
   [margin-left (px -14)])
  ((desc (and (class nav-timeline-tt)) (and (id nav-timeline-recent-products)))
   [float none]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 15)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 5)]
   [margin-bottom (px 0)]
   [margin-left (px 5)])
  ((desc (and (class nav-timeline-tt)) (and (class nav-item-status)))
   [text-align center])
  ((or (desc (and (class nav-timeline-tt)) (and (class nav-item-no-image))) (desc (and (class nav-timeline-tt)) (and (class nav-timeline-img))) (desc (and (class nav-timeline-tt)) (and (class nav-timeline-img-holder))) (desc (and (class nav-timeline-tt)) (and (class nav-timeline-item))) (desc (and (class nav-timeline-tt)) (and (class nav-timeline-title))))
   [width (px 90)]
   [height (px 90)])
  ((desc (and (class nav-timeline-tt)) (and (class nav-timeline-item)))
   [margin-top (px 0)]
   [margin-right (px 5)]
   [margin-bottom (px 0)]
   [margin-left (px 5)])
  ((desc (and (class nav-timeline-tt)) (and (class nav-timeline-img-holder)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class nav-timeline-tt)) (and (class nav-timeline-title)))
   #;[background-color rgb(244, 244, 244)]
   [text-align center]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class nav-timeline-tt)) (and (class nav-timeline-text)))
   [margin-top (px 30)]
   [width (px 90)])
  ((desc (and (class nav-timeline-tt)) (and (class nav-timeline-search-term)))
   [padding-top (px 3)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class nav-timeline-tt)) (and (class nav-item-no-image)))
   [padding-top (px 35)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 3)]
   [top (px 0)])
  ((and (id nav-upnav))
   [margin-top (px 0)]
   [margin-right (px -8)]
   [margin-bottom (px 0)]
   [margin-left (px -8)])
  ((or (desc (and (tag html) (class a-js)) (and (tag body)) (and (id nav-upnav))) (desc (and (tag html) (class a-no-js)) (and (tag body)) (and (id nav-upnav))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id nav-upnav)) (and (class nav-a)))
   [display block]
   [width (% 100)]
   [height (% 100)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color])
  ((desc (and (id nav-upnav)) (and (class nav-spanAltText)))
   [height (px 1)]
   [width (px 1)]
   [position absolute]
   [top (px -10000)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (id nav-upnav-airy))
   [margin-top (px 0)]
   [margin-right (px -8)]
   [margin-bottom (px 0)]
   [margin-left (px -8)]
   #;[min-width (px 1000)])
  ((or (desc (and (tag html) (class a-js)) (and (tag body)) (and (id nav-upnav-airy))) (desc (and (tag html) (class a-no-js)) (and (tag body)) (and (id nav-upnav-airy))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (id nav-upnav-airy)) (and (class nav-airy-widget-wrapper)))
   [margin-bottom (px 0)]
   [width (% 100)]
   [overflow-x hidden])
  ((desc (and (id nav-upnav-airy)) (and (id nav-airy-click-through-stage)))
   #;[z-index 100]
   #;[cursor pointer]
   [position absolute]
   [width (% 100)]
   [height (% 100)]
   [top (px 0)]
   [left (px 0)])
  ((desc (and (id nav-upnav-airy)) (and (id nav-airy-player-container)))
   [position relative]
   [width (% 100)]
   [height (% 100)]
   [overflow-x hidden]
   [overflow-y hidden]
   [top (px 0)]
   [left (px 0)])
  ((desc (and (id nav-upnav-airy)) (and (class nav-airy-slate-image)))
   [position absolute]
   [width (% 100)]
   [height (% 100)]
   [top (px 0)]
   [left (px 0)])
  ((and (class nav-carousel-container))
   [width (% 100)]
   #;[white-space nowrap]
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [float left])
  ((and (class nav-carousel-swipe))
   [overflow-y hidden]
   [overflow-x scroll])
  ((and (class nav-feed-carousel-control))
   [position absolute]
   [top (px 55)]
   #;[background-color rgb(255, 255, 255)]
   [height (px 100)]
   #;[line-height (px 100)]
   [width (px 45)]
   [text-align center]
   #;[box-shadow (px 0)]
   [display none]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(200, 200, 200)]
   #;[border-right-color rgb(200, 200, 200)]
   #;[border-bottom-color rgb(200, 200, 200)]
   #;[border-left-color rgb(200, 200, 200)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[z-index 2])
  ((and (class nav-feed-left))
   [left (px 0)]
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 0)]
   #;[clip rect(-10px, 55px, 110px, 0px)]
   [padding-right (px 5)])
  ((and (class nav-feed-right))
   [right (px 0)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 3)]
   #;[clip rect(-10px, 45px, 110px, -10px)]
   [padding-left (px 5)])
  ((and (class nav-feed-control-disabled))
   #;[opacity (px 0)]
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
   #;[background-color transparent]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color])
  ((and (class nav-control-hidden))
   [width (px 60)]
   [height (px 200)]
   [position absolute]
   #;[z-index 1]
   [left (px 0)])
  ((and (class nav-control-hidden-right))
   [left auto]
   [right (px 0)])
  ((and (class nav-feed-arrow))
   #;[line-height normal]
   #;[vertical-align top]
   [position relative]
   [top (% 50)]
   [height (px 34)]
   [width (px 20)]
   [margin-top (px -14)]
   [display inline-block]
   #;[cursor pointer])
  ((and (class nav-asin-subnav-flyout-wrapper))
   [height (px 195)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class nav-asin-subnav-flyout))
   [float left]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (class nav-asin-subnav-flyout-itemgroup))
   #;[list-style-type none]
   [overflow-x hidden]
   [overflow-y hidden]
   [float left]
   [padding-left (px 5)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (tag li) (class nav-asin-subnav-flyout-item))
   [float left]
   [margin-top (px 0)]
   [margin-right (px 5)]
   [margin-bottom (px 0)]
   [margin-left (px 5)]
   #;[list-style-type none]
   [padding-top (px 10)]
   [padding-right (px 0)]
   [padding-bottom (px 10)]
   [padding-left (px 0)]
   [height (% 100)])
  (("li.nav-asin-subnav-flyout-item:focus, li.nav-asin-subnav-flyout-item:hover" (or))
   #;[border-bottom-color rgb(228, 121, 17)]
   [border-bottom-style solid])
  ((and (class nav-asin-subnav-flyout-image))
   [display block]
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 10)]
   [margin-left auto])
  ((and (class nav-asin-subnav-flyout-link))
   [width (px 150)]
   #;[max-width (px 150)]
   [text-align center]
   #;[font-family arial,sans-serif]
   #;[font-style normal]
   #;[font-weight normal]
   #;[font-size (px 12)]
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
   [display block])
  ((and (class nav-asin-subnav-flyout-title-section))
   #;[max-height (px 60)]
   [text-align center]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [display block]
   #;[white-space normal]
   #;[font-family arial,sans-serif]
   #;[font-style normal]
   #;[font-size (px 13)]
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
   #;[font-weight 700]
   #;[cursor pointer])
  ((and (class nav-asin-subnav-item-title))
   [display block])
  ((and (class nav-asin-subnav-divider))
   [display inline]
   [float left]
   [width (px 1)]
   [height (px 160)]
   [margin-top (px 0)]
   [margin-right (px 45)]
   [margin-bottom (px 0)]
   [margin-left (px 50)]
   #;[background-color rgb(240, 240, 240)]
   #;[font-size (px 0)])
  ((and (class nav-asin-subnav-flyout-promo-group))
   [float left]
   [width (px 386)]
   [padding-top (px 20)]
   [padding-right (px 0)]
   [padding-bottom (px 20)]
   [padding-left (px 0)])
  ((and (class nav-asin-subnav-flyout-promo))
   [float left])
  ((desc (and (id navbar)) (and (id nav-search-submit-text)))
   [left (px 12)]
   #;[color rgb(17, 17, 17)]
   [top (px 11)]
   #;[text-shadow none])
  ((desc (and (id navbar)) (and (id nav-search-submit-text) (class nav-sprite)))
   #;[background-position -40px -290px]
   [width (px 21)]
   [height (px 21)]
   #;[text-indent (px -500)]
   [top (px 7)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-logo)))
   [width (px 192)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-logo) (class nav-paladin)))
   [width (px 188)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-search-label)))
   [top (px 1)]
   #;[font-weight 400])
  ((desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-logo-borderfade)) (and (class nav-fade)))
   [display none])
  ((desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-logo-borderfade)) (and (class nav-fade-mask)))
   #;[background-color rgb(35, 47, 62)]
   [width (px 195)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-cart-count)))
   #;[color rgb(240, 136, 4)]
   [top (px 7)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-search)) (and (class nav-search-facade)))
   [top (px 1)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-search)) (and (class nav-fill)))
   [height (px 35)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-search)) (and (class nav-search-scope)))
   #;[background-color rgb(243, 243, 243)]
   #;[background-image none]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(243, 243, 243)]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(243, 243, 243)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(243, 243, 243)])
  ((or (desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-search)) (and (class nav-searchbar) (class nav-active)) (and (class nav-search-field))) (desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-search)) (and (class nav-searchbar) (class nav-active)) (and (class nav-search-scope))) (desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-search)) (and (class nav-searchbar) (class nav-focus)) (and (class nav-search-field))) (desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-search)) (and (class nav-searchbar) (class nav-focus)) (and (class nav-search-scope))))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(254, 189, 105)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(254, 189, 105)])
  ((or (desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-search)) (and (class nav-searchbar) (class nav-active)) (and (class nav-search-scope))) (desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-search)) (and (class nav-searchbar) (class nav-focus)) (and (class nav-search-scope))))
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(254, 189, 105)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-search)) (and (class nav-search-field)))
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
   #;[border-image-repeat stretch stretch])
  ((desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-search)) (and (class nav-search-submit)))
   #;[background-color rgb(254, 189, 105)]
   #;[background-image none]
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
   [width (px 45)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (and (id nav-search)) (and (id nav-search-submit-text) (class nav-sprite)))
   #;[background-position -10px -290px]
   [width (px 21)]
   [height (px 21)])
  ((desc (and (id navbar) (class nav-bluebeacon)) (and (class nav-cobrand)))
   [right (px 12)]
   [width (px 36)])
  ((desc (and (class nav-xshop-small)) (and (id navbar) (class nav-bluebeacon)) (and (class nav-cobrand)))
   [top (px 10)])
  ((desc (and (class nav-xshop-small)) (and (id navbar) (class nav-bluebeacon)) (and (class nav-cobrand)) (and (class nav-cobrand-divider)))
   [margin-top (px 5)])
  ((desc (and (class nav-cobranded)) (and (id navbar) (class nav-bluebeacon)) (and (id nav-xshop-container)))
   [margin-left (px 0)])
  ((desc (and (class nav-cobranded)) (and (id navbar) (class nav-bluebeacon)) (and (id nav-logo)))
   [padding-top (px 13)]
   [padding-right (px 57)]
   [padding-bottom (px 0)]
   [padding-left (px 13)])
  ((desc (and (class nav-cobranded)) (and (id navbar) (class nav-bluebeacon)) (and (id nav-logo)) (and (class nav-cobrand)))
   [top (px 18)])
  ((desc (and (class nav-cobranded)) (and (id navbar) (class nav-bluebeacon)) (and (id nav-logo)) (and (class nav-cobrand)) (and (class nav-cobrand-divider)))
   [margin-top (px 1)])
  ((desc (and (class nav-cobranded)) (and (id navbar) (class nav-bluebeacon)) (and (id nav-xshop-container)))
   [margin-left (px 39)])
  ((desc (and (class nav-cobranded)) (and (id navbar) (class nav-bluebeacon)) (and (id nav-shop)))
   [padding-left (px 2)])
  ((and (id navbar) (class nav-pinned))
   [position fixed]
   [width (% 100)]
   [height (px 55)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-belt)))
   [position absolute]
   [width (% 80)]
   [left (px 55)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-logo)))
   [width (px 145)]
   [padding-top (px 10)]
   [padding-right (px 0)]
   [padding-bottom (px 10)]
   [padding-left (px 15)]
   [height (px 55)]
   [top (px 0)]
   [left (px 0)]
   [position absolute])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-logo)) (and (class nav-logo-link)))
   [padding-top (px 0)]
   [padding-right (px 5)]
   [padding-bottom (px 0)]
   [padding-left (px 5)]
   [margin-top (px 3)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-logo)) (and (class nav-logo-tagline)))
   [top (px 32)]
   [left (px 85)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-logo)) (and (class nav-prime-try)))
   [top (px 31)]
   [left (px 87)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-logo) (class nav-paladin)))
   [width (px 155)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-logo) (class nav-paladin)) (and (class nav-logo-tagline)))
   [left (px 72)]
   [top (px 32)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-logo) (class nav-paladin)) (and (class nav-logo-link)))
   [margin-top (px 6)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-search)))
   [height (px 55)]
   [top (px 0)]
   [padding-top (px 10)]
   [padding-right (px 25)]
   [padding-bottom (px 10)]
   [padding-left (px 25)]
   [position absolute]
   [left (px 150)]
   [right (px 0)])
  ((desc (and (id navbar) (class nav-pinned) (class nav-pldn)) (and (id nav-search)))
   [left (px 210)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-swmslot)))
   [display none])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-shop)))
   [width (px 200)])
  ((desc (and (id navbar) (class nav-pinned) (class nav-pldn)) (and (id nav-shop)))
   [width (px 210)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-flyout-anchor)) (and (id nav-flyout-shopAll)) (and (class nav-arrow)))
   [margin-left (px -13)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)))
   [top (px 0)]
   [left (px 0)]
   [height (px 55)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-logo-borderfade)))
   [display none])
  ((or (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (class nav-fill))) (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (class nav-left))) (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (class nav-right))))
   [height (px 55)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (class nav-right)))
   [right (px 5)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (class nav-fill)) (and (id nav-xshop-container)))
   [display none])
  ((or (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-shop))) (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools))))
   [margin-top (px 0)])
  ((or (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-shop)) (and (class nav-a))) (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (class nav-a))))
   [padding-top (px 10)]
   [padding-right (px 0)]
   [padding-bottom (px 10)]
   [padding-left (px 0)]
   #;[line-height (px 55)]
   [height (px 55)])
  (("#navbar.nav-pinned #nav-main #nav-shop .nav-a:focus, #navbar.nav-pinned #nav-main #nav-shop .nav-a:hover, #navbar.nav-pinned #nav-main #nav-tools .nav-a:focus, #navbar.nav-pinned #nav-main #nav-tools .nav-a:hover" (or))
   #;[line-height (px 55)]
   [height (px 55)]
   #;[background-color rgb(25, 34, 45)]
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
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 0)]
   #;[box-shadow none])
  ((or (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-shop)) (and (class nav-a-2))) (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (class nav-a-2))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [top (px -5)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-shop)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((or (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-shop)) (and (class nav-a)) (and (class nav-line-1))) (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-shop)) (and (class nav-a)) (and (class nav-line-2))))
   [display none]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-shop)) (and (class nav-a)) (and (id nav-sbd-pinned)))
   [width (px 55)])
  ((or (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-shop)) (and (class nav-a)) (and (id nav-sbd-pinned)) (and (class nav-line1))) (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-shop)) (and (class nav-a)) (and (id nav-sbd-pinned)) (and (class nav-line2))) (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-shop)) (and (class nav-a)) (and (id nav-sbd-pinned)) (and (class nav-line3))))
   [position absolute]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [width (px 23)]
   [height (px 3)]
   #;[background-color rgb(204, 204, 204)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [left (px 16)]
   [right (px 16)]
   #;[border-top-left-radius (px 1)]
   #;[border-top-right-radius (px 1)]
   #;[border-bottom-right-radius (px 1)]
   #;[border-bottom-left-radius (px 1)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-shop)) (and (class nav-a)) (and (id nav-sbd-pinned)) (and (class nav-line1)))
   [top (px 18)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-shop)) (and (class nav-a)) (and (id nav-sbd-pinned)) (and (class nav-line2)))
   [top (px 26)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-shop)) (and (class nav-a)) (and (id nav-sbd-pinned)) (and (class nav-line3)))
   [top (px 34)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (class nav-fill)) (and (id nav-search-label)))
   [display none])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (class nav-fill)) (and (id nav-search)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 10)]
   [padding-right (px 25)]
   [padding-bottom (px 10)]
   [padding-left (px 25)]
   [height (px 55)])
  ((or (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (class nav-fill)) (and (id nav-search)) (and (class nav-fill))) (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (class nav-fill)) (and (id nav-search)) (and (class nav-left))) (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (class nav-fill)) (and (id nav-search)) (and (class nav-right))))
   [height (px 35)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (class nav-a)))
   [padding-top (px 10)]
   [padding-right (px 12)]
   [padding-bottom (px 10)]
   [padding-left (px 12)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (class nav-line-3)))
   [margin-top (px 3)]
   [padding-bottom (px 0)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (class nav-line-4)))
   [margin-top (px 3)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (class nav-truncate)) (and (class nav-line-3)))
   [top (px 9)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 11)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (class nav-truncate)) (and (class nav-line-4)))
   [padding-top (px 0)]
   [padding-right (px 11)]
   [padding-bottom (px 5)]
   [padding-left (px 0)]
   [margin-top (px 18)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (class nav-divider)))
   [border-right-width (px 1)]
   [border-right-style solid]
   #;[border-right-color rgb(58, 69, 83)]
   [width (px 1)]
   [height (px 35)]
   #;[line-height (px 35)]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-top (px 10)]
   [margin-right (px 0)]
   [margin-bottom (px 10)]
   [margin-left (px 0)]
   [position absolute]
   [right (px 131)]
   [top (px -5)])
  ((or (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (id nav-link-prime))) (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (id nav-link-wishlist))))
   [display none])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (id nav-cart)))
   [left (px 5)]
   [padding-top (px 10)]
   [padding-right (px 25)]
   [padding-bottom (px 10)]
   [padding-left (px 25)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (id nav-cart)) (and (id nav-cart-count)))
   [top (px 1)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (id nav-cart)) (and (class nav-icon) (class nav-arrow)))
   [display none])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (id nav-cart)) (and (class nav-line-1)))
   [height (px 9)]
   [margin-top (px 0)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (id nav-cart)) (and (class nav-line-2)))
   [padding-bottom (px 0)]
   [margin-left (px 45)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (id nav-cart)) (and (class nav-cart-icon)))
   [left (px 25)]
   [top (px 14)])
  ((desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (id nav-cart)) (and (id nav-cart-count)))
   [left (px 38)]
   [top (px 11)])
  ((or (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (id nav-link-yourAccount)) (and (class nav-line-1))) (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (id nav-link-yourAccount)) (and (class nav-line-2))))
   [display none])
  ((or (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (id nav-link-yourAccount)) (and (class nav-line-3))) (desc (and (id navbar) (class nav-pinned)) (and (id nav-main)) (and (id nav-tools)) (and (id nav-link-yourAccount)) (and (class nav-line-4))))
   [display block]
   #;[font-family arial])
  ((desc (and (class nav-subnav)) (and (id nav-subnav) (class spacious)))
   [display flex]
   #;[justify-content space-between]
   [height (px 50)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[box-shadow (px 0)])
  ((desc (and (class nav-subnav)) (and (id nav-subnav) (class spacious)) (and (class nav-a)))
   #;[flex-grow 1]
   #;[flex-shrink (px 0)]
   #;[flex-basis auto]
   [display inline-block]
   [position relative]
   [text-align center]
   #;[vertical-align middle]
   [height (px 48)]
   #;[line-height (px 50)]
   [float none]
   [padding-top (px 0)]
   [padding-right (px 13)]
   [padding-bottom (px 0)]
   [padding-left (px 13)])
  ((".nav-subnav #nav-subnav.spacious .nav-a.nav-active, .nav-subnav #nav-subnav.spacious .nav-a:hover" (or))
   [border-bottom-width (px 0)]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color])
  ((".nav-subnav #nav-subnav.spacious .nav-a.nav-active .nav-a-content, .nav-subnav #nav-subnav.spacious .nav-a:hover .nav-a-content" (or))
   #;[color rgb(51, 51, 51)]
   [border-bottom-width (px 2)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(255, 153, 0)])
  ((".nav-subnav #nav-subnav.spacious .nav-a.nav-active.nav-hasImage .nav-a-content, .nav-subnav #nav-subnav.spacious .nav-a.nav-hasImage:hover .nav-a-content" (or))
   [border-bottom-width medium]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color])
  ((desc (and (class nav-subnav)) (and (id nav-subnav) (class spacious)) (and (class nav-hasArrow)) (and (class nav-arrow)))
   [left (px 0)]
   [right (px 0)]
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   #;[visibility hidden])
  ((desc (and (class nav-subnav)) (and (id nav-subnav) (class spacious)) (and (class nav-categ-image)))
   [height (px 50)])
  ((or (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile))))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((or (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-flyout-content))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (class nav-flyout-content))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-flyout-content))))
   [margin-top (px 20)]
   [margin-right auto]
   [margin-bottom (px 20)]
   [margin-left auto]
   [display table]
   #;[table-layout fixed]
   #;[max-width (px 1300)]
   #;[min-width (px 960)]
   [width (px 1300)])
  ((or (desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-flyout-content))) (desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (class nav-flyout-content))) (desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-flyout-content))))
   [width (px 1000)]
   [padding-top (px 20)]
   [padding-right (px 0)]
   [padding-bottom (px 20)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((or (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-column))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (class nav-column))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-column))))
   [display table-cell]
   [width (% 25)]
   [padding-top (px 0)]
   [padding-right (px 20)]
   [padding-bottom (px 0)]
   [padding-left (px 20)])
  ((or (desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-column))) (desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (class nav-column))) (desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-column))))
   [float left])
  ((or (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-column-notfirst))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (class nav-column-notfirst))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-column-notfirst))))
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(241, 241, 241)]
   #;[vertical-align top])
  ((or (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-title))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (class nav-title))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-title))))
   [left (px 0)]
   [padding-bottom (px 20)])
  ((or (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-title)) (and (class nav-text))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (class nav-title)) (and (class nav-text))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-title)) (and (class nav-text))))
   #;[color rgb(51, 51, 51)]
   #;[font-size (px 16)]
   #;[font-weight 700]
   [display block])
  ((or (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-panel)) (and (class nav-divider))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (class nav-panel)) (and (class nav-divider))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-panel)) (and (class nav-divider))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 10)]
   [margin-left (px 0)]
   [height (px 0)]
   #;[background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((or (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-column))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (class nav-column))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-column))))
   [display table-cell]
   [width (% 25)])
  ((or (desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-column))) (desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (class nav-column))) (desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-column))))
   [float left])
  ((or (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting) (class nav-flyout))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout) (class nav-flyout))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile) (class nav-flyout))))
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
  ((or (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-arrow))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (class nav-arrow))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-arrow))))
   [margin-left (px 0)])
  ((or (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-image))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (class nav-image))) (desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-image))))
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
  ((or (desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-image))) (desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (class nav-image))) (desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-profile)) (and (class nav-image))))
   [width (px 200)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)))
   [margin-top (px 9)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-image)))
   #;[max-width (px 220)]
   [padding-top (px 30)]
   [padding-right (px 0)]
   [padding-bottom (px 30)]
   [padding-left (px 0)]
   [width (px 220)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-column-first)))
   [text-align center]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   #;[vertical-align middle])
  ((desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-gifting)) (and (class nav-column-first)))
   [padding-top (px 0)]
   [padding-right (px 20)]
   [padding-bottom (px 0)]
   [padding-left (px 20)])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)))
   [margin-top (px 3)])
  ((desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)))
   [left auto])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (id nav-prime-logo-image)))
   [float right]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and *) (and (tag html)) (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (id nav-prime-logo-image)))
   [width auto])
  ((desc (and (id navbar) (class nav-expanded-flyouts)) (and (id nav-flyout-prime) (class nav-fullWidthFlyout)) (and (class nav-image)))
   #;[max-width (px 220)]
   [padding-top (px 20)]
   [padding-right (px 0)]
   [padding-bottom (px 10)]
   [padding-left (px 0)]
   [width (px 220)])
  ((desc (and (id navbar) (class nav-department)) (and (id nav-shop)))
   [padding-top (px 22)]
   [padding-right (px 27)]
   [padding-bottom (px 0)]
   [padding-left (px 15)]
   [margin-top (px 2)])
  ((desc (and (id navbar) (class nav-department)) (and (id nav-shop)) (and (class nav-a)))
   #;[line-height (px 44)]
   [height (px 28)])
  ((desc (and (id navbar) (class nav-department)) (and (id nav-shop)) (and (class nav-line-1)))
   [height (px 0)]
   [margin-top (px 0)])
  ((desc (and (id navbar) (class nav-department)) (and (id nav-shop)) (and (class nav-line-2)))
   [padding-top (px 5)])
  ((and (id nav-subnav) (class fresh))
   [height (px 50)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-top-width (px 4)]
   [border-top-style solid]
   #;[border-top-color rgb(77, 156, 45)]
   [padding-bottom (px 8)]
   [padding-top (px 8)])
  ((desc (and (id nav-subnav) (class fresh)) (and (class nav-a)))
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
  ((desc (and (id nav-subnav) (class fresh)) (and (class nav-categ-image)))
   [height (px 25)]
   [padding-left (px 4)])
  ((and (class search-dropdown))
   [position absolute]
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
   #;[border-top-color rgb(221, 221, 221)]
   #;[border-right-color rgb(221, 221, 221)]
   #;[border-bottom-color rgb(221, 221, 221)]
   #;[border-left-color rgb(221, 221, 221)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [width (px 587)]
   #;[border-bottom-left-radius (px 5)]
   #;[border-bottom-right-radius (px 5)]
   #;[z-index 999]
   [display none])
  ((and (id suggestion-title))
   [display block]
   [text-align right]
   [padding-top (px 4)]
   [padding-right (px 4)]
   [padding-bottom (px 4)]
   [padding-left (px 4)]
   #;[font-size (px 10)]
   #;[color rgb(102, 102, 102)])
  ((and (class s-suggestion))
   [padding-top (px 7)]
   [padding-right (px 10)]
   [padding-bottom (px 7)]
   [padding-left (px 10)]
   #;[font-size (px 14)]
   #;[cursor pointer])
  ((and (class s-separator))
   [width (% 98)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(221, 221, 221)]
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto])
  ((and (class p13n-sc-carousel-heading-link))
   [margin-left (px 5)])
  ((and (class p13n-sc-lazy-loaded-img))
   [display inline-block]
   #;[background-color rgb(246, 246, 246)]
   #;[box-shadow (px 0)])
  ((or (and (class p13n-sc-truncate)) (and (class p13n-sc-truncate-medium)))
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class p13n-sc-offscreen-truncate))
   [position relative]
   [left (px -1000000)])
  ((and (class p13n-sc-nonAUI-sprite))
   [display inline-block]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [position relative]
   #;[vertical-align middle])
  ((desc (and (class p13n-sc-nonAUI)) (and (class p13n-sc-nonAUI-sprite)) (and (tag span)))
   [left (px -9999)]
   [position absolute])
  ((desc (and (class p13n-sc-nonAUI)) (and (class shoveler)) (and (tag a) (class back-button)))
   [width (px 36)]
   [height (px 39)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class p13n-sc-nonAUI-sprite) (class s_shvlBack)))
   [width (px 36)]
   [height (px 39)]
   #;[background-position (px 0)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class shoveler)) (and (tag a) (class next-button)))
   [width (px 36)]
   [height (px 39)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class p13n-sc-nonAUI-sprite) (class s_shvlNext)))
   [width (px 36)]
   [height (px 39)]
   #;[background-position -40px 0px])
  ((desc (and (class p13n-sc-nonAUI)) (and (class p13n-sc-nonAUI-sprite) (class s_star_0_5)))
   #;[background-position -60px -175px]
   [height (px 19)]
   [width (px 80)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class p13n-sc-nonAUI-sprite) (class s_star_1_5)))
   #;[background-position -45px -175px]
   [height (px 19)]
   [width (px 80)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class p13n-sc-nonAUI-sprite) (class s_star_2_5)))
   #;[background-position -30px -175px]
   [height (px 19)]
   [width (px 80)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class p13n-sc-nonAUI-sprite) (class s_star_3_5)))
   #;[background-position -15px -175px]
   [height (px 19)]
   [width (px 80)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class p13n-sc-nonAUI-sprite) (class s_star_4_5)))
   #;[background-position (px 0)]
   [height (px 19)]
   [width (px 80)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class p13n-sc-nonAUI-sprite) (class s_star_1_0)))
   #;[background-position -60px -150px]
   [height (px 19)]
   [width (px 80)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class p13n-sc-nonAUI-sprite) (class s_star_2_0)))
   #;[background-position -45px -150px]
   [height (px 19)]
   [width (px 80)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class p13n-sc-nonAUI-sprite) (class s_star_3_0)))
   #;[background-position -30px -150px]
   [height (px 19)]
   [width (px 80)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class p13n-sc-nonAUI-sprite) (class s_star_4_0)))
   #;[background-position -15px -150px]
   [height (px 19)]
   [width (px 80)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class p13n-sc-nonAUI-sprite) (class s_star_5_0)))
   #;[background-position (px 0)]
   [height (px 19)]
   [width (px 80)])
  ((and (class p13n-sc-nonAUI-sprite) (class p13n-icon-prime))
   #;[background-position -90px 0px]
   [height (px 12)]
   [width (px 47)]
   [top (px -5)])
  ((and (class p13n-sc-nonAUI-sprite) (class p13n-icon-premium))
   #;[background-position -90px -20px]
   [height (px 11)]
   [width (px 62)]
   [top (px -5)])
  ((and (class p13n-sc-nonAUI-sprite) (class p13n-icon-prime-jp))
   #;[background-position -90px -40px]
   [height (px 12)]
   [width (px 51)]
   [top (px -5)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class shoveler-heading)))
   [padding-right (px 227)]
   [margin-bottom (px 15)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class shoveler-pagination)))
   [width (px 227)]
   [text-align right]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class shoveler-content)))
   [margin-top (px 0)]
   [margin-right (px 35)]
   [margin-bottom (px 0)]
   [margin-left (px 45)]
   #;[clear both])
  ((desc (and (class p13n-sc-nonAUI)) (and (class shoveler-button-wrapper)))
   [position relative]
   [width (% 100)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class shoveler)) (and (tag li)))
   [width (px 160)]
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 10)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class p13n-sc-nonAUI)) (and (class shoveler)) (and (tag ul)))
   [height (px 256)])
  ((desc (and (class p13n-sc-nonAUI)) (and (class a-text-separator)))
   #;[background-color rgb(221, 221, 221)]
   [display inline-block]
   [height (px 14)]
   #;[line-height (px 0)]
   [margin-top (px -2)]
   [margin-right 0.67375em]
   [margin-bottom (px 0)]
   [margin-left 0.67375em]
   #;[vertical-align middle]
   [width (px 1)])
  ((and (class p13n-spacing-micro))
   [margin-bottom (px 4)])
  ((and (class p13n-spacing-top-micro))
   [margin-top (px 4)])
  ((and (class p13n-link-type-child))
   [display inline-block]
   [position relative]
   [padding-left (px 8)])
  ((and (class p13n-faceout-image))
   #;[vertical-align bottom]
   [margin-bottom 0.45em])
  ((".p13n-link-type-child::before" (or))
   #;[content "›"]
   #;[color rgb(148, 148, 148)]
   #;[font-weight 700]
   [position absolute]
   [left (px 0)]
   [top (px -1)])
  ((and (class p13n-state-form))
   [position absolute]
   [left (px -1000)])
  ((and (class p13n-icon-row))
   [padding-top (px 1)]
   [padding-bottom (px 1)])
  ((and (class p13n-alt-text))
   [display block]
   [height (px 1)]
   [width (px 1)]
   #;[line-height (px 1)]
   #;[font-size (px 1)]
   #;[text-indent (px -9999)]
   [position absolute]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[z-index -1])
  ((and (class p13n-sc-offscreen))
   [position absolute]
   [left auto]
   [top auto]
   #;[z-index -1]
   #;[opacity (px 0)])
  ((desc (and (class p13n-sc-nonAUI-row)) (and (class shoveler)) (and (tag ul)))
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class p13n-sc-nonAUI-row)) (and (class shoveler-pagination)))
   [display none])
  ((desc (and (class p13n-sc-nonAUI-row)) (and (class shoveler)) (and (class shoveler-content)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [height (px 256)])
  ((desc (and (class p13n-sc-nonAUI-row)) (and (class shoveler)) (and (tag ul)))
   [height (px 256)])
  ((desc (and (class p13n-sc-nonAUI-row)) (and (class shoveler)) (and (tag li)))
   [display inline-block]
   [height (px 256)])
  ((".aok-clearfix::after, .aok-clearfix::before, .clearfix::after, .clearfix::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  ((or (and (class aok-hide-text)) (and (class hide-text)))
   #;[font-family a]
   #;[font-style normal]
   #;[font-weight normal]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
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
   #;[color transparent]
   #;[text-shadow none]
   #;[background-color transparent]
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
  ((or (and (class a-offscreen)) (and (class aok-offscreen)))
   [position absolute]
   [left auto]
   [top auto]
   #;[z-index -1]
   #;[opacity (px 0)])
  ((and (class offscreen))
   [position absolute]
   [left (px -10000)]
   [top auto]
   [width (px 1)]
   [height (px 1)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class a-visible-phone))
   [display none])
  ((and (class a-visible-tablet))
   [display none])
  ((and (class a-hidden-desktop))
   [display none])
  ((and *)
   [box-sizing border-box])
  ((or (and (tag article)) (and (tag aside)) (and (tag details)) (and (tag figcaption)) (and (tag figure)) (and (tag footer)) (and (tag header)) (and (tag hgroup)) (and (tag nav)) (and (tag section)))
   [display block])
  ((or (and (tag audio)) (and (tag canvas)) (and (tag video)))
   [display inline-block])
  (("audio:not([controls])" (or))
   [display none])
  ((and (tag pre))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((or (and (tag sub)) (and (tag sup)))
   [position relative]
   #;[font-size (% 75)]
   #;[line-height (px 0)]
   #;[vertical-align baseline])
  ((and (tag sup))
   [top -0.5em])
  ((and (tag sub))
   [bottom -0.25em])
  ((and (tag abbr))
   [border-bottom-width (px 0)]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color])
  ((and (tag img))
   #;[max-width (% 100)]
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
   [width (% 100)])
  ((or (and (tag button)) (and (tag input)) (and (tag select)) (and (tag textarea)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[font-size (% 100)]
   #;[vertical-align middle])
  (("button::-moz-focus-inner, input::-moz-focus-inner" (or))
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
  ((and (tag textarea))
   [overflow-x auto]
   [overflow-y auto]
   #;[vertical-align top])
  ((and (tag body))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[background-color rgb(255, 255, 255)])
  ((".a-icon, .a-link-emphasis::after" (or (id e10001) (id e10002) (id e10003) (id e10004) (id e10005) (id e10006) (id e10007)))
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/AUIClients/AmazonUIBaseCSS-sprite_1x-8fe8c701c7a6f38368f97a8a3f04d5f25875be4d._V2_.png")]
   #;[background-size 400px 650px]
   #;[background-repeat no-repeat]
   [display inline-block]
   #;[vertical-align top])
  ((and (class a-icon-amazon-app))
   [width (px 55)]
   [height (px 55)]
   #;[background-position -290px -70px])
  ((and (class a-icon-autorip))
   [width (px 62)]
   [height (px 15)]
   #;[background-position -205px -339px]
   #;[vertical-align baseline]
   [position relative]
   [bottom (px -2)])
  ((and (class a-icon-kindle-unlimited))
   [width (px 80)]
   [height (px 16)]
   #;[background-position -199px -566px]
   #;[vertical-align baseline])
  ((and (class a-icon-kindle-unlimited-fr))
   [width (px 86)]
   [height (px 10)]
   #;[background-position -100px -70px]
   #;[vertical-align baseline])
  ((or (and (class a-icon-prime)) (and (class a-prime-logo)))
   [width (px 52)]
   [height (px 16)]
   #;[background-position -5px -489px]
   #;[vertical-align baseline])
  ((or (and (class a-icon-prime) (class a-icon-small)) (and (class a-prime-logo) (class a-icon-small)))
   [width (px 47)]
   [height (px 15)]
   #;[background-position -205px -246px])
  ((and (class a-icon-text))
   [padding-left (px 3)]
   [position relative]
   [bottom (px 3)])
  ((or (desc (and (class a-icon-premium-with-text) (class a-icon-small)) (and (class a-icon-text))) (desc (and (class a-icon-prime-jp-with-text) (class a-icon-small)) (and (class a-icon-text))) (desc (and (class a-icon-prime-with-text) (class a-icon-small)) (and (class a-icon-text))))
   #;[font-size (px 10)]
   [bottom (px 3)])
  ((or (desc (and (class a-icon-prime-jp-with-text)) (and (class a-icon-text))) (desc (and (class a-icon-prime-with-text)) (and (class a-icon-text))))
   [bottom (px 2)])
  ((desc (and (class a-hires)) (and (class a-icon-premium-with-text) (class a-icon-small)) (and (class a-icon-text)))
   [bottom (px 2)])
  ((and (class a-icon-prime-pass))
   #;[background-position -210px -634px]
   [height (px 14)]
   [width (px 76)])
  ((and (class a-icon-prime-campus))
   #;[background-position -100px -629px]
   [height (px 16)]
   [width (px 102)]
   #;[vertical-align baseline])
  ((and (class a-icon-prime-campus) (class a-icon-small))
   #;[background-position -5px -629px]
   [height (px 14)]
   [width (px 88)])
  ((and (class a-icon-fresh))
   #;[background-position -190px -552px]
   [height (px 11)]
   [width (px 35)]
   #;[vertical-align baseline])
  ((and (class a-icon-prime-pantry))
   #;[background-position -100px -569px]
   [height (px 16)]
   [width (px 79)]
   #;[vertical-align baseline])
  ((and (class a-icon-prime-pantry) (class a-icon-small))
   #;[background-position -5px -569px]
   [height (px 14)]
   [width (px 74)])
  ((and (class a-icon-pantry))
   #;[background-position -300px -630px]
   [width (px 43)]
   [height (px 14)])
  ((and (class a-icon-pantry) (class a-icon-small))
   #;[background-position -350px -630px]
   [width (px 37)]
   [height (px 11)])
  ((and (class a-icon-prime-fresh))
   #;[background-position -100px -549px]
   [height (px 16)]
   [width (px 80)]
   #;[vertical-align baseline])
  ((and (class a-icon-prime-fresh) (class a-icon-small))
   [width (px 72)]
   [height (px 15)]
   #;[background-position -5px -549px])
  ((or (and (class a-icon-premium)) (and (class a-premium-logo)))
   [width (px 74)]
   [height (px 16)]
   #;[background-position -289px -130px]
   #;[vertical-align baseline])
  ((or (and (class a-icon-premium) (class a-icon-small)) (and (class a-premium-logo) (class a-icon-small)))
   [width (px 62)]
   [height (px 15)]
   #;[background-position -205px -274px])
  ((or (and (class a-icon-prime-jp)) (and (class a-prime-jp-logo)))
   [width (px 57)]
   [height (px 17)]
   #;[background-position -289px -167px]
   #;[vertical-align baseline])
  ((or (and (class a-icon-prime-jp) (class a-icon-small)) (and (class a-prime-jp-logo) (class a-icon-small)))
   [width (px 51)]
   [height (px 15)]
   #;[background-position -205px -306px])
  ((or (and (class a-button) (class a-icon-premium)) (and (class a-button) (class a-icon-prime)) (and (class a-button) (class a-icon-prime-jp)) (and (class a-button) (class a-premium-logo)) (and (class a-button) (class a-prime-jp-logo)) (and (class a-button) (class a-prime-logo)))
   [position relative]
   [top (px 1)])
  ((or (and (class a-icon-premium-nav)) (and (class a-icon-prime-jp-nav)) (and (class a-icon-prime-nav)) (and (class a-icon-primefresh-nav)) (and (class a-premium-nav-logo)) (and (class a-prime-jp-nav-logo)) (and (class a-prime-nav-logo)))
   [position absolute]
   [left (px 73)]
   [bottom (px 0)])
  ((or (and (class a-icon-premium-nav)) (and (class a-premium-nav-logo)))
   [width (px 56)]
   [height (px 10)]
   #;[background-position -289px -297px])
  ((or (and (class a-icon-prime-jp-nav)) (and (class a-prime-jp-nav-logo)))
   [width (px 39)]
   [height (px 10)]
   #;[background-position -289px -319px])
  ((or (and (class a-icon-prime-nav)) (and (class a-prime-nav-logo)))
   [width (px 39)]
   [height (px 10)]
   #;[background-position -289px -275px])
  ((and (class a-icon-primefresh-nav))
   [width (px 63)]
   [height (px 10)]
   #;[background-position -289px -346px])
  ((or (and (class a-addon-badge)) (and (class a-icon-addon)))
   #;[background-image none]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 3)]
   #;[background-color rgb(63, 105, 152)]
   #;[font-size (px 11)]
   #;[line-height 1.05]
   [padding-top (px 4)]
   [padding-right (px 5)]
   [padding-bottom (px 4)]
   [padding-left (px 6)]
   #;[color rgb(255, 255, 255)]
   #;[font-style normal]
   #;[font-weight 700]
   [position relative]
   [top (px 1)])
  ((".a-addon-badge::after, .a-addon-badge::before, .a-icon-addon::after, .a-icon-addon::before" (or))
   #;[content ""]
   [position absolute]
   [right (px -5)]
   [border-left-width (px 0)])
  ((".a-addon-badge::after, .a-icon-addon::after" (or))
   [top (px 0)]
   [border-right-style dashed]
   [border-bottom-style dashed]
   [border-left-style dashed]
   [border-right-width (px 6)]
   [border-left-width (px 6)]
   #;[border-right-color rgba(255, 255, 255, 0)]
   #;[border-bottom-color rgba(255, 255, 255, 0)]
   #;[border-left-color rgba(255, 255, 255, 0)]
   [border-top-style solid]
   #;[border-top-color rgb(63, 105, 152)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   #;[transform translate3d(0px, 0px, 0px)]
   [border-top-width (px 10)])
  ((".a-addon-badge::before, .a-icon-addon::before" (or))
   [bottom (px 0)]
   [border-top-style dashed]
   [border-right-style dashed]
   [border-left-style dashed]
   [border-right-width (px 6)]
   [border-left-width (px 6)]
   #;[border-top-color rgba(255, 255, 255, 0)]
   #;[border-right-color rgba(255, 255, 255, 0)]
   #;[border-left-color rgba(255, 255, 255, 0)]
   [border-top-width (px 0)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(63, 105, 152)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   #;[transform translate3d(0px, 0px, 0px)]
   [border-bottom-width (px 10)])
  ((or (and (class a-icon-nav-cart)) (and (class a-nav-cart)))
   [position relative])
  ((or (and (class a-domain)) (and (class a-icon-domain)))
   [height (px 28)])
  ((or (and (class a-domain-uk)) (and (class a-icon-domain-uk)))
   [width (px 32)]
   #;[background-position -5px -200px])
  ((or (and (class a-domain-ca)) (and (class a-icon-domain-ca)))
   [width (px 17)]
   #;[background-position -42px -200px])
  ((or (and (class a-domain-de)) (and (class a-icon-domain-de)))
   [width (px 17)]
   #;[background-position -64px -200px])
  ((or (and (class a-domain-it)) (and (class a-icon-domain-it)))
   [width (px 13)]
   #;[background-position -87px -200px])
  ((or (and (class a-domain-es)) (and (class a-icon-domain-es)))
   [width (px 16)]
   #;[background-position -106px -200px])
  ((or (and (class a-domain-fr)) (and (class a-icon-domain-fr)))
   [width (px 12)]
   #;[background-position -127px -200px])
  ((or (and (class a-domain-jp)) (and (class a-icon-domain-jp)))
   [width (px 28)]
   #;[background-position -145px -200px])
  ((or (and (class a-domain-br)) (and (class a-icon-domain-br)))
   [width (px 42)]
   #;[background-position -181px -200px])
  ((or (and (class a-domain-in)) (and (class a-icon-domain-in)))
   [width (px 14)]
   #;[background-position -228px -200px])
  ((and (class a-icon-domain-mx))
   #;[background-position -5px -327px]
   [width (px 48)])
  ((and (class a-icon-domain-au))
   #;[background-position -58px -327px]
   [width (px 44)])
  ((and (class a-icon-domain-ru))
   #;[background-position -108px -327px]
   [width (px 16)])
  ((and (class a-icon-domain-nl))
   #;[background-position -128px -327px]
   [width (px 13)])
  ((and (class a-icon-menu))
   [width (px 12)]
   [height (px 11)]
   #;[background-position -254px -86px]
   #;[opacity 0.5])
  ((and (class a-icon-arrow))
   [width (px 11)]
   [height (px 15)]
   #;[background-position -5px -35px])
  ((or (and (class a-icon-collapse)) (and (class a-icon-expand)))
   [width (px 7)]
   [height (px 7)]
   #;[background-position -366px -86px]
   [position absolute]
   [top (% 50)]
   [margin-top (px -4)]
   [left (px 0)])
  ((and (class a-icon-collapse))
   #;[background-position -382px -86px]
   [left (px -3)])
  ((or (and (class a-icon-section-collapse)) (and (class a-icon-section-expand)))
   [width (px 15)]
   [height (px 12)]
   #;[background-position -5px -59px]
   #;[opacity 0.64]
   [position relative])
  ((or (and (class a-icon-extender-collapse)) (and (class a-icon-extender-expand)))
   [position relative]
   #;[vertical-align baseline]
   [margin-right 0.385em])
  ((or (and (class a-icon-star)) (and (class a-icon-star-medium)) (and (class a-icon-star-mini)) (and (class a-icon-star-small)))
   [position relative]
   #;[vertical-align text-top])
  ((and (class a-icon-star-medium))
   [width (px 95)]
   [height (px 21)]
   [margin-right (px 1)]
   [top (px -2)])
  ((and (class a-icon-star-small))
   [width (px 80)]
   [height (px 18)]
   [top (px 1)])
  ((and (class a-icon-star-mini))
   [width (px 60)]
   [height (px 12)]
   [top (px 3)])
  (("a.a-icon-link-emphasis::after, a.a-link-emphasis::after" (or))
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/AUIClients/AmazonUIBaseCSS-sprite_1x-8fe8c701c7a6f38368f97a8a3f04d5f25875be4d._V2_.png")]
   #;[background-size 400px 650px]
   #;[background-repeat no-repeat]
   #;[pointer-events none]
   #;[content ""]
   [display block]
   [position absolute]
   [width (px 3)]
   [right (px 1)]
   [top (% 50)]
   [height (px 6)]
   [margin-top (px -3)]
   #;[background-position -346px -86px]
   #;[vertical-align top])
  ((or (and (class a-icon-next)) (and (class a-icon-previous)) (and (class a-icon-restart)))
   [width (px 15)]
   [height (px 19)]
   [margin-top (px 3)]
   [margin-right (px 3)]
   [margin-bottom (px 3)]
   [margin-left (px 4)]
   #;[background-position -122px -5px])
  ((and (class a-icon-next))
   [margin-top (px 3)]
   [margin-right (px 4)]
   [margin-bottom (px 3)]
   [margin-left (px 3)]
   #;[background-position -102px -5px])
  ((and (class a-icon-restart))
   [margin-top (px 3)]
   [margin-right (px 3)]
   [margin-bottom (px 3)]
   [margin-left (px 4)]
   #;[background-position -142px -5px])
  ((and (class a-icon-popover))
   [margin-top (px 5)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 5)]
   #;[vertical-align text-top]
   [width (px 7)]
   [height (px 5)]
   #;[background-position -90px -5px]
   #;[opacity 0.6])
  ((desc (and (class a-size-small)) (and (class a-icon-popover)))
   [margin-top (px 4)])
  ((and (class a-icon-search))
   [width (px 13)]
   [height (px 13)]
   #;[background-position -271px -86px]
   #;[opacity 0.55])
  ((and (class a-icon-checkmark-inverse))
   [width (px 15)]
   [height (px 17)]
   #;[background-position -172px -82px]
   #;[opacity 0.6]
   [margin-right 0.6em]
   #;[vertical-align baseline])
  ((or (and (class a-icon-share-line)) (and (class a-share-line)))
   [width (px 17)]
   [height (px 17)]
   #;[background-position -14px -168px]
   [position relative]
   [top (px 1)])
  ((or (and (class a-icon-share-facebook)) (and (class a-share-facebook)))
   [width (px 17)]
   [height (px 17)]
   #;[background-position -36px -168px]
   [position relative]
   [top (px 1)])
  ((or (and (class a-icon-share-twitter)) (and (class a-share-twitter)))
   [width (px 18)]
   [height (px 17)]
   #;[background-position -57px -168px]
   [position relative]
   [top (px 1)])
  ((or (and (class a-icon-share-pinterest)) (and (class a-share-pinterest)))
   [width (px 17)]
   [height (px 17)]
   #;[background-position -78px -168px]
   [position relative]
   [top (px 1)])
  ((or (and (class a-icon-share-email)) (and (class a-share-email)))
   [width (px 19)]
   [height (px 17)]
   #;[background-position -99px -168px]
   [position relative]
   [top (px 1)])
  ((or (and (class a-icon-share-mixi)) (and (class a-share-mixi)))
   [width (px 19)]
   [height (px 17)]
   #;[background-position -122px -168px]
   [position relative]
   [top (px 1)])
  ((or (and (class a-icon-share-kaixin001)) (and (class a-share-kaixin001)))
   [width (px 17)]
   [height (px 17)]
   #;[background-position -144px -168px]
   [position relative]
   [top (px 1)])
  ((or (and (class a-icon-share-tencent)) (and (class a-share-tencent)))
   [width (px 17)]
   [height (px 17)]
   #;[background-position -165px -168px]
   [position relative]
   [top (px 1)])
  ((or (and (class a-icon-share-pengyou)) (and (class a-share-pengyou)))
   [width (px 17)]
   [height (px 17)]
   #;[background-position -186px -168px]
   [position relative]
   [top (px 1)])
  ((or (and (class a-icon-share-renren)) (and (class a-share-renren)))
   [width (px 17)]
   [height (px 17)]
   #;[background-position -207px -168px]
   [position relative]
   [top (px 1)])
  ((or (and (class a-icon-share-douban)) (and (class a-share-douban)))
   [width (px 17)]
   [height (px 17)]
   #;[background-position -228px -168px]
   [position relative]
   [top (px 1)])
  ((or (and (class a-icon-share-qzone)) (and (class a-share-qzone)))
   [width (px 17)]
   [height (px 17)]
   #;[background-position -249px -168px]
   [position relative]
   [top (px 1)])
  ((or (and (class a-icon-share-sina)) (and (class a-share-sina)))
   [width (px 17)]
   [height (px 17)]
   #;[background-position -269px -168px]
   [position relative]
   [top (px 1)])
  ((or (and (class a-icon-share-wechat)) (and (class a-share-wechat)))
   [width (px 17)]
   [height (px 17)]
   #;[background-position -249px -190px]
   [position relative]
   [top (px 1)])
  ((or (and (class a-icon-share-qq)) (and (class a-share-qq)))
   [width (px 17)]
   [height (px 17)]
   #;[background-position -270px -190px]
   [position relative]
   [top (px 1)])
  ((and (class a-icon-gridview))
   [width (px 11)]
   [height (px 11)]
   #;[background-position -162px -5px])
  ((and (class a-icon-listview))
   [width (px 11)]
   [height (px 11)]
   #;[background-position -178px -5px])
  ((or (and (class a-icon-text-separator)) (and (class a-text-separator)))
   [display inline-block]
   [margin-top (px -2)]
   [margin-right 0.67375em]
   [margin-bottom (px 0)]
   [margin-left 0.67375em]
   [width (px 1)]
   #;[background-color rgb(221, 221, 221)]
   #;[line-height (px 0)]
   [height (px 14)]
   #;[vertical-align middle])
  ((or (desc (and (class a-size-small)) (and (class a-icon-text-separator))) (desc (and (class a-size-small)) (and (class a-text-separator))))
   [height (px 13)])
  ((or (desc (and (class a-size-mini)) (and (class a-icon-text-separator))) (desc (and (class a-size-mini)) (and (class a-text-separator))))
   [height (px 12)])
  ((and (class a-icon-row))
   [display block]
   #;[line-height (px 0)])
  ((and (class a-icon-row) (class a-spacing-none))
   [padding-bottom (px 0)])
  ((desc (and (class a-icon-row)) (and (class a-row)))
   [margin-top (px 1)])
  ((desc (and (class a-alert-success)) (and (class a-icon-alert)))
   [width (px 27)]
   #;[background-position -318px -35px])
  ((desc (and (class a-alert-inline-error)) (and (class a-icon-alert)))
   [width (px 5)]
   #;[background-position -141px -130px])
  ((desc (and (class a-alert-inline-info)) (and (class a-icon-alert)))
   [width (px 6)]
   #;[background-position -166px -130px])
  ((and (class a-icon-alt))
   [position absolute]
   [left (px -9999)]
   [top auto]
   [display block]
   [width (px 1)]
   [height (px 1)]
   #;[line-height (px 1)]
   #;[font-size (px 1)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class a-icon-calendar))
   #;[background-position -302px -490px]
   [width (px 23)]
   [height (px 22)])
  ((and (class a-icon-fba-with-text))
   #;[background-image none]
   #;[border-top-left-radius (px 2)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 2)]
   #;[background-color rgb(62, 70, 80)]
   #;[line-height 1.05]
   #;[font-size (px 12)]
   #;[color rgb(255, 255, 255)]
   [padding-top (px 3)]
   [padding-right (px 4)]
   [padding-bottom (px 3)]
   [padding-left (px 5)]
   #;[font-style normal]
   [position relative]
   [top (px 1)]
   #;[letter-spacing 0.08em]
   #;[transform translate3d(0px, 0px, 0px)])
  ((".a-icon-fba-with-text::after" (or))
   #;[content ""]
   [position absolute]
   [right (px -5)]
   [top (px 0)]
   [border-right-style dashed]
   [border-bottom-style dashed]
   [border-left-style dashed]
   [border-right-width (px 6)]
   #;[border-right-color rgba(255, 255, 255, 0)]
   #;[border-bottom-color rgba(255, 255, 255, 0)]
   #;[border-left-color rgba(255, 255, 255, 0)]
   [border-top-style solid]
   #;[border-top-color rgb(62, 70, 80)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   #;[transform translate3d(0px, 0px, 0px)]
   [border-left-width (px 0)]
   [border-top-width (px 10)])
  ((".a-icon-fba-with-text::before" (or))
   #;[content ""]
   [position absolute]
   [right (px -5)]
   [bottom (px 0)]
   [border-top-style dashed]
   [border-right-style dashed]
   [border-left-style dashed]
   [border-right-width (px 6)]
   #;[border-top-color rgba(255, 255, 255, 0)]
   #;[border-right-color rgba(255, 255, 255, 0)]
   #;[border-left-color rgba(255, 255, 255, 0)]
   [border-top-width (px 0)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(62, 70, 80)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   #;[transform translate3d(0px, 0px, 0px)]
   [border-left-width (px 0)]
   [border-bottom-width (px 10)])
  ((and (class a-icon-fba))
   #;[background-position -160px -350px]
   [height (px 13)]
   [width (px 13)])
  ((and (class a-icon-text-fba))
   #;[font-family "Arial Narrow"]
   [padding-left (px 3)]
   #;[vertical-align bottom])
  ((and (class a-icon-wrapper))
   [display inline-block]
   #;[vertical-align top])
  ((or (desc (and (class a-no-js)) (and (class a-checkbox-fancy)) (and (tag i))) (desc (and (class a-no-js)) (and (class a-checkbox) (class a-checkbox-fancy)) (and (tag i))) (desc (and (class a-no-js)) (and (class a-radio-fancy)) (and (tag i))) (desc (and (class a-no-js)) (and (class a-radio) (class a-radio-fancy)) (and (tag i))))
   [display none])
  ((or (desc (and (class a-no-js)) (and (class a-checkbox-fancy)) (and (tag input))) (desc (and (class a-no-js)) (and (class a-checkbox) (class a-checkbox-fancy)) (and (tag input))) (desc (and (class a-no-js)) (and (class a-radio-fancy)) (and (tag input))) (desc (and (class a-no-js)) (and (class a-radio) (class a-radio-fancy)) (and (tag input))))
   [position relative]
   #;[z-index auto]
   #;[opacity 1])
  ((or (and (class a-icon-logo)) (and (class a-logo)))
   #;[background-position -5px -130px]
   [height (px 31)]
   [width (px 103)])
  ((or (and (class a-icon-logo-china)) (and (class a-logo-china)))
   #;[background-position -5px -590px]
   [height (px 38)]
   [width (px 87)])
  ((or (and (class a-icon-nav-cart)) (and (class a-nav-cart)))
   [width (px 38)]
   [height (px 26)]
   #;[background-position -157px -245px])
  ((and (class a-icon-1click))
   [height (px 25)]
   [width (px 25)]
   #;[background-position -5px -5px])
  ((and (class a-icon-cart))
   [height (px 25)]
   [width (px 25)]
   #;[background-position -35px -5px])
  ((and (class a-icon-sns))
   [height (px 25)]
   [width (px 25)]
   #;[background-position -88px -35px])
  ((and (class a-icon-supplemental))
   [width (px 8)]
   [height (px 11)]
   #;[background-position -77px -5px]
   #;[opacity 0.64])
  ((and (class a-icon-dropdown))
   [width (px 5)]
   [height (px 8)]
   #;[background-position -65px -5px])
  ((and (class a-icon-arrow-up))
   #;[background-position -354px -5px]
   [width (px 7)]
   [height (px 4)]
   #;[opacity 0.64])
  ((or (and (class a-icon-radio-active)) (and (class a-icon-radio-inactive)))
   [width (px 19)]
   [height (px 19)]
   #;[vertical-align middle])
  ((desc (and (class a-checkbox-fancy)) (and (class a-icon-checkbox)))
   [height (px 16)]
   [width (px 16)]
   #;[vertical-align middle])
  ((desc (and (class a-radio-fancy)) (and (class a-icon-radio)))
   [height (px 17)]
   [width (px 17)]
   #;[vertical-align middle])
  ((or (and (class a-icon-extender-collapse)) (and (class a-icon-extender-expand)))
   [width (px 7)]
   [height (px 9)]
   #;[background-position -82px -293px])
  ((and (class a-icon-star))
   [width (px 80)]
   [height (px 18)])
  ((and (class a-icon-close))
   [width (px 10)]
   [height (px 9)]
   #;[background-position -297px -5px]
   #;[opacity 0.64])
  ((and (class a-icon-row))
   [padding-top (px 1)]
   [padding-bottom (px 1)])
  ((and (class a-icon-checkout))
   #;[background-position -58px -35px]
   [height (px 25)]
   [width (px 25)])
  ((and (class a-icon-buynow))
   [width (px 25)]
   [height (px 25)]
   #;[background-position -35px -60px])
  ((or (and (tag h1)) (and (tag h2)) (and (tag h3)) (and (tag h4)) (and (tag h5)) (and (tag h6)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((or (and (tag h1)) (and (tag h2)) (and (tag h3)) (and (tag h4)))
   #;[font-family Arial,sans-serif]
   #;[text-rendering optimizelegibility]
   [padding-bottom (px 4)])
  (("h1:last-child, h2:last-child, h3:last-child, h4:last-child" (or (id e10008) (id e10009) (id e10010) (id e10011)))
   [padding-bottom (px 0)])
  ((or (and (tag h1) (class a-spacing-none)) (and (tag h2) (class a-spacing-none)) (and (tag h3) (class a-spacing-none)) (and (tag h4) (class a-spacing-none)))
   [padding-bottom (px 0)])
  ((or (desc (and (tag h1)) (and (class a-size-base))) (desc (and (tag h1)) (and (class a-size-mini))) (desc (and (tag h1)) (and (class a-size-small))) (and (tag h1) (class a-size-base)) (and (tag h1) (class a-size-mini)) (and (tag h1) (class a-size-small)) (desc (and (tag h2)) (and (class a-size-base))) (desc (and (tag h2)) (and (class a-size-mini))) (desc (and (tag h2)) (and (class a-size-small))) (and (tag h2) (class a-size-base)) (and (tag h2) (class a-size-mini)) (and (tag h2) (class a-size-small)) (desc (and (tag h3)) (and (class a-size-base))) (desc (and (tag h3)) (and (class a-size-mini))) (desc (and (tag h3)) (and (class a-size-small))) (and (tag h3) (class a-size-base)) (and (tag h3) (class a-size-mini)) (and (tag h3) (class a-size-small)) (desc (and (tag h4)) (and (class a-size-base))) (desc (and (tag h4)) (and (class a-size-mini))) (desc (and (tag h4)) (and (class a-size-small))) (and (tag h4) (class a-size-base)) (and (tag h4) (class a-size-mini)) (and (tag h4) (class a-size-small)))
   [padding-bottom (px 0)]
   #;[font-family Arial,sans-serif])
  ((or (desc (and (class a-size-medium)) (and (class a-row) (class a-size-base))) (desc (and (tag h1)) (and (class a-row) (class a-size-base))) (desc (and (tag h2)) (and (class a-row) (class a-size-base))) (desc (and (tag h3)) (and (class a-row) (class a-size-base))) (desc (and (tag h4)) (and (class a-size-large)) (and (class a-row) (class a-size-base))))
   [padding-top (px 1)])
  ((desc (and (class a-size-base)) (and (class a-row) (class a-size-base)))
   [padding-top (px 0)])
  ((".a-box h4:last-child" (or))
   [padding-bottom (px 0)])
  ((and (tag h6))
   #;[font-weight 700]
   #;[text-transform uppercase]
   #;[font-size (px 11)]
   #;[line-height 1.465]
   [padding-bottom (px 1)])
  ((and (tag p))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 14)]
   [margin-left (px 0)])
  (("p:last-child" (or (id e10012)))
   [margin-bottom (px 0)])
  (("p + p" (or (id e10012)))
   [margin-top (px -4)])
  ((and (tag blockquote))
   [margin-top (px 13)]
   [margin-right (px 13)]
   [margin-bottom (px 13)]
   [margin-left (px 13)])
  ((and (class a-text-ellipsis))
   #;[text-overflow ellipsis]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[white-space nowrap]
   [display block])
  ((and (tag span) (class a-nowrap))
   [display block])
  ((and (class a-text-quote))
   [position relative]
   [display block]
   #;[font-family Georgia,serif]
   #;[font-size (px 14)]
   #;[line-height 1.5]
   #;[font-style italic])
  ((".a-text-quote::before" (or))
   #;[content "“"]
   [position absolute]
   [left (px -12)]
   [top (px -3)]
   #;[font-size (px 22)]
   #;[color rgb(118, 118, 118)])
  ((".a-text-quote::after" (or))
   #;[content "”"]
   [position absolute]
   [margin-top (px -3)]
   #;[font-size (px 22)]
   [margin-left (px 3)]
   #;[color rgb(118, 118, 118)])
  ((and (class a-text-beside-button))
   [display inline-block]
   [position relative]
   [top (px 1)]
   [padding-top (px 4)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 6)])
  ((and (class a-row))
   [width (% 100)])
  ((".a-row::after, .a-row::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  ((or (desc (and (class a-ws)) (and (tag div) (class a-column))) (and (tag div) (class a-column)))
   [margin-right (% 2)]
   [float left]
   #;[min-height (px 1)]
   [overflow-x visible]
   [overflow-y visible])
  ((or (and (tag td) (class a-span1)) (and (tag td) (class a-span10)) (and (tag td) (class a-span11)) (and (tag td) (class a-span12)) (and (tag td) (class a-span2)) (and (tag td) (class a-span3)) (and (tag td) (class a-span4)) (and (tag td) (class a-span5)) (and (tag td) (class a-span6)) (and (tag td) (class a-span7)) (and (tag td) (class a-span8)) (and (tag td) (class a-span9)) (and (tag th) (class a-span1)) (and (tag th) (class a-span10)) (and (tag th) (class a-span11)) (and (tag th) (class a-span12)) (and (tag th) (class a-span2)) (and (tag th) (class a-span3)) (and (tag th) (class a-span4)) (and (tag th) (class a-span5)) (and (tag th) (class a-span6)) (and (tag th) (class a-span7)) (and (tag th) (class a-span8)) (and (tag th) (class a-span9)))
   [float none]
   [margin-right (px 0)])
  ((desc (and (class a-span12)) (and (tag input)))
   [float none]
   [margin-right (px 0)])
  ((or (and (class a-pull1)) (and (class a-pull10)) (and (class a-pull11)) (and (class a-pull12)) (and (class a-pull2)) (and (class a-pull3)) (and (class a-pull4)) (and (class a-pull5)) (and (class a-pull6)) (and (class a-pull7)) (and (class a-pull8)) (and (class a-pull9)) (and (class a-push1)) (and (class a-push10)) (and (class a-push11)) (and (class a-push12)) (and (class a-push2)) (and (class a-push3)) (and (class a-push4)) (and (class a-push5)) (and (class a-push6)) (and (class a-push7)) (and (class a-push8)) (and (class a-push9)))
   [position relative])
  ((or (desc (and (class a-row)) (and (class a-span1))) (desc (and (class a-ws)) (and (class a-row)) (and (class a-ws-span1))))
   [width (% 6.45)])
  ((desc (and (class a-row)) (and (class a-push1)))
   [left (% 8.45)])
  ((desc (and (class a-row)) (and (class a-pull1)))
   [left (% -8.45)])
  ((or (and (tag td) (class a-span1)) (and (tag th) (class a-span1)))
   [width (% 8.7)]
   [float none])
  ((or (desc (and (class a-row)) (and (class a-span2))) (desc (and (class a-ws)) (and (class a-row)) (and (class a-ws-span2))))
   [width (% 14.95)])
  ((desc (and (class a-row)) (and (class a-push2)))
   [left (% 16.95)])
  ((desc (and (class a-row)) (and (class a-pull2)))
   [left (% -16.95)])
  ((or (and (tag td) (class a-span2)) (and (tag th) (class a-span2)))
   [width (% (/ 523 30))]
   [float none])
  ((or (desc (and (class a-row)) (and (class a-span3))) (desc (and (class a-ws)) (and (class a-row)) (and (class a-ws-span3))))
   [width (% 23.45)])
  ((desc (and (class a-row)) (and (class a-push3)))
   [left (% 25.45)])
  ((desc (and (class a-row)) (and (class a-pull3)))
   [left (% -25.45)])
  ((or (and (tag td) (class a-span3)) (and (tag th) (class a-span3)))
   [width (% (/ 314 12))]
   [float none])
  ((or (desc (and (class a-row)) (and (class a-span4))) (desc (and (class a-ws)) (and (class a-row)) (and (class a-ws-span4))))
   [width (% 31.95)])
  ((desc (and (class a-row)) (and (class a-push4)))
   [left (% 33.95)])
  ((desc (and (class a-row)) (and (class a-pull4)))
   [left (% -33.95)])
  ((or (and (tag td) (class a-span4)) (and (tag th) (class a-span4)))
   [width (% (/ 524 15))]
   [float none])
  ((or (desc (and (class a-row)) (and (class a-span5))) (desc (and (class a-ws)) (and (class a-row)) (and (class a-ws-span5))))
   [width (% 40.45)])
  ((desc (and (class a-row)) (and (class a-push5)))
   [left (% 42.45)])
  ((desc (and (class a-row)) (and (class a-pull5)))
   [left (% -42.45)])
  ((or (and (tag td) (class a-span5)) (and (tag th) (class a-span5)))
   [width (% 43.7)]
   [float none])
  ((or (desc (and (class a-row)) (and (class a-span6))) (desc (and (class a-ws)) (and (class a-row)) (and (class a-ws-span6))))
   [width (% 48.95)])
  ((desc (and (class a-row)) (and (class a-push6)))
   [left (% 50.95)])
  ((desc (and (class a-row)) (and (class a-pull6)))
   [left (% -50.95)])
  ((or (and (tag td) (class a-span6)) (and (tag th) (class a-span6)))
   [width (% (/ 1573 30))]
   [float none])
  ((or (desc (and (class a-row)) (and (class a-span7))) (desc (and (class a-ws)) (and (class a-row)) (and (class a-ws-span7))))
   [width (% 57.45)])
  ((desc (and (class a-row)) (and (class a-push7)))
   [left (% 59.45)])
  ((desc (and (class a-row)) (and (class a-pull7)))
   [left (% -59.45)])
  ((or (and (tag td) (class a-span7)) (and (tag th) (class a-span7)))
   [width (% (/ 734 12))]
   [float none])
  ((or (desc (and (class a-row)) (and (class a-span8))) (desc (and (class a-ws)) (and (class a-row)) (and (class a-ws-span8))))
   [width (% 65.95)])
  ((desc (and (class a-row)) (and (class a-push8)))
   [left (% 67.95)])
  ((desc (and (class a-row)) (and (class a-pull8)))
   [left (% -67.95)])
  ((or (and (tag td) (class a-span8)) (and (tag th) (class a-span8)))
   [width (% (/ 1049 15))]
   [float none])
  ((or (desc (and (class a-row)) (and (class a-span9))) (desc (and (class a-ws)) (and (class a-row)) (and (class a-ws-span9))))
   [width (% 74.45)])
  ((desc (and (class a-row)) (and (class a-push9)))
   [left (% 76.45)])
  ((desc (and (class a-row)) (and (class a-pull9)))
   [left (% -76.45)])
  ((or (and (tag td) (class a-span9)) (and (tag th) (class a-span9)))
   [width (% 78.7)]
   [float none])
  ((or (desc (and (class a-row)) (and (class a-span10))) (desc (and (class a-ws)) (and (class a-row)) (and (class a-ws-span10))))
   [width (% 82.95)])
  ((desc (and (class a-row)) (and (class a-push10)))
   [left (% 84.95)])
  ((desc (and (class a-row)) (and (class a-pull10)))
   [left (% -84.95)])
  ((or (and (tag td) (class a-span10)) (and (tag th) (class a-span10)))
   [width (% (/ 2623 30))]
   [float none])
  ((or (desc (and (class a-row)) (and (class a-span11))) (desc (and (class a-ws)) (and (class a-row)) (and (class a-ws-span11))))
   [width (% 91.45)])
  ((desc (and (class a-row)) (and (class a-push11)))
   [left (% 93.45)])
  ((desc (and (class a-row)) (and (class a-pull11)))
   [left (% -93.45)])
  ((or (and (tag td) (class a-span11)) (and (tag th) (class a-span11)))
   [width (% (/ 1154 12))]
   [float none])
  ((or (desc (and (class a-row)) (and (class a-span12))) (desc (and (class a-ws)) (and (class a-row)) (and (class a-ws-span12))))
   [width (% 99.95)])
  ((desc (and (class a-row)) (and (class a-push12)))
   [left (% 101.95)])
  ((desc (and (class a-row)) (and (class a-pull12)))
   [left (% -101.95)])
  ((or (and (tag td) (class a-span12)) (and (tag th) (class a-span12)))
   [width (% (/ 1574 15))]
   [float none])
  ((and (class a-column) (class a-span-last))
   [margin-right (px 0)]
   [float right])
  ((or (desc (and (class a-row)) (and (class a-span12))) (and (class a-span12)) (desc (and (class a-ws)) (and (class a-row)) (and (class a-ws-span12))) (desc (and (class a-ws)) (and (class a-ws-span12))))
   [width (% 100)]
   [margin-right (px 0)])
  ((desc (and (class a-row)) (and (class a-right)))
   [float right]
   [margin-left (% 2)]
   [margin-right (px 0)])
  ((child (desc (and (class a-ws)) (and (class a-ws-row))) (and (class a-column) (class a-span-last)))
   [float left]
   [margin-right (% 2)])
  ((or (desc (and (class a-ws)) (and (class a-ws-span12))) (and (tag div) (class a-column) (class a-span-last)))
   [margin-right (px 0)]
   [float right])
  ((or (desc (and (class a-ws)) (and (class a-ws-row)) (and (class a-ws-span-last))) (desc (and (class a-ws)) (and (class a-ws-span-last))))
   [margin-right (px 0)]
   [float right])
  ((and (class a-fixed-right-grid))
   [position relative])
  ((desc (and (class a-fixed-right-grid)) (and (class a-fixed-right-grid-inner)))
   [position relative]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((".a-fixed-right-grid .a-fixed-right-grid-inner::after, .a-fixed-right-grid .a-fixed-right-grid-inner::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  ((desc (and (class a-fixed-right-grid)) (and (class a-fixed-right-grid-col)))
   [position relative]
   [overflow-x visible]
   [overflow-y visible]
   #;[min-height (px 1)])
  ((desc (and (class a-fixed-right-grid)) (and (class a-col-left)))
   [width (% 100)]
   [padding-right (% 3.5)])
  ((or (desc (and (class a-fixed-right-grid)) (and (class a-fixed-left-flipped-grid)) (and (class a-col-left))) (desc (and (class a-fixed-right-grid)) (and (class a-fixed-left-grid)) (and (class a-col-left))))
   [padding-right (px 0)])
  ((and (class a-fixed-left-grid))
   [position relative])
  ((desc (and (class a-fixed-left-grid)) (and (class a-fixed-left-grid-inner)))
   [position relative]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((".a-fixed-left-grid .a-fixed-left-grid-inner::after, .a-fixed-left-grid .a-fixed-left-grid-inner::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  ((desc (and (class a-fixed-left-grid)) (and (class a-fixed-left-grid-col)))
   [position relative]
   [overflow-x visible]
   [overflow-y visible]
   #;[min-height (px 1)])
  ((desc (and (class a-fixed-left-grid)) (and (class a-col-right)))
   [width (% 100)]
   [padding-left (% 3.5)])
  ((or (desc (and (class a-fixed-left-grid)) (and (class a-fixed-right-flipped-grid)) (and (class a-col-right))) (desc (and (class a-fixed-left-grid)) (and (class a-fixed-right-grid)) (and (class a-col-right))))
   [padding-left (px 0)])
  ((desc (and (class a-fixed-right-flipped-grid)) (and (class a-col-left)))
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class a-container))
   #;[min-width (px 998)]
   [padding-top (px 14)]
   [padding-right (px 18)]
   [padding-bottom (px 18)]
   [padding-left (px 18)]
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto])
  ((or (desc (and (class a-span4)) (and (tag div) (class a-span1))) (desc (and (class a-ws)) (and (class a-span4)) (and (class a-ws-row)) (and (class a-ws-span1))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (class a-ws-row)) (and (class a-ws-span1))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (tag div) (class a-span1))))
   [width (% (/ 38 15))])
  ((or (desc (and (class a-span5)) (and (tag div) (class a-span1))) (desc (and (class a-ws)) (and (class a-span5)) (and (class a-ws-row)) (and (class a-ws-span1))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (class a-ws-row)) (and (class a-ws-span1))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (tag div) (class a-span1))))
   [width (% 3.5)])
  ((or (desc (and (class a-span6)) (and (tag div) (class a-span1))) (desc (and (class a-ws)) (and (class a-span6)) (and (class a-ws-row)) (and (class a-ws-span1))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (class a-ws-row)) (and (class a-ws-span1))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (tag div) (class a-span1))))
   [width (% (/ 139 30))])
  ((or (desc (and (class a-span7)) (and (tag div) (class a-span1))) (desc (and (class a-ws)) (and (class a-span7)) (and (class a-ws-row)) (and (class a-ws-span1))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (class a-ws-row)) (and (class a-ws-span1))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (tag div) (class a-span1))))
   [width (% (/ 61 12))])
  ((or (desc (and (class a-span8)) (and (tag div) (class a-span1))) (desc (and (class a-ws)) (and (class a-span8)) (and (class a-ws-row)) (and (class a-ws-span1))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (class a-ws-row)) (and (class a-ws-span1))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (tag div) (class a-span1))))
   [width (% (/ 83 15))])
  ((or (desc (and (class a-span9)) (and (tag div) (class a-span1))) (desc (and (class a-ws)) (and (class a-span9)) (and (class a-ws-row)) (and (class a-ws-span1))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (class a-ws-row)) (and (class a-ws-span1))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (tag div) (class a-span1))))
   [width (% (/ 70 12))])
  ((or (desc (and (class a-span10)) (and (tag div) (class a-span1))) (desc (and (class a-ws)) (and (class a-span10)) (and (class a-ws-row)) (and (class a-ws-span1))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (class a-ws-row)) (and (class a-ws-span1))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (tag div) (class a-span1))))
   [width (% (/ 73 12))])
  ((or (desc (and (class a-span4)) (and (tag div) (class a-span2))) (desc (and (class a-ws)) (and (class a-span4)) (and (class a-ws-row)) (and (class a-ws-span2))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (class a-ws-row)) (and (class a-ws-span2))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (tag div) (class a-span2))))
   [width (% 11.4)])
  ((or (desc (and (class a-span5)) (and (tag div) (class a-span2))) (desc (and (class a-ws)) (and (class a-span5)) (and (class a-ws-row)) (and (class a-ws-span2))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (class a-ws-row)) (and (class a-ws-span2))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (tag div) (class a-span2))))
   [width (% (/ 187 15))])
  ((or (desc (and (class a-span6)) (and (tag div) (class a-span2))) (desc (and (class a-ws)) (and (class a-span6)) (and (class a-ws-row)) (and (class a-ws-span2))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (class a-ws-row)) (and (class a-ws-span2))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (tag div) (class a-span2))))
   [width (% 13.3)])
  ((or (desc (and (class a-span7)) (and (tag div) (class a-span2))) (desc (and (class a-ws)) (and (class a-span7)) (and (class a-ws-row)) (and (class a-ws-span2))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (class a-ws-row)) (and (class a-ws-span2))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (tag div) (class a-span2))))
   [width (% 12.875)])
  ((or (desc (and (class a-span8)) (and (tag div) (class a-span2))) (desc (and (class a-ws)) (and (class a-span8)) (and (class a-ws-row)) (and (class a-ws-span2))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (class a-ws-row)) (and (class a-ws-span2))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (tag div) (class a-span2))))
   [width (% 14.1)])
  ((or (desc (and (class a-span9)) (and (tag div) (class a-span2))) (desc (and (class a-ws)) (and (class a-span9)) (and (class a-ws-row)) (and (class a-ws-span2))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (class a-ws-row)) (and (class a-ws-span2))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (tag div) (class a-span2))))
   [width (% (/ 431 30))])
  ((or (desc (and (class a-span10)) (and (tag div) (class a-span2))) (desc (and (class a-ws)) (and (class a-span10)) (and (class a-ws-row)) (and (class a-ws-span2))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (class a-ws-row)) (and (class a-ws-span2))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (tag div) (class a-span2))))
   [width (% (/ 219 15))])
  ((or (desc (and (class a-span4)) (and (tag div) (class a-span3))) (desc (and (class a-ws)) (and (class a-span4)) (and (class a-ws-row)) (and (class a-ws-span3))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (class a-ws-row)) (and (class a-ws-span3))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (tag div) (class a-span3))))
   [width (% 20.25)])
  ((or (desc (and (class a-span5)) (and (tag div) (class a-span3))) (desc (and (class a-ws)) (and (class a-span5)) (and (class a-ws-row)) (and (class a-ws-span3))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (class a-ws-row)) (and (class a-ws-span3))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (tag div) (class a-span3))))
   [width (% (/ 637 30))])
  ((or (desc (and (class a-span6)) (and (tag div) (class a-span3))) (desc (and (class a-ws)) (and (class a-span6)) (and (class a-ws-row)) (and (class a-ws-span3))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (class a-ws-row)) (and (class a-ws-span3))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (tag div) (class a-span3))))
   [width (% (/ 659 30))])
  ((or (desc (and (class a-span7)) (and (tag div) (class a-span3))) (desc (and (class a-ws)) (and (class a-span7)) (and (class a-ws-row)) (and (class a-ws-span3))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (class a-ws-row)) (and (class a-ws-span3))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (tag div) (class a-span3))))
   [width (% (/ 67 3))])
  ((or (desc (and (class a-span8)) (and (tag div) (class a-span3))) (desc (and (class a-ws)) (and (class a-span8)) (and (class a-ws-row)) (and (class a-ws-span3))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (class a-ws-row)) (and (class a-ws-span3))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (tag div) (class a-span3))))
   [width (% 22.7)])
  ((or (desc (and (class a-span9)) (and (tag div) (class a-span3))) (desc (and (class a-ws)) (and (class a-span9)) (and (class a-ws-row)) (and (class a-ws-span3))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (class a-ws-row)) (and (class a-ws-span3))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (tag div) (class a-span3))))
   [width (% (/ 344 15))])
  ((or (desc (and (class a-span10)) (and (tag div) (class a-span3))) (desc (and (class a-ws)) (and (class a-span10)) (and (class a-ws-row)) (and (class a-ws-span3))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (class a-ws-row)) (and (class a-ws-span3))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (tag div) (class a-span3))))
   [width (% 23.15)])
  ((or (desc (and (class a-span4)) (and (tag div) (class a-span4))) (desc (and (class a-ws)) (and (class a-span4)) (and (class a-ws-row)) (and (class a-ws-span4))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (class a-ws-row)) (and (class a-ws-span4))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (tag div) (class a-span4))))
   [width (% 29.1)])
  ((or (desc (and (class a-span5)) (and (tag div) (class a-span4))) (desc (and (class a-ws)) (and (class a-span5)) (and (class a-ws-row)) (and (class a-ws-span4))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (class a-ws-row)) (and (class a-ws-span4))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (tag div) (class a-span4))))
   [width (% (/ 899 30))])
  ((or (desc (and (class a-span6)) (and (tag div) (class a-span4))) (desc (and (class a-ws)) (and (class a-span6)) (and (class a-ws-row)) (and (class a-ws-span4))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (class a-ws-row)) (and (class a-ws-span4))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (tag div) (class a-span4))))
   [width (% (/ 919 30))])
  ((or (desc (and (class a-span7)) (and (tag div) (class a-span4))) (desc (and (class a-ws)) (and (class a-span7)) (and (class a-ws-row)) (and (class a-ws-span4))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (class a-ws-row)) (and (class a-ws-span4))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (tag div) (class a-span4))))
   [width (% (/ 929 30))])
  ((or (desc (and (class a-span8)) (and (tag div) (class a-span4))) (desc (and (class a-ws)) (and (class a-span8)) (and (class a-ws-row)) (and (class a-ws-span4))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (class a-ws-row)) (and (class a-ws-span4))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (tag div) (class a-span4))))
   [width (% 29.375)])
  ((or (desc (and (class a-span9)) (and (tag div) (class a-span4))) (desc (and (class a-ws)) (and (class a-span9)) (and (class a-ws-row)) (and (class a-ws-span4))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (class a-ws-row)) (and (class a-ws-span4))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (tag div) (class a-span4))))
   [width (% (/ 945 30))])
  ((or (desc (and (class a-span10)) (and (tag div) (class a-span4))) (desc (and (class a-ws)) (and (class a-span10)) (and (class a-ws-row)) (and (class a-ws-span4))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (class a-ws-row)) (and (class a-ws-span4))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (tag div) (class a-span4))))
   [width (% 31.7)])
  ((or (desc (and (class a-span4)) (and (tag div) (class a-span5))) (desc (and (class a-ws)) (and (class a-span4)) (and (class a-ws-row)) (and (class a-ws-span5))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (class a-ws-row)) (and (class a-ws-span5))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (tag div) (class a-span5))))
   [width (% (/ 1139 30))])
  ((or (desc (and (class a-span5)) (and (tag div) (class a-span5))) (desc (and (class a-ws)) (and (class a-span5)) (and (class a-ws-row)) (and (class a-ws-span5))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (class a-ws-row)) (and (class a-ws-span5))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (tag div) (class a-span5))))
   [width (% 36.25)])
  ((or (desc (and (class a-span6)) (and (tag div) (class a-span5))) (desc (and (class a-ws)) (and (class a-span6)) (and (class a-ws-row)) (and (class a-ws-span5))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (class a-ws-row)) (and (class a-ws-span5))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (tag div) (class a-span5))))
   [width (% 39.3)])
  ((or (desc (and (class a-span7)) (and (tag div) (class a-span5))) (desc (and (class a-ws)) (and (class a-span7)) (and (class a-ws-row)) (and (class a-ws-span5))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (class a-ws-row)) (and (class a-ws-span5))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (tag div) (class a-span5))))
   [width (% (/ 475 12))])
  ((or (desc (and (class a-span8)) (and (tag div) (class a-span5))) (desc (and (class a-ws)) (and (class a-span8)) (and (class a-ws-row)) (and (class a-ws-span5))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (class a-ws-row)) (and (class a-ws-span5))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (tag div) (class a-span5))))
   [width (% (/ 598 15))])
  ((or (desc (and (class a-span9)) (and (tag div) (class a-span5))) (desc (and (class a-ws)) (and (class a-span9)) (and (class a-ws-row)) (and (class a-ws-span5))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (class a-ws-row)) (and (class a-ws-span5))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (tag div) (class a-span5))))
   [width (% 40.05)])
  ((or (desc (and (class a-span10)) (and (tag div) (class a-span5))) (desc (and (class a-ws)) (and (class a-span10)) (and (class a-ws-row)) (and (class a-ws-span5))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (class a-ws-row)) (and (class a-ws-span5))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (tag div) (class a-span5))))
   [width (% (/ 1207 30))])
  ((or (desc (and (class a-span4)) (and (tag div) (class a-span6))) (desc (and (class a-ws)) (and (class a-span4)) (and (class a-ws-row)) (and (class a-ws-span6))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (class a-ws-row)) (and (class a-ws-span6))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (tag div) (class a-span6))))
   [width (% (/ 281 6))])
  ((or (desc (and (class a-span5)) (and (tag div) (class a-span6))) (desc (and (class a-ws)) (and (class a-span5)) (and (class a-ws-row)) (and (class a-ws-span6))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (class a-ws-row)) (and (class a-ws-span6))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (tag div) (class a-span6))))
   [width (% (/ 712 15))])
  ((or (desc (and (class a-span6)) (and (tag div) (class a-span6))) (desc (and (class a-ws)) (and (class a-span6)) (and (class a-ws-row)) (and (class a-ws-span6))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (class a-ws-row)) (and (class a-ws-span6))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (tag div) (class a-span6))))
   [width (% (/ 1439 30))])
  ((or (desc (and (class a-span7)) (and (tag div) (class a-span6))) (desc (and (class a-ws)) (and (class a-span7)) (and (class a-ws-row)) (and (class a-ws-span6))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (class a-ws-row)) (and (class a-ws-span6))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (tag div) (class a-span6))))
   [width (% (/ 1446 30))])
  ((or (desc (and (class a-span8)) (and (tag div) (class a-span6))) (desc (and (class a-ws)) (and (class a-span8)) (and (class a-ws-row)) (and (class a-ws-span6))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (class a-ws-row)) (and (class a-ws-span6))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (tag div) (class a-span6))))
   [width (% 48.45)])
  ((or (desc (and (class a-span9)) (and (tag div) (class a-span6))) (desc (and (class a-ws)) (and (class a-span9)) (and (class a-ws-row)) (and (class a-ws-span6))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (class a-ws-row)) (and (class a-ws-span6))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (tag div) (class a-span6))))
   [width (% 48.6)])
  ((or (desc (and (class a-span10)) (and (tag div) (class a-span6))) (desc (and (class a-ws)) (and (class a-span10)) (and (class a-ws-row)) (and (class a-ws-span6))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (class a-ws-row)) (and (class a-ws-span6))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (tag div) (class a-span6))))
   [width (% 48.75)])
  ((or (desc (and (class a-span4)) (and (tag div) (class a-span7))) (desc (and (class a-ws)) (and (class a-span4)) (and (class a-ws-row)) (and (class a-ws-span7))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (class a-ws-row)) (and (class a-ws-span7))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (tag div) (class a-span7))))
   [width (% 55.7)])
  ((or (desc (and (class a-span5)) (and (tag div) (class a-span7))) (desc (and (class a-ws)) (and (class a-span5)) (and (class a-ws-row)) (and (class a-ws-span7))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (class a-ws-row)) (and (class a-ws-span7))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (tag div) (class a-span7))))
   [width (% (/ 1687 30))])
  ((or (desc (and (class a-span6)) (and (tag div) (class a-span7))) (desc (and (class a-ws)) (and (class a-span6)) (and (class a-ws-row)) (and (class a-ws-span7))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (class a-ws-row)) (and (class a-ws-span7))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (tag div) (class a-span7))))
   [width (% (/ 1699 30))])
  ((or (desc (and (class a-span7)) (and (tag div) (class a-span7))) (desc (and (class a-ws)) (and (class a-span7)) (and (class a-ws-row)) (and (class a-ws-span7))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (class a-ws-row)) (and (class a-ws-span7))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (tag div) (class a-span7))))
   [width (% (/ 341 6))])
  ((or (desc (and (class a-span8)) (and (tag div) (class a-span7))) (desc (and (class a-ws)) (and (class a-span8)) (and (class a-ws-row)) (and (class a-ws-span7))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (class a-ws-row)) (and (class a-ws-span7))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (tag div) (class a-span7))))
   [width (% (/ 1711 30))])
  ((or (desc (and (class a-span9)) (and (tag div) (class a-span7))) (desc (and (class a-ws)) (and (class a-span9)) (and (class a-ws-row)) (and (class a-ws-span7))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (class a-ws-row)) (and (class a-ws-span7))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (tag div) (class a-span7))))
   [width (% (/ 343 6))])
  ((or (desc (and (class a-span10)) (and (tag div) (class a-span7))) (desc (and (class a-ws)) (and (class a-span10)) (and (class a-ws-row)) (and (class a-ws-span7))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (class a-ws-row)) (and (class a-ws-span7))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (tag div) (class a-span7))))
   [width (% 53.75)])
  ((or (desc (and (class a-span4)) (and (tag div) (class a-span8))) (desc (and (class a-ws)) (and (class a-span4)) (and (class a-ws-row)) (and (class a-ws-span8))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (class a-ws-row)) (and (class a-ws-span8))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (tag div) (class a-span8))))
   [width (% 64.55)])
  ((or (desc (and (class a-span5)) (and (tag div) (class a-span8))) (desc (and (class a-ws)) (and (class a-span5)) (and (class a-ws-row)) (and (class a-ws-span8))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (class a-ws-row)) (and (class a-ws-span8))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (tag div) (class a-span8))))
   [width (% (/ 1949 30))])
  ((or (desc (and (class a-span6)) (and (tag div) (class a-span8))) (desc (and (class a-ws)) (and (class a-span6)) (and (class a-ws-row)) (and (class a-ws-span8))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (class a-ws-row)) (and (class a-ws-span8))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (tag div) (class a-span8))))
   [width (% 65.3)])
  ((or (desc (and (class a-span7)) (and (tag div) (class a-span8))) (desc (and (class a-ws)) (and (class a-span7)) (and (class a-ws-row)) (and (class a-ws-span8))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (class a-ws-row)) (and (class a-ws-span8))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (tag div) (class a-span8))))
   [width (% (/ 982 15))])
  ((or (desc (and (class a-span8)) (and (tag div) (class a-span8))) (desc (and (class a-ws)) (and (class a-span8)) (and (class a-ws-row)) (and (class a-ws-span8))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (class a-ws-row)) (and (class a-ws-span8))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (tag div) (class a-span8))))
   [width (% (/ 984 15))])
  ((or (desc (and (class a-span9)) (and (tag div) (class a-span8))) (desc (and (class a-ws)) (and (class a-span9)) (and (class a-ws-row)) (and (class a-ws-span8))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (class a-ws-row)) (and (class a-ws-span8))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (tag div) (class a-span8))))
   [width (% 61.625)])
  ((or (desc (and (class a-span10)) (and (tag div) (class a-span8))) (desc (and (class a-ws)) (and (class a-span10)) (and (class a-ws-row)) (and (class a-ws-span8))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (class a-ws-row)) (and (class a-ws-span8))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (tag div) (class a-span8))))
   [width (% (/ 790 12))])
  ((or (desc (and (class a-span4)) (and (tag div) (class a-span9))) (desc (and (class a-ws)) (and (class a-span4)) (and (class a-ws-row)) (and (class a-ws-span9))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (class a-ws-row)) (and (class a-ws-span9))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (tag div) (class a-span9))))
   [width (% 73.4)])
  ((or (desc (and (class a-span5)) (and (tag div) (class a-span9))) (desc (and (class a-ws)) (and (class a-span5)) (and (class a-ws-row)) (and (class a-ws-span9))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (class a-ws-row)) (and (class a-ws-span9))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (tag div) (class a-span9))))
   [width (% 69.125)])
  ((or (desc (and (class a-span6)) (and (tag div) (class a-span9))) (desc (and (class a-ws)) (and (class a-span6)) (and (class a-ws-row)) (and (class a-ws-span9))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (class a-ws-row)) (and (class a-ws-span9))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (tag div) (class a-span9))))
   [width (% (/ 2219 30))])
  ((or (desc (and (class a-span7)) (and (tag div) (class a-span9))) (desc (and (class a-ws)) (and (class a-span7)) (and (class a-ws-row)) (and (class a-ws-span9))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (class a-ws-row)) (and (class a-ws-span9))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (tag div) (class a-span9))))
   [width (% (/ 889 12))])
  ((or (desc (and (class a-span8)) (and (tag div) (class a-span9))) (desc (and (class a-ws)) (and (class a-span8)) (and (class a-ws-row)) (and (class a-ws-span9))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (class a-ws-row)) (and (class a-ws-span9))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (tag div) (class a-span9))))
   [width (% 74.2)])
  ((or (desc (and (class a-span9)) (and (tag div) (class a-span9))) (desc (and (class a-ws)) (and (class a-span9)) (and (class a-ws-row)) (and (class a-ws-span9))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (class a-ws-row)) (and (class a-ws-span9))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (tag div) (class a-span9))))
   [width (% 69.625)])
  ((or (desc (and (class a-span10)) (and (tag div) (class a-span9))) (desc (and (class a-ws)) (and (class a-span10)) (and (class a-ws-row)) (and (class a-ws-span9))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (class a-ws-row)) (and (class a-ws-span9))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (tag div) (class a-span9))))
   [width (% 74.35)])
  ((or (desc (and (class a-span4)) (and (tag div) (class a-span10))) (desc (and (class a-ws)) (and (class a-span4)) (and (class a-ws-row)) (and (class a-ws-span10))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (class a-ws-row)) (and (class a-ws-span10))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (tag div) (class a-span10))))
   [width (% (/ 1234 15))])
  ((or (desc (and (class a-span5)) (and (tag div) (class a-span10))) (desc (and (class a-ws)) (and (class a-span5)) (and (class a-ws-row)) (and (class a-ws-span10))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (class a-ws-row)) (and (class a-ws-span10))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (tag div) (class a-span10))))
   [width (% (/ 1237 15))])
  ((or (desc (and (class a-span6)) (and (tag div) (class a-span10))) (desc (and (class a-ws)) (and (class a-span6)) (and (class a-ws-row)) (and (class a-ws-span10))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (class a-ws-row)) (and (class a-ws-span10))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (tag div) (class a-span10))))
   [width (% (/ 2479 30))])
  ((or (desc (and (class a-span7)) (and (tag div) (class a-span10))) (desc (and (class a-ws)) (and (class a-span7)) (and (class a-ws-row)) (and (class a-ws-span10))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (class a-ws-row)) (and (class a-ws-span10))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (tag div) (class a-span10))))
   [width (% 77.5)])
  ((or (desc (and (class a-span8)) (and (tag div) (class a-span10))) (desc (and (class a-ws)) (and (class a-span8)) (and (class a-ws-row)) (and (class a-ws-span10))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (class a-ws-row)) (and (class a-ws-span10))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (tag div) (class a-span10))))
   [width (% (/ 2484 30))])
  ((or (desc (and (class a-span9)) (and (tag div) (class a-span10))) (desc (and (class a-ws)) (and (class a-span9)) (and (class a-ws-row)) (and (class a-ws-span10))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (class a-ws-row)) (and (class a-ws-span10))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (tag div) (class a-span10))))
   [width (% (/ 497 6))])
  ((or (desc (and (class a-span10)) (and (tag div) (class a-span10))) (desc (and (class a-ws)) (and (class a-span10)) (and (class a-ws-row)) (and (class a-ws-span10))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (class a-ws-row)) (and (class a-ws-span10))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (tag div) (class a-span10))))
   [width (% 82.9)])
  ((or (desc (and (class a-span4)) (and (tag div) (class a-span11))) (desc (and (class a-ws)) (and (class a-span4)) (and (class a-ws-row)) (and (class a-ws-span11))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (class a-ws-row)) (and (class a-ws-span11))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (tag div) (class a-span11))))
   [width (% 91.1)])
  ((or (desc (and (class a-span5)) (and (tag div) (class a-span11))) (desc (and (class a-ws)) (and (class a-span5)) (and (class a-ws-row)) (and (class a-ws-span11))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (class a-ws-row)) (and (class a-ws-span11))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (tag div) (class a-span11))))
   [width (% (/ 2737 30))])
  ((or (desc (and (class a-span6)) (and (tag div) (class a-span11))) (desc (and (class a-ws)) (and (class a-span6)) (and (class a-ws-row)) (and (class a-ws-span11))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (class a-ws-row)) (and (class a-ws-span11))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (tag div) (class a-span11))))
   [width (% 91.3)])
  ((or (desc (and (class a-span7)) (and (tag div) (class a-span11))) (desc (and (class a-ws)) (and (class a-span7)) (and (class a-ws-row)) (and (class a-ws-span11))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (class a-ws-row)) (and (class a-ws-span11))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (tag div) (class a-span11))))
   [width (% (/ 274 3))])
  ((or (desc (and (class a-span8)) (and (tag div) (class a-span11))) (desc (and (class a-ws)) (and (class a-span8)) (and (class a-ws-row)) (and (class a-ws-span11))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (class a-ws-row)) (and (class a-ws-span11))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (tag div) (class a-span11))))
   [width (% (/ 2741 30))])
  ((or (desc (and (class a-span9)) (and (tag div) (class a-span11))) (desc (and (class a-ws)) (and (class a-span9)) (and (class a-ws-row)) (and (class a-ws-span11))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (class a-ws-row)) (and (class a-ws-span11))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (tag div) (class a-span11))))
   [width (% 91.4)])
  ((or (desc (and (class a-span10)) (and (tag div) (class a-span11))) (desc (and (class a-ws)) (and (class a-span10)) (and (class a-ws-row)) (and (class a-ws-span11))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (class a-ws-row)) (and (class a-ws-span11))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (tag div) (class a-span11))))
   [width (% (/ 1097 12))])
  ((or (desc (and (class a-span4)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-span4)) (and (class a-ws-row)) (and (class a-ws-span12))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (class a-ws-row)) (and (class a-ws-span12))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (tag div) (class a-span12))))
   [width (% 102)])
  ((or (desc (and (class a-span5)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-span5)) (and (class a-ws-row)) (and (class a-ws-span12))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (class a-ws-row)) (and (class a-ws-span12))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (tag div) (class a-span12))))
   [width (% (/ 2999 30))])
  ((or (desc (and (class a-span6)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-span6)) (and (class a-ws-row)) (and (class a-ws-span12))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (class a-ws-row)) (and (class a-ws-span12))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (tag div) (class a-span12))))
   [width (% (/ 2999 30))])
  ((or (desc (and (class a-span7)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-span7)) (and (class a-ws-row)) (and (class a-ws-span12))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (class a-ws-row)) (and (class a-ws-span12))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (tag div) (class a-span12))))
   [width (% (/ 2999 30))])
  ((or (desc (and (class a-span8)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-span8)) (and (class a-ws-row)) (and (class a-ws-span12))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (class a-ws-row)) (and (class a-ws-span12))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (tag div) (class a-span12))))
   [width (% 99.95)])
  ((or (desc (and (class a-span9)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-span9)) (and (class a-ws-row)) (and (class a-ws-span12))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (class a-ws-row)) (and (class a-ws-span12))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (tag div) (class a-span12))))
   [width (% 99.95)])
  ((or (desc (and (class a-span10)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-span10)) (and (class a-ws-row)) (and (class a-ws-span12))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (class a-ws-row)) (and (class a-ws-span12))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (tag div) (class a-span12))))
   [width (% 99.95)])
  ((or (desc (and (class a-span4)) (and (class a-column))) (desc (and (class a-ws)) (and (class a-span4)) (and (class a-column))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (class a-column))))
   [margin-right (% 6.3)]
   [float left]
   #;[min-height (px 1)])
  ((or (desc (and (class a-span4)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-span4)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (tag div) (class a-span12))))
   [margin-right (px 0)])
  ((or (desc (and (class a-span4)) (and (tag div) (class a-span-last))) (desc (and (class a-ws)) (and (class a-span4)) (and (tag div) (class a-span-last))) (desc (and (class a-ws)) (and (class a-ws-span4)) (and (tag div) (class a-span-last))))
   [margin-right (px 0)]
   [float right])
  ((or (desc (and (class a-span5)) (and (class a-column))) (desc (and (class a-ws)) (and (class a-span5)) (and (class a-column))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (class a-column))))
   [margin-right (% 5)]
   [float left]
   #;[min-height (px 1)])
  ((or (desc (and (class a-span5)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-span5)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (tag div) (class a-span12))))
   [margin-right (px 0)])
  ((or (desc (and (class a-span5)) (and (tag div) (class a-span-last))) (desc (and (class a-ws)) (and (class a-span5)) (and (tag div) (class a-span-last))) (desc (and (class a-ws)) (and (class a-ws-span5)) (and (tag div) (class a-span-last))))
   [margin-right (px 0)]
   [float right])
  ((or (desc (and (class a-span6)) (and (class a-column))) (desc (and (class a-ws)) (and (class a-span6)) (and (class a-column))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (class a-column))))
   [margin-right (% 4)]
   [float left]
   #;[min-height (px 1)])
  ((or (desc (and (class a-span6)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-span6)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (tag div) (class a-span12))))
   [margin-right (px 0)])
  ((or (desc (and (class a-span6)) (and (tag div) (class a-span-last))) (desc (and (class a-ws)) (and (class a-span6)) (and (tag div) (class a-span-last))) (desc (and (class a-ws)) (and (class a-ws-span6)) (and (tag div) (class a-span-last))))
   [margin-right (px 0)]
   [float right])
  ((or (desc (and (class a-span7)) (and (class a-column))) (desc (and (class a-ws)) (and (class a-span7)) (and (class a-column))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (class a-column))))
   [margin-right (% 3.5)]
   [float left]
   #;[min-height (px 1)])
  ((or (desc (and (class a-span7)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-span7)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (tag div) (class a-span12))))
   [margin-right (px 0)])
  ((or (desc (and (class a-span7)) (and (tag div) (class a-span-last))) (desc (and (class a-ws)) (and (class a-span7)) (and (tag div) (class a-span-last))) (desc (and (class a-ws)) (and (class a-ws-span7)) (and (tag div) (class a-span-last))))
   [margin-right (px 0)]
   [float right])
  ((or (desc (and (class a-span8)) (and (class a-column))) (desc (and (class a-ws)) (and (class a-span8)) (and (class a-column))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (class a-column))))
   [margin-right (% 3)]
   [float left]
   #;[min-height (px 1)])
  ((or (desc (and (class a-span8)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-span8)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (tag div) (class a-span12))))
   [margin-right (px 0)])
  ((or (desc (and (class a-span8)) (and (tag div) (class a-span-last))) (desc (and (class a-ws)) (and (class a-span8)) (and (tag div) (class a-span-last))) (desc (and (class a-ws)) (and (class a-ws-span8)) (and (tag div) (class a-span-last))))
   [margin-right (px 0)]
   [float right])
  ((or (desc (and (class a-span9)) (and (class a-column))) (desc (and (class a-ws)) (and (class a-span9)) (and (class a-column))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (class a-column))))
   [margin-right (% 2.7)]
   [float left]
   #;[min-height (px 1)])
  ((or (desc (and (class a-span9)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-span9)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (tag div) (class a-span12))))
   [margin-right (px 0)])
  ((or (desc (and (class a-span9)) (and (tag div) (class a-span-last))) (desc (and (class a-ws)) (and (class a-span9)) (and (tag div) (class a-span-last))) (desc (and (class a-ws)) (and (class a-ws-span9)) (and (tag div) (class a-span-last))))
   [margin-right (px 0)]
   [float right])
  ((or (desc (and (class a-span10)) (and (class a-column))) (desc (and (class a-ws)) (and (class a-span10)) (and (class a-column))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (class a-column))))
   [margin-right (% 2.4)]
   [float left]
   #;[min-height (px 1)])
  ((or (desc (and (class a-span10)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-span10)) (and (tag div) (class a-span12))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (tag div) (class a-span12))))
   [margin-right (px 0)])
  ((or (desc (and (class a-span10)) (and (tag div) (class a-span-last))) (desc (and (class a-ws)) (and (class a-span10)) (and (tag div) (class a-span-last))) (desc (and (class a-ws)) (and (class a-ws-span10)) (and (tag div) (class a-span-last))))
   [margin-right (px 0)]
   [float right])
  ((child (desc (and (class a-ws)) (and (class a-column)) (and (class a-ws-row))) (and (class a-span-last)))
   [float left])
  ((or (child (desc (and (class a-ws)) (and (class a-span4)) (and (class a-ws-row))) (and (class a-span-last))) (child (desc (and (class a-ws)) (and (class a-ws-span4)) (and (class a-ws-row))) (and (class a-span-last))))
   [margin-right (% 6.3)])
  ((or (child (desc (and (class a-ws)) (and (class a-span5)) (and (class a-ws-row))) (and (class a-span-last))) (child (desc (and (class a-ws)) (and (class a-ws-span5)) (and (class a-ws-row))) (and (class a-span-last))))
   [margin-right (% 5)])
  ((or (child (desc (and (class a-ws)) (and (class a-span6)) (and (class a-ws-row))) (and (class a-span-last))) (child (desc (and (class a-ws)) (and (class a-ws-span6)) (and (class a-ws-row))) (and (class a-span-last))))
   [margin-right (% 4)])
  ((or (child (desc (and (class a-ws)) (and (class a-span7)) (and (class a-ws-row))) (and (class a-span-last))) (child (desc (and (class a-ws)) (and (class a-ws-span7)) (and (class a-ws-row))) (and (class a-span-last))))
   [margin-right (% 3.5)])
  ((or (child (desc (and (class a-ws)) (and (class a-span8)) (and (class a-ws-row))) (and (class a-span-last))) (child (desc (and (class a-ws)) (and (class a-ws-span8)) (and (class a-ws-row))) (and (class a-span-last))))
   [margin-right (% 3)])
  ((or (child (desc (and (class a-ws)) (and (class a-span9)) (and (class a-ws-row))) (and (class a-span-last))) (child (desc (and (class a-ws)) (and (class a-ws-span9)) (and (class a-ws-row))) (and (class a-span-last))))
   [margin-right (% 2.7)])
  ((or (child (desc (and (class a-ws)) (and (class a-span10)) (and (class a-ws-row))) (and (class a-span-last))) (child (desc (and (class a-ws)) (and (class a-ws-span10)) (and (class a-ws-row))) (and (class a-span-last))))
   [margin-right (% 2.4)])
  ((and (class a-grid-vertical-align) (class a-row))
   [display table]
   #;[table-layout fixed]
   #;[border-collapse collapse])
  ((".a-grid-vertical-align.a-row::after, .a-grid-vertical-align.a-row::before" (or))
   [display none])
  ((child (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-column)))
   [float none]
   [display table-cell]
   [padding-right (px 14)])
  ((child (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-column) (class a-span-last)))
   [padding-right (px 0)])
  ((child (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-span1)))
   [width (% 8.7)])
  ((child (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-span2)))
   [width (% (/ 523 30))])
  ((child (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-span3)))
   [width (% (/ 314 12))])
  ((child (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-span4)))
   [width (% (/ 524 15))])
  ((child (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-span5)))
   [width (% 43.7)])
  ((child (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-span6)))
   [width (% (/ 1573 30))])
  ((child (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-span7)))
   [width (% (/ 734 12))])
  ((child (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-span8)))
   [width (% (/ 1049 15))])
  ((child (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-span9)))
   [width (% 78.7)])
  ((child (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-span10)))
   [width (% (/ 2623 30))])
  ((child (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-span11)))
   [width (% (/ 1154 12))])
  ((child (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-span12)))
   [width (% (/ 1574 15))])
  ((desc (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-span12)))
   [padding-right (px 0)])
  ((desc (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-width-micro)))
   [width (px 1)])
  ((desc (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-width-mini)))
   [width (px 49)])
  ((desc (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-width-small)))
   [width (px 91)])
  ((desc (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-width-base)))
   [width (px 127)])
  ((desc (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-width-medium)))
   [width (px 175)])
  ((desc (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-width-large)))
   [width (px 250)])
  ((desc (and (class a-grid-vertical-align) (class a-row)) (and (tag div) (class a-width-extra-large)))
   [width (px 400)])
  ((and (class a-button))
   #;[background-color rgb(231, 233, 236)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[border-top-color rgb(173, 177, 184)]
   #;[border-right-color rgb(162, 166, 172)]
   #;[border-bottom-color rgb(141, 144, 150)]
   #;[border-left-color rgb(162, 166, 172)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   #;[cursor pointer]
   [display inline-block]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [text-align center]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[vertical-align middle])
  ((desc (and (class a-button)) (and (class a-icon-menu)))
   [position absolute]
   [top (% 50)]
   [margin-top (px -6)]
   [left (% 50)]
   [margin-left (px -6)])
  ((and (class a-button-text))
   #;[background-color transparent]
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
   [display block]
   #;[font-family Arial,sans-serif]
   #;[font-size (px 13)]
   #;[line-height (px 29)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 11)]
   [text-align center]
   #;[white-space nowrap])
  ((or (and (tag a) (class a-button-text)) (and (tag button) (class a-button-text)))
   [width (% 100)]
   [height (% 100)])
  ((and (class a-button-inner))
   [display block]
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden]
   [height (px 29)]
   #;[box-shadow (px 0)]
   #;[border-top-left-radius (px 2)]
   #;[border-top-right-radius (px 2)]
   #;[border-bottom-right-radius (px 2)]
   #;[border-bottom-left-radius (px 2)])
  ((and (class a-button-input))
   [position absolute]
   #;[background-color rgb(255, 255, 255)]
   #;[color rgb(255, 255, 255)]
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
   [height (% 100)]
   [width (% 100)]
   [left (px 0)]
   [top (px 0)]
   #;[opacity 0.01]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   [overflow-x visible]
   [overflow-y visible]
   #;[z-index 20])
  ((and (class a-button-image))
   [height auto])
  ((desc (and (class a-button-image)) (and (class a-button-inner)))
   [padding-top (px 6)]
   [padding-right (px 6)]
   [padding-bottom (px 6)]
   [padding-left (px 6)]
   #;[line-height (px 0)]
   [height auto])
  ((desc (and (class a-button-image) (class a-button-small)) (and (class a-button-inner)))
   [height (px 33)])
  ((desc (and (class a-button-icon)) (and (class a-icon)))
   [position absolute])
  ((or (desc (and (class a-button-icon)) (and (class a-icon-1click))) (desc (and (class a-button-icon)) (and (class a-icon-buynow))) (desc (and (class a-button-icon)) (and (class a-icon-cart))) (desc (and (class a-button-icon)) (and (class a-icon-sns))))
   [top (px 2)]
   [left (px 2)])
  ((desc (and (class a-button-icon)) (and (class a-button-text)))
   [padding-left (px 35)]
   [position relative]
   #;[z-index 10])
  ((and (class a-button-stretch))
   [width (% 100)])
  ((and (class a-button-beside-text))
   [margin-top (px -3)])
  ((".a-button + .a-button" (or))
   [margin-left 0.385em])
  ((and (class a-button) (class a-button-small))
   [height (px 22)])
  ((desc (and (class a-button) (class a-button-small)) (and (class a-button-text)))
   #;[font-size (px 11)]
   [height (px 20)]
   #;[line-height (px 20)]
   [padding-top (px 0)]
   [padding-right (px 6)]
   [padding-bottom (px 0)]
   [padding-left (px 7)])
  ((".a-button.a-button-small .a-button-inner, .a-button.a-button-small.a-button-disabled .a-button-inner, .a-button.a-button-small.a-button-disabled.a-button-focus .a-button-inner, .a-button.a-button-small.a-button-disabled:active .a-button-inner, .a-button.a-button-small.a-button-disabled:focus .a-button-inner, .a-button.a-button-small.a-button-disabled:hover .a-button-inner, .a-button.a-button-small.a-button-focus .a-button-inner, .a-button.a-button-small.a-button-focus:active .a-button-inner, .a-button.a-button-small:active .a-button-inner, .a-button.a-button-small:focus .a-button-inner, .a-button.a-button-small:focus:active .a-button-inner, .a-button.a-button-small:hover .a-button-inner" (or))
   [height (px 20)])
  ((desc (and (class a-button-toggle)) (and (class a-button-inner)))
   #;[box-shadow (px 0)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   [height auto])
  ((desc (and (class a-button-toggle)) (and (class a-button-text)))
   #;[white-space normal]
   [text-align left]
   [padding-top (px 5)]
   [padding-right (px 10)]
   [padding-bottom (px 5)]
   [padding-left (px 11)]
   #;[line-height (px 19)])
  ((and (class a-button-toggle) (class a-button-selected))
   #;[background-color rgb(255, 255, 255)]
   [overflow-x visible]
   [overflow-y visible])
  ((or (and (class a-button-toggle) (class a-button-thumbnail) (class a-button-unavailable)) (and (class a-button-toggle) (class a-button-unavailable)))
   #;[border-top-color rgb(173, 177, 184)]
   #;[border-right-color rgb(162, 166, 172)]
   #;[border-bottom-color rgb(141, 144, 150)]
   #;[border-left-color rgb(162, 166, 172)]
   [border-top-style dashed]
   [border-right-style dashed]
   [border-bottom-style dashed]
   [border-left-style dashed])
  ((".a-button-toggle.a-button-thumbnail.a-button-unavailable:active, .a-button-toggle.a-button-unavailable:active" (or))
   #;[border-top-color rgb(140, 140, 140)]
   #;[border-right-color rgb(140, 140, 140)]
   #;[border-bottom-color rgb(140, 140, 140)]
   #;[border-left-color rgb(140, 140, 140)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid])
  ((and (class a-button-toggle) (class a-button-thumbnail))
   [height auto]
   [overflow-x visible]
   [overflow-y visible]
   #;[border-top-color rgb(162, 166, 172)]
   #;[border-right-color rgb(162, 166, 172)]
   #;[border-bottom-color rgb(162, 166, 172)]
   #;[border-left-color rgb(162, 166, 172)]
   #;[border-top-left-radius (px 2)]
   #;[border-top-right-radius (px 2)]
   #;[border-bottom-right-radius (px 2)]
   #;[border-bottom-left-radius (px 2)])
  ((desc (and (class a-button-toggle) (class a-button-thumbnail)) (and (class a-button-inner)))
   #;[border-top-left-radius (px 2)]
   #;[border-top-right-radius (px 2)]
   #;[border-bottom-right-radius (px 2)]
   #;[border-bottom-left-radius (px 2)]
   [height auto]
   [overflow-x hidden]
   [overflow-y hidden]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class a-button-toggle) (class a-button-thumbnail)) (and (class a-button-text)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class a-button-toggle) (class a-button-thumbnail)) (and (tag button) (class a-button-text)))
   [height auto])
  ((and (class a-button-toggle-section))
   [height auto])
  ((desc (and (class a-button-toggle-section)) (and (class a-button-inner)))
   [padding-top (px 14)]
   [padding-right (px 18)]
   [padding-bottom (px 14)]
   [padding-left (px 18)])
  ((".a-button-toggle-group::after, .a-button-toggle-group::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  ((desc (and (class a-button-dropdown)) (and (class a-button-text)))
   [padding-right (px 22)]
   [text-align left]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis]
   [position relative]
   #;[z-index 10])
  ((desc (and (class a-button-dropdown) (class a-button-small)) (and (class a-button-text)))
   [padding-right (px 17)])
  ((or (desc (and (class a-button-group)) (and (class a-button-dropdown))) (desc (and (class a-button-group)) (and (class a-button-splitdropdown))))
   [width (px 24)]
   #;[min-width (px 24)])
  ((desc (and (class a-button)) (and (class a-icon-dropdown)))
   [position absolute]
   [top (px 10)]
   [right (px 9)])
  ((desc (and (class a-button) (class a-button-small)) (and (class a-icon-dropdown)))
   [top (px 6)])
  ((desc (and (class a-button) (class a-button-small) (class a-button-dropdown)) (and (class a-icon-dropdown)))
   [right (px 6)])
  ((desc (and (class a-button-disabled)) (and (class a-button-input)))
   [display none])
  ((desc (and (class a-button-supplemental)) (and (class a-button-text)))
   [text-align left]
   #;[z-index 10]
   [padding-right (px 23)])
  ((desc (and (class a-button-supplemental)) (and (class a-icon-supplemental)))
   [position absolute]
   [top (% 50)]
   [right (px 9)]
   [margin-top (px -6)])
  ((and (class a-button-span1))
   [width (% 8)])
  ((and (class a-button-span2))
   [width (% 17)])
  ((and (class a-button-span3))
   [width (% 25)])
  ((and (class a-button-span4))
   [width (% 33)])
  ((and (class a-button-span5))
   [width (% 42)])
  ((and (class a-button-span6))
   [width (% 50)])
  ((and (class a-button-span7))
   [width (% 58)])
  ((and (class a-button-span8))
   [width (% 67)])
  ((and (class a-button-span9))
   [width (% 75)])
  ((and (class a-button-span10))
   [width (% 83)])
  ((and (class a-button-span11))
   [width (% 92)])
  ((and (class a-button-span12))
   [width (% 100)])
  ((and (class a-button-group))
   [display table]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   [position relative]
   #;[white-space nowrap])
  ((desc (and (class a-button-group)) (and (class a-button)))
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 0)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-top-color rgb(173, 177, 184)]
   #;[border-right-color rgb(162, 166, 172)]
   #;[border-bottom-color rgb(141, 144, 150)]
   #;[border-left-color rgb(162, 166, 172)]
   [border-left-width (px 0)]
   #;[vertical-align top]
   [display table-cell]
   [width auto])
  ((".a-button-group .a-button .a-button-group-first, .a-button-group .a-button:first-child" (or))
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 3)]
   [border-left-width (px 1)])
  ((desc (and (class a-button-group)) (and (class a-button-selected)))
   #;[border-top-color rgb(173, 178, 187)]
   #;[border-right-color rgb(186, 186, 186)]
   #;[border-bottom-color rgb(186, 186, 186)]
   #;[border-left-color rgb(186, 186, 186)]
   [position relative]
   [overflow-x visible]
   [overflow-y visible])
  ((desc (and (class a-text-center)) (and (class a-button-group)))
   [margin-left auto]
   [margin-right auto])
  ((desc (and (class a-button-stack)) (and (class a-button)))
   [margin-bottom (px 10)]
   [display block])
  ((".a-button-stack .a-button:last-child" (or))
   [margin-bottom (px 0)])
  ((desc (and (class a-button-stack)) (and (class a-button-list)) (and (class a-button)))
   [display inline-block])
  ((desc (and (class a-button-stack)) (and (class a-button-group)) (and (class a-button)))
   [margin-bottom (px 0)]
   [width auto])
  ((".a-button-stack .a-button + .a-button" (or))
   [margin-left (px 0)])
  ((desc (and (class a-button-stack)) (and (class a-button-group)))
   [width (% 100)])
  ((desc (and (class a-button-stack)) (and (class a-button-group)) (and (class a-button)))
   [display table-cell])
  ((desc (and (class a-button-stack)) (and (class a-button-toggle) (class a-button-thumbnail)))
   [display inline-block])
  ((or (and (class a-hidden)) (and (class aok-hidden)))
   [display none]
   #;[visibility hidden])
  ((and (class a-last))
   [margin-bottom (px 0)])
  ((or (and (class a-block)) (and (class aok-block)))
   [display block]
   [position relative])
  ((or (and (class a-inline-block)) (and (class aok-inline-block)))
   [display inline-block])
  ((or (and (class a-relative)) (and (class aok-relative)))
   [position relative])
  ((or (and (class a-spacing-none)) (desc (and (class a-ws)) (and (class a-ws-spacing-none))))
   [margin-bottom (px 0)])
  ((or (and (class a-spacing-micro)) (desc (and (class a-ws)) (and (class a-ws-spacing-micro))))
   [margin-bottom (px 4)])
  ((and (class a-spacing-top-micro))
   [margin-top (px 4)])
  ((or (and (class a-spacing-top-micro) (class a-button-stack)) (and (class a-spacing-top-micro) (class a-section)))
   [padding-top (px 4)]
   [margin-top (px 0)])
  ((or (and (class a-spacing-mini)) (desc (and (class a-ws)) (and (class a-ws-spacing-mini))))
   [margin-bottom (px 6)])
  ((and (class a-spacing-top-mini))
   [margin-top (px 6)])
  ((or (and (class a-spacing-top-mini) (class a-button-stack)) (and (class a-spacing-top-mini) (class a-section)))
   [padding-top (px 6)]
   [margin-top (px 0)])
  ((or (and (class a-spacing-small)) (desc (and (class a-ws)) (and (class a-ws-spacing-small))))
   [margin-bottom (px 10)])
  ((and (class a-spacing-top-small))
   [margin-top (px 10)])
  ((or (and (class a-spacing-base)) (desc (and (class a-ws)) (and (class a-ws-spacing-base))))
   [margin-bottom (px 14)])
  ((and (class a-spacing-top-base))
   [margin-top (px 14)])
  ((or (and (class a-spacing-medium)) (desc (and (class a-ws)) (and (class a-ws-spacing-medium))))
   [margin-bottom (px 18)])
  ((and (class a-spacing-top-medium))
   [margin-top (px 18)])
  ((or (and (class a-spacing-large)) (desc (and (class a-ws)) (and (class a-ws-spacing-large))))
   [margin-bottom (px 22)])
  ((and (class a-spacing-top-large))
   [margin-top (px 22)])
  ((or (and (class a-spacing-extra-large)) (desc (and (class a-ws)) (and (class a-ws-spacing-extra-large))))
   [margin-bottom (px 26)])
  ((and (class a-spacing-top-extra-large))
   [margin-top (px 26)])
  ((or (and (class a-spacing-double-large)) (desc (and (class a-ws)) (and (class a-ws-spacing-double-large))))
   [margin-bottom (px 44)])
  ((and (class a-spacing-top-double-large))
   [margin-top (px 44)])
  ((and (class a-spacing-block-top))
   [margin-top (px 4)])
  ((and (class a-spacing-block))
   [margin-top (px 4)]
   [margin-right (px 0)]
   [margin-bottom (px 4)]
   [margin-left (px 0)])
  ((and (class a-padding-none))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (class a-padding-mini))
   [padding-top (px 4)]
   [padding-right (px 6)]
   [padding-bottom (px 4)]
   [padding-left (px 6)])
  ((and (class a-padding-small))
   [padding-top (px 6)]
   [padding-right (px 10)]
   [padding-bottom (px 6)]
   [padding-left (px 10)])
  ((and (class a-padding-base))
   [padding-top (px 10)]
   [padding-right (px 14)]
   [padding-bottom (px 10)]
   [padding-left (px 14)])
  ((and (class a-padding-medium))
   [padding-top (px 14)]
   [padding-right (px 18)]
   [padding-bottom (px 14)]
   [padding-left (px 18)])
  ((and (class a-padding-large))
   [padding-top (px 18)]
   [padding-right (px 22)]
   [padding-bottom (px 18)]
   [padding-left (px 22)])
  ((and (class a-padding-double-large))
   [padding-top (px 44)]
   [padding-right (px 44)]
   [padding-bottom (px 44)]
   [padding-left (px 44)])
  ((and (class a-text-left))
   [text-align left])
  ((and (class a-text-center))
   [text-align center])
  ((and (class a-text-right))
   [text-align right])
  ((and (class a-width-micro))
   [width (px 1)])
  ((and (class a-width-mini))
   [width (px 35)])
  ((and (class a-width-small))
   [width (px 77)])
  ((and (class a-width-base))
   [width (px 113)])
  ((and (class a-width-medium))
   [width (px 175)])
  ((and (class a-width-large))
   [width (px 250)])
  ((and (class a-width-extra-large))
   [width (px 400)])
  ((and (class a-span-flex))
   [width auto])
  ((and (class a-span-small))
   [width (px 30)])
  ((and (class a-span-base))
   [width (px 56)])
  ((and (class a-span-medium))
   [width (px 72)])
  ((or (and (class a-float-right)) (and (class aok-float-right)))
   [float right])
  ((or (and (class a-float-left)) (and (class aok-float-left)))
   [float left])
  ((and (class a-section))
   [margin-bottom (px 22)])
  ((".a-section:last-child" (or (id pageContent) (id gw-desktop-herotator) (id hud-dashboard) (id e10013) (id e10014) (id e10015) (id e10016) (id e10017) (id e10018) (id e10019) (id scalable-image-map_scalable-image-map-ns_10ZP4QDJGM0MNW2K4ASK_6730_) (id scalable-image-map_scalable-image-map-ns_0WAZGCXEBZJ34NQ5YN93_194_) (id e10020) (id e10021) (id scalable-image-map_scalable-image-map-ns_1EHC7NQ22AVVYHYZBKRH_4171_) (id scalable-image-map_scalable-image-map-ns_0FWJ6V519EG7V6RS4CZZ_6651_) (id e10022) (id e10023) (id scalable-image-map_scalable-image-map-ns_149HZFZVSCDR2Z7DWGKT_5466_) (id scalable-image-map_scalable-image-map-ns_129T3N9RHP6A735BEC93_7312_) (id e10024)))
   [margin-bottom (px 0)])
  ((and (class a-letter-space))
   [display inline-block]
   [width 0.385em])
  ((and (class a-padding-extra-large))
   [padding-top (px 20)]
   [padding-right (px 26)]
   [padding-bottom (px 20)]
   [padding-left (px 26)])
  ((child (and (class a-box-group)) (and (class a-box)))
   [margin-top (px -1)]
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 0)])
  ((".a-box-group > .a-box.a-first, .a-box-group > .a-box:first-child" (or))
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 0)]
   [margin-top (px 0)])
  ((and (class a-box))
   [display block]
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 4)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(221, 221, 221)]
   #;[border-right-color rgb(221, 221, 221)]
   #;[border-bottom-color rgb(221, 221, 221)]
   #;[border-left-color rgb(221, 221, 221)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 255, 255)])
  ((desc (and (class a-box)) (and (class a-box-inner)))
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 4)]
   [position relative]
   [padding-top (px 14)]
   [padding-right (px 18)]
   [padding-bottom (px 14)]
   [padding-left (px 18)])
  ((and (class a-box-thumbnail))
   [display inline-block])
  ((desc (and (class a-box-thumbnail)) (and (class a-box-inner)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (class a-box-title))
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class a-box-title)) (and (class a-box-inner)))
   [overflow-x hidden]
   [overflow-y hidden]
   [padding-top (px 12)]
   [padding-right (px 18)]
   [padding-bottom (px 11)]
   [padding-left (px 18)]
   #;[background-color transparent]
   #;[background-image linear-gradient(to bottom, rgb(248, 248, 248), rgb(238, 238, 238))]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[box-shadow (px 0)])
  ((and (class a-box-tab))
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 4)]
   [margin-top (px -1)])
  ((and (class a-addon-box-title))
   #;[background-color rgb(63, 105, 152)]
   #;[border-top-color rgb(63, 105, 152)]
   #;[border-right-color rgb(63, 105, 152)]
   #;[border-bottom-color rgb(63, 105, 152)]
   #;[border-left-color rgb(63, 105, 152)]
   [position relative]
   [overflow-x visible]
   [overflow-y visible])
  ((desc (and (class a-addon-box-title)) (and (class a-box-inner)))
   [padding-top (px 6)]
   [padding-right (px 14)]
   [padding-bottom (px 6)]
   [padding-left (px 14)]
   #;[color rgb(255, 255, 255)]
   #;[font-weight 700]
   [text-align center])
  ((".a-addon-box-title::after" (or))
   [border-right-style dashed]
   [border-bottom-style dashed]
   [border-left-style dashed]
   [border-right-width (px 6)]
   [border-left-width (px 6)]
   #;[border-right-color rgba(255, 255, 255, 0)]
   #;[border-bottom-color rgba(255, 255, 255, 0)]
   #;[border-left-color rgba(255, 255, 255, 0)]
   [border-top-width (px 6)]
   [border-top-style solid]
   #;[border-top-color rgb(63, 105, 152)]
   [border-bottom-width (px 0)]
   [width (px 0)]
   [height (px 0)]
   #;[font-size (px 0)]
   #;[line-height (px 0)]
   #;[transform translate3d(0px, 0px, 0px)]
   [position absolute]
   [bottom (px -7)]
   [left (% 50)]
   [margin-left (px -3)]
   #;[content ""])
  ((or (desc (and (class a-text-center)) (and (class a-box))) (desc (and (class a-text-center)) (and (class a-box-group))))
   [margin-left auto]
   [margin-right auto])
  ((".a-box-inner > .a-box:only-of-type" (or))
   [margin-top (px 4)]
   [margin-right (px 0)]
   [margin-bottom (px 4)]
   [margin-left (px 0)])
  ((desc (and (class a-alert)) (and (class a-icon-alert)))
   [height (px 27)]
   [left (px 18)]
   [position absolute]
   [top (px 11)]
   [width (px 30)])
  ((desc (and (class a-alert-error)) (and (class a-alert-container)))
   [padding-left (px 63)]
   #;[box-shadow (px 0)])
  ((desc (and (class a-alert-info)) (and (class a-alert-container)))
   [padding-left (px 60)]
   #;[background-color rgb(246, 246, 246)])
  ((desc (and (class a-alert-success)) (and (class a-alert-container)))
   [padding-left (px 60)]
   #;[box-shadow (px 0)])
  ((desc (and (class a-alert-warning)) (and (class a-alert-container)))
   [padding-left (px 63)]
   #;[box-shadow (px 0)])
  ((desc (and (class a-alert-inline)) (and (class a-icon-alert)))
   [height (px 13)]
   [width (px 14)]
   [position absolute]
   [left (px 2)]
   [top (px 2)])
  ((and (class a-alert-inline))
   [display inline-block]
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
   #;[vertical-align middle]
   #;[background-color transparent])
  ((desc (and (class a-alert-inline)) (and (class a-alert-container)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[color rgb(196, 0, 0)])
  ((desc (and (class a-alert-inline)) (and (class a-alert-container)) (and (class a-alert-content)))
   [margin-bottom (px 0)]
   [text-align left]
   #;[font-size (px 12)]
   #;[line-height (px 15)])
  ((desc (and (class a-alert-inline-info)) (and (class a-alert-container)))
   [padding-left (px 16)]
   #;[color rgb(43, 43, 43)])
  ((desc (and (class a-alert-inline-success)) (and (class a-alert-container)))
   [padding-left (px 22)]
   #;[color rgb(0, 118, 0)])
  ((desc (and (class a-alert-inline-warning)) (and (class a-alert-container)))
   [padding-left (px 22)]
   #;[color rgb(17, 17, 17)])
  ((desc (and (class a-alert-inline-error)) (and (class a-alert-container)))
   [padding-left (px 16)])
  ((and (tag hr))
   #;[background-color transparent]
   [display block]
   [height (px 1)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(231, 231, 231)]
   #;[line-height (px 19)]
   [margin-top (px 0)]
   [margin-bottom (px 14)])
  ((".a-color-alternate-background .a-divider.a-divider-break::after" (or))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(221, 221, 221)])
  ((".a-box.a-color-offset-background .a-divider.a-divider-break::after, .a-color-offset-background .a-divider.a-divider-break::after" (or))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(221, 221, 221)])
  ((or (desc (and (class a-box)) (and (class a-divider) (class a-divider-section)) (and (class a-divider-inner))) (desc (and (class a-color-base-background)) (and (class a-divider) (class a-divider-section)) (and (class a-divider-inner))) (desc (and (class a-divider) (class a-divider-section)) (and (class a-divider-inner))))
   [height (px 44)]
   [margin-bottom (px -18)]
   #;[background-color transparent]
   #;[background-image linear-gradient(to bottom, rgba(0, 0, 0, 0.14), rgba(0, 0, 0, 0.03) 3px, transparent)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[z-index (px 0)])
  ((".a-box .a-divider.a-divider-section .a-divider-inner::after, .a-color-base-background .a-divider.a-divider-section .a-divider-inner::after, .a-divider.a-divider-section .a-divider-inner::after" (or))
   [display block]
   [width (% 100)]
   [height (px 44)]
   #;[background-color transparent]
   #;[background-image linear-gradient(to right, rgb(255, 255, 255), rgba(255, 255, 255, 0), rgb(255, 255, 255))]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[z-index 1]
   #;[content ""])
  ((or (desc (and (class a-box)) (and (class a-divider) (class a-divider-break))) (desc (and (class a-color-base-background)) (and (class a-divider) (class a-divider-break))) (and (class a-divider) (class a-divider-break)))
   [text-align center]
   [position relative]
   [top (px 2)]
   [padding-top (px 1)]
   [margin-bottom (px 14)]
   #;[line-height (px 0)])
  ((".a-box .a-divider.a-divider-break::after, .a-color-base-background .a-divider.a-divider-break::after, .a-divider.a-divider-break::after" (or))
   #;[content ""]
   [width (% 100)]
   #;[background-color transparent]
   [display block]
   [height (px 1)]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(231, 231, 231)]
   [position absolute]
   [top (% 50)]
   [margin-top (px -1)]
   #;[z-index 1])
  ((or (desc (and (class a-box)) (and (class a-divider) (class a-divider-break)) (and (tag h5))) (desc (and (class a-color-base-background)) (and (class a-divider) (class a-divider-break)) (and (tag h5))) (desc (and (class a-divider) (class a-divider-break)) (and (tag h5))))
   #;[line-height 1]
   #;[font-size (px 12)]
   #;[color rgb(118, 118, 118)]
   #;[font-weight 400]
   #;[z-index 2]
   [position relative]
   [display inline-block]
   #;[background-color rgb(255, 255, 255)]
   [padding-top (px 0)]
   [padding-right (px 8)]
   [padding-bottom (px 0)]
   [padding-left (px 7)])
  ((and (class a-global-nav-wrapper))
   #;[background-color transparent]
   #;[background-image linear-gradient(to bottom, rgb(255, 255, 255), rgb(238, 238, 238))]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgba(0, 0, 0, 0.17)])
  ((and (class a-global-nav-subnav))
   #;[background-color rgb(238, 238, 238)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgba(0, 0, 0, 0.17)]
   [padding-top (px 8)]
   [padding-right (px 18)]
   [padding-bottom (px 7)]
   [padding-left (px 18)])
  ((desc (and (class a-footer)) (and (tag table)))
   #;[max-width (px 996)]
   [width (px 996)])
  ((".a-subheader::after, .a-subheader::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  ((desc (and (class a-subheader) (class a-breadcrumb)) (and (tag ul)) (and (tag li)))
   [margin-right 0.4235em]
   [float left])
  ((desc (and (class a-subheader) (class a-breadcrumb)) (and (tag ul)) (and (tag li) (class a-breadcrumb-divider)))
   #;[color rgb(148, 148, 148)]
   [position relative]
   [top (px -1)])
  ((and (class a-meter))
   [overflow-x hidden]
   [overflow-y hidden]
   #;[background-color transparent]
   #;[background-image linear-gradient(to bottom, rgb(238, 238, 238), rgb(246, 246, 246))]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (class a-meter)) (and (class a-meter-bar)))
   #;[border-top-left-radius (px 1)]
   #;[border-top-right-radius (px 1)]
   #;[border-bottom-right-radius (px 1)]
   #;[border-bottom-left-radius (px 1)]
   [width (px 0)]
   [float left]
   #;[font-size (px 0)]
   [height (% 100)]
   #;[background-color transparent]
   #;[background-image linear-gradient(to bottom, rgb(255, 206, 0), rgb(255, 167, 0))]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[transition-property width]
   #;[transition-duration 0.5s]
   #;[transition-timing-function ease]
   #;[transition-delay (px 0)])
  ((".a-meter .a-meter-bar::before" (or))
   [display block]
   #;[background-color rgba(255, 255, 255, 0.25)]
   [margin-top (px 1)]
   [margin-right (px 1)]
   [margin-bottom (px 1)]
   [margin-left (px 1)]
   #;[content ""]
   [height (px 1)]
   #;[font-size (px 0)])
  ((and (class a-meter))
   #;[border-top-left-radius (px 1)]
   #;[border-top-right-radius (px 1)]
   #;[border-bottom-right-radius (px 1)]
   #;[border-bottom-left-radius (px 1)]
   #;[box-shadow (px 0)]
   [height (px 17)])
  ((desc (and (class a-histogram-row)) (and (tag td)))
   [padding-top (px 1)]
   [padding-right (px 3)]
   [padding-bottom (px 1)]
   [padding-left (px 3)])
  ((desc (and (class a-js) (class a-transition)) (and (class a-meter-animate)) (and (class a-meter-unfilled)))
   #;[transition-property none]
   #;[transition-duration (px 0)]
   #;[transition-timing-function ease]
   #;[transition-delay (px 0)]
   [width (px 0)])
  ((and (tag a) (class a-link-emphasis))
   [position relative]
   [padding-right (px 9)])
  ((and (tag a) (class a-link-child))
   [display inline-block]
   [position relative]
   [padding-left (px 8)])
  (("a.a-link-child::before" (or))
   #;[content "›"]
   #;[color rgb(148, 148, 148)]
   [display block]
   #;[font-weight 700]
   [position absolute]
   [left (px 0)]
   [top (px -1)])
  ((and (tag a) (class a-link-expander))
   [display inline-block]
   [position relative]
   [padding-left (px 11)])
  ((and (class a-expander-inner))
   [margin-top (px 4)]
   [padding-left (px 11)])
  ((and (class a-section-expander-container))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(221, 221, 221)]
   #;[border-right-color rgb(221, 221, 221)]
   #;[border-bottom-color rgb(221, 221, 221)]
   #;[border-left-color rgb(221, 221, 221)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [margin-top (px -1)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 0)])
  ((".a-section-expander-container:first-child" (or))
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 0)]
   [margin-top (px 0)])
  ((and (class a-expander-borderless))
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
   #;[border-image-repeat stretch stretch])
  ((and (tag a) (class a-link-section-expander))
   [display block]
   [position relative]
   #;[color rgb(17, 17, 17)]
   #;[background-color rgb(243, 243, 243)]
   #;[transition-property all]
   #;[transition-duration 100ms]
   #;[transition-timing-function linear]
   #;[transition-delay (px 0)])
  ((or (desc (and (tag a) (class a-link-section-expander)) (and (class a-icon-section-collapse))) (desc (and (tag a) (class a-link-section-expander)) (and (class a-icon-section-expand))))
   [position absolute]
   [right (px 16)]
   [top (% 50)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [margin-top (px -6)])
  ((desc (and (class a-expander-borderless)) (and (tag a) (class a-link-section-expander)))
   [padding-top (px 0)]
   [padding-right (px 39)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[background-color transparent])
  ((and (class a-section-expander-inner))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(221, 221, 221)]
   [padding-top (px 12)]
   [padding-right (px 18)]
   [padding-bottom (px 12)]
   [padding-left (px 18)])
  ((desc (and (class a-expander-borderless)) (and (class a-section-expander-inner)))
   [border-top-width medium]
   [border-top-style none]
   #;[border-top-color -moz-use-text-color]
   [padding-top (px 4)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (class a-extender-trigger))
   [display block])
  ((desc (and (class a-extender-trigger)) (and (class a-extender)))
   [padding-top (px 2)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [display block])
  ((and (tag a) (class a-link-section-expander))
   [padding-top (px 11)]
   [padding-right (px 54)]
   [padding-bottom (px 11)]
   [padding-left (px 18)])
  ((and (tag table))
   [margin-bottom (px 18)]
   #;[border-collapse collapse]
   [width (% 100)])
  (("table:last-child" (or (id e10025) (id e10026)))
   [margin-bottom (px 0)])
  ((and (tag table) (class a-bordered))
   [margin-bottom (px 22)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-left-style solid]
   #;[border-right-color rgb(231, 231, 231)]
   #;[border-left-color rgb(231, 231, 231)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-top-color rgb(234, 234, 234)]
   [border-bottom-width medium]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-spacing (px 0)])
  ((or (desc (and (tag table) (class a-bordered)) (and (tag td))) (desc (and (tag table) (class a-bordered)) (and (tag th))))
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(234, 234, 234)])
  (("table.a-bordered tr:first-child th" (or))
   #;[background-color transparent]
   #;[background-image linear-gradient(to bottom, rgb(248, 248, 248), rgb(238, 238, 238))]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[box-shadow (px 0)]
   #;[border-top-color rgb(231, 231, 231)]
   #;[border-right-color rgb(231, 231, 231)]
   #;[border-left-color rgb(231, 231, 231)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(221, 221, 221)])
  ((and (tag table) (class a-bordered) (class a-vertical-stripes))
   [border-right-width medium]
   [border-right-style none]
   #;[border-right-color -moz-use-text-color])
  ((or (desc (and (tag table) (class a-bordered) (class a-vertical-stripes)) (and (tag tr)) (and (tag td))) (desc (and (tag table) (class a-bordered) (class a-vertical-stripes)) (and (tag tr)) (and (tag th))))
   [border-right-width (px 1)]
   [border-right-style solid]
   #;[border-right-color rgb(234, 234, 234)])
  (("table.a-bordered.a-vertical-stripes tr td:last-child, table.a-bordered.a-vertical-stripes tr th:last-child" (or))
   [border-right-width (px 1)]
   [border-right-style solid]
   #;[border-right-color rgb(231, 231, 231)])
  ((and (tag table) (class a-keyvalue))
   [margin-bottom (px 22)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(231, 231, 231)])
  ((or (desc (and (tag table) (class a-keyvalue)) (and (tag td))) (desc (and (tag table) (class a-keyvalue)) (and (tag th))))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(231, 231, 231)])
  (("td:first-child, th:first-child" (or (id e10027) (id e10028) (id e10029) (id e10030) (id e10031) (id e10032) (id e10033) (id e10034) (id e10035) (id e10036) (id e10037)))
   [padding-left (px 0)])
  (("td:last-child, th:last-child" (or (id e10027) (id e10038) (id e10039) (id e10030) (id e10040) (id e10032) (id e10041) (id e10034) (id e10042) (id e10036) (id e10043)))
   [padding-right (px 0)])
  ((and (tag th))
   [text-align left])
  (("tr:last-child td, tr:last-child th" (or (id e10027) (id e10028) (id e10044) (id e10045) (id e10046) (id e10047) (id e10048) (id e10038) (id e10037) (id e10049) (id e10050) (id e10051) (id e10052) (id e10053) (id e10054) (id e10055) (id e10056) (id e10057) (id e10058) (id e10059) (id e10060) (id e10061) (id e10043)))
   [padding-bottom (px 0)])
  (("tr:first-child td, tr:first-child th" (or (id e10027) (id e10028) (id e10044) (id e10045) (id e10046) (id e10047) (id e10048) (id e10038) (id e10029) (id e10062) (id e10063) (id e10064) (id e10065) (id e10066) (id e10067) (id e10068) (id e10069) (id e10070) (id e10071) (id e10072) (id e10073) (id e10074) (id e10039)))
   [padding-top (px 0)])
  ((desc (and (class a-text-center)) (and (tag table)))
   [margin-left auto]
   [margin-right auto])
  ((or (and (tag td)) (and (tag th)))
   [padding-top (px 3)]
   [padding-right (px 3)]
   [padding-bottom (px 3)]
   [padding-left (px 3)])
  ((or (desc (and (tag table) (class a-bordered)) (and (tag td))) (desc (and (tag table) (class a-bordered)) (and (tag th))))
   [padding-top (px 7)]
   [padding-right (px 14)]
   [padding-bottom (px 6)]
   [padding-left (px 14)])
  ((or (desc (and (tag table) (class a-lineitem)) (and (tag td))) (desc (and (tag table) (class a-lineitem)) (and (tag th))))
   [padding-top (px 0)]
   [padding-right (px 3)]
   [padding-bottom (px 0)]
   [padding-left (px 3)])
  (("table.a-lineitem td:first-child, table.a-lineitem th:first-child" (or))
   [padding-left (px 0)])
  (("table.a-lineitem td:last-child, table.a-lineitem th:last-child" (or))
   [padding-right (px 0)])
  ((or (desc (and (tag table) (class a-keyvalue)) (and (tag td))) (desc (and (tag table) (class a-keyvalue)) (and (tag th))))
   [padding-top (px 7)]
   [padding-right (px 14)]
   [padding-bottom (px 6)]
   [padding-left (px 14)])
  ((and (tag ul))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 18)]
   [margin-left (px 18)]
   #;[color rgb(148, 148, 148)])
  ((and (tag ol))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 18)]
   [margin-left (px 20)]
   #;[color rgb(118, 118, 118)])
  ((or (and (tag ol)) (and (tag ul)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((or (desc (and (tag ol)) (and (tag li))) (desc (and (tag ul)) (and (tag li))))
   #;[word-wrap break-word]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  (("ol:last-child, ul:last-child" (or (id e10075) (id e10076) (id e10077) (id e10078) (id e10079) (id e10080) (id e10081) (id e10082)))
   [margin-bottom (px 0)])
  ((or (and (tag ol) (class a-nostyle)) (and (tag ul) (class a-nostyle)))
   [margin-left (px 0)]
   #;[color rgb(17, 17, 17)])
  ((or (desc (and (tag ol) (class a-nostyle)) (and (tag ul))) (desc (and (tag ul) (class a-nostyle)) (and (tag ul))))
   [margin-left (px 14)])
  ((or (and (tag ol) (class a-list-link)) (and (tag ul) (class a-list-link)))
   [margin-top (px -2)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((or (desc (and (tag ol) (class a-list-link)) (and (tag a))) (desc (and (tag ul) (class a-list-link)) (and (tag a))))
   #;[color rgb(17, 17, 17)]
   [display block])
  ((or (desc (and (tag ol) (class a-list-link)) (and (tag li))) (desc (and (tag ul) (class a-list-link)) (and (tag li))))
   [display block]
   [position relative])
  ((or (desc (and (tag ol) (class a-list-link)) (and (tag li)) (and (tag a))) (desc (and (tag ul) (class a-list-link)) (and (tag li)) (and (tag a))))
   [padding-top (px 2)]
   [padding-right (px 0)]
   [padding-bottom (px 2)]
   [padding-left (px 0)])
  ((or (desc (and (tag ol) (class a-list-link)) (and (tag hr))) (desc (and (tag ul) (class a-list-link)) (and (tag hr))))
   [margin-top (px 7)]
   [margin-right (px 0)]
   [margin-bottom (px 7)]
   [margin-left (px 0)])
  ((or (and (tag ol) (class a-horizontal)) (and (tag ul) (class a-horizontal)))
   [display block]
   [margin-left (px 0)])
  (("ol.a-horizontal::after, ol.a-horizontal::before, ul.a-horizontal::after, ul.a-horizontal::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  ((or (desc (and (tag ol) (class a-horizontal)) (and (tag li))) (desc (and (tag ul) (class a-horizontal)) (and (tag li))))
   [display inline-block]
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  (("ol.a-horizontal li.a-last, ol.a-horizontal li:last-child, ul.a-horizontal li.a-last, ul.a-horizontal li:last-child" (or (id e10083) (id e10084) (id e10085) (id e10086) (id e10087) (id e10088) (id e10089) (id e10090)))
   [margin-right (px 0)])
  (("ul + p" (or))
   [margin-top (px -4)])
  (("ol + p" (or))
   [margin-top (px -4)])
  (("dl + p" (or))
   [margin-top (px -4)])
  ((or (desc (and (tag ul) (class a-box-list)) (and (class a-touch-multi-select))) (desc (and (tag ul) (class a-box-list)) (and (tag a))))
   [display block]
   [padding-top (px 14)]
   [padding-right (px 18)]
   [padding-bottom (px 14)]
   [padding-left (px 18)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid])
  ((desc (and (tag ul) (class a-box-list)) (and (tag li)))
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(231, 231, 231)])
  (("ul.a-box-list li.a-last, ul.a-box-list li:last-child" (or))
   [border-bottom-width medium]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color])
  ((and (tag dl))
   [display block]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 18)]
   [margin-left (px 0)])
  (("dl::after, dl::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  (("dl:last-child" (or))
   [margin-bottom (px 0)])
  ((or (desc (and (tag dl)) (and (tag dd))) (desc (and (tag dl)) (and (tag dt))))
   [display inline-block]
   [float left]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (tag dl)) (and (tag dd)))
   [margin-left 0.385em])
  ((or (and (tag ol) (class a-horizontal) (class a-button-list)) (and (tag ul) (class a-horizontal) (class a-button-list)))
   [margin-left (px -6)])
  ((or (desc (and (tag ol) (class a-horizontal) (class a-button-list)) (and (tag li))) (desc (and (tag ul) (class a-horizontal) (class a-button-list)) (and (tag li))))
   [margin-left (px 6)]
   [margin-right (px 0)])
  ((and (tag ul) (class a-pagination))
   [display inline-block]
   [margin-left (px 0)])
  (("ul.a-pagination::after, ul.a-pagination::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  ((desc (and (tag ul) (class a-pagination)) (and (tag li)))
   #;[background-color rgb(255, 255, 255)]
   [display block]
   [float left]
   #;[line-height (px 16)]
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside]
   [position relative])
  ((or (desc (and (tag ul) (class a-pagination)) (and (tag li)) (and (tag a))) (desc (and (tag ul) (class a-pagination)) (and (tag li) (class a-disabled))))
   [display block]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid])
  ((desc (and (tag ul) (class a-pagination)) (and (tag li)) (and (tag a)))
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[box-shadow (px 0)]
   #;[background-color transparent]
   #;[background-image linear-gradient(to bottom, rgb(247, 248, 250), rgb(231, 233, 236))]
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
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-top-color rgb(173, 177, 184)]
   #;[border-right-color rgb(162, 166, 172)]
   #;[border-bottom-color rgb(141, 144, 150)]
   #;[border-left-color rgb(162, 166, 172)])
  ((desc (and (tag ul) (class a-pagination)) (and (tag li) (class a-disabled)))
   #;[color rgb(153, 153, 153)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((desc (and (tag ul) (class a-pagination)) (and (tag li)))
   [margin-right (px 4)])
  ((or (desc (and (tag ul) (class a-pagination)) (and (tag li)) (and (tag a))) (desc (and (tag ul) (class a-pagination)) (and (tag li) (class a-disabled))))
   [padding-top (px 8)]
   [padding-right (px 12)]
   [padding-bottom (px 7)]
   [padding-left (px 13)])
  ((and (tag img) (class a-auto-scale))
   #;[max-width (% 100)]
   #;[max-height (% 100)]
   [height auto]
   [width (% 100)])
  ((and (tag img) (class a-scale))
   [width (% 100)])
  ((and (class a-dynamic-image) (class a-stretch-vertical))
   [height (% 100)]
   [width auto])
  ((and (class a-dynamic-image) (class a-stretch-horizontal))
   [width (% 100)]
   [height auto])
  ((and (tag div) (class a-image-wrapper))
   [display inline-block])
  ((and (tag img) (class a-thumbnail-left))
   [float left]
   [margin-top (px 0)]
   [margin-right (px 14)]
   [margin-bottom (px 4)]
   [margin-left (px 0)])
  ((and (tag img) (class a-thumbnail-right))
   [float right]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 4)]
   [margin-left (px 14)])
  ((and (class a-loading-static))
   #;[background-color rgb(243, 243, 243)]
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
   #;[border-right-color rgb(240, 240, 240)]
   #;[border-bottom-color rgb(240, 240, 240)]
   #;[border-left-color rgb(240, 240, 240)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-top-color rgb(238, 238, 238)]
   [width (px 120)]
   [height (px 120)]
   #;[max-width (px 120)]
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[box-shadow (px 0)]
   [position relative]
   [top (% 20)])
  ((and (class a-loading-static-inner))
   [width (px 51)]
   [height (px 50)]
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/AUIClients/AmazonUIBaseCSS-sprite_1x-8fe8c701c7a6f38368f97a8a3f04d5f25875be4d._V2_.png")]
   #;[background-repeat no-repeat]
   #;[background-position -143px -296px]
   [margin-top (px -23)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [position relative]
   [top (% 50)])
  ((and (tag form))
   [margin-bottom (px 14)])
  ((and (tag form) (class a-nostyle))
   [margin-bottom (px 0)])
  ((desc (and (tag form) (class a-nostyle)) (and (tag fieldset)))
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
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((or (and (tag label)) (and (tag legend)))
   [display block]
   [padding-left (px 2)]
   [padding-bottom (px 2)]
   #;[font-weight 700])
  ((desc (and (tag label)) (and (class a-spacing-none)))
   [padding-bottom (px 0)])
  ((child (and (class a-text-center)) (and (tag label)))
   [margin-right (px 8)])
  ((and (tag fieldset))
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
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  (("fieldset label:last-child" (or))
   [margin-bottom (px 0)])
  (("input + input" (or))
   [margin-left 0.385em])
  ((".a-input-text, input[type=\"number\"], input[type=\"tel\"], input[type=\"password\"], input[type=\"search\"], input[type=\"text\"], select.a-select-multiple, textarea" (or (id twotabsearchtextbox)))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-right-color rgb(166, 166, 166)]
   #;[border-bottom-color rgb(166, 166, 166)]
   #;[border-left-color rgb(166, 166, 166)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-top-color rgb(148, 148, 148)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[box-shadow (px 0)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color])
  ((and (tag textarea))
   #;[background-color rgb(255, 255, 255)]
   [width (% 100)]
   [padding-top (px 5)]
   [padding-right (px 7)]
   [padding-bottom (px 5)]
   [padding-left (px 7)]
   #;[resize vertical])
  ((".a-input-text, input[type=\"number\"], input[type=\"tel\"], input[type=\"password\"], input[type=\"search\"], input[type=\"text\"]" (or (id twotabsearchtextbox)))
   #;[background-color rgb(255, 255, 255)]
   [height (px 31)]
   [padding-top (px 3)]
   [padding-right (px 7)]
   [padding-bottom (px 3)]
   [padding-left (px 7)]
   #;[line-height normal])
  ((and (tag select) (class a-select-multiple))
   [height auto]
   [width (% 100)]
   [padding-top (px 7)]
   [padding-right (px 7)]
   [padding-bottom (px 7)]
   [padding-left (px 7)])
  ((and (class a-search))
   [position relative]
   [display inline-block])
  ((desc (and (class a-search)) (and (class a-icon-search)))
   [position absolute]
   [top (% 50)]
   [margin-top (px -7)]
   [left (px 10)])
  ((desc (and (class a-search)) (and (tag input)))
   [padding-left (px 29)])
  ((and (class a-form-actions))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(221, 221, 221)]
   #;[background-color transparent]
   #;[background-image linear-gradient(to bottom, rgb(243, 243, 243), rgb(255, 255, 255))]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[box-shadow (px 0)]
   [padding-top (px 14)]
   [padding-right (px 14)]
   [padding-bottom (px 14)]
   [padding-left (px 14)]
   [text-align right])
  ((or (and (class a-checkbox) (class a-checkbox-fancy)) (and (class a-radio) (class a-radio-fancy)))
   [position relative])
  ((or (desc (and (class a-checkbox) (class a-checkbox-fancy)) (and (tag input))) (desc (and (class a-radio) (class a-radio-fancy)) (and (tag input))))
   #;[opacity 0.02]
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
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   [overflow-x hidden]
   [overflow-y hidden]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [position absolute]
   [bottom auto]
   [left (px 0)]
   #;[z-index -1])
  ((".a-checkbox.a-checkbox-fancy input:focus + .a-icon::after, .a-radio.a-radio-fancy input:focus + .a-icon::after" (or))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(231, 118, 0)]
   #;[border-right-color rgb(231, 118, 0)]
   #;[border-bottom-color rgb(231, 118, 0)]
   #;[border-left-color rgb(231, 118, 0)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[content " "]
   [position absolute])
  (("input[type=\"radio\"]" (or))
   [height (px 14)]
   [width (px 14)]
   #;[vertical-align top]
   [position relative]
   [bottom (px -3)])
  (("input[type=\"checkbox\"]" (or))
   [height (px 13)]
   [width (px 13)]
   #;[vertical-align top]
   [position relative]
   [bottom (px -3)])
  ((or (desc (and (class a-checkbox)) (and (tag label))) (desc (and (class a-radio)) (and (tag label))))
   [position relative]
   #;[font-weight 400]
   #;[color rgb(17, 17, 17)]
   [padding-left (px 15)]
   #;[text-indent (px -15)]
   [margin-left (px 3)]
   [top (px -2)]
   [padding-bottom (px 0)])
  ((or (desc (and (class a-form-horizontal)) (and (class a-checkbox))) (desc (and (class a-form-horizontal)) (and (class a-radio))))
   [display inline-block]
   [margin-right (px 14)])
  ((".a-form-horizontal .a-checkbox:last-child, .a-form-horizontal .a-radio:last-child" (or))
   [margin-right (px 0)])
  ((or (desc (and (class a-form-horizontal)) (and (class a-checkbox)) (and (tag label))) (desc (and (class a-form-horizontal)) (and (class a-radio)) (and (tag label))))
   [padding-left (px 0)]
   #;[text-indent (px 0)])
  ((or (desc (and (class a-checkbox-fancy)) (and (class a-checkbox-label))) (desc (and (class a-checkbox-fancy)) (and (class a-radio-label))) (desc (and (class a-radio-fancy)) (and (class a-checkbox-label))) (desc (and (class a-radio-fancy)) (and (class a-radio-label))))
   [top (px 1)]
   #;[vertical-align middle])
  ((or (desc (and (class a-checkbox-fancy)) (and (tag label))) (desc (and (class a-radio-fancy)) (and (tag label))))
   [padding-left (px 19)]
   #;[text-indent (px -19)])
  ((".a-checkbox-fancy input:focus + .a-icon, .a-radio-fancy input:focus + .a-icon" (or))
   [position relative])
  ((".a-checkbox-fancy input:focus + .a-icon::after, .a-radio-fancy input:focus + .a-icon::after" (or))
   [top (px 0)]
   [left (px 0)])
  ((or (and (class a-checkbox-label)) (and (class a-radio-label)))
   [position relative]
   [padding-left (px 5)]
   #;[text-indent (px 0)]
   [display inline-block])
  ((desc (and (class a-checkbox-fancy)) (and (tag input)))
   [height (px 16)]
   [width (px 16)])
  ((".a-checkbox-fancy input:focus + .a-icon::after" (or))
   [height (px 14)]
   [width (px 14)])
  ((desc (and (class a-radio-fancy)) (and (tag input)))
   [height (px 17)]
   [width (px 17)])
  ((".a-radio-fancy input:focus + .a-icon::after" (or))
   [height (px 15)]
   [width (px 15)])
  ((and (class a-spinner))
   [display inline-block])
  ((and (class a-spinner-small))
   [width (px 16)]
   [height (px 16)]
   #;[background-color transparent]
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/amazonui/loading/spinner_1x._V1_.gif")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position 50% 50%]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (class a-spinner-medium))
   [width (px 32)]
   [height (px 32)]
   #;[background-color transparent]
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/amazonui/loading/spinner_2x._V1_.gif")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position 50% 50%]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (class a-spinner-wrapper))
   [width (% 100)]
   [height (% 100)]
   [display table])
  ((desc (and (class a-spinner-wrapper)) (and (class a-spinner)))
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [display table-cell]
   #;[vertical-align middle])
  ((and (class a-popover-loading))
   #;[min-width (px 75)]
   [height (px 75)]
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
   [width (px 75)]
   #;[background-color transparent]
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/amazonui/loading/loading-2x-gray._V1_.gif")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position 50% 50%]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (class a-popover-preload))
   [display none])
  ((and (class a-popover))
   [display inline-block]
   [position absolute]
   #;[visibility hidden]
   [top (px 0)]
   [left (px 0)]
   #;[z-index 1010]
   [padding-top (px 8)]
   [padding-right (px 8)]
   [padding-bottom (px 8)]
   [padding-left (px 8)]
   #;[max-width (px 440)]
   [width (px 440)])
  ((and (class a-popover-wrapper))
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
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-top-color rgba(0, 0, 0, 0.2)]
   #;[border-right-color rgba(0, 0, 0, 0.2)]
   #;[border-bottom-color rgba(0, 0, 0, 0.2)]
   #;[border-left-color rgba(0, 0, 0, 0.2)]
   [height (% 100)]
   [width (% 100)]
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 4)]
   #;[box-shadow (px 0)]
   #;[background-color rgb(255, 255, 255)])
  ((and (class a-popover-inner))
   [padding-top (px 14)]
   [padding-right (px 18)]
   [padding-bottom (px 14)]
   [padding-left (px 18)]
   [text-align left]
   [overflow-x hidden])
  ((desc (and (class a-popover-inner)) (and (class a-button-close)))
   [position static]
   [margin-top (px -10)]
   [margin-right (px -14)]
   [margin-bottom (px 6)]
   [margin-left (px 6)])
  ((".a-popover-inner dl:last-child, .a-popover-inner ol:last-child, .a-popover-inner p:last-child, .a-popover-inner ul:last-child" (or))
   [margin-bottom (px 0)])
  ((and (class a-popover-header))
   [position relative]
   [text-align left]
   #;[background-color transparent]
   #;[background-image linear-gradient(to bottom, rgb(247, 247, 247), rgb(234, 234, 234))]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 0)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgba(0, 0, 0, 0.2)]
   #;[box-shadow (px 0)]
   [padding-top (px 0)]
   [padding-right (px 14)]
   [padding-bottom (px 0)]
   [padding-left (px 14)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class a-popover-header)) (and (class a-popover-header-content)))
   #;[min-height (px 35)]
   #;[line-height (px 16)]
   [padding-top (px 10)]
   [padding-right (px 0)]
   [padding-bottom (px 9)]
   [padding-left (px 0)]
   #;[font-size (px 13)]
   #;[font-weight 700]
   [margin-right (px 20)])
  ((or (desc (and (class a-popover)) (and (class a-arrow))) (desc (and (class a-popover)) (and (class a-arrow-border))))
   [border-top-width (px 8)]
   [border-right-width (px 8)]
   [border-bottom-width (px 8)]
   [border-left-width (px 8)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((desc (and (class a-popover)) (and (class a-arrow)))
   [width (px 0)]
   [height (px 0)]
   [position absolute]
   [display block]
   #;[z-index 1011])
  ((desc (and (class a-popover)) (and (class a-arrow-border)))
   [position absolute])
  ((desc (and (class a-popover) (class a-arrow-right)) (and (class a-arrow-border)))
   [left (px 0)]
   [margin-top (px -8)]
   [border-left-width (px 0)]
   [border-left-style none]
   #;[border-left-color -moz-use-text-color]
   #;[border-right-color rgba(0, 0, 0, 0.2)])
  ((desc (and (class a-popover) (class a-arrow-right)) (and (class a-arrow)))
   [top (px -8)]
   [left (px 1)]
   [border-left-width (px 0)]
   [border-left-style none]
   #;[border-left-color -moz-use-text-color]
   #;[border-right-color rgb(255, 255, 255)])
  ((desc (and (class a-popover) (class a-arrow-left)) (and (class a-arrow-border)))
   [right (px 0)]
   [margin-top (px -8)]
   [border-right-width (px 0)]
   [border-right-style none]
   #;[border-right-color -moz-use-text-color]
   #;[border-left-color rgba(0, 0, 0, 0.2)])
  ((desc (and (class a-popover) (class a-arrow-left)) (and (class a-arrow)))
   [top (px -8)]
   [right (px 1)]
   [border-right-width (px 0)]
   [border-right-style none]
   #;[border-right-color -moz-use-text-color]
   #;[border-left-color rgb(255, 255, 255)])
  ((desc (and (class a-popover) (class a-arrow-top)) (and (class a-arrow-border)))
   [bottom (px 0)]
   [margin-left (px -8)]
   [border-bottom-width (px 0)]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-top-color rgba(0, 0, 0, 0.2)])
  ((desc (and (class a-popover) (class a-arrow-top)) (and (class a-arrow)))
   [bottom (px 1)]
   [right (px -8)]
   [border-bottom-width (px 0)]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-top-color rgb(255, 255, 255)])
  ((desc (and (class a-popover) (class a-arrow-bottom)) (and (class a-arrow-border)))
   [top (px 0)]
   [margin-left (px -8)]
   [border-top-width (px 0)]
   [border-top-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-bottom-color rgba(0, 0, 0, 0.2)])
  ((desc (and (class a-popover) (class a-arrow-bottom)) (and (class a-arrow)))
   [top (px 1)]
   [right (px -8)]
   [border-top-width (px 0)]
   [border-top-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-bottom-color rgb(255, 255, 255)])
  ((and (class a-button-close))
   [display block]
   #;[background-color transparent]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
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
   [float right]
   [padding-top (px 8)]
   [padding-right (px 8)]
   [padding-bottom (px 8)]
   [padding-left (px 8)]
   [position absolute]
   [top (% 50)]
   [right (px 5)]
   [margin-top (px -13)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[line-height (px 0)])
  ((".a-button-close:focus" (or))
   #;[background-color transparent]
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
   #;[border-top-color rgb(231, 118, 0)]
   #;[border-right-color rgb(231, 118, 0)]
   #;[border-bottom-color rgb(231, 118, 0)]
   #;[border-left-color rgb(231, 118, 0)]
   #;[box-shadow (px 0)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   [padding-top (px 7)]
   [padding-right (px 7)]
   [padding-bottom (px 7)]
   [padding-left (px 7)])
  ((or (and (id a-popover-lgtbox)) (and (class a-modal)))
   #;[opacity 0.75]
   [display none]
   [position fixed]
   [top (px 0)]
   [left (px 0)]
   [height (% 100)]
   [width (% 100)]
   #;[background-color rgb(0, 0, 0)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (id a-popover-offset-tracker))
   #;[opacity 0.01]
   [position absolute]
   [height (px 1)]
   [width (px 1)]
   [top (px 0)]
   [left (px 0)])
  ((and (class a-dropdown-common))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 1)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[max-width none])
  ((desc (and (class a-dropdown-common)) (and (class a-popover-inner)))
   [padding-top (px 8)]
   [padding-right (px 0)]
   [padding-bottom (px 8)]
   [padding-left (px 0)])
  ((desc (and (class a-dropdown-common)) (and (class a-list-link)))
   [position relative]
   [left (px -1)]
   [margin-right (px -1)])
  ((desc (and (class a-dropdown-common)) (and (class a-dropdown-item)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color])
  ((desc (and (class a-dropdown-common)) (and (class a-dropdown-link)))
   [padding-top (px 2)]
   [padding-right (px 12)]
   [padding-bottom (px 1)]
   [padding-left (px 13)]
   [display block]
   #;[white-space nowrap]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-bottom-color transparent]
   #;[border-left-color transparent]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [margin-left (px 1)])
  ((desc (and (class a-dropdown-common)) (and (class a-dropdown-link)) (and (tag img)))
   [margin-right (px 5)])
  ((desc (and (class a-dropdown-common)) (and (class a-dropdown-link)) (and (class a-list-anno)))
   [display block]
   [margin-top (px 6)]
   #;[color rgb(85, 85, 85)]
   #;[font-size (px 11)])
  ((desc (and (class a-dropdown-common)) (and (class a-dropdown-link)) (and (class a-prime-logo)))
   [margin-top (px -3)])
  ((desc (and (class a-dropdown-common)) (and (class divider)))
   #;[background-color rgb(255, 255, 255)]
   [padding-top (px 7)]
   [padding-right (px 0)]
   [padding-bottom (px 7)]
   [padding-left (px 0)])
  ((desc (and (class a-dropdown-common)) (and (class divider)) (and (tag hr)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (class a-lgtbox-vertical-scroll))
   [overflow-y scroll])
  ((and (class a-dropdown-label))
   [margin-right (px 6)])
  ((or (desc (and (class a-js)) (and (class a-native-dropdown))) (desc (and (class a-js)) (and (class a-native-splitdropdown))) (desc (and (class a-no-js)) (and (class a-button-group-splitdropdown))) (desc (and (class a-no-js)) (and (class a-dropdown-container)) (and (class a-button-dropdown))))
   [display none])
  ((and (class a-tooltip))
   [padding-top (px 6)]
   [padding-right (px 6)]
   [padding-bottom (px 6)]
   [padding-left (px 6)]
   #;[min-width (px 60)])
  ((or (desc (and (class a-tooltip)) (and (class a-arrow))) (desc (and (class a-tooltip)) (and (class a-arrow-border))))
   [border-top-width (px 6)]
   [border-right-width (px 6)]
   [border-bottom-width (px 6)]
   [border-left-width (px 6)])
  ((desc (and (class a-tooltip) (class a-arrow-right)) (and (class a-arrow-border)))
   [margin-top (px -6)]
   #;[border-right-color rgb(47, 53, 59)])
  ((desc (and (class a-tooltip) (class a-arrow-right)) (and (class a-arrow)))
   [top (px -6)]
   #;[border-right-color rgb(68, 76, 85)])
  ((desc (and (class a-tooltip) (class a-arrow-left)) (and (class a-arrow-border)))
   [margin-top (px -6)]
   #;[border-left-color rgb(47, 53, 59)])
  ((desc (and (class a-tooltip) (class a-arrow-left)) (and (class a-arrow)))
   [top (px -6)]
   #;[border-left-color rgb(68, 76, 85)])
  ((desc (and (class a-tooltip) (class a-arrow-top)) (and (class a-arrow-border)))
   [margin-left (px -6)]
   #;[border-top-color rgb(47, 53, 59)])
  ((desc (and (class a-tooltip) (class a-arrow-top)) (and (class a-arrow)))
   [right (px -6)]
   #;[border-top-color rgb(68, 76, 85)])
  ((desc (and (class a-tooltip) (class a-arrow-bottom)) (and (class a-arrow-border)))
   [margin-left (px -6)]
   #;[border-bottom-color rgb(47, 53, 59)])
  ((desc (and (class a-tooltip) (class a-arrow-bottom)) (and (class a-arrow)))
   [right (px -6)]
   #;[border-bottom-color rgb(68, 76, 85)])
  ((and (class a-tooltip-inner))
   [display inline-block]
   #;[font-size (px 13)]
   #;[color rgb(255, 255, 255)]
   #;[line-height 1.4]
   #;[background-color rgb(68, 76, 85)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(47, 53, 59)]
   #;[border-right-color rgb(47, 53, 59)]
   #;[border-bottom-color rgb(47, 53, 59)]
   #;[border-left-color rgb(47, 53, 59)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [padding-top (px 5)]
   [padding-right (px 10)]
   [padding-bottom (px 5)]
   [padding-left (px 10)]
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 4)])
  ((and (class a-modal-scroller))
   [height (% 100)]
   [width (% 100)]
   [right (px 0)]
   [top (px 0)]
   [overflow-x auto]
   [overflow-y auto]
   [position fixed]
   #;[visibility hidden]
   #;[z-index 1009])
  ((and (class a-popover-modal))
   [position absolute]
   #;[min-width (px 0)]
   #;[max-width (% 80)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [width (% 80)])
  ((desc (and (class a-popover-modal)) (and (class a-popover-wrapper)))
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
   #;[border-top-color rgba(0, 0, 0, 0.75)]
   #;[border-right-color rgba(0, 0, 0, 0.75)]
   #;[border-bottom-color rgba(0, 0, 0, 0.75)]
   #;[border-left-color rgba(0, 0, 0, 0.75)]
   #;[box-shadow (px 0)]
   [height (% 100)])
  ((desc (and (class a-popover-modal)) (and (class a-popover-footer)))
   [text-align right]
   #;[background-color transparent]
   #;[background-image linear-gradient(to bottom, rgb(243, 243, 243), rgb(255, 255, 255))]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[box-shadow (px 0)]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(221, 221, 221)]
   [padding-top (px 14)]
   [padding-right (px 14)]
   [padding-bottom (px 14)]
   [padding-left (px 14)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 4)])
  ((desc (and (class a-popover-modal)) (and (class a-button-top-right)))
   [position static]
   [margin-top (px 6)]
   [margin-right (px 6)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class a-popover-modal)) (and (class a-modal-close-nohead-top)))
   [position static]
   [float none]
   [width (% 100)]
   [text-align right]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 8)]
   [padding-right (px 8)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class a-popover-modal-fixed-height)) (and (class a-popover-wrapper)))
   [position relative])
  ((desc (and (class a-popover-modal-fixed-height)) (and (class a-popover-footer)))
   [position absolute]
   [bottom (px 0)]
   [left (px 0)]
   [right (px 0)])
  ((and (class a-changeover))
   [position fixed]
   [top (px 15)]
   [right (px 15)]
   [overflow-x visible]
   [overflow-y visible]
   #;[z-index 1200]
   #;[backface-visibility visible]
   #;[perspective (px 500)]
   #;[transform-style preserve-3d])
  ((and (class a-changeover-manual))
   [position absolute]
   [height auto]
   [width (px 200)]
   [left (% 50)]
   [margin-left (px -100)])
  ((desc (and (class a-changeover-manual)) (and (class a-changeover-inner)))
   #;[animation-duration (px 0)]
   #;[animation-timing-function ease]
   #;[animation-delay (px 0)]
   #;[animation-direction normal]
   #;[animation-fill-mode none]
   #;[animation-iteration-count 1]
   #;[animation-play-state running]
   #;[animation-name none]
   [top (px 0)]
   [left (px 0)]
   [margin-left (px 0)]
   [position static])
  ((and (class a-changeover-inner))
   [width (px 200)]
   #;[background-color rgb(68, 76, 85)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(47, 53, 59)]
   #;[border-right-color rgb(47, 53, 59)]
   #;[border-bottom-color rgb(47, 53, 59)]
   #;[border-left-color rgb(47, 53, 59)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-top-left-radius (px 4)]
   #;[border-top-right-radius (px 4)]
   #;[border-bottom-right-radius (px 4)]
   #;[border-bottom-left-radius (px 4)]
   #;[font-size (px 15)]
   #;[line-height 1.35]
   #;[font-weight 700]
   #;[color rgb(255, 255, 255)]
   [padding-top (px 11)]
   [padding-right (px 13)]
   [padding-bottom (px 11)]
   [padding-left (px 14)]
   [text-align center]
   #;[transform-origin (px 0)]
   #;[transform-style preserve-3d]
   #;[animation-duration 2.2s]
   #;[animation-timing-function ease]
   #;[animation-delay (px 0)]
   #;[animation-direction normal]
   #;[animation-iteration-count 1]
   #;[animation-play-state running]
   #;[animation-name bubble-pop]
   #;[animation-fill-mode forwards]
   #;[transform translate3d(0px, 0px, 0px)])
  (("ul.a-tabs + .a-box.a-box-tab" (or))
   [margin-top (px -1)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (tag ul) (class a-tabs))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[list-style-type none]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(221, 221, 221)]
   #;[border-right-color rgb(221, 221, 221)]
   #;[border-bottom-color rgb(221, 221, 221)]
   #;[border-left-color rgb(221, 221, 221)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[background-color rgb(243, 243, 243)])
  (("ul.a-tabs::after, ul.a-tabs::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  ((or (desc (and (tag ul) (class a-tabs)) (and (class a-tab-heading))) (desc (and (tag ul) (class a-tabs)) (and (tag li))))
   [float left]
   [margin-bottom (px -1)]
   [margin-top (px -1)]
   #;[list-style-type none])
  ((or (desc (and (tag ul) (class a-tabs)) (and (class a-tab-heading)) (and (tag a))) (desc (and (tag ul) (class a-tabs)) (and (tag li)) (and (tag a))))
   #;[transition-property all]
   #;[transition-duration 100ms]
   #;[transition-timing-function linear]
   #;[transition-delay (px 0)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[line-height 1]
   [padding-top (px 15)]
   [padding-right (px 17)]
   [padding-bottom (px 15)]
   [padding-left (px 18)]
   [display block]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-left-style solid]
   #;[border-top-color transparent]
   #;[border-right-color transparent]
   #;[border-left-color transparent]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-bottom-width (px 0)]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color])
  (("ul.a-tabs .a-tab-heading:first-child a, ul.a-tabs li:first-child a" (or))
   [border-left-width medium]
   [border-left-style none]
   #;[border-left-color -moz-use-text-color])
  ((desc (and (class a-accordion)) (and (class a-box)))
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class a-accordion)) (and (class a-accordion-row-container)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class a-accordion)) (and (class a-accordion-row)))
   [position relative]
   #;[background-color rgb(243, 243, 243)]
   #;[transition-property all]
   #;[transition-duration 100ms]
   #;[transition-timing-function linear]
   #;[transition-delay (px 0)]
   [display block]
   #;[color inherit]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
   #;[cursor pointer]
   [padding-top (px 10)]
   [padding-right (px 18)]
   [padding-bottom (px 10)]
   [padding-left (px 43)])
  ((or (desc (and (class a-accordion)) (and (class a-accordion-row)) (and (class a-icon-radio-active))) (desc (and (class a-accordion)) (and (class a-accordion-row)) (and (class a-icon-radio-inactive))))
   [position absolute]
   [left (px 17)]
   [height (px 17)]
   [width (px 17)])
  ((desc (and (class a-accordion)) (and (class a-accordion-inner)))
   [padding-top (px 0)]
   [padding-right (px 18)]
   [padding-bottom (px 14)]
   [padding-left (px 18)]
   [display none])
  ((desc (and (class a-accordion)) (and (class a-accordion-active)) (and (class a-accordion-inner)))
   [display block])
  ((".a-accordion .a-accordion-row:focus .a-icon-radio-active::after, .a-accordion .a-accordion-row:focus .a-icon-radio-inactive::after" (or))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(231, 118, 0)]
   #;[border-right-color rgb(231, 118, 0)]
   #;[border-bottom-color rgb(231, 118, 0)]
   #;[border-left-color rgb(231, 118, 0)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-top-left-radius (% 50)]
   #;[border-top-right-radius (% 50)]
   #;[border-bottom-right-radius (% 50)]
   #;[border-bottom-left-radius (% 50)]
   #;[content " "]
   [display block]
   [height (px 15)]
   [width (px 15)])
  ((and (class a-viewoptions-section))
   [position relative]
   [display block]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(221, 221, 221)]
   #;[font-size (px 0)])
  ((and (tag ul) (class a-viewoptions-list))
   #;[list-style-type none]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[font-size (px 0)]
   #;[line-height 1]
   [display inline-block])
  ((desc (and (tag ul) (class a-viewoptions-list)) (and (tag li) (class a-viewoptions-list-item)))
   #;[list-style-type none]
   [display inline-block])
  ((or (desc (and (tag ul) (class a-viewoptions-list)) (and (tag li) (class a-viewoptions-list-item)) (and (tag a))) (desc (and (tag ul) (class a-viewoptions-list)) (and (tag li) (class a-viewoptions-list-item) (class a-viewoptions-list-info))))
   #;[color rgb(17, 17, 17)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[font-size (px 13)]
   [display block]
   #;[line-height 1]
   [padding-top (px 8)]
   [padding-right (px 6)]
   [padding-bottom (px 8)]
   [padding-left (px 6)]
   [border-bottom-width (px 2)]
   [border-bottom-style solid]
   #;[border-bottom-color transparent]
   [position relative]
   [bottom (px -1)])
  ((desc (and (tag ul) (class a-viewoptions-list)) (and (tag li) (class a-viewoptions-list-item)) (and (tag a)) (and (class a-icon)))
   [position relative]
   [bottom (px -1)]
   [margin-right 0.4235em]
   #;[opacity 0.4])
  ((desc (and (tag ul) (class a-viewoptions-list)) (and (tag li) (class a-viewoptions-list-item) (class a-viewoptions-list-dropdown)) (and (tag a)))
   [padding-right (px 16)])
  ((desc (and (tag ul) (class a-viewoptions-list)) (and (tag li) (class a-viewoptions-list-item) (class a-viewoptions-list-dropdown)) (and (tag a)) (and (class a-icon-dropdown)))
   [position absolute]
   [right (px 6)]
   [top (px 10)]
   #;[opacity 1]
   [margin-right (px 0)]
   [bottom auto])
  ((desc (and (tag ul) (class a-viewoptions-list)) (and (tag li) (class a-viewoptions-list-item) (class a-viewoptions-list-icon)) (and (class a-icon)))
   [margin-right (px 0)])
  (("ul.a-viewoptions-list li.a-viewoptions-list-item + li.a-viewoptions-list-item" (or))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 4)])
  (("ul.a-viewoptions-list + ul.a-viewoptions-list" (or))
   [margin-left (px 18)]
   [padding-left (px 18)]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(221, 221, 221)])
  (("ul.a-viewoptions-list + ul.a-viewoptions-list .a-viewoptions-list-label" (or))
   #;[font-size (px 13)]
   #;[font-weight 400]
   #;[color rgb(85, 85, 85)]
   [margin-right 0.385em])
  ((or (and (class a-expander-partial-collapse-container)) (and (class a-expander-partial-collapse-content)))
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative])
  ((and (class a-expander-partial-collapse-header))
   [position absolute]
   [bottom (px 0)]
   [width (% 100)]
   #;[background-color rgb(255, 255, 255)]
   #;[transition-property opacity]
   #;[transition-duration 0.4s]
   #;[transition-timing-function ease-out]
   #;[transition-delay (px 0)])
  ((and (class a-expander-content-fade))
   [height (px 16)]
   [width (% 100)]
   [position absolute]
   [top (px -16)]
   [left (px 0)]
   #;[background-color transparent]
   #;[background-image linear-gradient(to bottom, rgba(255, 255, 255, 0), rgb(255, 255, 255))]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (class a-switch-row))
   [display inline-block]
   [padding-right (px 31)]
   [position relative])
  ((".a-switch-row::after, .a-switch-row::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  ((desc (and (class a-switch-row)) (and (class a-switch-label)))
   #;[transition-property all]
   #;[transition-duration 300ms]
   #;[transition-timing-function ease]
   #;[transition-delay (px 0)]
   [display inline-block]
   [margin-right (px 6)]
   #;[line-height (px 21)]
   #;[color rgb(118, 118, 118)]
   #;[cursor pointer])
  ((and (class a-switch))
   [display block]
   [float right]
   [position absolute]
   [top (px 0)]
   [right (px 0)]
   [height (px 21)]
   [width (px 31)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-right-color rgb(173, 177, 184)]
   #;[border-bottom-color rgb(173, 177, 184)]
   #;[border-left-color rgb(173, 177, 184)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-top-color rgb(141, 144, 150)]
   #;[background-color rgb(240, 240, 240)]
   #;[box-shadow (px 0)]
   #;[transition-property all]
   #;[transition-duration 300ms]
   #;[transition-timing-function ease]
   #;[transition-delay (px 0)])
  ((".a-switch::after, .a-switch::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  ((and (class a-switch-control))
   [position absolute]
   [left (px -1)]
   [top (px -1)]
   [display block]
   #;[z-index 1]
   #;[cursor pointer]
   [height (px 21)]
   [width (px 21)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-right-color rgb(162, 166, 172)]
   #;[border-left-color rgb(162, 166, 172)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-top-color rgb(173, 177, 184)]
   #;[border-bottom-color rgb(141, 144, 150)]
   #;[background-color transparent]
   #;[background-image linear-gradient(to bottom, rgb(239, 241, 243), rgb(255, 255, 255))]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[box-shadow (px 0)])
  ((desc (and (class a-active)) (and (class a-switch-control)))
   #;[border-top-color rgb(173, 88, 0)]
   #;[border-right-color rgb(185, 94, 0)]
   #;[border-bottom-color rgb(207, 106, 0)]
   #;[border-left-color rgb(185, 94, 0)]
   [left (px 10)])
  ((desc (and (class a-transition)) (and (class a-switch-control)))
   [left (px 0)]
   #;[transform translateX(-1px)])
  ((desc (and (class a-transition)) (and (class a-active)) (and (class a-switch-control)))
   [left (px 0)]
   #;[transform translateX(10px)])
  ((or (desc (and (tag ul) (class a-box-list)) (and (tag a) (class a-switch-col))) (desc (and (tag ul) (class a-box-list)) (and (tag a) (class a-switch-control))))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class a-no-js)) (and (class a-switch-row)) (and (class a-switch)))
   [display none])
  ((desc (and (class a-js)) (and (class a-switch-row)) (and (tag input)))
   [position absolute]
   [left auto]
   [top auto]
   #;[z-index -1]
   #;[opacity (px 0)])
  ((and (class a-carousel-container))
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class a-carousel-state))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (class a-carousel-header-row))
   [margin-bottom (px 20)])
  ((desc (and (class a-carousel-header-row)) (and (class a-span-last)))
   [float right])
  ((and (class a-carousel-row-inner))
   [position relative]
   [height (% 100)])
  ((".a-carousel-row-inner::after, .a-carousel-row-inner::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  ((and (class a-carousel-col))
   [overflow-x visible]
   [overflow-y visible]
   #;[min-height (px 1)]
   [position relative])
  ((desc (and (class a-carousel-has-buttons)) (and (class a-carousel-center)))
   [margin-top (px 0)]
   [margin-right (px 40)]
   [margin-bottom (px 0)]
   [margin-left (px 40)])
  ((and (class a-carousel-center))
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class a-carousel-left))
   [left (px 0)]
   [padding-left (px 3)])
  ((and (class a-carousel-right))
   [text-align right]
   [right (px 0)]
   [padding-right (px 3)])
  ((or (and (class a-carousel-left)) (and (class a-carousel-right)))
   [width (px 40)]
   [height (% 100)]
   [position absolute]
   [top (px 0)]
   #;[z-index 1])
  ((and (class a-carousel-viewport))
   [width (% 100)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class a-carousel-button))
   [position relative]
   [top (% 40)]
   [margin-top (px -16)])
  ((and (tag ol) (class a-carousel))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[list-style-type none]
   [height (% 100)]
   #;[white-space nowrap]
   [overflow-x visible]
   #;[color rgb(17, 17, 17)]
   #;[letter-spacing (px -4)])
  ((and (class a-carousel-card))
   #;[vertical-align top]
   [text-align left]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-left (px 16)]
   [width (px 160)]
   #;[min-height (% 100)]
   #;[list-style-type none]
   [display inline-block]
   #;[white-space normal]
   #;[letter-spacing normal])
  ((and (class a-carousel-card-empty))
   #;[max-height (px 175)]
   [height (% 100)]
   #;[background-color transparent]
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/amazonui/loading/loading-2x-gray._V1_.gif")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position 50% 50%]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (class a-carousel-transition-slide)) (and (class a-carousel)))
   [position relative])
  ((desc (and (class a-carousel-display-single)) (and (class a-carousel-card)))
   [width (% 100)]
   [text-align center]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class a-carousel-display-single)) (and (class a-carousel-card)) (and (tag img)))
   #;[max-width (% 100)]
   #;[max-height (% 100)]
   [width (% 100)])
  ((or (desc (and (class a-carousel-transition-freeScroll)) (and (class a-carousel-viewport))) (desc (and (class a-carousel-transition-none)) (and (class a-carousel-viewport))))
   [overflow-x scroll]
   [overflow-y visible])
  ((desc (and (class a-carousel-init-empty)) (and (class a-carousel-viewport)))
   [height (px 150)])
  ((desc (and (class a-carousel-row)) (and (class a-carousel-photo)))
   [display table]
   #;[table-layout fixed]
   [width (% 100)]
   [margin-bottom (px 6)])
  ((desc (and (class a-carousel-row)) (and (class a-carousel-photo-inner)))
   [display table-cell]
   #;[vertical-align middle]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class a-carousel-display-variableWidth)) (and (class a-carousel-card)))
   [width (px 270)]
   #;[vertical-align middle]
   #;[min-width (px 110)]
   #;[max-width (px 270)]
   [margin-left (px 8)]
   [margin-right (px 8)])
  ((or (desc (and (class gw-ftGr-desktop-hero)) (and (class gw-hero-image)) (and (class cropped-image-map-size)) (and (tag img))) (desc (and (class gw-ftGr-desktop-hero)) (and (class image-map)) (and (class cropped-image-map-size)) (and (tag img))))
   [height (px 300)]
   [width (px 1500)])
  ((or (desc (and (id gw-desktop-herotator)) (and (class gw-hero-image)) (and (class cropped-image-map-size))) (desc (and (id gw-desktop-herotator)) (and (class image-map)) (and (class cropped-image-map-size))))
   [height (px 300)]
   [width (% 100)])
  ((and (id gw-desktop-herotator))
   [position relative])
  ((and (id gw-desktop-herotator-controls))
   [position absolute]
   [height (px 0)]
   [bottom (px 0)]
   [width (% 100)])
  ((desc (and (id gw-desktop-herotator-controls)) (and (tag ol)))
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [position relative]
   [bottom (px 24)])
  ((desc (and (id gw-desktop-herotator-controls)) (and (tag ol)) (and (tag li)))
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside]
   [display none])
  ((desc (and (class gw-desktop-herotator-ready)) (and (id gw-desktop-herotator-controls)) (and (tag ol)) (and (tag li)))
   [display block]
   [float left]
   [padding-top (px 0)]
   [padding-right (px 5)]
   [padding-bottom (px 0)]
   [padding-left (px 5)])
  ((desc (and (class gw-desktop-herotator-ready)) (and (id gw-desktop-herotator-controls)) (and (tag ol)) (and (tag li)) (and (tag a)))
   [display block]
   [width (px 12)]
   [height (px 13)]
   #;[background-position -19px -46px]
   #;[background-repeat no-repeat])
  ((desc (and (id gw-desktop-herotator-controls)) (and (class gw-text)))
   [position absolute]
   [top (px -10000)]
   [left (px -10000)])
  ((desc (and (class a-lt-ie9)) (and (class gw-ftGr-desktop-hero)) (and (tag span)))
   [width (px 1500)])
  ((and (class gw-spinner))
   #;[background-color transparent]
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/AUIClients/AmazonGatewayAuiAssets-loading-spinner-1af74fe87992c48b734d5c68f8ab795e0e9e3759._V2_.gif")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position 50% 50%]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [display inline-block]
   #;[vertical-align top]
   [width (px 70)]
   [height (px 70)])
  ((and (class gw-loading-stripe))
   #;[background-color transparent]
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/AUIClients/AmazonGatewayAuiAssets-loading-stripe-6e2e2549824f90e7ebf588143008d35ffb8498ab._V2_.gif")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [display inline-block]
   #;[vertical-align top]
   [width (px 900)]
   [height (px 3)])
  ((and (id pageContent))
   #;[max-width (px 1500)]
   #;[min-width (px 1000)]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto]
   [overflow-x hidden]
   [overflow-y hidden]
   [width (px 1500)])
  ((desc (and (id pageContent)) (and (tag hr)))
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [height (px 1)]
   #;[background-color rgb(238, 238, 238)]
   #;[color rgb(238, 238, 238)]
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
   #;[border-image-repeat stretch stretch])
  ((desc (and (id sidebar)) (and (tag hr)))
   [width (% 100)]
   [margin-top (px 15)]
   [margin-right (px 0)]
   [margin-bottom (px 15)]
   [margin-left (px 0)])
  ((desc (and (id sidebar)) (and (tag hr) (class desktop-ad-atf-hr)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 15)]
   [margin-left (px 0)])
  ((and (class billboardRowWrapper))
   [padding-top (px 12)]
   [padding-right (px 0)]
   [padding-bottom (px 12)]
   [padding-left (px 0)])
  ((and (class adcenterRowWrapper))
   [padding-top (px 6)]
   [padding-right (px 12)]
   [padding-bottom (px 18)]
   [padding-left (px 12)])
  ((desc (and (id a-page)) (and (class billboardRow)) (and (tag a) (class a-link-normal)))
   #;[max-width (px 440)]
   #;[min-width (px 330)]
   [display block]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto]
   [width (px 440)])
  ((desc (and (id a-page)) (and (class billboardRow)) (and (tag img)))
   #;[max-height (px 200)]
   [height (% 100)])
  ((desc (and (class a-lt-ie9)) (and (id a-page)) (and (class billboardRow)) (and (class a-link-normal)))
   [display block])
  ((and (class billboard))
   #;[vertical-align middle]
   [display inline-block]
   [width (% 100)]
   [height (% 100)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   #;[max-height (px 200)]
   [text-align center]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (id sidebar))
   [position relative]
   [padding-top (px 10)]
   [padding-right (px 23)]
   [padding-bottom (px 10)]
   [padding-left (px 23)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (class a-no-js)) (and (id sidebar)))
   [display none])
  (("#sidebar::before" (or))
   #;[content ""]
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 0)]
   #;[background-color rgba(0, 0, 0, 0.024)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[z-index 2]
   #;[pointer-events none])
  ((".a-lt-ie10 #sidebar::before" (or))
   [display none])
  (("html[data-useragent*=\"MSIE 10.0\"] #sidebar::before" (or))
   [display none])
  ((and (id btfContent))
   [padding-top (px 5)]
   [padding-right (px 20)]
   [padding-bottom (px 0)]
   [padding-left (px 20)])
  ((or (and (class bestsellers)) (and (class desktop-row)) (and (class sidekick)))
   [width (% 100)])
  ((and (class gwCurrencyINR))
   #;[color rgb(68, 68, 68)]
   #;[background-color transparent]
   #;[background-image url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAwAAAAQCAYAAAAiYZ4HAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAB1WlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS40LjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyI+CiAgICAgICAgIDx0aWZmOkNvbXByZXNzaW9uPjE8L3RpZmY6Q29tcHJlc3Npb24+CiAgICAgICAgIDx0aWZmOk9yaWVudGF0aW9uPjE8L3RpZmY6T3JpZW50YXRpb24+CiAgICAgICAgIDx0aWZmOlBob3RvbWV0cmljSW50ZXJwcmV0YXRpb24+MjwvdGlmZjpQaG90b21ldHJpY0ludGVycHJldGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KAtiABQAAAQ5JREFUKBVjYCARMILU9/b2/p86aTJBravWrmEAa3j8+NH/ly9fgTXcv/eYYeq0iQyP7j8A85tamhk0NDXBbBMTE7B6MAeZABmgJK8Axmlpaf+R5Sh3Esy0kpISsLOMjI0YKqqqwMJa2loMLCCWrKwcittWr1r/H+YHS2trBmS3gxV++/7t/7Wr1xg+fPjAsGf3boZVK1aCTQyLCGfo6OxEMQws8e7d+/8hQUFwj4LYIFvAkriIGzdu/NfW1gZr2rNnD37FMENApoKCE6QRFLQwcbx0a0sLWBPIWXgVIkvC/FNRXk6cJpBzYP4h6HmYTWfOnIH7BxQgMHFwxME4yDQoskChdfHiRYbLl67DpQCuoZHobQGsRAAAAABJRU5ErkJggg==")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position center center]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [display inline-block]
   [width (px 10)]
   [padding-left (px 10)]
   [padding-top (px 2)]
   #;[text-indent (px -10000)])
  ((desc (and (class price)) (and (class currencyINRFallback)))
   [display inline-block])
  ((and (class displayAd))
   [padding-top (px 5)]
   [width (px 300)]
   [position relative]
   [margin-left (px -18)]
   #;[z-index 3]
   #;[background-color rgb(255, 255, 255)])
  ((desc (and (class displayAd)) (and (tag a)))
   [top (px -5)]
   [right (px 0)])
  ((and (id DAr2))
   [height (px 270)])
  ((".displayAd::before" (or))
   #;[content ""]
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 0)]
   #;[background-color rgba(0, 0, 0, 0.024)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[z-index -1]
   #;[pointer-events none])
  (("#html[data-useragent*=\"MSIE 10.0\"] .displayAd::before, .a-lt-ie10 .displayAd::before" (or))
   [display none])
  ((and (class rhf_header))
   [padding-top (px 20)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)])
  ((desc (and (class rhfWrapper)) (and (id white-mask)))
   #;[max-width (px 1440)]
   [width (px 1440)])
  ((desc (and (id mainContent)) (and (class slot-hr)))
   [display none])
  ((desc (and (class a-touch)) (and (id mainContent)) (and (class slot-hr)))
   [display block])
  ((desc (and (class a-touch)) (and (id mainContent)) (and (class youtique)))
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(238, 238, 238)])
  ((desc (and (class first-carousel)) (and (class feed-carousel-control)))
   [display inline])
  ((desc (and (class a-touch)) (and (class first-carousel)) (and (class feed-carousel-control)))
   [display none])
  ((or (desc (and (id a-page)) (and (id gw-ftGr-desktop-takeover)) (and (class gw-stFBack-wrapper))) (desc (and (id a-page)) (and (class gw-ftGr-desktop-hero)) (and (class gw-stFBack-wrapper))))
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden]
   [width (% 100)]
   [height (px 300)])
  ((or (desc (and (id a-page)) (and (id gw-ftGr-desktop-takeover)) (and (class gw-stFBack-wrapper)) (and (class gw-stFBack))) (desc (and (id a-page)) (and (class gw-ftGr-desktop-hero)) (and (class gw-stFBack-wrapper)) (and (class gw-stFBack))))
   [text-align center]
   [position absolute]
   [top (px 0)]
   [right (% -200)]
   [bottom (px 0)]
   [left (% -200)])
  ((or (desc (and (id a-page)) (and (id gw-ftGr-desktop-takeover)) (and (class gw-stFBack-wrapper)) (and (tag img))) (desc (and (id a-page)) (and (class gw-ftGr-desktop-hero)) (and (class gw-stFBack-wrapper)) (and (tag img))))
   [width auto]
   [height (px 300)]
   #;[max-width none]
   #;[max-height (px 300)])
  ((or (and (id gw-sign-in-widget)) (and (id gw-sign-in-widget-in)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (id unrec-pageContent)) (and (id gw-sign-in-widget)))
   [position relative]
   [width (% 100)]
   [text-align left]
   #;[z-index 10]
   [padding-bottom (px 55)])
  ((desc (and (id unrec-pageContent)) (and (id gw-sign-in-widget)) (and (id gw-form-section)))
   [padding-right (px 14)]
   [padding-left (px 14)])
  ((desc (and (id gw-sign-in-widget)) (and (id gw-sign-in-section)))
   [margin-bottom (% 15)])
  ((desc (and (id gw-sign-in-widget)) (and (id gw-forget-password)))
   [float right])
  ((and (id gw-sign-in-widget-in))
   [height (% 100)])
  ((desc (and (id gw-sign-in-widget)) (and (class full-width)))
   [width (% 100)])
  ((desc (and (id gw-sign-in-widget)) (and (id gw-new-to-amazon-divider)))
   [margin-bottom (px 36)])
  ((desc (and (id gw-sign-in-widget)) (and (id fwcim-container)))
   [display none])
  ((desc (and (id gw-sign-in-widget)) (and (id gw-sign-in-legal)))
   [position absolute]
   [bottom (px 0)])
  ((and (id gw-sign-in-widget-http))
   [text-align center]
   [width (% 100)]
   [position relative])
  ((desc (and (id gw-sign-in-widget-http)) (and (id gw-sign-in-widget-http-in)))
   [height (% 100)])
  ((desc (and (id gw-sign-in-widget-http)) (and (id gw-sign-in-widget-http-in)) (and (id gw-sign-in-widget-welcome-section)))
   [margin-top (% 35)]
   [margin-bottom (% 28)])
  ((desc (and (id gw-sign-in-widget-http)) (and (id gw-sign-in-widget-http-in)) (and (id gw-sign-in-widget-sign-in-section)) (and (class a-button-primary)))
   [width (% 90)])
  ((desc (and (id gw-sign-in-widget-http)) (and (id gw-sign-in-widget-http-in)) (and (id gw-sign-in-widget-bottom-section)))
   [position absolute]
   [bottom (px 0)]
   [left (px 0)]
   [right (px 0)])
  ((desc (and (id gw-sign-in-widget-http)) (and (id gw-sign-in-widget-http-in)) (and (id gw-sign-in-widget-bottom-section)) (and (tag a) (class a-link-normal)))
   [display inline-block])
  ((and (id unrec-pageContent))
   #;[max-width (px 1500)]
   #;[min-width (px 1000)]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto]
   [overflow-x hidden]
   [overflow-y hidden]
   [width (px 1500)])
  ((desc (and (id unrec-pageContent)) (and (id gw-content-grid)))
   [padding-top (px 14)]
   [padding-right (px 14)]
   [padding-bottom (px 14)]
   [padding-left (px 14)])
  ((desc (and (id unrec-pageContent)) (and (id gw-content-grid)))
   [padding-left (px 0)]
   [padding-right (px 0)])
  ((desc (and (id unrec-pageContent)) (and (id gw-col-4)))
   #;[max-width (px 300)]
   #;[min-width (px 300)]
   [width (px 300)])
  ((desc (and (id unrec-pageContent)) (and (class gw-flex-row-container)))
   [display flex]
   #;[flex-direction row]
   #;[justify-content center]
   #;[align-items stretch])
  ((desc (and (id unrec-pageContent)) (and (class gw-flex-col)))
   [position relative]
   #;[flex-grow 1]
   #;[flex-shrink 1]
   #;[flex-basis auto]
   [display flex])
  ((desc (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class desktop-unrec-col)))
   [width (% 100)]
   #;[align-self stretch]
   [padding-top (px 14)]
   [padding-right (px 14)]
   [padding-bottom (px 14)]
   [padding-left (px 14)]
   #;[max-height (px 520)]
   #;[min-height (px 460)])
  ((or (desc (and (id unrec-pageContent)) (and (id desktop-unrec-col-1))) (desc (and (id unrec-pageContent)) (and (id desktop-unrec-col-2))) (desc (and (id unrec-pageContent)) (and (id desktop-unrec-col-3))))
   [display flex]
   #;[flex-grow 1]
   #;[flex-shrink 1]
   #;[flex-basis auto]
   #;[align-self stretch])
  ((or (desc (and (id unrec-pageContent)) (and (id gw-col-1))) (desc (and (id unrec-pageContent)) (and (id gw-col-2))) (desc (and (id unrec-pageContent)) (and (id gw-col-3))))
   [margin-right (px 14)]
   #;[min-width (px 220)])
  (("#unrec-pageContent #gw-col-1::before, #unrec-pageContent #gw-col-2::before, #unrec-pageContent #gw-col-3::before, #unrec-pageContent .sidekick .deals-image::before" (or))
   #;[content ""]
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 0)]
   #;[background-color rgba(19, 19, 4, 0.04)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[z-index 2]
   #;[pointer-events none])
  ((desc (and (id unrec-pageContent)) (and (class sidebar)))
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 0)])
  ((desc (and (id unrec-pageContent)) (and (class sidebar)) (and (class sidebar-inner)))
   [position relative]
   [height (% 100)])
  ((desc (and (id unrec-pageContent)) (and (class sidebar)) (and (id desktop-unrec-ad)))
   [height (px 250)]
   [position absolute]
   [bottom (px 0)])
  ((desc (and (id unrec-pageContent)) (and (class sidekick)))
   [overflow-x hidden]
   [overflow-y hidden]
   #;[max-height (% 100)]
   [height auto]
   [width (% 100)]
   [position absolute]
   [top (px 0)]
   [bottom (px 250)]
   [margin-bottom (px 14)])
  ((desc (and (id unrec-pageContent)) (and (id DAr2)))
   [height (px 274)])
  ((desc (and (id a-page)) (and (class gw-flex-col)) (and (tag a) (class a-link-normal)))
   [position relative]
   [display block]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto])
  ((desc (and (id a-page)) (and (class gw-flex-col)) (and (tag img)))
   [width (% 100)]
   [height (% 100)])
  ((desc (and (class a-lt-ie9)) (and (id a-page)) (and (class gw-flex-col)) (and (class a-link-normal)))
   [display block])
  ((or (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (class gw-flex-row-container))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (class gw-flex-row-container))))
   [display block])
  ((or (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (class gw-flex-col))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (class gw-flex-col))))
   [position relative]
   [display block]
   [height (px 500)]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-top (px 5)]
   [margin-right (px 5)]
   [margin-bottom (px 5)]
   [margin-left (px 5)]
   #;[min-width (px 200)])
  ((or (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class desktop-unrec-col))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class desktop-unrec-col))))
   [height (px 500)])
  ((or (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class desktop-unrec-col)) (and (id desktop-unrec-col-1))) (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class desktop-unrec-col)) (and (id desktop-unrec-col-2))) (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class desktop-unrec-col)) (and (id desktop-unrec-col-3))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class desktop-unrec-col)) (and (id desktop-unrec-col-1))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class desktop-unrec-col)) (and (id desktop-unrec-col-2))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class desktop-unrec-col)) (and (id desktop-unrec-col-3))))
   [height (px 500)])
  ((or (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (id gw-sign-in-widget-http))) (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class airy-gw-resizeable-inline-video))) (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class popular-departments))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (id gw-sign-in-widget-http))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class airy-gw-resizeable-inline-video))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class popular-departments))))
   [height (px 472)])
  ((or (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (id gw-sign-in-widget-http))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (id gw-sign-in-widget-http))))
   [padding-bottom (px 14)])
  ((or (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (id gw-sign-in-widget-http)) (and (id gw-sign-in-widget-http-in))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (id gw-sign-in-widget-http)) (and (id gw-sign-in-widget-http-in))))
   [position relative])
  ((or (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (id gw-sign-in-widget-http)) (and (id gw-sign-in-widget-http-in)) (and (id gw-sign-in-widget-welcome-section))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (id gw-sign-in-widget-http)) (and (id gw-sign-in-widget-http-in)) (and (id gw-sign-in-widget-welcome-section))))
   [margin-top auto])
  ((or (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (id gw-sign-in-widget-http)) (and (id gw-sign-in-widget-http-in)) (and (id gw-sign-in-widget-bottom-section))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (id gw-sign-in-widget-http)) (and (id gw-sign-in-widget-http-in)) (and (id gw-sign-in-widget-bottom-section))))
   [bottom (px 14)])
  ((or (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class airy-gw-resizeable-inline-video)) (and (class airy-video-viewport)) (and (class airy-video-viewport-in))) (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class popular-departments)) (and (class imageGridRowWrapper)) (and (class imageGridRowWrapper-inner))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class airy-gw-resizeable-inline-video)) (and (class airy-video-viewport)) (and (class airy-video-viewport-in))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (class gw-flex-col)) (and (class popular-departments)) (and (class imageGridRowWrapper)) (and (class imageGridRowWrapper-inner))))
   [position relative]
   [top (px 0)]
   #;[transform none]
   #;[max-height (px 352)])
  ((or (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (id gw-col-3))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (id gw-col-3))))
   [margin-right (px 0)])
  ((or (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (id gw-col-4))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (id gw-col-4))))
   #;[max-width (px 350)]
   #;[min-width (px 230)]
   [width (px 350)])
  ((or (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (id gw-col-2)) (and (tag img))) (desc (and (class a-lt-ie10)) (and (id unrec-pageContent)) (and (id gw-col-3)) (and (tag img))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (id gw-col-2)) (and (tag img))) (desc (and (class no-flex)) (and (id unrec-pageContent)) (and (id gw-col-3)) (and (tag img))))
   #;[max-height (px 352)]
   [height auto])
  ((and (tag div) (class feed-carousel))
   [width (% 100)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 5)]
   [margin-left (px 0)]
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class feed-carousel)) (and (class feed-carousel-viewport)))
   [width (% 100)]
   #;[min-height (px 220)]
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class feed-carousel-touch)) (and (class feed-carousel-viewport)))
   [overflow-x scroll])
  ((desc (and (class feed-carousel)) (and (class feed-carousel-shelf)))
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
  ((desc (and (class feed-carousel)) (and (class spinner)))
   [display none]
   #;[background-color rgb(255, 255, 255)]
   [position absolute]
   #;[line-height (% 100)]
   [left (px 0)]
   [right (px 0)]
   [top (px 0)]
   [bottom (px 0)]
   [text-align center]
   [padding-top (px 50)])
  ((desc (and (class feed-carousel)) (and (class feed-carousel-control)))
   [position absolute]
   [top (px 55)]
   #;[background-color rgb(255, 255, 255)]
   [height (px 100)]
   #;[line-height (px 100)]
   [width (px 45)]
   [text-align center]
   #;[box-shadow (px 0)]
   [display none])
  ((desc (and (class feed-carousel)) (and (class feed-left)))
   [left (px 0)]
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 0)]
   #;[clip rect(-10px, 55px, 110px, 0px)]
   [padding-right (px 5)])
  ((desc (and (class feed-carousel)) (and (class feed-right)))
   [right (px 0)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 3)]
   #;[clip rect(-10px, 45px, 110px, -10px)]
   [padding-left (px 5)])
  ((desc (and (class feed-carousel)) (and (class feed-arrow)))
   [display inline-block]
   #;[line-height normal]
   #;[vertical-align top]
   [position relative]
   [top (% 50)]
   [height (px 22)]
   [width (px 13)]
   [margin-top (px -11)])
  ((desc (and (class feed-carousel)) (and (class feed-scrollbar)))
   [display block]
   [position absolute]
   [height (px 6)]
   [bottom (px 0)]
   [left (px 0)]
   [width (% 100)]
   #;[font-size (px 0)])
  ((".desktop-row:hover .feed-scrollbar-track" (or))
   [height (px 2)])
  ((desc (and (class feed-carousel)) (and (class feed-scrollbar-track)))
   [display block]
   #;[background-color rgb(238, 238, 238)]
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
  ((desc (and (class feed-carousel)) (and (class feed-scrollbar-thumb)))
   [display none]
   #;[background-color rgb(170, 170, 170)]
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
  ((or (desc (and (class a-touch)) (and (class feed-carousel)) (and (class feed-carousel-control))) (desc (and (class a-touch)) (and (class feed-carousel)) (and (class feed-scrollbar))))
   [display none])
  ((desc (and (class a-no-js)) (and (class feed-carousel)) (and (class feed-carousel-viewport)))
   [overflow-x scroll])
  ((desc (and (class a-no-js)) (and (class feed-scrollbar)))
   [display none])
  (("html[data-useragent*=\" Trident/\"] .feed-carousel-viewport" (or))
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(255, 255, 255)]
   [border-right-width (px 1)]
   [border-right-style solid]
   #;[border-right-color rgb(255, 255, 255)])
  ((desc (and (class a-lt-ie8)) (and (class feed-carousel)) (and (class feed-carousel-shelf)))
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class fresh-shoveler))
   [padding-top (px 10)]
   [padding-right (px 20)]
   [padding-bottom (px 10)]
   [padding-left (px 20)])
  ((desc (and (class fresh-shoveler)) (and (class as-title-block)))
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-top (px 10)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class fresh-shoveler)) (and (class as-title-block-left)))
   [display block]
   [width auto]
   [float left]
   #;[font-family Arial,sans]
   #;[font-size (px 21)]
   #;[line-height 1.5]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis]
   #;[font-weight 400]
   [padding-bottom (px 0)])
  ((desc (and (class fresh-shoveler)) (and (class as-title-block-single-title)))
   [display block]
   [width (% 100)]
   [float left]
   #;[font-family Arial,sans]
   #;[font-size (px 21)]
   #;[line-height 1.5]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis]
   #;[font-weight 400]
   [padding-bottom (px 0)])
  ((desc (and (class fresh-shoveler)) (and (class as-title-block-right)))
   [display block]
   [width auto]
   [float left]
   [text-align right]
   #;[font-family Arial,sans]
   #;[font-size (px 14)]
   #;[vertical-align middle]
   [padding-left (px 15)]
   #;[line-height (px 35)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis])
  ((or (desc (and (class fresh-shoveler)) (and (class as-title-block-left)) (and (class a-color-secondary))) (desc (and (class fresh-shoveler)) (and (class as-title-block-right)) (and (class a-color-base))) (desc (and (class fresh-shoveler)) (and (class as-title-block-right)) (and (class as-title-divider))))
   [display none])
  ((desc (and (class fresh-shoveler)) (and (class feed-carousel-card)))
   [text-align center]
   #;[min-width (px 145)]
   #;[max-width (px 270)]
   #;[max-height (px 200)]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [position relative]
   [width (px 270)])
  ((desc (and (class fresh-shoveler)) (and (class feed-carousel)) (and (class feed-carousel-card)) (and (class product-image)))
   [width (px 270)]
   [height auto]
   #;[max-width (px 270)]
   #;[max-height (px 200)]
   #;[vertical-align middle])
  ((desc (and (class fresh-shoveler)) (and (class feed-carousel)) (and (class feed-carousel-card)))
   [display none])
  ((".fresh-shoveler .feed-carousel .feed-carousel-card::before" (or))
   #;[content ""]
   [display inline-block]
   [height (% 100)]
   #;[vertical-align middle]
   #;[min-height inherit])
  ((desc (and (class a-ie8)) (and (class fresh-shoveler)) (and (class feed-carousel-card)) (and *))
   #;[max-width inherit]
   #;[max-height inherit]
   [width inherit])
  ((desc (and (class a-no-js)) (and (class fresh-shoveler)) (and (class feed-carousel)) (and (class feed-carousel-card)))
   [display inline-block])
  ((desc (and (class a-lt-ie8)) (and (class fresh-shoveler)) (and (class feed-carousel)) (and (class product-image)))
   [height (px 200)])
  ((desc (and (class gw-small)) (and (class fresh-shoveler-tablet-app)) (and (class feed-carousel-card)))
   #;[max-width (px 215)]
   [height (px 150)]
   #;[min-height (px 150)]
   [width (px 215)])
  ((desc (and (class gw-small)) (and (class fresh-shoveler-tablet-app)) (and (class as-image-link)))
   [height (px 150)])
  ((and (class fresh-shoveler-tablet-app))
   [padding-top (px 10)]
   [padding-right (px 0)]
   [padding-bottom (px 10)]
   [padding-left (px 0)])
  ((desc (and (class fresh-shoveler-tablet-app)) (and (class as-title-block)))
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 5)]
   [margin-left (px 15)])
  ((desc (and (class fresh-shoveler-tablet-app)) (and (class as-title-block-left)))
   [display block]
   [width auto]
   [float left]
   #;[font-family Arial,sans]
   #;[font-size (px 21)]
   #;[line-height 1.5]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis]
   #;[font-weight 400]
   [padding-bottom (px 0)])
  ((desc (and (class fresh-shoveler-tablet-app)) (and (class as-title-block-single-title)))
   [display block]
   [width (% 100)]
   [float left]
   #;[font-family Arial,sans]
   #;[font-size (px 21)]
   #;[line-height 1.5]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis]
   #;[font-weight 400]
   [padding-bottom (px 0)])
  ((desc (and (class fresh-shoveler-tablet-app)) (and (class as-title-block-right)))
   [display block]
   [width auto]
   [float left]
   [text-align right]
   #;[font-family Arial,sans]
   #;[font-size (px 18)]
   #;[vertical-align middle]
   #;[line-height (px 29)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis]
   [padding-left (px 20)])
  ((desc (and (class fresh-shoveler-tablet-app)) (and (class feed-carousel-card)))
   #;[max-width (px 215)]
   [height (px 165)]
   #;[min-height (px 165)]
   [position relative]
   #;[white-space normal]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 40)]
   [width (px 215)])
  ((desc (and (class fresh-shoveler-tablet-app)) (and (class feed-carousel-shelf)))
   [padding-right (px 20)])
  ((desc (and (class fresh-shoveler-tablet-app)) (and (class as-image-link)))
   [text-align center]
   [height (px 165)])
  ((desc (and (class fresh-shoveler-tablet-app)) (and (class as-metadata)))
   [position absolute]
   [left (px 0)]
   [right (px 0)]
   [top (px 150)])
  ((desc (and (class fresh-shoveler-tablet-app)) (and (class as-prime-badge)))
   [padding-left (px 5)])
  ((desc (and (class fresh-shoveler-tablet-app)) (and (class product-link)))
   #;[max-height 3em]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class fresh-shoveler-tablet-app)) (and (class feed-carousel)))
   [height auto]
   #;[min-height initial])
  ((desc (and (class fresh-shoveler-tablet-app)) (and (class feed-carousel)) (and (class feed-carousel-card)) (and (class product-image)))
   [width (px 215)]
   [height auto]
   #;[max-width (px 215)]
   #;[max-height (px 165)]
   #;[vertical-align middle])
  ((desc (and (class fresh-shoveler-tablet-app)) (and (class feed-carousel)) (and (class feed-carousel-card)))
   [display none])
  ((".fresh-shoveler-tablet-app .feed-carousel .as-image-link::before" (or))
   #;[content ""]
   [display inline-block]
   [height (% 100)]
   #;[vertical-align middle]
   #;[min-height inherit])
  ((desc (and (class fresh-shoveler-tablet-app)) (and (class a-icon-prime) (class a-icon-small)))
   [position relative]
   [bottom (px -2)])
  ((and (id gw-asin-popover))
   [width (% 100)]
   [height (% 100)]
   #;[background-color rgb(255, 255, 255)]
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
   [padding-top (% 3)]
   [padding-right (% 3)]
   [padding-bottom (% 3)]
   [padding-left (% 3)]
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative])
  ((or (desc (and (id gw-asin-popover)) (and (class content))) (desc (and (id gw-asin-popover)) (and (class detailblock))) (and (id gw-popover-wrapper)))
   [height (% 100)])
  ((desc (and (id gw-asin-popover)) (and (class detailblock)))
   [position relative]
   #;[z-index 2])
  (("#gw-asin-popover .detailblock::before" (or))
   #;[content ""]
   [display inline-block]
   [height (% 100)]
   #;[vertical-align middle])
  ((desc (and (id gw-asin-popover)) (and (class details)))
   [width (% 35)]
   [display inline-block]
   #;[vertical-align middle])
  ((desc (and (id gw-asin-popover)) (and (class imgblock)))
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
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
  (("#gw-asin-popover .imgblock::before" (or))
   #;[content ""]
   [display inline-block]
   [height (% 100)]
   #;[vertical-align middle])
  ((desc (and (id gw-asin-popover)) (and (tag img) (class product-image)))
   #;[max-width (% 100)]
   #;[max-height (% 100)]
   [width (% 100)]
   [height auto]
   #;[vertical-align middle]
   #;[color transparent])
  ((desc (and (id gw-asin-popover)) (and (class title)))
   [display block]
   #;[font-family Arial]
   #;[color rgb(17, 17, 17)]
   #;[font-size (px 24)]
   #;[line-height 1.33]
   [margin-bottom (px 12)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[max-height (px 96)])
  ((desc (and (id gw-asin-popover)) (and (class byline)))
   #;[font-size (px 18)]
   #;[line-height 1.5]
   #;[white-space nowrap]
   #;[text-overflow ellipsis]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (id gw-asin-popover)) (and (class pricing)))
   #;[font-size (px 22)]
   [margin-bottom (px 28)])
  ((desc (and (id gw-asin-popover)) (and (class reviews)))
   [display block]
   #;[font-size (px 16)]
   #;[vertical-align middle]
   [margin-bottom (px 36)]
   #;[min-height (px 19.2)])
  ((desc (and (id gw-asin-popover)) (and (class pricing)) (and (class price)) (and (class price-block)))
   [display block]
   [padding-bottom (px 5)])
  ((desc (and (id gw-asin-popover)) (and (class pricing)) (and (class gwCurrencyINR)))
   [padding-left (px 15)]
   [padding-top (px 1)])
  ((desc (and (id gw-asin-popover)) (and (class a-button)))
   [width (px 210)]
   #;[max-width (px 210)])
  ((desc (and (id gw-asin-popover)) (and (class two-buttons)) (and (class a-button)))
   [margin-bottom (px 10)])
  ((desc (and (id gw-asin-popover)) (and (class loading)))
   [position absolute]
   [top (% 50)]
   [left (px 0)]
   [right (px 0)]
   [margin-top (px -50)]
   [text-align center]
   [display none])
  ((desc (and (id gw-asin-popover)) (and (class close-icon)))
   [height (px 36)]
   [width (px 36)]
   #;[background-position -96px -46px]
   [position absolute]
   [top (px 10)]
   [right (px 10)]
   #;[cursor pointer]
   #;[opacity 0.5]
   #;[z-index 4])
  ((desc (and (id gw-asin-popover)) (and (class pricing)) (and (class ppu)) (and (class gwCurrencyINR)))
   #;[background-size auto 65%]
   [padding-left (px 9)])
  ((and (id gw-quick-look-btn))
   [display none]
   [position absolute]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 7)]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto]
   [width (px 180)]
   #;[max-width (px 180)])
  ((and (id gw-quick-look-btn) (class active))
   [display inline-block])
  ((desc (and (class feed-carousel)) (and (class feed-carousel-card)) (and (class a-list-item)))
   [text-align center]
   [position relative]
   [display inline-block]
   #;[min-width (px 145)])
  ((desc (and (class a-popover-modal-fixed-height)) (and (class a-popover-wrapper)))
   #;[background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
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
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 0)]
   #;[box-shadow none])
  ((and (id gw-asin-popover))
   [height (% 70)])
  ((and (id sims-section))
   [height (% 30)])
  ((and (class sims-img))
   #;[max-height (px 100)]
   #;[max-width (px 130)]
   #;[vertical-align middle]
   [width (px 130)])
  ((and (class sims-container))
   [height (px 141)]
   [width (% 100)])
  ((and (class sims-wrapper))
   #;[background-color rgb(242, 242, 242)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [height (px 2)]
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative])
  ((and (class sims-header))
   [padding-top (px 15)]
   [position relative]
   #;[z-index 2])
  ((and (class sims-header-text))
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [display block]
   [text-align center]
   #;[white-space nowrap])
  ((and (class sims-img-link))
   [display inline-block]
   [padding-right (px 10)]
   [padding-left (px 10)]
   [height (% 100)]
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative]
   #;[z-index 2])
  ((and (class sims-img-container))
   [height (% 100)]
   [display inline-block]
   [position relative]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (class sims-img-border))
   [bottom (px 0)]
   [left (% 8)]
   [position absolute]
   [height (px 4)]
   [width (% 84)]
   #;[z-index 2])
  ((".sims-img-container::before" (or))
   #;[content ""]
   [display inline-block]
   #;[vertical-align middle]
   [height (% 100)])
  ((and (class sims-loading))
   [height (px 2)])
  ((desc (and (class sims-loading)) (and (tag img)))
   [height (% 100)]
   [width (% 100)])
  ((and (class sims-details))
   [overflow-x hidden]
   [overflow-y hidden]
   [height (% 100)]
   [margin-left (px 10)])
  ((and (class sims-img-overlay))
   [position absolute]
   [left (px 0)]
   [top (px 0)]
   [height (% 100)]
   [width (% 100)]
   #;[vertical-align middle])
  ((desc (and (class shogun-widget)) (and (tag a) (class a-link-emphasis)))
   [display inline-block])
  ((or (desc (and (class multi-pack)) (and (class image-section))) (desc (and (class multi-pack)) (and (class inner-pack))) (desc (and (class shogun-widget)) (and (class a-box))))
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (tag div) (class multi-pack)) (and (tag a) (class list-link)))
   [width (% 100)]
   [display inline-block])
  ((and (tag img) (class shogun-s9-pixel))
   [width (px 1)]
   [height (px 1)]
   [display none])
  ((and (tag iframe) (class shogun-s9-pixel))
   [width (px 0)]
   [height (px 0)]
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
  ((and (class airy-gw-resizeable-inline-video))
   [position relative]
   [width (% 100)]
   [padding-bottom (px 34)])
  ((desc (and (class airy-gw-resizeable-inline-video)) (and (class resizeable-warpper)))
   [position absolute]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 34)]
   [top (px 45)])
  ((desc (and (class airy-gw-resizeable-inline-video)) (and (class resizeable-warpper)) (and (class resizeable-warpper-inner)))
   [position relative]
   [height (% 100)]
   [width (% 100)])
  ((desc (and (class airy-gw-resizeable-inline-video)) (and (class vertical-warpper)))
   [display inline-block]
   [position relative]
   [height (% 100)])
  ((".airy-gw-resizeable-inline-video .vertical-warpper::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  ((desc (and (class airy-gw-resizeable-inline-video)) (and (class vertical-warpper-inner)))
   [height (% 100)]
   [text-align center]
   [display inline-block])
  ((".airy-gw-resizeable-inline-video .vertical-warpper-inner::before" (or))
   #;[content ""]
   [display inline-block]
   [height (% 100)]
   #;[vertical-align middle]
   #;[min-height inherit])
  ((desc (and (class airy-gw-resizeable-inline-video)) (and (class bottom-section)))
   [position absolute]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 0)])
  ((or (desc (and (class airy-gw-resizeable-inline-video)) (and (class seemore))) (desc (and (class airy-gw-resizeable-inline-video)) (and (tag h3))))
   [text-align left])
  ((desc (and (class airy-gw-resizeable-inline-video)) (and (tag h3)))
   [padding-bottom (px 18)])
  ((desc (and (class airy-gw-resizeable-inline-video)) (and (class airy-video-viewport)))
   #;[max-width (% 96)]
   [position relative]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto]
   #;[max-height (% 100)]
   #;[vertical-align middle]
   [display inline-block]
   [width (% 96)])
  ((desc (and (class airy-gw-resizeable-inline-video)) (and (class image-map-after)))
   [display none])
  ((desc (and (class airy-gw-resizeable-inline-video)) (and (tag img)))
   [height auto]
   [width (px 324)]
   #;[max-width (px 324)])
  ((or (desc (and (class airy-gw-resizeable-inline-video)) (and (class airy-video-container))) (desc (and (class airy-gw-resizeable-inline-video)) (and (class airy-video-container-in))))
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 0)]
   [height (% 100)]
   [width (% 100)])
  ((desc (and (class airy-gw-resizeable-inline-video)) (and (class airy-renderer-container)) (and (tag video)))
   [height auto])
  ((and (class bestseller-list))
   [padding-top (px 15)])
  ((desc (and (class bestseller-list)) (and (tag h3)))
   #;[font-size (px 16)]
   #;[color rgb(68, 68, 68)]
   [text-align center]
   [margin-bottom (px 15)])
  ((desc (and (class bestseller-list)) (and (class ranking)))
   #;[font-size (px 36)]
   #;[line-height (px 36)]
   #;[color rgb(204, 204, 204)]
   [position absolute]
   [top (% 50)]
   [margin-top -0.5em]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[white-space nowrap]
   [float left]
   [width (px 30)])
  ((desc (and (class bestseller-list)) (and (class listRow)))
   [width (px 140)]
   [height auto]
   [margin-top auto]
   [margin-right auto]
   [margin-left auto]
   [margin-bottom (px 10)]
   [position relative])
  ((desc (and (class bestseller-list)) (and (class seemore)))
   #;[font-size (px 13)]
   [margin-bottom (px 15)]
   [text-align center])
  ((desc (and (class bestseller-list)) (and (tag img)))
   #;[max-height (px 100)]
   #;[max-width (px 75)]
   [height auto]
   [width (px 75)])
  ((desc (and (class shogun-widget) (class composite-image)) (and (class composite-graphic)))
   [margin-left auto]
   [margin-right auto])
  ((desc (and (class composite-graphic)) (and (class aui-abs-image)))
   [position absolute]
   #;[z-index -1])
  ((desc (and (class shogun-widget) (class composite-image)) (and (class composite-width-wrapper)) (and (class composite-graphic)) (and (class aui-abs-image)) (and (tag img)))
   #;[max-width none]
   #;[max-height none]
   [display block])
  ((desc (and (class composite-image)) (and (class composite-width-wrapper)))
   [margin-left auto]
   [margin-right auto]
   [position relative]
   #;[z-index 1])
  ((desc (and (class shogun-widget) (class composite-image)) (and (class composite-map)))
   [width (% 100)]
   [height (% 100)])
  ((desc (and (class composite-image)) (and (class composite-graphic-alttext)))
   [display block]
   #;[visibility hidden]
   [height (% 100)]
   [width (% 100)]
   [position absolute]
   [top (px 0)]
   [right (px 0)]
   [bottom (px 0)]
   [left (px 0)])
  ((and (class deals-image))
   [position relative]
   [height (% 100)]
   [padding-top (px 14)]
   [padding-right (px 14)]
   [padding-bottom (px 14)]
   [padding-left (px 14)])
  ((desc (and (class deals-image)) (and (class deals-inner)))
   [position relative]
   [height (% 100)]
   [width (% 100)]
   [text-align center])
  ((desc (and (class deals-image)) (and (class deals-inner)) (and (tag h3)))
   [text-align left])
  ((desc (and (class deals-image)) (and (class deals-inner)) (and (class dotd-content-container)))
   [position absolute]
   [bottom (px 0)]
   [top (px 49)]
   [left (px 0)]
   [right (px 0)])
  ((desc (and (class deals-image)) (and (class deals-inner)) (and (class a-fixed-right-grid)))
   [height (% 100)])
  ((or (desc (and (class deals-image)) (and (class deals-inner)) (and (class a-fixed-right-grid)) (and (id dotd-info))) (desc (and (class deals-image)) (and (class deals-inner)) (and (class a-fixed-right-grid)) (and (class a-fixed-right-grid-inner))))
   [height (% 100)]
   [text-align left])
  ((desc (and (class deals-image)) (and (class deals-inner)) (and (class a-fixed-right-grid)) (and (id dotd-image)))
   [text-align center]
   [height (% 100)])
  ((desc (and (class deals-image)) (and (class deals-inner)) (and (class image-section)))
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
   [padding-left (px 0)]
   [height (% 100)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class deals-image)) (and (class deals-inner)) (and (class image-section)) (and (class image-section-inner)))
   [height (% 100)]
   [text-align center]
   [display inline-block]
   #;[vertical-align top])
  ((desc (and (class deals-image)) (and (class deals-inner)) (and (class image-section)) (and (class image-section-inner)) (and (tag a) (class a-link-normal)))
   [display inline-block]
   [height auto])
  ((desc (and (class deals-image)) (and (class deals-inner)) (and (class image-section)) (and (class image-section-inner)) (and (tag img)))
   [height auto]
   [width (px 125)]
   #;[max-width (px 125)]
   #;[vertical-align middle])
  ((".deals-image .deals-inner .image-section::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  ((".deals-image .deals-inner .image-section-inner::before" (or))
   #;[content ""]
   [display inline-block]
   [height (% 100)]
   #;[vertical-align middle]
   #;[min-height inherit])
  ((desc (and (class deals-image)) (and (class deals-inner)) (and (class price-section)))
   [padding-bottom (px 34)]
   [height (% 100)])
  ((desc (and (class deals-image)) (and (class deals-inner)) (and (class bottom-section)))
   [position absolute]
   [bottom (px 0)]
   [left (px 0)]
   [right (px 0)])
  ((or (desc (and (id a-page)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner))) (desc (and (class a-no-js)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner))))
   [text-align center])
  ((or (desc (and (id a-page)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (class bottom-section))) (desc (and (id a-page)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (class price-section))) (desc (and (id a-page)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (tag h3))) (desc (and (class a-no-js)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (class bottom-section))) (desc (and (class a-no-js)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (class price-section))) (desc (and (class a-no-js)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (tag h3))))
   [text-align left])
  ((or (desc (and (id a-page)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (class image-section-warpper))) (desc (and (class a-no-js)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (class image-section-warpper))))
   [position absolute]
   [top (px 50)]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 86)])
  ((or (desc (and (id a-page)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (class image-section-warpper)) (and (class image-section-warpper-inner))) (desc (and (class a-no-js)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (class image-section-warpper)) (and (class image-section-warpper-inner))))
   [position relative]
   [height (% 100)]
   [padding-left (px 10)]
   [padding-right (px 10)])
  ((or (desc (and (id a-page)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (class image-section-inner)) (and (tag img))) (desc (and (class a-no-js)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (class image-section-inner)) (and (tag img))))
   #;[max-width (px 244)]
   [width (px 244)])
  ((or (desc (and (id a-page)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (class price-section))) (desc (and (class a-no-js)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (class price-section))))
   [position absolute]
   [bottom (px 34)]
   [left (px 0)]
   [right (px 0)]
   [display block]
   #;[vertical-align middle]
   [height auto])
  ((or (desc (and (id a-page)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (class price-section)) (and (class price-section-inner))) (desc (and (class a-no-js)) (and (class deals-image) (class deals-image-large)) (and (class deals-inner)) (and (class price-section)) (and (class price-section-inner))))
   [display block])
  ((desc (and (class deals-image) (class deals-image-small-fallback)) (and (class deals-inner)) (and (tag img)))
   #;[max-width (px 260)]
   [width (px 260)])
  ((desc (and (class deals-image) (class deals-image-large-fallback)) (and (class deals-inner)) (and (class deals-inner)) (and (class image-section-inner)))
   [padding-bottom (px 34)])
  ((desc (and (class deals-image) (class deals-image-large-fallback)) (and (class deals-inner)) (and (class deals-inner)) (and (tag img)))
   #;[max-width (px 260)]
   #;[max-height (px 360)]
   [width (px 260)])
  ((desc (and (class deals-image) (class deals-image-large-fallback)) (and (class deals-inner)) (and (class deals-inner)) (and (class bottom-section)))
   [text-align left])
  ((or (desc (and (class a-no-js)) (and (class deals-image) (class deals-image-small))) (desc (and (class a-no-js)) (and (class deals-image) (class deals-image-small-fallback))))
   [display none])
  ((desc (and (class a-lt-ie10)) (and (class deals-image) (class deals-image-small-fallback)) (and (class deals-inner)) (and (tag img)))
   #;[max-width (px 200)]
   [width (px 200)])
  ((and (class cropped-image-map-size))
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden]
   [width (% 100)])
  ((and (class cropped-image-map-center-alignment))
   [text-align center]
   [position absolute]
   [top (px 0)]
   [right (% -200)]
   [bottom (px 0)]
   [left (% -200)])
  ((and (class cropped-image-map-left-alignment))
   [position absolute]
   [top (px 0)]
   [right (% -400)]
   [bottom (px 0)]
   [left (px 0)]
   [text-align left])
  ((and (class cropped-image-map-right-alignment))
   [position absolute]
   [top (px 0)]
   [right (px 0)]
   [bottom (px 0)]
   [left (% -400)]
   [text-align right])
  ((desc (and (class a-lt-ie9)) (and (class image-shoveler)) (and (class feed-carousel)) (and (class feed-carousel-card)))
   [display inline-block])
  ((and (class popular-departments))
   [position relative]
   [width (% 100)]
   [padding-bottom (px 34)])
  ((desc (and (class popular-departments)) (and (tag img)))
   #;[max-height (% 100)]
   [height (% 100)])
  ((desc (and (class popular-departments)) (and (class bottom-section)))
   [position absolute]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 0)])
  ((or (desc (and (class popular-departments)) (and (class seemore))) (desc (and (class popular-departments)) (and (tag h3))))
   [text-align left])
  ((desc (and (class popular-departments)) (and (tag h3)))
   [padding-bottom (px 17)])
  ((desc (and (class popular-departments)) (and (class departmentTitle)))
   [margin-top (px 12)]
   [margin-right (px 0)]
   [margin-bottom (px 19)]
   [margin-left (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis])
  ((desc (and (class popular-departments)) (and (class imageGridRowWrapper)))
   [padding-left (% 2.5)]
   [padding-right (% 2.5)]
   [position relative])
  ((desc (and (class popular-departments)) (and (class imageGridRowWrapper)) (and (class leftCol)))
   [padding-right (px 8)])
  ((desc (and (class popular-departments)) (and (class imageGridRowWrapper)) (and (class rightCol)))
   [padding-left (px 8)])
  ((desc (and (class popular-departments)) (and (class imageGridRowWrapper)))
   [position absolute]
   [top (px 44)]
   [bottom (px 34)]
   [left (px 0)]
   [right (px 0)]
   [padding-left (% 2.5)]
   [padding-right (% 2.5)])
  ((desc (and (class popular-departments)) (and (class imageGridRowWrapper)) (and (class imageGridRowWrapper-inner)))
   [position relative]
   [height (% 100)])
  ((desc (and (class popular-departments)) (and (class imageGridRowWrapper)) (and (class imageGridRowWrapper-inner)) (and (class vertical-warpper)))
   [display inline-block]
   [position relative]
   [height (% 100)])
  ((".popular-departments .imageGridRowWrapper .imageGridRowWrapper-inner .vertical-warpper::before" (or))
   [display table]
   #;[content ""]
   #;[line-height (px 0)]
   #;[font-size (px 0)])
  ((desc (and (class popular-departments)) (and (class imageGridRowWrapper)) (and (class imageGridRowWrapper-inner)) (and (class vertical-warpper-inner)))
   [height (% 100)]
   [text-align center]
   [display inline-block])
  ((".popular-departments .imageGridRowWrapper .imageGridRowWrapper-inner .vertical-warpper-inner::before" (or))
   #;[content ""]
   [display inline-block]
   [height (% 100)]
   #;[vertical-align middle]
   #;[min-height inherit])
  ((desc (and (class popular-departments)) (and (class imageGridRowWrapper)) (and (class imageGridRowWrapper-inner)) (and (class quad-packs)))
   #;[max-width (% 96)]
   [position relative]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto]
   #;[max-height (% 100)]
   #;[vertical-align middle]
   [display inline-block]
   [width (% 96)])
  ((desc (and (class popular-departments)) (and (class imageGridRowWrapper)) (and (class imageGridRowWrapper-inner)) (and (class quad-packs)) (and (class leftCol)))
   [padding-right (px 8)])
  ((desc (and (class popular-departments)) (and (class imageGridRowWrapper)) (and (class imageGridRowWrapper-inner)) (and (class quad-packs)) (and (class rightCol)))
   [padding-left (px 8)])
  ((desc (and (class popular-departments)) (and (class imageGridRowWrapper)) (and (id col-left)) (and (class image-col)))
   [padding-right (% 7)])
  ((desc (and (class popular-departments)) (and (class imageGridRowWrapper)) (and (id col-right)) (and (class image-col)))
   [padding-left (% 7)])
  ((desc (and (class a-tablet)) (and (class scalable-image-map)) (and (tag img)))
   [height auto])
  ((desc (and (class scalable-image-map)) (and (tag a) (class a-link-normal)))
   [display inline-block])
  ((desc (and (class a-lt-ie9)) (and (class scalable-image-map)) (and (tag img)))
   [width (% 100)])
  ((desc (and (class a-popover-trigger) (class a-declarative)) (and (tag i)))
   [margin-left (px 0)])
  ((and (id desktop-0))
   [margin-top (px 20)]
   [margin-bottom (px 20)])
  ((and (class billboardRow))
   [margin-bottom (px 15)])
  ((desc (and (id pageContent)) (and (class billboardrow-hr)))
   [margin-bottom (px 20)])
  ((and (class red-sticker))
   #;[font-family Arial,sans-serif]
   [position absolute]
   [right (px 0)]
   [top (px 0)]
   [display block]
   [width (px 32)]
   [height (px 32)]
   [padding-top (px 5)]
   #;[font-size (px 12)]
   #;[line-height (px 12)]
   [text-align center]
   [float left]
   #;[color rgb(255, 255, 255)]
   #;[border-top-left-radius (% 50)]
   #;[border-top-right-radius (% 50)]
   #;[border-bottom-right-radius (% 50)]
   #;[border-bottom-left-radius (% 50)]
   #;[background-color rgb(165, 2, 0)]
   #;[background-image linear-gradient(to bottom, rgb(203, 4, 0), rgb(165, 2, 0))])
  ((desc (and (class a-lt-ie9)) (and (class image-shoveler)) (and (class feed-carousel)) (and (class feed-carousel-card)))
   [display inline-block])
  ((desc (and (id a-popover-1)) (and (class a-popover-header)))
   [display none])
  ((desc (and (id a-popover-1)) (and (class a-popover-inner)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   [height (% 100)])
  ((desc (and (id a-popover-1)) (and (class a-popover-header)))
   [display none])
  ((desc (and (id a-popover-1)) (and (class a-popover-inner)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   [height (% 100)])
  ((and (tag div) (id navSwmHoliday) (class nav-focus))
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
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (class nav-prime-tt))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (class nav-flyout-api))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (id pet_nav_tooltip))
   [height (px 200)]
   [width (px 328)]
   [position relative])
  (("#pet_nav_tooltip #pet_close_link, #pet_nav_tooltip #pet_close_link:hover, #pet_nav_tooltip #pet_close_link:active, #pet_nav_tooltip #pet_close_link:visited" (or (id pet_close_link)))
   [position absolute]
   [top (px 6)]
   [right (px 11)]
   #;[color white]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[font-family arial,sans-serif]
   #;[font-size (px 12)])
  ((and (class multi-item-multi-row-item))
   [float left]
   [height (px 98)]
   [position relative]
   [width (px 98)])
  ((and (class multi-item-multi-row-grid))
   [height (px 98)]
   [overflow-x hidden]
   [overflow-y hidden]
   [width auto])
  ((and (class multi-item-multi-row-grid-item))
   [float left]
   [height auto]
   #;[max-width (px 108)]
   #;[min-width (px 54)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 10)]
   [padding-left (px 10)]
   [position relative]
   [width (px 108)])
  ((and (class multi-item-multi-row-grid-split-1))
   [width (% 100)])
  ((and (class multi-item-multi-row-grid-split-2))
   [width (% 50)])
  ((and (class multi-item-multi-row-grid-split-3))
   [width (% 33)])
  ((and (class multi-item-multi-row-grid-split-4))
   [width (% 25)])
  ((and (class multi-item-multi-row-grid-split-5))
   [width (% 20)])
  ((and (class multi-item-multi-row-grid-split-6))
   [width (% 16)])
  ((and (class multi-item-multi-row-grid-split-7))
   [width (% 14)])
  ((and (class multi-item-multi-row-grid-split-8))
   [width (% 12)])
  ((and (class multi-item-multi-row-grid-split-9))
   [width (% 11)])
  ((and (class multi-item-multi-row-grid-split-10))
   [width (% 10)])
  ((and (class multi-item-multi-row-info))
   [overflow-x visible]
   [overflow-y visible]
   [width auto]
   [height auto]
   [margin-left (px 108)])
  ((and (class multi-item-multi-row-info-center))
   [height (px 98)])
  ((and (class multi-item-multi-row-info-clear))
   #;[clear left]
   [margin-left (px 0)]
   [margin-top (px 10)])
  ((and (class multi-item-multi-row-more-items-placeholder))
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [bottom (px 10)]
   [display none]
   [left (px 10)]
   [position absolute]
   [right (px 0)]
   [text-align center]
   [top (px 0)]
   #;[z-index 5])
  ((and (class multi-item-single-row-grid))
   [float left]
   [height (px 100)]
   [overflow-x hidden]
   [overflow-y hidden]
   [width auto])
  ((and (class multi-item-single-row-grid-item))
   [float left]
   [height (px 100)]
   [margin-right (px 14)]
   [position relative]
   [width (px 100)])
  ((and (class multi-item-single-row-info))
   [overflow-x visible]
   [overflow-y visible]
   [width auto]
   [height auto])
  ((and (class multi-item-single-row-info-center))
   [height (px 100)])
  ((and (class multi-item-single-row-info-clear))
   #;[clear left]
   [margin-left (px 0)]
   [margin-top (px 114)])
  ((and (class multi-item-single-row-info-inline-1))
   [margin-left (px 114)])
  ((and (class multi-item-single-row-info-inline-2))
   [margin-left (px 228)])
  ((and (class multi-item-single-row-info-inline-3))
   [margin-left (px 342)])
  ((and (class multi-item-single-row-info-inline-4))
   [margin-left (px 456)])
  ((and (class multi-item-single-row-info-inline-5))
   [margin-left (px 570)])
  ((and (class multi-item-single-row-info-inline-6))
   [margin-left (px 684)])
  ((and (class multi-item-single-row-info-inline-7))
   [margin-left (px 798)])
  ((and (class multi-item-single-row-info-inline-8))
   [margin-left (px 912)])
  ((and (class multi-item-single-row-info-inline-9))
   [margin-left (px 1026)])
  ((and (class multi-item-single-row-info-inline-10))
   [margin-left (px 1140)])
  ((and (class multi-item-single-row-more-items-placeholder))
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [bottom (px 0)]
   [display none]
   [left (px 0)]
   #;[line-height (px 100)]
   [position absolute]
   [right (px 0)]
   [text-align center]
   [top (px 0)]
   #;[z-index 5])
  ((and (class amzl-package-item-quantity))
   #;[background-color rgba(255, 255, 255, 0.9)]
   #;[border-top-left-radius (px 10)]
   #;[border-top-right-radius (px 10)]
   #;[border-bottom-right-radius (px 10)]
   #;[border-bottom-left-radius (px 10)]
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
   [bottom (px 0)]
   #;[font-size 0.8em]
   [height (px 20)]
   #;[line-height (px 20)]
   #;[min-width (px 20)]
   [padding-top (px 0)]
   [padding-right (px 5)]
   [padding-bottom (px 0)]
   [padding-left (px 5)]
   [position absolute]
   [right (px 0)]
   [text-align center]
   [width auto])
  ((desc (and (class simple-date-picker--horizontal)) (and (class simple-date-picker__date)))
   [box-sizing border-box]
   [float left]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (% 2.3)]
   [margin-left (% 2.3)]
   [width (% 12.3)])
  ((desc (and (class simple-date-picker--horizontal)) (and (class simple-date-picker__date--first-in-row)))
   [margin-left (px 0)])
  ((desc (and (class simple-date-picker--horizontal)) (and (class simple-date-picker__date__button)) (and (class a-button-text)))
   [height auto]
   #;[line-height 1rem]
   [padding-top (px 12)]
   [padding-right (px 0)]
   [padding-bottom (px 12)]
   [padding-left (px 0)])
  ((and (class amzl-inline-form-actions))
   [margin-top (px -14)]
   [margin-right (px -18)]
   [margin-bottom (px -14)]
   [margin-left (px -18)])
  ((desc (and (class amzl-inline-form-actions)) (and (class amzl-error-message)))
   [float left]
   [margin-top (px -4)]
   [width (% 50)])
  ((desc (and (class a-js)) (and (class hide-if-js)))
   [display none])
  ((desc (and (class a-no-js)) (and (class hide-if-no-js)))
   [display none])
  ((and (class amzl-action-container--with-radio))
   [margin-left (px 23)])
  ((desc (and (class multi-item-multi-row-grid)) (and (class amzl-package-item-quantity)))
   [bottom (px 10)]
   #;[z-index 1])
  ((and (class amzl-page-content))
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   #;[max-width (px 920)]
   [width (px 920)])
  ((and (id snow))
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   #;[background-color transparent]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[background-image url("https://images-na.ssl-images-amazon.com/images/G/01/csux/webdevs/holiday/snow1.png"), url("https://images-na.ssl-images-amazon.com/images/G/01/csux/webdevs/holiday/snow2.png"), url("https://images-na.ssl-images-amazon.com/images/G/01/csux/webdevs/holiday/snow3.png")]
   [height (px 70)]
   [top (% 55)]
   [position relative]
   #;[z-index -1]
   [width (% 100)]
   #;[animation-duration 10s]
   #;[animation-timing-function linear]
   #;[animation-delay (px 0)]
   #;[animation-direction normal]
   #;[animation-fill-mode none]
   #;[animation-iteration-count infinite]
   #;[animation-play-state running]
   #;[animation-name snow])
  ((and (id snow-mobile))
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   #;[background-color transparent]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[background-image url("https://images-na.ssl-images-amazon.com/images/G/01/csux/webdevs/holiday/snow1-mobile.png"), url("https://images-na.ssl-images-amazon.com/images/G/01/csux/webdevs/holiday/snow2-mobile.png"), url("https://images-na.ssl-images-amazon.com/images/G/01/csux/webdevs/holiday/snow3-mobile.png")]
   [height (px 160)]
   [position absolute]
   #;[z-index -1]
   [width (% 100)]
   #;[animation-duration 10s]
   #;[animation-timing-function linear]
   #;[animation-delay (px 0)]
   #;[animation-direction normal]
   #;[animation-fill-mode none]
   #;[animation-iteration-count infinite]
   #;[animation-play-state running]
   #;[animation-name snow])
  ((or (and (class snow-bg-t4)) (and (class snow-t4)))
   #;[background-image linear-gradient(0deg, rgb(151, 202, 225) 0px, rgb(66, 174, 225) 100%)]
   [width (px 900)]
   [height (px 50)]
   [position absolute])
  ((and (class snow-bg-t4))
   [top (px -23)])
  ((and (id snow-t4))
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   #;[background-color transparent]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[background-image url("https://images-na.ssl-images-amazon.com/images/G/01/csux/webdevs/holiday/snow1v4.png"), url("https://images-na.ssl-images-amazon.com/images/G/01/csux/webdevs/holiday/snow2v4.png"), url("https://images-na.ssl-images-amazon.com/images/G/01/csux/webdevs/holiday/snow3v4.png")]
   [height (px 50)]
   [top (px -23)]
   [position absolute]
   [width (% 100)]
   #;[animation-duration 10s]
   #;[animation-timing-function linear]
   #;[animation-delay (px 0)]
   #;[animation-direction normal]
   #;[animation-fill-mode none]
   #;[animation-iteration-count infinite]
   #;[animation-play-state running]
   #;[animation-name snow])
  ((and (class snow-mask-t4))
   [width (px 900)]
   [height (px 356)]
   [position absolute]
   [top (px -100)])
  ((or (and (id snow-t4)) (and (class snow-bg-t4)))
   [width (px 900)]
   [height (px 50)]
   [position absolute])
  ((or (and (id snow-t4)) (and (class snow-bg-t4)) (and (class snow-mask-t4)))
   [top (px -200)]
   [height (px 356)]
   [width (px 900)]
   #;[z-index -1])
  ((".ship-track-small-vertical-widget .pre-shipped-status.holiday:not(.warning)::before" (or))
   [left (px -25)]
   [top (px -7)]
   #;[background-color transparent]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[background-image none]
   [width (px 26)]
   [height (px 26)])
  ((desc (and (class DeliveryInfo-interstitial)) (and (tag ul) (class displayAddressUL)))
   [margin-left (px 0)])
  ((desc (and (class DeliveryInfo-interstitial)) (and (tag li) (class displayAddressLI)))
   #;[color rgb(17, 17, 17)]
   [display none]
   #;[list-style-type none])
  ((or (desc (and (class DeliveryInfo-interstitial)) (and (tag li) (class displayAddressLI) (class displayAddressAddressLine1))) (desc (and (class DeliveryInfo-interstitial)) (and (tag li) (class displayAddressLI) (class displayAddressAddressLine2))) (desc (and (class DeliveryInfo-interstitial)) (and (tag li) (class displayAddressLI) (class displayAddressFullName))))
   [display list-item])
  ((and (class a-tabs) (class tablet-nav))
   [text-align center])
  ((desc (and (class a-tabs) (class tablet-nav)) (and (tag li)))
   [float none]
   [display inline-block])
  ((desc (and (class a-tabs) (class tablet-nav)) (and (tag li) (class a-active)) (and (tag a)))
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(221, 221, 221)])
  ((and (id a-page))
   [margin-bottom (px 150)])
  ((and (class item-view-qty))
   #;[background-color rgba(255, 255, 255, 0.9)]
   #;[border-top-left-radius (px 10)]
   #;[border-top-right-radius (px 10)]
   #;[border-bottom-right-radius (px 10)]
   #;[border-bottom-left-radius (px 10)]
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
   [bottom (px 0)]
   #;[font-size 0.8em]
   [height (px 20)]
   #;[line-height (px 20)]
   #;[min-width (px 20)]
   [padding-top (px 0)]
   [padding-right (px 5)]
   [padding-bottom (px 0)]
   [padding-left (px 5)]
   [position absolute]
   [right (px 0)]
   [text-align center]
   [width auto])
  ((and (class wmp-submit-button))
   [width (% 100)])
  ((and (class wmp-modal-form-actions))
   [margin-bottom (px -14)]
   [margin-left (px -18)]
   [margin-right (px -18)])
  ((desc (and (class wmp-modal-form-actions)) (and (class wmp-submit-button)))
   [width auto])
  ((desc (and (class wmp-modal-form-actions)) (and (class wmp-error-message)))
   [float left]
   [text-align left])
  ((and (class wmp-multi-item-grid-centered-content))
   [height (px 100)])
  ((desc (and (class multi-item-multi-row-info-clear)) (and (class wmp-multi-item-grid-centered-content)))
   [height auto])
  ((desc (and (class multi-item-multi-row-grid)) (and (class item-view-qty)))
   [bottom (px 10)])
  ((and (class wmp-shipment-info-img-row))
   [width (px 100)]
   [float left]
   [position relative])
  ((and (class wmp-shipment-info-details-row))
   [width auto]
   [margin-left (px 114)])
  ((and (class wmp-init-hidden))
   [display none])
  ((and (class wmp-address-for-radio))
   [padding-left (px 23)])
  ((or (desc (and (class a-touch)) (and (class wmp-expander)) (and (class a-icon) (class a-icon-collapse))) (desc (and (class a-touch)) (and (class wmp-expander)) (and (class a-icon) (class a-icon-expand))))
   [width 0.7rem]
   [height 0.7rem]
   #;[background-position -36.6rem -8.6rem]
   [position absolute]
   [top (% 50)]
   [margin-top -0.4rem]
   [left (px 0)]
   #;[opacity 1])
  ((desc (and (class a-touch)) (and (class wmp-expander)) (and (class a-icon) (class a-icon-collapse)))
   #;[background-position -38.2rem -8.6rem]
   [left -0.3rem])
  ((desc (and (class a-js)) (and (class hide-if-js)))
   [display none])
  ((desc (and (class a-no-js)) (and (class hide-if-no-js)))
   [display none])
  ((desc (and (class a-no-js)) (and (class show-if-no-js)) (and (class a-expander-content)))
   [display block])
  ((and (class banner-hidden-by-default))
   [display none])
  ((and (class loading-spinner))
   [display none])
  ((child (and (class loading-spinner)) (and (tag img)))
   [display block]
   [margin-left auto]
   [margin-right auto])
  ((and (class custom-view-options))
   [position relative]
   [padding-left (px 5)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(221, 221, 221)])
  ((desc (and (class custom-view-options)) (and (tag ul)))
   [margin-bottom (px 0)])
  ((desc (and (class custom-view-options)) (and (tag li)))
   [position relative]
   [bottom (px -1)]
   [border-bottom-width (px 2)]
   [border-bottom-style solid]
   #;[border-bottom-color transparent])
  ((desc (and (class custom-view-options)) (and (class item)))
   [display inline-block]
   [padding-top (px 5)]
   [padding-right (px 10)]
   [padding-bottom (px 5)]
   [padding-left (px 10)])
  ((and (class time-period-chooser))
   [display inline-block])
  ((or (desc (and (class pagination-full)) (and (class dots))) (desc (and (class pagination-mini)) (and (class label))))
   [padding-top (px 8)]
   [padding-bottom (px 7)])
  ((desc (and (class pagination-mini)) (and (class label)))
   [display inline-block])
  ((desc (and (class top-controls)) (and (class a-pagination) (class a-text-center)))
   [text-align right])
  ((desc (and (class top-controls)) (and (tag ul) (class a-pagination)) (and (tag li) (class a-last)))
   [margin-right (px 0)])
  ((and (class search-bar))
   [display table])
  ((desc (and (class a-lt-ie7)) (and (class search-bar)))
   [display block])
  ((desc (and (class search-bar)) (and (class label)))
   [position absolute]
   [left (px -10000)]
   [top auto]
   [width (px 1)]
   [height (px 1)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class search-bar)) (and (class form-container)))
   [display table-row])
  ((desc (and (class a-lt-ie7)) (and (class search-bar)) (and (class form-container)))
   [display block]
   [float right]
   [width (% 100)])
  ((or (desc (and (class search-bar)) (and (class button-container))) (desc (and (class search-bar)) (and (class field-container))))
   [display table-cell])
  ((or (desc (and (class a-lt-ie7)) (and (class search-bar)) (and (class button-container))) (desc (and (class a-lt-ie7)) (and (class search-bar)) (and (class field-container))))
   [display inline])
  ((desc (and (class a-lt-ie7)) (and (class search-bar)) (and (class field-container)))
   [width (% 70)])
  ((desc (and (class a-lt-ie7)) (and (class search-bar)) (and (class button-container)))
   [width auto])
  ((desc (and (class search-bar)) (and (class button-container)))
   [padding-left (px 10)])
  ((or (child (desc (and (class search-bar)) (and (class button-container))) (and *)) (desc (and (class search-bar)) (and (class field))) (child (desc (and (class search-bar)) (and (class field-container))) (and *)))
   [width (% 100)])
  ((child (desc (and (class a-lt-ie7)) (and (class search-bar)) (and (class button-container))) (and *))
   [width auto])
  ((desc (and (class a-lt-ie7)) (and (class search-bar)) (and (class field)))
   [width (% 85)])
  ((and (class item-view-qty))
   #;[background-color rgba(255, 255, 255, 0.9)]
   #;[border-top-left-radius (px 10)]
   #;[border-top-right-radius (px 10)]
   #;[border-bottom-right-radius (px 10)]
   #;[border-bottom-left-radius (px 10)]
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
   [bottom (px 0)]
   #;[font-size 0.8em]
   [height (px 20)]
   #;[line-height (px 20)]
   #;[min-width (px 20)]
   [padding-top (px 0)]
   [padding-right (px 5)]
   [padding-bottom (px 0)]
   [padding-left (px 5)]
   [position absolute]
   [right (px 0)]
   [text-align center]
   [width auto])
  ((and (class order-date-invoice-item))
   [display inline-block]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[vertical-align middle]
   #;[white-space nowrap])
  ((and (class order-date-invoice-item-po-number))
   #;[max-width (% 100)]
   #;[text-overflow ellipsis]
   [width (% 100)])
  ((desc (and (class order-info)) (and (class recipient)) (and (class value)))
   [display block]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis])
  ((desc (and (class order-info)) (and (class actions)))
   [text-align right])
  ((and (class order-info-po-number))
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis])
  ((or (desc (and (class recipient-address)) (and (tag li))) (desc (and (class recipient-address)) (and (tag ul))))
   #;[list-style-type none]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[color rgb(0, 0, 0)])
  ((and (class order-attributes))
   [padding-left (px 8)])
  ((desc (and (class order-attributes)) (and (class gift-icon)))
   [margin-right 0.25em])
  ((and (class shipment-top-row))
   [position relative])
  ((desc (and (class shipment-top-row)) (and (class actions)))
   [position absolute]
   [bottom (px 0)]
   [right (px 0)])
  ((desc (and (class shipment)) (and (class holiday-message)) (and (tag img)))
   [margin-right (px 3)]
   #;[vertical-align bottom])
  ((desc (and (class shipment)) (and (class tracking-details)))
   [display none]
   [position relative]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(221, 221, 221)])
  ((desc (and (class shipment)) (and (class tracking-details)) (and (class package)))
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(240, 240, 240)])
  ((".shipment .tracking-details .package:last-child" (or))
   [border-bottom-width medium]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color])
  ((".shipment .tracking-details .package:last-child .package-inner" (or))
   [margin-bottom (px 0)])
  ((".shipment .tracking-details .package:first-child .package-inner" (or))
   [margin-top (px 0)])
  ((desc (and (class shipment)) (and (class tracking-details)) (and (class details)) (and (class col-l)))
   [width (px 139)])
  ((desc (and (class shipment)) (and (class tracking-details)) (and (class details)) (and (class col-r)))
   [padding-left (px 40)])
  ((desc (and (class shipment)) (and (class tracking-details)) (and (class details)) (and (class trackTable) (class fauxTable)) (and (class shiptrack_row)))
   [padding-top (px 3)]
   [padding-right (px 0)]
   [padding-bottom (px 3)]
   [padding-left (px 0)])
  ((desc (and (class shipment)) (and (class tracking-details)) (and (class details)) (and (class trackTable) (class fauxTable)) (and (class col-l)))
   [float left]
   [width (px 139)])
  ((desc (and (class shipment)) (and (class tracking-details)) (and (class details)) (and (class trackTable) (class fauxTable)) (and (class col-r)))
   [margin-left (px 139)]
   [padding-left (px 40)])
  ((desc (and (class shipment)) (and (class tracking-details)) (and (class hide)))
   [position absolute]
   [top (px 0)]
   [right (px 0)])
  ((desc (and (class shipment)) (and (class tracking-details)) (and (class loading-message)) (and (tag img)))
   [margin-right 0.25em])
  ((desc (and (class yo-action-dropdown)) (and (class a-button-text)))
   [text-align center])
  ((desc (and (class gift-card-instance)) (and (class recipient)))
   [display block]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis])
  ((and (class item-view-left-col-inner))
   [position relative]
   [display inline-block])
  ((or (desc (and (class order)) (and (class item-view-qty))) (desc (and (class shipment)) (and (class item-view-qty))))
   [bottom (px -3)]
   [right (px -3)])
  ((and (class giftbox-icon))
   #;[background-image url("https://images-na.ssl-images-amazon.com/images/G/01/x-locale/gifts/gift_btn.png")]
   #;[background-repeat no-repeat]
   #;[background-size 15px 15px]
   [display inline-block]
   #;[vertical-align top]
   #;[background-position 5px 2px])
  ((desc (and (class a-button) (class a-button-small)) (and (tag a) (class giftbox-icon)))
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 10)]
   [padding-left (px 25)])
  ((and (class fresh-image))
   [margin-right (px 20)])
  ((desc (and (class fresh-green-button)) (and (class a-button-inner)))
   [display inline])
  ((or (and (class delivery-actions-popover)) (and (class delivery-status)))
   [padding-top (px 5)])
  ((and (class delivery-actions-popover))
   [padding-left 0.385em])
  ((desc (and (class delivery-details)) (and (class a-box-inner)))
   [padding-top (px 7)]
   [padding-right (px 18)]
   [padding-bottom (px 7)]
   [padding-left (px 18)])
  ((desc (and (class delivery-details)) (and (class tracking-details)))
   [border-bottom-width (px 0)]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color])
  ((desc (and (class delivery_expander)) (and (class delivery-details)))
   [border-top-width (px 1)]
   [border-right-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 0)])
  ((desc (and (class delivery_expander)) (and (class delivery-items)))
   [margin-top (px 14)]
   [margin-right (px 18)]
   [margin-bottom (px 14)]
   [margin-left (px 18)])
  ((".delivery .a-button + .a-dropdown-container" (or))
   [margin-left (px 5)])
  ((or (and (class delivery-actions)) (and (class delivery-actions-popover)))
   [display inline-block])
  ((".delivery-actions .a-button:last-child, .delivery-details .a-button" (or))
   [margin-bottom (px 0)])
  ((desc (and (class deliveryItem)) (and (class a-icon-text-separator)))
   [margin-top (px -2)]
   [margin-right 0.4em]
   [margin-bottom (px 0)]
   [margin-left 0.4em])
  ((desc (and (class deliveryItem)) (and (class deliveryItem-cell)))
   [padding-top (px 10)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 10)])
  ((desc (and (class deliveryItem)) (and (class deliveryItem-cell_thumb)))
   [text-align center]
   [width (px 45)]
   [height (px 45)])
  ((desc (and (class deliveryItem)) (and (class deliveryItem-actions)))
   [padding-left (px 30)])
  ((desc (and (class deliveryItem)) (and (class deliveryItem-price)))
   [padding-left (px 40)])
  ((".deliveryItem:first-child .deliveryItem-cell" (or))
   [padding-top (px 0)])
  ((or (and (class deliveryItem-actions)) (and (class deliveryItem-price)))
   [text-align right]
   [width (% 10)])
  ((and (class deliveryItem-detailsExtra))
   [padding-top (px 3)]
   [padding-right (px 0)]
   [padding-bottom (px 3)]
   [padding-left (px 0)])
  ((and (class currencyINR))
   #;[background-color transparent]
   #;[background-image url("/images/G/31/common/sprites/sprite-site-wide-2._V1_.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position -27px -363px]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [display inline-block]
   [width (px 7)]
   [height (px 11)]
   #;[line-height 1em]
   #;[vertical-align text-bottom]
   [margin-bottom (px 2)]
   [margin-right (px 1)])
  ((and (id yourOrders))
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [width (px 920)]
   [position relative])
  ((and (class order-filter-dropdown))
   [margin-right 0.25em])
  ((and (class num-orders-for-orders-by-date))
   [display inline-block]
   [margin-right 0.25em])
  ((desc (and (class pagination-mini)) (and (class label)))
   [padding-left (px 13)]
   [padding-right (px 12)])
  ((and (id yourOrdersContent))
   [width (px 920)])
  ((and (id rightRail))
   [display none]
   [position absolute]
   [left (px 940)])
  ((and (class gcItemAction))
   [margin-left (px 10)])
  ((and (class reorder-modal-unavailable-content))
   #;[max-width (px 300)]
   [width (px 300)])
  ((and (class reorder-modal-available-content))
   #;[max-width (px 500)]
   [width (px 500)])
  ((and (class reorder-modal-footer))
   [text-align right])
  ((desc (and (class a-no-js)) (and (id hud-dashboard)))
   [display none])
  ((and (class audible-mem1-bottom-center))
   [margin-top (px 334)]
   [margin-left (px 318)])
  ((and (class audible-mem1-credit-text))
   [margin-left (px 75)]
   [margin-top (px 7)])
  ((and (class audible-mem0-bottom-center))
   [margin-top (px 334)]
   [margin-left (px 297)])
  ((and (class audible-mem0-credit-text))
   [margin-left (px 46)]
   [margin-top (px 7)])
  ((desc (and (class a-section)) (and (class gw-hud-t1)))
   [padding-bottom (px 3)])
  ((desc (and (class gw-hud-t2)) (and (class middle-align-element)))
   [display table-cell]
   #;[vertical-align middle]
   [height (px 60)]
   #;[color rgb(255, 255, 255)])
  ((desc (and (class gw-hud-t1)) (and (class middle-align-element)))
   [display table-cell]
   #;[vertical-align middle]
   [height (px 42)]
   #;[color rgb(35, 47, 62)])
  ((and (class reward-points-sup))
   [padding-left (px 5)])
  ((and (class currency-sup))
   [padding-right (px 2)])
  ((desc (and (class gw-hud-t2)) (and (id hud-dashboard)))
   #;[background-color rgb(35, 47, 62)]
   [padding-left (px 23)]
   [position relative]
   #;[min-width (px 1000)]
   [overflow-y hidden]
   [height (px 65)])
  ((desc (and (class gw-hud-t1)) (and (id hud-dashboard)))
   #;[background-color rgb(255, 255, 255)]
   [padding-left (px 23)]
   #;[box-shadow (px 0)]
   [position relative]
   #;[min-width (px 1000)]
   [overflow-y hidden]
   [height (px 45)]
   [margin-bottom (px 0)]
   #;[z-index 1])
  ((desc (and (id hud-dashboard)) (and (class item-container)))
   [float left]
   [margin-bottom (px 0)]
   [position relative])
  ((desc (and (id hud-dashboard)) (and (class hud-holiday-left)))
   #;[background-position -6px 1px]
   #;[background-size cover]
   [float left]
   [height (px 60)]
   [width (px 25)]
   [margin-left (px -12)]
   [margin-right (px 10)])
  ((desc (and (id hud-dashboard)) (and (class hud-holiday-right)))
   #;[background-position -36px 0px]
   #;[background-size cover]
   [float left]
   [height (px 60)]
   [width (px 132)]
   [margin-right (px 7)]
   [margin-top (px 5)])
  ((desc (and (class gw-hud-t2)) (and (id hud-dashboard)) (and (class profile-image)))
   #;[border-top-left-radius (px 25)]
   #;[border-top-right-radius (px 25)]
   #;[border-bottom-right-radius (px 25)]
   #;[border-bottom-left-radius (px 25)]
   [margin-right (px 10)]
   [margin-top (px 7)]
   [width (px 50)]
   [height (px 50)]
   #;[background-size cover]
   #;[background-repeat no-repeat])
  ((desc (and (class gw-hud-t1)) (and (id hud-dashboard)) (and (class profile-image)))
   #;[border-top-left-radius (px 25)]
   #;[border-top-right-radius (px 25)]
   #;[border-bottom-right-radius (px 25)]
   #;[border-bottom-left-radius (px 25)]
   [margin-right (px 8)]
   [margin-top (px 5)]
   [width (px 35)]
   [height (px 35)]
   #;[background-size cover]
   #;[background-repeat no-repeat])
  ((desc (and (id hud-dashboard)) (and (class customer-name-container)))
   [margin-right (px 30)])
  ((desc (and (class gw-hud-t1)) (and (id hud-dashboard)) (and (class customer-name)))
   #;[font-size (px 13)]
   #;[font-weight 700]
   [padding-top (px 14)])
  ((desc (and (class gw-hud-t2)) (and (id hud-dashboard)) (and (class customer-name)))
   #;[font-size (px 15)]
   #;[font-weight 700]
   [padding-top (px 23)])
  ((desc (and (id hud-dashboard)) (and (class hud-sign-in-container)))
   [position relative])
  ((desc (and (id hud-dashboard)) (and (class sign-in-msg-container)))
   [margin-right (px 30)]
   [margin-left (px 40)])
  ((desc (and (class gw-hud-t2)) (and (id hud-dashboard)) (and (class sign-in-msg)))
   #;[font-size (px 15)]
   [padding-top (px 5)])
  ((desc (and (class gw-hud-t1)) (and (id hud-dashboard)) (and (class sign-in-button)))
   [height (px 41)])
  ((desc (and (class gw-hud-t2)) (and (id hud-dashboard)) (and (class sign-in-button)))
   [height (px 65)])
  ((desc (and (class gw-hud-t1)) (and (id hud-dashboard)) (and (class sign-in-button)) (and (class a-button-inner)))
   [width (px 80)]
   [height (px 20)])
  ((desc (and (class gw-hud-t2)) (and (id hud-dashboard)) (and (class sign-in-button)) (and (class a-button-inner)))
   [width (px 90)]
   [height (px 25)])
  ((desc (and (class gw-hud-t1)) (and (id hud-dashboard)) (and (class sign-in-button)) (and (class a-button-text)))
   [margin-top (px -4)])
  ((desc (and (class gw-hud-t2)) (and (id hud-dashboard)) (and (class sign-in-button)) (and (class a-button-text)))
   [margin-top (px -2)])
  ((desc (and (class hud-container)) (and (class a-carousel-card)))
   [text-align left])
  ((desc (and (class gw-hud-t1)) (and (id hud-dashboard)) (and (class label)))
   #;[font-size (px 12)]
   #;[color rgb(118, 118, 118)]
   [margin-top (px 10)]
   [margin-bottom (px 0)]
   #;[line-height (px 10)])
  ((desc (and (class gw-hud-t1)) (and (id hud-dashboard)) (and (class value)))
   #;[font-size (px 12)]
   #;[line-height (px 15)]
   [margin-bottom (px 10)]
   [margin-top (px 3)]
   [height (px 10)]
   #;[color rgb(35, 47, 62)])
  ((desc (and (class gw-hud-t2)) (and (id hud-dashboard)) (and (class label)))
   #;[font-size (px 13)]
   #;[color rgb(204, 204, 204)]
   [margin-top (px 18)]
   [margin-bottom (px 10)]
   #;[line-height (px 10)])
  ((desc (and (class gw-hud-t2)) (and (id hud-dashboard)) (and (class value)))
   #;[font-size (px 16)]
   #;[line-height (px 8)]
   [height (px 10)]
   #;[color rgb(255, 255, 255)])
  ((desc (and (id hud-dashboard)) (and (class subtext)))
   #;[font-size (px 12)]
   [margin-top (px 10)]
   [margin-bottom (px 0)]
   #;[line-height (px 12)]
   [display none])
  ((desc (and (id hud-dashboard)) (and (class value)) (and (tag sup)))
   [position static]
   #;[font-size (% 100)])
  ((desc (and (id hud-dashboard)) (and (class modal-link)))
   [float left])
  (("#hud-dashboard .modal-link::after" (or))
   #;[content "›"]
   [padding-left (px 2)])
  ((desc (and (id hud-dashboard)) (and (class a-carousel-button)))
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
   #;[background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (id hud-dashboard)) (and (class a-button)) (and (class a-button-inner)))
   #;[background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[box-shadow none]
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
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 0)])
  (("#hud-dashboard .a-carousel-button .a-button:active .a-button-inner, #hud-dashboard .a-carousel-button.a-button-focus, #hud-dashboard .a-carousel-button:focus" (or))
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
   #;[box-shadow none]
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 0)])
  ((or (desc (and (id hud-dashboard)) (and (class a-icon-next))) (desc (and (id hud-dashboard)) (and (class a-icon-previous))))
   [width (px 15)]
   [height (px 27)])
  (("#hud-dashboard a.a-carousel-goto-nextpage:active, #hud-dashboard a.a-carousel-goto-prevpage:active" (or))
   [padding-top (px 3)])
  ((desc (and (id hud-dashboard)) (and (class feedback-tag)))
   [width (px 100)]
   [text-align center]
   #;[background-color rgb(215, 215, 215)]
   [position absolute]
   [top (px 0)]
   [right (px 25)])
  ((and (id hud-no-paginate))
   [float left]
   [height (px 75)]
   [overflow-y hidden])
  ((desc (and (class gw-hud-t1)) (and (class hud-no-paginate)))
   [float left]
   [margin-left (px 65)]
   [padding-bottom (px 0)])
  ((desc (and (class gw-hud-t2)) (and (class hud-no-paginate)))
   [float left]
   [margin-left (px 64)]
   [padding-bottom (px 35)])
  ((desc (and (id hud-dashboard)) (and (class a-icon-popover)))
   [display none])
  ((desc (and (id hud-dashboard)) (and (class hud-no-paginate-first)))
   [margin-left (px 0)])
  ((desc (and (class gw-hud-t1)) (and (class hud-separator)))
   [float left]
   [width (px 1)]
   [height (px 30)]
   [margin-top (px 7.5)]
   [margin-right (px 20)]
   #;[background-color rgb(189, 192, 197)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (class gw-hud-t2)) (and (class hud-separator)))
   [float left]
   [width (px 1)]
   [height (px 45)]
   [margin-top (px 10)]
   [margin-right (px 23)]
   #;[background-color rgb(64, 81, 102)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (class hud-sns-separator))
   [display inline-block]
   [width (px 1)]
   [height (px 230)]
   #;[background-color rgb(170, 170, 170)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [margin-top (px 2)]
   [margin-right (px 2)]
   [margin-bottom (px 2)]
   [margin-left (px 2)])
  ((and (class hud-visa-rewards-separator))
   [display inline-block]
   [width (px 1)]
   [height (px 52)]
   #;[background-color rgb(170, 170, 170)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [margin-top (px 2)]
   [margin-right (px 2)]
   [margin-bottom (px 2)]
   [margin-left (px 2)])
  ((and (class hud-scroll))
   [overflow-y scroll]
   [height (px 400)]
   [padding-right (px 15)])
  ((and (class modal-gutter))
   [margin-top (px 10)]
   [margin-right (px 10)]
   [margin-bottom (px 10)]
   [margin-left (px 10)])
  ((desc (and (class modal-gutter)) (and (class a-icon-popover)))
   [margin-left (px 0)])
  ((desc (and (class sns-container)) (and (class hud-sns-img)))
   #;[max-height (px 50)]
   #;[max-width (px 50)]
   [width (px 50)])
  ((desc (and (class sns-container)) (and (class hud-sns-img-box)))
   [display table-cell]
   #;[vertical-align middle]
   [width (% 10)])
  ((desc (and (class sns-container)) (and (class sns-label)))
   [margin-bottom (px -3)])
  ((desc (and (class orders-container)) (and (class hud-orders-img)))
   #;[max-width (px 90)]
   #;[max-height (px 90)]
   [width (px 90)])
  ((desc (and (class hud-modal)) (and (class gift-card-container)))
   [width (px 420)])
  ((and (class hud-modal-container-no-padding))
   [margin-top (px -14)]
   [margin-right (px -18)]
   [margin-bottom (px -14)]
   [margin-left (px -18)])
  ((desc (and (class hud-modal)) (and (class gift-card-image-style)))
   [width (px 700)]
   [height (px 465)])
  ((desc (and (class hud-modal)) (and (class gift-card-image-style-upsell)))
   [width (px 700)]
   [height (px 415)]
   [overflow-y hidden])
  ((desc (and (class hud-modal)) (and (class gift-card-style)))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(231, 231, 231)]
   #;[border-right-color rgb(231, 231, 231)]
   #;[border-bottom-color rgb(231, 231, 231)]
   #;[border-left-color rgb(231, 231, 231)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [position absolute]
   [right (px 50)]
   [top (px 80)]
   [width (px 200)]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (class hud-modal)) (and (class gift-card-add-fund-style)))
   #;[font-size (px 10)]
   #;[color rgb(118, 118, 118)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(231, 231, 231)]
   #;[border-right-color rgb(231, 231, 231)]
   #;[border-bottom-color rgb(231, 231, 231)]
   #;[border-left-color rgb(231, 231, 231)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color transparent]
   #;[background-image linear-gradient(-180deg, rgb(255, 255, 255) 5%, rgb(248, 248, 248) 6%, rgb(238, 238, 238) 100%)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (class sns-container))
   [width (px 705)])
  ((desc (and (class hud-modal)) (and (class reward-points-container)))
   [width (px 535)])
  ((and (class audible-credit-container))
   [margin-left (px 44)]
   [margin-top (px 59)])
  ((and (class audible-more-info-arrow))
   #;[vertical-align middle]
   [margin-left (px 6)])
  ((and (class audible-trial-image))
   [width (px 798)]
   [height (px 403)])
  ((and (class rejoin-audible-image))
   [width (px 798)]
   [height (px 403)])
  ((and (class rejoin-audible-button))
   [width (px 200)])
  ((and (class audible-trial-button))
   [width (px 200)])
  ((and (class audible-member-spacing))
   [width (px 45)]
   [margin-right (px 0)])
  ((and (class audible-credit-box))
   [width (px 155)]
   [margin-right (px 0)])
  ((and (class audible-date-box))
   [width (px 145)]
   [margin-right (px 0)])
  ((and (class audible-member-box))
   [width (px 200)]
   [margin-right (px 0)])
  ((and (class hud-audible-member-separator))
   [display inline-block]
   [width (px 1)]
   [height (px 104)]
   #;[background-color rgb(173, 173, 173)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [margin-top (px 2)]
   [margin-right (px 2)]
   [margin-bottom (px 2)]
   [margin-left (px 2)])
  ((and (class audible-credit))
   [width (px 798)]
   [height (px 403)]
   [margin-bottom (px 16)])
  ((and (class audible-trial))
   [margin-bottom (px 16)]
   [width (px 798)]
   [height (px 403)])
  ((and (class rejoin-audible))
   [margin-bottom (px 16)]
   [width (px 798)]
   [height (px 403)])
  ((and (class audible-manage-acc-button))
   [margin-right (px 10)]
   [width (px 250)])
  ((and (class audible-shop-books-link))
   [margin-left (px 10)]
   #;[color rgb(0, 0, 0)]
   #;[opacity 0.64])
  ((desc (and (class hud-modal)) (and (class try-prime)))
   [padding-top (px 20)]
   [padding-right (px 20)]
   [padding-bottom (px 20)]
   [padding-left (px 20)]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgba(0, 0, 0, 0.3)]
   #;[background-color rgb(246, 246, 246)]
   [text-align center]
   [margin-top (px 0)]
   [margin-right (px -18)]
   [margin-bottom (px -14)]
   [margin-left (px -18)])
  ((desc (and (class hud-modal)) (and (class non-prime-content)))
   [margin-top (px 0)]
   [margin-right (px 10)]
   [margin-bottom (px 1)]
   [margin-left (px 10)]
   [width (px 650)])
  ((desc (and (class hud-modal)) (and (class prime-logo)))
   [text-align center])
  ((desc (and (class hud-modal)) (and (class try-prime-button)))
   [width (px 275)])
  ((desc (and (class hud-modal)) (and (class try-prime-button)) (and (class a-button-inner)))
   [height (px 40)])
  ((desc (and (class hud-modal)) (and (tag ul) (class prime-benefits)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class hud-modal)) (and (tag ul) (class prime-benefits)) (and (tag li)))
   #;[list-style-image url("https://images-na.ssl-images-amazon.com/images/G/01//x-locale/personalization/yourstore/hud/checkmark._V330000115_.png")]
   [margin-bottom (px 15)])
  ((and (id hud-sign-in))
   [margin-top (px 15)]
   [margin-right (px 30)]
   [margin-bottom (px 15)]
   [margin-left (px 30)])
  ((desc (and (id hud-sign-in)) (and (class sign-in-button)))
   [display inline-block]
   [width (px 120)]
   [margin-top (px 15)]
   [margin-bottom (px 45)])
  ((desc (and (id hud-sign-in)) (and (class wide-button)))
   [width (px 150)])
  ((desc (and (id hud-sign-in)) (and (class subtext)) (and (tag p)))
   [margin-bottom (px 0)]
   [margin-top (px 0)])
  ((desc (and (class hud-modal)) (and (class modal-more-info-arrow)))
   #;[vertical-align middle]
   [margin-left (px 6)])
  ((desc (and (class popup-gutter)) (and (class address-label)))
   #;[font-size (px 14)]
   #;[font-weight 700]
   [margin-bottom (px 4)])
  ((desc (and (class hud-modal)) (and (class image-cta-left)))
   [padding-left (px 14)])
  ((desc (and (class hud-modal)) (and (class image-cta-right)))
   [padding-right (px 14)])
  ((desc (and (class hud-modal)) (and (class image-cta-image)))
   [width (px 800)]
   [height (px 440)])
  ((and (class yo-hud-scroll))
   [overflow-y scroll]
   [padding-right (px 15)])
  ((or (desc (and (class yo-hud-content)) (and (class yo-hud-spinner))) (and (class yo-hud-scroll)))
   [height (px 350)])
  ((or (desc (and (class yo-hud-content)) (and (class yo-hud-spinner))) (and (class yo-hud-scroll)))
   [height (px 400)])
  ((desc (and (class yo-hud-content)) (and (class yo-hud-spinner)))
   [margin-left (px 299)])
  ((and (class yo-hud-preload))
   [width (px 630)])
  ((desc (and (class yo-hud-content)) (and (class yo-hud-spinner)))
   [margin-left (px 359)])
  ((and (class yo-hud-preload))
   [width (px 750)])
  ((desc (and (class yo-hud-content)) (and (class yo-hud-spinner)))
   [margin-left (px 444)])
  ((and (class yo-hud-preload))
   [width (px 920)])
  ((and (id csr-hcb-wrapper))
   [display none])
  ((desc (and (class bia-item)) (and (class bia-action-button)))
   [display inline-block]
   [height (px 22)]
   [margin-top (px 3)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   [text-align center]
   #;[vertical-align middle]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[color rgb(17, 17, 17)]
   #;[font-family Arial,sans-serif]
   #;[font-size (px 11)]
   #;[font-style normal]
   #;[font-weight normal]
   #;[line-height (px 19)]
   #;[cursor pointer]
   #;[outline-width (px 0)]
   #;[outline-style none]
   #;[outline-color -moz-use-text-color]
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
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[border-top-color rgb(188, 193, 200)]
   #;[border-right-color rgb(186, 186, 186)]
   #;[border-bottom-color rgb(173, 178, 187)]
   #;[border-left-color rgb(186, 186, 186)]
   #;[background-color transparent]
   #;[background-image -moz-linear-gradient(center top , rgb(247, 248, 250), rgb(231, 233, 236))]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[box-shadow (px 0)]
   [box-sizing border-box])
  ((and (class bia-action-button-inner))
   #;[border-bottom-color rgb(17, 17, 17)]
   [border-bottom-style none]
   [border-bottom-width (px 0)]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-left-color rgb(17, 17, 17)]
   [border-left-style none]
   [border-left-width (px 0)]
   #;[border-right-color rgb(17, 17, 17)]
   [border-right-style none]
   [border-right-width (px 0)]
   #;[border-top-color rgb(17, 17, 17)]
   [border-top-style none]
   [border-top-width (px 0)]
   [box-sizing border-box]
   [display block]
   [height (px 20)]
   #;[line-height (px 19)]
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[vertical-align baseline])
  ((and (class bia-action-inner))
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
   [display inline]
   #;[font-size (px 11)]
   [height auto]
   #;[line-height (px 19)]
   [padding-top (px 0)]
   [padding-right (px 4)]
   [padding-bottom (px 0)]
   [padding-left (px 4)]
   [text-align center]
   [width auto]
   #;[white-space nowrap])
  ((and (class csr-content))
   #;[font-family Arial,Verdana,Helvetica,sans-serif]
   [width (px 220)]
   #;[line-height (px 19)])
  ((and (class bia-header))
   #;[font-size (px 16)]
   #;[color rgb(228, 121, 17)]
   [padding-bottom (px 10)])
  ((and (class bia-hcb-body))
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class bia-item))
   [width (px 220)]
   [display inline-block]
   [margin-bottom (px 20)])
  ((and (class bia-item-image))
   [float left]
   [margin-right (px 15)]
   [width (px 75)]
   [height (px 75)])
  ((and (class bia-image))
   #;[max-height (px 75)]
   #;[max-width (px 75)]
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
   [width (px 75)])
  ((and (class bia-item-data))
   [float left]
   [width (px 130)])
  ((and (class bia-title))
   #;[line-height (px 19)]
   #;[font-size (px 13)]
   #;[max-height (px 60)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class bia-prime-badge))
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
   #;[vertical-align middle])
  ((and (class bia-cart-action))
   [display none])
  ((and (class bia-cart-msg))
   [display block]
   #;[font-family Arial,Verdana,Helvetica,sans-serif]
   #;[line-height (px 19)])
  ((and (class bia-cart-icon))
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/Recommendations/MissionExperience/BIA/bia-atc-confirm-icon._CB327014182_.png")]
   [display inline-block]
   [width (px 14)]
   [height (px 13)]
   [top (px 3)]
   #;[line-height (px 19)]
   [position relative]
   #;[vertical-align top])
  ((and (class bia-cart-success))
   #;[color rgb(0, 153, 0)]
   [display inline-block]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[font-size (px 13)]
   #;[font-style normal]
   #;[font-weight bold]
   #;[font-family Arial,Verdana,Helvetica,sans-serif])
  ((and (class bia-cart-title))
   [margin-bottom (px 3)])
  ((and (class bia-cart-form))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (class bia-inline-cart-form))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (class bia-cart-submit))
   #;[cursor inherit]
   [left (px 0)]
   [top (px 0)]
   #;[line-height (px 19)]
   [height (% 100)]
   [width (% 100)]
   [padding-top (px 1)]
   [padding-right (px 6)]
   [padding-bottom (px 1)]
   [padding-left (px 6)]
   [position absolute]
   #;[opacity 0.01]
   [overflow-x visible]
   [overflow-y visible]
   #;[z-index 20])
  ((and (id nav-prime-tooltip))
   [padding-top (px 0)]
   [padding-right (px 20)]
   [padding-bottom (px 2)]
   [padding-left (px 20)]
   #;[background-color white]
   #;[font-family arial,sans-serif])
  ((or (and (class nav-npt-text-detail)) (and (tag a) (class nav-npt-a)))
   #;[font-family arial,sans-serif]
   #;[font-size (px 12)]
   #;[line-height (px 14)]
   #;[color rgb(51, 51, 51)]
   [margin-top (px 2)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 0)])
  ((and (class redir-modal-bg))
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [height (% 100)]
   [width (% 100)]
   #;[background-color rgb(0, 0, 0)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[z-index 1000]
   #;[opacity 0.5])
  ((and (id redir-overlay))
   [position absolute]
   [top (% 39)]
   [left (% 50)]
   [width (px 529)]
   [margin-top (px -145)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px -263)]
   #;[background-color rgb(255, 255, 255)]
   #;[border-top-left-radius (px 5)]
   #;[border-top-right-radius (px 5)]
   #;[border-bottom-right-radius (px 5)]
   #;[border-bottom-left-radius (px 5)]
   #;[font-family Helvetica Neue,Arial]
   #;[line-height 1.35]
   [overflow-x hidden]
   [overflow-y hidden]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[z-index 1001])
  ((and (class redir-title))
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/x-locale/paladin/pop/beacon_header._V362704570_.png")]
   #;[font-size (px 13)]
   #;[font-weight bold]
   #;[line-height (px 16)]
   [padding-top (px 10)]
   [padding-right (px 14)]
   [padding-bottom (px 9)]
   [padding-left (px 14)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(204, 204, 204)])
  ((and (class redir-content))
   [padding-top (px 14)]
   [padding-right (px 14)]
   [padding-bottom (px 14)]
   [padding-left (px 14)])
  ((and (id redir-footer))
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/x-locale/paladin/pop/beacon_footer._V362704544_.png")]
   #;[background-repeat repeat-x]
   #;[min-height (px 33)]
   [text-align right]
   [padding-top (px 14)]
   [padding-right (px 14)]
   [padding-bottom (px 14)]
   [padding-left (px 14)]
   [box-sizing content-box])
  ((desc (and (id redir-overlay)) (and (id redir-remember)))
   #;[color rgb(51, 51, 51)]
   #;[font-size (px 21)]
   #;[line-height (px 27)]
   [padding-top (px 2)]
   [padding-right (px 2)]
   [padding-bottom (px 2)]
   [padding-left (px 2)])
  ((and (id redir-opt-out))
   [width (px 13)]
   [height (px 13)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[vertical-align bottom]
   [position relative]
   [top (px -2)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (id redir-opt-out-label))
   [display block]
   [padding-left (px 15)]
   #;[text-indent (px -15)]
   [margin-top (px 1)]
   [margin-bottom (px 10)]
   #;[font-weight normal])
  ((or (desc (and (id redir-overlay)) (and (id redir-amazon-donates))) (desc (and (id redir-overlay)) (and (id redir-reminder-count))))
   #;[font-size (px 13)]
   [padding-left (px 2)]
   #;[line-height (px 19)])
  ((desc (and (id redir-overlay)) (and (id redir-reminder-count)))
   #;[color rgb(51, 51, 51)]
   [margin-top (px 20)])
  ((and (class redir-title-text))
   [float left])
  ((and (class redir-dismiss-x))
   #;[font-size (px 13)]
   [float right])
  ((and (class redir-overlay-close))
   #;[background-position -297px -5px]
   [height (px 9)]
   #;[opacity 0.41]
   [width (px 10)]
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/x-locale/paladin/aui_sprite_0012_1x._V343879139_.png")]
   #;[background-repeat no-repeat]
   #;[background-size 400px 600px]
   [display inline-block]
   #;[vertical-align top])
  ((and (tag a) (class redir-a-button))
   [display inline-block]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [margin-left (px 10)]
   #;[font-family Helvetica Neue,Arial])
  ((or (and (class redir-a-button-left)) (and (class redir-a-button-center)) (and (class redir-a-button-right)) (and (class redir-a-button-sec-left)) (and (class redir-a-button-sec-center)) (and (class redir-a-button-sec-right)))
   [height (px 31)]
   [float left])
  ((or (and (class redir-a-button-left-40)) (and (class redir-a-button-center-40)) (and (class redir-a-button-right-40)))
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/x-locale/paladin/button/a-pri-40-sprite._V338996964_.png")]
   [height (px 40)]
   [float left])
  ((or (and (class redir-a-button-center)) (and (class redir-a-button-sec-center)))
   #;[line-height (px 33)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   #;[color rgb(0, 0, 0)]
   #;[font-weight normal]
   #;[font-size (px 13)])
  ((and (class redir-a-button-center-40))
   #;[line-height (px 33)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[color rgb(0, 0, 0)]
   #;[font-weight normal]
   #;[font-size (px 13)])
  ((or (and (class redir-a-button-left)) (and (class redir-a-button-right)) (and (class redir-a-button-sec-left)) (and (class redir-a-button-sec-right)))
   [width (px 3)])
  ((or (and (class redir-a-button-left-40)) (and (class redir-a-button-right-40)))
   [width (px 7)])
  ((and (class redir-ol))
   [width (px 529)])
  ((and (class redir-ol-content))
   [margin-left (px 6)]
   [margin-right (px 6)])
  ((and (class redir-ol-content-image))
   [margin-bottom (px 20)])
  ((and (class redir-ol-content-opt-out))
   #;[color rgb(51, 51, 51)]
   [margin-top (px 15)]
   #;[font-size (px 12)]
   #;[line-height 1.5])
  ((desc (and (class redir-ol-goto)) (and (class redir-a-button-center)))
   [text-align center]
   [width (px 175)])
  ((and (class redir-ol-footer-goto-text))
   [float right]
   [width (px 220)]
   [margin-top (px 5)]
   [margin-bottom (px 5)]
   [text-align right]
   #;[font-size (px 12)]
   #;[line-height 1.5]
   #;[color rgb(51, 51, 51)]
   #;[text-rendering optimizelegibility])
  ((desc (and (id redir-overlay)) (and (tag a)) (and (tag img)))
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
   [width (% 66)]
   [display block]
   [margin-left auto]
   [margin-right auto])
  ((desc (and (id redir-overlay)) (and (tag img)))
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
   #;[border-image-repeat stretch stretch])
  ((and (class redir-ol-content-text-CA))
   #;[font-size (px 21)]
   #;[line-height 1.3]
   [margin-top (px 50)]
   [margin-bottom (px 30)]
   #;[text-rendering optimizelegibility])
  ((and (class redir-ol-content-opt-out-CA))
   #;[color rgb(102, 102, 102)]
   [margin-top (px 1)]
   #;[font-size (px 12)]
   #;[line-height 1.5])
  ((and (class redir-ol-content-logo-CA))
   [float left]
   [width (% 15)]
   [margin-bottom (px 10)]
   [margin-top (px 10)])
  ((and (class redir-ol-content-heading-CA))
   #;[font-weight bold]
   #;[font-size (px 18)]
   [float left]
   [width (% 85)]
   [margin-bottom (px 10)]
   [margin-top (px 10)])
  ((and (class redir-title-text-CA))
   [float left]
   #;[font-size (px 14)]
   #;[font-weight normal])
  ((and (class redir-modal-bg))
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [height (% 100)]
   [width (% 100)]
   #;[background-color rgb(0, 0, 0)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[z-index 1000]
   #;[opacity 0.5])
  ((and (id redir-overlay))
   [position absolute]
   [top (% 39)]
   [left (% 50)]
   [width (px 529)]
   [margin-top (px -145)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px -263)]
   #;[background-color rgb(255, 255, 255)]
   #;[border-top-left-radius (px 5)]
   #;[border-top-right-radius (px 5)]
   #;[border-bottom-right-radius (px 5)]
   #;[border-bottom-left-radius (px 5)]
   #;[font-family Helvetica Neue,Arial]
   #;[line-height 1.35]
   [overflow-x hidden]
   [overflow-y hidden]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[z-index 1001])
  ((and (class redir-title))
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/x-locale/paladin/pop/beacon_header._V362704570_.png")]
   #;[font-size (px 13)]
   #;[font-weight bold]
   #;[line-height (px 16)]
   [padding-top (px 10)]
   [padding-right (px 14)]
   [padding-bottom (px 9)]
   [padding-left (px 14)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(204, 204, 204)])
  ((and (class redir-content))
   [padding-top (px 14)]
   [padding-right (px 14)]
   [padding-bottom (px 14)]
   [padding-left (px 14)])
  ((and (id redir-footer))
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/x-locale/paladin/pop/beacon_footer._V362704544_.png")]
   #;[background-repeat repeat-x]
   #;[min-height (px 33)]
   [text-align right]
   [padding-top (px 14)]
   [padding-right (px 14)]
   [padding-bottom (px 14)]
   [padding-left (px 14)]
   [box-sizing content-box])
  ((desc (and (id redir-overlay)) (and (id redir-remember)))
   #;[color rgb(51, 51, 51)]
   #;[font-size (px 21)]
   #;[line-height (px 27)]
   [padding-top (px 2)]
   [padding-right (px 2)]
   [padding-bottom (px 2)]
   [padding-left (px 2)])
  ((and (id redir-opt-out))
   [width (px 13)]
   [height (px 13)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[vertical-align bottom]
   [position relative]
   [top (px -2)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (id redir-opt-out-label))
   [display block]
   [padding-left (px 15)]
   #;[text-indent (px -15)]
   [margin-top (px 1)]
   [margin-bottom (px 10)]
   #;[font-weight normal])
  ((or (desc (and (id redir-overlay)) (and (id redir-amazon-donates))) (desc (and (id redir-overlay)) (and (id redir-reminder-count))))
   #;[font-size (px 13)]
   [padding-left (px 2)]
   #;[line-height (px 19)])
  ((desc (and (id redir-overlay)) (and (id redir-reminder-count)))
   #;[color rgb(51, 51, 51)]
   [margin-top (px 20)])
  ((and (class redir-title-text))
   [float left])
  ((and (class redir-dismiss-x))
   #;[font-size (px 13)]
   [float right])
  ((and (class redir-overlay-close))
   #;[background-position -297px -5px]
   [height (px 9)]
   #;[opacity 0.41]
   [width (px 10)]
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/x-locale/paladin/aui_sprite_0012_1x._V343879139_.png")]
   #;[background-repeat no-repeat]
   #;[background-size 400px 600px]
   [display inline-block]
   #;[vertical-align top])
  ((and (tag a) (class redir-a-button))
   [display inline-block]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [margin-left (px 10)]
   #;[font-family Helvetica Neue,Arial])
  ((or (and (class redir-a-button-left)) (and (class redir-a-button-center)) (and (class redir-a-button-right)) (and (class redir-a-button-sec-left)) (and (class redir-a-button-sec-center)) (and (class redir-a-button-sec-right)))
   [height (px 31)]
   [float left]
   [box-sizing border-box])
  ((or (and (class redir-a-button-left-40)) (and (class redir-a-button-center-40)) (and (class redir-a-button-right-40)))
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/x-locale/paladin/button/a-pri-40-sprite._V338996964_.png")]
   [height (px 40)]
   [float left])
  ((or (and (class redir-a-button-center)) (and (class redir-a-button-sec-center)))
   #;[line-height (px 33)]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   #;[color rgb(0, 0, 0)]
   #;[font-weight normal]
   #;[font-size (px 13)])
  ((and (class redir-a-button-center-40))
   #;[line-height (px 33)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[color rgb(0, 0, 0)]
   #;[font-weight normal]
   #;[font-size (px 13)])
  ((or (and (class redir-a-button-left)) (and (class redir-a-button-right)) (and (class redir-a-button-sec-left)) (and (class redir-a-button-sec-right)))
   [width (px 3)])
  ((or (and (class redir-a-button-left-40)) (and (class redir-a-button-right-40)))
   [width (px 7)])
  ((and (class redir-ol))
   [width (px 529)])
  ((and (class redir-ol-content))
   [margin-left (px 6)]
   [margin-right (px 6)])
  ((and (class redir-ol-content-image))
   [margin-bottom (px 20)])
  ((and (class redir-ol-content-opt-out))
   #;[color rgb(51, 51, 51)]
   [margin-top (px 15)]
   #;[font-size (px 12)]
   #;[line-height 1.5])
  ((desc (and (class redir-ol-goto)) (and (class redir-a-button-center)))
   [text-align center]
   [width (px 175)])
  ((and (class redir-ol-footer-goto-text))
   [float right]
   [width (px 220)]
   [margin-top (px 5)]
   [margin-bottom (px 5)]
   [text-align right]
   #;[font-size (px 12)]
   #;[line-height 1.5]
   #;[color rgb(51, 51, 51)]
   #;[text-rendering optimizelegibility])
  ((desc (and (id redir-overlay)) (and (tag a)) (and (tag img)))
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
   [width (% 66)]
   [display block]
   [margin-left auto]
   [margin-right auto])
  ((desc (and (id redir-overlay)) (and (tag img)))
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
   #;[border-image-repeat stretch stretch])
  ((and (class redir-ol-content-image-first-MX))
   [margin-top (px 1)])
  ((and (class redir-ol-content-image-secondary-MX))
   [margin-top (px 5)]
   [margin-bottom (px 30)])
  ((and (class redir-ol-content-text-MX))
   #;[font-size (px 18)]
   [float left]
   [width (% 85)]
   [margin-bottom (px 10)]
   [margin-top (px 10)])
  ((and (class redir-ol-content-logo-MX))
   [float left]
   [width (% 15)]
   [margin-bottom (px 10)]
   [margin-top (px 10)])
  ((and (class redir-ol-content-opt-out-MX))
   #;[color rgb(102, 102, 102)]
   [margin-top (px 20)]
   #;[font-size (px 12)]
   #;[line-height 1.5])
  ((and (id redir-opt-out-label-MX))
   [display block]
   [padding-left (px 15)]
   [margin-top (px 50)]
   [margin-bottom (px 10)]
   #;[font-weight normal])
  ((and (class redir-title-text-MX))
   [float left]
   #;[font-size (px 14)]
   #;[font-weight normal])
  ((and (class rhf-frame))
   [display none]
   #;[min-width (px 940)]
   [position relative])
  ((and (class rhf-border))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(221, 221, 221)]
   #;[border-right-color rgb(221, 221, 221)]
   #;[border-bottom-color rgb(221, 221, 221)]
   #;[border-left-color rgb(221, 221, 221)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-top-left-radius (px 5)]
   #;[border-top-right-radius (px 5)]
   #;[border-bottom-right-radius (px 5)]
   #;[border-bottom-left-radius (px 5)]
   [padding-top (px 0)]
   [padding-right (px 20)]
   [padding-bottom (px 0)]
   [padding-left (px 20)])
  ((and (class rhf-header))
   #;[color rgb(68, 68, 68)]
   #;[font-family Arial]
   #;[font-size (px 20)]
   #;[font-weight normal]
   [padding-top (px 10)]
   [padding-right (px 10)]
   [padding-bottom (px 3)]
   [padding-left (px 10)]
   [text-align left]
   #;[white-space nowrap])
  ((and (id ybh-text-on))
   [display none])
  ((and (class rvi-fresh-footer))
   #;[background-color rgba(0, 0, 0, 0.03)]
   [padding-left (px 35)]
   [padding-right (px 35)]
   [position relative])
  ((and (class rvi-fresh-container))
   [height (px 100)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class rvi-fresh-container)) (and (class rhf-RVIs)))
   [display inline-block]
   [position relative])
  ((desc (and (class rvi-fresh-container)) (and (class rhf-RVIs)) (and (tag a)) (and (tag img)))
   [box-sizing border-box]
   #;[vertical-align middle])
  ((desc (and (class rvi-fresh-container)) (and (class rhf-faceout-hue)))
   #;[background-color rgba(0, 0, 0, 0.03)]
   [position absolute]
   [left (px 0)]
   [top (px 0)]
   [right (px 0)]
   [bottom (px 0)]
   #;[z-index 100])
  ((and (class rhf-loading-outer))
   [height (px 248)]
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative]
   [margin-top (px 10)]
   [width (% 100)])
  ((".rhf-loading-outer[class]" (or (id e10091)))
   [display table]
   [position static])
  ((and (class rhf-loading-middle))
   [height (% 100)]
   [width (% 100)])
  ((and (class rhf-loading-inner))
   [text-align center]
   #;[vertical-align middle])
  ((and (id rhf-shoveler))
   #;[color black]
   [padding-top (px 10)]
   [padding-right (px 10)]
   [padding-bottom (px 10)]
   [padding-left (px 10)])
  ((and (class rhf-footer))
   [padding-bottom (px 14)])
  ((and (class rvi-container))
   [height (px 75)]
   #;[line-height (px 75)]
   [overflow-x hidden]
   [overflow-y hidden]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   [position relative])
  ((desc (and (class rvi-container)) (and (class you-viewed)))
   [display inline-block]
   #;[line-height (px 13)]
   [margin-right (px 3)]
   [text-align right]
   [width (px 45)]
   #;[vertical-align middle])
  ((desc (and (class rvi-container)) (and (class you-viewed-divider)))
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(221, 221, 221)]
   [display inline-block]
   [height (px 50)]
   [margin-left (px 10)]
   #;[vertical-align middle])
  ((or (desc (and (class rvi-container)) (and (id ybh-text-on))) (desc (and (class rvi-container)) (and (id ybh-text-off))))
   [padding-left (px 40)]
   [padding-right (px 10)])
  ((desc (and (class rvi-container)) (and (id ybh-text-on)))
   [display none])
  ((desc (and (class rhf-footer)) (and (class ybh-edit)))
   [float right]
   [margin-top (px 18)]
   [padding-left (px 40)]
   [padding-right (px 10)])
  ((or (desc (and (class ybh-edit)) (and (class ybh-edit-arrow))) (desc (and (class ybh-edit)) (and (class ybh-edit-link))))
   [display inline-block]
   #;[font-family Arial]
   #;[font-weight bold]
   #;[line-height (px 11)]
   #;[vertical-align top])
  ((desc (and (class ybh-edit)) (and (class ybh-edit-arrow)))
   #;[color rgb(204, 153, 0)]
   #;[font-size (px 11)]
   [margin-top (px -2)]
   [padding-right (px 8)])
  ((desc (and (class ybh-edit)) (and (class ybh-edit-link)))
   #;[font-size (px 10)]
   [width (px 80)])
  ((and (class rhf-state-signin))
   [margin-top (px 19)]
   [margin-bottom (px 17)])
  ((and (class rhf-sign-in-button-box))
   [float right]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(221, 221, 221)]
   [margin-right (px -30)]
   [text-align center]
   #;[white-space nowrap])
  ((and (class rhf-sign-in-button))
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
   #;[line-height (px 15)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-left (px 20)]
   [padding-right (px 20)])
  ((".rhf-sign-in-button .action-button, .rhf-sign-in-button a.action-button:hover, .rhf-sign-in-button a.action-button:link, .rhf-sign-in-button a.action-button:active" (or))
   #;[max-width (px 230)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   [margin-bottom (px 5)]
   [margin-top (px 5)]
   [width (px 230)]
   [display block]
   #;[background-position -10px -170px]
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/gno/beacon/BeaconSprite-US-01._CB397411194_.png")])
  ((".rhf-sign-in-button .action-inner, a.action-button:link .action-inner, a.action-button:active .action-inner, a.action-button:hover .action-inner, a.action-button:visited .action-inner" (or))
   #;[cursor pointer]
   #;[background-position right -170px]
   [display block]
   [height (px 28)]
   [position relative]
   #;[color black]
   #;[font-size (px 12)]
   #;[line-height (px 28)]
   [text-align center]
   #;[font-family "arial","sans-serif"]
   #;[font-weight bold]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[text-shadow (px 0)])
  ((desc (and (class rvi-container)) (and (class no-rvi-message)))
   #;[color black]
   [float left]
   #;[font-size (px 13)]
   #;[font-style italic])
  ((and (class rhf-divider))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(221, 221, 221)]
   [height (px 23)]
   [margin-bottom (px -6)]
   #;[background-color transparent]
   #;[background-image -moz-linear-gradient(center top , rgb(221, 221, 221), rgb(247, 247, 247) 3px, white)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[filter none]
   #;[z-index (px 0)])
  ((".rhf-divider::after" (or))
   [display block]
   [width (% 100)]
   [height (px 44)]
   #;[background-color transparent]
   #;[background-image -moz-linear-gradient(left center , white, rgba(255, 255, 255, 0), white)]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[filter none]
   #;[z-index 1]
   #;[content ""])
  ((desc (and (class rvi-container)) (and (class rhf-RVIs)))
   [display inline-block]
   [padding-top (px 0)]
   [padding-right (px 10)]
   [padding-bottom (px 0)]
   [padding-left (px 10)]
   #;[vertical-align middle])
  ((desc (and (class rvi-container)) (and (class rhf-RVIs)) (and (tag a)) (and (tag img)))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(221, 221, 221)]
   #;[border-right-color rgb(221, 221, 221)]
   #;[border-bottom-color rgb(221, 221, 221)]
   #;[border-left-color rgb(221, 221, 221)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [box-sizing border-box]
   #;[vertical-align middle])
  ((".rvi-container .rhf-RVIs a:hover img" (or))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(228, 121, 17)]
   #;[border-right-color rgb(228, 121, 17)]
   #;[border-bottom-color rgb(228, 121, 17)]
   #;[border-left-color rgb(228, 121, 17)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((desc (and (id rhf-container)) (and (id rhf-recs-down-text)))
   [padding-top (px 13)]
   #;[font-size (px 16)]
   #;[line-height (px 26)])
  ((desc (and *) (and (tag html)) (and (class rhf)))
   [height (% 1)])
  ((and (id e10092)) :style
   [position absolute]
   [left (px 0)]
   [top (px -500)]
   [width (px 1)]
   [height (px 1)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (id e10093)) :style
   [display none])
  ((and (id nav-upnav)) :style
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/Airstream/Airstream_PC_1x_Jan2016._CB300726991_.jpg")]
   #;[background-color rgb(246, 246, 246)]
   [text-align left]
   #;[background-position left top]
   [height (px 55)]
   #;[background-repeat no-repeat]
   #;[background-size 1920px auto]
   #;[min-width (px 1000)])
  ((and (id navSwmHoliday)) :style
   #;[background-image url("http://g-ecx.images-amazon.com/images/G/01/img16/sports/swm/31502_us_sports_bg_swms_dark_400x39._CB300007051_.png")]
   [width (px 400)]
   [height (px 39)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (id e10094)) :style
   [display none]
   [position absolute]
   [top (px 58)]
   [left (px 1521)]
   #;[opacity 1])
  ((and (id e10100)) :style
   [width (% 100)])
  ((and (id e10101)) :style
   [height (px 300)])
  ((and (id anonCarousel1)) :style
   [height (px 300)])
  ((and (id e10075)) :style
   [width (px 9000)]
   #;[transform translateX(-4500px)])
  ((and (id e10102)) :style
   [width (px 1500)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[visibility hidden])
  ((and (id e10103)) :style
   [height (px 300)])
  ((and (id e10104)) :style
   [display inline-block])
  ((and (id e10105)) :style
   [width (px 1500)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[visibility hidden])
  ((and (id e10106)) :style
   [height (px 300)])
  ((and (id e10107)) :style
   [display inline-block])
  ((and (id e10108)) :style
   [width (px 1500)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[visibility hidden])
  ((and (id e10109)) :style
   [height (px 300)])
  ((and (id e10110)) :style
   [display inline-block])
  ((and (id e10111)) :style
   [width (px 1500)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (id e10112)) :style
   [height (px 300)])
  ((and (id e10113)) :style
   [display inline-block])
  ((and (id e10114)) :style
   [width (px 1500)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[visibility hidden])
  ((and (id e10115)) :style
   [height (px 300)])
  ((and (id e10116)) :style
   [display inline-block])
  ((and (id e10117)) :style
   [width (px 1500)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[visibility hidden])
  ((and (id e10118)) :style
   [height (px 300)])
  ((and (id e10119)) :style
   [display inline-block])
  ((and (id e10076)) :style
   [width (px 132)])
  ((and (id hud-dashboard)) :style
   [display none])
  ((and (id sidebar)) :style
   [width (px 310)]
   [float right])
  ((and (id DAr2)) :style
   [width (px 300)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (id e10120)) :style
   [height (px 170)])
  ((and (id e10121)) :style
   [display inline-block])
  ((and (id e10122)) :style
   [height (px 170)])
  ((and (id e10123)) :style
   [display inline-block])
  ((and (id mainContent)) :style
   [padding-right (px 0)]
   [float none])
  ((and (id e10124)) :style
   [display inline-block])
  ((and (id e10125)) :style
   [display inline-block])
  ((and (id e10126)) :style
   [display inline-block])
  ((and (id e10127)) :style
   [display inline-block])
  ((and (id e10128)) :style
   [display inline-block])
  ((and (id e10129)) :style
   [display inline-block])
  ((and (id e10130)) :style
   [display inline-block])
  ((and (id e10131)) :style
   [display inline-block])
  ((and (id e10132)) :style
   [display inline-block])
  ((and (id e10083)) :style
   [display inline-block])
  ((and (id e10133)) :style
   [display none])
  ((and (id e10134)) :style
   [width (px (/ 17686 30))]
   [left (px 0)])
  ((and (id e10135)) :style
   [display inline-block])
  ((and (id e10136)) :style
   [display inline-block])
  ((and (id e10137)) :style
   [display inline-block])
  ((and (id e10138)) :style
   [display inline-block])
  ((and (id e10139)) :style
   [display inline-block])
  ((and (id e10140)) :style
   [display inline-block])
  ((and (id e10141)) :style
   [display inline-block])
  ((and (id e10142)) :style
   [display inline-block])
  ((and (id e10143)) :style
   [display inline-block])
  ((and (id e10144)) :style
   [display inline-block])
  ((and (id e10145)) :style
   [display inline-block])
  ((and (id e10146)) :style
   [display inline-block])
  ((and (id e10147)) :style
   [display inline-block])
  ((and (id e10148)) :style
   [display inline-block])
  ((and (id e10149)) :style
   [display inline-block])
  ((and (id e10150)) :style
   [display inline-block])
  ((and (id e10151)) :style
   [display inline-block])
  ((and (id e10152)) :style
   [display inline-block])
  ((and (id e10153)) :style
   [display inline-block])
  ((and (id e10084)) :style
   [display inline-block])
  ((and (id e10154)) :style
   [display none])
  ((and (id e10155)) :style
   [width (px 329.7)]
   [left (px 0)])
  ((and (id e10156)) :style
   [display inline-block])
  ((and (id e10157)) :style
   [display inline-block])
  ((and (id e10158)) :style
   [display inline-block])
  ((and (id e10159)) :style
   [display inline-block])
  ((and (id e10160)) :style
   [display inline-block])
  ((and (id e10161)) :style
   [display inline-block])
  ((and (id e10162)) :style
   [display inline-block])
  ((and (id e10163)) :style
   [display inline-block])
  ((and (id e10164)) :style
   [display inline-block])
  ((and (id e10165)) :style
   [display inline-block])
  ((and (id e10166)) :style
   [display inline-block])
  ((and (id e10167)) :style
   [display inline-block])
  ((and (id e10168)) :style
   [display inline-block])
  ((and (id e10169)) :style
   [display inline-block])
  ((and (id e10170)) :style
   [display inline-block])
  ((and (id e10171)) :style
   [display inline-block])
  ((and (id e10172)) :style
   [display inline-block])
  ((and (id e10173)) :style
   [display inline-block])
  ((and (id e10174)) :style
   [display inline-block])
  ((and (id e10085)) :style
   [display inline-block])
  ((and (id e10175)) :style
   [display none])
  ((and (id e10176)) :style
   [width (px 308.95)]
   [left (px 0)])
  ((and (id e10177)) :style
   [display inline-block])
  ((and (id e10178)) :style
   [display inline-block])
  ((and (id e10179)) :style
   [display inline-block])
  ((and (id e10180)) :style
   [display inline-block])
  ((and (id e10181)) :style
   [display inline-block])
  ((and (id e10182)) :style
   [display inline-block])
  ((and (id e10183)) :style
   [display inline-block])
  ((and (id e10184)) :style
   [display inline-block])
  ((and (id e10185)) :style
   [display inline-block])
  ((and (id e10186)) :style
   [display inline-block])
  ((and (id e10187)) :style
   [display inline-block])
  ((and (id e10188)) :style
   [display inline-block])
  ((and (id e10189)) :style
   [display inline-block])
  ((and (id e10190)) :style
   [display inline-block])
  ((and (id e10191)) :style
   [display inline-block])
  ((and (id e10192)) :style
   [display inline-block])
  ((and (id e10193)) :style
   [display inline-block])
  ((and (id e10194)) :style
   [display inline-block])
  ((and (id e10195)) :style
   [display inline-block])
  ((and (id e10086)) :style
   [display inline-block])
  ((and (id e10196)) :style
   [display none])
  ((and (id e10197)) :style
   [width (px 289.9)]
   [left (px 0)])
  ((and (id e10198)) :style
   [display inline-block])
  ((and (id e10199)) :style
   [display inline-block])
  ((and (id e10200)) :style
   [display inline-block])
  ((and (id e10201)) :style
   [display inline-block])
  ((and (id e10202)) :style
   [display inline-block])
  ((and (id e10203)) :style
   [display inline-block])
  ((and (id e10204)) :style
   [display inline-block])
  ((and (id e10205)) :style
   [display inline-block])
  ((and (id e10206)) :style
   [display inline-block])
  ((and (id e10207)) :style
   [display inline-block])
  ((and (id e10208)) :style
   [display inline-block])
  ((and (id e10209)) :style
   [display inline-block])
  ((and (id e10210)) :style
   [display inline-block])
  ((and (id e10211)) :style
   [display inline-block])
  ((and (id e10212)) :style
   [display inline-block])
  ((and (id e10213)) :style
   [display inline-block])
  ((and (id e10214)) :style
   [display inline-block])
  ((and (id e10215)) :style
   [display inline-block])
  ((and (id e10216)) :style
   [display inline-block])
  ((and (id e10087)) :style
   [display inline-block])
  ((and (id e10217)) :style
   [display none])
  ((and (id e10218)) :style
   [width (px (/ 1583 6))]
   [left (px 0)])
  ((and (id e10219)) :style
   [display inline-block])
  ((and (id e10220)) :style
   [display inline-block])
  ((and (id e10221)) :style
   [display inline-block])
  ((and (id e10222)) :style
   [display inline-block])
  ((and (id e10223)) :style
   [display inline-block])
  ((and (id e10224)) :style
   [display inline-block])
  ((and (id e10225)) :style
   [display inline-block])
  ((and (id e10226)) :style
   [display inline-block])
  ((and (id e10227)) :style
   [display inline-block])
  ((and (id e10228)) :style
   [display inline-block])
  ((and (id e10229)) :style
   [display inline-block])
  ((and (id e10230)) :style
   [display inline-block])
  ((and (id e10231)) :style
   [display inline-block])
  ((and (id e10088)) :style
   [display inline-block])
  ((and (id e10232)) :style
   [display none])
  ((and (id e10233)) :style
   [width (px 469.55)]
   [left (px 0)])
  ((and (id e10234)) :style
   [display inline-block])
  ((and (id e10235)) :style
   [display inline-block])
  ((and (id e10236)) :style
   [display inline-block])
  ((and (id e10237)) :style
   [display inline-block])
  ((and (id e10238)) :style
   [display inline-block])
  ((and (id e10239)) :style
   [display inline-block])
  ((and (id e10240)) :style
   [display inline-block])
  ((and (id e10241)) :style
   [display inline-block])
  ((and (id e10242)) :style
   [display inline-block])
  ((and (id e10243)) :style
   [display inline-block])
  ((and (id e10244)) :style
   [display inline-block])
  ((and (id e10245)) :style
   [display inline-block])
  ((and (id e10246)) :style
   [display inline-block])
  ((and (id e10247)) :style
   [display inline-block])
  ((and (id e10248)) :style
   [display inline-block])
  ((and (id e10249)) :style
   [display inline-block])
  ((and (id e10250)) :style
   [display inline-block])
  ((and (id e10251)) :style
   [display inline-block])
  ((and (id e10252)) :style
   [display inline-block])
  ((and (id e10089)) :style
   [display inline-block])
  ((and (id e10253)) :style
   [display none])
  ((and (id e10254)) :style
   [width (px (/ 10994 30))]
   [left (px 0)])
  ((and (id e10255)) :style
   [display inline-block])
  ((and (id e10256)) :style
   [display inline-block])
  ((and (id e10257)) :style
   [display inline-block])
  ((and (id e10258)) :style
   [display inline-block])
  ((and (id e10259)) :style
   [display inline-block])
  ((and (id e10260)) :style
   [display inline-block])
  ((and (id e10261)) :style
   [display inline-block])
  ((and (id e10262)) :style
   [display inline-block])
  ((and (id e10263)) :style
   [display inline-block])
  ((and (id e10264)) :style
   [display inline-block])
  ((and (id e10265)) :style
   [display inline-block])
  ((and (id e10266)) :style
   [display inline-block])
  ((and (id e10267)) :style
   [display inline-block])
  ((and (id e10268)) :style
   [display inline-block])
  ((and (id e10269)) :style
   [display inline-block])
  ((and (id e10270)) :style
   [display inline-block])
  ((and (id e10271)) :style
   [display inline-block])
  ((and (id e10272)) :style
   [display inline-block])
  ((and (id e10273)) :style
   [display inline-block])
  ((and (id e10090)) :style
   [display inline-block])
  ((and (id e10274)) :style
   [display none])
  ((and (id e10275)) :style
   [width (px (/ 3491 15))]
   [left (px 0)])
  ((and (id e10276)) :style
   [display none])
  ((and (id e10277)) :style
   [display none])
  ((and (id e10278)) :style
   [display none])
  ((and (id sidebarhidden)) :style
   [display none])
  ((and (id e10279)) :style
   [display block])
  ((and (id rhf-container)) :style
   [display none])
  ((and (id e10029)) :style
   [width (% 38)])
  ((and (id e10063)) :style
   [width (% 4)])
  ((and (id e10065)) :style
   [width (% 4)])
  ((and (id e10067)) :style
   [width (% 4)])
  ((and (id e10069)) :style
   [width (% 4)])
  ((and (id e10071)) :style
   [width (% 4)])
  ((and (id e10073)) :style
   [width (% 4)])
  ((and (id e10039)) :style
   [width (% 38)])
  ((and (id e10031)) :style
   [width (% 38)])
  ((and (id e10280)) :style
   [width (% 4)])
  ((and (id e10281)) :style
   [width (% 4)])
  ((and (id e10282)) :style
   [width (% 4)])
  ((and (id e10283)) :style
   [width (% 4)])
  ((and (id e10284)) :style
   [width (% 4)])
  ((and (id e10285)) :style
   [width (% 4)])
  ((and (id e10040)) :style
   [width (% 38)])
  ((and (id e10033)) :style
   [width (% 38)])
  ((and (id e10286)) :style
   [width (% 4)])
  ((and (id e10287)) :style
   [width (% 4)])
  ((and (id e10288)) :style
   [width (% 4)])
  ((and (id e10289)) :style
   [width (% 4)])
  ((and (id e10290)) :style
   [width (% 4)])
  ((and (id e10291)) :style
   [width (% 4)])
  ((and (id e10041)) :style
   [width (% 38)])
  ((and (id e10035)) :style
   [width (% 38)])
  ((and (id e10292)) :style
   [width (% 4)])
  ((and (id e10293)) :style
   [width (% 4)])
  ((and (id e10294)) :style
   [width (% 4)])
  ((and (id e10295)) :style
   [width (% 4)])
  ((and (id e10296)) :style
   [width (% 4)])
  ((and (id e10297)) :style
   [width (% 4)])
  ((and (id e10042)) :style
   [width (% 38)])
  ((and (id e10037)) :style
   [width (% 38)])
  ((and (id e10050)) :style
   [width (% 4)])
  ((and (id e10052)) :style
   [width (% 4)])
  ((and (id e10054)) :style
   [width (% 4)])
  ((and (id e10056)) :style
   [width (% 4)])
  ((and (id e10058)) :style
   [width (% 4)])
  ((and (id e10060)) :style
   [width (% 4)])
  ((and (id e10043)) :style
   [width (% 38)])
  ((and (id sis_pixel_r2)) :style
   [height (px 1)]
   [position absolute]
   [left (px -1000000)]
   [top (px -1000000)])
  ((and (id be)) :style
   [display none]
   #;[visibility hidden])
  ((and (id a-popover-root)) :style
   #;[z-index -1]
   [position absolute])
  ((and (id e10298)) :style
   [display none])
  ((and (id e10299)) :style
   [display none])
  ((and (id fxdriver-screenshot-canvas)) :style
   [display none]))

(define-document (doc-1 #:width 1728 #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 1728 :h 4567 :class (a-transition a-transform a-opacity a-border-image a-border-radius a-box-shadow a-text-shadow a-touch-scrolling a-local-storage a-textarea-placeholder a-input-placeholder a-autofocus a-webworker a-history a-geolocation a-drag-drop a-svg a-canvas a-video a-audio a-js a-ws a-audio a-video a-canvas a-svg a-drag-drop a-geolocation a-history a-webworker a-autofocus a-input-placeholder a-textarea-placeholder a-local-storage a-touch-scrolling a-text-shadow a-box-shadow a-border-radius a-border-image a-opacity a-transform a-transition)]
   ([BLOCK :tag BODY :x 0 :y 0 :w 1728 :h 4417 :class (a-auix_ux_57388-t1 a-aui_49697-c a-aui_51744-c a-aui_57326-c a-aui_58736-c a-aui_accessibility_49860-c a-aui_attr_validations_1_51371-c a-aui_bolt_62845-c a-aui_ux_47524-t1 a-aui_ux_49594-c a-aui_ux_52290-c a-aui_ux_56217-c a-aui_ux_59374-c a-aui_ux_59797-c a-aui_ux_60000-c a-meter-animate)]
    ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 4417 :id a-page]
     ([ANON]
      ([LINE]
       ([INLINE :tag A])))
     ([BLOCK :tag DIV :x 0 :y -500 :w 1 :h 1 :id e10092]
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -498 :w 20 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -479 :w 26 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -460 :w 46 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -441 :w 46 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -422 :w 18 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -403 :w 39 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -384 :w 36 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -365 :w 56 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -346 :w 44 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -327 :w 11 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -308 :w 41 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -289 :w 56 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -270 :w 64 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -251 :w 21 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -232 :w 23 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -213 :w 52 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -194 :w 46 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -175 :w 11 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -156 :w 44 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -137 :w 25 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -118 :w 67 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -99 :w 40 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -80 :w 32 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -61 :w 21 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -42 :w 20 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -23 :w 11 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -4 :w 14 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y 15 :w 11 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y 34 :w 155 :h 15]))))
     ([ANON]
      ([LINE]
       ([INLINE :tag A :id nav-top])))
     ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 55 :id nav-upnav]
      ([BLOCK :tag A :x 0 :y 0 :w 1728 :h 55 :class (nav-a)]
       ([BLOCK :tag SPAN :x 0 :y -10000 :w 1 :h 1 :class (nav-spanAltText)]
        ([LINE]
         ([TEXT :x 0 :y -9998 :w 50 :h 15]))
        ([LINE]
         ([TEXT :x 0 :y -9979 :w 39 :h 15]))
        ([LINE]
         ([TEXT :x 0 :y -9960 :w 46 :h 15]))
        ([LINE]
         ([TEXT :x 0 :y -9941 :w 27 :h 15])))))
     ([BLOCK :tag HEADER :x 0 :y 55 :w 1728 :h 99 :class (nav-locale-us nav-lang-en nav-rec nav-xshop-small)]
      ([BLOCK :tag DIV :x 0 :y 55 :w 1728 :h 99 :id navbar :class (nav-sprite-v1 nav-bluebeacon)]
       ([BLOCK :tag DIV :x 0 :y 55 :w 1728 :h 39 :id nav-belt]
        ([BLOCK :tag DIV :x 0 :y 55 :w 192 :h 39 :class (nav-left)]
         ([BLOCK :tag DIV :x 0 :y 55 :w 192 :h 39 :id nav-logo :class (nav-prime-1)]
          ([MAGIC :tag A :x 27 :y 68 :w 96 :h 29 :mt 0 :mr 0 :mb 0 :ml 0 :class (nav-logo-link)]
           ([BLOCK :tag SPAN :x 27 :y 68 :w 96 :h 29 :class (nav-logo-base nav-sprite)]
            ([LINE]
             ([TEXT :x -473 :y 60 :w 50 :h 16]))))
          ([BLOCK :tag A :x 92 :y 87 :w 39 :h 10 :class (nav-logo-tagline nav-sprite)])))
        ([BLOCK :tag DIV :x 1328 :y 55 :w 400 :h 39 :class (nav-right)]
         ([BLOCK :tag DIV :x 1328 :y 64 :w 400 :h 39 :id navSwmHoliday]
          ([BLOCK :tag A :x 1328 :y 64 :w 400 :h 39 :class (nav-imageHref)]))
         ([ANON]
          ([LINE]
           ([INLINE :tag DIV :id nav-swmslot]))))
        ([BLOCK :tag DIV :x 0 :y 55 :w 1728 :h 39 :class (nav-fill)]
         ([BLOCK :tag DIV :x 192 :y 55 :w 1136 :h 46 :id nav-search]
          ([BLOCK :tag DIV :x 192 :y 66 :w 1111 :h 0 :id nav-bar-left])
          ([BLOCK :tag FORM :x 192 :y 66 :w 1111 :h 35 :class (nav-searchbar)]
           ([BLOCK :tag DIV :x 192 :y 66 :w 46 :h 35 :class (nav-left)]
            ([BLOCK :tag DIV :x 192 :y 66 :w 46 :h 35 :class (nav-search-scope nav-sprite)]
             ([BLOCK :tag DIV :x 198 :y 68 :w 39 :h 33 :class (nav-search-facade)]
              ([BLOCK :tag SPAN :x 203 :y 68 :w 13 :h 33 :class (nav-search-label)]
               ([LINE]
                ([TEXT :x 203 :y 77.5 :w 13 :h 14])))
              ([BLOCK :tag I :x 221 :y 82 :w 8 :h 4 :class (nav-icon)]))
             ([BLOCK :tag SELECT :x 193 :y 66 :w 192 :h 35 :id searchDropdownBox :class (nav-search-dropdown searchSelect)]
              ([BLOCK :tag OPTION :x 195 :y 102 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 102 :w 100 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 118 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 118 :w 90 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 134 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 134 :w 69 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 150 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 150 :w 94 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 166 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 166 :w 133 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 182 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 182 :w 70 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 198 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 198 :w 32 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 214 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 214 :w 44 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 230 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 230 :w 39 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 246 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 246 :w 74 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 262 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 262 :w 169 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 278 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 278 :w 163 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 294 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 294 :w 60 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 310 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 310 :w 39 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 326 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 326 :w 41 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 342 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 342 :w 43 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 358 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 358 :w 44 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 374 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 374 :w 139 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 390 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 390 :w 69 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 406 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 406 :w 167 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 422 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 422 :w 79 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 438 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 438 :w 69 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 454 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 454 :w 64 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 470 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 470 :w 160 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 486 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 486 :w 68 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 502 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 502 :w 148 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 518 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 518 :w 100 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 534 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 534 :w 94 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 550 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 550 :w 130 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 566 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 566 :w 77 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 582 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 582 :w 148 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 598 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 598 :w 90 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 614 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 614 :w 149 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 630 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 630 :w 79 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 646 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 646 :w 124 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 662 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 662 :w 97 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 678 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 678 :w 138 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 694 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 694 :w 79 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 710 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 710 :w 81 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 726 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 726 :w 55 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 742 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 742 :w 117 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 758 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 758 :w 171 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 774 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 774 :w 91 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 790 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 790 :w 85 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 806 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 806 :w 32 :h 16]))))))
           ([BLOCK :tag DIV :x 1258 :y 66 :w 45 :h 35 :class (nav-right)]
            ([BLOCK :tag DIV :x 1258 :y 66 :w 45 :h 35 :class (nav-search-submit nav-sprite)]
             ([BLOCK :tag SPAN :x 1270 :y 73 :w 21 :h 21 :id nav-search-submit-text :class (nav-search-submit-text nav-sprite)]
              ([LINE]
               ([TEXT :x 1021.5 :y 72 :w 18 :h 15])))
             ([BLOCK :tag INPUT :x 1258 :y 66 :w 45 :h 35 :class (nav-input)])))
           ([BLOCK :tag DIV :x 238 :y 66 :w 1020 :h 35 :class (nav-fill)]
            ([BLOCK :tag DIV :x 238 :y 66 :w 1020 :h 35 :class (nav-search-field)]
             ([BLOCK :tag INPUT :x 238 :y 66 :w 1020 :h 33 :id twotabsearchtextbox :class (nav-input)]))
            ([BLOCK :tag DIV :x 238 :y 101 :w 1020 :h 0 :id nav-iss-attach])))))
        ([BLOCK :tag DIV :x 0 :y 94 :w 1728 :h 0 :id nav-flyout-iss-anchor])
        ([BLOCK :tag DIV :x 0 :y 94 :w 1728 :h 0 :id nav-flyout-anchor])
        ([BLOCK :tag DIV :x 0 :y 94 :w 1728 :h 0 :id nav-flyout-iss-anchor])
        ([BLOCK :tag DIV :x 0 :y 94 :w 1728 :h 0 :id nav-flyout-anchor]))
       ([BLOCK :tag DIV :x 0 :y 94 :w 1728 :h 60 :id nav-main :class (nav-sprite)]
        ([BLOCK :tag DIV :x 0 :y 99 :w 192 :h 55 :class (nav-left)]
         ([BLOCK :tag DIV :x 0 :y 101 :w 192 :h 50 :id nav-shop]
          ([BLOCK :tag A :x 16 :y 108 :w 116 :h 44 :id nav-link-shopall :class (nav-a nav-a-2)]
           ([MAGIC :tag SPAN :x 26 :y 117 :w 55 :h 14 :mt 9 :mr 0 :mb 0 :ml 0 :class (nav-line-1)]
            ([TEXT :x 26 :y 117 :w 44 :h 14]))
           ([MAGIC :tag SPAN :x 26 :y 131 :w 106 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (nav-line-2)]
            ([TEXT :x 26 :y 130.5 :w 82 :h 16])
            ([MAGIC :tag SPAN :x 113 :y 137.5 :w 8 :h 4 :mt 0 :mr 0 :mb 2 :ml 5 :id e10095 :class (nav-icon nav-arrow)])))))
        ([BLOCK :tag DIV :x 1307 :y 99 :w 421 :h 55 :class (nav-right)]
         ([BLOCK :tag DIV :x 1307 :y 101 :w 421 :h 50 :id nav-tools]
          ([BLOCK :tag A :x 1340 :y 108 :w 128 :h 44 :id nav-link-yourAccount :class (nav-a nav-a-2 nav-truncate)]
           ([MAGIC :tag SPAN :x 1340 :y 117 :w 128 :h 14 :mt 1 :mr 0 :mb 0 :ml 0 :class (nav-line-1)]
            ([TEXT :x 1350 :y 117 :w 65 :h 14]))
           ([MAGIC :tag SPAN :x 1350 :y 108 :w 118 :h 43 :mt 0 :mr 0 :mb 0 :ml 0 :class (nav-line-2)]
            ([TEXT :x 1350 :y 130.5 :w 94 :h 16])
            ([MAGIC :tag SPAN :x 1449 :y 137.5 :w 8 :h 4 :mt 0 :mr 0 :mb 2 :ml 5 :id e10096 :class (nav-icon nav-arrow)])))
          ([BLOCK :tag A :x -8693 :y 107 :w 1 :h 1 :class (nav-hidden-aria)]
           ([LINE]
            ([TEXT :x -8693 :y 106 :w 19 :h 14]))
           ([LINE]
            ([TEXT :x -8693 :y 118 :w 37 :h 14]))
           ([LINE]
            ([TEXT :x -8693 :y 130 :w 25 :h 14]))
           ([LINE]
            ([TEXT :x -8693 :y 142 :w 19 :h 14])))
          ([BLOCK :tag A :x 1470 :y 108 :w 74 :h 44 :id nav-link-prime :class (nav-a nav-a-2)]
           ([MAGIC :tag SPAN :x 1480 :y 117 :w 35 :h 14 :mt 9 :mr 0 :mb 0 :ml 0 :class (nav-line-1)]
            ([TEXT :x 1480 :y 117 :w 24 :h 14]))
           ([MAGIC :tag SPAN :x 1480 :y 131 :w 64 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (nav-line-2)]
            ([TEXT :x 1480 :y 130.5 :w 40 :h 16])
            ([MAGIC :tag SPAN :x 1525 :y 137.5 :w 8 :h 4 :mt 0 :mr 0 :mb 2 :ml 5 :id e10097 :class (nav-icon nav-arrow)])))
          ([BLOCK :tag A :x 1546 :y 108 :w 67 :h 44 :id nav-link-wishlist :class (nav-a nav-a-2)]
           ([MAGIC :tag SPAN :x 1556 :y 117 :w 35 :h 14 :mt 9 :mr 0 :mb 0 :ml 0 :class (nav-line-1)]
            ([TEXT :x 1556 :y 117 :w 24 :h 14]))
           ([MAGIC :tag SPAN :x 1556 :y 131 :w 57 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (nav-line-2)]
            ([TEXT :x 1556 :y 130.5 :w 33 :h 16])
            ([MAGIC :tag SPAN :x 1594 :y 137.5 :w 8 :h 4 :mt 0 :mr 0 :mb 2 :ml 5 :id e10098 :class (nav-icon nav-arrow)])))
          ([BLOCK :tag A :x 1615 :y 108 :w 105 :h 44 :id nav-cart :class (nav-a nav-a-2)]
           ([MAGIC :tag SPAN :x 1667 :y 117 :w 11 :h 14 :mt 9 :mr 0 :mb 0 :ml 42 :class (nav-line-1)])
           ([MAGIC :tag SPAN :x 1667 :y 131 :w 53 :h 20 :mt 0 :mr 0 :mb 0 :ml 42 :class (nav-line-2)]
            ([TEXT :x 1667 :y 130.5 :w 29 :h 16])
            ([MAGIC :tag SPAN :x 1701 :y 137.5 :w 8 :h 4 :mt 0 :mr 0 :mb 2 :ml 5 :class (nav-icon nav-arrow)]))
           ([BLOCK :tag SPAN :x 1625 :y 119 :w 38 :h 26 :class (nav-cart-icon nav-sprite)])
           ([BLOCK :tag SPAN :x 1638 :y 115 :w 19 :h 16 :id nav-cart-count :class (nav-cart-count nav-cart-0)]
            ([LINE]
             ([TEXT :x 1643 :y 114.5 :w 9 :h 17]))))))
        ([BLOCK :tag DIV :x 192 :y 99 :w 1115 :h 55 :class (nav-fill)]
         ([BLOCK :tag DIV :x 192 :y 99 :w 529 :h 69 :id nav-xshop-container]
          ([BLOCK :tag DIV :x 192 :y 131 :w 529 :h 37 :id nav-xshop]
           ([BLOCK :tag A :x 192 :y 131 :w 122 :h 17 :id nav-recently-viewed :class (nav-a)]
            ([ANON]
             ([LINE]
              ([TEXT :x 192 :y 129.5 :w 99 :h 15])))
            ([MAGIC :tag SPAN :x 296 :y 135.5 :w 8 :h 4 :mt 0 :mr 0 :mb 2 :ml 5 :id e10099 :class (nav-icon nav-arrow)]))
           ([BLOCK :tag A :x 314 :y 131 :w 141 :h 12 :id nav-your-amazon :class (nav-a nav_a)]
            ([LINE]
             ([TEXT :x 324 :y 129.5 :w 121 :h 15])))
           ([BLOCK :tag A :x 455 :y 131 :w 100 :h 12 :class (nav-a)]
            ([LINE]
             ([TEXT :x 465 :y 129.5 :w 80 :h 15])))
           ([BLOCK :tag A :x 555 :y 131 :w 78 :h 12 :class (nav-a)]
            ([LINE]
             ([TEXT :x 565 :y 129.5 :w 58 :h 15])))
           ([BLOCK :tag A :x 633 :y 131 :w 42 :h 12 :class (nav-a)]
            ([LINE]
             ([TEXT :x 643 :y 129.5 :w 22 :h 15])))
           ([BLOCK :tag A :x 675 :y 131 :w 46 :h 12 :class (nav-a)]
            ([LINE]
             ([TEXT :x 685 :y 129.5 :w 26 :h 15])))))))))
     ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 4263 :id pageContent :class (a-section a-spacing-none)]
      ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :id e10100]
       ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :id gw-desktop-herotator :class (a-section a-spacing-none gw-desktop-herotator-ready)]
        ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :id e10101 :class (a-carousel-container a-carousel-display-single a-carousel-transition-slide gw-desktop-herotator a-carousel-initialized)]
         ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :class (a-row a-carousel-controls a-carousel-row)]
          ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :class (a-carousel-row-inner)]
           ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :class (a-carousel-col a-carousel-center)]
            ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :id anonCarousel1 :class (a-carousel-viewport)]
             ([BLOCK :tag OL :x -4386 :y 154 :w 9000 :h 300 :id e10075 :class (a-carousel)]
              ([MAGIC :tag LI :x -4386 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10102 :class (a-carousel-card)]
               ([BLOCK :tag DIV :x -4386 :y 154 :w 1500 :h 300 :id gw-ftGr-desktop-hero-kindle-A :class (gw-ftGr-desktop-hero)]
                ([BLOCK :tag DIV :x -4386 :y 154 :w 1500 :h 300 :class (gw-critical-content)]
                 ([BLOCK :tag DIV :x -4386 :y 154 :w 1500 :h 300 :id image-map-ns_174AMHZCNNZH083A2GQT_9165_ :class (shogun-widget image-map gateway-desktop-link)]
                  ([BLOCK :tag DIV :x -4386 :y 154 :w 1500 :h 300 :id e10103 :class (cropped-image-map-size)]
                   ([BLOCK :tag DIV :x -7386 :y 154 :w 7500 :h 300 :class (cropped-image-map-center-alignment)]
                    ([MAGIC :tag SPAN :x -4386 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10104]
                     ([MAGIC :tag A :x -4386 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                      ([INLINE :tag IMG :class (a-dynamic-image)])))))))))
              ([MAGIC :tag LI :x -2886 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10105 :class (a-carousel-card)]
               ([BLOCK :tag DIV :x -2886 :y 154 :w 1500 :h 300 :id gw-ftGr-desktop-hero-G :class (gw-ftGr-desktop-hero)]
                ([BLOCK :tag DIV :x -2886 :y 154 :w 1500 :h 300 :id image-map-ns_174AMHZCNNZH083A2GQT_9213_ :class (shogun-widget image-map gateway-desktop-link)]
                 ([BLOCK :tag DIV :x -2886 :y 154 :w 1500 :h 300 :id e10106 :class (cropped-image-map-size)]
                  ([BLOCK :tag DIV :x -5886 :y 154 :w 7500 :h 300 :class (cropped-image-map-center-alignment)]
                   ([MAGIC :tag SPAN :x -2886 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10107]
                    ([MAGIC :tag A :x -2886 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                     ([INLINE :tag IMG :class (a-dynamic-image)]))))))))
              ([MAGIC :tag LI :x -1386 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10108 :class (a-carousel-card)]
               ([BLOCK :tag DIV :x -1386 :y 154 :w 1500 :h 300 :id gw-ftGr-desktop-hero-softlines :class (gw-ftGr-desktop-hero)]
                ([BLOCK :tag DIV :x -1386 :y 154 :w 1500 :h 300 :id image-map-ns_174AMHZCNNZH083A2GQT_9214_ :class (shogun-widget image-map gateway-desktop-map)]
                 ([BLOCK :tag DIV :x -1386 :y 154 :w 1500 :h 300 :id e10109 :class (cropped-image-map-size)]
                  ([BLOCK :tag DIV :x -4386 :y 154 :w 7500 :h 300 :class (cropped-image-map-center-alignment)]
                   ([ANON]
                    ([LINE]
                     ([INLINE :tag MAP])))
                   ([MAGIC :tag SPAN :x -1386 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10110]
                    ([INLINE :tag IMG :class (a-dynamic-image)])))))))
              ([MAGIC :tag LI :x 114 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10111 :class (a-carousel-card)]
               ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :id gw-ftGr-desktop-hero-piv :class (gw-ftGr-desktop-hero)]
                ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :id image-map-ns_174AMHZCNNZH083A2GQT_9215_ :class (shogun-widget image-map gateway-desktop-map)]
                 ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :id e10112 :class (cropped-image-map-size)]
                  ([BLOCK :tag DIV :x -2886 :y 154 :w 7500 :h 300 :class (cropped-image-map-center-alignment)]
                   ([ANON]
                    ([LINE]
                     ([INLINE :tag MAP])))
                   ([MAGIC :tag SPAN :x 114 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10113]
                    ([INLINE :tag IMG :class (a-dynamic-image)])))))))
              ([MAGIC :tag LI :x 1614 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10114 :class (a-carousel-card)]
               ([BLOCK :tag DIV :x 1614 :y 154 :w 1500 :h 300 :id gw-ftGr-desktop-hero-kindle-B :class (gw-ftGr-desktop-hero)]
                ([BLOCK :tag DIV :x 1614 :y 154 :w 1500 :h 300 :id image-map-ns_174AMHZCNNZH083A2GQT_9216_ :class (shogun-widget image-map gateway-desktop-map)]
                 ([BLOCK :tag DIV :x 1614 :y 154 :w 1500 :h 300 :id e10115 :class (cropped-image-map-size)]
                  ([BLOCK :tag DIV :x -1386 :y 154 :w 7500 :h 300 :class (cropped-image-map-center-alignment)]
                   ([ANON]
                    ([LINE]
                     ([INLINE :tag MAP])))
                   ([MAGIC :tag SPAN :x 1614 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10116]
                    ([INLINE :tag IMG :class (a-dynamic-image)])))))))
              ([MAGIC :tag LI :x 3114 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10117 :class (a-carousel-card)]
               ([BLOCK :tag DIV :x 3114 :y 154 :w 1500 :h 300 :id gw-ftGr-desktop-hero-prime :class (gw-ftGr-desktop-hero)]
                ([BLOCK :tag DIV :x 3114 :y 154 :w 1500 :h 300 :id image-map-ns_174AMHZCNNZH083A2GQT_9217_ :class (shogun-widget image-map gateway-desktop-link)]
                 ([BLOCK :tag DIV :x 3114 :y 154 :w 1500 :h 300 :id e10118 :class (cropped-image-map-size)]
                  ([BLOCK :tag DIV :x 114 :y 154 :w 7500 :h 300 :class (cropped-image-map-center-alignment)]
                   ([MAGIC :tag SPAN :x 3114 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10119]
                    ([MAGIC :tag A :x 3114 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                     ([INLINE :tag IMG :class (a-dynamic-image)]))))))))))))))
        ([BLOCK :tag DIV :x 114 :y 454 :w 1500 :h 0 :id gw-desktop-herotator-controls]
         ([BLOCK :tag OL :x 798 :y 430 :w 132 :h 0 :id e10076]
          ([BLOCK :tag LI :x 798 :y 430 :w 22 :h 13]
           ([BLOCK :tag A :x 803 :y 430 :w 12 :h 13 :class (herotator-goToPage-1 gw-icon)]
            ([BLOCK :tag SPAN :x -9202 :y -9570 :w 179 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9202 :y -9568 :w 179 :h 15])))))
          ([BLOCK :tag LI :x 820 :y 430 :w 22 :h 13]
           ([BLOCK :tag A :x 825 :y 430 :w 12 :h 13 :class (herotator-goToPage-2 gw-icon)]
            ([BLOCK :tag SPAN :x -9202 :y -9570 :w 346 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9202 :y -9568 :w 346 :h 15])))))
          ([BLOCK :tag LI :x 842 :y 430 :w 22 :h 13]
           ([BLOCK :tag A :x 847 :y 430 :w 12 :h 13 :class (herotator-goToPage-3 gw-icon)]
            ([BLOCK :tag SPAN :x -9202 :y -9570 :w 129 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9202 :y -9568 :w 129 :h 15])))))
          ([BLOCK :tag LI :x 864 :y 430 :w 22 :h 13]
           ([BLOCK :tag A :x 869 :y 430 :w 12 :h 13 :class (herotator-goToPage-4 gw-icon active)]
            ([BLOCK :tag SPAN :x -9202 :y -9570 :w 218 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9202 :y -9568 :w 218 :h 15])))))
          ([BLOCK :tag LI :x 886 :y 430 :w 22 :h 13]
           ([BLOCK :tag A :x 891 :y 430 :w 12 :h 13 :class (herotator-goToPage-5 gw-icon)]
            ([BLOCK :tag SPAN :x -9202 :y -9570 :w 128 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9202 :y -9568 :w 128 :h 15])))))
          ([BLOCK :tag LI :x 908 :y 430 :w 22 :h 13]
           ([BLOCK :tag A :x 913 :y 430 :w 12 :h 13 :class (herotator-goToPage-6 gw-icon)]
            ([BLOCK :tag SPAN :x -9202 :y -9570 :w 140 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9202 :y -9568 :w 140 :h 15])))))))))
      ([BLOCK :tag DIV :x 114 :y 454 :w 1500 :h 0 :class (a-section a-spacing-none gw-hud-t2)])
      ([BLOCK :tag DIV :x 114 :y 454 :w 1500 :h 3051 :id gw-content-grid :class (a-fixed-right-flipped-grid)]
       ([BLOCK :tag DIV :x 114 :y 454 :w 1500 :h 3051 :class (a-fixed-right-grid-inner)]
        ([BLOCK :tag DIV :x 114 :y 454 :w 1500 :h 3051 :id e10016 :class (a-section a-spacing-medium)]
         ([BLOCK :tag DIV :x 1304 :y 454 :w 310 :h 713 :id sidebar :class (a-fixed-right-grid-col a-col-right)]
          ([BLOCK :tag DIV :x 1309 :y 464 :w 300 :h 275 :id desktop-ad-atf :class (displayAd)]
           ([BLOCK :tag DIV :x 1309 :y 469 :w 300 :h 270 :id DAr2 :class (copilot-secure-display celwidget  text/x-dacx-safeframe)]
            ([LINE]
             ([INLINE :tag IFRAME]))))
          ([BLOCK :tag HR :x 1327 :y 739 :w 264 :h 1 :class (slot-hr desktop-ad-atf-hr)])
          ([BLOCK :tag DIV :x 1327 :y 755 :w 264 :h 170 :id desktop-sidekick-1 :class (sidekick)]
           ([BLOCK :tag DIV :x 1327 :y 755 :w 264 :h 170 :id image-map-ns_0FB0Y1W1RM43J12P8FYX_3495_ :class (shogun-widget image-map gateway-desktop-link)]
            ([BLOCK :tag DIV :x 1327 :y 755 :w 264 :h 170 :id e10120 :class (cropped-image-map-size)]
             ([BLOCK :tag DIV :x 799 :y 755 :w 1320 :h 170 :class (cropped-image-map-center-alignment)]
              ([MAGIC :tag SPAN :x 1327 :y 755 :w 264 :h 170 :mt 0 :mr 0 :mb 0 :ml 0 :id e10121]
               ([MAGIC :tag A :x 1327 :y 755 :w 264 :h 170 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                ([INLINE :tag IMG :class (a-dynamic-image)])))))))
          ([BLOCK :tag HR :x 1327 :y 940 :w 264 :h 1 :class (slot-hr desktop-sidekick-1-hr)])
          ([BLOCK :tag DIV :x 1327 :y 956 :w 264 :h 170 :id desktop-sidekick-2 :class (sidekick)]
           ([BLOCK :tag DIV :x 1327 :y 956 :w 264 :h 170 :id image-map-ns_06PA60SNBQCA5EKS162J_70_ :class (shogun-widget image-map gateway-desktop-link)]
            ([BLOCK :tag DIV :x 1327 :y 956 :w 264 :h 170 :id e10122 :class (cropped-image-map-size)]
             ([BLOCK :tag DIV :x 799 :y 956 :w 1320 :h 170 :class (cropped-image-map-center-alignment)]
              ([MAGIC :tag SPAN :x 1327 :y 956 :w 264 :h 170 :mt 0 :mr 0 :mb 0 :ml 0 :id e10123]
               ([MAGIC :tag A :x 1327 :y 956 :w 264 :h 170 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                ([INLINE :tag IMG :class (a-dynamic-image)])))))))
          ([BLOCK :tag HR :x 1327 :y 1141 :w 264 :h 1 :class (slot-hr desktop-sidekick-2-hr)])
          ([BLOCK :tag DIV :x 1327 :y 1157 :w 264 :h 0 :id sidebarbtf]))
         ([BLOCK :tag DIV :x 114 :y 454 :w 1190 :h 3051 :id mainContent :class (a-fixed-right-grid-col a-col-left)]
          ([BLOCK :tag DIV :x 114 :y 454 :w 1190 :h 3051 :id btfContent]
           ([BLOCK :tag DIV :x 134 :y 459 :w 1150 :h 285 :id desktop-top :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 459 :w 1150 :h 285 :id image-shoveler-ns_0ANDZDV8FN2SGYFAR20J_9009_ :class (a-section a-spacing-none shogun-widget image-shoveler aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 479 :w 1110 :h 35 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 479 :w 443 :h 31.5 :class (as-title-block-left)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 483.25 :w 443 :h 23]))))
              ([BLOCK :tag SPAN :x 597 :y 479 :w 59 :h 35 :class (as-title-block-right)]
               ([LINE]
                ([INLINE :tag A :class (a-link-normal)]
                 ([TEXT :x 612 :y 488.5 :w 44 :h 16])))))
             ([BLOCK :tag DIV :x 154 :y 514 :w 1110 :h 220 :id e10017 :class (a-section feed-carousel first-carousel)]
              ([BLOCK :tag DIV :x 154 :y 514 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 514 :w 2790 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10124 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 434 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10125 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 714 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10126 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 994 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10127 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10128 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10129 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10130 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10131 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10132 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10083 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))))
              ([BLOCK :tag A :x 154 :y 569 :w 45 :h 100 :class (feed-carousel-control feed-left feed-control-disabled)]
               ([MAGIC :tag SPAN :x 167.5 :y 608 :w 13 :h 22 :mt -11 :mr 0 :mb 0 :ml 0 :class (gw-icon feed-arrow)]))
              ([BLOCK :tag A :x 1219 :y 569 :w 45 :h 100 :class (feed-carousel-control feed-right)]
               ([MAGIC :tag SPAN :x 1237.5 :y 608 :w 13 :h 22 :mt -11 :mr 0 :mb 0 :ml 0 :class (gw-icon feed-arrow)]))
              ([BLOCK :tag SPAN :x 154 :y 728 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 730 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 134 :y 744 :w 1150 :h 285 :id desktop-1 :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 744 :w 1150 :h 285 :id uber-widget-ns_174AMHZCNNZH083A2GQT_9191_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 764 :w 1110 :h 35 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 764 :w 295 :h 31.5 :class (as-title-block-left)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 768.25 :w 295 :h 23]))))
              ([BLOCK :tag SPAN :x 449 :y 764 :w 76 :h 35 :class (as-title-block-right)]
               ([LINE]
                ([INLINE :tag A :class (a-link-normal)]
                 ([TEXT :x 464 :y 773.5 :w 61 :h 16])))))
             ([BLOCK :tag DIV :x 154 :y 799 :w 1110 :h 220 :id e10018 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 154 :y 799 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 799 :w 5590 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10135 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y (/ 9965 12) :w 270 :h (/ 823 6) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 154 :y (/ 9965 12) :w 270 :h (/ 823 6) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 434 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10136 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 434 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 714 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10137 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 714 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 994 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10138 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 994 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10139 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1274 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10140 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1554 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10141 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1834 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10142 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2114 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10143 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2394 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10144 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2674 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2954 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10145 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2954 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2954 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3234 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10146 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3234 :y 803.4 :w 270 :h 191.2 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3234 :y 803.4 :w 270 :h 191.2 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3514 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10147 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3514 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3514 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3794 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10148 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3794 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3794 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4074 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10149 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4074 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4074 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4354 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10150 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4354 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4354 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4634 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10151 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4634 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4634 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4914 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10152 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4914 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4914 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5194 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10153 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5194 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5194 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5474 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10084 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5474 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5474 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))))
              ([BLOCK :tag SPAN :x 154 :y 1013 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 1015 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 134 :y 1029 :w 1150 :h 281.5 :id desktop-2 :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 1029 :w 1150 :h 281.5 :id uber-widget-ns_174AMHZCNNZH083A2GQT_9192_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 1049 :w 1110 :h 31.5 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 1049 :w 1110 :h 31.5 :id e10008 :class (as-title-block-single-title)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 1053.25 :w 311 :h 23])))))
             ([BLOCK :tag DIV :x 154 :y 1080.5 :w 1110 :h 220 :id e10019 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 154 :y 1080.5 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 1080.5 :w 5590 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10156 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 154 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 434 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10157 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 434 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 714 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10158 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 714 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 994 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10159 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 994 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10160 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1274 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10161 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y (/ 16247 15) :w 270 :h 194.75 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1554 :y (/ 16247 15) :w 270 :h 194.75 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10162 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1834 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10163 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2114 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10164 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2394 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10165 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2674 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2954 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10166 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2954 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2954 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3234 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10167 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3234 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3234 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3514 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10168 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3514 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3514 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3794 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10169 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3794 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3794 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4074 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10170 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4074 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4074 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4354 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10171 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4354 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4354 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4634 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10172 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4634 :y (/ 13351 12) :w 270 :h (/ 815 6) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4634 :y (/ 13351 12) :w 270 :h (/ 815 6) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4914 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10173 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4914 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4914 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5194 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10174 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5194 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5194 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5474 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10085 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5474 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5474 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))))
              ([BLOCK :tag SPAN :x 154 :y 1294.5 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 1296.5 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 134 :y 1310.5 :w 1150 :h 239 :class (billboardRowWrapper)]
            ([BLOCK :tag DIV :x 134 :y 1322.5 :w 1150 :h 200 :class (a-row billboardRow)]
             ([BLOCK :tag DIV :x 134 :y 1322.5 :w 562.9 :h 200 :class (a-column a-span6)]
              ([MAGIC :tag DIV :x 134 :y 1322.5 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-1 :class (billboard)]
               ([BLOCK :tag DIV :x 144 :y 1322.5 :w 542.9 :h 200 :id scalable-image-map_scalable-image-map-ns_10ZP4QDJGM0MNW2K4ASK_6730_ :class (a-section a-text-center shogun-widget scalable-image-map aui-desktop-link)]
                ([BLOCK :tag A :x 195.45 :y 1322.5 :w 440 :h 200 :class (a-link-normal)]
                 ([LINE]
                  ([INLINE :tag IMG]))))))
             ([BLOCK :tag DIV :x 721.1 :y 1322.5 :w 562.9 :h 200 :class (a-column a-span6 a-span-last)]
              ([MAGIC :tag DIV :x 721.1 :y 1322.5 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-2 :class (billboard)]
               ([BLOCK :tag DIV :x 731.1 :y 1322.5 :w 542.9 :h 200 :id scalable-image-map_scalable-image-map-ns_0WAZGCXEBZJ34NQ5YN93_194_ :class (a-section a-text-center shogun-widget scalable-image-map aui-desktop-link)]
                ([BLOCK :tag A :x 782.55 :y 1322.5 :w 440 :h 200 :class (a-link-normal)]
                 ([LINE]
                  ([INLINE :tag IMG]))))))))
           ([BLOCK :tag HR :x 134 :y 1549.5 :w 1150 :h 1 :class (billboardrow-hr)])
           ([BLOCK :tag DIV :x 134 :y 1570.5 :w 1150 :h 285 :id desktop-3 :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 1570.5 :w 1150 :h 285 :id uber-widget-ns_174AMHZCNNZH083A2GQT_9193_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 1590.5 :w 1110 :h 35 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 1590.5 :w 314 :h 31.5 :class (as-title-block-left)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 1594.75 :w 314 :h 23]))))
              ([BLOCK :tag SPAN :x 468 :y 1590.5 :w 76 :h 35 :class (as-title-block-right)]
               ([LINE]
                ([INLINE :tag A :class (a-link-normal)]
                 ([TEXT :x 483 :y 1600 :w 61 :h 16])))))
             ([BLOCK :tag DIV :x 154 :y 1625.5 :w 1110 :h 220 :id e10020 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 154 :y 1625.5 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 1625.5 :w 5590 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10177 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 154 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 434 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10178 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 434 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 714 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10179 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 714 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 994 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10180 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 994 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10181 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1274 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10182 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1554 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10183 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1834 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10184 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2114 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10185 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2394 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10186 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2674 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2954 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10187 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2954 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2954 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3234 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10188 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3234 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3234 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3514 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10189 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3514 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3514 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3794 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10190 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3794 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3794 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4074 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10191 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4074 :y (/ 19735 12) :w 270 :h 161.85 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4074 :y (/ 19735 12) :w 270 :h 161.85 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4354 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10192 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4354 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4354 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4634 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10193 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4634 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4634 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4914 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10194 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4914 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4914 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5194 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10195 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5194 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5194 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5474 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10086 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5474 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5474 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))))
              ([BLOCK :tag SPAN :x 154 :y 1839.5 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 1841.5 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 134 :y 1855.5 :w 1150 :h 281.5 :id desktop-4 :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 1855.5 :w 1150 :h 281.5 :id uber-widget-ns_174AMHZCNNZH083A2GQT_9209_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 1875.5 :w 1110 :h 31.5 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 1875.5 :w 1110 :h 31.5 :id e10009 :class (as-title-block-single-title)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 1879.75 :w 427 :h 23])))))
             ([BLOCK :tag DIV :x 154 :y 1907 :w 1110 :h 220 :id e10021 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 154 :y 1907 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 1907 :w 5590 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10198 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 154 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 434 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10199 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 434 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 714 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10200 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y (/ 29174 15) :w 270 :h 124.15 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 714 :y (/ 29174 15) :w 270 :h 124.15 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 994 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10201 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y (/ 28796 15) :w 270 :h (/ 2618 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 994 :y (/ 28796 15) :w 270 :h (/ 2618 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10202 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1274 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10203 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1554 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10204 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y 1928.65 :w 270 :h 146.875 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1834 :y 1928.65 :w 270 :h 146.875 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10205 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 1929.95 :w 270 :h 154.1 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2114 :y 1929.95 :w 270 :h 154.1 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10206 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2394 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10207 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2674 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2954 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10208 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2954 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2954 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3234 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10209 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3234 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3234 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3514 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10210 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3514 :y 1930.7 :w 270 :h (/ 4579 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3514 :y 1930.7 :w 270 :h (/ 4579 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3794 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10211 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3794 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3794 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4074 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10212 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4074 :y 1973.1 :w 270 :h (/ 2033 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4074 :y 1973.1 :w 270 :h (/ 2033 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4354 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10213 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4354 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4354 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4634 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10214 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4634 :y (/ 23078 12) :w 270 :h 167.65 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4634 :y (/ 23078 12) :w 270 :h 167.65 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4914 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10215 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4914 :y (/ 29064 15) :w 270 :h (/ 4163 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4914 :y (/ 29064 15) :w 270 :h (/ 4163 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5194 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10216 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5194 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5194 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5474 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10087 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5474 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5474 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))))
              ([BLOCK :tag SPAN :x 154 :y 2121 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 2123 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 134 :y 2137 :w 1150 :h 239 :class (billboardRowWrapper)]
            ([BLOCK :tag DIV :x 134 :y 2149 :w 1150 :h 200 :class (a-row billboardRow)]
             ([BLOCK :tag DIV :x 134 :y 2149 :w 562.9 :h 200 :class (a-column a-span6)]
              ([MAGIC :tag DIV :x 134 :y 2149 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-3 :class (billboard)]
               ([BLOCK :tag DIV :x 144 :y 2149 :w 542.9 :h 200 :id scalable-image-map_scalable-image-map-ns_1EHC7NQ22AVVYHYZBKRH_4171_ :class (a-section a-text-center shogun-widget scalable-image-map aui-desktop-link)]
                ([BLOCK :tag A :x 195.45 :y 2149 :w 440 :h 200 :class (a-link-normal)]
                 ([LINE]
                  ([INLINE :tag IMG]))))))
             ([BLOCK :tag DIV :x 721.1 :y 2149 :w 562.9 :h 200 :class (a-column a-span6 a-span-last)]
              ([MAGIC :tag DIV :x 721.1 :y 2149 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-4 :class (billboard)]
               ([BLOCK :tag DIV :x 731.1 :y 2149 :w 542.9 :h 200 :id scalable-image-map_scalable-image-map-ns_0FWJ6V519EG7V6RS4CZZ_6651_ :class (a-section a-text-center shogun-widget scalable-image-map aui-desktop-link)]
                ([BLOCK :tag A :x 782.55 :y 2149 :w 440 :h 200 :class (a-link-normal)]
                 ([LINE]
                  ([INLINE :tag IMG]))))))))
           ([BLOCK :tag HR :x 134 :y 2376 :w 1150 :h 1 :class (billboardrow-hr)])
           ([BLOCK :tag DIV :x 134 :y 2397 :w 1150 :h 281.5 :id desktop-5 :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 2397 :w 1150 :h 281.5 :id uber-widget-ns_174AMHZCNNZH083A2GQT_9210_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 2417 :w 1110 :h 31.5 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 2417 :w 1110 :h 31.5 :id e10010 :class (as-title-block-single-title)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 2421.25 :w 493 :h 23])))))
             ([BLOCK :tag DIV :x 154 :y 2448.5 :w 1110 :h 220 :id e10022 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 154 :y 2448.5 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 2448.5 :w 3910 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10219 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 154 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 434 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10220 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y (/ 75255 30) :w 270 :h 80.05 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 434 :y (/ 75255 30) :w 270 :h 80.05 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 714 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10221 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y 2526.6 :w 270 :h (/ 526 12) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 714 :y 2526.6 :w 270 :h (/ 526 12) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 994 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10222 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 994 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10223 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1274 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10224 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1554 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10225 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y (/ 75225 30) :w 270 :h (/ 2459 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1834 :y (/ 75225 30) :w 270 :h (/ 2459 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10226 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2114 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10227 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2394 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10228 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y (/ 75647 30) :w 270 :h 53.9 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2674 :y (/ 75647 30) :w 270 :h 53.9 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2954 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10229 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2954 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2954 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3234 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10230 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3234 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3234 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3514 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10231 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3514 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3514 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3794 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10088 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3794 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3794 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))))
              ([BLOCK :tag SPAN :x 154 :y 2662.5 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 2664.5 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 134 :y 2678.5 :w 1150 :h 281.5 :id desktop-6 :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 2678.5 :w 1150 :h 281.5 :id uber-widget-ns_174AMHZCNNZH083A2GQT_9211_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 2698.5 :w 1110 :h 31.5 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 2698.5 :w 1110 :h 31.5 :id e10011 :class (as-title-block-single-title)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 2702.75 :w 332 :h 23])))))
             ([BLOCK :tag DIV :x 154 :y 2730 :w 1110 :h 220 :id e10023 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 154 :y 2730 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 2730 :w 5590 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10234 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 154 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 434 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10235 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 434 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 714 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10236 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 714 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 994 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10237 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 994 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10238 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1274 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10239 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1554 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10240 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1834 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10241 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2114 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10242 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2394 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10243 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2674 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2954 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10244 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2954 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2954 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3234 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10245 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3234 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3234 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3514 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10246 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3514 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3514 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3794 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10247 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3794 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3794 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4074 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10248 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4074 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4074 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4354 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10249 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4354 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4354 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4634 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10250 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4634 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4634 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4914 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10251 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4914 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4914 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5194 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10252 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5194 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5194 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5474 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10089 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5474 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5474 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))))
              ([BLOCK :tag SPAN :x 154 :y 2944 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 2946 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 134 :y 2960 :w 1150 :h 239 :class (billboardRowWrapper)]
            ([BLOCK :tag DIV :x 134 :y 2972 :w 1150 :h 200 :class (a-row billboardRow)]
             ([BLOCK :tag DIV :x 134 :y 2972 :w 562.9 :h 200 :class (a-column a-span6)]
              ([MAGIC :tag DIV :x 134 :y 2972 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-5 :class (billboard)]
               ([BLOCK :tag DIV :x 144 :y 2972 :w 542.9 :h 200 :id scalable-image-map_scalable-image-map-ns_149HZFZVSCDR2Z7DWGKT_5466_ :class (a-section a-text-center shogun-widget scalable-image-map aui-desktop-link)]
                ([BLOCK :tag A :x 195.45 :y 2972 :w 440 :h 200 :class (a-link-normal)]
                 ([LINE]
                  ([INLINE :tag IMG]))))))
             ([BLOCK :tag DIV :x 721.1 :y 2972 :w 562.9 :h 200 :class (a-column a-span6 a-span-last)]
              ([MAGIC :tag DIV :x 721.1 :y 2972 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-6 :class (billboard)]
               ([BLOCK :tag DIV :x 731.1 :y 2972 :w 542.9 :h 200 :id scalable-image-map_scalable-image-map-ns_129T3N9RHP6A735BEC93_7312_ :class (a-section a-text-center shogun-widget scalable-image-map aui-desktop-link)]
                ([BLOCK :tag A :x 782.55 :y 2972 :w 440 :h 200 :class (a-link-normal)]
                 ([LINE]
                  ([INLINE :tag IMG]))))))))
           ([BLOCK :tag HR :x 134 :y 3199 :w 1150 :h 1 :class (billboardrow-hr)])
           ([BLOCK :tag DIV :x 134 :y 3220 :w 1150 :h 285 :id desktop-7 :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 3220 :w 1150 :h 285 :id uber-widget-ns_174AMHZCNNZH083A2GQT_9212_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 3240 :w 1110 :h 35 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 3240 :w 349 :h 31.5 :class (as-title-block-left)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 3244.25 :w 349 :h 23]))))
              ([BLOCK :tag SPAN :x 503 :y 3240 :w 76 :h 35 :class (as-title-block-right)]
               ([LINE]
                ([INLINE :tag A :class (a-link-normal)]
                 ([TEXT :x 518 :y 3249.5 :w 61 :h 16])))))
             ([BLOCK :tag DIV :x 154 :y 3275 :w 1110 :h 220 :id e10024 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 154 :y 3275 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 3275 :w 5590 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10255 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y (/ 99255 30) :w 270 :h 133.05 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 154 :y (/ 99255 30) :w 270 :h 133.05 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 434 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10256 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 434 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 714 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10257 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y 3321 :w 270 :h 108 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 714 :y 3321 :w 270 :h 108 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 994 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10258 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 994 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10259 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 3320.9 :w 270 :h (/ 3247 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1274 :y 3320.9 :w 270 :h (/ 3247 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10260 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y (/ 49224 15) :w 270 :h (/ 5603 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1554 :y (/ 49224 15) :w 270 :h (/ 5603 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10261 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y (/ 49699 15) :w 270 :h (/ 3705 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1834 :y (/ 49699 15) :w 270 :h (/ 3705 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10262 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 3276.9 :w 270 :h 196.25 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2114 :y 3276.9 :w 270 :h 196.25 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10263 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y (/ 49363 15) :w 270 :h (/ 2524 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2394 :y (/ 49363 15) :w 270 :h (/ 2524 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10264 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y 3285 :w 270 :h 180 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2674 :y 3285 :w 270 :h 180 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2954 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10265 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2954 :y 3304.8 :w 270 :h (/ 1685 12) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2954 :y 3304.8 :w 270 :h (/ 1685 12) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3234 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10266 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3234 :y 3275.7 :w 270 :h 198.65 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3234 :y 3275.7 :w 270 :h 198.65 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3514 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10267 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3514 :y (/ 49584 15) :w 270 :h (/ 4163 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3514 :y (/ 49584 15) :w 270 :h (/ 4163 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3794 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10268 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3794 :y (/ 99397 30) :w 270 :h (/ 1853 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3794 :y (/ 99397 30) :w 270 :h (/ 1853 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4074 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10269 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4074 :y 3297.9 :w 270 :h 154.2 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4074 :y 3297.9 :w 270 :h 154.2 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4354 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10270 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4354 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4354 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4634 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10271 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4634 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4634 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4914 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10272 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4914 :y (/ 9923 3) :w 270 :h 134.7 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4914 :y (/ 9923 3) :w 270 :h 134.7 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5194 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10273 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5194 :y (/ 98719 30) :w 270 :h 168.75 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5194 :y (/ 98719 30) :w 270 :h 168.75 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5474 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10090 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5474 :y (/ 98903 30) :w 270 :h (/ 4695 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5474 :y (/ 98903 30) :w 270 :h (/ 4695 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))))
              ([BLOCK :tag SPAN :x 154 :y 3489 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 3491 :w 1110 :h 1 :class (feed-scrollbar-track)]))))))))))
      ([ANON]
       ([LINE]))
      ([MAGIC :tag DIV :x 114 :y 3542 :w 1500 :h 123 :mt 0 :mr 0 :mb 0 :ml 0 :id rhf :class (copilot-secure-display)]
       ([BLOCK :tag DIV :x 114 :y 3542 :w 1500 :h 123 :id e10279 :class (rhf-frame)]
        ([BLOCK :tag DIV :x 114 :y 3542 :w 1500 :h 123 :id rhf-error]
         ([BLOCK :tag DIV :x 114 :y 3542 :w 1500 :h 123 :class (rhf-border)]
          ([BLOCK :tag DIV :x 135 :y 3543 :w 1458 :h 32 :class (rhf-header)]
           ([LINE]
            ([TEXT :x 145 :y 3551.5 :w 539 :h 22])))
          ([BLOCK :tag DIV :x 135 :y 3575 :w 1458 :h 89 :class (rhf-footer)]
           ([BLOCK :tag DIV :x 135 :y 3575 :w 1458 :h 75 :class (rvi-container)]
            ([BLOCK :tag DIV :x 1437 :y 3593 :w 146 :h 75 :class (ybh-edit)]
             ([MAGIC :tag DIV :x 1477 :y 3591 :w 12 :h 11 :mt -2 :mr 0 :mb 0 :ml 0 :class (ybh-edit-arrow)]
              ([TEXT :x 1477 :y 3590.5 :w 4 :h 12]))
             ([ANON]
              ([LINE]
               ([TEXT :x 1489 :y 3623 :w 4 :h 15])))
             ([MAGIC :tag DIV :x 1493 :y 3593 :w 80 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (ybh-edit-link)]
              ([INLINE :tag A]
               ([TEXT :x 1493 :y 3593 :w 59 :h 11])
               ([TEXT :x 1493 :y 3604 :w 70 :h 11])
               ([TEXT :x 1493 :y 3615 :w 33 :h 11]))))
            ([BLOCK :tag SPAN :x 145 :y 3575 :w 650 :h 75 :class (no-rvi-message)]
             ([LINE]
              ([TEXT :x 145 :y 3605 :w 650 :h 15])))))))))
      ([ANON]
       ([LINE]))
      ([BLOCK :tag DIV :x 114 :y 3714 :w 1500 :h 695 :id navFooter]
       ([BLOCK :tag DIV :x 114 :y 3714 :w 1500 :h 49 :class (navFooterBackToTop)]
        ([BLOCK :tag SPAN :x 114 :y 3714 :w 1500 :h 49]
         ([LINE]
          ([TEXT :x 830.5 :y 3731 :w 67 :h 15]))))
       ([ANON]
        ([LINE]
         ([INLINE :tag A :id navBackToTop])))
       ([MAGIC :tag TABLE :x (/ 9527 30) :y 3788 :w 1092.85 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterVerticalColumn)]
        ([MAGIC :tag TBODY :x (/ 9527 30) :y 3788 :w 1092.85 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0]
         ([MAGIC :tag TR :x (/ 9527 30) :y 3788 :w 1092.85 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x (/ 9527 30) :y 3788 :w 128 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :id e10028 :class (navFooterLinkCol)]
           ([BLOCK :tag DIV :x (/ 9827 30) :y 3794 :w 108 :h 15.6 :class (navFooterColHead)]
            ([LINE]
             ([TEXT :x (/ 9827 30) :y 3793.3 :w 108 :h 17])))
           ([BLOCK :tag UL :x (/ 9827 30) :y 3823.6 :w 108 :h 86.4 :id e10077]
            ([MAGIC :tag LI :x (/ 9827 30) :y 3823.6 :w 108 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_first)]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 9827 30) :y 3823.9 :w 45 :h 15])))
            ([MAGIC :tag LI :x (/ 9827 30) :y 3847.2 :w 108 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 9827 30) :y 3847.5 :w 86 :h 15])))
            ([MAGIC :tag LI :x (/ 9827 30) :y 3870.8 :w 108 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 9827 30) :y 3871.1 :w 102 :h 15])))
            ([MAGIC :tag LI :x (/ 9827 30) :y 3894.4 :w 108 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_last)]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 9827 30) :y 3894.7 :w 97 :h 15])))))
          ([MAGIC :tag TD :x (/ 13367 30) :y 3788 :w 102.5 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :id e10044 :class (navFooterColSpacerInner)])
          ([MAGIC :tag TD :x 554.85 :y 3788 :w 195 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :id e10045 :class (navFooterLinkCol)]
           ([BLOCK :tag DIV :x 564.85 :y 3794 :w 175 :h 15.6 :class (navFooterColHead)]
            ([LINE]
             ([TEXT :x 564.85 :y 3793.3 :w 143 :h 17])))
           ([BLOCK :tag UL :x 564.85 :y 3823.6 :w 175 :h 205.1 :id e10078]
            ([MAGIC :tag LI :x 564.85 :y 3823.6 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_first)]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3823.9 :w 92 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 3847.2 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3847.5 :w 175 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 3870.8 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3871.1 :w 150 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 3894.4 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3894.7 :w 156 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 3918 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3918.3 :w 112 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 3941.6 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3941.9 :w 139 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 3965.2 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3965.5 :w 116 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 3988.8 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3989.1 :w 162 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 4012.4 :w 175 :h 16.3 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_last nav_a_carat)]
             ([INLINE :tag SPAN :class (nav_a_carat)]
              ([TEXT :x 564.85 :y 4011.4 :w 5 :h 17]))
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 573.85 :y 4013.4 :w 40 :h 15])))))
          ([MAGIC :tag TD :x 749.85 :y 3788 :w 102.5 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :id e10046 :class (navFooterColSpacerInner)])
          ([MAGIC :tag TD :x (/ 12887 15) :y 3788 :w 223 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :id e10047 :class (navFooterLinkCol)]
           ([BLOCK :tag DIV :x (/ 13037 15) :y 3794 :w 203 :h 15.6 :class (navFooterColHead)]
            ([LINE]
             ([TEXT :x (/ 13037 15) :y 3793.3 :w 188 :h 17])))
           ([BLOCK :tag UL :x (/ 13037 15) :y 3823.6 :w 203 :h 133.6 :id e10079]
            ([MAGIC :tag LI :x (/ 13037 15) :y 3823.6 :w 203 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_first)]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 13037 15) :y 3823.9 :w 192 :h 15])))
            ([MAGIC :tag LI :x (/ 13037 15) :y 3847.2 :w 203 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 13037 15) :y 3847.5 :w 143 :h 15])))
            ([MAGIC :tag LI :x (/ 13037 15) :y 3870.8 :w 203 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 13037 15) :y 3871.1 :w 203 :h 15])))
            ([MAGIC :tag LI :x (/ 13037 15) :y 3894.4 :w 203 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 13037 15) :y 3894.7 :w 98 :h 15])))
            ([MAGIC :tag LI :x (/ 13037 15) :y 3918 :w 203 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 13037 15) :y 3918.3 :w 140 :h 15])))
            ([MAGIC :tag LI :x (/ 13037 15) :y 3941.6 :w 203 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_last)]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 13037 15) :y 3941.9 :w 162 :h 15])))))
          ([MAGIC :tag TD :x (/ 16232 15) :y 3788 :w 102.5 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :id e10048 :class (navFooterColSpacerInner)])
          ([MAGIC :tag TD :x (/ 14297 12) :y 3788 :w 219 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :id e10038 :class (navFooterLinkCol)]
           ([BLOCK :tag DIV :x (/ 14417 12) :y 3794 :w 199 :h 15.6 :class (navFooterColHead)]
            ([LINE]
             ([TEXT :x (/ 14417 12) :y 3793.3 :w 110 :h 17])))
           ([BLOCK :tag UL :x (/ 14417 12) :y 3823.6 :w 199 :h 180.8 :id e10080]
            ([MAGIC :tag LI :x (/ 14417 12) :y 3823.6 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_first)]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3823.9 :w 78 :h 15])))
            ([MAGIC :tag LI :x (/ 14417 12) :y 3847.2 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3847.5 :w 69 :h 15])))
            ([MAGIC :tag LI :x (/ 14417 12) :y 3870.8 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3871.1 :w 151 :h 15])))
            ([MAGIC :tag LI :x (/ 14417 12) :y 3894.4 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3894.7 :w 86 :h 15])))
            ([MAGIC :tag LI :x (/ 14417 12) :y 3918 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3918.3 :w 145 :h 15])))
            ([MAGIC :tag LI :x (/ 14417 12) :y 3941.6 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3941.9 :w 199 :h 15])))
            ([MAGIC :tag LI :x (/ 14417 12) :y 3965.2 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3965.5 :w 107 :h 15])))
            ([MAGIC :tag LI :x (/ 14417 12) :y 3988.8 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_last)]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3989.1 :w 26 :h 15]))))))))
       ([BLOCK :tag DIV :x 122 :y 4066.7 :w 1484 :h 24 :class (navFooterLine navFooterLogoLine)]
        ([LINE]
         ([INLINE :tag A]
          ([INLINE :tag IMG]))))
       ([BLOCK :tag DIV :x 122 :y 4094.7 :w 1484 :h 18 :class (navFooterLine navFooterLinkLine navFooterPadItemLine)]
        ([MAGIC :tag UL :x 540.7 :y 4094.7 :w 646.6 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :id e10081]
         ([INLINE :tag LI :class (nav_first)]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 547.3 :y 4097.7 :w 43 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 603.5 :y 4097.7 :w 27 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 643.7 :y 4097.7 :w 37 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 693.9 :y 4097.7 :w 27 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 734.1 :y 4097.7 :w 34 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 781.3 :y 4097.7 :w 44 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 838.5 :y 4097.7 :w 22 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 873.7 :y 4097.7 :w 19 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 905.9 :y 4097.7 :w 29 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 948.1 :y 4097.7 :w 34 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 995.3 :y 4097.7 :w 58 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 1066.5 :y 4097.7 :w 27 :h 12])))
         ([INLINE :tag LI :class (nav_last)]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 1106.7 :y 4097.7 :w 74 :h 12])))))
       ([BLOCK :tag DIV :x 114 :y 4132.7 :w 1500 :h 237.3 :class (navFooterLine navFooterLinkLine navFooterDescLine)]
        ([MAGIC :tag TABLE :x 114 :y 4132.7 :w 1500 :h 237.3 :mt 0 :mr 0 :mb 0 :ml 0 :id e10026]
         ([MAGIC :tag TBODY :x 114 :y 4132.7 :w 1500 :h 237.3 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TR :x 114 :y 4132.7 :w 1500 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y 4132.7 :w 244.9 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10029 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 358.9 :y 4132.7 :w 102.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10062 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 367.15 :y 4133 :w 20 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 367.15 :y 4145.35 :w 83 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 367.15 :y 4145.35 :w 56 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 367.15 :y 4156.35 :w 83 :h 11]))))
           ([MAGIC :tag TD :x 461.4 :y 4132.7 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10063 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 5971 12) :y 4132.7 :w 118.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10064 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 3035 6) :y 4133 :w 50 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 3035 6) :y 4145.35 :w 56 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 3035 6) :y 4145.35 :w 52 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 3035 6) :y 4156.35 :w 56 :h 11]))))
           ([MAGIC :tag TD :x (/ 7393 12) :y 4132.7 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10065 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 9784 15) :y 4132.7 :w 127.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10066 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 19815 30) :y 4133 :w 22 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 19815 30) :y 4145.35 :w 103 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 19815 30) :y 4145.35 :w 103 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 19815 30) :y 4156.35 :w 52 :h 11]))))
           ([MAGIC :tag TD :x (/ 23393 30) :y 4132.7 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10067 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 815.95 :y 4132.7 :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10068 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 824.2 :y 4133 :w 81 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 824.2 :y 4145.35 :w 98 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 824.2 :y 4145.35 :w 98 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 824.2 :y 4156.35 :w 67 :h 11]))))
           ([MAGIC :tag TD :x 930.45 :y 4132.7 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10069 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 28999 30) :y 4132.7 :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10070 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 974.9 :y 4133 :w 28 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 974.9 :y 4145.35 :w 98 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 974.9 :y 4145.35 :w 98 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 974.9 :y 4156.35 :w 54 :h 11]))))
           ([MAGIC :tag TD :x (/ 16217 15) :y 4132.7 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10071 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1117.3 :y 4132.7 :w 106.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10072 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 33767 30) :y 4133 :w 88 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 33767 30) :y 4145.35 :w 68 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 33767 30) :y 4145.35 :w 68 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 33767 30) :y 4156.35 :w 64 :h 11]))))
           ([MAGIC :tag TD :x (/ 14686 12) :y 4132.7 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10073 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1260 :y 4132.7 :w 111.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10074 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 1268.25 :y 4133 :w 68 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 1268.25 :y 4145.35 :w 89 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 1268.25 :y 4145.35 :w 82 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 1268.25 :y 4156.35 :w 89 :h 11]))))
           ([MAGIC :tag TD :x 1371.5 :y 4132.7 :w 242.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10039 :class (navFooterDescSpacer)]))
          ([MAGIC :tag TR :x 114 :y 4167.7 :w 1500 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y 4167.7 :w 244.9 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0 :id e10030]
            ([TEXT :x 234.45 :y 4239 :w 4 :h 15])))
          ([MAGIC :tag TR :x 114 :y 3921.875 :w 1500 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y 3921.875 :w 244.9 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10031 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 358.9 :y 3921.875 :w 102.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 367.15 :y 4183.6 :w 70 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 367.15 :y (/ 62939 15) :w 68 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 367.15 :y (/ 62939 15) :w 55 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 367.15 :y (/ 63104 15) :w 68 :h 11]))))
           ([MAGIC :tag TD :x 461.4 :y 3921.875 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10280 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 5971 12) :y 3921.875 :w 118.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 3035 6) :y 4183.6 :w 73 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 3035 6) :y (/ 62939 15) :w 101 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 3035 6) :y (/ 62939 15) :w 79 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 3035 6) :y (/ 63104 15) :w 101 :h 11]))))
           ([MAGIC :tag TD :x (/ 7393 12) :y 3921.875 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10281 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 9784 15) :y 3921.875 :w 127.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 19815 30) :y 4183.6 :w 111 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 19815 30) :y (/ 62939 15) :w 95 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 19815 30) :y (/ 62939 15) :w 74 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 19815 30) :y (/ 63104 15) :w 95 :h 11]))))
           ([MAGIC :tag TD :x (/ 23393 30) :y 3921.875 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10282 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 815.95 :y 3921.875 :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 824.2 :y 4183.6 :w 36 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 824.2 :y (/ 62939 15) :w 58 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 824.2 :y (/ 62939 15) :w 47 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 824.2 :y (/ 63104 15) :w 58 :h 11]))))
           ([MAGIC :tag TD :x 930.45 :y 3921.875 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10283 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 28999 30) :y 3921.875 :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 974.9 :y 4183.6 :w 73 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 974.9 :y (/ 62939 15) :w 74 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 974.9 :y (/ 62939 15) :w 74 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 974.9 :y (/ 63104 15) :w 45 :h 11]))))
           ([MAGIC :tag TD :x (/ 16217 15) :y 3921.875 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10284 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1117.3 :y 3921.875 :w 106.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 33767 30) :y 4183.6 :w 79 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 33767 30) :y (/ 62939 15) :w 90 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 33767 30) :y (/ 62939 15) :w 75 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 33767 30) :y (/ 63104 15) :w 90 :h 11]))))
           ([MAGIC :tag TD :x (/ 14686 12) :y 3921.875 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10285 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1260 :y 3921.875 :w 111.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 1268.25 :y 4183.6 :w 48 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 1268.25 :y (/ 62939 15) :w 91 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 1268.25 :y (/ 62939 15) :w 80 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 1268.25 :y (/ 63104 15) :w 91 :h 11]))))
           ([MAGIC :tag TD :x 1371.5 :y 3921.875 :w 242.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10040 :class (navFooterDescSpacer)]))
          ([MAGIC :tag TR :x 114 :y (/ 63274 15) :w 1500 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y (/ 63274 15) :w 244.9 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0 :id e10032]
            ([TEXT :x 234.45 :y (/ 126557 30) :w 4 :h 15])))
          ([MAGIC :tag TR :x 114 :y (/ 63508 15) :w 1500 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y (/ 63508 15) :w 244.9 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10033 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 358.9 :y (/ 63508 15) :w 102.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 367.15 :y (/ 50810 12) :w 56 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 367.15 :y (/ 127395 30) :w 69 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 367.15 :y (/ 127395 30) :w 63 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 367.15 :y (/ 127725 30) :w 69 :h 11]))))
           ([MAGIC :tag TD :x 461.4 :y (/ 63508 15) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10286 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 5971 12) :y (/ 63508 15) :w 118.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 3035 6) :y (/ 50810 12) :w 63 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 3035 6) :y (/ 127395 30) :w 102 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 3035 6) :y (/ 127395 30) :w 102 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 3035 6) :y (/ 127725 30) :w 52 :h 11]))))
           ([MAGIC :tag TD :x (/ 7393 12) :y (/ 63508 15) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10287 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 9784 15) :y (/ 63508 15) :w 127.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 19815 30) :y (/ 50810 12) :w 60 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 19815 30) :y (/ 127395 30) :w 65 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 19815 30) :y (/ 127395 30) :w 50 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 19815 30) :y (/ 127725 30) :w 65 :h 11]))))
           ([MAGIC :tag TD :x (/ 23393 30) :y (/ 63508 15) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10288 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 815.95 :y (/ 63508 15) :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 824.2 :y (/ 50810 12) :w 50 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 824.2 :y (/ 127395 30) :w 60 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 824.2 :y (/ 127395 30) :w 31 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 824.2 :y (/ 127725 30) :w 60 :h 11]))))
           ([MAGIC :tag TD :x 930.45 :y (/ 63508 15) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10289 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 28999 30) :y (/ 63508 15) :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 974.9 :y (/ 50810 12) :w 49 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 974.9 :y (/ 127395 30) :w 71 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 974.9 :y (/ 127395 30) :w 71 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 974.9 :y (/ 127725 30) :w 37 :h 11]))))
           ([MAGIC :tag TD :x (/ 16217 15) :y (/ 63508 15) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10290 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1117.3 :y (/ 63508 15) :w 106.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 33767 30) :y (/ 50810 12) :w 30 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 33767 30) :y (/ 127395 30) :w 79 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 33767 30) :y (/ 127395 30) :w 79 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 33767 30) :y (/ 127725 30) :w 47 :h 11]))))
           ([MAGIC :tag TD :x (/ 14686 12) :y (/ 63508 15) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10291 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1260 :y (/ 63508 15) :w 111.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 1268.25 :y (/ 50810 12) :w 54 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 1268.25 :y (/ 127395 30) :w 95 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 1268.25 :y (/ 127395 30) :w 60 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 1268.25 :y (/ 127725 30) :w 95 :h 11]))))
           ([MAGIC :tag TD :x 1371.5 :y (/ 63508 15) :w 242.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10041 :class (navFooterDescSpacer)]))
          ([MAGIC :tag TR :x 114 :y 4268.85 :w 1500 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y 4268.85 :w 244.9 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0 :id e10034]
            ([TEXT :x 234.45 :y 4269.15 :w 4 :h 15])))
          ([MAGIC :tag TR :x 114 :y 4284.45 :w 1500 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y 4284.45 :w 244.9 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10035 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 358.9 :y 4284.45 :w 102.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 367.15 :y (/ 128543 30) :w 23 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 367.15 :y 4297.1 :w 60 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 367.15 :y 4297.1 :w 53 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 367.15 :y 4308.1 :w 60 :h 11]))))
           ([MAGIC :tag TD :x 461.4 :y 4284.45 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10292 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 5971 12) :y 4284.45 :w 118.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 3035 6) :y (/ 128543 30) :w 60 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 3035 6) :y 4297.1 :w 60 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 3035 6) :y 4297.1 :w 60 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 3035 6) :y 4308.1 :w 36 :h 11]))))
           ([MAGIC :tag TD :x (/ 7393 12) :y 4284.45 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10293 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 9784 15) :y 4284.45 :w 127.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 19815 30) :y (/ 128543 30) :w 111 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 19815 30) :y 4297.1 :w 111 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 19815 30) :y 4297.1 :w 111 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 19815 30) :y 4308.1 :w 52 :h 11]))))
           ([MAGIC :tag TD :x (/ 23393 30) :y 4284.45 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10294 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 815.95 :y 4284.45 :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 824.2 :y (/ 128543 30) :w 46 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 824.2 :y 4297.1 :w 65 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 824.2 :y 4297.1 :w 65 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 824.2 :y 4308.1 :w 39 :h 11]))))
           ([MAGIC :tag TD :x 930.45 :y 4284.45 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10295 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 28999 30) :y 4284.45 :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 974.9 :y (/ 128543 30) :w 46 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 974.9 :y 4297.1 :w 73 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 974.9 :y 4297.1 :w 73 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 974.9 :y 4308.1 :w 70 :h 11]))))
           ([MAGIC :tag TD :x (/ 16217 15) :y 4284.45 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10296 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1117.3 :y 4284.45 :w 106.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 33767 30) :y (/ 128543 30) :w 43 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 33767 30) :y 4297.1 :w 72 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 33767 30) :y 4297.1 :w 41 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 33767 30) :y 4308.1 :w 72 :h 11]))))
           ([MAGIC :tag TD :x (/ 14686 12) :y 4284.45 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10297 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1260 :y 4284.45 :w 111.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 1268.25 :y (/ 128543 30) :w 48 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 1268.25 :y 4297.1 :w 80 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 1268.25 :y 4297.1 :w 80 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 1268.25 :y 4308.1 :w 77 :h 11]))))
           ([MAGIC :tag TD :x 1371.5 :y 4284.45 :w 242.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10042 :class (navFooterDescSpacer)]))
          ([MAGIC :tag TR :x 114 :y (/ 129583 30) :w 1500 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y (/ 129583 30) :w 244.9 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0 :id e10036]
            ([TEXT :x 234.45 :y (/ 64796 15) :w 4 :h 15])))
          ([MAGIC :tag TR :x 114 :y (/ 130051 30) :w 1500 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y (/ 130051 30) :w 244.9 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10037 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 358.9 :y (/ 130051 30) :w 102.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10049 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 367.15 :y 4335.35 :w 69 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 367.15 :y 4347.7 :w 86 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 367.15 :y 4347.7 :w 70 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 367.15 :y 4358.7 :w 86 :h 11]))))
           ([MAGIC :tag TD :x 461.4 :y (/ 130051 30) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10050 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 5971 12) :y (/ 130051 30) :w 118.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10051 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 3035 6) :y 4335.35 :w 77 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 3035 6) :y 4347.7 :w 85 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 3035 6) :y 4347.7 :w 50 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 3035 6) :y 4358.7 :w 85 :h 11]))))
           ([MAGIC :tag TD :x (/ 7393 12) :y (/ 130051 30) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10052 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 9784 15) :y (/ 130051 30) :w 127.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10053 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 19815 30) :y 4335.35 :w 45 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 19815 30) :y 4347.7 :w 58 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 19815 30) :y 4347.7 :w 50 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 19815 30) :y 4358.7 :w 58 :h 11]))))
           ([MAGIC :tag TD :x (/ 23393 30) :y (/ 130051 30) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10054 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 815.95 :y (/ 130051 30) :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10055 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 824.2 :y 4335.35 :w 86 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 824.2 :y 4347.7 :w 47 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 824.2 :y 4347.7 :w 47 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 824.2 :y 4358.7 :w 45 :h 11]))))
           ([MAGIC :tag TD :x 930.45 :y (/ 130051 30) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10056 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 28999 30) :y (/ 130051 30) :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10057 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 974.9 :y 4335.35 :w 27 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 974.9 :y 4347.7 :w 66 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 974.9 :y 4347.7 :w 66 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 974.9 :y 4358.7 :w 62 :h 11]))))
           ([MAGIC :tag TD :x (/ 16217 15) :y (/ 130051 30) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10058 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1117.3 :y (/ 130051 30) :w 106.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10059 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 33767 30) :y 4335.35 :w 48 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 33767 30) :y 4347.7 :w 82 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 33767 30) :y 4347.7 :w 71 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 33767 30) :y 4358.7 :w 82 :h 11]))))
           ([MAGIC :tag TD :x (/ 14686 12) :y (/ 130051 30) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10060 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1260 :y (/ 130051 30) :w 111.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10061 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 1268.25 :y 4335.35 :w 37 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 1268.25 :y 4347.7 :w 40 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 1268.25 :y 4347.7 :w 39 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 1268.25 :y 4358.7 :w 40 :h 11]))))
           ([MAGIC :tag TD :x 1371.5 :y (/ 130051 30) :w 242.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10043 :class (navFooterDescSpacer)])))))
       ([BLOCK :tag DIV :x 122 :y 4384 :w 1484 :h 18 :class (navFooterLine navFooterLinkLine navFooterPadItemLine)]
        ([MAGIC :tag UL :x 607.2 :y 4384 :w 513.6 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :id e10082]
         ([INLINE :tag LI :class (nav_first)]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 613.8 :y 4387 :w 85 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 712 :y 4387 :w 69 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 794.2 :y 4387 :w 94 :h 12])))
         ([INLINE :tag LI :class (nav_last)]
          ([TEXT :x 894.8 :y 4387 :w 226 :h 12])))))
      ([BLOCK :tag DIV :x -1000000 :y -1000000 :w 1 :h 1 :id sis_pixel_r2]
       ([LINE]
        ([INLINE :tag IFRAME :id DAsis])))
      ([BLOCK :tag DIV :x 114 :y 4417 :w 1500 :h 0 :id SponsoredLinksGateway])))
    ([BLOCK :tag DIV :x 0 :y 4567 :w 0 :h 0 :id a-popover-root])
    ([BLOCK :tag DIV :x 0 :y 4567 :w 0 :h 0 :id a-popover-root]))))

(define-problem doc-1
  "Amazon.com: Online Shopping for Electronics, Apparel, Computers, Books, DVDs & more"
  #:url "file:///home/pavpan/cassius/bench/alexa/amazon.html"
  #:header header
  #:sheet doc-1
  #:documents doc-1
  #:features (position overflow-x overflow-y em min-width box-sizing % float unknown-selector clear white-space min-height max-height max-width direction s ms px auto rem inline-block unknown-display tables list-item))


(define-document (doc-1 #:width (between 800 1920) #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 1728 :h 4567 :class (a-transition a-transform a-opacity a-border-image a-border-radius a-box-shadow a-text-shadow a-touch-scrolling a-local-storage a-textarea-placeholder a-input-placeholder a-autofocus a-webworker a-history a-geolocation a-drag-drop a-svg a-canvas a-video a-audio a-js a-ws a-audio a-video a-canvas a-svg a-drag-drop a-geolocation a-history a-webworker a-autofocus a-input-placeholder a-textarea-placeholder a-local-storage a-touch-scrolling a-text-shadow a-box-shadow a-border-radius a-border-image a-opacity a-transform a-transition)]
   ([BLOCK :tag BODY :x 0 :y 0 :w 1728 :h 4417 :class (a-auix_ux_57388-t1 a-aui_49697-c a-aui_51744-c a-aui_57326-c a-aui_58736-c a-aui_accessibility_49860-c a-aui_attr_validations_1_51371-c a-aui_bolt_62845-c a-aui_ux_47524-t1 a-aui_ux_49594-c a-aui_ux_52290-c a-aui_ux_56217-c a-aui_ux_59374-c a-aui_ux_59797-c a-aui_ux_60000-c a-meter-animate)]
    ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 4417 :id a-page]
     ([ANON]
      ([LINE]
       ([INLINE :tag A])))
     ([BLOCK :tag DIV :x 0 :y -500 :w 1 :h 1 :id e10092]
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -498 :w 20 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -479 :w 26 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -460 :w 46 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -441 :w 46 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -422 :w 18 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -403 :w 39 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -384 :w 36 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -365 :w 56 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -346 :w 44 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -327 :w 11 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -308 :w 41 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -289 :w 56 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -270 :w 64 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -251 :w 21 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -232 :w 23 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -213 :w 52 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -194 :w 46 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -175 :w 11 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -156 :w 44 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -137 :w 25 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -118 :w 67 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -99 :w 40 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -80 :w 32 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -61 :w 21 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -42 :w 20 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -23 :w 11 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y -4 :w 14 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y 15 :w 11 :h 15])))
      ([LINE]
       ([INLINE :tag A]
        ([TEXT :x 0 :y 34 :w 155 :h 15]))))
     ([ANON]
      ([LINE]
       ([INLINE :tag A :id nav-top])))
     ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 55 :id nav-upnav]
      ([BLOCK :tag A :x 0 :y 0 :w 1728 :h 55 :class (nav-a)]
       ([BLOCK :tag SPAN :x 0 :y -10000 :w 1 :h 1 :class (nav-spanAltText)]
        ([LINE]
         ([TEXT :x 0 :y -9998 :w 50 :h 15]))
        ([LINE]
         ([TEXT :x 0 :y -9979 :w 39 :h 15]))
        ([LINE]
         ([TEXT :x 0 :y -9960 :w 46 :h 15]))
        ([LINE]
         ([TEXT :x 0 :y -9941 :w 27 :h 15])))))
     ([BLOCK :tag HEADER :x 0 :y 55 :w 1728 :h 99 :class (nav-locale-us nav-lang-en nav-rec nav-xshop-small)]
      ([BLOCK :tag DIV :x 0 :y 55 :w 1728 :h 99 :id navbar :class (nav-sprite-v1 nav-bluebeacon)]
       ([BLOCK :tag DIV :x 0 :y 55 :w 1728 :h 39 :id nav-belt]
        ([BLOCK :tag DIV :x 0 :y 55 :w 192 :h 39 :class (nav-left)]
         ([BLOCK :tag DIV :x 0 :y 55 :w 192 :h 39 :id nav-logo :class (nav-prime-1)]
          ([MAGIC :tag A :x 27 :y 68 :w 96 :h 29 :mt 0 :mr 0 :mb 0 :ml 0 :class (nav-logo-link)]
           ([BLOCK :tag SPAN :x 27 :y 68 :w 96 :h 29 :class (nav-logo-base nav-sprite)]
            ([LINE]
             ([TEXT :x -473 :y 60 :w 50 :h 16]))))
          ([BLOCK :tag A :x 92 :y 87 :w 39 :h 10 :class (nav-logo-tagline nav-sprite)])))
        ([BLOCK :tag DIV :x 1328 :y 55 :w 400 :h 39 :class (nav-right)]
         ([BLOCK :tag DIV :x 1328 :y 64 :w 400 :h 39 :id navSwmHoliday]
          ([BLOCK :tag A :x 1328 :y 64 :w 400 :h 39 :class (nav-imageHref)]))
         ([ANON]
          ([LINE]
           ([INLINE :tag DIV :id nav-swmslot]))))
        ([BLOCK :tag DIV :x 0 :y 55 :w 1728 :h 39 :class (nav-fill)]
         ([BLOCK :tag DIV :x 192 :y 55 :w 1136 :h 46 :id nav-search]
          ([BLOCK :tag DIV :x 192 :y 66 :w 1111 :h 0 :id nav-bar-left])
          ([BLOCK :tag FORM :x 192 :y 66 :w 1111 :h 35 :class (nav-searchbar)]
           ([BLOCK :tag DIV :x 192 :y 66 :w 46 :h 35 :class (nav-left)]
            ([BLOCK :tag DIV :x 192 :y 66 :w 46 :h 35 :class (nav-search-scope nav-sprite)]
             ([BLOCK :tag DIV :x 198 :y 68 :w 39 :h 33 :class (nav-search-facade)]
              ([BLOCK :tag SPAN :x 203 :y 68 :w 13 :h 33 :class (nav-search-label)]
               ([LINE]
                ([TEXT :x 203 :y 77.5 :w 13 :h 14])))
              ([BLOCK :tag I :x 221 :y 82 :w 8 :h 4 :class (nav-icon)]))
             ([BLOCK :tag SELECT :x 193 :y 66 :w 192 :h 35 :id searchDropdownBox :class (nav-search-dropdown searchSelect)]
              ([BLOCK :tag OPTION :x 195 :y 102 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 102 :w 100 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 118 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 118 :w 90 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 134 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 134 :w 69 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 150 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 150 :w 94 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 166 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 166 :w 133 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 182 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 182 :w 70 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 198 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 198 :w 32 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 214 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 214 :w 44 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 230 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 230 :w 39 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 246 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 246 :w 74 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 262 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 262 :w 169 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 278 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 278 :w 163 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 294 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 294 :w 60 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 310 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 310 :w 39 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 326 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 326 :w 41 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 342 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 342 :w 43 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 358 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 358 :w 44 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 374 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 374 :w 139 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 390 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 390 :w 69 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 406 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 406 :w 167 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 422 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 422 :w 79 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 438 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 438 :w 69 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 454 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 454 :w 64 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 470 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 470 :w 160 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 486 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 486 :w 68 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 502 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 502 :w 148 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 518 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 518 :w 100 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 534 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 534 :w 94 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 550 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 550 :w 130 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 566 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 566 :w 77 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 582 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 582 :w 148 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 598 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 598 :w 90 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 614 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 614 :w 149 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 630 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 630 :w 79 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 646 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 646 :w 124 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 662 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 662 :w 97 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 678 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 678 :w 138 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 694 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 694 :w 79 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 710 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 710 :w 81 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 726 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 726 :w 55 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 742 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 742 :w 117 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 758 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 758 :w 171 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 774 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 774 :w 91 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 790 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 790 :w 85 :h 16])))
              ([BLOCK :tag OPTION :x 195 :y 806 :w 179 :h 16]
               ([LINE]
                ([TEXT :x 198 :y 806 :w 32 :h 16]))))))
           ([BLOCK :tag DIV :x 1258 :y 66 :w 45 :h 35 :class (nav-right)]
            ([BLOCK :tag DIV :x 1258 :y 66 :w 45 :h 35 :class (nav-search-submit nav-sprite)]
             ([BLOCK :tag SPAN :x 1270 :y 73 :w 21 :h 21 :id nav-search-submit-text :class (nav-search-submit-text nav-sprite)]
              ([LINE]
               ([TEXT :x 1021.5 :y 72 :w 18 :h 15])))
             ([BLOCK :tag INPUT :x 1258 :y 66 :w 45 :h 35 :class (nav-input)])))
           ([BLOCK :tag DIV :x 238 :y 66 :w 1020 :h 35 :class (nav-fill)]
            ([BLOCK :tag DIV :x 238 :y 66 :w 1020 :h 35 :class (nav-search-field)]
             ([BLOCK :tag INPUT :x 238 :y 66 :w 1020 :h 33 :id twotabsearchtextbox :class (nav-input)]))
            ([BLOCK :tag DIV :x 238 :y 101 :w 1020 :h 0 :id nav-iss-attach])))))
        ([BLOCK :tag DIV :x 0 :y 94 :w 1728 :h 0 :id nav-flyout-iss-anchor])
        ([BLOCK :tag DIV :x 0 :y 94 :w 1728 :h 0 :id nav-flyout-anchor])
        ([BLOCK :tag DIV :x 0 :y 94 :w 1728 :h 0 :id nav-flyout-iss-anchor])
        ([BLOCK :tag DIV :x 0 :y 94 :w 1728 :h 0 :id nav-flyout-anchor]))
       ([BLOCK :tag DIV :x 0 :y 94 :w 1728 :h 60 :id nav-main :class (nav-sprite)]
        ([BLOCK :tag DIV :x 0 :y 99 :w 192 :h 55 :class (nav-left)]
         ([BLOCK :tag DIV :x 0 :y 101 :w 192 :h 50 :id nav-shop]
          ([BLOCK :tag A :x 16 :y 108 :w 116 :h 44 :id nav-link-shopall :class (nav-a nav-a-2)]
           ([MAGIC :tag SPAN :x 26 :y 117 :w 55 :h 14 :mt 9 :mr 0 :mb 0 :ml 0 :class (nav-line-1)]
            ([TEXT :x 26 :y 117 :w 44 :h 14]))
           ([MAGIC :tag SPAN :x 26 :y 131 :w 106 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (nav-line-2)]
            ([TEXT :x 26 :y 130.5 :w 82 :h 16])
            ([MAGIC :tag SPAN :x 113 :y 137.5 :w 8 :h 4 :mt 0 :mr 0 :mb 2 :ml 5 :id e10095 :class (nav-icon nav-arrow)])))))
        ([BLOCK :tag DIV :x 1307 :y 99 :w 421 :h 55 :class (nav-right)]
         ([BLOCK :tag DIV :x 1307 :y 101 :w 421 :h 50 :id nav-tools]
          ([BLOCK :tag A :x 1340 :y 108 :w 128 :h 44 :id nav-link-yourAccount :class (nav-a nav-a-2 nav-truncate)]
           ([MAGIC :tag SPAN :x 1340 :y 117 :w 128 :h 14 :mt 1 :mr 0 :mb 0 :ml 0 :class (nav-line-1)]
            ([TEXT :x 1350 :y 117 :w 65 :h 14]))
           ([MAGIC :tag SPAN :x 1350 :y 108 :w 118 :h 43 :mt 0 :mr 0 :mb 0 :ml 0 :class (nav-line-2)]
            ([TEXT :x 1350 :y 130.5 :w 94 :h 16])
            ([MAGIC :tag SPAN :x 1449 :y 137.5 :w 8 :h 4 :mt 0 :mr 0 :mb 2 :ml 5 :id e10096 :class (nav-icon nav-arrow)])))
          ([BLOCK :tag A :x -8693 :y 107 :w 1 :h 1 :class (nav-hidden-aria)]
           ([LINE]
            ([TEXT :x -8693 :y 106 :w 19 :h 14]))
           ([LINE]
            ([TEXT :x -8693 :y 118 :w 37 :h 14]))
           ([LINE]
            ([TEXT :x -8693 :y 130 :w 25 :h 14]))
           ([LINE]
            ([TEXT :x -8693 :y 142 :w 19 :h 14])))
          ([BLOCK :tag A :x 1470 :y 108 :w 74 :h 44 :id nav-link-prime :class (nav-a nav-a-2)]
           ([MAGIC :tag SPAN :x 1480 :y 117 :w 35 :h 14 :mt 9 :mr 0 :mb 0 :ml 0 :class (nav-line-1)]
            ([TEXT :x 1480 :y 117 :w 24 :h 14]))
           ([MAGIC :tag SPAN :x 1480 :y 131 :w 64 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (nav-line-2)]
            ([TEXT :x 1480 :y 130.5 :w 40 :h 16])
            ([MAGIC :tag SPAN :x 1525 :y 137.5 :w 8 :h 4 :mt 0 :mr 0 :mb 2 :ml 5 :id e10097 :class (nav-icon nav-arrow)])))
          ([BLOCK :tag A :x 1546 :y 108 :w 67 :h 44 :id nav-link-wishlist :class (nav-a nav-a-2)]
           ([MAGIC :tag SPAN :x 1556 :y 117 :w 35 :h 14 :mt 9 :mr 0 :mb 0 :ml 0 :class (nav-line-1)]
            ([TEXT :x 1556 :y 117 :w 24 :h 14]))
           ([MAGIC :tag SPAN :x 1556 :y 131 :w 57 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (nav-line-2)]
            ([TEXT :x 1556 :y 130.5 :w 33 :h 16])
            ([MAGIC :tag SPAN :x 1594 :y 137.5 :w 8 :h 4 :mt 0 :mr 0 :mb 2 :ml 5 :id e10098 :class (nav-icon nav-arrow)])))
          ([BLOCK :tag A :x 1615 :y 108 :w 105 :h 44 :id nav-cart :class (nav-a nav-a-2)]
           ([MAGIC :tag SPAN :x 1667 :y 117 :w 11 :h 14 :mt 9 :mr 0 :mb 0 :ml 42 :class (nav-line-1)])
           ([MAGIC :tag SPAN :x 1667 :y 131 :w 53 :h 20 :mt 0 :mr 0 :mb 0 :ml 42 :class (nav-line-2)]
            ([TEXT :x 1667 :y 130.5 :w 29 :h 16])
            ([MAGIC :tag SPAN :x 1701 :y 137.5 :w 8 :h 4 :mt 0 :mr 0 :mb 2 :ml 5 :class (nav-icon nav-arrow)]))
           ([BLOCK :tag SPAN :x 1625 :y 119 :w 38 :h 26 :class (nav-cart-icon nav-sprite)])
           ([BLOCK :tag SPAN :x 1638 :y 115 :w 19 :h 16 :id nav-cart-count :class (nav-cart-count nav-cart-0)]
            ([LINE]
             ([TEXT :x 1643 :y 114.5 :w 9 :h 17]))))))
        ([BLOCK :tag DIV :x 192 :y 99 :w 1115 :h 55 :class (nav-fill)]
         ([BLOCK :tag DIV :x 192 :y 99 :w 529 :h 69 :id nav-xshop-container]
          ([BLOCK :tag DIV :x 192 :y 131 :w 529 :h 37 :id nav-xshop]
           ([BLOCK :tag A :x 192 :y 131 :w 122 :h 17 :id nav-recently-viewed :class (nav-a)]
            ([ANON]
             ([LINE]
              ([TEXT :x 192 :y 129.5 :w 99 :h 15])))
            ([MAGIC :tag SPAN :x 296 :y 135.5 :w 8 :h 4 :mt 0 :mr 0 :mb 2 :ml 5 :id e10099 :class (nav-icon nav-arrow)]))
           ([BLOCK :tag A :x 314 :y 131 :w 141 :h 12 :id nav-your-amazon :class (nav-a nav_a)]
            ([LINE]
             ([TEXT :x 324 :y 129.5 :w 121 :h 15])))
           ([BLOCK :tag A :x 455 :y 131 :w 100 :h 12 :class (nav-a)]
            ([LINE]
             ([TEXT :x 465 :y 129.5 :w 80 :h 15])))
           ([BLOCK :tag A :x 555 :y 131 :w 78 :h 12 :class (nav-a)]
            ([LINE]
             ([TEXT :x 565 :y 129.5 :w 58 :h 15])))
           ([BLOCK :tag A :x 633 :y 131 :w 42 :h 12 :class (nav-a)]
            ([LINE]
             ([TEXT :x 643 :y 129.5 :w 22 :h 15])))
           ([BLOCK :tag A :x 675 :y 131 :w 46 :h 12 :class (nav-a)]
            ([LINE]
             ([TEXT :x 685 :y 129.5 :w 26 :h 15])))))))))
     ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 4263 :id pageContent :class (a-section a-spacing-none)]
      ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :id e10100]
       ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :id gw-desktop-herotator :class (a-section a-spacing-none gw-desktop-herotator-ready)]
        ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :id e10101 :class (a-carousel-container a-carousel-display-single a-carousel-transition-slide gw-desktop-herotator a-carousel-initialized)]
         ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :class (a-row a-carousel-controls a-carousel-row)]
          ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :class (a-carousel-row-inner)]
           ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :class (a-carousel-col a-carousel-center)]
            ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :id anonCarousel1 :class (a-carousel-viewport)]
             ([BLOCK :tag OL :x -4386 :y 154 :w 9000 :h 300 :id e10075 :class (a-carousel)]
              ([MAGIC :tag LI :x -4386 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10102 :class (a-carousel-card)]
               ([BLOCK :tag DIV :x -4386 :y 154 :w 1500 :h 300 :id gw-ftGr-desktop-hero-kindle-A :class (gw-ftGr-desktop-hero)]
                ([BLOCK :tag DIV :x -4386 :y 154 :w 1500 :h 300 :class (gw-critical-content)]
                 ([BLOCK :tag DIV :x -4386 :y 154 :w 1500 :h 300 :id image-map-ns_174AMHZCNNZH083A2GQT_9165_ :class (shogun-widget image-map gateway-desktop-link)]
                  ([BLOCK :tag DIV :x -4386 :y 154 :w 1500 :h 300 :id e10103 :class (cropped-image-map-size)]
                   ([BLOCK :tag DIV :x -7386 :y 154 :w 7500 :h 300 :class (cropped-image-map-center-alignment)]
                    ([MAGIC :tag SPAN :x -4386 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10104]
                     ([MAGIC :tag A :x -4386 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                      ([INLINE :tag IMG :class (a-dynamic-image)])))))))))
              ([MAGIC :tag LI :x -2886 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10105 :class (a-carousel-card)]
               ([BLOCK :tag DIV :x -2886 :y 154 :w 1500 :h 300 :id gw-ftGr-desktop-hero-G :class (gw-ftGr-desktop-hero)]
                ([BLOCK :tag DIV :x -2886 :y 154 :w 1500 :h 300 :id image-map-ns_174AMHZCNNZH083A2GQT_9213_ :class (shogun-widget image-map gateway-desktop-link)]
                 ([BLOCK :tag DIV :x -2886 :y 154 :w 1500 :h 300 :id e10106 :class (cropped-image-map-size)]
                  ([BLOCK :tag DIV :x -5886 :y 154 :w 7500 :h 300 :class (cropped-image-map-center-alignment)]
                   ([MAGIC :tag SPAN :x -2886 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10107]
                    ([MAGIC :tag A :x -2886 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                     ([INLINE :tag IMG :class (a-dynamic-image)]))))))))
              ([MAGIC :tag LI :x -1386 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10108 :class (a-carousel-card)]
               ([BLOCK :tag DIV :x -1386 :y 154 :w 1500 :h 300 :id gw-ftGr-desktop-hero-softlines :class (gw-ftGr-desktop-hero)]
                ([BLOCK :tag DIV :x -1386 :y 154 :w 1500 :h 300 :id image-map-ns_174AMHZCNNZH083A2GQT_9214_ :class (shogun-widget image-map gateway-desktop-map)]
                 ([BLOCK :tag DIV :x -1386 :y 154 :w 1500 :h 300 :id e10109 :class (cropped-image-map-size)]
                  ([BLOCK :tag DIV :x -4386 :y 154 :w 7500 :h 300 :class (cropped-image-map-center-alignment)]
                   ([ANON]
                    ([LINE]
                     ([INLINE :tag MAP])))
                   ([MAGIC :tag SPAN :x -1386 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10110]
                    ([INLINE :tag IMG :class (a-dynamic-image)])))))))
              ([MAGIC :tag LI :x 114 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10111 :class (a-carousel-card)]
               ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :id gw-ftGr-desktop-hero-piv :class (gw-ftGr-desktop-hero)]
                ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :id image-map-ns_174AMHZCNNZH083A2GQT_9215_ :class (shogun-widget image-map gateway-desktop-map)]
                 ([BLOCK :tag DIV :x 114 :y 154 :w 1500 :h 300 :id e10112 :class (cropped-image-map-size)]
                  ([BLOCK :tag DIV :x -2886 :y 154 :w 7500 :h 300 :class (cropped-image-map-center-alignment)]
                   ([ANON]
                    ([LINE]
                     ([INLINE :tag MAP])))
                   ([MAGIC :tag SPAN :x 114 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10113]
                    ([INLINE :tag IMG :class (a-dynamic-image)])))))))
              ([MAGIC :tag LI :x 1614 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10114 :class (a-carousel-card)]
               ([BLOCK :tag DIV :x 1614 :y 154 :w 1500 :h 300 :id gw-ftGr-desktop-hero-kindle-B :class (gw-ftGr-desktop-hero)]
                ([BLOCK :tag DIV :x 1614 :y 154 :w 1500 :h 300 :id image-map-ns_174AMHZCNNZH083A2GQT_9216_ :class (shogun-widget image-map gateway-desktop-map)]
                 ([BLOCK :tag DIV :x 1614 :y 154 :w 1500 :h 300 :id e10115 :class (cropped-image-map-size)]
                  ([BLOCK :tag DIV :x -1386 :y 154 :w 7500 :h 300 :class (cropped-image-map-center-alignment)]
                   ([ANON]
                    ([LINE]
                     ([INLINE :tag MAP])))
                   ([MAGIC :tag SPAN :x 1614 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10116]
                    ([INLINE :tag IMG :class (a-dynamic-image)])))))))
              ([MAGIC :tag LI :x 3114 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10117 :class (a-carousel-card)]
               ([BLOCK :tag DIV :x 3114 :y 154 :w 1500 :h 300 :id gw-ftGr-desktop-hero-prime :class (gw-ftGr-desktop-hero)]
                ([BLOCK :tag DIV :x 3114 :y 154 :w 1500 :h 300 :id image-map-ns_174AMHZCNNZH083A2GQT_9217_ :class (shogun-widget image-map gateway-desktop-link)]
                 ([BLOCK :tag DIV :x 3114 :y 154 :w 1500 :h 300 :id e10118 :class (cropped-image-map-size)]
                  ([BLOCK :tag DIV :x 114 :y 154 :w 7500 :h 300 :class (cropped-image-map-center-alignment)]
                   ([MAGIC :tag SPAN :x 3114 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :id e10119]
                    ([MAGIC :tag A :x 3114 :y 154 :w 1500 :h 300 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                     ([INLINE :tag IMG :class (a-dynamic-image)]))))))))))))))
        ([BLOCK :tag DIV :x 114 :y 454 :w 1500 :h 0 :id gw-desktop-herotator-controls]
         ([BLOCK :tag OL :x 798 :y 430 :w 132 :h 0 :id e10076]
          ([BLOCK :tag LI :x 798 :y 430 :w 22 :h 13]
           ([BLOCK :tag A :x 803 :y 430 :w 12 :h 13 :class (herotator-goToPage-1 gw-icon)]
            ([BLOCK :tag SPAN :x -9202 :y -9570 :w 179 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9202 :y -9568 :w 179 :h 15])))))
          ([BLOCK :tag LI :x 820 :y 430 :w 22 :h 13]
           ([BLOCK :tag A :x 825 :y 430 :w 12 :h 13 :class (herotator-goToPage-2 gw-icon)]
            ([BLOCK :tag SPAN :x -9202 :y -9570 :w 346 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9202 :y -9568 :w 346 :h 15])))))
          ([BLOCK :tag LI :x 842 :y 430 :w 22 :h 13]
           ([BLOCK :tag A :x 847 :y 430 :w 12 :h 13 :class (herotator-goToPage-3 gw-icon)]
            ([BLOCK :tag SPAN :x -9202 :y -9570 :w 129 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9202 :y -9568 :w 129 :h 15])))))
          ([BLOCK :tag LI :x 864 :y 430 :w 22 :h 13]
           ([BLOCK :tag A :x 869 :y 430 :w 12 :h 13 :class (herotator-goToPage-4 gw-icon active)]
            ([BLOCK :tag SPAN :x -9202 :y -9570 :w 218 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9202 :y -9568 :w 218 :h 15])))))
          ([BLOCK :tag LI :x 886 :y 430 :w 22 :h 13]
           ([BLOCK :tag A :x 891 :y 430 :w 12 :h 13 :class (herotator-goToPage-5 gw-icon)]
            ([BLOCK :tag SPAN :x -9202 :y -9570 :w 128 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9202 :y -9568 :w 128 :h 15])))))
          ([BLOCK :tag LI :x 908 :y 430 :w 22 :h 13]
           ([BLOCK :tag A :x 913 :y 430 :w 12 :h 13 :class (herotator-goToPage-6 gw-icon)]
            ([BLOCK :tag SPAN :x -9202 :y -9570 :w 140 :h 19 :class (gw-text)]
             ([LINE]
              ([TEXT :x -9202 :y -9568 :w 140 :h 15])))))))))
      ([BLOCK :tag DIV :x 114 :y 454 :w 1500 :h 0 :class (a-section a-spacing-none gw-hud-t2)])
      ([BLOCK :tag DIV :x 114 :y 454 :w 1500 :h 3051 :id gw-content-grid :class (a-fixed-right-flipped-grid)]
       ([BLOCK :tag DIV :x 114 :y 454 :w 1500 :h 3051 :class (a-fixed-right-grid-inner)]
        ([BLOCK :tag DIV :x 114 :y 454 :w 1500 :h 3051 :id e10016 :class (a-section a-spacing-medium)]
         ([BLOCK :tag DIV :x 1304 :y 454 :w 310 :h 713 :id sidebar :class (a-fixed-right-grid-col a-col-right)]
          ([BLOCK :tag DIV :x 1309 :y 464 :w 300 :h 275 :id desktop-ad-atf :class (displayAd)]
           ([BLOCK :tag DIV :x 1309 :y 469 :w 300 :h 270 :id DAr2 :class (copilot-secure-display celwidget  text/x-dacx-safeframe)]
            ([LINE]
             ([INLINE :tag IFRAME]))))
          ([BLOCK :tag HR :x 1327 :y 739 :w 264 :h 1 :class (slot-hr desktop-ad-atf-hr)])
          ([BLOCK :tag DIV :x 1327 :y 755 :w 264 :h 170 :id desktop-sidekick-1 :class (sidekick)]
           ([BLOCK :tag DIV :x 1327 :y 755 :w 264 :h 170 :id image-map-ns_0FB0Y1W1RM43J12P8FYX_3495_ :class (shogun-widget image-map gateway-desktop-link)]
            ([BLOCK :tag DIV :x 1327 :y 755 :w 264 :h 170 :id e10120 :class (cropped-image-map-size)]
             ([BLOCK :tag DIV :x 799 :y 755 :w 1320 :h 170 :class (cropped-image-map-center-alignment)]
              ([MAGIC :tag SPAN :x 1327 :y 755 :w 264 :h 170 :mt 0 :mr 0 :mb 0 :ml 0 :id e10121]
               ([MAGIC :tag A :x 1327 :y 755 :w 264 :h 170 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                ([INLINE :tag IMG :class (a-dynamic-image)])))))))
          ([BLOCK :tag HR :x 1327 :y 940 :w 264 :h 1 :class (slot-hr desktop-sidekick-1-hr)])
          ([BLOCK :tag DIV :x 1327 :y 956 :w 264 :h 170 :id desktop-sidekick-2 :class (sidekick)]
           ([BLOCK :tag DIV :x 1327 :y 956 :w 264 :h 170 :id image-map-ns_06PA60SNBQCA5EKS162J_70_ :class (shogun-widget image-map gateway-desktop-link)]
            ([BLOCK :tag DIV :x 1327 :y 956 :w 264 :h 170 :id e10122 :class (cropped-image-map-size)]
             ([BLOCK :tag DIV :x 799 :y 956 :w 1320 :h 170 :class (cropped-image-map-center-alignment)]
              ([MAGIC :tag SPAN :x 1327 :y 956 :w 264 :h 170 :mt 0 :mr 0 :mb 0 :ml 0 :id e10123]
               ([MAGIC :tag A :x 1327 :y 956 :w 264 :h 170 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                ([INLINE :tag IMG :class (a-dynamic-image)])))))))
          ([BLOCK :tag HR :x 1327 :y 1141 :w 264 :h 1 :class (slot-hr desktop-sidekick-2-hr)])
          ([BLOCK :tag DIV :x 1327 :y 1157 :w 264 :h 0 :id sidebarbtf]))
         ([BLOCK :tag DIV :x 114 :y 454 :w 1190 :h 3051 :id mainContent :class (a-fixed-right-grid-col a-col-left)]
          ([BLOCK :tag DIV :x 114 :y 454 :w 1190 :h 3051 :id btfContent]
           ([BLOCK :tag DIV :x 134 :y 459 :w 1150 :h 285 :id desktop-top :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 459 :w 1150 :h 285 :id image-shoveler-ns_0ANDZDV8FN2SGYFAR20J_9009_ :class (a-section a-spacing-none shogun-widget image-shoveler aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 479 :w 1110 :h 35 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 479 :w 443 :h 31.5 :class (as-title-block-left)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 483.25 :w 443 :h 23]))))
              ([BLOCK :tag SPAN :x 597 :y 479 :w 59 :h 35 :class (as-title-block-right)]
               ([LINE]
                ([INLINE :tag A :class (a-link-normal)]
                 ([TEXT :x 612 :y 488.5 :w 44 :h 16])))))
             ([BLOCK :tag DIV :x 154 :y 514 :w 1110 :h 220 :id e10017 :class (a-section feed-carousel first-carousel)]
              ([BLOCK :tag DIV :x 154 :y 514 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 514 :w 2790 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10124 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 434 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10125 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 714 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10126 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 994 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10127 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10128 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10129 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10130 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10131 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 514 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10132 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10083 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y 514 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([INLINE :tag A :class (a-link-normal)]
                   ([INLINE :tag IMG :class (product-image)]))))))
              ([BLOCK :tag A :x 154 :y 569 :w 45 :h 100 :class (feed-carousel-control feed-left feed-control-disabled)]
               ([MAGIC :tag SPAN :x 167.5 :y 608 :w 13 :h 22 :mt -11 :mr 0 :mb 0 :ml 0 :class (gw-icon feed-arrow)]))
              ([BLOCK :tag A :x 1219 :y 569 :w 45 :h 100 :class (feed-carousel-control feed-right)]
               ([MAGIC :tag SPAN :x 1237.5 :y 608 :w 13 :h 22 :mt -11 :mr 0 :mb 0 :ml 0 :class (gw-icon feed-arrow)]))
              ([BLOCK :tag SPAN :x 154 :y 728 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 730 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 134 :y 744 :w 1150 :h 285 :id desktop-1 :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 744 :w 1150 :h 285 :id uber-widget-ns_174AMHZCNNZH083A2GQT_9191_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 764 :w 1110 :h 35 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 764 :w 295 :h 31.5 :class (as-title-block-left)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 768.25 :w 295 :h 23]))))
              ([BLOCK :tag SPAN :x 449 :y 764 :w 76 :h 35 :class (as-title-block-right)]
               ([LINE]
                ([INLINE :tag A :class (a-link-normal)]
                 ([TEXT :x 464 :y 773.5 :w 61 :h 16])))))
             ([BLOCK :tag DIV :x 154 :y 799 :w 1110 :h 220 :id e10018 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 154 :y 799 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 799 :w 5590 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10135 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y (/ 9965 12) :w 270 :h (/ 823 6) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 154 :y (/ 9965 12) :w 270 :h (/ 823 6) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 434 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10136 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 434 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 714 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10137 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 714 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 994 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10138 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 994 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10139 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1274 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10140 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1554 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10141 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1834 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10142 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2114 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10143 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2394 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10144 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2674 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2954 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10145 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2954 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2954 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3234 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10146 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3234 :y 803.4 :w 270 :h 191.2 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3234 :y 803.4 :w 270 :h 191.2 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3514 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10147 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3514 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3514 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3794 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10148 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3794 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3794 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4074 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10149 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4074 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4074 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4354 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10150 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4354 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4354 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4634 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10151 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4634 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4634 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4914 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10152 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4914 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4914 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5194 :y 799 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10153 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5194 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5194 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5474 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10084 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5474 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5474 :y 799 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))))
              ([BLOCK :tag SPAN :x 154 :y 1013 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 1015 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 134 :y 1029 :w 1150 :h 281.5 :id desktop-2 :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 1029 :w 1150 :h 281.5 :id uber-widget-ns_174AMHZCNNZH083A2GQT_9192_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 1049 :w 1110 :h 31.5 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 1049 :w 1110 :h 31.5 :id e10008 :class (as-title-block-single-title)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 1053.25 :w 311 :h 23])))))
             ([BLOCK :tag DIV :x 154 :y 1080.5 :w 1110 :h 220 :id e10019 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 154 :y 1080.5 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 1080.5 :w 5590 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10156 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 154 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 434 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10157 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 434 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 714 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10158 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 714 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 994 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10159 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 994 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10160 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1274 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10161 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y (/ 16247 15) :w 270 :h 194.75 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1554 :y (/ 16247 15) :w 270 :h 194.75 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10162 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1834 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10163 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2114 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10164 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2394 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10165 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2674 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2954 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10166 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2954 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2954 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3234 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10167 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3234 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3234 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3514 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10168 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3514 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3514 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3794 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10169 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3794 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3794 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4074 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10170 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4074 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4074 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4354 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10171 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4354 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4354 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4634 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10172 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4634 :y (/ 13351 12) :w 270 :h (/ 815 6) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4634 :y (/ 13351 12) :w 270 :h (/ 815 6) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4914 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10173 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4914 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4914 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5194 :y 1080.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10174 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5194 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5194 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5474 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10085 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5474 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5474 :y 1080.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))))
              ([BLOCK :tag SPAN :x 154 :y 1294.5 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 1296.5 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 134 :y 1310.5 :w 1150 :h 239 :class (billboardRowWrapper)]
            ([BLOCK :tag DIV :x 134 :y 1322.5 :w 1150 :h 200 :class (a-row billboardRow)]
             ([BLOCK :tag DIV :x 134 :y 1322.5 :w 562.9 :h 200 :class (a-column a-span6)]
              ([MAGIC :tag DIV :x 134 :y 1322.5 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-1 :class (billboard)]
               ([BLOCK :tag DIV :x 144 :y 1322.5 :w 542.9 :h 200 :id scalable-image-map_scalable-image-map-ns_10ZP4QDJGM0MNW2K4ASK_6730_ :class (a-section a-text-center shogun-widget scalable-image-map aui-desktop-link)]
                ([BLOCK :tag A :x 195.45 :y 1322.5 :w 440 :h 200 :class (a-link-normal)]
                 ([LINE]
                  ([INLINE :tag IMG]))))))
             ([BLOCK :tag DIV :x 721.1 :y 1322.5 :w 562.9 :h 200 :class (a-column a-span6 a-span-last)]
              ([MAGIC :tag DIV :x 721.1 :y 1322.5 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-2 :class (billboard)]
               ([BLOCK :tag DIV :x 731.1 :y 1322.5 :w 542.9 :h 200 :id scalable-image-map_scalable-image-map-ns_0WAZGCXEBZJ34NQ5YN93_194_ :class (a-section a-text-center shogun-widget scalable-image-map aui-desktop-link)]
                ([BLOCK :tag A :x 782.55 :y 1322.5 :w 440 :h 200 :class (a-link-normal)]
                 ([LINE]
                  ([INLINE :tag IMG]))))))))
           ([BLOCK :tag HR :x 134 :y 1549.5 :w 1150 :h 1 :class (billboardrow-hr)])
           ([BLOCK :tag DIV :x 134 :y 1570.5 :w 1150 :h 285 :id desktop-3 :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 1570.5 :w 1150 :h 285 :id uber-widget-ns_174AMHZCNNZH083A2GQT_9193_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 1590.5 :w 1110 :h 35 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 1590.5 :w 314 :h 31.5 :class (as-title-block-left)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 1594.75 :w 314 :h 23]))))
              ([BLOCK :tag SPAN :x 468 :y 1590.5 :w 76 :h 35 :class (as-title-block-right)]
               ([LINE]
                ([INLINE :tag A :class (a-link-normal)]
                 ([TEXT :x 483 :y 1600 :w 61 :h 16])))))
             ([BLOCK :tag DIV :x 154 :y 1625.5 :w 1110 :h 220 :id e10020 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 154 :y 1625.5 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 1625.5 :w 5590 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10177 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 154 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 434 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10178 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 434 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 714 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10179 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 714 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 994 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10180 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 994 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10181 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1274 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10182 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1554 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10183 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1834 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10184 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2114 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10185 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2394 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10186 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2674 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2954 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10187 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2954 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2954 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3234 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10188 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3234 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3234 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3514 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10189 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3514 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3514 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3794 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10190 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3794 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3794 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4074 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10191 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4074 :y (/ 19735 12) :w 270 :h 161.85 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4074 :y (/ 19735 12) :w 270 :h 161.85 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4354 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10192 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4354 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4354 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4634 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10193 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4634 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4634 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4914 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10194 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4914 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4914 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5194 :y 1625.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10195 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5194 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5194 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5474 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10086 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5474 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5474 :y 1625.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))))
              ([BLOCK :tag SPAN :x 154 :y 1839.5 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 1841.5 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 134 :y 1855.5 :w 1150 :h 281.5 :id desktop-4 :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 1855.5 :w 1150 :h 281.5 :id uber-widget-ns_174AMHZCNNZH083A2GQT_9209_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 1875.5 :w 1110 :h 31.5 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 1875.5 :w 1110 :h 31.5 :id e10009 :class (as-title-block-single-title)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 1879.75 :w 427 :h 23])))))
             ([BLOCK :tag DIV :x 154 :y 1907 :w 1110 :h 220 :id e10021 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 154 :y 1907 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 1907 :w 5590 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10198 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 154 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 434 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10199 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 434 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 714 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10200 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y (/ 29174 15) :w 270 :h 124.15 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 714 :y (/ 29174 15) :w 270 :h 124.15 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 994 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10201 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y (/ 28796 15) :w 270 :h (/ 2618 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 994 :y (/ 28796 15) :w 270 :h (/ 2618 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10202 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1274 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10203 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1554 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10204 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y 1928.65 :w 270 :h 146.875 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1834 :y 1928.65 :w 270 :h 146.875 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10205 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 1929.95 :w 270 :h 154.1 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2114 :y 1929.95 :w 270 :h 154.1 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10206 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2394 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10207 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2674 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2954 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10208 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2954 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2954 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3234 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10209 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3234 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3234 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3514 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10210 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3514 :y 1930.7 :w 270 :h (/ 4579 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3514 :y 1930.7 :w 270 :h (/ 4579 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3794 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10211 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3794 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3794 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4074 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10212 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4074 :y 1973.1 :w 270 :h (/ 2033 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4074 :y 1973.1 :w 270 :h (/ 2033 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4354 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10213 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4354 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4354 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4634 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10214 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4634 :y (/ 23078 12) :w 270 :h 167.65 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4634 :y (/ 23078 12) :w 270 :h 167.65 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4914 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10215 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4914 :y (/ 29064 15) :w 270 :h (/ 4163 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4914 :y (/ 29064 15) :w 270 :h (/ 4163 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5194 :y 1907 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10216 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5194 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5194 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5474 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10087 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5474 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5474 :y 1907 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))))
              ([BLOCK :tag SPAN :x 154 :y 2121 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 2123 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 134 :y 2137 :w 1150 :h 239 :class (billboardRowWrapper)]
            ([BLOCK :tag DIV :x 134 :y 2149 :w 1150 :h 200 :class (a-row billboardRow)]
             ([BLOCK :tag DIV :x 134 :y 2149 :w 562.9 :h 200 :class (a-column a-span6)]
              ([MAGIC :tag DIV :x 134 :y 2149 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-3 :class (billboard)]
               ([BLOCK :tag DIV :x 144 :y 2149 :w 542.9 :h 200 :id scalable-image-map_scalable-image-map-ns_1EHC7NQ22AVVYHYZBKRH_4171_ :class (a-section a-text-center shogun-widget scalable-image-map aui-desktop-link)]
                ([BLOCK :tag A :x 195.45 :y 2149 :w 440 :h 200 :class (a-link-normal)]
                 ([LINE]
                  ([INLINE :tag IMG]))))))
             ([BLOCK :tag DIV :x 721.1 :y 2149 :w 562.9 :h 200 :class (a-column a-span6 a-span-last)]
              ([MAGIC :tag DIV :x 721.1 :y 2149 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-4 :class (billboard)]
               ([BLOCK :tag DIV :x 731.1 :y 2149 :w 542.9 :h 200 :id scalable-image-map_scalable-image-map-ns_0FWJ6V519EG7V6RS4CZZ_6651_ :class (a-section a-text-center shogun-widget scalable-image-map aui-desktop-link)]
                ([BLOCK :tag A :x 782.55 :y 2149 :w 440 :h 200 :class (a-link-normal)]
                 ([LINE]
                  ([INLINE :tag IMG]))))))))
           ([BLOCK :tag HR :x 134 :y 2376 :w 1150 :h 1 :class (billboardrow-hr)])
           ([BLOCK :tag DIV :x 134 :y 2397 :w 1150 :h 281.5 :id desktop-5 :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 2397 :w 1150 :h 281.5 :id uber-widget-ns_174AMHZCNNZH083A2GQT_9210_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 2417 :w 1110 :h 31.5 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 2417 :w 1110 :h 31.5 :id e10010 :class (as-title-block-single-title)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 2421.25 :w 493 :h 23])))))
             ([BLOCK :tag DIV :x 154 :y 2448.5 :w 1110 :h 220 :id e10022 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 154 :y 2448.5 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 2448.5 :w 3910 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10219 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 154 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 434 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10220 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y (/ 75255 30) :w 270 :h 80.05 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 434 :y (/ 75255 30) :w 270 :h 80.05 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 714 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10221 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y 2526.6 :w 270 :h (/ 526 12) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 714 :y 2526.6 :w 270 :h (/ 526 12) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 994 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10222 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 994 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10223 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1274 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10224 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1554 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10225 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y (/ 75225 30) :w 270 :h (/ 2459 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1834 :y (/ 75225 30) :w 270 :h (/ 2459 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10226 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2114 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10227 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2394 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10228 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y (/ 75647 30) :w 270 :h 53.9 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2674 :y (/ 75647 30) :w 270 :h 53.9 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2954 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10229 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2954 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2954 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3234 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10230 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3234 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3234 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3514 :y 2448.5 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10231 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3514 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3514 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3794 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10088 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3794 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3794 :y 2448.5 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))))
              ([BLOCK :tag SPAN :x 154 :y 2662.5 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 2664.5 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 134 :y 2678.5 :w 1150 :h 281.5 :id desktop-6 :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 2678.5 :w 1150 :h 281.5 :id uber-widget-ns_174AMHZCNNZH083A2GQT_9211_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 2698.5 :w 1110 :h 31.5 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 2698.5 :w 1110 :h 31.5 :id e10011 :class (as-title-block-single-title)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 2702.75 :w 332 :h 23])))))
             ([BLOCK :tag DIV :x 154 :y 2730 :w 1110 :h 220 :id e10023 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 154 :y 2730 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 2730 :w 5590 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10234 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 154 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 434 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10235 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 434 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 714 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10236 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 714 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 994 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10237 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 994 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10238 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1274 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10239 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1554 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10240 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1834 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10241 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2114 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10242 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2394 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10243 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2674 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2954 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10244 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2954 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2954 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3234 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10245 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3234 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3234 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3514 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10246 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3514 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3514 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3794 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10247 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3794 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3794 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4074 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10248 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4074 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4074 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4354 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10249 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4354 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4354 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4634 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10250 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4634 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4634 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4914 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10251 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4914 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4914 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5194 :y 2730 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10252 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5194 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5194 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5474 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10089 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5474 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5474 :y 2730 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))))
              ([BLOCK :tag SPAN :x 154 :y 2944 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 2946 :w 1110 :h 1 :class (feed-scrollbar-track)])))))
           ([BLOCK :tag DIV :x 134 :y 2960 :w 1150 :h 239 :class (billboardRowWrapper)]
            ([BLOCK :tag DIV :x 134 :y 2972 :w 1150 :h 200 :class (a-row billboardRow)]
             ([BLOCK :tag DIV :x 134 :y 2972 :w 562.9 :h 200 :class (a-column a-span6)]
              ([MAGIC :tag DIV :x 134 :y 2972 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-5 :class (billboard)]
               ([BLOCK :tag DIV :x 144 :y 2972 :w 542.9 :h 200 :id scalable-image-map_scalable-image-map-ns_149HZFZVSCDR2Z7DWGKT_5466_ :class (a-section a-text-center shogun-widget scalable-image-map aui-desktop-link)]
                ([BLOCK :tag A :x 195.45 :y 2972 :w 440 :h 200 :class (a-link-normal)]
                 ([LINE]
                  ([INLINE :tag IMG]))))))
             ([BLOCK :tag DIV :x 721.1 :y 2972 :w 562.9 :h 200 :class (a-column a-span6 a-span-last)]
              ([MAGIC :tag DIV :x 721.1 :y 2972 :w 562.9 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id desktop-billboard-6 :class (billboard)]
               ([BLOCK :tag DIV :x 731.1 :y 2972 :w 542.9 :h 200 :id scalable-image-map_scalable-image-map-ns_129T3N9RHP6A735BEC93_7312_ :class (a-section a-text-center shogun-widget scalable-image-map aui-desktop-link)]
                ([BLOCK :tag A :x 782.55 :y 2972 :w 440 :h 200 :class (a-link-normal)]
                 ([LINE]
                  ([INLINE :tag IMG]))))))))
           ([BLOCK :tag HR :x 134 :y 3199 :w 1150 :h 1 :class (billboardrow-hr)])
           ([BLOCK :tag DIV :x 134 :y 3220 :w 1150 :h 285 :id desktop-7 :class (desktop-row gw-widget-instrument)]
            ([BLOCK :tag DIV :x 134 :y 3220 :w 1150 :h 285 :id uber-widget-ns_174AMHZCNNZH083A2GQT_9212_ :class (a-section a-spacing-none shogun-widget uber-widget aui-desktop fresh-shoveler)]
             ([BLOCK :tag DIV :x 154 :y 3240 :w 1110 :h 35 :class (a-section as-title-block)]
              ([BLOCK :tag H2 :x 154 :y 3240 :w 349 :h 31.5 :class (as-title-block-left)]
               ([LINE]
                ([INLINE :tag SPAN :class (a-color-base)]
                 ([TEXT :x 154 :y 3244.25 :w 349 :h 23]))))
              ([BLOCK :tag SPAN :x 503 :y 3240 :w 76 :h 35 :class (as-title-block-right)]
               ([LINE]
                ([INLINE :tag A :class (a-link-normal)]
                 ([TEXT :x 518 :y 3249.5 :w 61 :h 16])))))
             ([BLOCK :tag DIV :x 154 :y 3275 :w 1110 :h 220 :id e10024 :class (a-section feed-carousel)]
              ([BLOCK :tag DIV :x 154 :y 3275 :w 1110 :h 220 :class (a-section feed-carousel-viewport)]
               ([MAGIC :tag UL :x 154 :y 3275 :w 5590 :h 200 :mt 0 :mr 0 :mb 14 :ml 0 :class (a-nostyle a-horizontal feed-carousel-shelf)]
                ([MAGIC :tag LI :x 154 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10255 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 154 :y (/ 99255 30) :w 270 :h 133.05 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 154 :y (/ 99255 30) :w 270 :h 133.05 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 434 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10256 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 434 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 434 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 714 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10257 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 714 :y 3321 :w 270 :h 108 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 714 :y 3321 :w 270 :h 108 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 994 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10258 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 994 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 994 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1274 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10259 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1274 :y 3320.9 :w 270 :h (/ 3247 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1274 :y 3320.9 :w 270 :h (/ 3247 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1554 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10260 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1554 :y (/ 49224 15) :w 270 :h (/ 5603 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1554 :y (/ 49224 15) :w 270 :h (/ 5603 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 1834 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10261 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 1834 :y (/ 49699 15) :w 270 :h (/ 3705 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 1834 :y (/ 49699 15) :w 270 :h (/ 3705 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2114 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10262 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2114 :y 3276.9 :w 270 :h 196.25 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2114 :y 3276.9 :w 270 :h 196.25 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2394 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10263 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2394 :y (/ 49363 15) :w 270 :h (/ 2524 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2394 :y (/ 49363 15) :w 270 :h (/ 2524 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2674 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10264 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2674 :y 3285 :w 270 :h 180 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2674 :y 3285 :w 270 :h 180 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 2954 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10265 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 2954 :y 3304.8 :w 270 :h (/ 1685 12) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 2954 :y 3304.8 :w 270 :h (/ 1685 12) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3234 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10266 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3234 :y 3275.7 :w 270 :h 198.65 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3234 :y 3275.7 :w 270 :h 198.65 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3514 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10267 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3514 :y (/ 49584 15) :w 270 :h (/ 4163 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3514 :y (/ 49584 15) :w 270 :h (/ 4163 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 3794 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10268 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 3794 :y (/ 99397 30) :w 270 :h (/ 1853 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 3794 :y (/ 99397 30) :w 270 :h (/ 1853 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4074 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10269 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4074 :y 3297.9 :w 270 :h 154.2 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4074 :y 3297.9 :w 270 :h 154.2 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4354 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10270 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4354 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4354 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4634 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10271 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4634 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4634 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 4914 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10272 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 4914 :y (/ 9923 3) :w 270 :h 134.7 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 4914 :y (/ 9923 3) :w 270 :h 134.7 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5194 :y 3275 :w 270 :h 200 :mt 0 :mr 10 :mb 0 :ml 0 :id e10273 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5194 :y (/ 98719 30) :w 270 :h 168.75 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5194 :y (/ 98719 30) :w 270 :h 168.75 :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))
                ([MAGIC :tag LI :x 5474 :y 3275 :w 270 :h 200 :mt 0 :mr 0 :mb 0 :ml 0 :id e10090 :class (feed-carousel-card)]
                 ([MAGIC :tag SPAN :x 5474 :y (/ 98903 30) :w 270 :h (/ 4695 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-list-item)]
                  ([MAGIC :tag A :x 5474 :y (/ 98903 30) :w 270 :h (/ 4695 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (a-link-normal  a-inline-block)]
                   ([INLINE :tag IMG :class (a-dynamic-image  product-image)]))))))
              ([BLOCK :tag SPAN :x 154 :y 3489 :w 1110 :h 6 :class (feed-scrollbar)]
               ([BLOCK :tag SPAN :x 154 :y 3491 :w 1110 :h 1 :class (feed-scrollbar-track)]))))))))))
      ([ANON]
       ([LINE]))
      ([MAGIC :tag DIV :x 114 :y 3542 :w 1500 :h 123 :mt 0 :mr 0 :mb 0 :ml 0 :id rhf :class (copilot-secure-display)]
       ([BLOCK :tag DIV :x 114 :y 3542 :w 1500 :h 123 :id e10279 :class (rhf-frame)]
        ([BLOCK :tag DIV :x 114 :y 3542 :w 1500 :h 123 :id rhf-error]
         ([BLOCK :tag DIV :x 114 :y 3542 :w 1500 :h 123 :class (rhf-border)]
          ([BLOCK :tag DIV :x 135 :y 3543 :w 1458 :h 32 :class (rhf-header)]
           ([LINE]
            ([TEXT :x 145 :y 3551.5 :w 539 :h 22])))
          ([BLOCK :tag DIV :x 135 :y 3575 :w 1458 :h 89 :class (rhf-footer)]
           ([BLOCK :tag DIV :x 135 :y 3575 :w 1458 :h 75 :class (rvi-container)]
            ([BLOCK :tag DIV :x 1437 :y 3593 :w 146 :h 75 :class (ybh-edit)]
             ([MAGIC :tag DIV :x 1477 :y 3591 :w 12 :h 11 :mt -2 :mr 0 :mb 0 :ml 0 :class (ybh-edit-arrow)]
              ([TEXT :x 1477 :y 3590.5 :w 4 :h 12]))
             ([ANON]
              ([LINE]
               ([TEXT :x 1489 :y 3623 :w 4 :h 15])))
             ([MAGIC :tag DIV :x 1493 :y 3593 :w 80 :h 33 :mt 0 :mr 0 :mb 0 :ml 0 :class (ybh-edit-link)]
              ([INLINE :tag A]
               ([TEXT :x 1493 :y 3593 :w 59 :h 11])
               ([TEXT :x 1493 :y 3604 :w 70 :h 11])
               ([TEXT :x 1493 :y 3615 :w 33 :h 11]))))
            ([BLOCK :tag SPAN :x 145 :y 3575 :w 650 :h 75 :class (no-rvi-message)]
             ([LINE]
              ([TEXT :x 145 :y 3605 :w 650 :h 15])))))))))
      ([ANON]
       ([LINE]))
      ([BLOCK :tag DIV :x 114 :y 3714 :w 1500 :h 695 :id navFooter]
       ([BLOCK :tag DIV :x 114 :y 3714 :w 1500 :h 49 :class (navFooterBackToTop)]
        ([BLOCK :tag SPAN :x 114 :y 3714 :w 1500 :h 49]
         ([LINE]
          ([TEXT :x 830.5 :y 3731 :w 67 :h 15]))))
       ([ANON]
        ([LINE]
         ([INLINE :tag A :id navBackToTop])))
       ([MAGIC :tag TABLE :x (/ 9527 30) :y 3788 :w 1092.85 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterVerticalColumn)]
        ([MAGIC :tag TBODY :x (/ 9527 30) :y 3788 :w 1092.85 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0]
         ([MAGIC :tag TR :x (/ 9527 30) :y 3788 :w 1092.85 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x (/ 9527 30) :y 3788 :w 128 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :id e10028 :class (navFooterLinkCol)]
           ([BLOCK :tag DIV :x (/ 9827 30) :y 3794 :w 108 :h 15.6 :class (navFooterColHead)]
            ([LINE]
             ([TEXT :x (/ 9827 30) :y 3793.3 :w 108 :h 17])))
           ([BLOCK :tag UL :x (/ 9827 30) :y 3823.6 :w 108 :h 86.4 :id e10077]
            ([MAGIC :tag LI :x (/ 9827 30) :y 3823.6 :w 108 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_first)]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 9827 30) :y 3823.9 :w 45 :h 15])))
            ([MAGIC :tag LI :x (/ 9827 30) :y 3847.2 :w 108 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 9827 30) :y 3847.5 :w 86 :h 15])))
            ([MAGIC :tag LI :x (/ 9827 30) :y 3870.8 :w 108 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 9827 30) :y 3871.1 :w 102 :h 15])))
            ([MAGIC :tag LI :x (/ 9827 30) :y 3894.4 :w 108 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_last)]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 9827 30) :y 3894.7 :w 97 :h 15])))))
          ([MAGIC :tag TD :x (/ 13367 30) :y 3788 :w 102.5 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :id e10044 :class (navFooterColSpacerInner)])
          ([MAGIC :tag TD :x 554.85 :y 3788 :w 195 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :id e10045 :class (navFooterLinkCol)]
           ([BLOCK :tag DIV :x 564.85 :y 3794 :w 175 :h 15.6 :class (navFooterColHead)]
            ([LINE]
             ([TEXT :x 564.85 :y 3793.3 :w 143 :h 17])))
           ([BLOCK :tag UL :x 564.85 :y 3823.6 :w 175 :h 205.1 :id e10078]
            ([MAGIC :tag LI :x 564.85 :y 3823.6 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_first)]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3823.9 :w 92 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 3847.2 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3847.5 :w 175 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 3870.8 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3871.1 :w 150 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 3894.4 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3894.7 :w 156 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 3918 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3918.3 :w 112 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 3941.6 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3941.9 :w 139 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 3965.2 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3965.5 :w 116 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 3988.8 :w 175 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 564.85 :y 3989.1 :w 162 :h 15])))
            ([MAGIC :tag LI :x 564.85 :y 4012.4 :w 175 :h 16.3 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_last nav_a_carat)]
             ([INLINE :tag SPAN :class (nav_a_carat)]
              ([TEXT :x 564.85 :y 4011.4 :w 5 :h 17]))
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x 573.85 :y 4013.4 :w 40 :h 15])))))
          ([MAGIC :tag TD :x 749.85 :y 3788 :w 102.5 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :id e10046 :class (navFooterColSpacerInner)])
          ([MAGIC :tag TD :x (/ 12887 15) :y 3788 :w 223 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :id e10047 :class (navFooterLinkCol)]
           ([BLOCK :tag DIV :x (/ 13037 15) :y 3794 :w 203 :h 15.6 :class (navFooterColHead)]
            ([LINE]
             ([TEXT :x (/ 13037 15) :y 3793.3 :w 188 :h 17])))
           ([BLOCK :tag UL :x (/ 13037 15) :y 3823.6 :w 203 :h 133.6 :id e10079]
            ([MAGIC :tag LI :x (/ 13037 15) :y 3823.6 :w 203 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_first)]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 13037 15) :y 3823.9 :w 192 :h 15])))
            ([MAGIC :tag LI :x (/ 13037 15) :y 3847.2 :w 203 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 13037 15) :y 3847.5 :w 143 :h 15])))
            ([MAGIC :tag LI :x (/ 13037 15) :y 3870.8 :w 203 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 13037 15) :y 3871.1 :w 203 :h 15])))
            ([MAGIC :tag LI :x (/ 13037 15) :y 3894.4 :w 203 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 13037 15) :y 3894.7 :w 98 :h 15])))
            ([MAGIC :tag LI :x (/ 13037 15) :y 3918 :w 203 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 13037 15) :y 3918.3 :w 140 :h 15])))
            ([MAGIC :tag LI :x (/ 13037 15) :y 3941.6 :w 203 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_last)]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 13037 15) :y 3941.9 :w 162 :h 15])))))
          ([MAGIC :tag TD :x (/ 16232 15) :y 3788 :w 102.5 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :id e10048 :class (navFooterColSpacerInner)])
          ([MAGIC :tag TD :x (/ 14297 12) :y 3788 :w 219 :h 248.7 :mt 0 :mr 0 :mb 0 :ml 0 :id e10038 :class (navFooterLinkCol)]
           ([BLOCK :tag DIV :x (/ 14417 12) :y 3794 :w 199 :h 15.6 :class (navFooterColHead)]
            ([LINE]
             ([TEXT :x (/ 14417 12) :y 3793.3 :w 110 :h 17])))
           ([BLOCK :tag UL :x (/ 14417 12) :y 3823.6 :w 199 :h 180.8 :id e10080]
            ([MAGIC :tag LI :x (/ 14417 12) :y 3823.6 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_first)]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3823.9 :w 78 :h 15])))
            ([MAGIC :tag LI :x (/ 14417 12) :y 3847.2 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3847.5 :w 69 :h 15])))
            ([MAGIC :tag LI :x (/ 14417 12) :y 3870.8 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3871.1 :w 151 :h 15])))
            ([MAGIC :tag LI :x (/ 14417 12) :y 3894.4 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3894.7 :w 86 :h 15])))
            ([MAGIC :tag LI :x (/ 14417 12) :y 3918 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3918.3 :w 145 :h 15])))
            ([MAGIC :tag LI :x (/ 14417 12) :y 3941.6 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3941.9 :w 199 :h 15])))
            ([MAGIC :tag LI :x (/ 14417 12) :y 3965.2 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3965.5 :w 107 :h 15])))
            ([MAGIC :tag LI :x (/ 14417 12) :y 3988.8 :w 199 :h 15.6 :mt 0 :mr 0 :mb 8 :ml 0 :class (nav_last)]
             ([INLINE :tag A :class (nav_a)]
              ([TEXT :x (/ 14417 12) :y 3989.1 :w 26 :h 15]))))))))
       ([BLOCK :tag DIV :x 122 :y 4066.7 :w 1484 :h 24 :class (navFooterLine navFooterLogoLine)]
        ([LINE]
         ([INLINE :tag A]
          ([INLINE :tag IMG]))))
       ([BLOCK :tag DIV :x 122 :y 4094.7 :w 1484 :h 18 :class (navFooterLine navFooterLinkLine navFooterPadItemLine)]
        ([MAGIC :tag UL :x 540.7 :y 4094.7 :w 646.6 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :id e10081]
         ([INLINE :tag LI :class (nav_first)]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 547.3 :y 4097.7 :w 43 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 603.5 :y 4097.7 :w 27 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 643.7 :y 4097.7 :w 37 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 693.9 :y 4097.7 :w 27 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 734.1 :y 4097.7 :w 34 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 781.3 :y 4097.7 :w 44 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 838.5 :y 4097.7 :w 22 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 873.7 :y 4097.7 :w 19 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 905.9 :y 4097.7 :w 29 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 948.1 :y 4097.7 :w 34 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 995.3 :y 4097.7 :w 58 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 1066.5 :y 4097.7 :w 27 :h 12])))
         ([INLINE :tag LI :class (nav_last)]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 1106.7 :y 4097.7 :w 74 :h 12])))))
       ([BLOCK :tag DIV :x 114 :y 4132.7 :w 1500 :h 237.3 :class (navFooterLine navFooterLinkLine navFooterDescLine)]
        ([MAGIC :tag TABLE :x 114 :y 4132.7 :w 1500 :h 237.3 :mt 0 :mr 0 :mb 0 :ml 0 :id e10026]
         ([MAGIC :tag TBODY :x 114 :y 4132.7 :w 1500 :h 237.3 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TR :x 114 :y 4132.7 :w 1500 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y 4132.7 :w 244.9 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10029 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 358.9 :y 4132.7 :w 102.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10062 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 367.15 :y 4133 :w 20 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 367.15 :y 4145.35 :w 83 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 367.15 :y 4145.35 :w 56 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 367.15 :y 4156.35 :w 83 :h 11]))))
           ([MAGIC :tag TD :x 461.4 :y 4132.7 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10063 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 5971 12) :y 4132.7 :w 118.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10064 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 3035 6) :y 4133 :w 50 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 3035 6) :y 4145.35 :w 56 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 3035 6) :y 4145.35 :w 52 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 3035 6) :y 4156.35 :w 56 :h 11]))))
           ([MAGIC :tag TD :x (/ 7393 12) :y 4132.7 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10065 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 9784 15) :y 4132.7 :w 127.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10066 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 19815 30) :y 4133 :w 22 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 19815 30) :y 4145.35 :w 103 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 19815 30) :y 4145.35 :w 103 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 19815 30) :y 4156.35 :w 52 :h 11]))))
           ([MAGIC :tag TD :x (/ 23393 30) :y 4132.7 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10067 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 815.95 :y 4132.7 :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10068 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 824.2 :y 4133 :w 81 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 824.2 :y 4145.35 :w 98 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 824.2 :y 4145.35 :w 98 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 824.2 :y 4156.35 :w 67 :h 11]))))
           ([MAGIC :tag TD :x 930.45 :y 4132.7 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10069 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 28999 30) :y 4132.7 :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10070 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 974.9 :y 4133 :w 28 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 974.9 :y 4145.35 :w 98 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 974.9 :y 4145.35 :w 98 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 974.9 :y 4156.35 :w 54 :h 11]))))
           ([MAGIC :tag TD :x (/ 16217 15) :y 4132.7 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10071 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1117.3 :y 4132.7 :w 106.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10072 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 33767 30) :y 4133 :w 88 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 33767 30) :y 4145.35 :w 68 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 33767 30) :y 4145.35 :w 68 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 33767 30) :y 4156.35 :w 64 :h 11]))))
           ([MAGIC :tag TD :x (/ 14686 12) :y 4132.7 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10073 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1260 :y 4132.7 :w 111.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10074 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 1268.25 :y 4133 :w 68 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 1268.25 :y 4145.35 :w 89 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 1268.25 :y 4145.35 :w 82 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 1268.25 :y 4156.35 :w 89 :h 11]))))
           ([MAGIC :tag TD :x 1371.5 :y 4132.7 :w 242.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10039 :class (navFooterDescSpacer)]))
          ([MAGIC :tag TR :x 114 :y 4167.7 :w 1500 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y 4167.7 :w 244.9 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0 :id e10030]
            ([TEXT :x 234.45 :y 4239 :w 4 :h 15])))
          ([MAGIC :tag TR :x 114 :y 3921.875 :w 1500 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y 3921.875 :w 244.9 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10031 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 358.9 :y 3921.875 :w 102.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 367.15 :y 4183.6 :w 70 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 367.15 :y (/ 62939 15) :w 68 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 367.15 :y (/ 62939 15) :w 55 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 367.15 :y (/ 63104 15) :w 68 :h 11]))))
           ([MAGIC :tag TD :x 461.4 :y 3921.875 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10280 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 5971 12) :y 3921.875 :w 118.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 3035 6) :y 4183.6 :w 73 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 3035 6) :y (/ 62939 15) :w 101 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 3035 6) :y (/ 62939 15) :w 79 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 3035 6) :y (/ 63104 15) :w 101 :h 11]))))
           ([MAGIC :tag TD :x (/ 7393 12) :y 3921.875 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10281 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 9784 15) :y 3921.875 :w 127.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 19815 30) :y 4183.6 :w 111 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 19815 30) :y (/ 62939 15) :w 95 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 19815 30) :y (/ 62939 15) :w 74 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 19815 30) :y (/ 63104 15) :w 95 :h 11]))))
           ([MAGIC :tag TD :x (/ 23393 30) :y 3921.875 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10282 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 815.95 :y 3921.875 :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 824.2 :y 4183.6 :w 36 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 824.2 :y (/ 62939 15) :w 58 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 824.2 :y (/ 62939 15) :w 47 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 824.2 :y (/ 63104 15) :w 58 :h 11]))))
           ([MAGIC :tag TD :x 930.45 :y 3921.875 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10283 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 28999 30) :y 3921.875 :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 974.9 :y 4183.6 :w 73 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 974.9 :y (/ 62939 15) :w 74 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 974.9 :y (/ 62939 15) :w 74 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 974.9 :y (/ 63104 15) :w 45 :h 11]))))
           ([MAGIC :tag TD :x (/ 16217 15) :y 3921.875 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10284 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1117.3 :y 3921.875 :w 106.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 33767 30) :y 4183.6 :w 79 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 33767 30) :y (/ 62939 15) :w 90 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 33767 30) :y (/ 62939 15) :w 75 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 33767 30) :y (/ 63104 15) :w 90 :h 11]))))
           ([MAGIC :tag TD :x (/ 14686 12) :y 3921.875 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10285 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1260 :y 3921.875 :w 111.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 1268.25 :y 4183.6 :w 48 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 1268.25 :y (/ 62939 15) :w 91 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 1268.25 :y (/ 62939 15) :w 80 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 1268.25 :y (/ 63104 15) :w 91 :h 11]))))
           ([MAGIC :tag TD :x 1371.5 :y 3921.875 :w 242.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10040 :class (navFooterDescSpacer)]))
          ([MAGIC :tag TR :x 114 :y (/ 63274 15) :w 1500 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y (/ 63274 15) :w 244.9 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0 :id e10032]
            ([TEXT :x 234.45 :y (/ 126557 30) :w 4 :h 15])))
          ([MAGIC :tag TR :x 114 :y (/ 63508 15) :w 1500 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y (/ 63508 15) :w 244.9 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10033 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 358.9 :y (/ 63508 15) :w 102.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 367.15 :y (/ 50810 12) :w 56 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 367.15 :y (/ 127395 30) :w 69 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 367.15 :y (/ 127395 30) :w 63 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 367.15 :y (/ 127725 30) :w 69 :h 11]))))
           ([MAGIC :tag TD :x 461.4 :y (/ 63508 15) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10286 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 5971 12) :y (/ 63508 15) :w 118.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 3035 6) :y (/ 50810 12) :w 63 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 3035 6) :y (/ 127395 30) :w 102 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 3035 6) :y (/ 127395 30) :w 102 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 3035 6) :y (/ 127725 30) :w 52 :h 11]))))
           ([MAGIC :tag TD :x (/ 7393 12) :y (/ 63508 15) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10287 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 9784 15) :y (/ 63508 15) :w 127.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 19815 30) :y (/ 50810 12) :w 60 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 19815 30) :y (/ 127395 30) :w 65 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 19815 30) :y (/ 127395 30) :w 50 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 19815 30) :y (/ 127725 30) :w 65 :h 11]))))
           ([MAGIC :tag TD :x (/ 23393 30) :y (/ 63508 15) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10288 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 815.95 :y (/ 63508 15) :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 824.2 :y (/ 50810 12) :w 50 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 824.2 :y (/ 127395 30) :w 60 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 824.2 :y (/ 127395 30) :w 31 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 824.2 :y (/ 127725 30) :w 60 :h 11]))))
           ([MAGIC :tag TD :x 930.45 :y (/ 63508 15) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10289 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 28999 30) :y (/ 63508 15) :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 974.9 :y (/ 50810 12) :w 49 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 974.9 :y (/ 127395 30) :w 71 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 974.9 :y (/ 127395 30) :w 71 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 974.9 :y (/ 127725 30) :w 37 :h 11]))))
           ([MAGIC :tag TD :x (/ 16217 15) :y (/ 63508 15) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10290 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1117.3 :y (/ 63508 15) :w 106.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 33767 30) :y (/ 50810 12) :w 30 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 33767 30) :y (/ 127395 30) :w 79 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 33767 30) :y (/ 127395 30) :w 79 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 33767 30) :y (/ 127725 30) :w 47 :h 11]))))
           ([MAGIC :tag TD :x (/ 14686 12) :y (/ 63508 15) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10291 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1260 :y (/ 63508 15) :w 111.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 1268.25 :y (/ 50810 12) :w 54 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 1268.25 :y (/ 127395 30) :w 95 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 1268.25 :y (/ 127395 30) :w 60 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 1268.25 :y (/ 127725 30) :w 95 :h 11]))))
           ([MAGIC :tag TD :x 1371.5 :y (/ 63508 15) :w 242.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10041 :class (navFooterDescSpacer)]))
          ([MAGIC :tag TR :x 114 :y 4268.85 :w 1500 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y 4268.85 :w 244.9 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0 :id e10034]
            ([TEXT :x 234.45 :y 4269.15 :w 4 :h 15])))
          ([MAGIC :tag TR :x 114 :y 4284.45 :w 1500 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y 4284.45 :w 244.9 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10035 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 358.9 :y 4284.45 :w 102.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 367.15 :y (/ 128543 30) :w 23 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 367.15 :y 4297.1 :w 60 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 367.15 :y 4297.1 :w 53 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 367.15 :y 4308.1 :w 60 :h 11]))))
           ([MAGIC :tag TD :x 461.4 :y 4284.45 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10292 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 5971 12) :y 4284.45 :w 118.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 3035 6) :y (/ 128543 30) :w 60 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 3035 6) :y 4297.1 :w 60 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 3035 6) :y 4297.1 :w 60 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 3035 6) :y 4308.1 :w 36 :h 11]))))
           ([MAGIC :tag TD :x (/ 7393 12) :y 4284.45 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10293 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 9784 15) :y 4284.45 :w 127.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 19815 30) :y (/ 128543 30) :w 111 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 19815 30) :y 4297.1 :w 111 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 19815 30) :y 4297.1 :w 111 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 19815 30) :y 4308.1 :w 52 :h 11]))))
           ([MAGIC :tag TD :x (/ 23393 30) :y 4284.45 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10294 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 815.95 :y 4284.45 :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 824.2 :y (/ 128543 30) :w 46 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 824.2 :y 4297.1 :w 65 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 824.2 :y 4297.1 :w 65 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 824.2 :y 4308.1 :w 39 :h 11]))))
           ([MAGIC :tag TD :x 930.45 :y 4284.45 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10295 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 28999 30) :y 4284.45 :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 974.9 :y (/ 128543 30) :w 46 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 974.9 :y 4297.1 :w 73 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 974.9 :y 4297.1 :w 73 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 974.9 :y 4308.1 :w 70 :h 11]))))
           ([MAGIC :tag TD :x (/ 16217 15) :y 4284.45 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10296 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1117.3 :y 4284.45 :w 106.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 33767 30) :y (/ 128543 30) :w 43 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 33767 30) :y 4297.1 :w 72 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 33767 30) :y 4297.1 :w 41 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 33767 30) :y 4308.1 :w 72 :h 11]))))
           ([MAGIC :tag TD :x (/ 14686 12) :y 4284.45 :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10297 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1260 :y 4284.45 :w 111.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 1268.25 :y (/ 128543 30) :w 48 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 1268.25 :y 4297.1 :w 80 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 1268.25 :y 4297.1 :w 80 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 1268.25 :y 4308.1 :w 77 :h 11]))))
           ([MAGIC :tag TD :x 1371.5 :y 4284.45 :w 242.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10042 :class (navFooterDescSpacer)]))
          ([MAGIC :tag TR :x 114 :y (/ 129583 30) :w 1500 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y (/ 129583 30) :w 244.9 :h 15.6 :mt 0 :mr 0 :mb 0 :ml 0 :id e10036]
            ([TEXT :x 234.45 :y (/ 64796 15) :w 4 :h 15])))
          ([MAGIC :tag TR :x 114 :y (/ 130051 30) :w 1500 :h 36 :mt 0 :mr 0 :mb 0 :ml 0]
           ([MAGIC :tag TD :x 114 :y (/ 130051 30) :w 244.9 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10037 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 358.9 :y (/ 130051 30) :w 102.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10049 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 367.15 :y 4335.35 :w 69 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 367.15 :y 4347.7 :w 86 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 367.15 :y 4347.7 :w 70 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 367.15 :y 4358.7 :w 86 :h 11]))))
           ([MAGIC :tag TD :x 461.4 :y (/ 130051 30) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10050 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 5971 12) :y (/ 130051 30) :w 118.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10051 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 3035 6) :y 4335.35 :w 77 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 3035 6) :y 4347.7 :w 85 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 3035 6) :y 4347.7 :w 50 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 3035 6) :y 4358.7 :w 85 :h 11]))))
           ([MAGIC :tag TD :x (/ 7393 12) :y (/ 130051 30) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10052 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 9784 15) :y (/ 130051 30) :w 127.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10053 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 19815 30) :y 4335.35 :w 45 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 19815 30) :y 4347.7 :w 58 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 19815 30) :y 4347.7 :w 50 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 19815 30) :y 4358.7 :w 58 :h 11]))))
           ([MAGIC :tag TD :x (/ 23393 30) :y (/ 130051 30) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10054 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 815.95 :y (/ 130051 30) :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10055 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 824.2 :y 4335.35 :w 86 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 824.2 :y 4347.7 :w 47 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 824.2 :y 4347.7 :w 47 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 824.2 :y 4358.7 :w 45 :h 11]))))
           ([MAGIC :tag TD :x 930.45 :y (/ 130051 30) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10056 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x (/ 28999 30) :y (/ 130051 30) :w 114.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10057 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 974.9 :y 4335.35 :w 27 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 974.9 :y 4347.7 :w 66 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 974.9 :y 4347.7 :w 66 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 974.9 :y 4358.7 :w 62 :h 11]))))
           ([MAGIC :tag TD :x (/ 16217 15) :y (/ 130051 30) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10058 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1117.3 :y (/ 130051 30) :w 106.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10059 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x (/ 33767 30) :y 4335.35 :w 48 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x (/ 33767 30) :y 4347.7 :w 82 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x (/ 33767 30) :y 4347.7 :w 71 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x (/ 33767 30) :y 4358.7 :w 82 :h 11]))))
           ([MAGIC :tag TD :x (/ 14686 12) :y (/ 130051 30) :w (/ 434 12) :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10060 :class (navFooterDescSpacer)])
           ([MAGIC :tag TD :x 1260 :y (/ 130051 30) :w 111.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10061 :class (navFooterDescItem)]
            ([INLINE :tag A :class (nav_a)]
             ([TEXT :x 1268.25 :y 4335.35 :w 37 :h 12])
             ([INLINE :tag BR])
             ([MAGIC :tag SPAN :x 1268.25 :y 4347.7 :w 40 :h 22 :mt 0 :mr 0 :mb 0 :ml 0 :class (navFooterDescText)]
              ([TEXT :x 1268.25 :y 4347.7 :w 39 :h 11])
              ([INLINE :tag BR])
              ([TEXT :x 1268.25 :y 4358.7 :w 40 :h 11]))))
           ([MAGIC :tag TD :x 1371.5 :y (/ 130051 30) :w 242.5 :h 36 :mt 0 :mr 0 :mb 0 :ml 0 :id e10043 :class (navFooterDescSpacer)])))))
       ([BLOCK :tag DIV :x 122 :y 4384 :w 1484 :h 18 :class (navFooterLine navFooterLinkLine navFooterPadItemLine)]
        ([MAGIC :tag UL :x 607.2 :y 4384 :w 513.6 :h 18 :mt 0 :mr 0 :mb 0 :ml 0 :id e10082]
         ([INLINE :tag LI :class (nav_first)]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 613.8 :y 4387 :w 85 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 712 :y 4387 :w 69 :h 12])))
         ([INLINE :tag LI]
          ([INLINE :tag A :class (nav_a)]
           ([TEXT :x 794.2 :y 4387 :w 94 :h 12])))
         ([INLINE :tag LI :class (nav_last)]
          ([TEXT :x 894.8 :y 4387 :w 226 :h 12])))))
      ([BLOCK :tag DIV :x -1000000 :y -1000000 :w 1 :h 1 :id sis_pixel_r2]
       ([LINE]
        ([INLINE :tag IFRAME :id DAsis])))
      ([BLOCK :tag DIV :x 114 :y 4417 :w 1500 :h 0 :id SponsoredLinksGateway])))
    ([BLOCK :tag DIV :x 0 :y 4567 :w 0 :h 0 :id a-popover-root])
    ([BLOCK :tag DIV :x 0 :y 4567 :w 0 :h 0 :id a-popover-root]))))

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
