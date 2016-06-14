;; python get_bench.py --name alexa/wikipedia 'file:///home/pavpan/cassius/bench/alexa/wikipedia.html'

(define-header header
"")

;; From file:///home/pavpan/cassius/bench/alexa/wikipedia.html

(define-stylesheet doc-1
  ((and (class referencetooltip))
   [position absolute]
   #;[list-style-type none]
   #;[list-style-position outside]
   #;[list-style-image none]
   #;[opacity (px 0)]
   #;[font-size (px 10)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[z-index 5]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class referencetooltip)) (and (tag li)))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(8, 0, 134)]
   #;[border-right-color rgb(8, 0, 134)]
   #;[border-bottom-color rgb(8, 0, 134)]
   #;[border-left-color rgb(8, 0, 134)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[max-width (px 260)]
   [padding-top (px 10)]
   [padding-right (px 8)]
   [padding-bottom (px 13)]
   [padding-left (px 8)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[background-color rgb(247, 247, 247)]
   #;[box-shadow 2px 4px 2px rgba(0, 0, 0, 0.3)]
   [width (px 260)])
  ((".referencetooltip li + li" (or))
   [margin-left (px 7)]
   [margin-top (px -2)]
   [border-bottom-width (px 0)]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [height (px 3)]
   [width (px 0)]
   #;[background-color transparent]
   #;[box-shadow none]
   [border-top-width (px 12)]
   [border-top-style solid]
   #;[border-top-color rgb(8, 0, 134)]
   [border-right-width (px 7)]
   [border-right-style solid]
   #;[border-right-color transparent]
   [border-left-width (px 7)]
   [border-left-style solid]
   #;[border-left-color transparent])
  ((".referencetooltip > li + li::after" (or))
   #;[content ""]
   [border-top-width (px 8)]
   [border-top-style solid]
   #;[border-top-color rgb(247, 247, 247)]
   [border-right-width (px 5)]
   [border-right-style solid]
   #;[border-right-color transparent]
   [border-left-width (px 5)]
   [border-left-style solid]
   #;[border-left-color transparent]
   [margin-top (px -12)]
   [margin-left (px -5)]
   #;[z-index 1]
   [height (px 0)]
   [width (px 0)]
   [display block])
  ((desc (and (class client-js)) (and (tag body)) (and (class referencetooltip)) (and (tag li)) (and (tag li)))
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
   [height auto]
   [width auto]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [position static])
  ((and (class RTflipped))
   [padding-top (px 13)])
  ((".referencetooltip.RTflipped li + li" (or))
   [position absolute]
   [top (px 2)]
   [border-top-width (px 0)]
   [border-top-style none]
   #;[border-top-color -moz-use-text-color]
   [border-bottom-width (px 12)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(8, 0, 134)])
  ((".referencetooltip.RTflipped li + li::after" (or))
   [border-top-width (px 0)]
   [border-top-style none]
   #;[border-top-color -moz-use-text-color]
   [border-bottom-width (px 8)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(247, 247, 247)]
   [position absolute]
   [margin-top (px 7)])
  ((and (class RTsettings))
   [float right]
   [height (px 24)]
   [width (px 24)]
   #;[cursor pointer]
   #;[background-image linear-gradient(transparent, transparent), url("//upload.wikimedia.org/wikipedia/commons/7/77/Gear_icon.svg")]
   [margin-top (px -9)]
   [margin-right (px -7)]
   #;[transition-property opacity]
   #;[transition-duration 0.15s]
   #;[transition-timing-function ease]
   #;[transition-delay (px 0)]
   #;[opacity 0.6])
  ((and (class RTTarget))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(8, 0, 134)]
   #;[border-right-color rgb(8, 0, 134)]
   #;[border-bottom-color rgb(8, 0, 134)]
   #;[border-left-color rgb(8, 0, 134)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((or (and (id mw-wlheader-showupdated)) (and (id mw-wlheader-bold)) (and (id mw-wlheader-green)) (and (id mw-watchlist-resetbutton)))
   [display none])
  ((or (and (id mw-wlheader-showupdated)) (and (id mw-wlheader-green)))
   [display inline])
  ((and (id mw-watchlist-resetbutton))
   [display block])
  ((and (class wp-teahouse-question-form))
   [position absolute]
   [margin-left auto]
   [margin-right auto]
   #;[background-color rgb(244, 243, 240)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(167, 215, 249)]
   #;[border-right-color rgb(167, 215, 249)]
   #;[border-bottom-color rgb(167, 215, 249)]
   #;[border-left-color rgb(167, 215, 249)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [padding-top 1em]
   [padding-right 1em]
   [padding-bottom 1em]
   [padding-left 1em])
  ((and (id wp-th-question-ask))
   [float right])
  ((and (class wp-teahouse-respond-form))
   [position absolute]
   [margin-left auto]
   [margin-right auto]
   #;[background-color rgb(244, 243, 240)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(167, 215, 249)]
   #;[border-right-color rgb(167, 215, 249)]
   #;[border-bottom-color rgb(167, 215, 249)]
   #;[border-left-color rgb(167, 215, 249)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [padding-top 1em]
   [padding-right 1em]
   [padding-bottom 1em]
   [padding-left 1em])
  ((and (class wp-th-respond))
   [float right])
  ((or (and (class mediaContainer)) (and (class PopUpMediaTransform)))
   [position relative]
   [display block])
  ((or (desc (and (class thumb)) (and (class mediaContainer))) (desc (and (class thumb)) (and (class PopUpMediaTransform))))
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto])
  ((desc (and (class client-nojs)) (and (id pt-uls)))
   [display none])
  ((or (desc (and (class client-nojs)) (and (id ca-ve-edit))) (desc (and (class client-nojs)) (and (class mw-editsection-divider))) (desc (and (class client-nojs)) (and (class mw-editsection-visualeditor))) (desc (and (class ve-not-available)) (and (id ca-ve-edit))) (desc (and (class ve-not-available)) (and (class mw-editsection-divider))) (desc (and (class ve-not-available)) (and (class mw-editsection-visualeditor))))
   [display none])
  ((".client-js .mw-content-ltr .mw-editsection-bracket:first-of-type, .client-js .mw-content-rtl .mw-editsection-bracket:not(:first-of-type)" (or (id e10001) (id e10002) (id e10003) (id e10004) (id e10005) (id e10006) (id e10007) (id e10008) (id e10009) (id e10010) (id e10011) (id e10012)))
   [margin-right (px 3.25)]
   #;[color rgb(85, 85, 85)])
  ((".client-js .mw-content-rtl .mw-editsection-bracket:first-of-type, .client-js .mw-content-ltr .mw-editsection-bracket:not(:first-of-type)" (or (id e10013) (id e10014) (id e10015) (id e10016) (id e10017) (id e10018) (id e10019) (id e10020) (id e10021) (id e10022) (id e10023) (id e10024)))
   [margin-left (px 3.25)]
   #;[color rgb(85, 85, 85)])
  ((and (tag wbr))
   [display inline-block])
  (("abbr[title], .explain[title]" (or (id e10025) (id e10026) (id e10027)))
   [border-bottom-width (px 1)]
   [border-bottom-style dotted]
   #;[border-bottom-color -moz-use-text-color]
   #;[cursor help])
  ((and (id wikiPreview) (class ontop))
   [margin-bottom 1em])
  ((and (tag div) (class patrollink))
   #;[font-size (% 75)]
   [text-align right])
  ((and (tag td) (class mw-label))
   [text-align right])
  ((and (tag td) (class mw-input))
   [text-align left])
  ((and (tag td) (class mw-submit))
   [text-align left])
  ((and (tag input) (id wpSummary))
   [width (% 80)]
   [margin-bottom 1em])
  ((desc (and (class mw-content-ltr)) (and (class thumbcaption)))
   [text-align left])
  ((desc (and (class mw-content-ltr)) (and (class magnify)))
   [float right])
  ((desc (and (class mw-content-rtl)) (and (class thumbcaption)))
   [text-align right])
  ((desc (and (class mw-content-rtl)) (and (class magnify)))
   [float left])
  ((and (id catlinks))
   [text-align left])
  ((desc (and (class catlinks)) (and (tag ul)))
   [display inline]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[list-style-position outside]
   #;[list-style-type none]
   #;[list-style-image none])
  ((desc (and (class catlinks)) (and (tag li)))
   [display inline-block]
   #;[line-height (px 17.5)]
   [border-left-width (px 1)]
   [border-left-style solid]
   #;[border-left-color rgb(170, 170, 170)]
   [margin-top (px 1.75)]
   [margin-right (px 0)]
   [margin-bottom (px 1.75)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 7)]
   [padding-bottom (px 0)]
   [padding-left (px 7)])
  ((".catlinks li:first-child" (or (id e10028) (id e10029)))
   [padding-left (px 3.5)]
   [border-left-width medium]
   [border-left-style none]
   #;[border-left-color -moz-use-text-color])
  ((and (class mw-hidden-cats-hidden))
   [display none])
  ((and (class catlinks-allhidden))
   [display none])
  ((or (and (tag p) (class mw-protect-editreasons)) (and (tag p) (class mw-filedelete-editreasons)) (and (tag p) (class mw-delete-editreasons)))
   #;[font-size (% 90)]
   [text-align right])
  ((desc (and (id pagehistory)) (and (class history-user)))
   [margin-left 0.4em]
   [margin-right 0.2em])
  ((desc (and (id pagehistory)) (and (tag li)))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color white]
   #;[border-right-color white]
   #;[border-bottom-color white]
   #;[border-left-color white]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((desc (and (id pagehistory)) (and (tag li) (class selected)))
   #;[background-color rgb(249, 249, 249)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style dashed]
   [border-right-style dashed]
   [border-bottom-style dashed]
   [border-left-style dashed]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (class mw-history-revisionactions))
   [float right])
  ((and (tag div) (class mw-warning-with-logexcerpt))
   [padding-top (px 3)]
   [padding-right (px 3)]
   [padding-bottom (px 3)]
   [padding-left (px 3)]
   [margin-bottom (px 3)]
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(47, 111, 171)]
   #;[border-right-color rgb(47, 111, 171)]
   #;[border-bottom-color rgb(47, 111, 171)]
   #;[border-left-color rgb(47, 111, 171)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[clear both])
  ((or (and (tag td) (class mw-revdel-checkbox)) (and (tag th) (class mw-revdel-checkbox)))
   [padding-right (px 10)]
   [text-align center])
  ((desc (and (class plainlinks)) (and (tag a) (class external)))
   #;[background-color transparent]
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
   [padding-left (px 0)])
  ((and (tag table) (class wikitable))
   [margin-top (px 13.3)]
   [margin-right (px 0)]
   [margin-bottom (px 13.3)]
   [margin-left (px 0)]
   #;[background-color rgb(249, 249, 249)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-collapse collapse]
   #;[color black])
  ((or (child (and (tag table) (class wikitable)) (and (tag tr)) (and (tag th))) (child (and (tag table) (class wikitable)) (and (tag tr)) (and (tag td))) (child (and (tag table) (class wikitable)) (and *) (and (tag tr)) (and (tag th))) (child (and (tag table) (class wikitable)) (and *) (and (tag tr)) (and (tag td))))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [padding-top (px (/ 8 3))]
   [padding-right (px 5.3)]
   [padding-bottom (px (/ 8 3))]
   [padding-left (px 5.3)])
  ((or (child (and (tag table) (class wikitable)) (and (tag tr)) (and (tag th))) (child (and (tag table) (class wikitable)) (and *) (and (tag tr)) (and (tag th))))
   #;[background-color rgb(242, 242, 242)]
   [text-align center])
  ((or (and (class errorbox)) (and (class warningbox)) (and (class successbox)))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color -moz-use-text-color]
   #;[border-right-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [padding-top 0.5em]
   [padding-right 1em]
   [padding-bottom 0.5em]
   [padding-left 1em]
   [margin-bottom 1em]
   [display inline-block])
  ((or (desc (and (class errorbox)) (and (tag h2))) (desc (and (class warningbox)) (and (tag h2))) (desc (and (class successbox)) (and (tag h2))))
   #;[font-size 1em]
   #;[color inherit]
   #;[font-weight bold]
   [display inline]
   [margin-top (px 0)]
   [margin-right 0.5em]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
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
  ((and (class mw-infobox))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(255, 127, 0)]
   #;[border-right-color rgb(255, 127, 0)]
   #;[border-bottom-color rgb(255, 127, 0)]
   #;[border-left-color rgb(255, 127, 0)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [margin-top 0.5em]
   [margin-right 0.5em]
   [margin-bottom 0.5em]
   [margin-left 0.5em]
   #;[clear left]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class mw-infobox-left))
   [margin-top (px 7)]
   [margin-right (px 7)]
   [margin-bottom (px 7)]
   [margin-left (px 7)]
   [float left]
   [width (px 35)])
  ((and (class mw-infobox-right))
   [margin-top 0.5em]
   [margin-right 0.5em]
   [margin-bottom 0.5em]
   [margin-left (px 49)])
  ((and (class previewnote))
   #;[color rgb(204, 0, 0)]
   [margin-bottom 1em])
  ((desc (and (class previewnote)) (and (tag p)))
   #;[text-indent 3em]
   [margin-top 0.8em]
   [margin-right (px 0)]
   [margin-bottom 0.8em]
   [margin-left (px 0)])
  ((or (and (class mw-datatable)) (desc (and (class mw-datatable)) (and (tag td))) (desc (and (class mw-datatable)) (and (tag th))))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [padding-top (px 0)]
   [padding-right 0.15em]
   [padding-bottom (px 0)]
   [padding-left 0.15em])
  ((and (tag table) (class mw_metadata))
   #;[font-size 0.8em]
   [margin-left 0.5em]
   [margin-bottom 0.5em]
   [width (px 400)])
  ((desc (and (tag table) (class mw_metadata)) (and (tag td)))
   [padding-top 0.1em]
   [padding-right 0.1em]
   [padding-bottom 0.1em]
   [padding-left 0.1em])
  ((and (tag table) (class mw_metadata))
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
   #;[border-collapse collapse])
  ((or (desc (and (tag table) (class mw_metadata)) (and (tag td))) (desc (and (tag table) (class mw_metadata)) (and (tag th))))
   [text-align center]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [padding-left (px 5)]
   [padding-right (px 5)])
  ((desc (and (tag table) (class mw_metadata)) (and (tag ul) (class metadata-langlist)))
   #;[list-style-type none]
   #;[list-style-image none]
   [padding-right (px 5)]
   [padding-left (px 5)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((or (desc (and (class mw-content-ltr)) (and (tag ul))) (desc (and (class mw-content-rtl)) (and (class mw-content-ltr)) (and (tag ul))))
   [margin-top 0.3em]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 20)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((or (desc (and (class mw-content-rtl)) (and (tag ul))) (desc (and (class mw-content-ltr)) (and (class mw-content-rtl)) (and (tag ul))))
   [margin-top 0.3em]
   [margin-right 1.6em]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((or (desc (and (class mw-content-ltr)) (and (tag ol))) (desc (and (class mw-content-rtl)) (and (class mw-content-ltr)) (and (tag ol))))
   [margin-top (px (/ 113 30))]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 40.3)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((or (desc (and (class mw-content-rtl)) (and (tag ol))) (desc (and (class mw-content-ltr)) (and (class mw-content-rtl)) (and (tag ol))))
   [margin-top 0.3em]
   [margin-right 3.2em]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((or (desc (and (class mw-content-ltr)) (and (tag dd))) (desc (and (class mw-content-rtl)) (and (class mw-content-ltr)) (and (tag dd))))
   [margin-left (px 22.4)]
   [margin-right (px 0)])
  ((or (desc (and (class mw-content-rtl)) (and (tag dd))) (desc (and (class mw-content-ltr)) (and (class mw-content-rtl)) (and (tag dd))))
   [margin-right 1.6em]
   [margin-left (px 0)])
  ((and (class mw-ajax-loader))
   #;[background-image url("//en.wikipedia.org/static/1.27.0-wmf.12/resources/src/mediawiki.legacy/images/ajax-loader.gif?57f34")]
   #;[background-position center center]
   #;[background-repeat no-repeat]
   [padding-top (px 16)]
   [padding-right (px 16)]
   [padding-bottom (px 16)]
   [padding-left (px 16)]
   [position relative]
   [top (px -16)])
  ((and (class mw-small-spinner))
   [padding-top (px 10)]
   [padding-right (px 10)]
   [padding-bottom (px 10)]
   [padding-left (px 10)]
   [margin-right 0.6em]
   #;[background-image url("//en.wikipedia.org/static/1.27.0-wmf.12/resources/src/mediawiki.legacy/images/spinner.gif?ca65b")]
   #;[background-position center center]
   #;[background-repeat no-repeat])
  ((or (desc (and (id toc)) (and (tag ul))) (desc (and (class toc)) (and (tag ul))))
   [margin-top (px 4)]
   [margin-right (px 0)]
   [margin-bottom (px 4)]
   [margin-left (px 0)])
  ((or (desc (and (class mw-content-ltr)) (and (class toc)) (and (tag ul))) (desc (and (class mw-content-ltr)) (and (id toc)) (and (tag ul))) (desc (and (class mw-content-rtl)) (and (class mw-content-ltr)) (and (class toc)) (and (tag ul))) (desc (and (class mw-content-rtl)) (and (class mw-content-ltr)) (and (id toc)) (and (tag ul))))
   [text-align left])
  ((or (desc (and (class mw-content-rtl)) (and (class toc)) (and (tag ul))) (desc (and (class mw-content-rtl)) (and (id toc)) (and (tag ul))) (desc (and (class mw-content-ltr)) (and (class mw-content-rtl)) (and (class toc)) (and (tag ul))) (desc (and (class mw-content-ltr)) (and (class mw-content-rtl)) (and (id toc)) (and (tag ul))))
   [text-align right])
  ((or (desc (and (class mw-content-ltr)) (and (class toc)) (and (tag ul)) (and (tag ul))) (desc (and (class mw-content-ltr)) (and (id toc)) (and (tag ul)) (and (tag ul))) (desc (and (class mw-content-rtl)) (and (class mw-content-ltr)) (and (class toc)) (and (tag ul)) (and (tag ul))) (desc (and (class mw-content-rtl)) (and (class mw-content-ltr)) (and (id toc)) (and (tag ul)) (and (tag ul))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left 2em])
  ((or (desc (and (class mw-content-rtl)) (and (class toc)) (and (tag ul)) (and (tag ul))) (desc (and (class mw-content-rtl)) (and (id toc)) (and (tag ul)) (and (tag ul))) (desc (and (class mw-content-ltr)) (and (class mw-content-rtl)) (and (class toc)) (and (tag ul)) (and (tag ul))) (desc (and (class mw-content-ltr)) (and (class mw-content-rtl)) (and (id toc)) (and (tag ul)) (and (tag ul))))
   [margin-top (px 0)]
   [margin-right 2em]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (class mw-help-field-hint))
   [display none]
   [margin-left (px 2)]
   [margin-bottom (px -8)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 15)]
   #;[background-image url("//en.wikipedia.org/static/1.27.0-wmf.12/resources/src/mediawiki.legacy/images/help-question.gif?346d8")]
   #;[background-position left center]
   #;[background-repeat no-repeat]
   #;[cursor pointer]
   #;[font-size 0.8em]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line underline]
   #;[text-decoration-style solid]
   #;[color rgb(6, 69, 173)])
  ((and (class mw-help-field-data))
   [display block]
   #;[background-color rgb(214, 243, 255)]
   [padding-top (px 5)]
   [padding-right (px 8)]
   [padding-bottom (px 4)]
   [padding-left (px 8)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(93, 201, 244)]
   #;[border-right-color rgb(93, 201, 244)]
   #;[border-bottom-color rgb(93, 201, 244)]
   #;[border-left-color rgb(93, 201, 244)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [margin-left (px 20)])
  ((or (and (id mw-revision-info)) (and (id mw-revision-info-current)) (and (id mw-revision-nav)))
   #;[direction ltr]
   [display inline])
  ((or (and (tag div) (class tright)) (and (tag div) (class floatright)) (and (tag table) (class floatright)))
   #;[clear right]
   [float right])
  ((or (and (tag div) (class tleft)) (and (tag div) (class floatleft)) (and (tag table) (class floatleft)))
   [float left]
   #;[clear left])
  ((or (and (tag div) (class floatright)) (and (tag table) (class floatright)) (and (tag div) (class floatleft)) (and (tag table) (class floatleft)))
   [position relative])
  ((or (and (class mw-jump)) (and (id jump-to-nav)))
   [overflow-x hidden]
   [overflow-y hidden]
   [height (px 0)])
  ((and (class printfooter))
   [display none])
  ((and (class xdebug-error))
   [position absolute]
   #;[z-index 99])
  ((or (and (class mw-editsection)) (and (class mw-editsection-like)))
   #;[font-size small]
   #;[font-weight normal]
   [margin-left (px 13)]
   #;[vertical-align baseline]
   #;[line-height (px 13)]
   [display inline-block])
  ((or (desc (and (class mw-content-ltr)) (and (class mw-editsection))) (desc (and (class mw-content-rtl)) (and (class mw-content-ltr)) (and (class mw-editsection))))
   [margin-left (px 13)])
  ((or (desc (and (class mw-content-rtl)) (and (class mw-editsection))) (desc (and (class mw-content-ltr)) (and (class mw-content-rtl)) (and (class mw-editsection))))
   [margin-right 1em])
  ((and (class mw-empty-li))
   [display none])
  ((and (class mw-headline-anchor))
   [display none])
  ((and (class mw-headline-anchor))
   [margin-left (px -16)]
   [width (px 16)])
  ((or (desc (and (class mw-content-ltr)) (and (class mw-headline-anchor))) (desc (and (class mw-content-rtl)) (and (class mw-content-ltr)) (and (class mw-headline-anchor))))
   [margin-left (px -16)]
   [margin-right (px 0)])
  ((or (desc (and (class mw-content-rtl)) (and (class mw-headline-anchor))) (desc (and (class mw-content-ltr)) (and (class mw-content-rtl)) (and (class mw-headline-anchor))))
   [margin-left (px 0)]
   [margin-right (px -16)])
  ((and (class mw-headline-anchor))
   [margin-left (px -20)]
   [width (px 20)])
  ((or (desc (and (class mw-content-ltr)) (and (class mw-headline-anchor))) (desc (and (class mw-content-rtl)) (and (class mw-content-ltr)) (and (class mw-headline-anchor))))
   [margin-left (px -20)]
   [margin-right (px 0)])
  ((or (desc (and (class mw-content-rtl)) (and (class mw-headline-anchor))) (desc (and (class mw-content-ltr)) (and (class mw-content-rtl)) (and (class mw-headline-anchor))))
   [margin-left (px 0)]
   [margin-right (px -20)])
  ((and (tag img))
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
   #;[vertical-align middle])
  ((and (tag hr))
   [height (px 1)]
   #;[color rgb(170, 170, 170)]
   #;[background-color rgb(170, 170, 170)]
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
   [margin-top 0.2em]
   [margin-right (px 0)]
   [margin-bottom 0.2em]
   [margin-left (px 0)])
  ((or (and (tag h1)) (and (tag h2)) (and (tag h3)) (and (tag h4)) (and (tag h5)) (and (tag h6)))
   #;[color black]
   #;[background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[font-weight normal]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   [padding-top 0.5em]
   [padding-bottom (px 4.9)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(170, 170, 170)])
  ((or (and (tag h3)) (and (tag h4)) (and (tag h5)) (and (tag h6)))
   [border-bottom-width medium]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color]
   #;[font-weight bold])
  ((or (and (tag h1)) (and (tag h2)))
   [margin-bottom 0.6em])
  ((or (and (tag h3)) (and (tag h4)) (and (tag h5)))
   [margin-bottom 0.3em])
  ((and (tag p))
   [margin-top (px 5.6)]
   [margin-right (px 0)]
   [margin-bottom (px 7)]
   [margin-left (px 0)])
  ((desc (and (tag p)) (and (tag img)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (tag ul))
   #;[list-style-type square]
   [margin-top 0.3em]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 20)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (tag ol))
   [margin-top (px (/ 113 30))]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 40.3)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[list-style-image none])
  ((and (tag li))
   [margin-bottom 0.1em])
  ((and (tag dt))
   #;[font-weight bold]
   [margin-bottom (px 1.4)])
  ((and (tag dl))
   [margin-top (px 2.8)]
   [margin-bottom (px 7)])
  ((and (tag dd))
   [margin-left (px 22.4)]
   [margin-bottom (px 1.4)])
  ((and (tag code))
   #;[color black]
   #;[background-color rgb(249, 249, 249)]
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
   #;[border-top-left-radius (px 2)]
   #;[border-top-right-radius (px 2)]
   #;[border-bottom-right-radius (px 2)]
   #;[border-bottom-left-radius (px 2)]
   [padding-top (px 1)]
   [padding-right (px 4)]
   [padding-bottom (px 1)]
   [padding-left (px 4)])
  ((or (and (tag pre)) (and (class mw-code)))
   #;[color black]
   #;[background-color rgb(249, 249, 249)]
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
   [padding-top 1em]
   [padding-right 1em]
   [padding-bottom 1em]
   [padding-left 1em]
   #;[white-space pre-wrap])
  ((and (tag fieldset))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(47, 111, 171)]
   #;[border-right-color rgb(47, 111, 171)]
   #;[border-bottom-color rgb(47, 111, 171)]
   #;[border-left-color rgb(47, 111, 171)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [margin-top 1em]
   [margin-right (px 0)]
   [margin-bottom 1em]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right 1em]
   [padding-bottom 1em]
   [padding-left 1em])
  ((and (tag fieldset) (class nested))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom 0.5em]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right 0.5em]
   [padding-bottom 0.5em]
   [padding-left 0.5em])
  ((and (tag legend))
   [padding-top 0.5em]
   [padding-right 0.5em]
   [padding-bottom 0.5em]
   [padding-left 0.5em]
   #;[font-size (% 95)])
  ((and (tag form))
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
  ((and (tag textarea))
   [width (% 100)]
   [padding-top 0.1em]
   [padding-right 0.1em]
   [padding-bottom 0.1em]
   [padding-left 0.1em]
   [display block]
   [box-sizing border-box])
  ((and (class center))
   [width (% 100)]
   [text-align center])
  ((desc (and (class center)) (and *))
   [margin-left auto]
   [margin-right auto])
  ((or (and (id toc)) (and (class toc)) (and (class mw-warning)) (and (class toccolours)))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(249, 249, 249)]
   [padding-top (px 5)]
   [padding-right (px 5)]
   [padding-bottom (px 5)]
   [padding-left (px 5)]
   #;[font-size (% 95)])
  ((or (and (id toc)) (and (class toc)))
   [display table]
   [padding-top (px 7)]
   [padding-right (px 7)]
   [padding-bottom (px 7)]
   [padding-left (px 7)])
  ((or (desc (and (tag table) (id toc)) (and (tag td))) (desc (and (tag table) (class toc)) (and (tag td))))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((or (desc (and (id toc)) (and (tag h2))) (desc (and (class toc)) (and (tag h2))))
   [display inline]
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
   #;[font-size (% 100)]
   #;[font-weight bold])
  ((or (desc (and (id toc)) (and (id toctitle))) (desc (and (class toc)) (and (id toctitle))) (desc (and (id toc)) (and (class toctitle))) (desc (and (class toc)) (and (class toctitle))))
   [text-align center])
  ((or (desc (and (id toc)) (and (tag ul))) (desc (and (class toc)) (and (tag ul))))
   #;[list-style-type none]
   #;[list-style-image none]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [text-align left])
  ((or (desc (and (id toc)) (and (tag ul)) (and (tag ul))) (desc (and (class toc)) (and (tag ul)) (and (tag ul))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left 2em])
  ((or (and (class tocnumber)) (and (class toctext)))
   [display table-cell]
   #;[text-decoration-color inherit]
   #;[text-decoration-line inherit]
   #;[text-decoration-style inherit])
  ((".tocnumber::after" (or))
   #;[content ""]
   [display inline-block]
   [width 0.5em])
  ((and (class mw-warning))
   [margin-left (px 50)]
   [margin-right (px 50)]
   [text-align center])
  ((or (and (tag div) (class floatright)) (and (tag table) (class floatright)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom 0.5em]
   [margin-left 0.5em]
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
  ((or (and (tag div) (class floatleft)) (and (tag table) (class floatleft)))
   [margin-top (px 0)]
   [margin-right 0.5em]
   [margin-bottom 0.5em]
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
   #;[border-image-repeat stretch stretch])
  ((and (tag div) (class thumb))
   [margin-bottom (px 7)]
   [width auto]
   #;[background-color transparent])
  ((and (tag div) (class thumbinner))
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
   [padding-top (px 3)]
   [padding-right (px 3)]
   [padding-bottom (px 3)]
   [padding-left (px 3)]
   #;[background-color rgb(249, 249, 249)]
   #;[font-size (% 94)]
   [text-align center]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (tag html)) (and (class thumbimage)))
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
   #;[border-image-repeat stretch stretch])
  ((desc (and (tag html)) (and (class thumbcaption)))
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
   #;[line-height (px (/ 52 3))]
   [padding-top (px 3)]
   [padding-right (px 3)]
   [padding-bottom (px 3)]
   [padding-left (px 3)]
   #;[font-size (% 94)]
   [text-align left])
  ((and (tag div) (class magnify))
   [float right]
   [margin-left (px 3)])
  ((desc (and (tag div) (class magnify)) (and (tag a)))
   [display block]
   #;[text-indent (px 15)]
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden]
   [width (px 15)]
   [height (px 11)]
   #;[background-image linear-gradient(transparent, transparent), url("data:image/svg+xml,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%20standalone%3D%22no%22%3F%3E%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2011%2015%22%20width%3D%2215%22%20height%3D%2211%22%3E%0A%20%20%20%20%3Cg%20id%3D%22magnify-clip%22%20fill%3D%22%23fff%22%20stroke%3D%22%23000%22%3E%0A%20%20%20%20%20%20%20%20%3Cpath%20id%3D%22bigbox%22%20d%3D%22M1.509%201.865h10.99v7.919h-10.99z%22%2F%3E%0A%20%20%20%20%20%20%20%20%3Cpath%20id%3D%22smallbox%22%20d%3D%22M-1.499%206.868h5.943v4.904h-5.943z%22%2F%3E%0A%20%20%20%20%3C%2Fg%3E%0A%3C%2Fsvg%3E%0A")])
  ((and (tag img) (class thumbborder))
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
   #;[border-image-repeat stretch stretch])
  ((desc (and (class mw-content-ltr)) (and (class thumbcaption)))
   [text-align left])
  ((desc (and (class mw-content-ltr)) (and (class magnify)))
   [float right]
   [margin-left (px 3)]
   [margin-right (px 0)])
  ((desc (and (class mw-content-rtl)) (and (class thumbcaption)))
   [text-align right])
  ((desc (and (class mw-content-rtl)) (and (class magnify)))
   [float left]
   [margin-left (px 0)]
   [margin-right (px 3)])
  ((and (tag div) (class tright))
   [margin-top (px 7)]
   [margin-right (px 0)]
   [margin-bottom (px 18.2)]
   [margin-left (px 19.6)])
  ((and (tag div) (class tleft))
   [margin-top 0.5em]
   [margin-right 1.4em]
   [margin-bottom 1.3em]
   [margin-left (px 0)])
  ((".client-js table.sortable th:not(.unsortable)" (or))
   #;[background-image linear-gradient(transparent, transparent), url("data:image/svg+xml,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%3F%3E%0A%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2021%209%22%20height%3D%229%22%20width%3D%2221%22%3E%0A%20%20%20%20%3Cpath%20d%3D%22M14.5%205l-4%204-4-4zM14.5%204l-4-4-4%204z%22%20style%3D%22fill-opacity%3A%200.5%3B%22%2F%3E%0A%3C%2Fsvg%3E%0A")]
   #;[background-repeat no-repeat]
   #;[background-position right center]
   [padding-right (px 21)])
  ((and (class catlinks))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(249, 249, 249)]
   [padding-top (px 5)]
   [padding-right (px 5)]
   [padding-bottom (px 5)]
   [padding-left (px 5)]
   [margin-top (px 14)]
   #;[clear both])
  ((and (class editOptions))
   #;[background-color rgb(240, 240, 240)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-right-color silver]
   #;[border-bottom-color silver]
   #;[border-left-color silver]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-top-width medium]
   [border-top-style none]
   #;[border-top-color -moz-use-text-color]
   [padding-top 1em]
   [padding-right 1em]
   [padding-bottom 1.5em]
   [padding-left 1em]
   [margin-bottom 2em])
  ((and (class usermessage))
   #;[background-color rgb(255, 206, 123)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(255, 165, 0)]
   #;[border-right-color rgb(255, 165, 0)]
   #;[border-bottom-color rgb(255, 165, 0)]
   #;[border-left-color rgb(255, 165, 0)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[color black]
   #;[font-weight bold]
   [margin-top 2em]
   [margin-right (px 0)]
   [margin-bottom 1em]
   [margin-left (px 0)]
   [padding-top 0.5em]
   [padding-right 1em]
   [padding-bottom 0.5em]
   [padding-left 1em]
   #;[vertical-align middle])
  ((and (id siteNotice))
   [position relative]
   [text-align center]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (id localNotice))
   [margin-bottom 0.9em])
  ((and (class firstHeading))
   [margin-bottom (px 2.9)]
   #;[line-height (px (/ 1037 30))]
   [padding-bottom (px 0)])
  ((and (id siteSub))
   [display none])
  ((and (id jump-to-nav))
   [margin-top (px -19.6)]
   [margin-bottom (px 19.6)])
  ((or (and (id contentSub)) (and (id contentSub2)))
   #;[font-size (% 84)]
   #;[line-height (px 14.1)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px (/ 247 15))]
   [margin-left (px (/ 353 30))]
   #;[color rgb(84, 84, 84)]
   [width auto])
  ((and (tag span) (class subpages))
   [display block])
  ((or (and (tag html)) (and (tag body)))
   [height (% 100)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[font-family sans-serif])
  ((and (class mw-body))
   [margin-left (px 160)]
   [padding-top (px 16)]
   [padding-right (px 16)]
   [padding-bottom (px 16)]
   [padding-left (px 16)]
   [border-top-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(167, 215, 249)]
   #;[border-right-color rgb(167, 215, 249)]
   #;[border-bottom-color rgb(167, 215, 249)]
   #;[border-left-color rgb(167, 215, 249)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-right-width (px 0)]
   [margin-top (px -1)]
   #;[background-color rgb(255, 255, 255)]
   #;[color rgb(37, 37, 37)]
   #;[direction ltr])
  ((desc (and (class mw-body)) (and (tag p)))
   #;[line-height inherit]
   [margin-top (px 7)]
   [margin-right (px 0)]
   [margin-bottom (px 7)]
   [margin-left (px 0)])
  ((or (desc (and (class mw-body)) (and (tag h1))) (desc (and (class mw-body)) (and (tag h2))))
   #;[font-family "Linux Libertine",Georgia,Times,serif]
   #;[line-height 1.3]
   [margin-bottom 0.25em]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class mw-body)) (and (class mw-body-content)) (and (tag h1)))
   [margin-top 1em])
  ((desc (and (class mw-body)) (and (tag h2)))
   #;[font-size 1.5em]
   [margin-top (px 13.3)])
  ((or (desc (and (class mw-body)) (and (tag h3))) (desc (and (class mw-body)) (and (tag h4))) (desc (and (class mw-body)) (and (tag h5))) (desc (and (class mw-body)) (and (tag h6))))
   #;[line-height 1.6]
   [margin-top 0.3em]
   [margin-bottom (px 0)]
   [padding-bottom (px 0)])
  ((desc (and (class mw-body)) (and (class firstHeading)))
   [overflow-x visible]
   [overflow-y visible])
  ((desc (and (class mw-body)) (and (class mw-indicators)))
   [float right]
   #;[line-height 1.6]
   #;[font-size (px 12.25)]
   [position relative]
   #;[z-index 1])
  ((desc (and (class mw-body)) (and (class mw-indicator)))
   [display inline-block])
  ((and (tag div) (class emptyPortlet))
   [display none])
  ((desc (and (class redirectMsg)) (and (tag p)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (class mw-body-content))
   [position relative]
   #;[line-height 1.6]
   #;[font-size (px 12.25)]
   #;[z-index (px 0)])
  ((and (id p-personal))
   [position absolute]
   [top (px 5)]
   [right (px 12)]
   #;[z-index 100])
  ((desc (and (id p-personal)) (and (tag h3)))
   [display none])
  ((desc (and (id p-personal)) (and (tag ul)))
   #;[list-style-type none]
   #;[list-style-image none]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-left (px 160)])
  ((desc (and (id p-personal)) (and (tag li)))
   #;[line-height (px 13.5)]
   [float left]
   [margin-left (px 9)]
   [margin-top (px 6)]
   #;[font-size (px 9)]
   #;[white-space nowrap])
  ((or (and (id pt-userpage)) (and (id pt-anonuserpage)))
   #;[background-position left top]
   #;[background-repeat no-repeat]
   #;[background-image linear-gradient(transparent, transparent), url("data:image/svg+xml,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22utf-8%22%3F%3E%0A%3C%21DOCTYPE%20svg%20PUBLIC%20%22-%2F%2FW3C%2F%2FDTD%20SVG%201.1%2F%2FEN%22%20%22http%3A%2F%2Fwww.w3.org%2FGraphics%2FSVG%2F1.1%2FDTD%2Fsvg11.dtd%22%3E%0A%3Csvg%20version%3D%221.1%22%20id%3D%22Layer_1%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%20x%3D%220px%22%20y%3D%220px%22%0A%09%20width%3D%2212px%22%20height%3D%2213.836px%22%20viewBox%3D%220%200%2012%2013.836%22%20enable-background%3D%22new%200%200%2012%2013.836%22%20xml%3Aspace%3D%22preserve%22%3E%0A%3Cpath%20fill%3D%22%23777777%22%20d%3D%22M1.938%2C6.656c-1.32%2C1.485-1.47%2C3.15-0.97%2C4.25c0.323%2C0.707%2C0.78%2C1.127%2C1.313%2C1.375%0A%09c0.496%2C0.229%2C1.074%2C0.273%2C1.658%2C0.282c0.023%2C0%2C0.04%2C0.03%2C0.062%2C0.03h4.187c0.61%2C0%2C1.225-0.125%2C1.75-0.405%0A%09c0.527-0.28%2C0.961-0.718%2C1.188-1.376c0.335-0.964%2C0.175-2.529-1.094-4.03C9.094%2C7.954%2C7.68%2C8.719%2C6.065%2C8.719%0A%09c-1.677%2C0-3.182-0.812-4.125-2.063H1.938z%22%2F%3E%0A%3Cpath%20fill%3D%22%23777777%22%20d%3D%22M6.063%2C0c-1.89%2C0-3.595%2C1.674-3.594%2C3.563C2.467%2C5.45%2C4.173%2C7.155%2C6.06%2C7.155%0A%09c1.89%2C0%2C3.564-1.705%2C3.563-3.593C9.625%2C1.673%2C7.95%2C0%2C6.063%2C0L6.063%2C0z%22%2F%3E%0A%3C%2Fsvg%3E%0A")]
   [padding-left (px 15)])
  ((and (id p-search))
   [float left]
   [margin-right (px 8)]
   [margin-left (px 8)])
  ((desc (and (id p-search)) (and (tag h3)))
   [display none])
  ((or (desc (and (id p-search)) (and (tag form))) (desc (and (id p-search)) (and (tag input))))
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [margin-top 0.4em])
  ((and (tag div) (id simpleSearch))
   [display block]
   [width (px 320)]
   #;[min-width (px 80)]
   #;[max-width (px 320)]
   [padding-right (px 22.4)]
   [height (px 22.4)]
   [margin-top (px 10.4)]
   [position relative]
   #;[min-height (px 1)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[color black]
   #;[background-color white]
   #;[background-image url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAQCAIAAABY/YLgAAAAJUlEQVQIHQXBsQEAAAjDoND/73UWdnerhmHVsDQZJrNWVg3Dqge6bgMe6bejNAAAAABJRU5ErkJggg==")]
   #;[background-position left top]
   #;[background-repeat repeat-x])
  ((desc (and (tag div) (id simpleSearch)) (and (tag input)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
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
   #;[background-color transparent]
   #;[color black])
  ((desc (and (tag div) (id simpleSearch)) (and (id searchInput)))
   [width (% 100)]
   [padding-top (px 2.6)]
   [padding-right (px 0)]
   [padding-bottom (px 2.6)]
   [padding-left (px 2.6)]
   #;[font-size (px 13)]
   #;[direction ltr])
  ((or (desc (and (tag div) (id simpleSearch)) (and (id searchButton))) (desc (and (tag div) (id simpleSearch)) (and (id mw-searchButton))))
   [position absolute]
   [top (px 0)]
   [right (px 0)]
   [width (px 22.9)]
   [height (% 100)]
   #;[cursor pointer]
   #;[text-indent (px -99999)]
   #;[line-height 1]
   #;[direction ltr]
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[background-image linear-gradient(transparent, transparent), url("data:image/svg+xml,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%3F%3E%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2212%22%20height%3D%2213%22%3E%3Cg%20stroke-width%3D%222%22%20stroke%3D%22%236c6c6c%22%20fill%3D%22none%22%3E%3Cpath%20d%3D%22M11.29%2011.71l-4-4%22%2F%3E%3Ccircle%20cx%3D%225%22%20cy%3D%225%22%20r%3D%224%22%2F%3E%3C%2Fg%3E%3C%2Fsvg%3E")]
   #;[background-position center center]
   #;[background-repeat no-repeat])
  ((desc (and (tag div) (class vectorTabs)) (and (tag h3)))
   [display none])
  ((and (tag div) (class vectorTabs))
   [float left]
   [height (px 40)]
   #;[background-image url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAuCAIAAABmjeQ9AAAARElEQVR42mVO2wrAUAhy/f8fz+niVMTYQ3hLKkgGgN/IPvgIhUYYV/qogdP75J01V+JwrKZr/5YPcnzN3e6t7l+2K+EFX91B1daOi7sAAAAASUVORK5CYII=")]
   #;[background-position left bottom]
   #;[background-repeat no-repeat]
   [padding-left (px 1)])
  ((desc (and (tag div) (class vectorTabs)) (and (tag ul)))
   [float left]
   [height (% 100)]
   #;[list-style-type none]
   #;[list-style-image none]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[background-image url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAuCAIAAABmjeQ9AAAARElEQVR42mVO2wrAUAhy/f8fz+niVMTYQ3hLKkgGgN/IPvgIhUYYV/qogdP75J01V+JwrKZr/5YPcnzN3e6t7l+2K+EFX91B1daOi7sAAAAASUVORK5CYII=")]
   #;[background-position right bottom]
   #;[background-repeat no-repeat])
  ((desc (and (tag div) (class vectorTabs)) (and (tag ul)) (and (tag li)))
   [float left]
   #;[line-height (px 18)]
   [display inline-block]
   [height (% 100)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[background-color rgb(243, 243, 243)]
   #;[background-image url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAABkCAIAAADITs03AAAAPElEQVR4XuWK2xEAIAzCsPvv5DSu0ahX3yv4wQVyGGCSvg2dnJvduT8sz/IwKOIfjCi2z/76FhHeJcslVZQFLUC06LZ/AAAAAElFTkSuQmCC")]
   #;[background-position left bottom]
   #;[background-repeat repeat-x]
   #;[white-space nowrap])
  ((child (desc (and (tag div) (class vectorTabs)) (and (tag ul))) (and (tag li)))
   [display block])
  ((desc (and (tag div) (class vectorTabs)) (and (tag li)) (and (tag a)))
   [display inline-block]
   [height (px 24.3)]
   [padding-left (px 6.4)]
   [padding-right (px 6.4)]
   #;[color rgb(6, 69, 173)]
   #;[cursor pointer]
   #;[font-size (px (/ 307 30))])
  ((child (desc (and (tag div) (class vectorTabs)) (and (tag li))) (and (tag a)))
   [display block])
  ((desc (and (tag div) (class vectorTabs)) (and (tag span)))
   [display inline-block]
   #;[background-image url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAuCAIAAABmjeQ9AAAARElEQVR42mVO2wrAUAhy/f8fz+niVMTYQ3hLKkgGgN/IPvgIhUYYV/qogdP75J01V+JwrKZr/5YPcnzN3e6t7l+2K+EFX91B1daOi7sAAAAASUVORK5CYII=")]
   #;[background-position right bottom]
   #;[background-repeat no-repeat])
  ((desc (and (tag div) (class vectorTabs)) (and (tag span)) (and (tag a)))
   [display inline-block]
   [padding-top (px 16)])
  ((child (desc (and (tag div) (class vectorTabs)) (and (tag span))) (and (tag a)))
   [float left]
   [display block])
  ((and (tag div) (class vectorMenu))
   #;[direction ltr]
   [float left]
   #;[cursor pointer]
   [position relative])
  ((desc (and (tag div) (id mw-head)) (and (tag div) (class vectorMenu)) (and (tag h3)))
   [float left]
   #;[background-image url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAAuCAIAAABmjeQ9AAAARElEQVR42mVO2wrAUAhy/f8fz+niVMTYQ3hLKkgGgN/IPvgIhUYYV/qogdP75J01V+JwrKZr/5YPcnzN3e6t7l+2K+EFX91B1daOi7sAAAAASUVORK5CYII=")]
   #;[background-repeat no-repeat]
   #;[background-position right bottom]
   #;[font-size (px 16)]
   [height (px 40)]
   [padding-right (px 1)]
   [margin-right (px -1)])
  ((desc (and (tag div) (class vectorMenu)) (and (tag h3)) (and (tag span)))
   [display block]
   #;[font-size (px (/ 307 30))]
   [padding-left (px (/ 269 30))]
   [padding-top (px 17.6)]
   [margin-right (px 20)]
   #;[font-weight normal]
   #;[color rgb(77, 77, 77)])
  ((desc (and (tag div) (class vectorMenu)) (and (tag h3)) (and (tag a)))
   [position absolute]
   [top (px 0)]
   [right (px 0)]
   [width (px 20)]
   [height (px 40)]
   #;[background-image linear-gradient(transparent, transparent), url("data:image/svg+xml,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%3F%3E%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2222%22%20height%3D%2216%22%3E%3Cpath%20d%3D%22M15.502%206.001l-5%205.001-5-5.001z%22%20fill%3D%22%23797979%22%2F%3E%3C%2Fsvg%3E")]
   #;[background-position 100% 70%]
   #;[background-repeat no-repeat]
   #;[transition-property background-position]
   #;[transition-duration 250ms]
   #;[transition-timing-function ease]
   #;[transition-delay (px 0)])
  ((desc (and (tag div) (class vectorMenu)) (and (tag div) (class menu)))
   #;[min-width (% 100)]
   [position absolute]
   [top (px 40)]
   [left (px -1)]
   #;[background-color white]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color silver]
   #;[border-right-color silver]
   #;[border-bottom-color silver]
   #;[border-left-color silver]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-top-width (px 0)]
   #;[clear both]
   [text-align left]
   [display none]
   #;[z-index 1])
  (("div.vectorMenu:hover div.menu, div.vectorMenu.menuForceShow div.menu" (or))
   [display block])
  ((desc (and (tag div) (class vectorMenu)) (and (tag ul)))
   #;[list-style-type none]
   #;[list-style-image none]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [text-align left])
  ((desc (and (tag div) (class vectorMenu)) (and (tag li)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [text-align left]
   #;[line-height 1em])
  ((desc (and (tag div) (class vectorMenu)) (and (tag li)) (and (tag a)))
   [display inline-block]
   [padding-top 0.5em]
   [padding-right 0.5em]
   [padding-bottom 0.5em]
   [padding-left 0.5em]
   #;[white-space nowrap]
   #;[color rgb(6, 69, 173)]
   #;[cursor pointer]
   #;[font-size 0.8em])
  ((child (desc (and (tag div) (class vectorMenu)) (and (tag li))) (and (tag a)))
   [display block])
  ((or (desc (and (id ca-unwatch) (class icon)) (and (tag a))) (desc (and (id ca-watch) (class icon)) (and (tag a))))
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [display block]
   [width (px 26)]
   [padding-top 3.1em]
   [margin-top (px 0)]
   [height (px 0)]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[background-position 5px 60%])
  ((or (desc (and (id ca-unwatch) (class icon)) (and (tag a)) (and (tag span))) (desc (and (id ca-watch) (class icon)) (and (tag a)) (and (tag span))))
   [display none])
  ((desc (and (id mw-navigation)) (and (tag h2)))
   [position absolute]
   [top (px -9999)])
  ((and (id mw-page-base))
   [height (px 80)]
   #;[background-position left bottom]
   #;[background-repeat repeat-x]
   #;[background-image linear-gradient(rgb(255, 255, 255) 50%, rgb(246, 246, 246) 100%)]
   #;[background-color rgb(255, 255, 255)])
  ((and (id mw-head-base))
   [margin-top (px -80)]
   [margin-left (px 160)]
   [height (px 80)])
  ((and (tag div) (id mw-head))
   [position absolute]
   [top (px 0)]
   [right (px 0)]
   [width (% 100)])
  ((desc (and (tag div) (id mw-head)) (and (tag h3)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (id left-navigation))
   [float left]
   [margin-left (px 160)]
   [margin-top (px 40)]
   #;[margin-bottom (px -40)]
   [display inline])
  ((and (id right-navigation))
   [float right]
   [margin-top (px 40)])
  ((and (id p-logo))
   [position absolute]
   [top (px -160)]
   [left (px 0)]
   [width (px 160)]
   [height (px 160)])
  ((desc (and (id p-logo)) (and (tag a)))
   [display block]
   [width (px 160)]
   [height (px 160)]
   #;[background-repeat no-repeat]
   #;[background-position center center]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid])
  ((and (tag div) (id mw-panel))
   #;[font-size inherit]
   [position absolute]
   [top (px 160)]
   [padding-top (px 16)]
   [width (px 160)]
   [left (px 0)])
  ((desc (and (tag div) (id mw-panel)) (and (tag div) (class portal)))
   [margin-top (px 0)]
   [margin-right (px 9.6)]
   [margin-bottom (px 0)]
   [margin-left (px 11.2)]
   [padding-top (px 4)]
   [padding-right (px 0)]
   [padding-bottom (px 4)]
   [padding-left (px 0)]
   #;[direction ltr]
   #;[background-position left top]
   #;[background-repeat no-repeat]
   #;[background-image url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIwAAAABCAAAAAAphRnkAAAAJ0lEQVQIW7XFsQEAIAyAMPD/b7uLWz8wS5youFW1UREfiIpH1Q2VBz7fGPS1dOGeAAAAAElFTkSuQmCC")])
  ((desc (and (tag div) (id mw-panel)) (and (tag div) (class portal)) (and (tag h3)))
   #;[font-size (px 9)]
   #;[color rgb(77, 77, 77)]
   #;[font-weight normal]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 3)]
   [padding-right (px 0)]
   [padding-bottom (px 3)]
   [padding-left (px 3)]
   #;[cursor default]
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
  ((desc (and (tag div) (id mw-panel)) (and (tag div) (class portal)) (and (tag div) (class body)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 20)]
   [padding-top (px 0)])
  ((desc (and (tag div) (id mw-panel)) (and (tag div) (class portal)) (and (tag div) (class body)) (and (tag ul)))
   #;[list-style-type none]
   #;[list-style-image none]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (tag div) (id mw-panel)) (and (tag div) (class portal)) (and (tag div) (class body)) (and (tag ul)) (and (tag li)))
   #;[line-height (px 13.5)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 3)]
   [padding-right (px 0)]
   [padding-bottom (px 3)]
   [padding-left (px 0)]
   #;[font-size (px 9)]
   #;[word-wrap break-word])
  (("div#mw-panel #p-logo + div.portal" (or (id p-navigation)))
   #;[background-image none]
   [margin-top (px 0)])
  (("div#mw-panel #p-logo + div.portal h3" (or (id p-navigation-label)))
   [display none])
  (("div#mw-panel #p-logo + div.portal div.body" (or (id e10030)))
   [margin-left (px 8)])
  ((and (tag div) (id footer))
   [margin-left (px 160)]
   [margin-top (px 0)]
   [padding-top (px 12)]
   [padding-right (px 12)]
   [padding-bottom (px 12)]
   [padding-left (px 12)]
   #;[direction ltr])
  ((desc (and (tag div) (id footer)) (and (tag ul)))
   #;[list-style-type none]
   #;[list-style-image none]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (tag div) (id footer)) (and (tag ul)) (and (tag li)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-right (px 0)]
   [padding-left (px 0)]
   [padding-top (px 5.6)]
   [padding-bottom (px 5.6)]
   #;[color rgb(51, 51, 51)]
   #;[font-size (px (/ 47 6))])
  ((desc (and (tag div) (id footer)) (and (id footer-icons)))
   [float right])
  ((desc (and (tag div) (id footer)) (and (id footer-icons)) (and (tag li)))
   [float left]
   [margin-left (px 5.6)]
   #;[line-height (px 22.4)]
   [text-align right])
  ((desc (and (tag div) (id footer)) (and (id footer-places)) (and (tag li)))
   [float left]
   [margin-right (px 11.2)]
   #;[line-height (px 22.4)])
  ((desc (and (tag body) (class ltr)) (and (tag div) (id footer)) (and (id footer-places)))
   #;[float left])
  ((desc (and (class mw-body)) (and (class external)))
   #;[background-position right center]
   #;[background-repeat no-repeat]
   #;[background-image linear-gradient(transparent, transparent), url("data:image/svg+xml,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%20standalone%3D%22no%22%3F%3E%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%2212%22%20height%3D%2212%22%3E%3Cpath%20fill%3D%22%23fff%22%20stroke%3D%22%2306c%22%20d%3D%22M1.5%204.518h5.982V10.5H1.5z%22%2F%3E%3Cpath%20d%3D%22M5.765%201H11v5.39L9.427%207.937l-1.31-1.31L5.393%209.35l-2.69-2.688%202.81-2.808L4.2%202.544z%22%20fill%3D%22%2306f%22%2F%3E%3Cpath%20d%3D%22M9.995%202.004l.022%204.885L8.2%205.07%205.32%207.95%204.09%206.723l2.882-2.88-1.85-1.852z%22%20fill%3D%22%23fff%22%2F%3E%3C%2Fsvg%3E")]
   [padding-right (px 13)])
  ((and (class mw-body))
   [margin-left (px 176)]
   [padding-top (px 20)]
   [padding-right (px 24)]
   [padding-bottom (px 24)]
   [padding-left (px 24)])
  ((and (id p-logo))
   [left (px 8)])
  ((and (tag div) (id footer))
   [margin-left (px 176)]
   [padding-top (px 20)]
   [padding-right (px 20)]
   [padding-bottom (px 20)]
   [padding-left (px 20)])
  ((and (id mw-panel))
   [padding-left (px 8)])
  ((and (id p-search))
   [margin-right (px 16)])
  ((and (id left-navigation))
   [margin-left (px 176)])
  ((and (id p-personal))
   [right (px 16)])
  ((and (id mw-head-base))
   [margin-left (px 176)])
  ((and (class wb-langlinks-link))
   #;[line-height (px 13.5)]
   #;[font-size (px 9)]
   [float right])
  ((and (class wb-langlinks-link))
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside]
   [text-align right]
   [padding-right (px 6)])
  ((child (and (class wb-langlinks-link)) (and (tag a)))
   [padding-left (px 11)]
   #;[background-color transparent]
   #;[background-image none]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position left center]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  (("div.after-portlet-lang::after" (or))
   #;[content ""]
   #;[clear both]
   [display block])
  ((".ve-activated #toc, .ve-activated #siteNotice, .ve-activated .mw-indicators, .ve-active #bodyContent > :not(#siteSub):not(#contentSub):not(.ve-ui-mwTocWidget), .ve-activated #t-print, .ve-activated #t-permalink, .ve-activated #p-coll-print_export, .ve-activated #t-cite, .ve-activating .ve-ui-surface, .ve-deactivating .ve-ui-surface" (or))
   [display none])
  ((desc (and (class ve-activated)) (and (id content)))
   [position relative])
  ((and (class ve-init-mw-desktopArticleTarget-loading-overlay))
   [position absolute]
   [left (px 0)]
   [right (px 0)]
   #;[z-index 1]
   [margin-top -0.5em])
  ((and (class ve-init-mw-desktopArticleTarget-progress))
   [height 1em]
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-top (px 0)]
   [margin-right (% 25)]
   [margin-bottom (px 0)]
   [margin-left (% 25)])
  ((and (class ve-init-mw-desktopArticleTarget-progress-bar))
   [height 1em]
   [width (px 0)])
  ((and (class ve-init-mw-desktopArticleTarget-progress))
   [height 0.75em]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(52, 123, 255)]
   #;[border-right-color rgb(52, 123, 255)]
   #;[border-bottom-color rgb(52, 123, 255)]
   #;[border-left-color rgb(52, 123, 255)]
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
   #;[border-top-left-radius (px 2)]
   #;[border-top-right-radius (px 2)]
   #;[border-bottom-right-radius (px 2)]
   #;[border-bottom-left-radius (px 2)]
   #;[box-shadow (px 0)])
  ((and (class ve-init-mw-desktopArticleTarget-progress-bar))
   [height 0.75em]
   #;[background-color rgb(52, 123, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (class uls-menu) (class callout)) (and (class caret-before)))
   [border-top-width (px 20)]
   [border-top-style solid]
   #;[border-top-color transparent]
   [border-right-width (px 20)]
   [border-right-style solid]
   #;[border-right-color rgb(201, 201, 201)]
   [border-bottom-width (px 20)]
   [border-bottom-style solid]
   #;[border-bottom-color transparent]
   [display inline-block]
   [left (px -21)]
   [top (px 30)]
   [position absolute])
  ((desc (and (class uls-menu) (class callout)) (and (class caret-after)))
   [border-top-width (px 20)]
   [border-top-style solid]
   #;[border-top-color transparent]
   [border-right-width (px 20)]
   [border-right-style solid]
   #;[border-right-color rgb(252, 252, 252)]
   [border-bottom-width (px 20)]
   [border-bottom-style solid]
   #;[border-bottom-color transparent]
   [display inline-block]
   [left (px -20)]
   [top (px 30)]
   [position absolute])
  ((desc (and (class uls-ui-languages)) (and (tag button)))
   [width (% 23)]
   #;[text-overflow ellipsis]
   [margin-right (% 4)])
  ((and (tag button) (class uls-more-languages))
   [width auto])
  ((or (and (class ext-quick-survey-panel)) (and (class ext-qs-loader-bar)))
   [width auto]
   #;[background-color rgb(238, 238, 238)])
  ((and (class ext-qs-loader-bar))
   [display block]
   [height (px 100)]
   [margin-left 1.4em]
   #;[clear right]
   [float right]
   #;[background-color rgb(238, 238, 238)])
  ((and (class ext-qs-loader-bar) (class mw-ajax-loader))
   [top (px 0)])
  ((or (and (class ext-qs-loader-bar)) (and (class ext-quick-survey-panel)))
   [margin-left 1.4em]
   [width (px 300)]
   #;[clear right]
   [float right])
  ((and (id container))
   [position relative]
   #;[min-height (% 100)])
  ((or (and (id container)) (and (tag video)))
   [width (% 100)]
   [height (% 100)])
  ((and (id playerContainer))
   [overflow-x hidden]
   [overflow-y hidden]
   [position relative]
   [height (% 100)]
   #;[background-color rgb(0, 0, 0)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (id videoHolder))
   [position relative]
   [overflow-x hidden]
   [overflow-y hidden])
  ((desc (and (class fullscreen)) (and (id playerContainer)))
   [position absolute]
   [width (% 100)]
   [height (% 100)]
   #;[z-index 9999]
   #;[min-height (% 100)]
   [top (px 0)]
   [left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (class mwEmbedPlayer))
   [width (% 100)]
   [height (% 100)]
   [overflow-x hidden]
   [overflow-y hidden]
   [position absolute]
   [top (px 0)]
   [left (px 0)])
  ((and (class modal_editor))
   [left (px 10)]
   [top (px 10)]
   [right (px 10)]
   [bottom (px 10)]
   [position fixed]
   #;[z-index 100])
  ((and (class loadingSpinner))
   [width (px 32)]
   [height (px 32)]
   [display block]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[background-image url("//en.wikipedia.org/static/1.27.0-wmf.8/extensions/MwEmbedSupport/MwEmbedModules/MwEmbedSupport/skins/common/images/loading_ani.gif?a51c5")])
  ((and (class mw-imported-resource))
   [border-top-width thin]
   [border-right-width thin]
   [border-bottom-width thin]
   [border-left-width thin]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color black]
   #;[border-right-color black]
   #;[border-bottom-color black]
   #;[border-left-color black]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (class kaltura-icon))
   #;[background-image url("//en.wikipedia.org/static/1.27.0-wmf.8/extensions/MwEmbedSupport/MwEmbedModules/MwEmbedSupport/skins/common/images/kaltura_logo_sm_transparent.png?28082")]
   #;[background-repeat no-repeat]
   [display block]
   [height (px 12)]
   [width (px 12)]
   [margin-top (px 2)]
   [margin-left (px 3)])
  ((and (class mw-fullscreen-overlay))
   #;[background-color rgb(0, 0, 0)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [position fixed]
   [top (px 0)]
   [left (px 0)]
   [width (% 100)]
   [height (% 100)])
  ((and (class play-btn-large))
   [width (px 70)]
   [height (px 53)]
   #;[background-color transparent]
   #;[background-image url("//en.wikipedia.org/static/1.27.0-wmf.8/extensions/MwEmbedSupport/MwEmbedModules/MwEmbedSupport/skins/common/images/player_big_play_button.png?aff14")]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [position absolute]
   #;[cursor pointer]
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
  ((and (class carouselContainer))
   [position absolute]
   [width (% 100)]
   #;[z-index 2])
  ((and (class carouselVideoTitle))
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [width (% 100)]
   #;[background-color rgba(0, 0, 0, 0.8)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[color white]
   #;[font-size small]
   #;[font-weight bold]
   #;[z-index 2])
  ((and (class carouselVideoTitleText))
   [display block]
   [padding-top (px 10)]
   [padding-right (px 10)]
   [padding-bottom (px 10)]
   [padding-left (px 20)])
  ((and (class carouselTitleDuration))
   [position absolute]
   [top (px 0)]
   [right (px 0)]
   [padding-top (px 2)]
   [padding-right (px 2)]
   [padding-bottom (px 2)]
   [padding-left (px 2)]
   #;[background-color rgb(90, 90, 90)]
   #;[color rgb(217, 217, 217)]
   #;[font-size smaller]
   #;[z-index 2])
  ((and (class carouselImgTitle))
   [position absolute]
   [width (% 100)]
   [text-align center]
   #;[color white]
   #;[font-size small]
   #;[background-color rgba(0, 0, 0, 0.4)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (class carouselImgDuration))
   [position absolute]
   [top (px 2)]
   [left (px 2)]
   #;[background-color rgba(0, 0, 0, 0.7)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[color white]
   [padding-top (px 1)]
   [padding-right (px 6)]
   [padding-bottom (px 1)]
   [padding-left (px 6)]
   #;[font-size small])
  ((or (and (class carouselPrevButton)) (and (class carouselNextButton)))
   [display block]
   [position absolute]
   [bottom (px 23)])
  ((and (class carouselPrevButton))
   [left (px 5)])
  ((and (class carouselNextButton))
   [right (px 6)])
  ((and (class alert-container))
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)]
   #;[border-bottom-right-radius (px 3)]
   #;[border-bottom-left-radius (px 3)]
   #;[background-image -moz-linear-gradient(center bottom , rgb(215, 215, 215) 4%, rgb(230, 230, 230) 55%, rgb(255, 255, 255) 100%)]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto]
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 0)]
   #;[max-width (% 80)]
   #;[max-height (% 30)]
   [width (% 80)])
  ((and (class alert-title))
   #;[background-color rgb(230, 230, 230)]
   [padding-top (px 5)]
   [padding-right (px 5)]
   [padding-bottom (px 5)]
   [padding-left (px 5)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(209, 209, 209)]
   #;[font-weight normal]
   #;[font-size (px 14)]
   #;[border-top-left-radius (px 3)]
   #;[border-top-right-radius (px 3)])
  ((and (class alert-message))
   [padding-top (px 5)]
   [padding-right (px 5)]
   [padding-bottom (px 5)]
   [padding-left (px 5)]
   #;[font-weight normal]
   [text-align center]
   #;[font-size (px 14)])
  ((and (class alert-buttons-container))
   [text-align center]
   [padding-bottom (px 5)])
  ((and (class alert-button))
   #;[background-color rgb(71, 71, 71)]
   #;[color white]
   #;[border-top-left-radius 0.5em]
   #;[border-top-right-radius 0.5em]
   #;[border-bottom-right-radius 0.5em]
   #;[border-bottom-left-radius 0.5em]
   [padding-top (px 2)]
   [padding-right (px 10)]
   [padding-bottom (px 2)]
   [padding-left (px 10)]
   #;[background-image -moz-linear-gradient(center bottom , rgb(25, 25, 25) 4%, rgb(47, 47, 47) 55%, rgb(71, 71, 71) 68%)])
  ((desc (and (class PopUpMediaTransform)) (and (tag a)) (and (class play-btn-large)))
   [top (% 50)]
   [left (% 50)]
   [width (px 70)]
   [height (px 53)]
   [margin-left (px -35)]
   [margin-top (px -25)]
   #;[background-image url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEYAAAA1CAMAAADLRm3ZAAABnlBMVEUAAAAAAAAAAABaWlp4eHh7e3t/f393d3eDg4N0dHRtbW2FhYVra2uJiYmNjY1nZ2eRkZFkZGSUlJRiYmKYmJhgYGCcnJxeXl5cXFyfn58AAACioqKlpaWsrKwAAACpqakAAAAAAAAAAAAAAABEREQFBQUHBwdMTEwAAAAYGBgAAAAAAAABAQEXFxcAAAAAAAAAAABxcXGoqKh3d3eampp8fHyIiIgUFBQcHBw0NDSFhYV+fn5FRUUmJiaNjY11dXWPj4+Hh4c9PT14eHifn59nZ2eBgYFISEiBgYFubm5vb28ODg4lJSVra2tiYmJoaGgEBAQmJiZmZmaLi4saGhpiYmKYmJhZWVlgYGBfX19vb29DQ0MGBgZcXFyBgYFKSkoPDw9ZWVlzc3NQUFBXV1eKiopUVFQdHR1VVVUQEBBYWFglJSVTU1NXV1cKCgosLCySkpJRUVFISEgyMjJPT08dHR2GhoY4ODhNTU09PT0MDAwuLi57e3sTExNJSUkgICBOTk4hISEbGxtTU1MoKChBQUEsLCxXV1cAAABycnIdNM6eAAAAinRSTlOzj6jO1dbX1NfU09nS2drR29Hc0N3Q3c/O3gDf3+Ce4EgIGW7HtbXKnLouq7S5cHIq1ODQ3NTXuLq/1tXEvNjT2NjC093N18bW0dC2vNHM0LW90Ne5z9rLzsrTxbXN1Me3zdDKzdfLu8y3zb3Lyba/2svFwcq618PKxLa/1LjJu8q8u8y+xsDKrdJqj5XQAAABYklEQVR4Xu3XVVNCQRjH4VdQEbvFVRAOIRl2d3d3d3d317d2GEaGOOfM1oUXPB/gN7NX/30BIYPeGMPAqDcgBMhrBUZWLwJBAcwcAriBAzfogAMdKIADBUUmmqm64JAxl2m1k/XMmZkin+YaxsxYqd9iA1OmsfDPajVDZqMgoL1jhzpTmR+k/OCQMlObG+L4dJgq050d5rKVJlOXGaHijjxzny6i94k005YqatBFlmlKEdfy1UeS+UmS0tllwc/0JEhT9WNnBuJlqCy4maE4OSO4mdFYOeO4mQm1jCnAzUyXSJqdm8fOLCRKWVomWIaVZHFrLqJlWE8Ts7lFuAzbGZF294iXYT8rnPLICcSZk5xQyjMzzTKc5wXTXFnoluFaE+TmlnYZipUBpgcA5syjjWU1Tf7I8wvbhr/6Im/vTmDLgO3D9Gn+R5+2aIbXzeABDjwgOIDZtwDIzvwsnR1xujV/AS6zSfMs2bS9AAAAAElFTkSuQmCC")])
  ((and (class mw-tmh-playtext))
   [display block]
   [height (px 0)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class cn-closeButton))
   [display inline-block]
   #;[background-color transparent]
   #;[background-image url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABMAAAATCAMAAABFjsb+AAABelBMVEX///////80NDT///////////////////////////8yMjIzMzM5OTkMDAxlZWWCgoIvLy////8AAAD9/f3////8/PxjY2Pa2tpqamo7Ozvp6elFRUWEhITCwsLNzc1WVlbY2Ng3Nzf+/v57e3vb29ufn58LCwthYWExMTFSUlJDQ0Py8vJXV1cvLy9WVlbExMQBAQH+/v59fX14eHg2NjYuLi5VVVXc3Nz6+vrIyMjj4+Pn5+dGRkZ5eXmBgYHp6elsbGwwMDB8fHz8/PzOzs5XV1c1NTXQ0NDn5+dkZGRnZ2ft7e3l5eUtLS3d3d07OztDQ0PHx8eRkZGysrJbW1v8/Pzu7u40NDRUVFRsbGzb29uIiIiXl5fi4uLy8vJmZmbh4eHp6elpaWmioqKCgoJ5eXk5OTmcnJxsbGzy8vJiYmKwsLDk5ORAQEA8PDw6OjrAwMCqqqqCgoLx8fHz8/Pr6+vx8fHj4+NlZWXn5+dtbW2jo6OdnZ16enp8kgr/AAAAfnRSTlMAqOd5JlJZc5YX5+flANTK6SMAmaap1L/c5Lngyre12rHlqc2xzADd6NrhsNno37cAqMzZ5unasJq1vbjf2Ne40ujLmrTf5sK23tOyteq95eC2xsneq7Hm4Ny/yNG5ttuws9zJ1dfky9q31cu65OPkxsbWtrezsLrbudrJy9cUNT7KAAAA+ElEQVQYV2NgAAEWVmYOEQ5mVhYGCOBV42QT1pfhE+PjlxVm4zQQAokJsqsYSYdzc3MzaSkrsAuCxDjZ5eS5FDNUk9NT0zQ0Ldk5gWJsCTq6rlGihoyMolJJpmbmbEDjnfm5IqzsExkZGbVzrOMdnSxYGFhdbEzcPZg8Mxm9bX39pPwDAlkZmIPcQkLDJAQio1IE9OIY7ZiimRk4HJhilBh9jHkkedRjGRmDubw4GESymLKBZonn5uUXAOlCLjERrOoQ5hUJ6BVDzIPZW4JkL9R9pUCzysqtK8Dug/hDHOyPSgmIP6D+rVKtrqmVhPkXW7hgCz/McAYAItEzkWDsbM4AAAAASUVORK5CYII=")]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [width (px 19)]
   [height (px 19)]
   #;[text-indent (px 19)]
   #;[white-space nowrap]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class cite-accessibility-label))
   [position absolute]
   [top (px -99999)]
   #;[clip rect(1px, 1px, 1px, 1px)]
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
   [height (px 1)]
   [width (px 1)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class postedit-container))
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom (px 0)]
   [margin-left auto]
   [position fixed]
   [top (px 0)]
   [height (px 0)]
   [left (% 50)]
   #;[z-index 1000]
   #;[font-size (px 13)])
  ((and (class postedit))
   [position relative]
   [top 0.6em]
   [left (% -50)]
   [padding-top 0.6em]
   [padding-right 3.6em]
   [padding-bottom 0.6em]
   [padding-left 1.1em]
   #;[line-height 1.5625em]
   #;[color rgb(98, 100, 101)]
   #;[background-color rgb(244, 244, 244)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(220, 217, 217)]
   #;[border-right-color rgb(220, 217, 217)]
   #;[border-bottom-color rgb(220, 217, 217)]
   #;[border-left-color rgb(220, 217, 217)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[text-shadow (px 0)]
   #;[border-top-left-radius (px 5)]
   #;[border-top-right-radius (px 5)]
   #;[border-bottom-right-radius (px 5)]
   #;[border-bottom-left-radius (px 5)]
   #;[box-shadow (px 0)]
   #;[transition-property all]
   #;[transition-duration 0.25s]
   #;[transition-timing-function ease-in-out]
   #;[transition-delay (px 0)])
  ((desc (and (class skin-monobook)) (and (class postedit)))
   [top 6em])
  ((and (class postedit-icon))
   [padding-left (px 41)]
   #;[line-height (px 25)]
   #;[background-repeat no-repeat]
   #;[background-position 8px 50%])
  ((and (class postedit-close))
   [position absolute]
   [padding-top (px 0)]
   [padding-right 0.8em]
   [padding-bottom (px 0)]
   [padding-left 0.8em]
   [right (px 0)]
   [top (px 0)]
   #;[font-size 1.25em]
   #;[font-weight bold]
   #;[line-height 2.3em]
   #;[color black]
   #;[text-shadow (px 0)]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[opacity 0.2])
  ((and (tag blockquote))
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-top (px 14)]
   [margin-right (px 0)]
   [margin-bottom (px 14)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 40)]
   [padding-bottom (px 0)]
   [padding-left (px 40)])
  ((desc (and (tag body) (class page-Main_Page)) (and (id ca-delete)))
   [display none])
  ((and (id toolbar))
   [height (px 22)]
   [margin-bottom (px 6)])
  ((and (id editpage-specialchars))
   [display none])
  ((desc (and (class citation)) (and (class printonly)))
   [display none])
  ((or (and (tag ol) (class references)) (and (tag div) (class reflist)) (and (tag div) (class refbegin)))
   #;[font-size (% 90)]
   [margin-bottom (px 6.3)])
  ((and (tag span) (class brokenref))
   [display none])
  ((and (tag div) (class columns))
   [margin-top 0.3em])
  ((or (desc (and (tag div) (class columns)) (and (tag dl))) (desc (and (tag div) (class columns)) (and (tag ol))) (desc (and (tag div) (class columns)) (and (tag ul))))
   [margin-top (px 0)])
  ((desc (and (class flowlist)) (and (tag ul)))
   [overflow-x hidden]
   [margin-left (px 0)]
   [padding-left 1.6em])
  ((desc (and (class flowlist)) (and (tag ol)))
   [overflow-x hidden]
   [margin-left (px 0)]
   [padding-left 3.2em])
  ((desc (and (class flowlist)) (and (tag dl)))
   [overflow-x hidden])
  ((or (desc (and (class hlist)) (and (tag dl))) (desc (and (class hlist)) (and (tag ol))) (desc (and (class hlist)) (and (tag ul))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((or (desc (and (class hlist)) (and (tag dd))) (desc (and (class hlist)) (and (tag dt))) (desc (and (class hlist)) (and (tag li))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [display inline])
  ((or (and (class hlist) (class inline)) (desc (and (class hlist) (class inline)) (and (tag dl))) (desc (and (class hlist) (class inline)) (and (tag ol))) (desc (and (class hlist) (class inline)) (and (tag ul))) (desc (and (class hlist)) (and (tag dl)) (and (tag dl))) (desc (and (class hlist)) (and (tag dl)) (and (tag ol))) (desc (and (class hlist)) (and (tag dl)) (and (tag ul))) (desc (and (class hlist)) (and (tag ol)) (and (tag dl))) (desc (and (class hlist)) (and (tag ol)) (and (tag ol))) (desc (and (class hlist)) (and (tag ol)) (and (tag ul))) (desc (and (class hlist)) (and (tag ul)) (and (tag dl))) (desc (and (class hlist)) (and (tag ul)) (and (tag ol))) (desc (and (class hlist)) (and (tag ul)) (and (tag ul))))
   [display inline])
  ((desc (and (class hlist)) (and (class mw-empty-li)))
   [display none])
  ((or (desc (and (class plainlist)) (and (tag ol))) (desc (and (class plainlist)) (and (tag ul))))
   #;[line-height inherit]
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((or (desc (and (class plainlist)) (and (tag ol)) (and (tag li))) (desc (and (class plainlist)) (and (tag ul)) (and (tag li))))
   [margin-bottom (px 0)])
  ((and (class navbox))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [width (% 100)]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto]
   #;[clear both]
   #;[font-size (% 88)]
   [text-align center]
   [padding-top (px 1)]
   [padding-right (px 1)]
   [padding-bottom (px 1)]
   [padding-left (px 1)])
  ((or (and (class navbox-inner)) (and (class navbox-subgroup)))
   [width (% 100)])
  ((or (and (class navbox-group)) (and (class navbox-title)) (and (class navbox-abovebelow)))
   [padding-top (px (/ 37 12))]
   [padding-right (px 12.3)]
   [padding-bottom (px (/ 37 12))]
   [padding-left (px 12.3)]
   #;[line-height (px (/ 554 30))]
   [text-align center])
  ((and (tag th) (class navbox-group))
   #;[white-space nowrap]
   [text-align right])
  ((and (tag table) (class navbox))
   [margin-top (px 12.3)])
  ((desc (and (tag table) (class navbox)) (and (tag table) (class navbox)))
   [margin-top (px 0)])
  (("table.navbox + table.navbox" (or (id e10031)))
   [margin-top (px -1)])
  ((or (desc (and (class navbox)) (and (class hlist)) (and (tag td)) (and (tag dl))) (desc (and (class navbox)) (and (class hlist)) (and (tag td)) (and (tag ol))) (desc (and (class navbox)) (and (class hlist)) (and (tag td)) (and (tag ul))) (desc (and (class navbox)) (and (tag td) (class hlist)) (and (tag dl))) (desc (and (class navbox)) (and (tag td) (class hlist)) (and (tag ol))) (desc (and (class navbox)) (and (tag td) (class hlist)) (and (tag ul))))
   [padding-top (px (/ 23 15))]
   [padding-right (px 0)]
   [padding-bottom (px (/ 23 15))]
   [padding-left (px 0)])
  ((and (class navbar))
   [display inline]
   #;[font-size (% 88)]
   #;[font-weight normal])
  ((desc (and (class navbar)) (and (tag ul)))
   [display inline]
   #;[white-space nowrap])
  ((".navbar.mini li abbr[title]" (or (id e10025) (id e10026) (id e10027)))
   #;[font-variant-alternates normal]
   #;[font-variant-caps small-caps]
   #;[font-variant-east-asian normal]
   #;[font-variant-ligatures normal]
   #;[font-variant-numeric normal]
   #;[font-variant-position normal]
   [border-bottom-width medium]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[cursor inherit])
  ((desc (and (class navbox)) (and (class navbar)))
   [display block]
   #;[font-size (% 100)])
  ((desc (and (class navbox-title)) (and (class navbar)))
   [float left]
   [text-align left]
   [margin-right (px (/ 37 6))]
   [width (px 73.9)])
  ((and (class collapseButton))
   [float right]
   #;[font-weight normal]
   [margin-left (px (/ 37 6))]
   [text-align right]
   [width auto])
  ((desc (and (class navbox)) (and (class collapseButton)))
   [width (px 73.9)])
  ((and (class mw-collapsible-toggle))
   #;[font-weight normal]
   [text-align right])
  ((desc (and (class navbox)) (and (class mw-collapsible-toggle)))
   [width 6em])
  ((and (class infobox))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-spacing (px 3)]
   #;[background-color rgb(249, 249, 249)]
   #;[color black]
   [margin-top (px (/ 37 6))]
   [margin-right (px 0)]
   [margin-bottom (px (/ 37 6))]
   [margin-left (px 12.3)]
   [padding-top (px (/ 37 15))]
   [padding-right (px (/ 37 15))]
   [padding-bottom (px (/ 37 15))]
   [padding-left (px (/ 37 15))]
   [float right]
   #;[clear right]
   #;[font-size (% 88)]
   #;[line-height (px (/ 554 30))])
  ((desc (and (class infobox)) (and (tag caption)))
   #;[font-size (% 125)]
   #;[font-weight bold]
   [padding-top 0.2em]
   [padding-right 0.2em]
   [padding-bottom 0.2em]
   [padding-left 0.2em])
  ((or (desc (and (class infobox)) (and (tag td))) (desc (and (class infobox)) (and (tag th))))
   #;[vertical-align top]
   [text-align left])
  ((or (desc (and (class infobox) (class bordered)) (and (tag td))) (desc (and (class infobox) (class bordered)) (and (tag th))))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((or (desc (and (class infobox) (class bordered)) (and (class borderless)) (and (tag td))) (desc (and (class infobox) (class bordered)) (and (class borderless)) (and (tag th))))
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
  ((and (class infobox) (class sisterproject))
   [width 20em]
   #;[font-size (% 90)])
  ((and (class infobox) (class standard-talk))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(192, 192, 144)]
   #;[border-right-color rgb(192, 192, 144)]
   #;[border-bottom-color rgb(192, 192, 144)]
   #;[border-left-color rgb(192, 192, 144)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(248, 234, 186)])
  ((or (desc (and (class infobox) (class standard-talk) (class bordered)) (and (tag td))) (desc (and (class infobox) (class standard-talk) (class bordered)) (and (tag th))))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(192, 192, 144)]
   #;[border-right-color rgb(192, 192, 144)]
   #;[border-bottom-color rgb(192, 192, 144)]
   #;[border-left-color rgb(192, 192, 144)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((or (desc (and (class infobox) (class bordered)) (and (class mergedtoprow)) (and (tag td))) (desc (and (class infobox) (class bordered)) (and (class mergedtoprow)) (and (tag th))))
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   [border-right-width (px 1)]
   [border-right-style solid]
   #;[border-right-color rgb(170, 170, 170)])
  ((or (desc (and (class infobox) (class bordered)) (and (class mergedrow)) (and (tag td))) (desc (and (class infobox) (class bordered)) (and (class mergedrow)) (and (tag th))))
   [border-top-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-right-width (px 1)]
   [border-right-style solid]
   #;[border-right-color rgb(170, 170, 170)])
  ((or (desc (and (class infobox) (class geography)) (and (tag td))) (desc (and (class infobox) (class geography)) (and (tag th))))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   [padding-top 0.4em]
   [padding-right 0.6em]
   [padding-bottom 0.4em]
   [padding-left 0.6em])
  ((or (desc (and (class infobox) (class geography)) (and (class mergedtoprow)) (and (tag td))) (desc (and (class infobox) (class geography)) (and (class mergedtoprow)) (and (tag th))))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   [padding-top 0.4em]
   [padding-right 0.6em]
   [padding-bottom 0.2em]
   [padding-left 0.6em])
  ((or (desc (and (class infobox) (class geography)) (and (class mergedrow)) (and (tag td))) (desc (and (class infobox) (class geography)) (and (class mergedrow)) (and (tag th))))
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
   [padding-right 0.6em]
   [padding-bottom 0.2em]
   [padding-left 0.6em])
  ((or (desc (and (class infobox) (class geography)) (and (class mergedbottomrow)) (and (tag td))) (desc (and (class infobox) (class geography)) (and (class mergedbottomrow)) (and (tag th))))
   [border-top-width (px 0)]
   [border-top-style none]
   #;[border-top-color -moz-use-text-color]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(170, 170, 170)]
   [padding-top (px 0)]
   [padding-right 0.6em]
   [padding-bottom 0.4em]
   [padding-left 0.6em])
  ((or (desc (and (class infobox) (class geography)) (and (class maptable)) (and (tag td))) (desc (and (class infobox) (class geography)) (and (class maptable)) (and (tag th))))
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
  ((".wikitable.plainrowheaders th[scope=\"row\"]" (or))
   #;[font-weight normal]
   [text-align left])
  ((or (desc (and (class wikitable)) (and (tag td)) (and (tag ul))) (desc (and (class wikitable)) (and (tag td)) (and (tag ol))) (desc (and (class wikitable)) (and (tag td)) (and (tag dl))))
   [text-align left])
  ((or (desc (and (class toc) (class hlist)) (and (tag ul))) (desc (and (id toc) (class hlist)) (and (tag ul))) (desc (and (class wikitable) (class hlist)) (and (tag td)) (and (tag ul))) (desc (and (class wikitable) (class hlist)) (and (tag td)) (and (tag ol))) (desc (and (class wikitable) (class hlist)) (and (tag td)) (and (tag dl))))
   [text-align inherit])
  ((and (tag div) (class listenlist))
   #;[background-color transparent]
   #;[background-image url("//upload.wikimedia.org/wikipedia/commons/4/47/Sound-icon.svg")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size 30px auto]
   [padding-left (px 40)])
  ((and (tag div) (class medialist))
   #;[min-height (px 50)]
   [margin-top 1em]
   [margin-right 1em]
   [margin-bottom 1em]
   [margin-left 1em]
   #;[background-position left top]
   #;[background-repeat no-repeat])
  ((desc (and (tag div) (class medialist)) (and (tag ul)))
   #;[list-style-type none]
   #;[list-style-image none]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (tag div) (class medialist)) (and (tag ul)) (and (tag li)))
   [padding-bottom 0.5em])
  ((desc (and (tag div) (class medialist)) (and (tag ul)) (and (tag li)) (and (tag li)))
   #;[font-size (% 91)]
   [padding-bottom (px 0)])
  (("div#content a.external[href$=\".pdf\"], div#content a.external[href*=\".pdf?\"], div#content a.external[href*=\".pdf#\"], div#content a.external[href$=\".PDF\"], div#content a.external[href*=\".PDF?\"], div#content a.external[href*=\".PDF#\"], div#mw_content a.external[href$=\".pdf\"], div#mw_content a.external[href*=\".pdf?\"], div#mw_content a.external[href*=\".pdf#\"], div#mw_content a.external[href$=\".PDF\"], div#mw_content a.external[href*=\".PDF?\"], div#mw_content a.external[href*=\".PDF#\"]" (or))
   #;[background-color transparent]
   #;[background-image url("//upload.wikimedia.org/wikipedia/commons/2/23/Icons-mini-file_acrobat.gif")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position right center]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [padding-right (px 18)])
  ((or (desc (and (tag div) (id content)) (and (tag span) (class PDFlink)) (and (tag a))) (desc (and (tag div) (id mw_content)) (and (tag span) (class PDFlink)) (and (tag a))))
   #;[background-color transparent]
   #;[background-image url("//upload.wikimedia.org/wikipedia/commons/2/23/Icons-mini-file_acrobat.gif")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position right center]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [padding-right (px 18)])
  ((desc (and (tag div) (class columns-2)) (and (tag div) (class column)))
   [float left]
   [width (% 50)]
   #;[min-width (px 300)])
  ((desc (and (tag div) (class columns-3)) (and (tag div) (class column)))
   [float left]
   [width (% 33.3)]
   #;[min-width (px 200)])
  ((desc (and (tag div) (class columns-4)) (and (tag div) (class column)))
   [float left]
   [width (% 25)]
   #;[min-width (px 150)])
  ((desc (and (tag div) (class columns-5)) (and (tag div) (class column)))
   [float left]
   [width (% 20)]
   #;[min-width (px 120)])
  ((and (class messagebox))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(249, 249, 249)]
   [width (% 80)]
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom 1em]
   [margin-left auto]
   [padding-top 0.2em]
   [padding-right 0.2em]
   [padding-bottom 0.2em]
   [padding-left 0.2em])
  ((and (class messagebox) (class merge))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(192, 184, 204)]
   #;[border-right-color rgb(192, 184, 204)]
   #;[border-bottom-color rgb(192, 184, 204)]
   #;[border-left-color rgb(192, 184, 204)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(240, 229, 255)]
   [text-align center])
  ((and (class messagebox) (class cleanup))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(159, 159, 255)]
   #;[border-right-color rgb(159, 159, 255)]
   #;[border-bottom-color rgb(159, 159, 255)]
   #;[border-left-color rgb(159, 159, 255)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(239, 239, 255)]
   [text-align center])
  ((and (class messagebox) (class standard-talk))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(192, 192, 144)]
   #;[border-right-color rgb(192, 192, 144)]
   #;[border-bottom-color rgb(192, 192, 144)]
   #;[border-left-color rgb(192, 192, 144)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(248, 234, 186)]
   [margin-top (px 4)]
   [margin-right auto]
   [margin-bottom (px 4)]
   [margin-left auto])
  ((or (desc (and (class mbox-inside)) (and (class standard-talk))) (and (class messagebox) (class nested-talk)))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(192, 192, 144)]
   #;[border-right-color rgb(192, 192, 144)]
   #;[border-bottom-color rgb(192, 192, 144)]
   #;[border-left-color rgb(192, 192, 144)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(248, 234, 186)]
   [width (% 100)]
   [margin-top (px 2)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 0)]
   [padding-top (px 2)]
   [padding-right (px 2)]
   [padding-bottom (px 2)]
   [padding-left (px 2)])
  ((and (class messagebox) (class small))
   [width (px 238)]
   #;[font-size (% 85)]
   [float right]
   #;[clear both]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom 1em]
   [margin-left 1em]
   #;[line-height 1.25em])
  ((and (class messagebox) (class small-talk))
   [width (px 238)]
   #;[font-size (% 85)]
   [float right]
   #;[clear both]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom 1em]
   [margin-left 1em]
   #;[line-height 1.25em]
   #;[background-color rgb(248, 234, 186)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((or (and (tag th) (class mbox-text)) (and (tag td) (class mbox-text)))
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
   [padding-top 0.25em]
   [padding-right 0.9em]
   [padding-bottom 0.25em]
   [padding-left 0.9em]
   [width (% 100)])
  ((and (tag td) (class mbox-image))
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
   [padding-top (px 2)]
   [padding-right (px 0)]
   [padding-bottom (px 2)]
   [padding-left 0.9em]
   [text-align center])
  ((and (tag td) (class mbox-imageright))
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
   [padding-top (px 2)]
   [padding-right 0.9em]
   [padding-bottom (px 2)]
   [padding-left (px 0)]
   [text-align center])
  ((and (tag td) (class mbox-empty-cell))
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
   [width (px 1)])
  ((and (tag table) (class ambox))
   [margin-top (px 0)]
   [margin-right (% 10)]
   [margin-bottom (px 0)]
   [margin-left (% 10)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(30, 144, 255)]
   #;[background-color rgb(251, 251, 251)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  (("table.ambox + table.ambox" (or))
   [margin-top (px -1)])
  ((or (desc (and (class ambox)) (and (tag th) (class mbox-text))) (desc (and (class ambox)) (and (tag td) (class mbox-text))))
   [padding-top 0.25em]
   [padding-right 0.5em]
   [padding-bottom 0.25em]
   [padding-left 0.5em])
  ((desc (and (class ambox)) (and (tag td) (class mbox-image)))
   [padding-top (px 2)]
   [padding-right (px 0)]
   [padding-bottom (px 2)]
   [padding-left 0.5em])
  ((desc (and (class ambox)) (and (tag td) (class mbox-imageright)))
   [padding-top (px 2)]
   [padding-right 0.5em]
   [padding-bottom (px 2)]
   [padding-left (px 0)])
  ((and (tag table) (class ambox-notice))
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(30, 144, 255)])
  ((and (tag table) (class ambox-speedy))
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(178, 34, 34)]
   #;[background-color rgb(255, 238, 238)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class ambox-delete))
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(178, 34, 34)])
  ((and (tag table) (class ambox-content))
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(242, 133, 0)])
  ((and (tag table) (class ambox-style))
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(244, 196, 48)])
  ((and (tag table) (class ambox-move))
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(153, 50, 204)])
  ((and (tag table) (class ambox-protection))
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(187, 187, 170)])
  ((and (tag table) (class imbox))
   [margin-top (px 4)]
   [margin-right (% 10)]
   [margin-bottom (px 4)]
   [margin-left (% 10)]
   #;[border-collapse collapse]
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(30, 144, 255)]
   #;[border-right-color rgb(30, 144, 255)]
   #;[border-bottom-color rgb(30, 144, 255)]
   #;[border-left-color rgb(30, 144, 255)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(251, 251, 251)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (class imbox)) (and (class mbox-text)) (and (class imbox)))
   [margin-top (px 0)]
   [margin-right -0.5em]
   [margin-bottom (px 0)]
   [margin-left -0.5em]
   [display block])
  ((desc (and (class mbox-inside)) (and (class imbox)))
   [margin-top (px 4)]
   [margin-right (px 4)]
   [margin-bottom (px 4)]
   [margin-left (px 4)])
  ((and (tag table) (class imbox-notice))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(30, 144, 255)]
   #;[border-right-color rgb(30, 144, 255)]
   #;[border-bottom-color rgb(30, 144, 255)]
   #;[border-left-color rgb(30, 144, 255)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class imbox-speedy))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(178, 34, 34)]
   #;[border-right-color rgb(178, 34, 34)]
   #;[border-bottom-color rgb(178, 34, 34)]
   #;[border-left-color rgb(178, 34, 34)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 238, 238)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class imbox-delete))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(178, 34, 34)]
   #;[border-right-color rgb(178, 34, 34)]
   #;[border-bottom-color rgb(178, 34, 34)]
   #;[border-left-color rgb(178, 34, 34)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class imbox-content))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(242, 133, 0)]
   #;[border-right-color rgb(242, 133, 0)]
   #;[border-bottom-color rgb(242, 133, 0)]
   #;[border-left-color rgb(242, 133, 0)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class imbox-style))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(244, 196, 48)]
   #;[border-right-color rgb(244, 196, 48)]
   #;[border-bottom-color rgb(244, 196, 48)]
   #;[border-left-color rgb(244, 196, 48)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class imbox-move))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(153, 50, 204)]
   #;[border-right-color rgb(153, 50, 204)]
   #;[border-bottom-color rgb(153, 50, 204)]
   #;[border-left-color rgb(153, 50, 204)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class imbox-protection))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(187, 187, 170)]
   #;[border-right-color rgb(187, 187, 170)]
   #;[border-bottom-color rgb(187, 187, 170)]
   #;[border-left-color rgb(187, 187, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class imbox-license))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(136, 136, 170)]
   #;[border-right-color rgb(136, 136, 170)]
   #;[border-bottom-color rgb(136, 136, 170)]
   #;[border-left-color rgb(136, 136, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(247, 248, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class imbox-featured))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(203, 161, 53)]
   #;[border-right-color rgb(203, 161, 53)]
   #;[border-bottom-color rgb(203, 161, 53)]
   #;[border-left-color rgb(203, 161, 53)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class cmbox))
   [margin-top (px 3)]
   [margin-right (% 10)]
   [margin-bottom (px 3)]
   [margin-left (% 10)]
   #;[border-collapse collapse]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(223, 232, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class cmbox-speedy))
   [margin-top (px 4)]
   [margin-bottom (px 4)]
   [border-top-width (px 4)]
   [border-right-width (px 4)]
   [border-bottom-width (px 4)]
   [border-left-width (px 4)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(178, 34, 34)]
   #;[border-right-color rgb(178, 34, 34)]
   #;[border-bottom-color rgb(178, 34, 34)]
   #;[border-left-color rgb(178, 34, 34)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 219, 219)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class ombox))
   [margin-top (px 4)]
   [margin-right (% 10)]
   [margin-bottom (px 4)]
   [margin-left (% 10)]
   #;[border-collapse collapse]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(249, 249, 249)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class ombox-notice))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class ombox-speedy))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(178, 34, 34)]
   #;[border-right-color rgb(178, 34, 34)]
   #;[border-bottom-color rgb(178, 34, 34)]
   #;[border-left-color rgb(178, 34, 34)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 238, 238)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class ombox-delete))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(178, 34, 34)]
   #;[border-right-color rgb(178, 34, 34)]
   #;[border-bottom-color rgb(178, 34, 34)]
   #;[border-left-color rgb(178, 34, 34)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class ombox-content))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(242, 133, 0)]
   #;[border-right-color rgb(242, 133, 0)]
   #;[border-bottom-color rgb(242, 133, 0)]
   #;[border-left-color rgb(242, 133, 0)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class ombox-style))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(244, 196, 48)]
   #;[border-right-color rgb(244, 196, 48)]
   #;[border-bottom-color rgb(244, 196, 48)]
   #;[border-left-color rgb(244, 196, 48)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class ombox-move))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(153, 50, 204)]
   #;[border-right-color rgb(153, 50, 204)]
   #;[border-bottom-color rgb(153, 50, 204)]
   #;[border-left-color rgb(153, 50, 204)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class ombox-protection))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(187, 187, 170)]
   #;[border-right-color rgb(187, 187, 170)]
   #;[border-bottom-color rgb(187, 187, 170)]
   #;[border-left-color rgb(187, 187, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class tmbox))
   [margin-top (px 4)]
   [margin-right (% 10)]
   [margin-bottom (px 4)]
   [margin-left (% 10)]
   #;[border-collapse collapse]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(192, 192, 144)]
   #;[border-right-color rgb(192, 192, 144)]
   #;[border-bottom-color rgb(192, 192, 144)]
   #;[border-left-color rgb(192, 192, 144)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(248, 234, 186)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (class mediawiki)) (and (class mbox-inside)) (and (class tmbox)))
   [margin-top (px 2)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 0)]
   [width (% 100)])
  ((and (tag table) (class tmbox-speedy))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(178, 34, 34)]
   #;[border-right-color rgb(178, 34, 34)]
   #;[border-bottom-color rgb(178, 34, 34)]
   #;[border-left-color rgb(178, 34, 34)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 238, 238)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class tmbox-delete))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(178, 34, 34)]
   #;[border-right-color rgb(178, 34, 34)]
   #;[border-bottom-color rgb(178, 34, 34)]
   #;[border-left-color rgb(178, 34, 34)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class tmbox-content))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(242, 133, 0)]
   #;[border-right-color rgb(242, 133, 0)]
   #;[border-bottom-color rgb(242, 133, 0)]
   #;[border-left-color rgb(242, 133, 0)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class tmbox-style))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(244, 196, 48)]
   #;[border-right-color rgb(244, 196, 48)]
   #;[border-bottom-color rgb(244, 196, 48)]
   #;[border-left-color rgb(244, 196, 48)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class tmbox-move))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(153, 50, 204)]
   #;[border-right-color rgb(153, 50, 204)]
   #;[border-bottom-color rgb(153, 50, 204)]
   #;[border-left-color rgb(153, 50, 204)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((or (and (tag table) (class tmbox-protection)) (and (tag table) (class tmbox-notice)))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(192, 192, 144)]
   #;[border-right-color rgb(192, 192, 144)]
   #;[border-bottom-color rgb(192, 192, 144)]
   #;[border-left-color rgb(192, 192, 144)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class dmbox))
   #;[clear both]
   [margin-top 0.9em]
   [margin-right 1em]
   [margin-bottom 0.9em]
   [margin-left 1em]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(204, 204, 204)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(204, 204, 204)]
   #;[background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class fmbox))
   #;[clear both]
   [margin-top 0.2em]
   [margin-right (px 0)]
   [margin-bottom 0.2em]
   [margin-left (px 0)]
   [width (% 100)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(249, 249, 249)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class fmbox-warning))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(187, 112, 112)]
   #;[border-right-color rgb(187, 112, 112)]
   #;[border-bottom-color rgb(187, 112, 112)]
   #;[border-left-color rgb(187, 112, 112)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 219, 219)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((or (and (tag div) (class mw-warning-with-logexcerpt)) (and (tag div) (class mw-lag-warn-high)) (and (tag div) (class mw-cascadeprotectedwarning)) (and (tag div) (id mw-protect-cascadeon)) (and (tag div) (class titleblacklist-warning)) (and (tag div) (class locked-warning)))
   #;[clear both]
   [margin-top 0.2em]
   [margin-right (px 0)]
   [margin-bottom 0.2em]
   [margin-left (px 0)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(187, 112, 112)]
   #;[border-right-color rgb(187, 112, 112)]
   #;[border-bottom-color rgb(187, 112, 112)]
   #;[border-left-color rgb(187, 112, 112)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 219, 219)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [padding-top 0.25em]
   [padding-right 0.9em]
   [padding-bottom 0.25em]
   [padding-left 0.9em])
  ((or (and (tag div) (class mw-lag-warn-normal)) (and (tag div) (class fmbox-system)))
   #;[clear both]
   [margin-top 0.2em]
   [margin-right (px 0)]
   [margin-bottom 0.2em]
   [margin-left (px 0)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(249, 249, 249)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [padding-top 0.25em]
   [padding-right 0.9em]
   [padding-bottom 0.25em]
   [padding-left 0.9em])
  ((desc (and (tag body) (class mediawiki)) (and (tag table) (class mbox-small)))
   #;[clear right]
   [float right]
   [margin-top (px 4)]
   [margin-right (px 0)]
   [margin-bottom (px 4)]
   [margin-left 1em]
   [width (px 238)]
   #;[font-size (% 88)]
   #;[line-height 1.25em])
  ((desc (and (tag body) (class mediawiki)) (and (tag table) (class mbox-small-left)))
   [margin-top (px 4)]
   [margin-right 1em]
   [margin-bottom (px 4)]
   [margin-left (px 0)]
   [width (px 238)]
   #;[border-collapse collapse]
   #;[font-size (% 88)]
   #;[line-height 1.25em])
  ((or (desc (and (class compact-ambox)) (and (tag table)) (and (class mbox-image))) (desc (and (class compact-ambox)) (and (tag table)) (and (class mbox-imageright))) (desc (and (class compact-ambox)) (and (tag table)) (and (class mbox-empty-cell))))
   [display none])
  ((desc (and (class compact-ambox)) (and (tag table) (class ambox)))
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
   #;[border-collapse collapse]
   #;[background-color transparent]
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
   [margin-left 1.6em]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [width auto]
   [display block])
  ((desc (and (tag body) (class mediawiki)) (and (class compact-ambox)) (and (tag table) (class mbox-small-left)))
   #;[font-size (% 100)]
   [width auto]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class compact-ambox)) (and (tag table)) (and (class mbox-text)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class compact-ambox)) (and (tag table)) (and (class mbox-text-span)))
   [display list-item]
   #;[line-height 1.5em]
   #;[list-style-type square]
   #;[list-style-image url("//en.wikipedia.org/w/skins/MonoBook/bullet.gif")])
  ((desc (and (class compact-ambox)) (and (class hide-when-compact)))
   [display none])
  ((and (tag div) (class noarticletext))
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
   #;[background-size auto auto]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (class visualhide))
   [position absolute]
   [left (px -10000)]
   [top auto]
   [width (px 1)]
   [height (px 1)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class hiddenStructure))
   [display inline]
   #;[color rgb(255, 0, 0)]
   #;[background-color rgb(0, 255, 0)])
  ((desc (and (class check-icon)) (and (tag a) (class new)))
   [display none])
  ((and (tag div) (class NavFrame))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 4)]
   [padding-right (px 4)]
   [padding-bottom (px 4)]
   [padding-left (px 4)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [text-align center]
   #;[border-collapse collapse]
   #;[font-size (% 95)])
  (("div.NavFrame + div.NavFrame" (or))
   [border-top-style hidden])
  ((and (tag div) (class NavPic))
   #;[background-color rgb(255, 255, 255)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 2)]
   [padding-right (px 2)]
   [padding-bottom (px 2)]
   [padding-left (px 2)]
   [float left])
  ((desc (and (tag div) (class NavFrame)) (and (tag div) (class NavHead)))
   #;[line-height 1.6em]
   #;[font-weight bold]
   #;[background-color rgb(204, 204, 255)]
   [position relative])
  ((and (tag div) (class NavEnd))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[line-height (px 1)]
   #;[clear both])
  ((and (tag a) (class NavToggle))
   [position absolute]
   [top (px 0)]
   [right (px 3)]
   #;[font-weight normal]
   #;[font-size (% 90)])
  ((and (tag div) (class hatnote))
   [padding-left 1.6em]
   [margin-bottom 0.5em])
  (("div.hatnote + div.hatnote" (or))
   [margin-top -0.5em])
  ((desc (and (class listify)) (and (tag td)))
   [display list-item])
  ((desc (and (class listify)) (and (tag tr)))
   [display block])
  ((desc (and (class listify)) (and (tag table)))
   [display block])
  ((or (and (class geo-default)) (and (class geo-dms)) (and (class geo-dec)))
   [display inline])
  ((or (and (class geo-nondefault)) (and (class geo-multi-punct)))
   [display none])
  ((or (desc (and (class hlist)) (and (class tocnumber))) (desc (and (class hlist)) (and (class toctext))))
   [display inline])
  ((desc (and (class nonumtoc)) (and (class tocnumber)))
   [display none])
  ((or (desc (and (class nonumtoc)) (and (id toc)) (and (tag ul))) (desc (and (class nonumtoc)) (and (class toc)) (and (tag ul))))
   #;[line-height 1.5em]
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside]
   [margin-top 0.3em]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((or (desc (and (class hlist) (class nonumtoc)) (and (id toc)) (and (tag ul)) (and (tag ul))) (desc (and (class hlist) (class nonumtoc)) (and (class toc)) (and (tag ul)) (and (tag ul))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((or (desc (and (class toclimit-2)) (and (class toclevel-1)) (and (tag ul))) (desc (and (class toclimit-3)) (and (class toclevel-2)) (and (tag ul))) (desc (and (class toclimit-4)) (and (class toclevel-3)) (and (tag ul))) (desc (and (class toclimit-5)) (and (class toclevel-4)) (and (tag ul))) (desc (and (class toclimit-6)) (and (class toclevel-5)) (and (tag ul))) (desc (and (class toclimit-7)) (and (class toclevel-6)) (and (tag ul))))
   [display none])
  ((desc (and (tag blockquote) (class templatequote)) (and (tag div) (class templatequotecite)))
   #;[line-height 1.5em]
   [text-align left]
   [padding-left 1.6em]
   [margin-top (px 0)])
  ((and (tag div) (class user-block))
   [padding-top (px 5)]
   [padding-right (px 5)]
   [padding-bottom (px 5)]
   [padding-left (px 5)]
   [margin-bottom 0.5em]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(169, 169, 169)]
   #;[border-right-color rgb(169, 169, 169)]
   #;[border-bottom-color rgb(169, 169, 169)]
   #;[border-left-color rgb(169, 169, 169)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 239, 213)])
  ((and (class template-documentation))
   #;[clear both]
   [margin-top 1em]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(236, 252, 244)]
   [padding-top 1em]
   [padding-right 1em]
   [padding-bottom 1em]
   [padding-left 1em])
  ((desc (and (class imagemap-inline)) (and (tag div)))
   [display inline])
  ((and (id wpUploadDescription))
   [height 13em])
  ((or (desc (and (tag body) (class rtl)) (and (id mw-articlefeedbackv5))) (desc (and (tag body) (class rtl)) (and (id mw-articlefeedback))))
   [display block]
   [margin-bottom 1em]
   #;[clear right]
   [float right])
  ((desc (and (class wpb)) (and (class wpb-header)))
   [display none])
  ((desc (and (class wpbs-inner)) (and (class wpb)) (and (class wpb-header)))
   [display block])
  ((desc (and (class wpbs-inner)) (and (class wpb)) (and (class wpb-header)))
   [display table-row])
  ((desc (and (class wpbs-inner)) (and (class wpb-outside)))
   [display none])
  ((or (and (class sysop-show)) (and (class accountcreator-show)) (and (class templateeditor-show)) (and (class autoconfirmed-show)))
   [display none])
  ((or (desc (and (class ve-ui-mwNoticesPopupTool-item)) (and (class editnotice-redlink))) (desc (and (class mw-ve-editNotice)) (and (class editnotice-redlink))))
   [display none])
  ((and (tag ul) (class permissions-errors))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (class transborder))
   [border-top-width medium]
   [border-right-width medium]
   [border-bottom-width medium]
   [border-left-width medium]
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
  ((desc (and *) (and (tag html)) (and (class transborder)))
   [border-top-width medium]
   [border-right-width medium]
   [border-bottom-width medium]
   [border-left-width medium]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(0, 0, 1)]
   #;[border-right-color rgb(0, 0, 1)]
   #;[border-bottom-color rgb(0, 0, 1)]
   #;[border-left-color rgb(0, 0, 1)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((or (and (class mwe-math-fallback-image-display)) (and (class mwe-math-mathml-display)))
   [margin-left 1.6em]
   [margin-top 0.6em]
   [margin-bottom 0.6em])
  ((desc (and (class mwe-math-mathml-display)) (and (tag math)))
   [display inline])
  ((or (and (tag table) (id mw-prefixindex-list-table)) (and (tag table) (id mw-prefixindex-nav-table)))
   [width (% 98)])
  ((and (class portal-column-left))
   [float left]
   [width (% 50)])
  ((and (class portal-column-right))
   [float right]
   [width (% 49)])
  ((and (class portal-column-left-wide))
   [float left]
   [width (% 60)])
  ((and (class portal-column-right-narrow))
   [float right]
   [width (% 39)])
  ((and (class portal-column-left-extra-wide))
   [float left]
   [width (% 70)])
  ((and (class portal-column-right-extra-narrow))
   [float right]
   [width (% 29)])
  ((desc (and (id bodyContent)) (and (class letterhead)))
   #;[background-image url("//upload.wikimedia.org/wikipedia/commons/e/e0/Tan-page-corner.png")]
   #;[background-repeat no-repeat]
   [padding-top 2em]
   [padding-right 2em]
   [padding-bottom 2em]
   [padding-left 2em]
   #;[background-color rgb(250, 249, 242)])
  ((desc (and (class treeview)) (and (tag ul)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class treeview)) (and (tag li)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[list-style-type none]
   #;[list-style-image none])
  ((desc (and (class treeview)) (and (tag li)) (and (tag li)))
   #;[background-color transparent]
   #;[background-image url("//upload.wikimedia.org/wikipedia/commons/f/f2/Treeview-grey-line.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [padding-left (px 20)]
   #;[text-indent 0.3em])
  ((child (desc (and (class treeview)) (and (tag li) (class emptyline))) (and (tag ul)))
   [margin-left (px -1)])
  ((or (desc (and (tag td)) (and (class sortkey))) (desc (and (tag th)) (and (class sortkey))))
   [display none])
  ((desc (and (class inputbox-hidecheckboxes)) (and (tag form)) (and (class inputbox-element)))
   [display none])
  ((desc (and (class PopUpMediaTransform)) (and (tag a)) (and (class play-btn-large)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [top auto]
   [right auto]
   [bottom (px 0)]
   [left (px 0)])
  ((desc (and (class mw-ve-editNotice)) (and (class mbox-image)))
   [display none])
  ((or (desc (and (class page-Main_Page)) (and (id deleteconfirm))) (desc (and (class page-Main_Page)) (and (id t-cite))) (desc (and (class page-Main_Page)) (and (id footer-info-lastmod))) (desc (and (class action-view) (class page-Main_Page)) (and (id siteSub))) (desc (and (class action-view) (class page-Main_Page)) (and (id contentSub))) (desc (and (class action-view) (class page-Main_Page)) (and (class firstHeading))))
   [display none])
  ((and (id coordinates))
   [position absolute]
   [top (px 0)]
   [right (px 0)]
   [float right]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[line-height 1.5em]
   [text-align right]
   #;[text-indent (px 0)]
   #;[font-size (% 85)]
   #;[text-transform none]
   #;[white-space nowrap])
  ((and (tag div) (class flaggedrevs_short))
   [position absolute]
   [top -3em]
   [right (px 100)]
   #;[z-index 1])
  ((and (id siteSub))
   [display block]
   #;[font-size (% 92)])
  ((desc (and (class mw-body)) (and (class mw-indicators)))
   [padding-top (px 5.6)])
  ((and (class mw-collapsible-toggle))
   [float right])
  ((or (desc (and (class mw-content-ltr)) (and (class mw-collapsible-toggle))) (desc (and (class mw-content-rtl)) (and (class mw-content-ltr)) (and (class mw-collapsible-toggle))))
   [float right])
  ((or (desc (and (class mw-content-rtl)) (and (class mw-collapsible-toggle))) (desc (and (class mw-content-ltr)) (and (class mw-content-rtl)) (and (class mw-collapsible-toggle))))
   [float left])
  ((or (desc (and (tag caption)) (and (class mw-collapsible-toggle))) (desc (and (class mw-content-ltr)) (and (tag caption)) (and (class mw-collapsible-toggle))) (desc (and (class mw-content-rtl)) (and (tag caption)) (and (class mw-collapsible-toggle))) (desc (and (class mw-content-rtl)) (and (class mw-content-ltr)) (and (tag caption)) (and (class mw-collapsible-toggle))) (desc (and (class mw-content-ltr)) (and (class mw-content-rtl)) (and (tag caption)) (and (class mw-collapsible-toggle))))
   [float none])
  ((or (desc (and (tag li)) (and (class mw-collapsible-toggle))) (desc (and (class mw-content-ltr)) (and (tag li)) (and (class mw-collapsible-toggle))) (desc (and (class mw-content-rtl)) (and (tag li)) (and (class mw-collapsible-toggle))) (desc (and (class mw-content-rtl)) (and (class mw-content-ltr)) (and (tag li)) (and (class mw-collapsible-toggle))) (desc (and (class mw-content-ltr)) (and (class mw-content-rtl)) (and (tag li)) (and (class mw-collapsible-toggle))))
   [float none])
  ((and (class suggestions))
   [overflow-x hidden]
   [overflow-y hidden]
   [position absolute]
   [top (px 0)]
   [left (px 0)]
   [width (px 0)]
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
   #;[z-index 1099]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px -1)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (class suggestions-special))
   [position relative]
   #;[background-color white]
   #;[cursor pointer]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [margin-top (px -2)]
   [display none]
   [padding-top (px 3.9)]
   [padding-right (px 3.9)]
   [padding-bottom (px 3.9)]
   [padding-left (px 3.9)]
   #;[line-height (px 19.5)])
  ((and (class suggestions-results))
   #;[background-color white]
   #;[cursor pointer]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
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
  ((and (class suggestions-result))
   #;[color black]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[line-height 1.5em]
   [padding-top 0.01em]
   [padding-right 0.25em]
   [padding-bottom 0.01em]
   [padding-left 0.25em]
   [text-align left]
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis]
   #;[white-space nowrap])
  ((desc (and (class suggestions-special)) (and (class special-label)))
   #;[color gray]
   [text-align left])
  ((desc (and (class suggestions-special)) (and (class special-query)))
   #;[color black]
   #;[font-style italic]
   [text-align left])
  ((and (class wp-teahouse-question-form))
   [position absolute]
   [margin-left auto]
   [margin-right auto]
   #;[background-color rgb(244, 243, 240)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(167, 215, 249)]
   #;[border-right-color rgb(167, 215, 249)]
   #;[border-bottom-color rgb(167, 215, 249)]
   #;[border-left-color rgb(167, 215, 249)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [padding-top 1em]
   [padding-right 1em]
   [padding-bottom 1em]
   [padding-left 1em])
  ((and (id wp-th-question-ask))
   [float right])
  ((and (class wp-teahouse-respond-form))
   [position absolute]
   [margin-left auto]
   [margin-right auto]
   #;[background-color rgb(244, 243, 240)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(167, 215, 249)]
   #;[border-right-color rgb(167, 215, 249)]
   #;[border-bottom-color rgb(167, 215, 249)]
   #;[border-left-color rgb(167, 215, 249)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [padding-top 1em]
   [padding-right 1em]
   [padding-bottom 1em]
   [padding-left 1em])
  ((and (class wp-th-respond))
   [float right])
  ((and (class referencetooltip))
   [position absolute]
   #;[list-style-type none]
   #;[list-style-position outside]
   #;[list-style-image none]
   #;[opacity (px 0)]
   #;[font-size (px 10)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[z-index 5]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((desc (and (class referencetooltip)) (and (tag li)))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(8, 0, 134)]
   #;[border-right-color rgb(8, 0, 134)]
   #;[border-bottom-color rgb(8, 0, 134)]
   #;[border-left-color rgb(8, 0, 134)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[max-width (px 260)]
   [padding-top (px 10)]
   [padding-right (px 8)]
   [padding-bottom (px 13)]
   [padding-left (px 8)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[background-color rgb(247, 247, 247)]
   #;[box-shadow 2px 4px 2px rgba(0, 0, 0, 0.3)]
   [width (px 260)])
  ((".referencetooltip li + li" (or))
   [margin-left (px 7)]
   [margin-top (px -2)]
   [border-bottom-width (px 0)]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [height (px 3)]
   [width (px 0)]
   #;[background-color transparent]
   #;[box-shadow none]
   [border-top-width (px 12)]
   [border-top-style solid]
   #;[border-top-color rgb(8, 0, 134)]
   [border-right-width (px 7)]
   [border-right-style solid]
   #;[border-right-color transparent]
   [border-left-width (px 7)]
   [border-left-style solid]
   #;[border-left-color transparent])
  ((".referencetooltip > li + li::after" (or))
   #;[content ""]
   [border-top-width (px 8)]
   [border-top-style solid]
   #;[border-top-color rgb(247, 247, 247)]
   [border-right-width (px 5)]
   [border-right-style solid]
   #;[border-right-color transparent]
   [border-left-width (px 5)]
   [border-left-style solid]
   #;[border-left-color transparent]
   [margin-top (px -12)]
   [margin-left (px -5)]
   #;[z-index 1]
   [height (px 0)]
   [width (px 0)]
   [display block])
  ((desc (and (class client-js)) (and (tag body)) (and (class referencetooltip)) (and (tag li)) (and (tag li)))
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
   [height auto]
   [width auto]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [position static])
  ((and (class RTflipped))
   [padding-top (px 13)])
  ((".referencetooltip.RTflipped li + li" (or))
   [position absolute]
   [top (px 2)]
   [border-top-width (px 0)]
   [border-top-style none]
   #;[border-top-color -moz-use-text-color]
   [border-bottom-width (px 12)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(8, 0, 134)])
  ((".referencetooltip.RTflipped li + li::after" (or))
   [border-top-width (px 0)]
   [border-top-style none]
   #;[border-top-color -moz-use-text-color]
   [border-bottom-width (px 8)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(247, 247, 247)]
   [position absolute]
   [margin-top (px 7)])
  ((and (class RTsettings))
   [float right]
   [height (px 24)]
   [width (px 24)]
   #;[cursor pointer]
   #;[background-image linear-gradient(transparent, transparent), url("//upload.wikimedia.org/wikipedia/commons/7/77/Gear_icon.svg")]
   [margin-top (px -9)]
   [margin-right (px -7)]
   #;[transition-property opacity]
   #;[transition-duration 0.15s]
   #;[transition-timing-function ease]
   #;[transition-delay (px 0)]
   #;[opacity 0.6])
  ((and (class RTTarget))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(8, 0, 134)]
   #;[border-right-color rgb(8, 0, 134)]
   #;[border-bottom-color rgb(8, 0, 134)]
   #;[border-left-color rgb(8, 0, 134)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (class mw-ui-button))
   #;[font-family inherit]
   #;[font-size 1em]
   [display inline-block]
   [padding-top 0.5em]
   [padding-right 1em]
   [padding-bottom 0.5em]
   [padding-left 1em]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [box-sizing border-box]
   #;[background-color rgb(255, 255, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[color rgb(85, 85, 85)]
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
   #;[border-top-left-radius (px 2)]
   #;[border-top-right-radius (px 2)]
   #;[border-bottom-right-radius (px 2)]
   #;[border-bottom-left-radius (px 2)]
   #;[min-width 4em]
   #;[vertical-align middle]
   [text-align center]
   #;[font-weight bold]
   #;[cursor pointer])
  ((and (class mw-ui-button) (class mw-ui-block))
   [display block]
   [width (% 100)])
  ((or (and (class mw-ui-button) (class mw-ui-progressive)) (and (class mw-ui-button) (class mw-ui-primary)))
   #;[background-color rgb(52, 123, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[color rgb(255, 255, 255)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(52, 123, 255)]
   #;[border-right-color rgb(52, 123, 255)]
   #;[border-bottom-color rgb(52, 123, 255)]
   #;[border-left-color rgb(52, 123, 255)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[text-shadow (px 0)])
  ((and (class mw-ui-button) (class mw-ui-constructive))
   #;[background-color rgb(0, 175, 137)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[color rgb(255, 255, 255)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(0, 175, 137)]
   #;[border-right-color rgb(0, 175, 137)]
   #;[border-bottom-color rgb(0, 175, 137)]
   #;[border-left-color rgb(0, 175, 137)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[text-shadow (px 0)])
  ((and (class mw-ui-button) (class mw-ui-destructive))
   #;[background-color rgb(209, 29, 19)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[color rgb(255, 255, 255)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(209, 29, 19)]
   #;[border-right-color rgb(209, 29, 19)]
   #;[border-bottom-color rgb(209, 29, 19)]
   #;[border-left-color rgb(209, 29, 19)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[text-shadow (px 0)])
  ((and (class mw-ui-button) (class mw-ui-quiet))
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
   #;[text-shadow none]
   #;[color rgb(85, 85, 85)])
  ((child (and (class mw-ui-button-group)) (and *))
   #;[min-width (px 48)]
   #;[border-top-left-radius (px 0)]
   #;[border-top-right-radius (px 0)]
   #;[border-bottom-right-radius (px 0)]
   #;[border-bottom-left-radius (px 0)]
   [float left])
  ((".mw-ui-button-group > :not(:first-child)" (or))
   [border-left-width (px 0)]
   [border-left-style none]
   #;[border-left-color -moz-use-text-color])
  ((and (class mw-ui-icon))
   [position relative]
   #;[min-height 1.5em]
   #;[min-width 1.5em])
  ((and (class mw-ui-icon) (class mw-ui-icon-element))
   #;[text-indent (px -999)]
   [overflow-x hidden]
   [overflow-y hidden]
   [width 3.5em]
   #;[min-width 3.5em]
   #;[max-width 3.5em])
  ((".mw-ui-icon.mw-ui-icon-element::before" (or))
   [left (px 0)]
   [right (px 0)]
   [position absolute]
   [margin-top (px 0)]
   [margin-right 1em]
   [margin-bottom (px 0)]
   [margin-left 1em])
  ((".mw-ui-icon.mw-ui-icon-before::before, .mw-ui-icon.mw-ui-icon-element::before" (or))
   #;[background-position 50% 50%]
   #;[background-repeat no-repeat]
   #;[background-size 100% auto]
   [float left]
   [display block]
   #;[min-height 1.5em]
   #;[content ""])
  ((".mw-ui-icon.mw-ui-icon-before::before" (or))
   [position relative]
   [width 1.5em]
   [margin-right 1em])
  ((desc (and (id p-lang)) (and (class uls-settings-trigger)))
   #;[background-color transparent]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position right top]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   #;[background-image linear-gradient(transparent, transparent), url("data:image/svg+xml,%3C%3Fxml%20version%3D%221.0%22%20encoding%3D%22UTF-8%22%3F%3E%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%20width%3D%2214%22%20height%3D%2232%22%3E%3Cdefs%3E%3Cpath%20d%3D%22M14%209.3V6.73l-1.575-.264c-.117-.44-.292-.848-.496-1.2l.93-1.285-1.81-1.84-1.31.908c-.38-.205-.79-.38-1.196-.497L8.284%201H5.716l-.263%201.578c-.437.117-.816.293-1.196.497L2.975%202.17%201.137%203.98l.934%201.287c-.2.38-.376.79-.493%201.228L0%206.73V9.3l1.575.264c.117.438.292.818.496%201.198l-.93%201.315L2.95%2013.89l1.312-.938c.38.205.787.38%201.224.497L5.746%2015h2.566l.263-1.578c.408-.117.817-.293%201.196-.497l1.315.935%201.81-1.812-.935-1.315c.203-.38.38-.76.495-1.2L14%209.303zm-7%201.404c-1.488%200-2.683-1.2-2.683-2.69S5.542%205.327%207%205.327c1.458%200%202.683%201.198%202.683%202.69%200%201.49-1.195%202.688-2.683%202.688z%22%20id%3D%22a%22%2F%3E%3C%2Fdefs%3E%3Cuse%20xlink%3Ahref%3D%22%23a%22%20fill%3D%22%23808080%22%2F%3E%3Cuse%20transform%3D%22translate%280%2016%29%22%20xlink%3Ahref%3D%22%23a%22%20fill%3D%22%23555%22%2F%3E%3C%2Fsvg%3E%0A")]
   [height (px 16)]
   [width (px 14)]
   [float right]
   #;[cursor pointer])
  ((desc (and (class skin-vector)) (and (id p-lang)) (and (class uls-settings-trigger)))
   [margin-top (px 3)])
  ((or (and (id mw-wlheader-showupdated)) (and (id mw-wlheader-bold)) (and (id mw-wlheader-green)) (and (id mw-watchlist-resetbutton)))
   [display none])
  ((desc (and (class suggestions)) (and (tag a) (class mw-searchSuggest-link)) (and (class special-query)))
   [overflow-x hidden]
   [overflow-y hidden]
   #;[text-overflow ellipsis]
   #;[white-space nowrap])
  ((and (class mw-mmv-overlay))
   [position fixed]
   [top (px 0)]
   [left (px 0)]
   [right (px 0)]
   [bottom (px 0)]
   #;[z-index 1000]
   #;[background-color rgb(0, 0, 0)])
  ((and (tag body) (class mw-mmv-lightbox-open))
   [overflow-y auto])
  ((or (desc (and (tag body) (class mw-mmv-lightbox-open)) (and (id mw-page-base))) (desc (and (tag body) (class mw-mmv-lightbox-open)) (and (id mw-head-base))) (desc (and (tag body) (class mw-mmv-lightbox-open)) (and (id mw-navigation))) (desc (and (tag body) (class mw-mmv-lightbox-open)) (and (id content))) (desc (and (tag body) (class mw-mmv-lightbox-open)) (and (id footer))) (desc (and (tag body) (class mw-mmv-lightbox-open)) (and (id globalWrapper))))
   [display none])
  ((child (and (tag body) (class mw-mmv-lightbox-open)) (and *))
   [display none])
  ((or (child (and (tag body) (class mw-mmv-lightbox-open)) (and (class mw-mmv-overlay))) (child (and (tag body) (class mw-mmv-lightbox-open)) (and (class mw-mmv-wrapper))))
   [display block])
  ((and (class mw-mmv-filepage-buttons))
   [margin-top (px 5)])
  ((or (desc (and (class mw-mmv-filepage-buttons)) (and (class mw-mmv-view-expanded))) (desc (and (class mw-mmv-filepage-buttons)) (and (class mw-mmv-view-config))))
   [display block])
  ((or (and (id mw-wlheader-showupdated)) (and (id mw-wlheader-green)))
   [display inline])
  ((and (id mw-watchlist-resetbutton))
   [display block])
  ((and (tag blockquote))
   [overflow-x hidden]
   [overflow-y hidden]
   [margin-top (px 14)]
   [margin-right (px 0)]
   [margin-bottom (px 14)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 40)]
   [padding-bottom (px 0)]
   [padding-left (px 40)])
  ((desc (and (tag body) (class page-Main_Page)) (and (id ca-delete)))
   [display none])
  ((and (id toolbar))
   [height (px 22)]
   [margin-bottom (px 6)])
  ((and (id editpage-specialchars))
   [display none])
  ((desc (and (class citation)) (and (class printonly)))
   [display none])
  ((or (and (tag ol) (class references)) (and (tag div) (class reflist)) (and (tag div) (class refbegin)))
   #;[font-size (% 90)]
   [margin-bottom (px 6.3)])
  ((and (tag span) (class brokenref))
   [display none])
  ((and (tag div) (class columns))
   [margin-top 0.3em])
  ((or (desc (and (tag div) (class columns)) (and (tag dl))) (desc (and (tag div) (class columns)) (and (tag ol))) (desc (and (tag div) (class columns)) (and (tag ul))))
   [margin-top (px 0)])
  ((desc (and (class flowlist)) (and (tag ul)))
   [overflow-x hidden]
   [margin-left (px 0)]
   [padding-left 1.6em])
  ((desc (and (class flowlist)) (and (tag ol)))
   [overflow-x hidden]
   [margin-left (px 0)]
   [padding-left 3.2em])
  ((desc (and (class flowlist)) (and (tag dl)))
   [overflow-x hidden])
  ((or (desc (and (class hlist)) (and (tag dl))) (desc (and (class hlist)) (and (tag ol))) (desc (and (class hlist)) (and (tag ul))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((or (desc (and (class hlist)) (and (tag dd))) (desc (and (class hlist)) (and (tag dt))) (desc (and (class hlist)) (and (tag li))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [display inline])
  ((or (and (class hlist) (class inline)) (desc (and (class hlist) (class inline)) (and (tag dl))) (desc (and (class hlist) (class inline)) (and (tag ol))) (desc (and (class hlist) (class inline)) (and (tag ul))) (desc (and (class hlist)) (and (tag dl)) (and (tag dl))) (desc (and (class hlist)) (and (tag dl)) (and (tag ol))) (desc (and (class hlist)) (and (tag dl)) (and (tag ul))) (desc (and (class hlist)) (and (tag ol)) (and (tag dl))) (desc (and (class hlist)) (and (tag ol)) (and (tag ol))) (desc (and (class hlist)) (and (tag ol)) (and (tag ul))) (desc (and (class hlist)) (and (tag ul)) (and (tag dl))) (desc (and (class hlist)) (and (tag ul)) (and (tag ol))) (desc (and (class hlist)) (and (tag ul)) (and (tag ul))))
   [display inline])
  ((desc (and (class hlist)) (and (class mw-empty-li)))
   [display none])
  ((or (desc (and (class plainlist)) (and (tag ol))) (desc (and (class plainlist)) (and (tag ul))))
   #;[line-height inherit]
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((or (desc (and (class plainlist)) (and (tag ol)) (and (tag li))) (desc (and (class plainlist)) (and (tag ul)) (and (tag li))))
   [margin-bottom (px 0)])
  ((and (class navbox))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [width (% 100)]
   [margin-top auto]
   [margin-right auto]
   [margin-bottom auto]
   [margin-left auto]
   #;[clear both]
   #;[font-size (% 88)]
   [text-align center]
   [padding-top (px 1)]
   [padding-right (px 1)]
   [padding-bottom (px 1)]
   [padding-left (px 1)])
  ((or (and (class navbox-inner)) (and (class navbox-subgroup)))
   [width (% 100)])
  ((or (and (class navbox-group)) (and (class navbox-title)) (and (class navbox-abovebelow)))
   [padding-top (px (/ 37 12))]
   [padding-right (px 12.3)]
   [padding-bottom (px (/ 37 12))]
   [padding-left (px 12.3)]
   #;[line-height (px (/ 554 30))]
   [text-align center])
  ((and (tag th) (class navbox-group))
   #;[white-space nowrap]
   [text-align right])
  ((and (tag table) (class navbox))
   [margin-top (px 12.3)])
  ((desc (and (tag table) (class navbox)) (and (tag table) (class navbox)))
   [margin-top (px 0)])
  (("table.navbox + table.navbox" (or (id e10031)))
   [margin-top (px -1)])
  ((or (desc (and (class navbox)) (and (class hlist)) (and (tag td)) (and (tag dl))) (desc (and (class navbox)) (and (class hlist)) (and (tag td)) (and (tag ol))) (desc (and (class navbox)) (and (class hlist)) (and (tag td)) (and (tag ul))) (desc (and (class navbox)) (and (tag td) (class hlist)) (and (tag dl))) (desc (and (class navbox)) (and (tag td) (class hlist)) (and (tag ol))) (desc (and (class navbox)) (and (tag td) (class hlist)) (and (tag ul))))
   [padding-top (px (/ 23 15))]
   [padding-right (px 0)]
   [padding-bottom (px (/ 23 15))]
   [padding-left (px 0)])
  ((and (class navbar))
   [display inline]
   #;[font-size (% 88)]
   #;[font-weight normal])
  ((desc (and (class navbar)) (and (tag ul)))
   [display inline]
   #;[white-space nowrap])
  ((".navbar.mini li abbr[title]" (or (id e10025) (id e10026) (id e10027)))
   #;[font-variant-alternates normal]
   #;[font-variant-caps small-caps]
   #;[font-variant-east-asian normal]
   #;[font-variant-ligatures normal]
   #;[font-variant-numeric normal]
   #;[font-variant-position normal]
   [border-bottom-width medium]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color]
   #;[text-decoration-color -moz-use-text-color]
   #;[text-decoration-line none]
   #;[text-decoration-style solid]
   #;[cursor inherit])
  ((desc (and (class navbox)) (and (class navbar)))
   [display block]
   #;[font-size (% 100)])
  ((desc (and (class navbox-title)) (and (class navbar)))
   [float left]
   [text-align left]
   [margin-right (px (/ 37 6))]
   [width (px 73.9)])
  ((and (class collapseButton))
   [float right]
   #;[font-weight normal]
   [margin-left (px (/ 37 6))]
   [text-align right]
   [width auto])
  ((desc (and (class navbox)) (and (class collapseButton)))
   [width (px 73.9)])
  ((and (class mw-collapsible-toggle))
   #;[font-weight normal]
   [text-align right])
  ((desc (and (class navbox)) (and (class mw-collapsible-toggle)))
   [width 6em])
  ((and (class infobox))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[border-spacing (px 3)]
   #;[background-color rgb(249, 249, 249)]
   #;[color black]
   [margin-top (px (/ 37 6))]
   [margin-right (px 0)]
   [margin-bottom (px (/ 37 6))]
   [margin-left (px 12.3)]
   [padding-top (px (/ 37 15))]
   [padding-right (px (/ 37 15))]
   [padding-bottom (px (/ 37 15))]
   [padding-left (px (/ 37 15))]
   [float right]
   #;[clear right]
   #;[font-size (% 88)]
   #;[line-height (px (/ 554 30))])
  ((desc (and (class infobox)) (and (tag caption)))
   #;[font-size (% 125)]
   #;[font-weight bold]
   [padding-top 0.2em]
   [padding-right 0.2em]
   [padding-bottom 0.2em]
   [padding-left 0.2em])
  ((or (desc (and (class infobox)) (and (tag td))) (desc (and (class infobox)) (and (tag th))))
   #;[vertical-align top]
   [text-align left])
  ((or (desc (and (class infobox) (class bordered)) (and (tag td))) (desc (and (class infobox) (class bordered)) (and (tag th))))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((or (desc (and (class infobox) (class bordered)) (and (class borderless)) (and (tag td))) (desc (and (class infobox) (class bordered)) (and (class borderless)) (and (tag th))))
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
  ((and (class infobox) (class sisterproject))
   [width 20em]
   #;[font-size (% 90)])
  ((and (class infobox) (class standard-talk))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(192, 192, 144)]
   #;[border-right-color rgb(192, 192, 144)]
   #;[border-bottom-color rgb(192, 192, 144)]
   #;[border-left-color rgb(192, 192, 144)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(248, 234, 186)])
  ((or (desc (and (class infobox) (class standard-talk) (class bordered)) (and (tag td))) (desc (and (class infobox) (class standard-talk) (class bordered)) (and (tag th))))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(192, 192, 144)]
   #;[border-right-color rgb(192, 192, 144)]
   #;[border-bottom-color rgb(192, 192, 144)]
   #;[border-left-color rgb(192, 192, 144)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((or (desc (and (class infobox) (class bordered)) (and (class mergedtoprow)) (and (tag td))) (desc (and (class infobox) (class bordered)) (and (class mergedtoprow)) (and (tag th))))
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   [border-right-width (px 1)]
   [border-right-style solid]
   #;[border-right-color rgb(170, 170, 170)])
  ((or (desc (and (class infobox) (class bordered)) (and (class mergedrow)) (and (tag td))) (desc (and (class infobox) (class bordered)) (and (class mergedrow)) (and (tag th))))
   [border-top-width (px 0)]
   [border-bottom-width (px 0)]
   [border-left-width (px 0)]
   [border-top-style none]
   [border-bottom-style none]
   [border-left-style none]
   #;[border-top-color -moz-use-text-color]
   #;[border-bottom-color -moz-use-text-color]
   #;[border-left-color -moz-use-text-color]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-right-width (px 1)]
   [border-right-style solid]
   #;[border-right-color rgb(170, 170, 170)])
  ((or (desc (and (class infobox) (class geography)) (and (tag td))) (desc (and (class infobox) (class geography)) (and (tag th))))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   [padding-top 0.4em]
   [padding-right 0.6em]
   [padding-bottom 0.4em]
   [padding-left 0.6em])
  ((or (desc (and (class infobox) (class geography)) (and (class mergedtoprow)) (and (tag td))) (desc (and (class infobox) (class geography)) (and (class mergedtoprow)) (and (tag th))))
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   [padding-top 0.4em]
   [padding-right 0.6em]
   [padding-bottom 0.2em]
   [padding-left 0.6em])
  ((or (desc (and (class infobox) (class geography)) (and (class mergedrow)) (and (tag td))) (desc (and (class infobox) (class geography)) (and (class mergedrow)) (and (tag th))))
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
   [padding-right 0.6em]
   [padding-bottom 0.2em]
   [padding-left 0.6em])
  ((or (desc (and (class infobox) (class geography)) (and (class mergedbottomrow)) (and (tag td))) (desc (and (class infobox) (class geography)) (and (class mergedbottomrow)) (and (tag th))))
   [border-top-width (px 0)]
   [border-top-style none]
   #;[border-top-color -moz-use-text-color]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(170, 170, 170)]
   [padding-top (px 0)]
   [padding-right 0.6em]
   [padding-bottom 0.4em]
   [padding-left 0.6em])
  ((or (desc (and (class infobox) (class geography)) (and (class maptable)) (and (tag td))) (desc (and (class infobox) (class geography)) (and (class maptable)) (and (tag th))))
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
  ((".wikitable.plainrowheaders th[scope=\"row\"]" (or))
   #;[font-weight normal]
   [text-align left])
  ((or (desc (and (class wikitable)) (and (tag td)) (and (tag ul))) (desc (and (class wikitable)) (and (tag td)) (and (tag ol))) (desc (and (class wikitable)) (and (tag td)) (and (tag dl))))
   [text-align left])
  ((or (desc (and (class toc) (class hlist)) (and (tag ul))) (desc (and (id toc) (class hlist)) (and (tag ul))) (desc (and (class wikitable) (class hlist)) (and (tag td)) (and (tag ul))) (desc (and (class wikitable) (class hlist)) (and (tag td)) (and (tag ol))) (desc (and (class wikitable) (class hlist)) (and (tag td)) (and (tag dl))))
   [text-align inherit])
  ((and (tag div) (class listenlist))
   #;[background-color transparent]
   #;[background-image url("//upload.wikimedia.org/wikipedia/commons/4/47/Sound-icon.svg")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size 30px auto]
   [padding-left (px 40)])
  ((and (tag div) (class medialist))
   #;[min-height (px 50)]
   [margin-top 1em]
   [margin-right 1em]
   [margin-bottom 1em]
   [margin-left 1em]
   #;[background-position left top]
   #;[background-repeat no-repeat])
  ((desc (and (tag div) (class medialist)) (and (tag ul)))
   #;[list-style-type none]
   #;[list-style-image none]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (tag div) (class medialist)) (and (tag ul)) (and (tag li)))
   [padding-bottom 0.5em])
  ((desc (and (tag div) (class medialist)) (and (tag ul)) (and (tag li)) (and (tag li)))
   #;[font-size (% 91)]
   [padding-bottom (px 0)])
  (("div#content a.external[href$=\".pdf\"], div#content a.external[href*=\".pdf?\"], div#content a.external[href*=\".pdf#\"], div#content a.external[href$=\".PDF\"], div#content a.external[href*=\".PDF?\"], div#content a.external[href*=\".PDF#\"], div#mw_content a.external[href$=\".pdf\"], div#mw_content a.external[href*=\".pdf?\"], div#mw_content a.external[href*=\".pdf#\"], div#mw_content a.external[href$=\".PDF\"], div#mw_content a.external[href*=\".PDF?\"], div#mw_content a.external[href*=\".PDF#\"]" (or))
   #;[background-color transparent]
   #;[background-image url("//upload.wikimedia.org/wikipedia/commons/2/23/Icons-mini-file_acrobat.gif")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position right center]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [padding-right (px 18)])
  ((or (desc (and (tag div) (id content)) (and (tag span) (class PDFlink)) (and (tag a))) (desc (and (tag div) (id mw_content)) (and (tag span) (class PDFlink)) (and (tag a))))
   #;[background-color transparent]
   #;[background-image url("//upload.wikimedia.org/wikipedia/commons/2/23/Icons-mini-file_acrobat.gif")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position right center]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [padding-right (px 18)])
  ((desc (and (tag div) (class columns-2)) (and (tag div) (class column)))
   [float left]
   [width (% 50)]
   #;[min-width (px 300)])
  ((desc (and (tag div) (class columns-3)) (and (tag div) (class column)))
   [float left]
   [width (% 33.3)]
   #;[min-width (px 200)])
  ((desc (and (tag div) (class columns-4)) (and (tag div) (class column)))
   [float left]
   [width (% 25)]
   #;[min-width (px 150)])
  ((desc (and (tag div) (class columns-5)) (and (tag div) (class column)))
   [float left]
   [width (% 20)]
   #;[min-width (px 120)])
  ((and (class messagebox))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(249, 249, 249)]
   [width (% 80)]
   [margin-top (px 0)]
   [margin-right auto]
   [margin-bottom 1em]
   [margin-left auto]
   [padding-top 0.2em]
   [padding-right 0.2em]
   [padding-bottom 0.2em]
   [padding-left 0.2em])
  ((and (class messagebox) (class merge))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(192, 184, 204)]
   #;[border-right-color rgb(192, 184, 204)]
   #;[border-bottom-color rgb(192, 184, 204)]
   #;[border-left-color rgb(192, 184, 204)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(240, 229, 255)]
   [text-align center])
  ((and (class messagebox) (class cleanup))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(159, 159, 255)]
   #;[border-right-color rgb(159, 159, 255)]
   #;[border-bottom-color rgb(159, 159, 255)]
   #;[border-left-color rgb(159, 159, 255)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(239, 239, 255)]
   [text-align center])
  ((and (class messagebox) (class standard-talk))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(192, 192, 144)]
   #;[border-right-color rgb(192, 192, 144)]
   #;[border-bottom-color rgb(192, 192, 144)]
   #;[border-left-color rgb(192, 192, 144)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(248, 234, 186)]
   [margin-top (px 4)]
   [margin-right auto]
   [margin-bottom (px 4)]
   [margin-left auto])
  ((or (desc (and (class mbox-inside)) (and (class standard-talk))) (and (class messagebox) (class nested-talk)))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(192, 192, 144)]
   #;[border-right-color rgb(192, 192, 144)]
   #;[border-bottom-color rgb(192, 192, 144)]
   #;[border-left-color rgb(192, 192, 144)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(248, 234, 186)]
   [width (% 100)]
   [margin-top (px 2)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 0)]
   [padding-top (px 2)]
   [padding-right (px 2)]
   [padding-bottom (px 2)]
   [padding-left (px 2)])
  ((and (class messagebox) (class small))
   [width (px 238)]
   #;[font-size (% 85)]
   [float right]
   #;[clear both]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom 1em]
   [margin-left 1em]
   #;[line-height 1.25em])
  ((and (class messagebox) (class small-talk))
   [width (px 238)]
   #;[font-size (% 85)]
   [float right]
   #;[clear both]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom 1em]
   [margin-left 1em]
   #;[line-height 1.25em]
   #;[background-color rgb(248, 234, 186)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((or (and (tag th) (class mbox-text)) (and (tag td) (class mbox-text)))
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
   [padding-top 0.25em]
   [padding-right 0.9em]
   [padding-bottom 0.25em]
   [padding-left 0.9em]
   [width (% 100)])
  ((and (tag td) (class mbox-image))
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
   [padding-top (px 2)]
   [padding-right (px 0)]
   [padding-bottom (px 2)]
   [padding-left 0.9em]
   [text-align center])
  ((and (tag td) (class mbox-imageright))
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
   [padding-top (px 2)]
   [padding-right 0.9em]
   [padding-bottom (px 2)]
   [padding-left (px 0)]
   [text-align center])
  ((and (tag td) (class mbox-empty-cell))
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
   [width (px 1)])
  ((and (tag table) (class ambox))
   [margin-top (px 0)]
   [margin-right (% 10)]
   [margin-bottom (px 0)]
   [margin-left (% 10)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(30, 144, 255)]
   #;[background-color rgb(251, 251, 251)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  (("table.ambox + table.ambox" (or))
   [margin-top (px -1)])
  ((or (desc (and (class ambox)) (and (tag th) (class mbox-text))) (desc (and (class ambox)) (and (tag td) (class mbox-text))))
   [padding-top 0.25em]
   [padding-right 0.5em]
   [padding-bottom 0.25em]
   [padding-left 0.5em])
  ((desc (and (class ambox)) (and (tag td) (class mbox-image)))
   [padding-top (px 2)]
   [padding-right (px 0)]
   [padding-bottom (px 2)]
   [padding-left 0.5em])
  ((desc (and (class ambox)) (and (tag td) (class mbox-imageright)))
   [padding-top (px 2)]
   [padding-right 0.5em]
   [padding-bottom (px 2)]
   [padding-left (px 0)])
  ((and (tag table) (class ambox-notice))
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(30, 144, 255)])
  ((and (tag table) (class ambox-speedy))
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(178, 34, 34)]
   #;[background-color rgb(255, 238, 238)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class ambox-delete))
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(178, 34, 34)])
  ((and (tag table) (class ambox-content))
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(242, 133, 0)])
  ((and (tag table) (class ambox-style))
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(244, 196, 48)])
  ((and (tag table) (class ambox-move))
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(153, 50, 204)])
  ((and (tag table) (class ambox-protection))
   [border-left-width (px 10)]
   [border-left-style solid]
   #;[border-left-color rgb(187, 187, 170)])
  ((and (tag table) (class imbox))
   [margin-top (px 4)]
   [margin-right (% 10)]
   [margin-bottom (px 4)]
   [margin-left (% 10)]
   #;[border-collapse collapse]
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(30, 144, 255)]
   #;[border-right-color rgb(30, 144, 255)]
   #;[border-bottom-color rgb(30, 144, 255)]
   #;[border-left-color rgb(30, 144, 255)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(251, 251, 251)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (class imbox)) (and (class mbox-text)) (and (class imbox)))
   [margin-top (px 0)]
   [margin-right -0.5em]
   [margin-bottom (px 0)]
   [margin-left -0.5em]
   [display block])
  ((desc (and (class mbox-inside)) (and (class imbox)))
   [margin-top (px 4)]
   [margin-right (px 4)]
   [margin-bottom (px 4)]
   [margin-left (px 4)])
  ((and (tag table) (class imbox-notice))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(30, 144, 255)]
   #;[border-right-color rgb(30, 144, 255)]
   #;[border-bottom-color rgb(30, 144, 255)]
   #;[border-left-color rgb(30, 144, 255)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class imbox-speedy))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(178, 34, 34)]
   #;[border-right-color rgb(178, 34, 34)]
   #;[border-bottom-color rgb(178, 34, 34)]
   #;[border-left-color rgb(178, 34, 34)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 238, 238)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class imbox-delete))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(178, 34, 34)]
   #;[border-right-color rgb(178, 34, 34)]
   #;[border-bottom-color rgb(178, 34, 34)]
   #;[border-left-color rgb(178, 34, 34)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class imbox-content))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(242, 133, 0)]
   #;[border-right-color rgb(242, 133, 0)]
   #;[border-bottom-color rgb(242, 133, 0)]
   #;[border-left-color rgb(242, 133, 0)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class imbox-style))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(244, 196, 48)]
   #;[border-right-color rgb(244, 196, 48)]
   #;[border-bottom-color rgb(244, 196, 48)]
   #;[border-left-color rgb(244, 196, 48)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class imbox-move))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(153, 50, 204)]
   #;[border-right-color rgb(153, 50, 204)]
   #;[border-bottom-color rgb(153, 50, 204)]
   #;[border-left-color rgb(153, 50, 204)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class imbox-protection))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(187, 187, 170)]
   #;[border-right-color rgb(187, 187, 170)]
   #;[border-bottom-color rgb(187, 187, 170)]
   #;[border-left-color rgb(187, 187, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class imbox-license))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(136, 136, 170)]
   #;[border-right-color rgb(136, 136, 170)]
   #;[border-bottom-color rgb(136, 136, 170)]
   #;[border-left-color rgb(136, 136, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(247, 248, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class imbox-featured))
   [border-top-width (px 3)]
   [border-right-width (px 3)]
   [border-bottom-width (px 3)]
   [border-left-width (px 3)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(203, 161, 53)]
   #;[border-right-color rgb(203, 161, 53)]
   #;[border-bottom-color rgb(203, 161, 53)]
   #;[border-left-color rgb(203, 161, 53)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class cmbox))
   [margin-top (px 3)]
   [margin-right (% 10)]
   [margin-bottom (px 3)]
   [margin-left (% 10)]
   #;[border-collapse collapse]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(223, 232, 255)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class cmbox-speedy))
   [margin-top (px 4)]
   [margin-bottom (px 4)]
   [border-top-width (px 4)]
   [border-right-width (px 4)]
   [border-bottom-width (px 4)]
   [border-left-width (px 4)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(178, 34, 34)]
   #;[border-right-color rgb(178, 34, 34)]
   #;[border-bottom-color rgb(178, 34, 34)]
   #;[border-left-color rgb(178, 34, 34)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 219, 219)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class ombox))
   [margin-top (px 4)]
   [margin-right (% 10)]
   [margin-bottom (px 4)]
   [margin-left (% 10)]
   #;[border-collapse collapse]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(249, 249, 249)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class ombox-notice))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class ombox-speedy))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(178, 34, 34)]
   #;[border-right-color rgb(178, 34, 34)]
   #;[border-bottom-color rgb(178, 34, 34)]
   #;[border-left-color rgb(178, 34, 34)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 238, 238)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class ombox-delete))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(178, 34, 34)]
   #;[border-right-color rgb(178, 34, 34)]
   #;[border-bottom-color rgb(178, 34, 34)]
   #;[border-left-color rgb(178, 34, 34)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class ombox-content))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(242, 133, 0)]
   #;[border-right-color rgb(242, 133, 0)]
   #;[border-bottom-color rgb(242, 133, 0)]
   #;[border-left-color rgb(242, 133, 0)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class ombox-style))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(244, 196, 48)]
   #;[border-right-color rgb(244, 196, 48)]
   #;[border-bottom-color rgb(244, 196, 48)]
   #;[border-left-color rgb(244, 196, 48)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class ombox-move))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(153, 50, 204)]
   #;[border-right-color rgb(153, 50, 204)]
   #;[border-bottom-color rgb(153, 50, 204)]
   #;[border-left-color rgb(153, 50, 204)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class ombox-protection))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(187, 187, 170)]
   #;[border-right-color rgb(187, 187, 170)]
   #;[border-bottom-color rgb(187, 187, 170)]
   #;[border-left-color rgb(187, 187, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class tmbox))
   [margin-top (px 4)]
   [margin-right (% 10)]
   [margin-bottom (px 4)]
   [margin-left (% 10)]
   #;[border-collapse collapse]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(192, 192, 144)]
   #;[border-right-color rgb(192, 192, 144)]
   #;[border-bottom-color rgb(192, 192, 144)]
   #;[border-left-color rgb(192, 192, 144)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(248, 234, 186)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((desc (and (class mediawiki)) (and (class mbox-inside)) (and (class tmbox)))
   [margin-top (px 2)]
   [margin-right (px 0)]
   [margin-bottom (px 2)]
   [margin-left (px 0)]
   [width (% 100)])
  ((and (tag table) (class tmbox-speedy))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(178, 34, 34)]
   #;[border-right-color rgb(178, 34, 34)]
   #;[border-bottom-color rgb(178, 34, 34)]
   #;[border-left-color rgb(178, 34, 34)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 238, 238)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class tmbox-delete))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(178, 34, 34)]
   #;[border-right-color rgb(178, 34, 34)]
   #;[border-bottom-color rgb(178, 34, 34)]
   #;[border-left-color rgb(178, 34, 34)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class tmbox-content))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(242, 133, 0)]
   #;[border-right-color rgb(242, 133, 0)]
   #;[border-bottom-color rgb(242, 133, 0)]
   #;[border-left-color rgb(242, 133, 0)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class tmbox-style))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(244, 196, 48)]
   #;[border-right-color rgb(244, 196, 48)]
   #;[border-bottom-color rgb(244, 196, 48)]
   #;[border-left-color rgb(244, 196, 48)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class tmbox-move))
   [border-top-width (px 2)]
   [border-right-width (px 2)]
   [border-bottom-width (px 2)]
   [border-left-width (px 2)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(153, 50, 204)]
   #;[border-right-color rgb(153, 50, 204)]
   #;[border-bottom-color rgb(153, 50, 204)]
   #;[border-left-color rgb(153, 50, 204)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((or (and (tag table) (class tmbox-protection)) (and (tag table) (class tmbox-notice)))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(192, 192, 144)]
   #;[border-right-color rgb(192, 192, 144)]
   #;[border-bottom-color rgb(192, 192, 144)]
   #;[border-left-color rgb(192, 192, 144)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((and (tag table) (class dmbox))
   #;[clear both]
   [margin-top 0.9em]
   [margin-right 1em]
   [margin-bottom 0.9em]
   [margin-left 1em]
   [border-top-width (px 1)]
   [border-top-style solid]
   #;[border-top-color rgb(204, 204, 204)]
   [border-bottom-width (px 1)]
   [border-bottom-style solid]
   #;[border-bottom-color rgb(204, 204, 204)]
   #;[background-color transparent]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class fmbox))
   #;[clear both]
   [margin-top 0.2em]
   [margin-right (px 0)]
   [margin-bottom 0.2em]
   [margin-left (px 0)]
   [width (% 100)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(249, 249, 249)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (tag table) (class fmbox-warning))
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(187, 112, 112)]
   #;[border-right-color rgb(187, 112, 112)]
   #;[border-bottom-color rgb(187, 112, 112)]
   #;[border-left-color rgb(187, 112, 112)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 219, 219)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((or (and (tag div) (class mw-warning-with-logexcerpt)) (and (tag div) (class mw-lag-warn-high)) (and (tag div) (class mw-cascadeprotectedwarning)) (and (tag div) (id mw-protect-cascadeon)) (and (tag div) (class titleblacklist-warning)) (and (tag div) (class locked-warning)))
   #;[clear both]
   [margin-top 0.2em]
   [margin-right (px 0)]
   [margin-bottom 0.2em]
   [margin-left (px 0)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(187, 112, 112)]
   #;[border-right-color rgb(187, 112, 112)]
   #;[border-bottom-color rgb(187, 112, 112)]
   #;[border-left-color rgb(187, 112, 112)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 219, 219)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [padding-top 0.25em]
   [padding-right 0.9em]
   [padding-bottom 0.25em]
   [padding-left 0.9em])
  ((or (and (tag div) (class mw-lag-warn-normal)) (and (tag div) (class fmbox-system)))
   #;[clear both]
   [margin-top 0.2em]
   [margin-right (px 0)]
   [margin-bottom 0.2em]
   [margin-left (px 0)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(249, 249, 249)]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [padding-top 0.25em]
   [padding-right 0.9em]
   [padding-bottom 0.25em]
   [padding-left 0.9em])
  ((desc (and (tag body) (class mediawiki)) (and (tag table) (class mbox-small)))
   #;[clear right]
   [float right]
   [margin-top (px 4)]
   [margin-right (px 0)]
   [margin-bottom (px 4)]
   [margin-left 1em]
   [width (px 238)]
   #;[font-size (% 88)]
   #;[line-height 1.25em])
  ((desc (and (tag body) (class mediawiki)) (and (tag table) (class mbox-small-left)))
   [margin-top (px 4)]
   [margin-right 1em]
   [margin-bottom (px 4)]
   [margin-left (px 0)]
   [width (px 238)]
   #;[border-collapse collapse]
   #;[font-size (% 88)]
   #;[line-height 1.25em])
  ((or (desc (and (class compact-ambox)) (and (tag table)) (and (class mbox-image))) (desc (and (class compact-ambox)) (and (tag table)) (and (class mbox-imageright))) (desc (and (class compact-ambox)) (and (tag table)) (and (class mbox-empty-cell))))
   [display none])
  ((desc (and (class compact-ambox)) (and (tag table) (class ambox)))
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
   #;[border-collapse collapse]
   #;[background-color transparent]
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
   [margin-left 1.6em]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [width auto]
   [display block])
  ((desc (and (tag body) (class mediawiki)) (and (class compact-ambox)) (and (tag table) (class mbox-small-left)))
   #;[font-size (% 100)]
   [width auto]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class compact-ambox)) (and (tag table)) (and (class mbox-text)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class compact-ambox)) (and (tag table)) (and (class mbox-text-span)))
   [display list-item]
   #;[line-height 1.5em]
   #;[list-style-type square]
   #;[list-style-image url("//en.wikipedia.org/w/skins/MonoBook/bullet.gif")])
  ((desc (and (class compact-ambox)) (and (class hide-when-compact)))
   [display none])
  ((and (tag div) (class noarticletext))
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
   #;[background-size auto auto]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (class visualhide))
   [position absolute]
   [left (px -10000)]
   [top auto]
   [width (px 1)]
   [height (px 1)]
   [overflow-x hidden]
   [overflow-y hidden])
  ((and (class hiddenStructure))
   [display inline]
   #;[color rgb(255, 0, 0)]
   #;[background-color rgb(0, 255, 0)])
  ((desc (and (class check-icon)) (and (tag a) (class new)))
   [display none])
  ((and (tag div) (class NavFrame))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 4)]
   [padding-right (px 4)]
   [padding-bottom (px 4)]
   [padding-left (px 4)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   [text-align center]
   #;[border-collapse collapse]
   #;[font-size (% 95)])
  (("div.NavFrame + div.NavFrame" (or))
   [border-top-style hidden])
  ((and (tag div) (class NavPic))
   #;[background-color rgb(255, 255, 255)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 2)]
   [padding-right (px 2)]
   [padding-bottom (px 2)]
   [padding-left (px 2)]
   [float left])
  ((desc (and (tag div) (class NavFrame)) (and (tag div) (class NavHead)))
   #;[line-height 1.6em]
   #;[font-weight bold]
   #;[background-color rgb(204, 204, 255)]
   [position relative])
  ((and (tag div) (class NavEnd))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[line-height (px 1)]
   #;[clear both])
  ((and (tag a) (class NavToggle))
   [position absolute]
   [top (px 0)]
   [right (px 3)]
   #;[font-weight normal]
   #;[font-size (% 90)])
  ((and (tag div) (class hatnote))
   [padding-left 1.6em]
   [margin-bottom 0.5em])
  (("div.hatnote + div.hatnote" (or))
   [margin-top -0.5em])
  ((desc (and (class listify)) (and (tag td)))
   [display list-item])
  ((desc (and (class listify)) (and (tag tr)))
   [display block])
  ((desc (and (class listify)) (and (tag table)))
   [display block])
  ((or (and (class geo-default)) (and (class geo-dms)) (and (class geo-dec)))
   [display inline])
  ((or (and (class geo-nondefault)) (and (class geo-multi-punct)))
   [display none])
  ((or (desc (and (class hlist)) (and (class tocnumber))) (desc (and (class hlist)) (and (class toctext))))
   [display inline])
  ((desc (and (class nonumtoc)) (and (class tocnumber)))
   [display none])
  ((or (desc (and (class nonumtoc)) (and (id toc)) (and (tag ul))) (desc (and (class nonumtoc)) (and (class toc)) (and (tag ul))))
   #;[line-height 1.5em]
   #;[list-style-type none]
   #;[list-style-image none]
   #;[list-style-position outside]
   [margin-top 0.3em]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((or (desc (and (class hlist) (class nonumtoc)) (and (id toc)) (and (tag ul)) (and (tag ul))) (desc (and (class hlist) (class nonumtoc)) (and (class toc)) (and (tag ul)) (and (tag ul))))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((or (desc (and (class toclimit-2)) (and (class toclevel-1)) (and (tag ul))) (desc (and (class toclimit-3)) (and (class toclevel-2)) (and (tag ul))) (desc (and (class toclimit-4)) (and (class toclevel-3)) (and (tag ul))) (desc (and (class toclimit-5)) (and (class toclevel-4)) (and (tag ul))) (desc (and (class toclimit-6)) (and (class toclevel-5)) (and (tag ul))) (desc (and (class toclimit-7)) (and (class toclevel-6)) (and (tag ul))))
   [display none])
  ((desc (and (tag blockquote) (class templatequote)) (and (tag div) (class templatequotecite)))
   #;[line-height 1.5em]
   [text-align left]
   [padding-left 1.6em]
   [margin-top (px 0)])
  ((and (tag div) (class user-block))
   [padding-top (px 5)]
   [padding-right (px 5)]
   [padding-bottom (px 5)]
   [padding-left (px 5)]
   [margin-bottom 0.5em]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(169, 169, 169)]
   #;[border-right-color rgb(169, 169, 169)]
   #;[border-bottom-color rgb(169, 169, 169)]
   #;[border-left-color rgb(169, 169, 169)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(255, 239, 213)])
  ((and (class template-documentation))
   #;[clear both]
   [margin-top 1em]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [border-top-width (px 1)]
   [border-right-width (px 1)]
   [border-bottom-width (px 1)]
   [border-left-width (px 1)]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(170, 170, 170)]
   #;[border-right-color rgb(170, 170, 170)]
   #;[border-bottom-color rgb(170, 170, 170)]
   #;[border-left-color rgb(170, 170, 170)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch]
   #;[background-color rgb(236, 252, 244)]
   [padding-top 1em]
   [padding-right 1em]
   [padding-bottom 1em]
   [padding-left 1em])
  ((desc (and (class imagemap-inline)) (and (tag div)))
   [display inline])
  ((and (id wpUploadDescription))
   [height 13em])
  ((or (desc (and (tag body) (class rtl)) (and (id mw-articlefeedbackv5))) (desc (and (tag body) (class rtl)) (and (id mw-articlefeedback))))
   [display block]
   [margin-bottom 1em]
   #;[clear right]
   [float right])
  ((desc (and (class wpb)) (and (class wpb-header)))
   [display none])
  ((desc (and (class wpbs-inner)) (and (class wpb)) (and (class wpb-header)))
   [display block])
  ((desc (and (class wpbs-inner)) (and (class wpb)) (and (class wpb-header)))
   [display table-row])
  ((desc (and (class wpbs-inner)) (and (class wpb-outside)))
   [display none])
  ((or (and (class sysop-show)) (and (class accountcreator-show)) (and (class templateeditor-show)) (and (class autoconfirmed-show)))
   [display none])
  ((or (desc (and (class ve-ui-mwNoticesPopupTool-item)) (and (class editnotice-redlink))) (desc (and (class mw-ve-editNotice)) (and (class editnotice-redlink))))
   [display none])
  ((and (tag ul) (class permissions-errors))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((and (class transborder))
   [border-top-width medium]
   [border-right-width medium]
   [border-bottom-width medium]
   [border-left-width medium]
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
  ((desc (and *) (and (tag html)) (and (class transborder)))
   [border-top-width medium]
   [border-right-width medium]
   [border-bottom-width medium]
   [border-left-width medium]
   [border-top-style solid]
   [border-right-style solid]
   [border-bottom-style solid]
   [border-left-style solid]
   #;[border-top-color rgb(0, 0, 1)]
   #;[border-right-color rgb(0, 0, 1)]
   #;[border-bottom-color rgb(0, 0, 1)]
   #;[border-left-color rgb(0, 0, 1)]
   #;[border-image-source none]
   #;[border-image-slice 100% 100% 100% 100%]
   #;[border-image-width 1 1 1 1]
   #;[border-image-outset (px 0)]
   #;[border-image-repeat stretch stretch])
  ((or (and (class mwe-math-fallback-image-display)) (and (class mwe-math-mathml-display)))
   [margin-left 1.6em]
   [margin-top 0.6em]
   [margin-bottom 0.6em])
  ((desc (and (class mwe-math-mathml-display)) (and (tag math)))
   [display inline])
  ((or (and (tag table) (id mw-prefixindex-list-table)) (and (tag table) (id mw-prefixindex-nav-table)))
   [width (% 98)])
  ((and (class portal-column-left))
   [float left]
   [width (% 50)])
  ((and (class portal-column-right))
   [float right]
   [width (% 49)])
  ((and (class portal-column-left-wide))
   [float left]
   [width (% 60)])
  ((and (class portal-column-right-narrow))
   [float right]
   [width (% 39)])
  ((and (class portal-column-left-extra-wide))
   [float left]
   [width (% 70)])
  ((and (class portal-column-right-extra-narrow))
   [float right]
   [width (% 29)])
  ((desc (and (id bodyContent)) (and (class letterhead)))
   #;[background-image url("//upload.wikimedia.org/wikipedia/commons/e/e0/Tan-page-corner.png")]
   #;[background-repeat no-repeat]
   [padding-top 2em]
   [padding-right 2em]
   [padding-bottom 2em]
   [padding-left 2em]
   #;[background-color rgb(250, 249, 242)])
  ((desc (and (class treeview)) (and (tag ul)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)])
  ((desc (and (class treeview)) (and (tag li)))
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   #;[list-style-type none]
   #;[list-style-image none])
  ((desc (and (class treeview)) (and (tag li)) (and (tag li)))
   #;[background-color transparent]
   #;[background-image url("//upload.wikimedia.org/wikipedia/commons/f/f2/Treeview-grey-line.png")]
   #;[background-repeat no-repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto]
   [padding-left (px 20)]
   #;[text-indent 0.3em])
  ((child (desc (and (class treeview)) (and (tag li) (class emptyline))) (and (tag ul)))
   [margin-left (px -1)])
  ((or (desc (and (tag td)) (and (class sortkey))) (desc (and (tag th)) (and (class sortkey))))
   [display none])
  ((desc (and (class inputbox-hidecheckboxes)) (and (tag form)) (and (class inputbox-element)))
   [display none])
  ((desc (and (class PopUpMediaTransform)) (and (tag a)) (and (class play-btn-large)))
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [top auto]
   [right auto]
   [bottom (px 0)]
   [left (px 0)])
  ((desc (and (class mw-ve-editNotice)) (and (class mbox-image)))
   [display none])
  ((or (desc (and (class page-Main_Page)) (and (id deleteconfirm))) (desc (and (class page-Main_Page)) (and (id t-cite))) (desc (and (class page-Main_Page)) (and (id footer-info-lastmod))) (desc (and (class action-view) (class page-Main_Page)) (and (id siteSub))) (desc (and (class action-view) (class page-Main_Page)) (and (id contentSub))) (desc (and (class action-view) (class page-Main_Page)) (and (class firstHeading))))
   [display none])
  ((and (id coordinates))
   [position absolute]
   [top (px 0)]
   [right (px 0)]
   [float right]
   [margin-top (px 0)]
   [margin-right (px 0)]
   [margin-bottom (px 0)]
   [margin-left (px 0)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)]
   #;[line-height 1.5em]
   [text-align right]
   #;[text-indent (px 0)]
   #;[font-size (% 85)]
   #;[text-transform none]
   #;[white-space nowrap])
  ((and (tag div) (class flaggedrevs_short))
   [position absolute]
   [top -3em]
   [right (px 100)]
   #;[z-index 1])
  ((and (id siteSub))
   [display block]
   #;[font-size (% 92)])
  ((desc (and (class mw-body)) (and (class mw-indicators)))
   [padding-top (px 5.6)])
  ((and (id e10032)) :style
   [width (px (/ 8129 30))])
  ((and (id e10033)) :style
   [text-align center]
   #;[font-weight bold]
   #;[font-size (% 130)])
  ((and (id e10034)) :style
   [text-align center])
  ((and (id e10035)) :style
   [text-align center])
  ((and (id e10036)) :style
   [text-align center]
   #;[background-color lavender]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (id e10037)) :style
   [text-align center]
   [border-bottom-width medium]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color])
  ((and (id e10038)) :style
   [text-align left])
  ((and (id e10039)) :style
   [text-align left])
  ((and (id e10040)) :style
   [text-align left])
  ((and (id e10041)) :style
   [text-align center]
   [border-bottom-width medium]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color])
  ((and (id e10042)) :style
   [text-align left])
  ((and (id e10043)) :style
   [text-align left])
  ((and (id e10044)) :style
   [text-align left])
  ((and (id e10045)) :style
   [text-align center]
   #;[background-color lavender]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (id e10046)) :style
   [text-align center]
   [border-bottom-width medium]
   [border-bottom-style none]
   #;[border-bottom-color -moz-use-text-color])
  ((and (id e10047)) :style
   [text-align center]
   #;[background-color lavender]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (id e10048)) :style
   [display none])
  ((and (id e10049)) :style
   [display none])
  ((and (id e10050)) :style
   [text-align center]
   #;[background-color lavender]
   #;[background-image none]
   #;[background-repeat repeat]
   #;[background-attachment scroll]
   #;[background-position (px 0)]
   #;[background-clip border-box]
   #;[background-origin padding-box]
   #;[background-size auto auto])
  ((and (id e10057)) :style
   [width (px 252)])
  ((and (id e10063)) :style
   [display none])
  ((and (id e10064)) :style
   [display none])
  ((and (id e10065)) :style
   [display none])
  ((and (id e10066)) :style
   [display none])
  ((and (id e10067)) :style
   [display none])
  ((and (id e10068)) :style
   [margin-top (px 6.65)]
   [margin-right auto]
   [margin-bottom (px 6.65)]
   [margin-left auto]
   #;[font-size (% 95)]
   #;[clear both])
  ((and (id e10069)) :style
   [border-top-width (px 5)]
   [border-top-style solid]
   #;[border-top-color rgb(250, 206, 255)])
  ((and (id e10070)) :style
   [text-align center])
  ((and (id e10071)) :style
   [width (% 30)])
  ((and (id e10074)) :style
   [width (% 40)]
   [text-align center])
  ((and (id e10075)) :style
   [width (% 30)]
   [text-align center])
  ((and (id e10078)) :style
   [text-align center])
  ((and (id e10079)) :style
   [width (% 30)])
  ((and (id e10082)) :style
   [width (% 40)]
   [text-align center])
  ((and (id e10083)) :style
   [width (% 30)]
   [text-align center])
  ((and (id e10087)) :style
   [padding-top (px 2)]
   [padding-right (px 2)]
   [padding-bottom (px 2)]
   [padding-left (px 2)])
  ((and (id e10025)) :style
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
   #;[border-image-repeat stretch stretch])
  ((and (id e10088)) :style
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
   #;[border-image-repeat stretch stretch])
  ((and (id e10026)) :style
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
   #;[border-image-repeat stretch stretch])
  ((and (id e10089)) :style
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
   #;[border-image-repeat stretch stretch])
  ((and (id e10027)) :style
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
   #;[border-image-repeat stretch stretch])
  ((and (id e10090)) :style
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
   #;[border-image-repeat stretch stretch])
  ((and (id e10092)) :style
   [height (px 2)])
  ((and (id e10093)) :style
   [text-align left]
   [border-left-width (px 2)]
   [border-left-style solid]
   [width (% 100)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (id e10094)) :style
   [padding-top (px 0)]
   [padding-right (px (/ 37 12))]
   [padding-bottom (px 0)]
   [padding-left (px (/ 37 12))])
  ((and (id e10095)) :style
   [height (px 2)])
  ((and (id e10096)) :style
   [text-align left]
   [border-left-width (px 2)]
   [border-left-style solid]
   [width (% 100)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (id e10097)) :style
   [padding-top (px 0)]
   [padding-right (px (/ 37 12))]
   [padding-bottom (px 0)]
   [padding-left (px (/ 37 12))])
  ((and (id e10098)) :style
   [height (px 2)])
  ((and (id e10099)) :style
   [text-align left]
   [border-left-width (px 2)]
   [border-left-style solid]
   [width (% 100)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (id e10100)) :style
   [padding-top (px 0)]
   [padding-right (px (/ 37 12))]
   [padding-bottom (px 0)]
   [padding-left (px (/ 37 12))])
  ((and (id e10101)) :style
   [padding-top (px 2)]
   [padding-right (px 2)]
   [padding-bottom (px 2)]
   [padding-left (px 2)])
  ((and (id e10103)) :style
   [text-align left]
   [border-left-width (px 2)]
   [border-left-style solid]
   [width (% 100)]
   [padding-top (px 0)]
   [padding-right (px 0)]
   [padding-bottom (px 0)]
   [padding-left (px 0)])
  ((and (id e10104)) :style
   [padding-top (px 0)]
   [padding-right (px (/ 37 12))]
   [padding-bottom (px 0)]
   [padding-left (px (/ 37 12))])
  ((and (id e10105)) :style
   [display none])
  ((and (id e10107)) :style
   [display none]
   #;[font-size (px 15.6)])
  ((and (id fxdriver-screenshot-canvas)) :style
   [display none]))

(define-document (doc-1 #:width 1728 #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 1728 :h 8001 :class (client-js ve-not-available)]
   ([BLOCK :tag BODY :x 0 :y 0 :w 1728 :h 8001 :class (mediawiki ltr sitedir-ltr ns-0 ns-subject page-Cassius_Marcellus_Clay_politician skin-vector action-view)]
    ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 80 :id mw-page-base :class (noprint)])
    ([BLOCK :tag DIV :x 176 :y 0 :w 1552 :h 80 :id mw-head-base :class (noprint)])
    ([BLOCK :tag DIV :x 176 :y 79 :w 1552 :h (/ 116145 30) :id content :class (mw-body)]
     ([ANON]
      ([LINE]
       ([INLINE :tag A :id top])))
     ([BLOCK :tag DIV :x 201 :y 100 :w 1503 :h 0 :id siteNotice]
      ([BLOCK :tag DIV :x 201 :y 100 :w 1503 :h 0 :id centralNotice]))
     ([BLOCK :tag DIV :x 1704 :y 100 :w 0 :h 5.6 :class (mw-indicators)])
     ([BLOCK :tag H1 :x 201 :y 100 :w 1503 :h (/ 1153 30) :id firstHeading :class (firstHeading)]
      ([LINE]
       ([TEXT :x 201 :y (/ 3066 30) :w 448 :h 33])))
     ([BLOCK :tag DIV :x 201 :y (/ 4369 30) :w 1503 :h 3779.85 :id bodyContent :class (mw-body-content)]
      ([BLOCK :tag DIV :x 201 :y (/ 4369 30) :w 1503 :h (/ 309 15) :id siteSub]
       ([LINE]
        ([TEXT :x 201 :y (/ 4483 30) :w 240 :h 13])))
      ([BLOCK :tag DIV :x (/ 6383 30) :y 166.25 :w (/ 44737 30) :h 0 :id contentSub])
      ([BLOCK :tag DIV :x 201 :y 163.1 :w 1503 :h 0 :id jump-to-nav :class (mw-jump)]
       ([LINE]
        ([TEXT :x 201 :y 167.3 :w 61 :h 14])
        ([INLINE :tag A]
         ([TEXT :x 262 :y 167.3 :w 70 :h 14]))
        ([TEXT :x 332 :y 167.3 :w 8 :h 14])
        ([INLINE :tag A]
         ([TEXT :x 340 :y 167.3 :w 47 :h 14]))))
      ([BLOCK :tag DIV :x 201 :y 171.25 :w 1503 :h (/ 110159 30) :id mw-content-text :class (mw-content-ltr)]
       ([BLOCK :tag DL :x 201 :y 171.25 :w 1503 :h 23.4]
        ([BLOCK :tag DD :x 223.4 :y 171.25 :w 1480.6 :h 23.4]
         ([LINE]
          ([INLINE :tag I]
           ([TEXT :x 223.4 :y (/ 2231 12) :w 772 :h 16])
           ([INLINE :tag A]
            ([TEXT :x 995.4 :y (/ 2231 12) :w 101 :h 16]))
           ([TEXT :x 1096.4 :y (/ 2231 12) :w 192 :h 16])
           ([INLINE :tag A]
            ([TEXT :x 1288.4 :y (/ 2231 12) :w 176 :h 16]))))))
       ([MAGIC :tag TABLE :x (/ 42991 30) :y 205.625 :w (/ 8129 30) :h (/ 18977 12) :mt (/ 37 6) :mr 0 :mb (/ 37 6) :ml 12.3 :id e10032 :class (infobox vcard)]
        ([MAGIC :tag TBODY :x 1439.5 :y 225.75 :w (/ 7741 30) :h (/ 47055 30) :mt 0 :mr 0 :mb 0 :ml 0]
         ([MAGIC :tag TR :x 1439.5 :y 225.75 :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 225.75 :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10033]
           ([INLINE :tag SPAN :class (fn)]
            ([TEXT :x 1469 :y 226.5 :w 199 :h 19]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 7477 30) :w (/ 7741 30) :h 303 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x 1439.5 :y (/ 7477 30) :w (/ 7741 30) :h 303 :mt 0 :mr 0 :mb 0 :ml 0 :id e10034]
           ([INLINE :tag A :class (image)]
            ([INLINE :tag IMG]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 16657 30) :w (/ 7741 30) :h 2 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x 1439.5 :y (/ 16657 30) :w (/ 7741 30) :h 2 :mt 0 :mr 0 :mb 0 :ml 0 :id e10035]))
         ([MAGIC :tag TR :x 1439.5 :y (/ 16807 30) :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 16807 30) :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10036]
           ([INLINE :tag A]
            ([TEXT :x 1464 :y (/ 8452 15) :w 209 :h 14])
            ([TEXT :x 1545 :y 581.95 :w 47 :h 14]))))
         ([MAGIC :tag TR :x 1439.5 :y 602.2 :w (/ 7741 30) :h (/ 1199 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x 1439.5 :y 602.2 :w (/ 7741 30) :h (/ 1199 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10037]
           ([INLINE :tag SPAN :class (nowrap)]
            ([INLINE :tag B]
             ([TEXT :x 1540.5 :y (/ 18163 30) :w 56 :h 14])))
           ([INLINE :tag BR])
           ([TEXT :x (/ 44175 30) :y (/ 7511 12) :w 192 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y (/ 3871 6) :w (/ 7741 30) :h 112.9 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 3871 6) :w (/ 3209 30) :h 112.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10038]
           ([TEXT :x 1440.5 :y 648.4 :w 69 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 3871 6) :w (/ 2221 15) :h 112.9 :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 649.4 :w 103 :h 12]))
           ([TEXT :x (/ 23257 15) :y 667.9 :w 80 :h 12])
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y (/ 20591 30) :w 100 :h 12]))
           ([TEXT :x (/ 23257 15) :y 704.85 :w 80 :h 12])
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y (/ 2170 3) :w 102 :h 12]))
           ([TEXT :x (/ 23257 15) :y (/ 8902 12) :w 42 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y (/ 11416 15) :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 11416 15) :w (/ 3209 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10039]
           ([INLINE :tag SPAN :class (nowrap)]
            ([TEXT :x 1440.5 :y 764.3 :w 88 :h 14])))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 11416 15) :w (/ 2221 15) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 765.3 :w 98 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y 784.55 :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 784.55 :w (/ 3209 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10040]
           ([INLINE :tag SPAN :class (nowrap)]
            ([TEXT :x 1440.5 :y (/ 23633 30) :w 98 :h 14])))
          ([MAGIC :tag TD :x (/ 23242 15) :y 784.55 :w (/ 2221 15) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A :class (mw-redirect)]
            ([TEXT :x (/ 23257 15) :y (/ 23663 30) :w 104 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 24241 30) :w (/ 7741 30) :h (/ 1199 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x 1439.5 :y (/ 24241 30) :w (/ 7741 30) :h (/ 1199 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10041]
           ([INLINE :tag SPAN :class (nowrap)]
            ([INLINE :tag B]
             ([TEXT :x 1540.5 :y (/ 12169 15) :w 56 :h 14])))
           ([INLINE :tag BR])
           ([TEXT :x 1478 :y 831.75 :w 181 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y 851 :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 851 :w (/ 3209 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10042]
           ([TEXT :x 1440.5 :y (/ 25627 30) :w 69 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y 851 :w (/ 2221 15) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y (/ 25657 30) :w 103 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 26235 30) :w (/ 7741 30) :h (/ 614 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 26235 30) :w (/ 3209 30) :h (/ 614 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10043]
           ([INLINE :tag SPAN :class (nowrap)]
            ([TEXT :x 1440.5 :y 822.875 :w 88 :h 14])))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 26235 30) :w (/ 2221 15) :h (/ 614 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 823.75 :w 87 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 26939 30) :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 26939 30) :w (/ 3209 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10044]
           ([INLINE :tag SPAN :class (nowrap)]
            ([TEXT :x 1440.5 :y 901.2 :w 98 :h 14])))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 26939 30) :w (/ 2221 15) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 902.2 :w 98 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y 921.45 :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 921.45 :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10045]
           ([TEXT :x 1449 :y 924.7 :w 107 :h 14])
           ([INLINE :tag A]
            ([TEXT :x 1556 :y 924.7 :w 132 :h 14])
            ([TEXT :x 1510 :y (/ 5659 6) :w 117 :h 14]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 11561 12) :w (/ 7741 30) :h (/ 1199 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x 1439.5 :y (/ 11561 12) :w (/ 7741 30) :h (/ 1199 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10046]
           ([INLINE :tag SPAN :class (nowrap)]
            ([INLINE :tag B]
             ([TEXT :x 1540.5 :y 966.65 :w 56 :h 14])))
           ([INLINE :tag BR])
           ([TEXT :x (/ 46005 30) :y (/ 14807 15) :w 70 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y (/ 15096 15) :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 15096 15) :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10047]
           ([TEXT :x (/ 45315 30) :y (/ 15144 15) :w 116 :h 14])))
         ([MAGIC :tag TR :x 1439.5 :y (/ 15448 15) :w (/ 7741 30) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 15448 15) :w (/ 3209 30) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y 1033.1 :w 33 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 15448 15) :w (/ 2221 15) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y 1034.1 :w 129 :h 12])
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y (/ 12631 12) :w 99 :h 12]))
           ([TEXT :x (/ 24742 15) :y (/ 12631 12) :w 4 :h 12])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y (/ 16066 15) :w 55 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y 1090.3 :w (/ 7741 30) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 1090.3 :w (/ 3209 30) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y 1093.55 :w 32 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y 1090.3 :w (/ 2221 15) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y 1094.55 :w 80 :h 12])
           ([TEXT :x (/ 24457 15) :y 1094.55 :w 66 :h 12])
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y (/ 33391 30) :w 103 :h 12])
           ([TEXT :x (/ 23257 15) :y (/ 33945 30) :w 55 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y (/ 34523 30) :w (/ 7741 30) :h (/ 1139 15) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 34523 30) :w (/ 3209 30) :h (/ 1139 15) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y 1154 :w 71 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 34523 30) :w (/ 2221 15) :h (/ 1139 15) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y 1155 :w 113 :h 12])
           ([TEXT :x (/ 23257 15) :y (/ 35205 30) :w 139 :h 12])
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y (/ 35759 30) :w 104 :h 12])
           ([TEXT :x (/ 23257 15) :y 1210.45 :w 139 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y 1229.7 :w (/ 7741 30) :h 168.35 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 1229.7 :w (/ 3209 30) :h 168.35 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y (/ 18494 15) :w 59 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y 1229.7 :w (/ 2221 15) :h 168.35 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y (/ 18509 15) :w 119 :h 12])
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y (/ 15029 12) :w 67 :h 12])
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 1270.9 :w 88 :h 12]))
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y (/ 19341 15) :w 57 :h 12])
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y (/ 19618 15) :w 64 :h 12]))
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 1326.35 :w 91 :h 12]))
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y (/ 8069 6) :w 61 :h 12])
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y 1363.3 :w 113 :h 12])
           ([TEXT :x (/ 23257 15) :y 1381.8 :w 63 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y 1401.05 :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 1401.05 :w (/ 3209 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A]
            ([TEXT :x 1440.5 :y 1316.5 :w 80 :h 14])))
          ([MAGIC :tag TD :x (/ 23242 15) :y 1401.05 :w (/ 2221 15) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 1317.5 :w 139 :h 12]))
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y (/ 42713 30) :w 74 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y 1443 :w (/ 7741 30) :h (/ 1133 12) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 1443 :w (/ 3209 30) :h (/ 1133 12) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y 1446.25 :w 80 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y 1443 :w (/ 2221 15) :h (/ 1133 12) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y 1447.25 :w 42 :h 12])
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y (/ 21986 15) :w 56 :h 12])
           ([INLINE :tag BR])
           ([INLINE :tag A :class (mw-redirect)]
            ([TEXT :x (/ 23257 15) :y (/ 44527 30) :w 132 :h 12]))
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y 1502.7 :w 43 :h 12])
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y (/ 18254 12) :w 43 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y (/ 46213 30) :w (/ 7741 30) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 46213 30) :w (/ 3209 30) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y (/ 4631 3) :w 72 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 46213 30) :w (/ 2221 15) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y (/ 4634 3) :w 131 :h 12])
           ([TEXT :x (/ 23257 15) :y 1563.15 :w 86 :h 12])
           ([TEXT :x (/ 23257 15) :y (/ 47449 30) :w 139 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y 1600.9 :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 1600.9 :w (/ 3209 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y 1604.1 :w 57 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y 1600.9 :w (/ 2221 15) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A :class (mw-redirect)]
            ([TEXT :x (/ 23257 15) :y 1605.1 :w 111 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 48731 30) :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 48731 30) :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10050]
           ([TEXT :x 1515 :y 1627.6 :w 107 :h 14])))
         ([MAGIC :tag TR :x 1439.5 :y 1647.85 :w (/ 7741 30) :h (/ 614 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 1647.85 :w (/ 3209 30) :h (/ 614 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y (/ 19813 12) :w 104 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y 1647.85 :w (/ 2221 15) :h (/ 614 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y (/ 19825 12) :w 127 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y (/ 5014 3) :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 5014 3) :w (/ 3209 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y (/ 50237 30) :w 57 :h 14])
           ([TEXT :x 1440.5 :y 1693.05 :w 50 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 5014 3) :w (/ 2221 15) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y (/ 50267 30) :w 78 :h 12])
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y 1694.05 :w 78 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y 1713.3 :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 1713.3 :w (/ 3209 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y (/ 25748 15) :w 35 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y 1713.3 :w (/ 2221 15) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A :class (image)]
            ([INLINE :tag IMG :class (thumbborder)]))
           ([TEXT :x (/ 23512 15) :y (/ 25763 15) :w 4 :h 12])
           ([INLINE :tag A]
            ([TEXT :x (/ 23572 15) :y (/ 25763 15) :w 48 :h 12]))
           ([INLINE :tag BR])
           ([INLINE :tag A :class (image)]
            ([INLINE :tag IMG]))
           ([TEXT :x (/ 23782 15) :y 1736 :w 4 :h 12])
           ([INLINE :tag A]
            ([TEXT :x (/ 23842 15) :y 1736 :w 87 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 26329 15) :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 26329 15) :w (/ 3209 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y 1758.5 :w 90 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 26329 15) :w (/ 2221 15) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A :class (mw-redirect)]
            ([TEXT :x (/ 23257 15) :y 1759.5 :w 139 :h 12]))
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 1808 :w 112 :h 12]))))))
       ([BLOCK :tag P :x 201 :y 213.1 :w 1503 :h 23.4]
        ([LINE]
         ([INLINE :tag B]
          ([TEXT :x 201 :y 216.3 :w 179 :h 16]))
         ([TEXT :x 380 :y 218.3 :w 327 :h 14])
         ([INLINE :tag B]
          ([TEXT :x 707 :y 216.3 :w 172 :h 16]))
         ([TEXT :x 879 :y 218.3 :w 374 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1253 :y 218.3 :w 124 :h 14]))
         ([TEXT :x 1377 :y 218.3 :w 4 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 7305 30) :w 1503 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y 232.25 :w 218 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 419 :y 232.25 :w 113 :h 14]))
         ([TEXT :x 532 :y 232.25 :w 852 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 3275 12) :w 1503 :h 0])
       ([MAGIC :tag DIV :x 201 :y (/ 3275 12) :w 244.65 :h 315.3 :mt 0 :mr 0 :mb 0 :ml 0 :id toc :class (toc)]
        ([BLOCK :tag DIV :x 209 :y (/ 3371 12) :w 228.65 :h 20 :id toctitle]
         ([LINE]
          ([INLINE :tag H2]
           ([TEXT :x (/ 3190 12) :y 283.05 :w 66 :h 15]))
          ([TEXT :x (/ 3982 12) :y 285.05 :w 4 :h 13])
          ([INLINE :tag SPAN :class (toctoggle)]
           ([TEXT :x (/ 4030 12) :y 285.05 :w 9 :h 13])
           ([INLINE :tag A :id togglelink]
            ([TEXT :x (/ 4138 12) :y 285.05 :w 27 :h 13]))
           ([TEXT :x (/ 4462 12) :y 285.05 :w 9 :h 13]))))
        ([BLOCK :tag UL :x 209 :y (/ 3674 12) :w 228.65 :h (/ 4051 15)]
         ([MAGIC :tag LI :x 209 :y (/ 3674 12) :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-1)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y (/ 3674 12) :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y 310.3 :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y (/ 3674 12) :w 214 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y 310.3 :w 214 :h 13]))))
         ([MAGIC :tag LI :x 209 :y 328.8 :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-2)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y 328.8 :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y (/ 4994 15) :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y 328.8 :w 126 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y (/ 4994 15) :w 126 :h 13]))))
         ([MAGIC :tag LI :x 209 :y (/ 4217 12) :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-3)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y (/ 4217 12) :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y 355.55 :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y (/ 4217 12) :w 93 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y 355.55 :w 93 :h 13]))))
         ([MAGIC :tag LI :x 209 :y (/ 11221 30) :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-4)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y (/ 11221 30) :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y (/ 2269 6) :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y (/ 11221 30) :w 195 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y (/ 2269 6) :w 195 :h 13]))))
         ([MAGIC :tag LI :x 209 :y 396.65 :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-5)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y 396.65 :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y (/ 12023 30) :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y 396.65 :w 145 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y (/ 12023 30) :w 145 :h 13]))))
         ([MAGIC :tag LI :x 209 :y (/ 6289 15) :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-6)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y (/ 6289 15) :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y 423.4 :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y (/ 6289 15) :w 72 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y 423.4 :w 72 :h 13]))))
         ([MAGIC :tag LI :x 209 :y 441.9 :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-7)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y 441.9 :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y 446 :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y 441.9 :w 45 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y 446 :w 45 :h 13]))))
         ([MAGIC :tag LI :x 209 :y 464.5 :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-8)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y 464.5 :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y (/ 14059 30) :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y 464.5 :w 49 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y (/ 14059 30) :w 49 :h 13]))))
         ([MAGIC :tag LI :x 209 :y 487.1 :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-9)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y 487.1 :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y 491.25 :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y 487.1 :w 55 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y 491.25 :w 55 :h 13]))))
         ([MAGIC :tag LI :x 209 :y (/ 7646 15) :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-10)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y (/ 7646 15) :w 22.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y (/ 7708 15) :w 16 :h 13]))
           ([MAGIC :tag SPAN :x 231.65 :y (/ 7646 15) :w 70 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 231.65 :y (/ 7708 15) :w 70 :h 13]))))
         ([MAGIC :tag LI :x 209 :y 532.35 :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-11)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y 532.35 :w 22.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y (/ 16095 30) :w 16 :h 13]))
           ([MAGIC :tag SPAN :x 231.65 :y 532.35 :w 97 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 231.65 :y (/ 16095 30) :w 97 :h 13]))))
         ([MAGIC :tag LI :x 209 :y (/ 16649 30) :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-12)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y (/ 16649 30) :w 22.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y 559.1 :w 16 :h 13]))
           ([MAGIC :tag SPAN :x 231.65 :y (/ 16649 30) :w 84 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 231.65 :y 559.1 :w 84 :h 13]))))))
       ([BLOCK :tag P :x 201 :y (/ 17857 30) :w 1503 :h 0])
       ([BLOCK :tag H2 :x 201 :y (/ 18277 30) :w 1143.5 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Early_life.2C_education_and_marriage :class (mw-headline)]
           ([TEXT :x 201 :y 610.9 :w 317 :h 24]))))
        ([MAGIC :tag SPAN :x 531 :y 619.9 :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10001 :class (mw-editsection-bracket)]
          ([TEXT :x 531 :y 619.9 :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 539.25 :y 619.9 :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10013 :class (mw-editsection-bracket)]
          ([TEXT :x 566.5 :y 619.9 :w 5 :h 13]))))
       ([BLOCK :tag P :x 201 :y (/ 9668 15) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 9731 15) :w 244 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 445 :y (/ 9731 15) :w 75 :h 14]))
         ([TEXT :x 520 :y (/ 9731 15) :w 157 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 677 :y (/ 9731 15) :w 56 :h 14]))
         ([TEXT :x 733 :y (/ 9731 15) :w 34 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 767 :y (/ 9731 15) :w 170 :h 14]))
         ([TEXT :x 937 :y (/ 9731 15) :w 471 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 10067 15) :w 418 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 2089 3) :w 1503 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 10508 15) :w 523 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 724 :y (/ 10508 15) :w 89 :h 14]))
         ([TEXT :x 813 :y (/ 10508 15) :w 601 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 10844 15) :w 64 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 265 :y (/ 10844 15) :w 72 :h 14]))
         ([TEXT :x 337 :y (/ 10844 15) :w 162 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 499 :y (/ 10844 15) :w 138 :h 14]))
         ([TEXT :x 637 :y (/ 10844 15) :w 399 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1036 :y (/ 10844 15) :w 122 :h 14]))
         ([TEXT :x 1158 :y (/ 10844 15) :w 233 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 2236 3) :w 64 :h 14])
         ([INLINE :tag SUP :id cite_ref-eliza_1-0 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 265 :y (/ 22307 30) :w 4 :h 11]))
           ([TEXT :x 269 :y (/ 22307 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 276 :y (/ 22307 30) :w 4 :h 11]))))
         ([TEXT :x 280 :y (/ 2236 3) :w 77 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 357 :y (/ 2236 3) :w 118 :h 14]))
         ([TEXT :x 475 :y (/ 2236 3) :w 389 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 11558 15) :w 1503 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 11621 15) :w 191 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 392 :y (/ 11621 15) :w 152 :h 14]))
         ([TEXT :x 544 :y (/ 11621 15) :w 180 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 724 :y (/ 11621 15) :w 83 :h 14]))
         ([TEXT :x 807 :y (/ 11621 15) :w 301 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1108 :y (/ 11621 15) :w 147 :h 14]))
         ([TEXT :x 1255 :y (/ 11621 15) :w 156 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 11957 15) :w 787 :h 14])
         ([INLINE :tag SUP :id cite_ref-2 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 988 :y (/ 23861 30) :w 4 :h 11]))
           ([TEXT :x 992 :y (/ 23861 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 999 :y (/ 23861 30) :w 4 :h 11]))))
         ([TEXT :x 1003 :y (/ 11957 15) :w 374 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 12293 15) :w 592 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-0 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 793 :y (/ 24533 30) :w 4 :h 11]))
           ([TEXT :x 797 :y (/ 24533 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 804 :y (/ 24533 30) :w 4 :h 11]))))))
       ([BLOCK :tag H2 :x 201 :y (/ 12881 15) :w 1143.5 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Marriage_and_family :class (mw-headline)]
           ([TEXT :x 201 :y (/ 12906 15) :w 190 :h 24]))))
        ([MAGIC :tag SPAN :x 404 :y (/ 13041 15) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10002 :class (mw-editsection-bracket)]
          ([TEXT :x 404 :y (/ 13041 15) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 412.25 :y (/ 13041 15) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10014 :class (mw-editsection-bracket)]
          ([TEXT :x 439.5 :y (/ 13041 15) :w 5 :h 13]))))
       ([BLOCK :tag P :x 201 :y (/ 26821 30) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 26947 30) :w 387 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 588 :y (/ 26947 30) :w 99 :h 14]))
         ([TEXT :x 687 :y (/ 26947 30) :w 556 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1243 :y (/ 26947 30) :w 64 :h 14]))
         ([TEXT :x 1307 :y (/ 26947 30) :w 46 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1353 :y (/ 26947 30) :w 37 :h 14]))
         ([TEXT :x 1390 :y (/ 26947 30) :w 4 :h 14]))
        ([LINE]
         ([INLINE :tag A]
          ([TEXT :x 201 :y (/ 27619 30) :w 71 :h 14]))
         ([TEXT :x 272 :y (/ 27619 30) :w 786 :h 14])))
       ([BLOCK :tag H2 :x 201 :y (/ 5759 6) :w 1143.5 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Political_career :class (mw-headline)]
           ([TEXT :x 201 :y (/ 28845 30) :w 140 :h 24]))))
        ([MAGIC :tag SPAN :x 354 :y (/ 29115 30) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10003 :class (mw-editsection-bracket)]
          ([TEXT :x 354 :y (/ 29115 30) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 362.25 :y (/ 29115 30) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10015 :class (mw-editsection-bracket)]
          ([TEXT :x 389.5 :y (/ 29115 30) :w 5 :h 13]))))
       ([BLOCK :tag P :x 201 :y (/ 14927 15) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 2998 3) :w 267 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 468 :y (/ 2998 3) :w 115 :h 14]))
         ([TEXT :x 583 :y (/ 2998 3) :w 742 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 15326 15) :w 317 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 518 :y (/ 15326 15) :w 111 :h 14]))
         ([TEXT :x 629 :y (/ 15326 15) :w 4 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-1 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 633 :y (/ 30599 30) :w 4 :h 11]))
           ([TEXT :x 637 :y (/ 30599 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 644 :y (/ 30599 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 15704 15) :w 1503 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 15767 15) :w 265 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 466 :y (/ 15767 15) :w 245 :h 14]))
         ([TEXT :x 711 :y (/ 15767 15) :w 4 :h 14])
         ([INLINE :tag SUP :id cite_ref-4 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 715 :y (/ 31481 30) :w 4 :h 11]))
           ([TEXT :x 719 :y (/ 31481 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 726 :y (/ 31481 30) :w 4 :h 11]))))
         ([TEXT :x 730 :y (/ 15767 15) :w 686 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 16103 15) :w 1187 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 16439 15) :w 388 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 589 :y (/ 16439 15) :w 79 :h 14]))
         ([TEXT :x 668 :y (/ 16439 15) :w 257 :h 14])
         ([INLINE :tag SUP :id cite_ref-BorgenichtRegan2010_5-0 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 925 :y (/ 6565 6) :w 4 :h 11]))
           ([TEXT :x 929 :y (/ 6565 6) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 936 :y (/ 6565 6) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 16817 15) :w 1503 :h 90.6]
        ([LINE]
         ([TEXT :x 201 :y (/ 3379 3) :w 402 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 603 :y (/ 3373 3) :w 100 :h 16]))
         ([TEXT :x 703 :y (/ 3379 3) :w 24 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 727 :y (/ 3379 3) :w 136 :h 14]))
         ([TEXT :x 863 :y (/ 3379 3) :w 524 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 17231 15) :w 1195 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 17567 15) :w 682 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 883 :y (/ 17567 15) :w 107 :h 14]))
         ([TEXT :x 990 :y (/ 17567 15) :w 404 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 17903 15) :w 128 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-2 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 329 :y (/ 35753 30) :w 4 :h 11]))
           ([TEXT :x 333 :y (/ 35753 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 340 :y (/ 35753 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 18281 15) :w 1503 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 18344 15) :w 126 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 327 :y (/ 18344 15) :w 154 :h 14]))
         ([TEXT :x 481 :y (/ 18344 15) :w 36 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 517 :y (/ 18344 15) :w 50 :h 14]))
         ([TEXT :x 567 :y (/ 18344 15) :w 461 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 1028 :y (/ 18344 15) :w 136 :h 14]))
         ([TEXT :x 1164 :y (/ 18344 15) :w 230 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 3736 3) :w 1213 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 19016 15) :w 379 :h 14])
         ([INLINE :tag SUP :id cite_ref-BorgenichtRegan2010_5-1 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 580 :y (/ 37979 30) :w 4 :h 11]))
           ([TEXT :x 584 :y (/ 37979 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 591 :y (/ 37979 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 19394 15) :w 1503 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 19457 15) :w 387 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 588 :y (/ 19457 15) :w 78 :h 14]))
         ([TEXT :x 666 :y (/ 19457 15) :w 288 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 954 :y (/ 19457 15) :w 41 :h 14]))
         ([TEXT :x 995 :y (/ 19457 15) :w 155 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1150 :y (/ 19457 15) :w 97 :h 14]))
         ([TEXT :x 1247 :y (/ 19457 15) :w 126 :h 14])
         ([INLINE :tag SUP :id cite_ref-6 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1373 :y (/ 38861 30) :w 4 :h 11]))
           ([TEXT :x 1377 :y (/ 38861 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1384 :y (/ 38861 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 3967 3) :w 1503 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 19898 15) :w 686 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 887 :y (/ 19898 15) :w 113 :h 14]))
         ([TEXT :x 1000 :y (/ 19898 15) :w 249 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1249 :y (/ 19898 15) :w 113 :h 14]))
         ([TEXT :x 1362 :y (/ 19898 15) :w 4 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 20234 15) :w 157 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 358 :y (/ 20234 15) :w 76 :h 14]))
         ([TEXT :x 434 :y (/ 20234 15) :w 306 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 740 :y (/ 20234 15) :w 107 :h 14]))
         ([TEXT :x 847 :y (/ 20234 15) :w 48 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 895 :y (/ 20234 15) :w 258 :h 14]))
         ([TEXT :x 1153 :y (/ 20234 15) :w 4 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-3 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1157 :y (/ 8083 6) :w 4 :h 11]))
           ([TEXT :x 1161 :y (/ 8083 6) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1168 :y (/ 8083 6) :w 4 :h 11]))))
         ([TEXT :x 1172 :y (/ 20234 15) :w 186 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1358 :y (/ 20234 15) :w 59 :h 14])))
        ([LINE]
         ([INLINE :tag A]
          ([TEXT :x 201 :y (/ 4114 3) :w 46 :h 14]))
         ([TEXT :x 247 :y (/ 4114 3) :w 4 :h 14])))
       ([BLOCK :tag H2 :x 201 :y (/ 21158 15) :w 1143.5 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Civil_War_and_Minister_to_Russia :class (mw-headline)]
           ([TEXT :x 201 :y (/ 16946 12) :w 299 :h 24]))))
        ([MAGIC :tag SPAN :x 513 :y (/ 17054 12) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10004 :class (mw-editsection-bracket)]
          ([TEXT :x 513 :y (/ 17054 12) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 521.25 :y (/ 17054 12) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10016 :class (mw-editsection-bracket)]
          ([TEXT :x 548.5 :y (/ 17054 12) :w 5 :h 13]))))
       ([BLOCK :tag P :x 201 :y (/ 8675 6) :w 1503 :h 89.6]
        ([LINE]
         ([TEXT :x 201 :y (/ 43501 30) :w 325 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 526 :y (/ 43501 30) :w 54 :h 14]))
         ([TEXT :x 580 :y (/ 43501 30) :w 164 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 744 :y (/ 43501 30) :w 99 :h 14]))
         ([TEXT :x 843 :y (/ 43501 30) :w 173 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1016 :y (/ 43501 30) :w 55 :h 14]))
         ([TEXT :x 1071 :y (/ 43501 30) :w 346 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 44173 30) :w 1218 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 8969 6) :w 1205 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 45517 30) :w 145 :h 14])
         ([INLINE :tag SUP :id cite_ref-7 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 346 :y (/ 22732 15) :w 4 :h 11]))
           ([TEXT :x 350 :y (/ 22732 15) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 357 :y (/ 22732 15) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 46273 30) :w 1503 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 46399 30) :w 284 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 485 :y (/ 46399 30) :w 174 :h 14]))
         ([TEXT :x 659 :y (/ 46399 30) :w 555 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1214 :y (/ 46399 30) :w 94 :h 14]))
         ([TEXT :x 1308 :y (/ 46399 30) :w 103 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 47071 30) :w 1163 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 47743 30) :w 1163 :h 14])
         ([INLINE :tag SUP :id cite_ref-8 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1364 :y (/ 4769 3) :w 4 :h 11]))
           ([TEXT :x 1368 :y (/ 4769 3) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1375 :y (/ 4769 3) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 48499 30) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 9725 6) :w 672 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-4 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 873 :y (/ 24286 15) :w 4 :h 11]))
           ([TEXT :x 877 :y (/ 24286 15) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 884 :y (/ 24286 15) :w 4 :h 11]))))
         ([TEXT :x 888 :y (/ 9725 6) :w 311 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 1199 :y (/ 9725 6) :w 65 :h 14]))
         ([TEXT :x 1264 :y (/ 9725 6) :w 21 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1285 :y (/ 9725 6) :w 44 :h 14]))
         ([TEXT :x 1329 :y (/ 9725 6) :w 4 :h 14]))
        ([LINE]
         ([INLINE :tag SUP :id e10051 :class (noprint Inline-Template Template-Fact)]
          ([TEXT :x 201 :y (/ 24622 15) :w 4 :h 11])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([INLINE :tag SPAN]
             ([TEXT :x 205 :y (/ 24592 15) :w 87 :h 13]))))
          ([TEXT :x 292 :y (/ 24622 15) :w 4 :h 11]))))
       ([BLOCK :tag H2 :x 201 :y (/ 50473 30) :w 1143.5 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Later_political_activities :class (mw-headline)]
           ([TEXT :x 201 :y (/ 20209 12) :w 217 :h 24]))))
        ([MAGIC :tag SPAN :x 431 :y (/ 20317 12) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10005 :class (mw-editsection-bracket)]
          ([TEXT :x 431 :y (/ 20317 12) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 439.25 :y (/ 20317 12) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10017 :class (mw-editsection-bracket)]
          ([TEXT :x 466.5 :y (/ 20317 12) :w 5 :h 13]))))
       ([BLOCK :tag P :x 201 :y (/ 25766 15) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 25829 15) :w 443 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 644 :y (/ 25829 15) :w 45 :h 14]))
         ([TEXT :x 689 :y (/ 25829 15) :w 204 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 893 :y (/ 25829 15) :w 66 :h 14]))
         ([TEXT :x 959 :y (/ 25829 15) :w 423 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 5233 3) :w 341 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 26543 15) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 26606 15) :w 536 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 737 :y (/ 26606 15) :w 119 :h 14]))
         ([TEXT :x 856 :y (/ 26606 15) :w 159 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1015 :y (/ 26606 15) :w 29 :h 14]))
         ([TEXT :x 1044 :y (/ 26606 15) :w 4 :h 14])
         ([INLINE :tag SUP :id cite_ref-9 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1048 :y (/ 53159 30) :w 4 :h 11]))
           ([TEXT :x 1052 :y (/ 53159 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1059 :y (/ 53159 30) :w 4 :h 11]))))
         ([INLINE :tag SUP :id e10053 :class (noprint Inline-Template)]
          ([TEXT :x 1063 :y (/ 53159 30) :w 4 :h 11])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([INLINE :tag SPAN]
             ([TEXT :x 1067 :y (/ 53099 30) :w 74 :h 13]))))
          ([TEXT :x 1141 :y (/ 53159 30) :w 4 :h 11]))
         ([TEXT :x 1145 :y (/ 26606 15) :w 268 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 26942 15) :w 408 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-5 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 609 :y (/ 53831 30) :w 4 :h 11]))
           ([TEXT :x 613 :y (/ 53831 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 620 :y (/ 53831 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 5464 3) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 27383 15) :w 319 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 520 :y (/ 27383 15) :w 124 :h 14]))
         ([TEXT :x 644 :y (/ 27383 15) :w 399 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1043 :y (/ 27383 15) :w 106 :h 14]))
         ([TEXT :x 1149 :y (/ 27383 15) :w 329 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1478 :y (/ 27383 15) :w 36 :h 14]))
         ([TEXT :x 1514 :y (/ 27383 15) :w 34 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1548 :y (/ 27383 15) :w 36 :h 14]))
         ([TEXT :x 1584 :y (/ 27383 15) :w 112 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 27719 15) :w 27 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 228 :y (/ 27719 15) :w 116 :h 14]))
         ([TEXT :x 344 :y (/ 27719 15) :w 359 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 703 :y (/ 27719 15) :w 124 :h 14]))
         ([TEXT :x 827 :y (/ 27719 15) :w 4 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-6 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 831 :y (/ 11077 6) :w 4 :h 11]))
           ([TEXT :x 835 :y (/ 11077 6) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 842 :y (/ 11077 6) :w 4 :h 11]))))))
       ([BLOCK :tag H2 :x 201 :y (/ 28307 15) :w 1503 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Later_years :class (mw-headline)]
           ([TEXT :x 201 :y (/ 56663 30) :w 104 :h 24]))))
        ([MAGIC :tag SPAN :x 318 :y (/ 56933 30) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10006 :class (mw-editsection-bracket)]
          ([TEXT :x 318 :y (/ 56933 30) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 326.25 :y (/ 56933 30) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10018 :class (mw-editsection-bracket)]
          ([TEXT :x 353.5 :y (/ 56933 30) :w 5 :h 13]))))
       ([BLOCK :tag P :x 201 :y (/ 57673 30) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 57799 30) :w 311 :h 14])
         ([INLINE :tag SUP :id cite_ref-Clay_1984_10-0 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 512 :y (/ 28873 15) :w 4 :h 11]))
           ([TEXT :x 516 :y (/ 28873 15) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 530 :y (/ 28873 15) :w 4 :h 11]))))
         ([TEXT :x 534 :y (/ 57799 30) :w 1084 :h 14])
         ([INLINE :tag SUP :id cite_ref-Clay_1984_10-1 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1618 :y (/ 28873 15) :w 4 :h 11]))
           ([TEXT :x 1622 :y (/ 28873 15) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1636 :y (/ 28873 15) :w 4 :h 11]))))
         ([TEXT :x 1640 :y (/ 57799 30) :w 43 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 58471 30) :w 382 :h 14])
         ([INLINE :tag SUP :id e10055 :class (noprint Inline-Template Template-Fact)]
          ([TEXT :x 583 :y (/ 29209 15) :w 4 :h 11])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([INLINE :tag SPAN]
             ([TEXT :x 587 :y (/ 29179 15) :w 87 :h 13]))))
          ([TEXT :x 674 :y (/ 29209 15) :w 4 :h 11]))))
       ([BLOCK :tag P :x 201 :y (/ 59227 30) :w 1503 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 59353 30) :w 1112 :h 14])
         ([INLINE :tag SUP :id cite_ref-11 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1313 :y (/ 5930 3) :w 4 :h 11]))
           ([TEXT :x 1317 :y (/ 5930 3) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1331 :y (/ 5930 3) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 60109 30) :w 1503 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 12047 6) :w 689 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 890 :y (/ 12047 6) :w 100 :h 14]))
         ([TEXT :x 990 :y (/ 12047 6) :w 61 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 60991 30) :w 1503 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 61117 30) :w 722 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 923 :y (/ 61117 30) :w 69 :h 14]))
         ([TEXT :x 992 :y (/ 61117 30) :w 34 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1026 :y (/ 61117 30) :w 96 :h 14]))
         ([TEXT :x 1122 :y (/ 61117 30) :w 115 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1237 :y (/ 61117 30) :w 105 :h 14]))
         ([TEXT :x 1342 :y (/ 61117 30) :w 63 :h 14])
         ([INLINE :tag SUP :id cite_ref-12 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1405 :y (/ 30532 15) :w 4 :h 11]))
           ([TEXT :x 1409 :y (/ 30532 15) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1423 :y (/ 30532 15) :w 4 :h 11]))))))
       ([BLOCK :tag H2 :x 201 :y (/ 62293 30) :w 1503 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Legacy :class (mw-headline)]
           ([TEXT :x 201 :y (/ 24937 12) :w 65 :h 24]))))
        ([MAGIC :tag SPAN :x 279 :y (/ 25045 12) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10007 :class (mw-editsection-bracket)]
          ([TEXT :x 279 :y (/ 25045 12) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 287.25 :y (/ 25045 12) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10019 :class (mw-editsection-bracket)]
          ([TEXT :x 314.5 :y (/ 25045 12) :w 5 :h 13]))))
       ([MAGIC :tag DIV :x 1444 :y 2153 :w 260 :h (/ 592 3) :mt 7 :mr 0 :mb 18.2 :ml 19.6 :class (thumb tright)]
        ([BLOCK :tag DIV :x 1444 :y 2153 :w 260 :h (/ 592 3) :id e10057 :class (thumbinner)]
         ([ANON]
          ([LINE]
           ([INLINE :tag A :class (image)]
            ([INLINE :tag IMG :class (thumbimage)]))))
         ([BLOCK :tag DIV :x 1448 :y 2326 :w 252 :h (/ 70 3) :class (thumbcaption)]
          ([BLOCK :tag DIV :x 1682 :y 2329 :w 15 :h 11 :class (magnify)]
           ([BLOCK :tag A :x 1682 :y 2329 :w 15 :h 11 :class (internal)]))
          ([ANON]
           ([LINE]
            ([INLINE :tag A :class (mw-redirect)]
             ([TEXT :x 1451 :y 2292.65 :w 62 :h 12])))))))
       ([BLOCK :tag P :x 201 :y (/ 31676 15) :w 1503 :h 23.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 31754 15) :w 115 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 316 :y (/ 31754 15) :w 67 :h 14]))
         ([TEXT :x 383 :y (/ 31754 15) :w 366 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 749 :y (/ 31724 15) :w 212 :h 16]))
         ([TEXT :x 961 :y (/ 31754 15) :w 4 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 32132 15) :w 1503 :h 89.6]
        ([LINE]
         ([TEXT :x 201 :y (/ 6439 3) :w 987 :h 14])
         ([INLINE :tag SUP :id e10058 :class (noprint Inline-Template Template-Fact)]
          ([TEXT :x 1188 :y (/ 64337 30) :w 4 :h 11])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([INLINE :tag SPAN]
             ([TEXT :x 1192 :y (/ 64277 30) :w 87 :h 13]))))
          ([TEXT :x 1279 :y (/ 64337 30) :w 4 :h 11]))
         ([TEXT :x 1283 :y (/ 6439 3) :w 114 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 32531 15) :w 528 :h 14])
         ([INLINE :tag SUP :id e10060 :class (noprint Inline-Template Template-Fact)]
          ([TEXT :x 729 :y (/ 65009 30) :w 4 :h 11])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([INLINE :tag SPAN]
             ([TEXT :x 733 :y (/ 64949 30) :w 87 :h 13]))))
          ([TEXT :x 820 :y (/ 65009 30) :w 4 :h 11]))
         ([TEXT :x 824 :y (/ 32531 15) :w 587 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 32867 15) :w 1203 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 33203 15) :w 243 :h 14])
         ([INLINE :tag SUP :id cite_ref-13 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 444 :y (/ 66353 30) :w 4 :h 11]))
           ([TEXT :x 448 :y (/ 66353 30) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 462 :y (/ 66353 30) :w 4 :h 11]))))
         ([TEXT :x 466 :y (/ 33203 15) :w 551 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1017 :y (/ 33203 15) :w 98 :h 14]))
         ([TEXT :x 1115 :y (/ 33203 15) :w 123 :h 14])))
       ([BLOCK :tag BLOCKQUOTE :x 201 :y (/ 33686 15) :w 1223.4 :h 58.8]
        ([BLOCK :tag P :x 241 :y (/ 33791 15) :w 1143.4 :h 44.8]
         ([LINE]
          ([TEXT :x 241 :y (/ 33854 15) :w 1079 :h 14]))
         ([LINE]
          ([TEXT :x 241 :y (/ 6838 3) :w 371 :h 14]))))
       ([BLOCK :tag P :x 201 :y (/ 34778 15) :w 1503 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 34841 15) :w 128 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 329 :y (/ 34841 15) :w 78 :h 14]))
         ([TEXT :x 407 :y (/ 34841 15) :w 186 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 593 :y (/ 34841 15) :w 107 :h 14]))
         ([TEXT :x 700 :y (/ 34841 15) :w 700 :h 14])
         ([INLINE :tag SUP :id cite_ref-14 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1400 :y (/ 69629 30) :w 4 :h 11]))
           ([TEXT :x 1404 :y (/ 69629 30) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1418 :y (/ 69629 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 35219 15) :w 1503 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 35282 15) :w 1381 :h 14])
         ([INLINE :tag SUP :id cite_ref-rohleder_15-0 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1582 :y (/ 70511 30) :w 4 :h 11]))
           ([TEXT :x 1586 :y (/ 70511 30) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1600 :y (/ 70511 30) :w 4 :h 11]))))
         ([TEXT :x 1604 :y (/ 35282 15) :w 4 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1608 :y (/ 35282 15) :w 87 :h 14])))
        ([LINE]
         ([INLINE :tag A]
          ([TEXT :x 201 :y (/ 35618 15) :w 28 :h 14]))
         ([TEXT :x 229 :y (/ 35618 15) :w 240 :h 14])
         ([INLINE :tag SUP :id cite_ref-rohleder_15-1 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 469 :y (/ 71183 30) :w 4 :h 11]))
           ([TEXT :x 473 :y (/ 71183 30) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 487 :y (/ 71183 30) :w 4 :h 11]))))
         ([TEXT :x 491 :y (/ 35618 15) :w 4 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 495 :y (/ 35618 15) :w 125 :h 14]))
         ([TEXT :x 620 :y (/ 35618 15) :w 672 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1292 :y (/ 35618 15) :w 100 :h 14]))
         ([TEXT :x 1392 :y (/ 35618 15) :w 263 :h 14]))
        ([LINE]
         ([INLINE :tag A]
          ([TEXT :x 201 :y (/ 35954 15) :w 100 :h 14]))
         ([TEXT :x 301 :y (/ 35954 15) :w 185 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 486 :y (/ 35954 15) :w 78 :h 14]))
         ([TEXT :x 564 :y (/ 35954 15) :w 166 :h 14])
         ([INLINE :tag SUP :id cite_ref-16 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 730 :y (/ 14371 6) :w 4 :h 11]))
           ([TEXT :x 734 :y (/ 14371 6) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 748 :y (/ 14371 6) :w 4 :h 11]))))))
       ([BLOCK :tag H2 :x 201 :y (/ 36542 15) :w 1503 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Writings :class (mw-headline)]
           ([TEXT :x 201 :y (/ 73134 30) :w 80 :h 24]))))
        ([MAGIC :tag SPAN :x 294 :y (/ 73404 30) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10008 :class (mw-editsection-bracket)]
          ([TEXT :x 294 :y (/ 73404 30) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 302.25 :y (/ 73404 30) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10020 :class (mw-editsection-bracket)]
          ([TEXT :x 329.5 :y (/ 73404 30) :w 5 :h 13]))))
       ([BLOCK :tag UL :x 223.4 :y 2469.7 :w 1480.6 :h 48.2]
        ([MAGIC :tag LI :x 223.4 :y 2469.7 :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([TEXT :x 223.4 :y 2474.9 :w 114 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 337.4 :y 2472.9 :w 464 :h 16]))
         ([TEXT :x 801.4 :y 2474.9 :w 256 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 74835 30) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag I]
          ([TEXT :x 223.4 :y 2497.7 :w 259 :h 16]))
         ([TEXT :x 482.4 :y 2499.7 :w 176 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 658.4 :y 2499.7 :w 104 :h 14]))
         ([TEXT :x 762.4 :y 2499.7 :w 120 :h 14])))
       ([BLOCK :tag H2 :x 201 :y 2538.9 :w 1503 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id See_also :class (mw-headline)]
           ([TEXT :x 201 :y (/ 38108 15) :w 74 :h 24]))))
        ([MAGIC :tag SPAN :x 288 :y (/ 38243 15) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10009 :class (mw-editsection-bracket)]
          ([TEXT :x 288 :y (/ 38243 15) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 296.25 :y (/ 38243 15) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10021 :class (mw-editsection-bracket)]
          ([TEXT :x 323.5 :y (/ 38243 15) :w 5 :h 13]))))
       ([BLOCK :tag UL :x 223.4 :y (/ 77173 30) :w 1480.6 :h 22.4]
        ([MAGIC :tag LI :x 223.4 :y (/ 77173 30) :w 1480.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 223.4 :y (/ 77299 30) :w 217 :h 14]))))
       ([BLOCK :tag H2 :x 201 :y (/ 15695 6) :w 1503 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id References :class (mw-headline)]
           ([TEXT :x 201 :y (/ 78525 30) :w 102 :h 24]))))
        ([MAGIC :tag SPAN :x 316 :y (/ 78795 30) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10010 :class (mw-editsection-bracket)]
          ([TEXT :x 316 :y (/ 78795 30) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 324.25 :y (/ 78795 30) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10022 :class (mw-editsection-bracket)]
          ([TEXT :x 351.5 :y (/ 78795 30) :w 5 :h 13]))))
       ([BLOCK :tag DIV :x 201 :y (/ 39741 15) :w 1503 :h (/ 2261 6) :id e10062 :class (reflist)]
        ([BLOCK :tag OL :x 241.3 :y (/ 39741 15) :w 1462.7 :h (/ 2261 6) :class (references)]
         ([MAGIC :tag LI :x 241.3 :y (/ 39741 15) :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-eliza-1]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 79559 30) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 79619 30) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A :class (external text)]
            ([TEXT :x 256.3 :y (/ 79619 30) :w 182 :h 13]))
           ([TEXT :x 451.3 :y (/ 79619 30) :w 348 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y (/ 32062 12) :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-2]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y 2674.4 :w 11 :h 15]))))
          ([TEXT :x 252.3 :y 2676.4 :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([TEXT :x 256.3 :y 2676.4 :w 74 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y 2694.25 :w 1462.7 :h (/ 121 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-FOOTNOTEChisholm1911-3]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([TEXT :x 241.3 :y (/ 16187 6) :w 15 :h 13])
           ([INLINE :tag A]
            ([BLOCK :tag SPAN :x 256.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
             ([LINE]
              ([TEXT :x 256.3 :y (/ -2995493 30) :w 32 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y (/ -1497444 15) :w 16 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y -99809.45 :w 17 :h 13])))
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 256.3 :y (/ 32333 12) :w 7 :h 11])))))
           ([TEXT :x 263.3 :y (/ 16187 6) :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 267.3 :y (/ 32333 12) :w 7 :h 11])))))
           ([TEXT :x 274.3 :y (/ 16187 6) :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 278.3 :y (/ 32333 12) :w 6 :h 11])))))
           ([TEXT :x 284.3 :y (/ 16187 6) :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 288.3 :y (/ 32333 12) :w 7 :h 11])))))
           ([TEXT :x 295.3 :y (/ 16187 6) :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 299.3 :y (/ 32333 12) :w 7 :h 11])))))
           ([TEXT :x 306.3 :y (/ 16187 6) :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 310.3 :y (/ 32333 12) :w 4 :h 11])))))
           ([TEXT :x 314.3 :y (/ 16187 6) :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 318.3 :y (/ 32333 12) :w 7 :h 11]))))))
          ([TEXT :x 325.3 :y (/ 16187 6) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A]
            ([TEXT :x 329.3 :y (/ 16187 6) :w 95 :h 13]))
           ([TEXT :x 424.3 :y (/ 16187 6) :w 4 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y 2715.7 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-4]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 40774 15) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 40804 15) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A :class (external text)]
            ([TEXT :x 256.3 :y (/ 40804 15) :w 144 :h 13]))))
         ([MAGIC :tag LI :x 241.3 :y 2738.1 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-BorgenichtRegan2010-5]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([TEXT :x 241.3 :y 2742.7 :w 15 :h 13])
           ([INLINE :tag A]
            ([BLOCK :tag SPAN :x 256.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
             ([LINE]
              ([TEXT :x 256.3 :y (/ -2995493 30) :w 32 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y (/ -1497444 15) :w 16 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y -99809.45 :w 17 :h 13])))
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 256.3 :y 2568.125 :w 7 :h 11])))))
           ([TEXT :x 263.3 :y 2742.7 :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 267.3 :y 2568.125 :w 7 :h 11]))))))
          ([TEXT :x 274.3 :y 2742.7 :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag CITE :class (citation book)]
            ([TEXT :x 278.3 :y 2742.7 :w 276 :h 13])
            ([INLINE :tag A :class (external text)]
             ([INLINE :tag I]
              ([TEXT :x 554.3 :y 2740.7 :w 274 :h 15])))
            ([TEXT :x 841.3 :y 2742.7 :w 8 :h 13])
            ([INLINE :tag A :class (mw-redirect)]
             ([TEXT :x 849.3 :y 2742.7 :w 282 :h 13]))
            ([TEXT :x 1131.3 :y 2742.7 :w 8 :h 13])
            ([INLINE :tag A]
             ([TEXT :x 1139.3 :y 2742.7 :w 102 :h 13]))
            ([TEXT :x 1241.3 :y 2742.7 :w 63 :h 13])
            ([INLINE :tag A]
             ([TEXT :x 1304.3 :y 2742.7 :w 31 :h 13]))
            ([TEXT :x 1335.3 :y 2742.7 :w 4 :h 13])
            ([INLINE :tag A]
             ([TEXT :x 1339.3 :y 2742.7 :w 124 :h 13]))
            ([INLINE :tag SPAN :class (reference-accessdate)]
             ([TEXT :x 1463.3 :y 2742.7 :w 71 :h 13])
             ([INLINE :tag SPAN :class (nowrap)]
              ([TEXT :x 1534.3 :y 2742.7 :w 41 :h 13]))
             ([TEXT :x 1575.3 :y 2742.7 :w 36 :h 13]))
            ([TEXT :x 1611.3 :y 2742.7 :w 4 :h 13]))
           ([INLINE :tag SPAN :class (Z3988)])))
         ([MAGIC :tag LI :x 241.3 :y 2760.55 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-6]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 41447 15) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 41477 15) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A :class (external text)]
            ([TEXT :x 256.3 :y (/ 41477 15) :w 66 :h 13]))))
         ([MAGIC :tag LI :x 241.3 :y 2830 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-7]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 83567 30) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 83627 30) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([TEXT :x 256.3 :y (/ 83627 30) :w 35 :h 13])
           ([INLINE :tag I]
            ([TEXT :x 291.3 :y (/ 83567 30) :w 59 :h 15]))
           ([TEXT :x 350.3 :y (/ 83627 30) :w 81 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y (/ 33665 12) :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-8]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y 2808 :w 11 :h 15]))))
          ([TEXT :x 252.3 :y 2810 :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([TEXT :x 256.3 :y 2810 :w 35 :h 13])
           ([INLINE :tag I]
            ([TEXT :x 291.3 :y 2808 :w 59 :h 15]))
           ([TEXT :x 350.3 :y 2810 :w 83 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y 2827.85 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-9]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 84913 30) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 84973 30) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([TEXT :x 256.3 :y (/ 84973 30) :w 35 :h 13])
           ([INLINE :tag I]
            ([TEXT :x 291.3 :y (/ 84913 30) :w 55 :h 15]))))
         ([MAGIC :tag LI :x 241.3 :y 2672.125 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-Clay_1984-10]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([TEXT :x 241.3 :y (/ 42823 15) :w 15 :h 13])
           ([INLINE :tag A]
            ([BLOCK :tag SPAN :x 256.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
             ([LINE]
              ([TEXT :x 256.3 :y (/ -2995493 30) :w 32 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y (/ -1497444 15) :w 16 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y -99809.45 :w 17 :h 13])))
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 256.3 :y 2851.45 :w 7 :h 11])))))
           ([TEXT :x 263.3 :y (/ 42823 15) :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 267.3 :y 2851.45 :w 7 :h 11]))))))
          ([TEXT :x 274.3 :y (/ 42823 15) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([TEXT :x 278.3 :y (/ 42823 15) :w 314 :h 13])
           ([INLINE :tag I]
            ([INLINE :tag A :class (mw-redirect)]
             ([TEXT :x 592.3 :y (/ 42793 15) :w 189 :h 15])))
           ([TEXT :x 781.3 :y (/ 42823 15) :w 199 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y 2693.125 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-11]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y 2875.3 :w 11 :h 15]))))
          ([TEXT :x 252.3 :y 2877.3 :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([TEXT :x 256.3 :y 2877.3 :w 152 :h 13])
           ([INLINE :tag I]
            ([TEXT :x 408.3 :y 2875.3 :w 513 :h 15]))
           ([TEXT :x 921.3 :y 2877.3 :w 48 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y 2895.15 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-12]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 43466 15) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 43496 15) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A :class (external text)]
            ([TEXT :x 256.3 :y (/ 43496 15) :w 362 :h 13]))
           ([TEXT :x 631.3 :y (/ 43496 15) :w 8 :h 13])
           ([INLINE :tag I]
            ([TEXT :x 639.3 :y (/ 43466 15) :w 131 :h 15]))
           ([TEXT :x 770.3 :y (/ 43496 15) :w 85 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y (/ 35011 12) :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-13]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 17521 6) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 17533 6) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A :class (external text)]
            ([TEXT :x 256.3 :y (/ 17533 6) :w 475 :h 13]))
           ([TEXT :x 744.3 :y (/ 17533 6) :w 8 :h 13])
           ([INLINE :tag A]
            ([TEXT :x 752.3 :y (/ 17533 6) :w 124 :h 13]))
           ([TEXT :x 876.3 :y (/ 17533 6) :w 136 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y 2940 :w 1462.7 :h (/ 124 3) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-14]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y 2942.6 :w 11 :h 15]))))
          ([TEXT :x 252.3 :y 2944.6 :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A :class (external text)]
            ([TEXT :x 256.3 :y 2944.6 :w 1156 :h 13]))
           ([TEXT :x 1425.3 :y 2944.6 :w 242 :h 13])
           ([TEXT :x 241.3 :y (/ 88943 30) :w 48 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y (/ 44739 15) :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-rohleder-15]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([TEXT :x 241.3 :y 2987.2 :w 15 :h 13])
           ([INLINE :tag A]
            ([BLOCK :tag SPAN :x 256.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
             ([LINE]
              ([TEXT :x 256.3 :y (/ -2995493 30) :w 32 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y (/ -1497444 15) :w 16 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y -99809.45 :w 17 :h 13])))
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 256.3 :y (/ 89514 30) :w 7 :h 11])))))
           ([TEXT :x 263.3 :y 2987.2 :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 267.3 :y (/ 89514 30) :w 7 :h 11]))))))
          ([TEXT :x 274.3 :y 2987.2 :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag CITE :class (citation news)]
            ([TEXT :x 278.3 :y 2987.2 :w 99 :h 13])
            ([INLINE :tag A :class (external text)]
             ([TEXT :x 377.3 :y 2987.2 :w 239 :h 13]))
            ([TEXT :x 629.3 :y 2987.2 :w 8 :h 13])
            ([INLINE :tag I]
             ([INLINE :tag A]
              ([TEXT :x 637.3 :y 2985.2 :w 43 :h 15])))
            ([INLINE :tag SPAN :class (reference-accessdate)]
             ([TEXT :x 680.3 :y 2987.2 :w 71 :h 13])
             ([INLINE :tag SPAN :class (nowrap)]
              ([TEXT :x 751.3 :y 2987.2 :w 74 :h 13])))
            ([TEXT :x 825.3 :y 2987.2 :w 4 :h 13]))
           ([INLINE :tag SPAN :class (Z3988)])))
         ([MAGIC :tag LI :x 241.3 :y 3005.05 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-16]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 90229 30) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 90289 30) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A :class (external text)]
            ([TEXT :x 256.3 :y (/ 90289 30) :w 106 :h 13]))
           ([TEXT :x 375.3 :y (/ 90289 30) :w 116 :h 13])))))
       ([BLOCK :tag DL :x 201 :y (/ 90975 30) :w 1503 :h 22.4]
        ([BLOCK :tag DT :x 201 :y (/ 90975 30) :w 1503 :h 22.4]
         ([LINE]
          ([TEXT :x 201 :y 2846 :w 84 :h 16]))))
       ([BLOCK :tag P :x 201 :y (/ 36743 12) :w 1503 :h 23.4]
        ([LINE]
         ([INLINE :tag A :class (image)]
          ([INLINE :tag IMG]))
         ([TEXT :x 213 :y 3067.1 :w 4 :h 14])
         ([INLINE :tag CITE :class (citation encyclopaedia)]
          ([TEXT :x 217 :y 3067.1 :w 202 :h 14])
          ([INLINE :tag A :class (extiw)]
           ([TEXT :x 419 :y 3067.1 :w 159 :h 14]))
          ([TEXT :x 578 :y 3067.1 :w 13 :h 14])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([TEXT :x 591 :y 3065.1 :w 169 :h 16])))
          ([TEXT :x 760 :y 3067.1 :w 272 :h 14]))
         ([INLINE :tag SPAN :class (Z3988)])))
       ([BLOCK :tag H2 :x 201 :y 3106.3 :w 1503 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Further_reading :class (mw-headline)]
           ([TEXT :x 201 :y (/ 93239 30) :w 148 :h 24]))))
        ([MAGIC :tag SPAN :x 362 :y (/ 93509 30) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10011 :class (mw-editsection-bracket)]
          ([TEXT :x 362 :y (/ 93509 30) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 370.25 :y (/ 93509 30) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10023 :class (mw-editsection-bracket)]
          ([TEXT :x 397.5 :y (/ 93509 30) :w 5 :h 13]))))
       ([BLOCK :tag UL :x 223.4 :y (/ 47098 15) :w 1480.6 :h 172.2]
        ([MAGIC :tag LI :x 223.4 :y (/ 47098 15) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (new)]
          ([TEXT :x 223.4 :y (/ 47176 15) :w 119 :h 14]))
         ([TEXT :x 342.4 :y (/ 47176 15) :w 8 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 350.4 :y (/ 47146 15) :w 231 :h 16]))
         ([TEXT :x 581.4 :y (/ 47176 15) :w 216 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 9494 3) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (new)]
          ([TEXT :x 223.4 :y (/ 47548 15) :w 127 :h 14]))
         ([TEXT :x 350.4 :y (/ 47548 15) :w 8 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 358.4 :y (/ 47518 15) :w 316 :h 16]))
         ([TEXT :x 674.4 :y (/ 47548 15) :w 139 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 47842 15) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag CITE :class (citation book)]
          ([TEXT :x 223.4 :y (/ 9584 3) :w 168 :h 14])
          ([INLINE :tag A :class (external text)]
           ([INLINE :tag I]
            ([TEXT :x 391.4 :y (/ 9578 3) :w 846 :h 16])))
          ([TEXT :x 1250.4 :y (/ 9584 3) :w 283 :h 14])
          ([INLINE :tag SPAN :class (reference-accessdate)]
           ([TEXT :x 1533.4 :y (/ 9584 3) :w 77 :h 14])
           ([INLINE :tag SPAN :class (nowrap)]
            ([TEXT :x 1610.4 :y (/ 9584 3) :w 82 :h 14])))
          ([TEXT :x 1692.4 :y (/ 9584 3) :w 4 :h 14]))
         ([INLINE :tag SPAN :class (Z3988)]))
        ([MAGIC :tag LI :x 223.4 :y (/ 48214 15) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 223.4 :y (/ 48292 15) :w 80 :h 14]))
         ([TEXT :x 303.4 :y (/ 48292 15) :w 34 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 337.4 :y (/ 48292 15) :w 104 :h 14]))
         ([TEXT :x 441.4 :y (/ 48292 15) :w 8 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 449.4 :y (/ 48262 15) :w 329 :h 16]))
         ([TEXT :x 778.4 :y (/ 48292 15) :w 234 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 48586 15) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag CITE :id CITEREFKirchner2010 :class (citation)]
          ([TEXT :x 223.4 :y (/ 48664 15) :w 151 :h 14])
          ([INLINE :tag I]
           ([TEXT :x 374.4 :y (/ 48634 15) :w 364 :h 16]))
          ([TEXT :x 738.4 :y (/ 48664 15) :w 8 :h 14])
          ([INLINE :tag A :class (mw-redirect)]
           ([TEXT :x 746.4 :y (/ 48664 15) :w 83 :h 14]))
          ([TEXT :x 829.4 :y (/ 48664 15) :w 108 :h 14])
          ([INLINE :tag A]
           ([TEXT :x 937.4 :y (/ 48664 15) :w 32 :h 14]))
          ([TEXT :x 969.4 :y (/ 48664 15) :w 4 :h 14])
          ([INLINE :tag A]
           ([TEXT :x 973.4 :y (/ 48664 15) :w 105 :h 14])))
         ([INLINE :tag SPAN :class (Z3988)]))
        ([MAGIC :tag LI :x 223.4 :y (/ 48958 15) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (new)]
          ([TEXT :x 223.4 :y (/ 49036 15) :w 113 :h 14]))
         ([TEXT :x 336.4 :y (/ 49036 15) :w 8 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 344.4 :y (/ 49006 15) :w 264 :h 16]))
         ([TEXT :x 608.4 :y (/ 49036 15) :w 236 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 9866 3) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (new)]
          ([TEXT :x 223.4 :y (/ 49408 15) :w 138 :h 14]))
         ([TEXT :x 361.4 :y (/ 49408 15) :w 8 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 369.4 :y (/ 49378 15) :w 313 :h 16]))
         ([TEXT :x 682.4 :y (/ 49408 15) :w 241 :h 14])))
       ([BLOCK :tag H2 :x 201 :y (/ 49996 15) :w 1503 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id External_links :class (mw-headline)]
           ([TEXT :x 201 :y 3126.25 :w 129 :h 24]))))
        ([MAGIC :tag SPAN :x 343 :y 3134.75 :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10012 :class (mw-editsection-bracket)]
          ([TEXT :x 343 :y 3134.75 :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 351.25 :y 3134.75 :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10024 :class (mw-editsection-bracket)]
          ([TEXT :x 378.5 :y 3134.75 :w 5 :h 13]))))
       ([BLOCK :tag UL :x 223.4 :y (/ 50499 15) :w 1480.6 :h 117.6]
        ([MAGIC :tag LI :x 223.4 :y (/ 50499 15) :w 1480.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (external text)]
          ([TEXT :x 223.4 :y (/ 40450 12) :w 217 :h 14]))
         ([TEXT :x 453.4 :y (/ 40450 12) :w 111 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 40685 12) :w 1480.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (external text)]
          ([TEXT :x 223.4 :y (/ 50919 15) :w 247 :h 14]))
         ([TEXT :x 483.4 :y (/ 50919 15) :w 112 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 102426 30) :w 1480.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (external text)]
          ([TEXT :x 223.4 :y (/ 41021 12) :w 446 :h 14]))
         ([TEXT :x 682.4 :y (/ 41021 12) :w 220 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y 3438 :w 1480.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (external text)]
          ([TEXT :x 223.4 :y (/ 103266 30) :w 178 :h 14]))
         ([TEXT :x 414.4 :y (/ 103266 30) :w 226 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 41542 12) :w 1480.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (external text)]
          ([TEXT :x 223.4 :y 3466 :w 116 :h 14]))
         ([TEXT :x 352.4 :y 3466 :w 8 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 360.4 :y 3466 :w 159 :h 14]))
         ([TEXT :x 519.4 :y 3466 :w 263 :h 14])))
       ([MAGIC :tag TABLE :x 598.7 :y (/ 52363 15) :w (/ 8491 12) :h (/ 1589 12) :mt 6.65 :mr 0 :mb 6.65 :ml 0 :id e10068 :class (wikitable succession-box)]
        ([MAGIC :tag TBODY :x 599.7 :y (/ 52408 15) :w (/ 8479 12) :h (/ 1553 12) :mt 0 :mr 0 :mb 0 :ml 0]
         ([MAGIC :tag TR :x 599.7 :y (/ 52408 15) :w (/ 8479 12) :h (/ 444 15) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 599.7 :y (/ 52408 15) :w (/ 8479 12) :h (/ 444 15) :mt 0 :mr 0 :mb 0 :ml 0 :id e10069]
           ([TEXT :x 905 :y (/ 10505 3) :w 125 :h 15])))
         ([MAGIC :tag TR :x 599.7 :y (/ 105705 30) :w (/ 8479 12) :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10070]
          ([MAGIC :tag TD :x 599.7 :y (/ 105705 30) :w (/ 6359 30) :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10071]
           ([TEXT :x (/ 1997 3) :y 3309.625 :w 79 :h 13])
           ([INLINE :tag BR])
           ([INLINE :tag SPAN :id e10072]
            ([INLINE :tag A]
             ([TEXT :x 653.7 :y (/ 106517 30) :w 103 :h 15]))))
          ([MAGIC :tag TD :x (/ 2435 3) :y (/ 105705 30) :w 282.65 :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10074]
           ([INLINE :tag B]
            ([INLINE :tag A :class (mw-redirect)]
             ([TEXT :x 831 :y 3308.75 :w 271 :h 15])))
           ([INLINE :tag BR])
           ([TEXT :x 866 :y (/ 106577 30) :w 201 :h 13]))
          ([MAGIC :tag TD :x 1094.3 :y (/ 105705 30) :w (/ 6359 30) :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10075]
           ([TEXT :x (/ 34643 30) :y 3309.625 :w 90 :h 13])
           ([INLINE :tag BR])
           ([INLINE :tag SPAN :id e10076]
            ([INLINE :tag A]
             ([TEXT :x 1141.8 :y (/ 106517 30) :w 116 :h 15])))))
         ([MAGIC :tag TR :x 599.7 :y (/ 53601 15) :w (/ 8479 12) :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10078]
          ([MAGIC :tag TD :x 599.7 :y (/ 53601 15) :w (/ 6359 30) :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10079]
           ([TEXT :x (/ 1997 3) :y (/ 42962 12) :w 79 :h 13])
           ([INLINE :tag BR])
           ([INLINE :tag SPAN :id e10080]
            ([INLINE :tag A]
             ([TEXT :x (/ 7766 12) :y (/ 54007 15) :w 116 :h 15]))))
          ([MAGIC :tag TD :x (/ 2435 3) :y (/ 53601 15) :w 282.65 :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10082]
           ([INLINE :tag B]
            ([INLINE :tag A :class (mw-redirect)]
             ([TEXT :x 831 :y (/ 42950 12) :w 271 :h 15])))
           ([INLINE :tag BR])
           ([TEXT :x 858 :y (/ 54037 15) :w 217 :h 13]))
          ([MAGIC :tag TD :x 1094.3 :y (/ 53601 15) :w (/ 6359 30) :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10083]
           ([TEXT :x (/ 34643 30) :y (/ 42962 12) :w 90 :h 13])
           ([INLINE :tag BR])
           ([INLINE :tag SPAN :id e10084]
            ([INLINE :tag A]
             ([TEXT :x 1136.8 :y (/ 54007 15) :w 126 :h 15])))))))
       ([MAGIC :tag TABLE :x 201 :y 3635.6 :w 1503 :h (/ 5623 30) :mt 12.3 :mr 0 :mb 0 :ml 0 :id e10086 :class (navbox)]
        ([MAGIC :tag TBODY :x 203 :y 3637.6 :w 1499 :h (/ 5503 30) :mt 0 :mr 0 :mb 0 :ml 0]
         ([MAGIC :tag TR :x 203 :y 3637.6 :w 1499 :h (/ 5503 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x 203 :y 3637.6 :w 1499 :h (/ 5503 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10087]
           ([MAGIC :tag TABLE :x 205 :y 3639.6 :w 1495 :h (/ 5383 30) :mt 0 :mr 0 :mb 0 :ml 0 :id collapsibleTable0 :class (nowraplinks collapsible autocollapse navbox-inner)]
            ([MAGIC :tag TBODY :x 205 :y 3639.6 :w 1495 :h (/ 5383 30) :mt 0 :mr 0 :mb 0 :ml 0]
             ([MAGIC :tag TR :x 205 :y 3639.6 :w 1495 :h 25.65 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TH :x 205 :y 3639.6 :w 1495 :h 25.65 :mt 0 :mr 0 :mb 0 :ml 0 :class (navbox-title)]
               ([BLOCK :tag SPAN :x (/ 48413 30) :y 3642.7 :w 73.9 :h (/ 555 30) :class (collapseButton)]
                ([LINE]
                 ([TEXT :x 1650.7 :y (/ 43751 12) :w 5 :h 12])
                 ([INLINE :tag A :id collapseButton0]
                  ([TEXT :x 1655.7 :y (/ 43751 12) :w 27 :h 12]))
                 ([TEXT :x 1682.7 :y (/ 43751 12) :w 5 :h 12])))
               ([BLOCK :tag DIV :x 217.3 :y 3642.7 :w 73.9 :h (/ 585 30) :class (plainlinks hlist navbar mini)]
                ([LINE]
                 ([INLINE :tag UL]
                  ([INLINE :tag LI :class (nv-view)]
                   ([INLINE :tag A]
                    ([INLINE :tag ABBR :id e10025]
                     ([TEXT :x 217.3 :y (/ 43763 12) :w 7 :h 12]))))
                  ([INLINE :tag LI :class (nv-talk)]
                   ([INLINE :tag A :class (new)]
                    ([INLINE :tag ABBR :id e10026]
                     ([TEXT :x 234.25 :y (/ 43763 12) :w 5 :h 12]))))
                  ([INLINE :tag LI :class (nv-edit)]
                   ([INLINE :tag A :class (external text)]
                    ([INLINE :tag ABBR :id e10027]
                     ([TEXT :x (/ 2990 12) :y (/ 43763 12) :w 7 :h 12])))))))
               ([BLOCK :tag DIV :x 217.3 :y 3642.7 :w (/ 44111 30) :h (/ 281 15) :id e10091]
                ([LINE]
                 ([INLINE :tag SPAN :class (flagicon)]
                  ([INLINE :tag IMG :class (thumbborder)]))
                 ([TEXT :x 800 :y (/ 43727 12) :w 5 :h 16])
                 ([INLINE :tag A]
                  ([TEXT :x 805 :y (/ 43727 12) :w 295 :h 16]))
                 ([TEXT :x 1100 :y (/ 43727 12) :w 5 :h 16])
                 ([INLINE :tag SPAN :class (flagicon)]
                  ([INLINE :tag A]
                   ([INLINE :tag IMG :class (thumbborder)])))))))
             ([MAGIC :tag TR :x 205 :y 3665.25 :w 1495 :h 2 :mt 0 :mr 0 :mb 0 :ml 0 :id e10092]
              ([MAGIC :tag TD :x 205 :y 3665.25 :w 1495 :h 2 :mt 0 :mr 0 :mb 0 :ml 0]))
             ([MAGIC :tag TR :x 205 :y 3667.25 :w 1495 :h (/ 1845 30) :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TH :x 205 :y 3667.25 :w (/ 6499 30) :h (/ 1845 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (navbox-group)]
               ([TEXT :x 274.3 :y 3681.75 :w 135 :h 14])
               ([INLINE :tag BR])
               ([INLINE :tag A]
                ([TEXT :x 217.3 :y (/ 111007 30) :w 108 :h 14]))
               ([TEXT :x 325.3 :y (/ 111007 30) :w 84 :h 14]))
              ([MAGIC :tag TD :x (/ 12649 30) :y 3667.25 :w (/ 38351 30) :h (/ 1845 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10093 :class (navbox-list navbox-odd hlist)]
               ([BLOCK :tag DIV :x (/ 12709 30) :y 3667.25 :w (/ 38291 30) :h (/ 1845 30) :id e10094]
                ([BLOCK :tag UL :x 400 :y 3667.25 :w 1270.2 :h (/ 1845 30)]
                 ([LINE]
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 400 :y 3673 :w 33 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 443.125 :y 3673 :w 34 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 487.25 :y 3673 :w 42 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 538.75 :y 3673 :w 43 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 591.25 :y 3673 :w 48 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 648.5 :y 3673 :w 57 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 714.125 :y 3673 :w 61 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 783.5 :y 3673 :w 59 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 851 :y 3673 :w 63 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 922.25 :y 3673 :w 62 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 992.5 :y 3673 :w 42 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1044.125 :y 3673 :w 25 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1079.75 :y 3673 :w 38 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1127.5 :y 3673 :w 75 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1210 :y 3673 :w 29 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1249.375 :y 3673 :w 53 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1311.25 :y 3673 :w 38 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1359.125 :y 3673 :w 38 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1406.875 :y 3673 :w 54 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1469.75 :y 3673 :w 48 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1526.875 :y 3673 :w 56 :h 12]))))
                 ([LINE]
                  ([INLINE :tag LI]
                   ([INLINE :tag STRONG :class (selflink)]
                    ([TEXT :x 400 :y 3690.5 :w 30 :h 14])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 440.375 :y 3692.5 :w 56 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag STRONG :class (selflink)]
                    ([TEXT :x 505 :y 3690.5 :w 30 :h 14])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 545.375 :y 3692.5 :w 49 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 603.5 :y 3692.5 :w 46 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 658.75 :y 3692.5 :w 37 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 705.625 :y 3692.5 :w 19 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 735.625 :y 3692.5 :w 34 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 779.75 :y 3692.5 :w 36 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 825.625 :y 3692.5 :w 66 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 899.75 :y 3692.5 :w 40 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 949.375 :y 3692.5 :w 30 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 989.75 :y 3692.5 :w 50 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1048.75 :y 3692.5 :w 22 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1081.625 :y 3692.5 :w 44 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1135 :y 3692.5 :w 48 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1192.25 :y 3692.5 :w 26 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1228.75 :y 3692.5 :w 26 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1265.375 :y 3692.5 :w 35 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1310.375 :y 3692.5 :w 35 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1355.375 :y 3692.5 :w 78 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1440.625 :y 3692.5 :w 61 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1510 :y 3692.5 :w 35 :h 12]))))
                 ([LINE]
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 400 :y 3775 :w 66 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 474.125 :y 3775 :w 37 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 521 :y 3775 :w 38 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 568.75 :y 3775 :w 46 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 624.125 :y 3775 :w 31 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A :class (new)]
                    ([TEXT :x 665.375 :y 3775 :w 41 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 716 :y 3775 :w 37 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 762.875 :y 3775 :w 44 :h 12]))))))))
             ([MAGIC :tag TR :x 205 :y (/ 111863 30) :w 1495 :h 2 :mt 0 :mr 0 :mb 0 :ml 0 :id e10095]
              ([MAGIC :tag TD :x 205 :y (/ 111863 30) :w 1495 :h 2 :mt 0 :mr 0 :mb 0 :ml 0]))
             ([MAGIC :tag TR :x 205 :y (/ 111923 30) :w 1495 :h (/ 647 15) :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TH :x 205 :y (/ 111923 30) :w (/ 6499 30) :h (/ 647 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (navbox-group)]
               ([TEXT :x 274.3 :y (/ 44833 12) :w 135 :h 14])
               ([INLINE :tag BR])
               ([INLINE :tag A]
                ([TEXT :x 236.3 :y (/ 112637 30) :w 89 :h 14]))
               ([TEXT :x 325.3 :y (/ 112637 30) :w 84 :h 14]))
              ([MAGIC :tag TD :x (/ 12649 30) :y (/ 111923 30) :w (/ 38351 30) :h (/ 647 15) :mt 0 :mr 0 :mb 0 :ml 0 :id e10096 :class (navbox-list navbox-even hlist)]
               ([BLOCK :tag DIV :x (/ 12709 30) :y 3741.05 :w (/ 38291 30) :h 22.55 :id e10097]
                ([BLOCK :tag UL :x 400 :y 3741.05 :w 1270.2 :h 22.55]
                 ([LINE]
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 400 :y (/ 44962 12) :w 35 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 445 :y (/ 44962 12) :w 41 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 495.625 :y (/ 44962 12) :w 66 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 569.75 :y (/ 44962 12) :w 54 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 632.5 :y (/ 44962 12) :w 57 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 698.125 :y (/ 44962 12) :w 35 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 743.125 :y (/ 44962 12) :w 22 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 776 :y (/ 44962 12) :w 46 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 831.25 :y (/ 44962 12) :w 43 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 883.75 :y (/ 44962 12) :w 65 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 956.875 :y (/ 44962 12) :w 38 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1004.75 :y (/ 44962 12) :w 65 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1077.875 :y (/ 44962 12) :w 35 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1122.875 :y (/ 44962 12) :w 54 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1185.625 :y (/ 44962 12) :w 29 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1225 :y (/ 44962 12) :w 46 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1280.375 :y (/ 44962 12) :w 54 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1343.125 :y (/ 44962 12) :w 48 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1400.375 :y (/ 44962 12) :w 48 :h 12]))))))))
             ([MAGIC :tag TR :x 205 :y 3773.9 :w 1495 :h 2 :mt 0 :mr 0 :mb 0 :ml 0 :id e10098]
              ([MAGIC :tag TD :x 205 :y 3773.9 :w 1495 :h 2 :mt 0 :mr 0 :mb 0 :ml 0]))
             ([MAGIC :tag TR :x 205 :y 3775.9 :w 1495 :h (/ 647 15) :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TH :x 205 :y 3775.9 :w (/ 6499 30) :h (/ 647 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (navbox-group)]
               ([TEXT :x 302.3 :y (/ 113436 30) :w 107 :h 14])
               ([INLINE :tag BR])
               ([TEXT :x 254.3 :y 3799.7 :w 155 :h 14]))
              ([MAGIC :tag TD :x (/ 12649 30) :y 3775.9 :w (/ 38351 30) :h (/ 647 15) :mt 0 :mr 0 :mb 0 :ml 0 :id e10099 :class (navbox-list navbox-odd hlist)]
               ([BLOCK :tag DIV :x (/ 12709 30) :y (/ 45434 12) :w (/ 38291 30) :h 22.55 :id e10100]
                ([BLOCK :tag UL :x 400 :y (/ 45434 12) :w 1270.2 :h 22.55]
                 ([LINE]
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 400 :y 3791.95 :w 57 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 465.625 :y 3791.95 :w 40 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 515.375 :y 3791.95 :w 60 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 583.75 :y 3791.95 :w 36 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 629.75 :y 3791.95 :w 38 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 677.5 :y 3791.95 :w 42 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 729.125 :y 3791.95 :w 26 :h 12]))))))))))))))
       ([MAGIC :tag TABLE :x 201 :y (/ 114661 30) :w 1503 :h 32.65 :mt -1 :mr 0 :mb 0 :ml 0 :id e10031 :class (navbox)]
        ([MAGIC :tag TBODY :x 203 :y (/ 114721 30) :w 1499 :h 28.65 :mt 0 :mr 0 :mb 0 :ml 0]
         ([MAGIC :tag TR :x 203 :y (/ 114721 30) :w 1499 :h 28.65 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x 203 :y (/ 114721 30) :w 1499 :h 28.65 :mt 0 :mr 0 :mb 0 :ml 0 :id e10101]
           ([MAGIC :tag TABLE :x 205 :y (/ 114781 30) :w 1495 :h 24.65 :mt 0 :mr 0 :mb 0 :ml 0 :id e10102 :class (nowraplinks hlist navbox-inner)]
            ([MAGIC :tag TBODY :x 205 :y (/ 114781 30) :w 1495 :h 24.65 :mt 0 :mr 0 :mb 0 :ml 0]
             ([MAGIC :tag TR :x 205 :y (/ 114781 30) :w 1495 :h 24.65 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TH :x 205 :y (/ 114781 30) :w (/ 4339 30) :h 24.65 :mt 0 :mr 0 :mb 0 :ml 0 :class (navbox-group)]
               ([INLINE :tag A]
                ([TEXT :x 217.3 :y 3831.35 :w 120 :h 14])))
              ([MAGIC :tag TD :x (/ 10489 30) :y (/ 114781 30) :w (/ 40511 30) :h 24.65 :mt 0 :mr 0 :mb 0 :ml 0 :id e10103 :class (navbox-list navbox-odd)]
               ([BLOCK :tag DIV :x (/ 10549 30) :y (/ 45925 12) :w (/ 40451 30) :h 22.55 :id e10104]
                ([BLOCK :tag UL :x 332.5 :y (/ 45925 12) :w 1342.2 :h 22.55]
                 ([LINE]
                  ([INLINE :tag LI]
                   ([INLINE :tag A :class (external text)]
                    ([TEXT :x 332.5 :y 3832.85 :w 55 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 408.5 :y 3832.85 :w 25 :h 12]))
                   ([TEXT :x 431.875 :y 3832.85 :w 8 :h 12])
                   ([INLINE :tag SPAN :class (uid)]
                    ([INLINE :tag A :class (external text)]
                     ([TEXT :x 439.375 :y 3832.85 :w 64 :h 12]))))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 523.75 :y 3832.85 :w 31 :h 12]))
                   ([TEXT :x 552.875 :y 3832.85 :w 8 :h 12])
                   ([INLINE :tag SPAN :class (uid)]
                    ([INLINE :tag A :class (external text)]
                     ([TEXT :x 560.375 :y 3832.85 :w 72 :h 12]))))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 652.25 :y 3832.85 :w 23 :h 12]))
                   ([TEXT :x 673.75 :y 3832.85 :w 8 :h 12])
                   ([INLINE :tag SPAN :class (uid)]
                    ([INLINE :tag A :class (external text)]
                     ([TEXT :x 681.25 :y 3832.85 :w 140 :h 12]))))))))))))))))
      ([MAGIC :tag DIV :x 201 :y 3868.7 :w 1503 :h 56.8 :mt 14 :mr 0 :mb 0 :ml 0 :id catlinks :class (catlinks)]
       ([BLOCK :tag DIV :x 207 :y 3874.7 :w 1491 :h 44.8 :id mw-normal-catlinks :class (mw-normal-catlinks)]
        ([ANON]
         ([LINE]
          ([INLINE :tag A]
           ([TEXT :x 207 :y 3878.9 :w 75 :h 14]))
          ([TEXT :x 282 :y 3878.9 :w 9 :h 14])))
        ([MAGIC :tag LI :x 291 :y (/ 58157 15) :w 89.5 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0 :id e10028]
         ([INLINE :tag A]
          ([TEXT :x 294.5 :y 3878.9 :w 79 :h 14])))
        ([MAGIC :tag LI :x 380.5 :y (/ 58157 15) :w 103 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 388.5 :y 3878.9 :w 88 :h 14])))
        ([MAGIC :tag LI :x 483.5 :y (/ 58157 15) :w 165 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 491.5 :y 3878.9 :w 150 :h 14])))
        ([MAGIC :tag LI :x 648.5 :y (/ 58157 15) :w 284 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 656.5 :y 3878.9 :w 269 :h 14])))
        ([MAGIC :tag LI :x 932.5 :y (/ 58157 15) :w 161 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 940.5 :y 3878.9 :w 146 :h 14])))
        ([MAGIC :tag LI :x 1093.5 :y (/ 58157 15) :w 373 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 1101.5 :y 3878.9 :w 358 :h 14])))
        ([MAGIC :tag LI :x 207 :y (/ 58493 15) :w 317 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 215 :y 3657.5 :w 302 :h 14])))
        ([MAGIC :tag LI :x 524 :y (/ 58493 15) :w 166 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 532 :y 3657.5 :w 151 :h 14])))
        ([MAGIC :tag LI :x 690 :y (/ 58493 15) :w 216 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 698 :y 3657.5 :w 201 :h 14])))
        ([MAGIC :tag LI :x 906 :y (/ 58493 15) :w 164 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 914 :y 3657.5 :w 149 :h 14])))
        ([MAGIC :tag LI :x 1070 :y (/ 58493 15) :w 214 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 1078 :y 3657.5 :w 199 :h 14])))
        ([MAGIC :tag LI :x 1284 :y (/ 58493 15) :w 243 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 1292 :y 3657.5 :w 228 :h 14])))
        ([MAGIC :tag LI :x 1527 :y (/ 58493 15) :w 157 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 1535 :y 3657.5 :w 142 :h 14])))
        ([ANON]
         ([LINE]
          ([INLINE :tag UL])))))
      ([MAGIC :tag DIV :x 201 :y (/ 117765 30) :w 1503 :h 0 :mt 0 :mr 0 :mb 0 :ml 0 :class (visualClear)])))
    ([BLOCK :tag DIV :x 0 :y (/ 118515 30) :w 1728 :h 0 :id mw-navigation]
     ([BLOCK :tag H2 :x 0 :y -9999 :w 204 :h (/ 553 12)]
      ([LINE]
       ([TEXT :x 0 :y -9984.5 :w 204 :h 24])))
     ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 80 :id mw-head]
      ([BLOCK :tag DIV :x 1167 :y 5 :w 545 :h 20.7 :id p-personal]
       ([BLOCK :tag UL :x 1167 :y 5 :w 545 :h 0]
        ([MAGIC :tag LI :x 1336 :y 10.625 :w 99 :h 13.5 :mt 6 :mr 0 :mb 1.2 :ml 9 :id pt-anonuserpage]
         ([TEXT :x 1351 :y (/ 361 30) :w 84 :h 12]))
        ([MAGIC :tag LI :x 1444 :y 10.625 :w 23 :h 13.5 :mt 6 :mr 0 :mb 1.2 :ml 9 :id pt-anontalk]
         ([INLINE :tag A]
          ([TEXT :x 1444 :y (/ 361 30) :w 23 :h 12])))
        ([MAGIC :tag LI :x 1476 :y 10.625 :w 84 :h 13.5 :mt 6 :mr 0 :mb 1.2 :ml 9 :id pt-anoncontribs]
         ([INLINE :tag A]
          ([TEXT :x 1476 :y (/ 361 30) :w 84 :h 12])))
        ([MAGIC :tag LI :x 1569 :y 10.625 :w 97 :h 13.5 :mt 6 :mr 0 :mb 1.2 :ml 9 :id pt-createaccount]
         ([INLINE :tag A]
          ([TEXT :x 1569 :y (/ 361 30) :w 97 :h 12])))
        ([MAGIC :tag LI :x 1675 :y 10.625 :w 37 :h 13.5 :mt 6 :mr 0 :mb 1.2 :ml 9 :id pt-login]
         ([INLINE :tag A]
          ([TEXT :x 1675 :y (/ 361 30) :w 37 :h 12])))))
      ([BLOCK :tag DIV :x 176 :y 40 :w 89.6 :h 40 :id left-navigation]
       ([BLOCK :tag DIV :x 176 :y 40 :w 89.6 :h 40 :id p-namespaces :class (vectorTabs)]
        ([BLOCK :tag UL :x 177 :y 40 :w 88.6 :h 40]
         ([BLOCK :tag LI :x 177 :y 40 :w 52.8 :h 40 :id ca-nstab-main :class (selected)]
          ([MAGIC :tag SPAN :x 177 :y 40 :w 52.8 :h 40.3 :mt 0 :mr 0 :mb 0 :ml 0]
           ([BLOCK :tag A :x 177 :y 40 :w 52.8 :h 40.3]
            ([LINE]
             ([TEXT :x 183.4 :y 58.5 :w 40 :h 13])))))
         ([BLOCK :tag LI :x 229.8 :y 40 :w 35.8 :h 40 :id ca-talk]
          ([MAGIC :tag SPAN :x 229.8 :y 40 :w 35.8 :h 40.3 :mt 0 :mr 0 :mb 0 :ml 0]
           ([BLOCK :tag A :x 229.8 :y 40 :w 35.8 :h 40.3]
            ([LINE]
             ([TEXT :x 236.2 :y 58.5 :w 23 :h 13]))))))))
      ([BLOCK :tag DIV :x 1189.2 :y 40 :w 538.8 :h 40 :id right-navigation]
       ([BLOCK :tag DIV :x 1189.2 :y 40 :w 170.4 :h 40 :id p-views :class (vectorTabs)]
        ([BLOCK :tag UL :x 1190.2 :y 40 :w 169.4 :h 40]
         ([BLOCK :tag LI :x 1190.2 :y 40 :w 43.8 :h 40 :id ca-view :class (selected)]
          ([MAGIC :tag SPAN :x 1190.2 :y 40 :w 43.8 :h 40.3 :mt 0 :mr 0 :mb 0 :ml 0]
           ([BLOCK :tag A :x 1190.2 :y 40 :w 43.8 :h 40.3]
            ([LINE]
             ([TEXT :x 1196.6 :y 58.5 :w 31 :h 13])))))
         ([BLOCK :tag LI :x 1234 :y 40 :w 36.8 :h 40 :id ca-edit]
          ([MAGIC :tag SPAN :x 1234 :y 40 :w 36.8 :h 40.3 :mt 0 :mr 0 :mb 0 :ml 0]
           ([BLOCK :tag A :x 1234 :y 40 :w 36.8 :h 40.3]
            ([LINE]
             ([TEXT :x 1240.4 :y 58.5 :w 24 :h 13])))))
         ([BLOCK :tag LI :x 1270.8 :y 40 :w 88.8 :h 40 :id ca-history :class (collapsible)]
          ([MAGIC :tag SPAN :x 1270.8 :y 40 :w 88.8 :h 40.3 :mt 0 :mr 0 :mb 0 :ml 0]
           ([BLOCK :tag A :x 1270.8 :y 40 :w 88.8 :h 40.3]
            ([LINE]
             ([TEXT :x 1277.2 :y 58.5 :w 76 :h 13])))))))
       ([BLOCK :tag DIV :x 1367.6 :y 40 :w 344.4 :h 34.8 :id p-search]
        ([BLOCK :tag FORM :x 1367.6 :y 50.4 :w 344.4 :h 24.4 :id searchform]
         ([BLOCK :tag DIV :x 1367.6 :y 50.4 :w 344.4 :h 24.4 :id simpleSearch]
          ([ANON]
           ([LINE]
            ([INLINE :tag INPUT :id searchInput])))
          ([BLOCK :tag INPUT :x 1688.1 :y 51.4 :w 22.9 :h 22.4 :id searchButton :class (searchButton)]))))))
     ([BLOCK :tag DIV :x 0 :y 160 :w 168 :h 695.5 :id mw-panel]
      ([BLOCK :tag DIV :x 8 :y 0 :w 160 :h 160 :id p-logo]
       ([BLOCK :tag A :x 8 :y 0 :w 160 :h 160 :class (mw-wiki-logo)]))
      ([BLOCK :tag DIV :x 19.2 :y 176 :w 139.2 :h 144.5 :id p-navigation :class (portal)]
       ([BLOCK :tag DIV :x 27.2 :y 180 :w 131.2 :h 136.5 :id e10030 :class (body)]
        ([BLOCK :tag UL :x 27.2 :y 180 :w 131.2 :h 136.5]
         ([MAGIC :tag LI :x 27.2 :y 180 :w 131.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-mainpage-description]
          ([INLINE :tag A]
           ([TEXT :x 27.2 :y 183.75 :w 65 :h 12])))
         ([MAGIC :tag LI :x 27.2 :y 199.5 :w 131.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-contents]
          ([INLINE :tag A]
           ([TEXT :x 27.2 :y 203.25 :w 57 :h 12])))
         ([MAGIC :tag LI :x 27.2 :y 219 :w 131.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-featuredcontent]
          ([INLINE :tag A]
           ([TEXT :x 27.2 :y 222.75 :w 109 :h 12])))
         ([MAGIC :tag LI :x 27.2 :y 238.5 :w 131.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-currentevents]
          ([INLINE :tag A]
           ([TEXT :x 27.2 :y 242.25 :w 93 :h 12])))
         ([MAGIC :tag LI :x 27.2 :y 258 :w 131.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-randompage]
          ([INLINE :tag A]
           ([TEXT :x 27.2 :y 261.75 :w 94 :h 12])))
         ([MAGIC :tag LI :x 27.2 :y 277.5 :w 131.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-sitesupport]
          ([INLINE :tag A]
           ([TEXT :x 27.2 :y 281.25 :w 126 :h 12])))
         ([MAGIC :tag LI :x 27.2 :y 297 :w 131.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-shoplink]
          ([INLINE :tag A]
           ([TEXT :x 27.2 :y 300.75 :w 96 :h 12]))))))
      ([BLOCK :tag DIV :x 19.2 :y 320.5 :w 139.2 :h 125.5 :id p-interaction :class (portal)]
       ([BLOCK :tag H3 :x 19.2 :y 324.5 :w 139.2 :h 20 :id p-interaction-label]
        ([LINE]
         ([TEXT :x 22.2 :y 328.5 :w 68 :h 12])))
       ([BLOCK :tag DIV :x 39.2 :y 344.5 :w 119.2 :h 97.5 :class (body)]
        ([BLOCK :tag UL :x 39.2 :y 344.5 :w 119.2 :h 97.5]
         ([MAGIC :tag LI :x 39.2 :y 344.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-help]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 348.25 :w 28 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 364 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-aboutsite]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 367.75 :w 100 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 383.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-portal]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 387.25 :w 109 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 403 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-recentchanges]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 406.75 :w 101 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 422.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-contactpage]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 426.25 :w 85 :h 12]))))))
      ([BLOCK :tag DIV :x 19.2 :y 446 :w 139.2 :h 184 :id p-tb :class (portal)]
       ([BLOCK :tag H3 :x 19.2 :y 450 :w 139.2 :h 20 :id p-tb-label]
        ([LINE]
         ([TEXT :x 22.2 :y 454 :w 31 :h 12])))
       ([BLOCK :tag DIV :x 39.2 :y 470 :w 119.2 :h 156 :class (body)]
        ([BLOCK :tag UL :x 39.2 :y 470 :w 119.2 :h 156]
         ([MAGIC :tag LI :x 39.2 :y 470 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-whatlinkshere]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 473.75 :w 97 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 489.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-recentchangeslinked]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 493.25 :w 105 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 509 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-upload]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 512.75 :w 66 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 528.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-specialpages]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 532.25 :w 88 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 548 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-permalink]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 551.75 :w 94 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 567.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-info]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 571.25 :w 106 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 587 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-wikibase]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 590.75 :w 84 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 606.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-cite]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 610.25 :w 87 :h 12]))))))
      ([BLOCK :tag DIV :x 19.2 :y 630 :w 139.2 :h 86.5 :id p-coll-print_export :class (portal)]
       ([BLOCK :tag H3 :x 19.2 :y 634 :w 139.2 :h 20 :id p-coll-print_export-label]
        ([LINE]
         ([TEXT :x 22.2 :y 638 :w 73 :h 12])))
       ([BLOCK :tag DIV :x 39.2 :y 654 :w 119.2 :h 58.5 :class (body)]
        ([BLOCK :tag UL :x 39.2 :y 654 :w 119.2 :h 58.5]
         ([MAGIC :tag LI :x 39.2 :y 654 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id coll-create_a_book]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 657.75 :w 89 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 673.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id coll-download-as-rdf2latex]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 677.25 :w 108 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 693 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-print]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 696.75 :w 105 :h 12]))))))
      ([BLOCK :tag DIV :x 19.2 :y 716.5 :w 139.2 :h 139 :id p-lang :class (portal)]
       ([BLOCK :tag SPAN :x 144.4 :y 723.5 :w 14 :h 16 :class (uls-settings-trigger)])
       ([BLOCK :tag H3 :x 19.2 :y 720.5 :w 125.2 :h 20 :id p-lang-label]
        ([LINE]
         ([TEXT :x 22.2 :y 724.5 :w 69 :h 12])))
       ([BLOCK :tag DIV :x 39.2 :y 740.5 :w 119.2 :h 111 :class (body)]
        ([BLOCK :tag UL :x 39.2 :y 740.5 :w 119.2 :h 97.5]
         ([MAGIC :tag LI :x 39.2 :y 740.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (interlanguage-link interwiki-de)]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 744.25 :w 52 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 760 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (interlanguage-link interwiki-es)]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 763.75 :w 50 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 779.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (interlanguage-link interwiki-fr)]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 783.25 :w 52 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 799 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (interlanguage-link interwiki-pl)]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 802.75 :w 36 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 818.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (interlanguage-link interwiki-sv)]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 822.25 :w 52 :h 12]))))
        ([BLOCK :tag DIV :x 39.2 :y 838 :w 119.2 :h 13.5 :class (after-portlet after-portlet-lang)]
         ([BLOCK :tag SPAN :x 85.4 :y 838 :w 73 :h 13.5 :class (wb-langlinks-edit wb-langlinks-link)]
          ([LINE]
           ([INLINE :tag A :class (wbc-editpage)]
            ([TEXT :x 96.4 :y 838.75 :w 56 :h 12])))))))))
    ([BLOCK :tag DIV :x 176 :y (/ 118515 30) :w 1552 :h 151.65 :id footer]
     ([BLOCK :tag UL :x 196 :y (/ 119115 30) :w 1512 :h 69.45 :id footer-info]
      ([MAGIC :tag LI :x 196 :y (/ 119115 30) :w 1512 :h 26.9 :mt 0 :mr 0 :mb 0 :ml 0 :id footer-info-lastmod]
       ([TEXT :x 196 :y (/ 47741 12) :w 334 :h 11]))
      ([MAGIC :tag LI :x 196 :y (/ 119921 30) :w 1512 :h (/ 1277 30) :mt 0 :mr 0 :mb 0 :ml 0 :id footer-info-copyright]
       ([TEXT :x 196 :y 4005.3 :w 153 :h 11])
       ([INLINE :tag A]
        ([TEXT :x 349 :y 4005.3 :w 282 :h 11]))
       ([TEXT :x 631 :y 4005.3 :w 374 :h 11])
       ([INLINE :tag A]
        ([TEXT :x 1005 :y 4005.3 :w 76 :h 11]))
       ([TEXT :x 1081 :y 4005.3 :w 29 :h 11])
       ([INLINE :tag A]
        ([TEXT :x 1110 :y 4005.3 :w 74 :h 11]))
       ([TEXT :x 1184 :y 4005.3 :w 263 :h 11])
       ([INLINE :tag A]
        ([TEXT :x 1447 :y 4005.3 :w 150 :h 11]))
       ([TEXT :x 1597 :y 4005.3 :w 74 :h 11])
       ([TEXT :x 196 :y 4089 :w 73 :h 11])))
     ([BLOCK :tag UL :x 196 :y (/ 60599 15) #|:w 637.4 :h 33.6|# :id footer-places]
      ([MAGIC :tag LI :x 196 :y (/ 60599 15) :w 76 :h 33.6 :mt 0 :mr 11.2 :mb 0 :ml 0 :id footer-places-privacy]
       ([INLINE :tag A]
        ([TEXT :x 196 :y (/ 121537 30) :w 76 :h 11])))
      ([MAGIC :tag LI :x 283.2 :y (/ 60599 15) :w 88 :h 33.6 :mt 0 :mr 11.2 :mb 0 :ml 0 :id footer-places-about]
       ([INLINE :tag A]
        ([TEXT :x 283.2 :y (/ 121537 30) :w 88 :h 11])))
      ([MAGIC :tag LI :x 382.4 :y (/ 60599 15) :w 67 :h 33.6 :mt 0 :mr 11.2 :mb 0 :ml 0 :id footer-places-disclaimer]
       ([INLINE :tag A]
        ([TEXT :x 382.4 :y (/ 121537 30) :w 67 :h 11])))
      ([MAGIC :tag LI :x 460.6 :y (/ 60599 15) :w 99 :h 33.6 :mt 0 :mr 11.2 :mb 0 :ml 0 :id footer-places-contact]
       ([INLINE :tag A]
        ([TEXT :x 460.6 :y (/ 121537 30) :w 99 :h 11])))
      ([MAGIC :tag LI :x 570.8 :y (/ 60599 15) :w 64 :h 33.6 :mt 0 :mr 11.2 :mb 0 :ml 0 :id footer-places-developers]
       ([INLINE :tag A]
        ([TEXT :x 570.8 :y (/ 121537 30) :w 64 :h 11])))
      ([MAGIC :tag LI :x 646 :y (/ 60599 15) :w 100 :h 33.6 :mt 0 :mr 11.2 :mb 0 :ml 0 :id footer-places-cookiestatement]
       ([INLINE :tag A]
        ([TEXT :x 646 :y (/ 121537 30) :w 100 :h 11])))
      ([MAGIC :tag LI :x 757.2 :y (/ 60599 15) :w 65 :h 33.6 :mt 0 :mr 11.2 :mb 0 :ml 0 :id footer-places-mobileview]
       ([INLINE :tag A :class (noprint stopMobileRedirectToggle)]
        ([TEXT :x 757.2 :y (/ 121537 30) :w 65 :h 11]))))
     ([BLOCK :tag UL :x 1520.8 :y (/ 60599 15) :w 187.2 :h 42.2 :id footer-icons :class (noprint)]
      ([MAGIC :tag LI :x 1526.4 :y (/ 60599 15) :w 88 :h 42.2 :mt 0 :mr 0 :mb 0 :ml 5.6 :id footer-copyrightico]
       ([INLINE :tag A]
        ([INLINE :tag IMG])))
      ([MAGIC :tag LI :x 1620 :y (/ 60599 15) :w 88 :h 42.2 :mt 0 :mr 0 :mb 0 :ml 5.6 :id footer-poweredbyico]
       ([INLINE :tag A]
        ([INLINE :tag IMG]))))
     ([MAGIC :tag DIV :x 196 :y (/ 61232 15) :w 1512 :h 0 :mt 0 :mr 0 :mb 0 :ml 0 :id e10106])))))

(define-problem doc-1
  "Cassius Marcellus Clay (politician) - Wikipedia, the free encyclopedia"
  #:url "file:///home/pavpan/cassius/bench/alexa/wikipedia.html"
  #:header header
  #:sheet doc-1
  #:documents doc-1
  #:features (position max-width unknown-selector float s em direction clear % white-space overflow-x overflow-y box-sizing min-width min-height ms max-height px auto % auto tables list-item inline-block unknown-display))


(define-document (doc-1 #:width 1728 #:browser firefox)
  ([BLOCK :tag HTML :x 0 :y 0 :w 1728 :h 8001 :class (client-js ve-not-available)]
   ([BLOCK :tag BODY :x 0 :y 0 :w 1728 :h 8001 :class (mediawiki ltr sitedir-ltr ns-0 ns-subject page-Cassius_Marcellus_Clay_politician skin-vector action-view)]
    ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 80 :id mw-page-base :class (noprint)])
    ([BLOCK :tag DIV :x 176 :y 0 :w 1552 :h 80 :id mw-head-base :class (noprint)])
    ([BLOCK :tag DIV :x 176 :y 79 :w 1552 :h (/ 116145 30) :id content :class (mw-body)]
     ([ANON]
      ([LINE]
       ([INLINE :tag A :id top])))
     ([BLOCK :tag DIV :x 201 :y 100 :w 1503 :h 0 :id siteNotice]
      ([BLOCK :tag DIV :x 201 :y 100 :w 1503 :h 0 :id centralNotice]))
     ([BLOCK :tag DIV :x 1704 :y 100 :w 0 :h 5.6 :class (mw-indicators)])
     ([BLOCK :tag H1 :x 201 :y 100 :w 1503 :h (/ 1153 30) :id firstHeading :class (firstHeading)]
      ([LINE]
       ([TEXT :x 201 :y (/ 3066 30) :w 448 :h 33])))
     ([BLOCK :tag DIV :x 201 :y (/ 4369 30) :w 1503 :h 3779.85 :id bodyContent :class (mw-body-content)]
      ([BLOCK :tag DIV :x 201 :y (/ 4369 30) :w 1503 :h (/ 309 15) :id siteSub]
       ([LINE]
        ([TEXT :x 201 :y (/ 4483 30) :w 240 :h 13])))
      ([BLOCK :tag DIV :x (/ 6383 30) :y 166.25 :w (/ 44737 30) :h 0 :id contentSub])
      ([BLOCK :tag DIV :x 201 :y 163.1 :w 1503 :h 0 :id jump-to-nav :class (mw-jump)]
       ([LINE]
        ([TEXT :x 201 :y 167.3 :w 61 :h 14])
        ([INLINE :tag A]
         ([TEXT :x 262 :y 167.3 :w 70 :h 14]))
        ([TEXT :x 332 :y 167.3 :w 8 :h 14])
        ([INLINE :tag A]
         ([TEXT :x 340 :y 167.3 :w 47 :h 14]))))
      ([BLOCK :tag DIV :x 201 :y 171.25 :w 1503 :h (/ 110159 30) :id mw-content-text :class (mw-content-ltr)]
       ([BLOCK :tag DL :x 201 :y 171.25 :w 1503 :h 23.4]
        ([BLOCK :tag DD :x 223.4 :y 171.25 :w 1480.6 :h 23.4]
         ([LINE]
          ([INLINE :tag I]
           ([TEXT :x 223.4 :y (/ 2231 12) :w 772 :h 16])
           ([INLINE :tag A]
            ([TEXT :x 995.4 :y (/ 2231 12) :w 101 :h 16]))
           ([TEXT :x 1096.4 :y (/ 2231 12) :w 192 :h 16])
           ([INLINE :tag A]
            ([TEXT :x 1288.4 :y (/ 2231 12) :w 176 :h 16]))))))
       ([MAGIC :tag TABLE :x (/ 42991 30) :y 205.625 :w (/ 8129 30) :h (/ 18977 12) :mt (/ 37 6) :mr 0 :mb (/ 37 6) :ml 12.3 :id e10032 :class (infobox vcard)]
        ([MAGIC :tag TBODY :x 1439.5 :y 225.75 :w (/ 7741 30) :h (/ 47055 30) :mt 0 :mr 0 :mb 0 :ml 0]
         ([MAGIC :tag TR :x 1439.5 :y 225.75 :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 225.75 :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10033]
           ([INLINE :tag SPAN :class (fn)]
            ([TEXT :x 1469 :y 226.5 :w 199 :h 19]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 7477 30) :w (/ 7741 30) :h 303 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x 1439.5 :y (/ 7477 30) :w (/ 7741 30) :h 303 :mt 0 :mr 0 :mb 0 :ml 0 :id e10034]
           ([INLINE :tag A :class (image)]
            ([INLINE :tag IMG]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 16657 30) :w (/ 7741 30) :h 2 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x 1439.5 :y (/ 16657 30) :w (/ 7741 30) :h 2 :mt 0 :mr 0 :mb 0 :ml 0 :id e10035]))
         ([MAGIC :tag TR :x 1439.5 :y (/ 16807 30) :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 16807 30) :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10036]
           ([INLINE :tag A]
            ([TEXT :x 1464 :y (/ 8452 15) :w 209 :h 14])
            ([TEXT :x 1545 :y 581.95 :w 47 :h 14]))))
         ([MAGIC :tag TR :x 1439.5 :y 602.2 :w (/ 7741 30) :h (/ 1199 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x 1439.5 :y 602.2 :w (/ 7741 30) :h (/ 1199 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10037]
           ([INLINE :tag SPAN :class (nowrap)]
            ([INLINE :tag B]
             ([TEXT :x 1540.5 :y (/ 18163 30) :w 56 :h 14])))
           ([INLINE :tag BR])
           ([TEXT :x (/ 44175 30) :y (/ 7511 12) :w 192 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y (/ 3871 6) :w (/ 7741 30) :h 112.9 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 3871 6) :w (/ 3209 30) :h 112.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10038]
           ([TEXT :x 1440.5 :y 648.4 :w 69 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 3871 6) :w (/ 2221 15) :h 112.9 :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 649.4 :w 103 :h 12]))
           ([TEXT :x (/ 23257 15) :y 667.9 :w 80 :h 12])
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y (/ 20591 30) :w 100 :h 12]))
           ([TEXT :x (/ 23257 15) :y 704.85 :w 80 :h 12])
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y (/ 2170 3) :w 102 :h 12]))
           ([TEXT :x (/ 23257 15) :y (/ 8902 12) :w 42 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y (/ 11416 15) :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 11416 15) :w (/ 3209 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10039]
           ([INLINE :tag SPAN :class (nowrap)]
            ([TEXT :x 1440.5 :y 764.3 :w 88 :h 14])))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 11416 15) :w (/ 2221 15) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 765.3 :w 98 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y 784.55 :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 784.55 :w (/ 3209 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10040]
           ([INLINE :tag SPAN :class (nowrap)]
            ([TEXT :x 1440.5 :y (/ 23633 30) :w 98 :h 14])))
          ([MAGIC :tag TD :x (/ 23242 15) :y 784.55 :w (/ 2221 15) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A :class (mw-redirect)]
            ([TEXT :x (/ 23257 15) :y (/ 23663 30) :w 104 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 24241 30) :w (/ 7741 30) :h (/ 1199 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x 1439.5 :y (/ 24241 30) :w (/ 7741 30) :h (/ 1199 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10041]
           ([INLINE :tag SPAN :class (nowrap)]
            ([INLINE :tag B]
             ([TEXT :x 1540.5 :y (/ 12169 15) :w 56 :h 14])))
           ([INLINE :tag BR])
           ([TEXT :x 1478 :y 831.75 :w 181 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y 851 :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 851 :w (/ 3209 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10042]
           ([TEXT :x 1440.5 :y (/ 25627 30) :w 69 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y 851 :w (/ 2221 15) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y (/ 25657 30) :w 103 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 26235 30) :w (/ 7741 30) :h (/ 614 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 26235 30) :w (/ 3209 30) :h (/ 614 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10043]
           ([INLINE :tag SPAN :class (nowrap)]
            ([TEXT :x 1440.5 :y 822.875 :w 88 :h 14])))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 26235 30) :w (/ 2221 15) :h (/ 614 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 823.75 :w 87 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 26939 30) :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 26939 30) :w (/ 3209 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10044]
           ([INLINE :tag SPAN :class (nowrap)]
            ([TEXT :x 1440.5 :y 901.2 :w 98 :h 14])))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 26939 30) :w (/ 2221 15) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 902.2 :w 98 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y 921.45 :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 921.45 :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10045]
           ([TEXT :x 1449 :y 924.7 :w 107 :h 14])
           ([INLINE :tag A]
            ([TEXT :x 1556 :y 924.7 :w 132 :h 14])
            ([TEXT :x 1510 :y (/ 5659 6) :w 117 :h 14]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 11561 12) :w (/ 7741 30) :h (/ 1199 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x 1439.5 :y (/ 11561 12) :w (/ 7741 30) :h (/ 1199 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10046]
           ([INLINE :tag SPAN :class (nowrap)]
            ([INLINE :tag B]
             ([TEXT :x 1540.5 :y 966.65 :w 56 :h 14])))
           ([INLINE :tag BR])
           ([TEXT :x (/ 46005 30) :y (/ 14807 15) :w 70 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y (/ 15096 15) :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 15096 15) :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10047]
           ([TEXT :x (/ 45315 30) :y (/ 15144 15) :w 116 :h 14])))
         ([MAGIC :tag TR :x 1439.5 :y (/ 15448 15) :w (/ 7741 30) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 15448 15) :w (/ 3209 30) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y 1033.1 :w 33 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 15448 15) :w (/ 2221 15) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y 1034.1 :w 129 :h 12])
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y (/ 12631 12) :w 99 :h 12]))
           ([TEXT :x (/ 24742 15) :y (/ 12631 12) :w 4 :h 12])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y (/ 16066 15) :w 55 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y 1090.3 :w (/ 7741 30) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 1090.3 :w (/ 3209 30) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y 1093.55 :w 32 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y 1090.3 :w (/ 2221 15) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y 1094.55 :w 80 :h 12])
           ([TEXT :x (/ 24457 15) :y 1094.55 :w 66 :h 12])
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y (/ 33391 30) :w 103 :h 12])
           ([TEXT :x (/ 23257 15) :y (/ 33945 30) :w 55 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y (/ 34523 30) :w (/ 7741 30) :h (/ 1139 15) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 34523 30) :w (/ 3209 30) :h (/ 1139 15) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y 1154 :w 71 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 34523 30) :w (/ 2221 15) :h (/ 1139 15) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y 1155 :w 113 :h 12])
           ([TEXT :x (/ 23257 15) :y (/ 35205 30) :w 139 :h 12])
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y (/ 35759 30) :w 104 :h 12])
           ([TEXT :x (/ 23257 15) :y 1210.45 :w 139 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y 1229.7 :w (/ 7741 30) :h 168.35 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 1229.7 :w (/ 3209 30) :h 168.35 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y (/ 18494 15) :w 59 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y 1229.7 :w (/ 2221 15) :h 168.35 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y (/ 18509 15) :w 119 :h 12])
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y (/ 15029 12) :w 67 :h 12])
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 1270.9 :w 88 :h 12]))
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y (/ 19341 15) :w 57 :h 12])
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y (/ 19618 15) :w 64 :h 12]))
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 1326.35 :w 91 :h 12]))
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y (/ 8069 6) :w 61 :h 12])
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y 1363.3 :w 113 :h 12])
           ([TEXT :x (/ 23257 15) :y 1381.8 :w 63 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y 1401.05 :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 1401.05 :w (/ 3209 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A]
            ([TEXT :x 1440.5 :y 1316.5 :w 80 :h 14])))
          ([MAGIC :tag TD :x (/ 23242 15) :y 1401.05 :w (/ 2221 15) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 1317.5 :w 139 :h 12]))
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y (/ 42713 30) :w 74 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y 1443 :w (/ 7741 30) :h (/ 1133 12) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 1443 :w (/ 3209 30) :h (/ 1133 12) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y 1446.25 :w 80 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y 1443 :w (/ 2221 15) :h (/ 1133 12) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y 1447.25 :w 42 :h 12])
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y (/ 21986 15) :w 56 :h 12])
           ([INLINE :tag BR])
           ([INLINE :tag A :class (mw-redirect)]
            ([TEXT :x (/ 23257 15) :y (/ 44527 30) :w 132 :h 12]))
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y 1502.7 :w 43 :h 12])
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y (/ 18254 12) :w 43 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y (/ 46213 30) :w (/ 7741 30) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 46213 30) :w (/ 3209 30) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y (/ 4631 3) :w 72 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 46213 30) :w (/ 2221 15) :h 57.45 :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y (/ 4634 3) :w 131 :h 12])
           ([TEXT :x (/ 23257 15) :y 1563.15 :w 86 :h 12])
           ([TEXT :x (/ 23257 15) :y (/ 47449 30) :w 139 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y 1600.9 :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 1600.9 :w (/ 3209 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y 1604.1 :w 57 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y 1600.9 :w (/ 2221 15) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A :class (mw-redirect)]
            ([TEXT :x (/ 23257 15) :y 1605.1 :w 111 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 48731 30) :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 48731 30) :w (/ 7741 30) :h (/ 615 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10050]
           ([TEXT :x 1515 :y 1627.6 :w 107 :h 14])))
         ([MAGIC :tag TR :x 1439.5 :y 1647.85 :w (/ 7741 30) :h (/ 614 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 1647.85 :w (/ 3209 30) :h (/ 614 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y (/ 19813 12) :w 104 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y 1647.85 :w (/ 2221 15) :h (/ 614 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y (/ 19825 12) :w 127 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y (/ 5014 3) :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 5014 3) :w (/ 3209 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y (/ 50237 30) :w 57 :h 14])
           ([TEXT :x 1440.5 :y 1693.05 :w 50 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 5014 3) :w (/ 2221 15) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x (/ 23257 15) :y (/ 50267 30) :w 78 :h 12])
           ([INLINE :tag BR])
           ([TEXT :x (/ 23257 15) :y 1694.05 :w 78 :h 12])))
         ([MAGIC :tag TR :x 1439.5 :y 1713.3 :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y 1713.3 :w (/ 3209 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y (/ 25748 15) :w 35 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y 1713.3 :w (/ 2221 15) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A :class (image)]
            ([INLINE :tag IMG :class (thumbborder)]))
           ([TEXT :x (/ 23512 15) :y (/ 25763 15) :w 4 :h 12])
           ([INLINE :tag A]
            ([TEXT :x (/ 23572 15) :y (/ 25763 15) :w 48 :h 12]))
           ([INLINE :tag BR])
           ([INLINE :tag A :class (image)]
            ([INLINE :tag IMG]))
           ([TEXT :x (/ 23782 15) :y 1736 :w 4 :h 12])
           ([INLINE :tag A]
            ([TEXT :x (/ 23842 15) :y 1736 :w 87 :h 12]))))
         ([MAGIC :tag TR :x 1439.5 :y (/ 26329 15) :w (/ 7741 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 1439.5 :y (/ 26329 15) :w (/ 3209 30) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([TEXT :x 1440.5 :y 1758.5 :w 90 :h 14]))
          ([MAGIC :tag TD :x (/ 23242 15) :y (/ 26329 15) :w (/ 2221 15) :h (/ 1169 30) :mt 0 :mr 0 :mb 0 :ml 0]
           ([INLINE :tag A :class (mw-redirect)]
            ([TEXT :x (/ 23257 15) :y 1759.5 :w 139 :h 12]))
           ([INLINE :tag BR])
           ([INLINE :tag A]
            ([TEXT :x (/ 23257 15) :y 1808 :w 112 :h 12]))))))
       ([BLOCK :tag P :x 201 :y 213.1 :w 1503 :h 23.4]
        ([LINE]
         ([INLINE :tag B]
          ([TEXT :x 201 :y 216.3 :w 179 :h 16]))
         ([TEXT :x 380 :y 218.3 :w 327 :h 14])
         ([INLINE :tag B]
          ([TEXT :x 707 :y 216.3 :w 172 :h 16]))
         ([TEXT :x 879 :y 218.3 :w 374 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1253 :y 218.3 :w 124 :h 14]))
         ([TEXT :x 1377 :y 218.3 :w 4 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 7305 30) :w 1503 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y 232.25 :w 218 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 419 :y 232.25 :w 113 :h 14]))
         ([TEXT :x 532 :y 232.25 :w 852 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 3275 12) :w 1503 :h 0])
       ([MAGIC :tag DIV :x 201 :y (/ 3275 12) :w 244.65 :h 315.3 :mt 0 :mr 0 :mb 0 :ml 0 :id toc :class (toc)]
        ([BLOCK :tag DIV :x 209 :y (/ 3371 12) :w 228.65 :h 20 :id toctitle]
         ([LINE]
          ([INLINE :tag H2]
           ([TEXT :x (/ 3190 12) :y 283.05 :w 66 :h 15]))
          ([TEXT :x (/ 3982 12) :y 285.05 :w 4 :h 13])
          ([INLINE :tag SPAN :class (toctoggle)]
           ([TEXT :x (/ 4030 12) :y 285.05 :w 9 :h 13])
           ([INLINE :tag A :id togglelink]
            ([TEXT :x (/ 4138 12) :y 285.05 :w 27 :h 13]))
           ([TEXT :x (/ 4462 12) :y 285.05 :w 9 :h 13]))))
        ([BLOCK :tag UL :x 209 :y (/ 3674 12) :w 228.65 :h (/ 4051 15)]
         ([MAGIC :tag LI :x 209 :y (/ 3674 12) :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-1)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y (/ 3674 12) :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y 310.3 :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y (/ 3674 12) :w 214 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y 310.3 :w 214 :h 13]))))
         ([MAGIC :tag LI :x 209 :y 328.8 :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-2)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y 328.8 :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y (/ 4994 15) :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y 328.8 :w 126 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y (/ 4994 15) :w 126 :h 13]))))
         ([MAGIC :tag LI :x 209 :y (/ 4217 12) :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-3)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y (/ 4217 12) :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y 355.55 :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y (/ 4217 12) :w 93 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y 355.55 :w 93 :h 13]))))
         ([MAGIC :tag LI :x 209 :y (/ 11221 30) :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-4)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y (/ 11221 30) :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y (/ 2269 6) :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y (/ 11221 30) :w 195 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y (/ 2269 6) :w 195 :h 13]))))
         ([MAGIC :tag LI :x 209 :y 396.65 :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-5)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y 396.65 :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y (/ 12023 30) :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y 396.65 :w 145 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y (/ 12023 30) :w 145 :h 13]))))
         ([MAGIC :tag LI :x 209 :y (/ 6289 15) :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-6)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y (/ 6289 15) :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y 423.4 :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y (/ 6289 15) :w 72 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y 423.4 :w 72 :h 13]))))
         ([MAGIC :tag LI :x 209 :y 441.9 :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-7)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y 441.9 :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y 446 :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y 441.9 :w 45 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y 446 :w 45 :h 13]))))
         ([MAGIC :tag LI :x 209 :y 464.5 :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-8)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y 464.5 :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y (/ 14059 30) :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y 464.5 :w 49 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y (/ 14059 30) :w 49 :h 13]))))
         ([MAGIC :tag LI :x 209 :y 487.1 :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-9)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y 487.1 :w 14.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y 491.25 :w 8 :h 13]))
           ([MAGIC :tag SPAN :x 223.65 :y 487.1 :w 55 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 223.65 :y 491.25 :w 55 :h 13]))))
         ([MAGIC :tag LI :x 209 :y (/ 7646 15) :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-10)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y (/ 7646 15) :w 22.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y (/ 7708 15) :w 16 :h 13]))
           ([MAGIC :tag SPAN :x 231.65 :y (/ 7646 15) :w 70 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 231.65 :y (/ 7708 15) :w 70 :h 13]))))
         ([MAGIC :tag LI :x 209 :y 532.35 :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-11)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y 532.35 :w 22.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y (/ 16095 30) :w 16 :h 13]))
           ([MAGIC :tag SPAN :x 231.65 :y 532.35 :w 97 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 231.65 :y (/ 16095 30) :w 97 :h 13]))))
         ([MAGIC :tag LI :x 209 :y (/ 16649 30) :w 228.65 :h 20 :mt 0 :mr 0 :mb (/ 4 3) :ml 0 :class (toclevel-1 tocsection-12)]
          ([INLINE :tag A]
           ([MAGIC :tag SPAN :x 209 :y (/ 16649 30) :w 22.65 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (tocnumber)]
            ([TEXT :x 209 :y 559.1 :w 16 :h 13]))
           ([MAGIC :tag SPAN :x 231.65 :y (/ 16649 30) :w 84 :h 20 :mt 0 :mr 0 :mb 0 :ml 0 :class (toctext)]
            ([TEXT :x 231.65 :y 559.1 :w 84 :h 13]))))))
       ([BLOCK :tag P :x 201 :y (/ 17857 30) :w 1503 :h 0])
       ([BLOCK :tag H2 :x 201 :y (/ 18277 30) :w 1143.5 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Early_life.2C_education_and_marriage :class (mw-headline)]
           ([TEXT :x 201 :y 610.9 :w 317 :h 24]))))
        ([MAGIC :tag SPAN :x 531 :y 619.9 :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10001 :class (mw-editsection-bracket)]
          ([TEXT :x 531 :y 619.9 :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 539.25 :y 619.9 :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10013 :class (mw-editsection-bracket)]
          ([TEXT :x 566.5 :y 619.9 :w 5 :h 13]))))
       ([BLOCK :tag P :x 201 :y (/ 9668 15) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 9731 15) :w 244 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 445 :y (/ 9731 15) :w 75 :h 14]))
         ([TEXT :x 520 :y (/ 9731 15) :w 157 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 677 :y (/ 9731 15) :w 56 :h 14]))
         ([TEXT :x 733 :y (/ 9731 15) :w 34 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 767 :y (/ 9731 15) :w 170 :h 14]))
         ([TEXT :x 937 :y (/ 9731 15) :w 471 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 10067 15) :w 418 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 2089 3) :w 1503 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 10508 15) :w 523 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 724 :y (/ 10508 15) :w 89 :h 14]))
         ([TEXT :x 813 :y (/ 10508 15) :w 601 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 10844 15) :w 64 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 265 :y (/ 10844 15) :w 72 :h 14]))
         ([TEXT :x 337 :y (/ 10844 15) :w 162 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 499 :y (/ 10844 15) :w 138 :h 14]))
         ([TEXT :x 637 :y (/ 10844 15) :w 399 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1036 :y (/ 10844 15) :w 122 :h 14]))
         ([TEXT :x 1158 :y (/ 10844 15) :w 233 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 2236 3) :w 64 :h 14])
         ([INLINE :tag SUP :id cite_ref-eliza_1-0 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 265 :y (/ 22307 30) :w 4 :h 11]))
           ([TEXT :x 269 :y (/ 22307 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 276 :y (/ 22307 30) :w 4 :h 11]))))
         ([TEXT :x 280 :y (/ 2236 3) :w 77 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 357 :y (/ 2236 3) :w 118 :h 14]))
         ([TEXT :x 475 :y (/ 2236 3) :w 389 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 11558 15) :w 1503 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 11621 15) :w 191 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 392 :y (/ 11621 15) :w 152 :h 14]))
         ([TEXT :x 544 :y (/ 11621 15) :w 180 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 724 :y (/ 11621 15) :w 83 :h 14]))
         ([TEXT :x 807 :y (/ 11621 15) :w 301 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1108 :y (/ 11621 15) :w 147 :h 14]))
         ([TEXT :x 1255 :y (/ 11621 15) :w 156 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 11957 15) :w 787 :h 14])
         ([INLINE :tag SUP :id cite_ref-2 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 988 :y (/ 23861 30) :w 4 :h 11]))
           ([TEXT :x 992 :y (/ 23861 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 999 :y (/ 23861 30) :w 4 :h 11]))))
         ([TEXT :x 1003 :y (/ 11957 15) :w 374 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 12293 15) :w 592 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-0 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 793 :y (/ 24533 30) :w 4 :h 11]))
           ([TEXT :x 797 :y (/ 24533 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 804 :y (/ 24533 30) :w 4 :h 11]))))))
       ([BLOCK :tag H2 :x 201 :y (/ 12881 15) :w 1143.5 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Marriage_and_family :class (mw-headline)]
           ([TEXT :x 201 :y (/ 12906 15) :w 190 :h 24]))))
        ([MAGIC :tag SPAN :x 404 :y (/ 13041 15) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10002 :class (mw-editsection-bracket)]
          ([TEXT :x 404 :y (/ 13041 15) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 412.25 :y (/ 13041 15) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10014 :class (mw-editsection-bracket)]
          ([TEXT :x 439.5 :y (/ 13041 15) :w 5 :h 13]))))
       ([BLOCK :tag P :x 201 :y (/ 26821 30) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 26947 30) :w 387 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 588 :y (/ 26947 30) :w 99 :h 14]))
         ([TEXT :x 687 :y (/ 26947 30) :w 556 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1243 :y (/ 26947 30) :w 64 :h 14]))
         ([TEXT :x 1307 :y (/ 26947 30) :w 46 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1353 :y (/ 26947 30) :w 37 :h 14]))
         ([TEXT :x 1390 :y (/ 26947 30) :w 4 :h 14]))
        ([LINE]
         ([INLINE :tag A]
          ([TEXT :x 201 :y (/ 27619 30) :w 71 :h 14]))
         ([TEXT :x 272 :y (/ 27619 30) :w 786 :h 14])))
       ([BLOCK :tag H2 :x 201 :y (/ 5759 6) :w 1143.5 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Political_career :class (mw-headline)]
           ([TEXT :x 201 :y (/ 28845 30) :w 140 :h 24]))))
        ([MAGIC :tag SPAN :x 354 :y (/ 29115 30) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10003 :class (mw-editsection-bracket)]
          ([TEXT :x 354 :y (/ 29115 30) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 362.25 :y (/ 29115 30) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10015 :class (mw-editsection-bracket)]
          ([TEXT :x 389.5 :y (/ 29115 30) :w 5 :h 13]))))
       ([BLOCK :tag P :x 201 :y (/ 14927 15) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 2998 3) :w 267 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 468 :y (/ 2998 3) :w 115 :h 14]))
         ([TEXT :x 583 :y (/ 2998 3) :w 742 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 15326 15) :w 317 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 518 :y (/ 15326 15) :w 111 :h 14]))
         ([TEXT :x 629 :y (/ 15326 15) :w 4 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-1 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 633 :y (/ 30599 30) :w 4 :h 11]))
           ([TEXT :x 637 :y (/ 30599 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 644 :y (/ 30599 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 15704 15) :w 1503 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 15767 15) :w 265 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 466 :y (/ 15767 15) :w 245 :h 14]))
         ([TEXT :x 711 :y (/ 15767 15) :w 4 :h 14])
         ([INLINE :tag SUP :id cite_ref-4 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 715 :y (/ 31481 30) :w 4 :h 11]))
           ([TEXT :x 719 :y (/ 31481 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 726 :y (/ 31481 30) :w 4 :h 11]))))
         ([TEXT :x 730 :y (/ 15767 15) :w 686 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 16103 15) :w 1187 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 16439 15) :w 388 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 589 :y (/ 16439 15) :w 79 :h 14]))
         ([TEXT :x 668 :y (/ 16439 15) :w 257 :h 14])
         ([INLINE :tag SUP :id cite_ref-BorgenichtRegan2010_5-0 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 925 :y (/ 6565 6) :w 4 :h 11]))
           ([TEXT :x 929 :y (/ 6565 6) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 936 :y (/ 6565 6) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 16817 15) :w 1503 :h 90.6]
        ([LINE]
         ([TEXT :x 201 :y (/ 3379 3) :w 402 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 603 :y (/ 3373 3) :w 100 :h 16]))
         ([TEXT :x 703 :y (/ 3379 3) :w 24 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 727 :y (/ 3379 3) :w 136 :h 14]))
         ([TEXT :x 863 :y (/ 3379 3) :w 524 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 17231 15) :w 1195 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 17567 15) :w 682 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 883 :y (/ 17567 15) :w 107 :h 14]))
         ([TEXT :x 990 :y (/ 17567 15) :w 404 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 17903 15) :w 128 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-2 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 329 :y (/ 35753 30) :w 4 :h 11]))
           ([TEXT :x 333 :y (/ 35753 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 340 :y (/ 35753 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 18281 15) :w 1503 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 18344 15) :w 126 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 327 :y (/ 18344 15) :w 154 :h 14]))
         ([TEXT :x 481 :y (/ 18344 15) :w 36 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 517 :y (/ 18344 15) :w 50 :h 14]))
         ([TEXT :x 567 :y (/ 18344 15) :w 461 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 1028 :y (/ 18344 15) :w 136 :h 14]))
         ([TEXT :x 1164 :y (/ 18344 15) :w 230 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 3736 3) :w 1213 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 19016 15) :w 379 :h 14])
         ([INLINE :tag SUP :id cite_ref-BorgenichtRegan2010_5-1 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 580 :y (/ 37979 30) :w 4 :h 11]))
           ([TEXT :x 584 :y (/ 37979 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 591 :y (/ 37979 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 19394 15) :w 1503 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 19457 15) :w 387 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 588 :y (/ 19457 15) :w 78 :h 14]))
         ([TEXT :x 666 :y (/ 19457 15) :w 288 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 954 :y (/ 19457 15) :w 41 :h 14]))
         ([TEXT :x 995 :y (/ 19457 15) :w 155 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1150 :y (/ 19457 15) :w 97 :h 14]))
         ([TEXT :x 1247 :y (/ 19457 15) :w 126 :h 14])
         ([INLINE :tag SUP :id cite_ref-6 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1373 :y (/ 38861 30) :w 4 :h 11]))
           ([TEXT :x 1377 :y (/ 38861 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1384 :y (/ 38861 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 3967 3) :w 1503 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 19898 15) :w 686 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 887 :y (/ 19898 15) :w 113 :h 14]))
         ([TEXT :x 1000 :y (/ 19898 15) :w 249 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1249 :y (/ 19898 15) :w 113 :h 14]))
         ([TEXT :x 1362 :y (/ 19898 15) :w 4 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 20234 15) :w 157 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 358 :y (/ 20234 15) :w 76 :h 14]))
         ([TEXT :x 434 :y (/ 20234 15) :w 306 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 740 :y (/ 20234 15) :w 107 :h 14]))
         ([TEXT :x 847 :y (/ 20234 15) :w 48 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 895 :y (/ 20234 15) :w 258 :h 14]))
         ([TEXT :x 1153 :y (/ 20234 15) :w 4 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-3 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1157 :y (/ 8083 6) :w 4 :h 11]))
           ([TEXT :x 1161 :y (/ 8083 6) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1168 :y (/ 8083 6) :w 4 :h 11]))))
         ([TEXT :x 1172 :y (/ 20234 15) :w 186 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1358 :y (/ 20234 15) :w 59 :h 14])))
        ([LINE]
         ([INLINE :tag A]
          ([TEXT :x 201 :y (/ 4114 3) :w 46 :h 14]))
         ([TEXT :x 247 :y (/ 4114 3) :w 4 :h 14])))
       ([BLOCK :tag H2 :x 201 :y (/ 21158 15) :w 1143.5 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Civil_War_and_Minister_to_Russia :class (mw-headline)]
           ([TEXT :x 201 :y (/ 16946 12) :w 299 :h 24]))))
        ([MAGIC :tag SPAN :x 513 :y (/ 17054 12) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10004 :class (mw-editsection-bracket)]
          ([TEXT :x 513 :y (/ 17054 12) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 521.25 :y (/ 17054 12) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10016 :class (mw-editsection-bracket)]
          ([TEXT :x 548.5 :y (/ 17054 12) :w 5 :h 13]))))
       ([BLOCK :tag P :x 201 :y (/ 8675 6) :w 1503 :h 89.6]
        ([LINE]
         ([TEXT :x 201 :y (/ 43501 30) :w 325 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 526 :y (/ 43501 30) :w 54 :h 14]))
         ([TEXT :x 580 :y (/ 43501 30) :w 164 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 744 :y (/ 43501 30) :w 99 :h 14]))
         ([TEXT :x 843 :y (/ 43501 30) :w 173 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1016 :y (/ 43501 30) :w 55 :h 14]))
         ([TEXT :x 1071 :y (/ 43501 30) :w 346 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 44173 30) :w 1218 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 8969 6) :w 1205 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 45517 30) :w 145 :h 14])
         ([INLINE :tag SUP :id cite_ref-7 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 346 :y (/ 22732 15) :w 4 :h 11]))
           ([TEXT :x 350 :y (/ 22732 15) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 357 :y (/ 22732 15) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 46273 30) :w 1503 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 46399 30) :w 284 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 485 :y (/ 46399 30) :w 174 :h 14]))
         ([TEXT :x 659 :y (/ 46399 30) :w 555 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1214 :y (/ 46399 30) :w 94 :h 14]))
         ([TEXT :x 1308 :y (/ 46399 30) :w 103 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 47071 30) :w 1163 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 47743 30) :w 1163 :h 14])
         ([INLINE :tag SUP :id cite_ref-8 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1364 :y (/ 4769 3) :w 4 :h 11]))
           ([TEXT :x 1368 :y (/ 4769 3) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1375 :y (/ 4769 3) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 48499 30) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 9725 6) :w 672 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-4 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 873 :y (/ 24286 15) :w 4 :h 11]))
           ([TEXT :x 877 :y (/ 24286 15) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 884 :y (/ 24286 15) :w 4 :h 11]))))
         ([TEXT :x 888 :y (/ 9725 6) :w 311 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 1199 :y (/ 9725 6) :w 65 :h 14]))
         ([TEXT :x 1264 :y (/ 9725 6) :w 21 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1285 :y (/ 9725 6) :w 44 :h 14]))
         ([TEXT :x 1329 :y (/ 9725 6) :w 4 :h 14]))
        ([LINE]
         ([INLINE :tag SUP :id e10051 :class (noprint Inline-Template Template-Fact)]
          ([TEXT :x 201 :y (/ 24622 15) :w 4 :h 11])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([INLINE :tag SPAN]
             ([TEXT :x 205 :y (/ 24592 15) :w 87 :h 13]))))
          ([TEXT :x 292 :y (/ 24622 15) :w 4 :h 11]))))
       ([BLOCK :tag H2 :x 201 :y (/ 50473 30) :w 1143.5 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Later_political_activities :class (mw-headline)]
           ([TEXT :x 201 :y (/ 20209 12) :w 217 :h 24]))))
        ([MAGIC :tag SPAN :x 431 :y (/ 20317 12) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10005 :class (mw-editsection-bracket)]
          ([TEXT :x 431 :y (/ 20317 12) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 439.25 :y (/ 20317 12) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10017 :class (mw-editsection-bracket)]
          ([TEXT :x 466.5 :y (/ 20317 12) :w 5 :h 13]))))
       ([BLOCK :tag P :x 201 :y (/ 25766 15) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 25829 15) :w 443 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 644 :y (/ 25829 15) :w 45 :h 14]))
         ([TEXT :x 689 :y (/ 25829 15) :w 204 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 893 :y (/ 25829 15) :w 66 :h 14]))
         ([TEXT :x 959 :y (/ 25829 15) :w 423 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 5233 3) :w 341 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 26543 15) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 26606 15) :w 536 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 737 :y (/ 26606 15) :w 119 :h 14]))
         ([TEXT :x 856 :y (/ 26606 15) :w 159 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1015 :y (/ 26606 15) :w 29 :h 14]))
         ([TEXT :x 1044 :y (/ 26606 15) :w 4 :h 14])
         ([INLINE :tag SUP :id cite_ref-9 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1048 :y (/ 53159 30) :w 4 :h 11]))
           ([TEXT :x 1052 :y (/ 53159 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1059 :y (/ 53159 30) :w 4 :h 11]))))
         ([INLINE :tag SUP :id e10053 :class (noprint Inline-Template)]
          ([TEXT :x 1063 :y (/ 53159 30) :w 4 :h 11])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([INLINE :tag SPAN]
             ([TEXT :x 1067 :y (/ 53099 30) :w 74 :h 13]))))
          ([TEXT :x 1141 :y (/ 53159 30) :w 4 :h 11]))
         ([TEXT :x 1145 :y (/ 26606 15) :w 268 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 26942 15) :w 408 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-5 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 609 :y (/ 53831 30) :w 4 :h 11]))
           ([TEXT :x 613 :y (/ 53831 30) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 620 :y (/ 53831 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 5464 3) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 27383 15) :w 319 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 520 :y (/ 27383 15) :w 124 :h 14]))
         ([TEXT :x 644 :y (/ 27383 15) :w 399 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1043 :y (/ 27383 15) :w 106 :h 14]))
         ([TEXT :x 1149 :y (/ 27383 15) :w 329 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1478 :y (/ 27383 15) :w 36 :h 14]))
         ([TEXT :x 1514 :y (/ 27383 15) :w 34 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1548 :y (/ 27383 15) :w 36 :h 14]))
         ([TEXT :x 1584 :y (/ 27383 15) :w 112 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 27719 15) :w 27 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 228 :y (/ 27719 15) :w 116 :h 14]))
         ([TEXT :x 344 :y (/ 27719 15) :w 359 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 703 :y (/ 27719 15) :w 124 :h 14]))
         ([TEXT :x 827 :y (/ 27719 15) :w 4 :h 14])
         ([INLINE :tag SUP :id cite_ref-FOOTNOTEChisholm1911_3-6 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 831 :y (/ 11077 6) :w 4 :h 11]))
           ([TEXT :x 835 :y (/ 11077 6) :w 7 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 842 :y (/ 11077 6) :w 4 :h 11]))))))
       ([BLOCK :tag H2 :x 201 :y (/ 28307 15) :w 1503 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Later_years :class (mw-headline)]
           ([TEXT :x 201 :y (/ 56663 30) :w 104 :h 24]))))
        ([MAGIC :tag SPAN :x 318 :y (/ 56933 30) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10006 :class (mw-editsection-bracket)]
          ([TEXT :x 318 :y (/ 56933 30) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 326.25 :y (/ 56933 30) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10018 :class (mw-editsection-bracket)]
          ([TEXT :x 353.5 :y (/ 56933 30) :w 5 :h 13]))))
       ([BLOCK :tag P :x 201 :y (/ 57673 30) :w 1503 :h 44.8]
        ([LINE]
         ([TEXT :x 201 :y (/ 57799 30) :w 311 :h 14])
         ([INLINE :tag SUP :id cite_ref-Clay_1984_10-0 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 512 :y (/ 28873 15) :w 4 :h 11]))
           ([TEXT :x 516 :y (/ 28873 15) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 530 :y (/ 28873 15) :w 4 :h 11]))))
         ([TEXT :x 534 :y (/ 57799 30) :w 1084 :h 14])
         ([INLINE :tag SUP :id cite_ref-Clay_1984_10-1 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1618 :y (/ 28873 15) :w 4 :h 11]))
           ([TEXT :x 1622 :y (/ 28873 15) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1636 :y (/ 28873 15) :w 4 :h 11]))))
         ([TEXT :x 1640 :y (/ 57799 30) :w 43 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 58471 30) :w 382 :h 14])
         ([INLINE :tag SUP :id e10055 :class (noprint Inline-Template Template-Fact)]
          ([TEXT :x 583 :y (/ 29209 15) :w 4 :h 11])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([INLINE :tag SPAN]
             ([TEXT :x 587 :y (/ 29179 15) :w 87 :h 13]))))
          ([TEXT :x 674 :y (/ 29209 15) :w 4 :h 11]))))
       ([BLOCK :tag P :x 201 :y (/ 59227 30) :w 1503 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 59353 30) :w 1112 :h 14])
         ([INLINE :tag SUP :id cite_ref-11 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1313 :y (/ 5930 3) :w 4 :h 11]))
           ([TEXT :x 1317 :y (/ 5930 3) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1331 :y (/ 5930 3) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 60109 30) :w 1503 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 12047 6) :w 689 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 890 :y (/ 12047 6) :w 100 :h 14]))
         ([TEXT :x 990 :y (/ 12047 6) :w 61 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 60991 30) :w 1503 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 61117 30) :w 722 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 923 :y (/ 61117 30) :w 69 :h 14]))
         ([TEXT :x 992 :y (/ 61117 30) :w 34 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1026 :y (/ 61117 30) :w 96 :h 14]))
         ([TEXT :x 1122 :y (/ 61117 30) :w 115 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1237 :y (/ 61117 30) :w 105 :h 14]))
         ([TEXT :x 1342 :y (/ 61117 30) :w 63 :h 14])
         ([INLINE :tag SUP :id cite_ref-12 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1405 :y (/ 30532 15) :w 4 :h 11]))
           ([TEXT :x 1409 :y (/ 30532 15) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1423 :y (/ 30532 15) :w 4 :h 11]))))))
       ([BLOCK :tag H2 :x 201 :y (/ 62293 30) :w 1503 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Legacy :class (mw-headline)]
           ([TEXT :x 201 :y (/ 24937 12) :w 65 :h 24]))))
        ([MAGIC :tag SPAN :x 279 :y (/ 25045 12) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10007 :class (mw-editsection-bracket)]
          ([TEXT :x 279 :y (/ 25045 12) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 287.25 :y (/ 25045 12) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10019 :class (mw-editsection-bracket)]
          ([TEXT :x 314.5 :y (/ 25045 12) :w 5 :h 13]))))
       ([MAGIC :tag DIV :x 1444 :y 2153 :w 260 :h (/ 592 3) :mt 7 :mr 0 :mb 18.2 :ml 19.6 :class (thumb tright)]
        ([BLOCK :tag DIV :x 1444 :y 2153 :w 260 :h (/ 592 3) :id e10057 :class (thumbinner)]
         ([ANON]
          ([LINE]
           ([INLINE :tag A :class (image)]
            ([INLINE :tag IMG :class (thumbimage)]))))
         ([BLOCK :tag DIV :x 1448 :y 2326 :w 252 :h (/ 70 3) :class (thumbcaption)]
          ([BLOCK :tag DIV :x 1682 :y 2329 :w 15 :h 11 :class (magnify)]
           ([BLOCK :tag A :x 1682 :y 2329 :w 15 :h 11 :class (internal)]))
          ([ANON]
           ([LINE]
            ([INLINE :tag A :class (mw-redirect)]
             ([TEXT :x 1451 :y 2292.65 :w 62 :h 12])))))))
       ([BLOCK :tag P :x 201 :y (/ 31676 15) :w 1503 :h 23.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 31754 15) :w 115 :h 14])
         ([INLINE :tag A :class (mw-redirect)]
          ([TEXT :x 316 :y (/ 31754 15) :w 67 :h 14]))
         ([TEXT :x 383 :y (/ 31754 15) :w 366 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 749 :y (/ 31724 15) :w 212 :h 16]))
         ([TEXT :x 961 :y (/ 31754 15) :w 4 :h 14])))
       ([BLOCK :tag P :x 201 :y (/ 32132 15) :w 1503 :h 89.6]
        ([LINE]
         ([TEXT :x 201 :y (/ 6439 3) :w 987 :h 14])
         ([INLINE :tag SUP :id e10058 :class (noprint Inline-Template Template-Fact)]
          ([TEXT :x 1188 :y (/ 64337 30) :w 4 :h 11])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([INLINE :tag SPAN]
             ([TEXT :x 1192 :y (/ 64277 30) :w 87 :h 13]))))
          ([TEXT :x 1279 :y (/ 64337 30) :w 4 :h 11]))
         ([TEXT :x 1283 :y (/ 6439 3) :w 114 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 32531 15) :w 528 :h 14])
         ([INLINE :tag SUP :id e10060 :class (noprint Inline-Template Template-Fact)]
          ([TEXT :x 729 :y (/ 65009 30) :w 4 :h 11])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([INLINE :tag SPAN]
             ([TEXT :x 733 :y (/ 64949 30) :w 87 :h 13]))))
          ([TEXT :x 820 :y (/ 65009 30) :w 4 :h 11]))
         ([TEXT :x 824 :y (/ 32531 15) :w 587 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 32867 15) :w 1203 :h 14]))
        ([LINE]
         ([TEXT :x 201 :y (/ 33203 15) :w 243 :h 14])
         ([INLINE :tag SUP :id cite_ref-13 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 444 :y (/ 66353 30) :w 4 :h 11]))
           ([TEXT :x 448 :y (/ 66353 30) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 462 :y (/ 66353 30) :w 4 :h 11]))))
         ([TEXT :x 466 :y (/ 33203 15) :w 551 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1017 :y (/ 33203 15) :w 98 :h 14]))
         ([TEXT :x 1115 :y (/ 33203 15) :w 123 :h 14])))
       ([BLOCK :tag BLOCKQUOTE :x 201 :y (/ 33686 15) :w 1223.4 :h 58.8]
        ([BLOCK :tag P :x 241 :y (/ 33791 15) :w 1143.4 :h 44.8]
         ([LINE]
          ([TEXT :x 241 :y (/ 33854 15) :w 1079 :h 14]))
         ([LINE]
          ([TEXT :x 241 :y (/ 6838 3) :w 371 :h 14]))))
       ([BLOCK :tag P :x 201 :y (/ 34778 15) :w 1503 :h 22.4]
        ([LINE]
         ([TEXT :x 201 :y (/ 34841 15) :w 128 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 329 :y (/ 34841 15) :w 78 :h 14]))
         ([TEXT :x 407 :y (/ 34841 15) :w 186 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 593 :y (/ 34841 15) :w 107 :h 14]))
         ([TEXT :x 700 :y (/ 34841 15) :w 700 :h 14])
         ([INLINE :tag SUP :id cite_ref-14 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1400 :y (/ 69629 30) :w 4 :h 11]))
           ([TEXT :x 1404 :y (/ 69629 30) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1418 :y (/ 69629 30) :w 4 :h 11]))))))
       ([BLOCK :tag P :x 201 :y (/ 35219 15) :w 1503 :h 67.2]
        ([LINE]
         ([TEXT :x 201 :y (/ 35282 15) :w 1381 :h 14])
         ([INLINE :tag SUP :id cite_ref-rohleder_15-0 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 1582 :y (/ 70511 30) :w 4 :h 11]))
           ([TEXT :x 1586 :y (/ 70511 30) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 1600 :y (/ 70511 30) :w 4 :h 11]))))
         ([TEXT :x 1604 :y (/ 35282 15) :w 4 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1608 :y (/ 35282 15) :w 87 :h 14])))
        ([LINE]
         ([INLINE :tag A]
          ([TEXT :x 201 :y (/ 35618 15) :w 28 :h 14]))
         ([TEXT :x 229 :y (/ 35618 15) :w 240 :h 14])
         ([INLINE :tag SUP :id cite_ref-rohleder_15-1 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 469 :y (/ 71183 30) :w 4 :h 11]))
           ([TEXT :x 473 :y (/ 71183 30) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 487 :y (/ 71183 30) :w 4 :h 11]))))
         ([TEXT :x 491 :y (/ 35618 15) :w 4 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 495 :y (/ 35618 15) :w 125 :h 14]))
         ([TEXT :x 620 :y (/ 35618 15) :w 672 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 1292 :y (/ 35618 15) :w 100 :h 14]))
         ([TEXT :x 1392 :y (/ 35618 15) :w 263 :h 14]))
        ([LINE]
         ([INLINE :tag A]
          ([TEXT :x 201 :y (/ 35954 15) :w 100 :h 14]))
         ([TEXT :x 301 :y (/ 35954 15) :w 185 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 486 :y (/ 35954 15) :w 78 :h 14]))
         ([TEXT :x 564 :y (/ 35954 15) :w 166 :h 14])
         ([INLINE :tag SUP :id cite_ref-16 :class (reference)]
          ([INLINE :tag A]
           ([INLINE :tag SPAN]
            ([TEXT :x 730 :y (/ 14371 6) :w 4 :h 11]))
           ([TEXT :x 734 :y (/ 14371 6) :w 14 :h 11])
           ([INLINE :tag SPAN]
            ([TEXT :x 748 :y (/ 14371 6) :w 4 :h 11]))))))
       ([BLOCK :tag H2 :x 201 :y (/ 36542 15) :w 1503 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Writings :class (mw-headline)]
           ([TEXT :x 201 :y (/ 73134 30) :w 80 :h 24]))))
        ([MAGIC :tag SPAN :x 294 :y (/ 73404 30) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10008 :class (mw-editsection-bracket)]
          ([TEXT :x 294 :y (/ 73404 30) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 302.25 :y (/ 73404 30) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10020 :class (mw-editsection-bracket)]
          ([TEXT :x 329.5 :y (/ 73404 30) :w 5 :h 13]))))
       ([BLOCK :tag UL :x 223.4 :y 2469.7 :w 1480.6 :h 48.2]
        ([MAGIC :tag LI :x 223.4 :y 2469.7 :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([TEXT :x 223.4 :y 2474.9 :w 114 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 337.4 :y 2472.9 :w 464 :h 16]))
         ([TEXT :x 801.4 :y 2474.9 :w 256 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 74835 30) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag I]
          ([TEXT :x 223.4 :y 2497.7 :w 259 :h 16]))
         ([TEXT :x 482.4 :y 2499.7 :w 176 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 658.4 :y 2499.7 :w 104 :h 14]))
         ([TEXT :x 762.4 :y 2499.7 :w 120 :h 14])))
       ([BLOCK :tag H2 :x 201 :y 2538.9 :w 1503 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id See_also :class (mw-headline)]
           ([TEXT :x 201 :y (/ 38108 15) :w 74 :h 24]))))
        ([MAGIC :tag SPAN :x 288 :y (/ 38243 15) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10009 :class (mw-editsection-bracket)]
          ([TEXT :x 288 :y (/ 38243 15) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 296.25 :y (/ 38243 15) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10021 :class (mw-editsection-bracket)]
          ([TEXT :x 323.5 :y (/ 38243 15) :w 5 :h 13]))))
       ([BLOCK :tag UL :x 223.4 :y (/ 77173 30) :w 1480.6 :h 22.4]
        ([MAGIC :tag LI :x 223.4 :y (/ 77173 30) :w 1480.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 223.4 :y (/ 77299 30) :w 217 :h 14]))))
       ([BLOCK :tag H2 :x 201 :y (/ 15695 6) :w 1503 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id References :class (mw-headline)]
           ([TEXT :x 201 :y (/ 78525 30) :w 102 :h 24]))))
        ([MAGIC :tag SPAN :x 316 :y (/ 78795 30) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10010 :class (mw-editsection-bracket)]
          ([TEXT :x 316 :y (/ 78795 30) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 324.25 :y (/ 78795 30) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10022 :class (mw-editsection-bracket)]
          ([TEXT :x 351.5 :y (/ 78795 30) :w 5 :h 13]))))
       ([BLOCK :tag DIV :x 201 :y (/ 39741 15) :w 1503 :h (/ 2261 6) :id e10062 :class (reflist)]
        ([BLOCK :tag OL :x 241.3 :y (/ 39741 15) :w 1462.7 :h (/ 2261 6) :class (references)]
         ([MAGIC :tag LI :x 241.3 :y (/ 39741 15) :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-eliza-1]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 79559 30) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 79619 30) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A :class (external text)]
            ([TEXT :x 256.3 :y (/ 79619 30) :w 182 :h 13]))
           ([TEXT :x 451.3 :y (/ 79619 30) :w 348 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y (/ 32062 12) :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-2]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y 2674.4 :w 11 :h 15]))))
          ([TEXT :x 252.3 :y 2676.4 :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([TEXT :x 256.3 :y 2676.4 :w 74 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y 2694.25 :w 1462.7 :h (/ 121 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-FOOTNOTEChisholm1911-3]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([TEXT :x 241.3 :y (/ 16187 6) :w 15 :h 13])
           ([INLINE :tag A]
            ([BLOCK :tag SPAN :x 256.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
             ([LINE]
              ([TEXT :x 256.3 :y (/ -2995493 30) :w 32 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y (/ -1497444 15) :w 16 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y -99809.45 :w 17 :h 13])))
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 256.3 :y (/ 32333 12) :w 7 :h 11])))))
           ([TEXT :x 263.3 :y (/ 16187 6) :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 267.3 :y (/ 32333 12) :w 7 :h 11])))))
           ([TEXT :x 274.3 :y (/ 16187 6) :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 278.3 :y (/ 32333 12) :w 6 :h 11])))))
           ([TEXT :x 284.3 :y (/ 16187 6) :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 288.3 :y (/ 32333 12) :w 7 :h 11])))))
           ([TEXT :x 295.3 :y (/ 16187 6) :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 299.3 :y (/ 32333 12) :w 7 :h 11])))))
           ([TEXT :x 306.3 :y (/ 16187 6) :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 310.3 :y (/ 32333 12) :w 4 :h 11])))))
           ([TEXT :x 314.3 :y (/ 16187 6) :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 318.3 :y (/ 32333 12) :w 7 :h 11]))))))
          ([TEXT :x 325.3 :y (/ 16187 6) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A]
            ([TEXT :x 329.3 :y (/ 16187 6) :w 95 :h 13]))
           ([TEXT :x 424.3 :y (/ 16187 6) :w 4 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y 2715.7 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-4]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 40774 15) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 40804 15) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A :class (external text)]
            ([TEXT :x 256.3 :y (/ 40804 15) :w 144 :h 13]))))
         ([MAGIC :tag LI :x 241.3 :y 2738.1 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-BorgenichtRegan2010-5]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([TEXT :x 241.3 :y 2742.7 :w 15 :h 13])
           ([INLINE :tag A]
            ([BLOCK :tag SPAN :x 256.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
             ([LINE]
              ([TEXT :x 256.3 :y (/ -2995493 30) :w 32 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y (/ -1497444 15) :w 16 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y -99809.45 :w 17 :h 13])))
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 256.3 :y 2568.125 :w 7 :h 11])))))
           ([TEXT :x 263.3 :y 2742.7 :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 267.3 :y 2568.125 :w 7 :h 11]))))))
          ([TEXT :x 274.3 :y 2742.7 :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag CITE :class (citation book)]
            ([TEXT :x 278.3 :y 2742.7 :w 276 :h 13])
            ([INLINE :tag A :class (external text)]
             ([INLINE :tag I]
              ([TEXT :x 554.3 :y 2740.7 :w 274 :h 15])))
            ([TEXT :x 841.3 :y 2742.7 :w 8 :h 13])
            ([INLINE :tag A :class (mw-redirect)]
             ([TEXT :x 849.3 :y 2742.7 :w 282 :h 13]))
            ([TEXT :x 1131.3 :y 2742.7 :w 8 :h 13])
            ([INLINE :tag A]
             ([TEXT :x 1139.3 :y 2742.7 :w 102 :h 13]))
            ([TEXT :x 1241.3 :y 2742.7 :w 63 :h 13])
            ([INLINE :tag A]
             ([TEXT :x 1304.3 :y 2742.7 :w 31 :h 13]))
            ([TEXT :x 1335.3 :y 2742.7 :w 4 :h 13])
            ([INLINE :tag A]
             ([TEXT :x 1339.3 :y 2742.7 :w 124 :h 13]))
            ([INLINE :tag SPAN :class (reference-accessdate)]
             ([TEXT :x 1463.3 :y 2742.7 :w 71 :h 13])
             ([INLINE :tag SPAN :class (nowrap)]
              ([TEXT :x 1534.3 :y 2742.7 :w 41 :h 13]))
             ([TEXT :x 1575.3 :y 2742.7 :w 36 :h 13]))
            ([TEXT :x 1611.3 :y 2742.7 :w 4 :h 13]))
           ([INLINE :tag SPAN :class (Z3988)])))
         ([MAGIC :tag LI :x 241.3 :y 2760.55 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-6]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 41447 15) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 41477 15) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A :class (external text)]
            ([TEXT :x 256.3 :y (/ 41477 15) :w 66 :h 13]))))
         ([MAGIC :tag LI :x 241.3 :y 2830 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-7]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 83567 30) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 83627 30) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([TEXT :x 256.3 :y (/ 83627 30) :w 35 :h 13])
           ([INLINE :tag I]
            ([TEXT :x 291.3 :y (/ 83567 30) :w 59 :h 15]))
           ([TEXT :x 350.3 :y (/ 83627 30) :w 81 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y (/ 33665 12) :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-8]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y 2808 :w 11 :h 15]))))
          ([TEXT :x 252.3 :y 2810 :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([TEXT :x 256.3 :y 2810 :w 35 :h 13])
           ([INLINE :tag I]
            ([TEXT :x 291.3 :y 2808 :w 59 :h 15]))
           ([TEXT :x 350.3 :y 2810 :w 83 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y 2827.85 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-9]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 84913 30) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 84973 30) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([TEXT :x 256.3 :y (/ 84973 30) :w 35 :h 13])
           ([INLINE :tag I]
            ([TEXT :x 291.3 :y (/ 84913 30) :w 55 :h 15]))))
         ([MAGIC :tag LI :x 241.3 :y 2672.125 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-Clay_1984-10]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([TEXT :x 241.3 :y (/ 42823 15) :w 15 :h 13])
           ([INLINE :tag A]
            ([BLOCK :tag SPAN :x 256.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
             ([LINE]
              ([TEXT :x 256.3 :y (/ -2995493 30) :w 32 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y (/ -1497444 15) :w 16 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y -99809.45 :w 17 :h 13])))
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 256.3 :y 2851.45 :w 7 :h 11])))))
           ([TEXT :x 263.3 :y (/ 42823 15) :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 267.3 :y 2851.45 :w 7 :h 11]))))))
          ([TEXT :x 274.3 :y (/ 42823 15) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([TEXT :x 278.3 :y (/ 42823 15) :w 314 :h 13])
           ([INLINE :tag I]
            ([INLINE :tag A :class (mw-redirect)]
             ([TEXT :x 592.3 :y (/ 42793 15) :w 189 :h 15])))
           ([TEXT :x 781.3 :y (/ 42823 15) :w 199 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y 2693.125 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-11]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y 2875.3 :w 11 :h 15]))))
          ([TEXT :x 252.3 :y 2877.3 :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([TEXT :x 256.3 :y 2877.3 :w 152 :h 13])
           ([INLINE :tag I]
            ([TEXT :x 408.3 :y 2875.3 :w 513 :h 15]))
           ([TEXT :x 921.3 :y 2877.3 :w 48 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y 2895.15 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-12]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 43466 15) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 43496 15) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A :class (external text)]
            ([TEXT :x 256.3 :y (/ 43496 15) :w 362 :h 13]))
           ([TEXT :x 631.3 :y (/ 43496 15) :w 8 :h 13])
           ([INLINE :tag I]
            ([TEXT :x 639.3 :y (/ 43466 15) :w 131 :h 15]))
           ([TEXT :x 770.3 :y (/ 43496 15) :w 85 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y (/ 35011 12) :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-13]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 17521 6) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 17533 6) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A :class (external text)]
            ([TEXT :x 256.3 :y (/ 17533 6) :w 475 :h 13]))
           ([TEXT :x 744.3 :y (/ 17533 6) :w 8 :h 13])
           ([INLINE :tag A]
            ([TEXT :x 752.3 :y (/ 17533 6) :w 124 :h 13]))
           ([TEXT :x 876.3 :y (/ 17533 6) :w 136 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y 2940 :w 1462.7 :h (/ 124 3) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-14]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y 2942.6 :w 11 :h 15]))))
          ([TEXT :x 252.3 :y 2944.6 :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A :class (external text)]
            ([TEXT :x 256.3 :y 2944.6 :w 1156 :h 13]))
           ([TEXT :x 1425.3 :y 2944.6 :w 242 :h 13])
           ([TEXT :x 241.3 :y (/ 88943 30) :w 48 :h 13])))
         ([MAGIC :tag LI :x 241.3 :y (/ 44739 15) :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-rohleder-15]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([TEXT :x 241.3 :y 2987.2 :w 15 :h 13])
           ([INLINE :tag A]
            ([BLOCK :tag SPAN :x 256.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
             ([LINE]
              ([TEXT :x 256.3 :y (/ -2995493 30) :w 32 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y (/ -1497444 15) :w 16 :h 13]))
             ([LINE]
              ([TEXT :x 256.3 :y -99809.45 :w 17 :h 13])))
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 256.3 :y (/ 89514 30) :w 7 :h 11])))))
           ([TEXT :x 263.3 :y 2987.2 :w 4 :h 13])
           ([INLINE :tag A]
            ([INLINE :tag SUP]
             ([INLINE :tag I]
              ([INLINE :tag B]
               ([TEXT :x 267.3 :y (/ 89514 30) :w 7 :h 11]))))))
          ([TEXT :x 274.3 :y 2987.2 :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag CITE :class (citation news)]
            ([TEXT :x 278.3 :y 2987.2 :w 99 :h 13])
            ([INLINE :tag A :class (external text)]
             ([TEXT :x 377.3 :y 2987.2 :w 239 :h 13]))
            ([TEXT :x 629.3 :y 2987.2 :w 8 :h 13])
            ([INLINE :tag I]
             ([INLINE :tag A]
              ([TEXT :x 637.3 :y 2985.2 :w 43 :h 15])))
            ([INLINE :tag SPAN :class (reference-accessdate)]
             ([TEXT :x 680.3 :y 2987.2 :w 71 :h 13])
             ([INLINE :tag SPAN :class (nowrap)]
              ([TEXT :x 751.3 :y 2987.2 :w 74 :h 13])))
            ([TEXT :x 825.3 :y 2987.2 :w 4 :h 13]))
           ([INLINE :tag SPAN :class (Z3988)])))
         ([MAGIC :tag LI :x 241.3 :y 3005.05 :w 1462.7 :h (/ 127 6) :mt 0 :mr 0 :mb (/ 19 15) :ml 0 :id cite_note-16]
          ([INLINE :tag SPAN :class (mw-cite-backlink)]
           ([INLINE :tag B]
            ([INLINE :tag A]
             ([BLOCK :tag SPAN :x 241.3 :y (/ -2995601 30) :w 1 :h 1 :class (cite-accessibility-label)]
              ([LINE]
               ([TEXT :x 241.3 :y (/ -2995523 30) :w 37 :h 15]))
              ([LINE]
               ([TEXT :x 241.3 :y (/ -1497459 15) :w 19 :h 15])))
             ([TEXT :x 241.3 :y (/ 90229 30) :w 11 :h 15]))))
          ([TEXT :x 252.3 :y (/ 90289 30) :w 4 :h 13])
          ([INLINE :tag SPAN :class (reference-text)]
           ([INLINE :tag A :class (external text)]
            ([TEXT :x 256.3 :y (/ 90289 30) :w 106 :h 13]))
           ([TEXT :x 375.3 :y (/ 90289 30) :w 116 :h 13])))))
       ([BLOCK :tag DL :x 201 :y (/ 90975 30) :w 1503 :h 22.4]
        ([BLOCK :tag DT :x 201 :y (/ 90975 30) :w 1503 :h 22.4]
         ([LINE]
          ([TEXT :x 201 :y 2846 :w 84 :h 16]))))
       ([BLOCK :tag P :x 201 :y (/ 36743 12) :w 1503 :h 23.4]
        ([LINE]
         ([INLINE :tag A :class (image)]
          ([INLINE :tag IMG]))
         ([TEXT :x 213 :y 3067.1 :w 4 :h 14])
         ([INLINE :tag CITE :class (citation encyclopaedia)]
          ([TEXT :x 217 :y 3067.1 :w 202 :h 14])
          ([INLINE :tag A :class (extiw)]
           ([TEXT :x 419 :y 3067.1 :w 159 :h 14]))
          ([TEXT :x 578 :y 3067.1 :w 13 :h 14])
          ([INLINE :tag I]
           ([INLINE :tag A]
            ([TEXT :x 591 :y 3065.1 :w 169 :h 16])))
          ([TEXT :x 760 :y 3067.1 :w 272 :h 14]))
         ([INLINE :tag SPAN :class (Z3988)])))
       ([BLOCK :tag H2 :x 201 :y 3106.3 :w 1503 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id Further_reading :class (mw-headline)]
           ([TEXT :x 201 :y (/ 93239 30) :w 148 :h 24]))))
        ([MAGIC :tag SPAN :x 362 :y (/ 93509 30) :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10011 :class (mw-editsection-bracket)]
          ([TEXT :x 362 :y (/ 93509 30) :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 370.25 :y (/ 93509 30) :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10023 :class (mw-editsection-bracket)]
          ([TEXT :x 397.5 :y (/ 93509 30) :w 5 :h 13]))))
       ([BLOCK :tag UL :x 223.4 :y (/ 47098 15) :w 1480.6 :h 172.2]
        ([MAGIC :tag LI :x 223.4 :y (/ 47098 15) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (new)]
          ([TEXT :x 223.4 :y (/ 47176 15) :w 119 :h 14]))
         ([TEXT :x 342.4 :y (/ 47176 15) :w 8 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 350.4 :y (/ 47146 15) :w 231 :h 16]))
         ([TEXT :x 581.4 :y (/ 47176 15) :w 216 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 9494 3) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (new)]
          ([TEXT :x 223.4 :y (/ 47548 15) :w 127 :h 14]))
         ([TEXT :x 350.4 :y (/ 47548 15) :w 8 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 358.4 :y (/ 47518 15) :w 316 :h 16]))
         ([TEXT :x 674.4 :y (/ 47548 15) :w 139 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 47842 15) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag CITE :class (citation book)]
          ([TEXT :x 223.4 :y (/ 9584 3) :w 168 :h 14])
          ([INLINE :tag A :class (external text)]
           ([INLINE :tag I]
            ([TEXT :x 391.4 :y (/ 9578 3) :w 846 :h 16])))
          ([TEXT :x 1250.4 :y (/ 9584 3) :w 283 :h 14])
          ([INLINE :tag SPAN :class (reference-accessdate)]
           ([TEXT :x 1533.4 :y (/ 9584 3) :w 77 :h 14])
           ([INLINE :tag SPAN :class (nowrap)]
            ([TEXT :x 1610.4 :y (/ 9584 3) :w 82 :h 14])))
          ([TEXT :x 1692.4 :y (/ 9584 3) :w 4 :h 14]))
         ([INLINE :tag SPAN :class (Z3988)]))
        ([MAGIC :tag LI :x 223.4 :y (/ 48214 15) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 223.4 :y (/ 48292 15) :w 80 :h 14]))
         ([TEXT :x 303.4 :y (/ 48292 15) :w 34 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 337.4 :y (/ 48292 15) :w 104 :h 14]))
         ([TEXT :x 441.4 :y (/ 48292 15) :w 8 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 449.4 :y (/ 48262 15) :w 329 :h 16]))
         ([TEXT :x 778.4 :y (/ 48292 15) :w 234 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 48586 15) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag CITE :id CITEREFKirchner2010 :class (citation)]
          ([TEXT :x 223.4 :y (/ 48664 15) :w 151 :h 14])
          ([INLINE :tag I]
           ([TEXT :x 374.4 :y (/ 48634 15) :w 364 :h 16]))
          ([TEXT :x 738.4 :y (/ 48664 15) :w 8 :h 14])
          ([INLINE :tag A :class (mw-redirect)]
           ([TEXT :x 746.4 :y (/ 48664 15) :w 83 :h 14]))
          ([TEXT :x 829.4 :y (/ 48664 15) :w 108 :h 14])
          ([INLINE :tag A]
           ([TEXT :x 937.4 :y (/ 48664 15) :w 32 :h 14]))
          ([TEXT :x 969.4 :y (/ 48664 15) :w 4 :h 14])
          ([INLINE :tag A]
           ([TEXT :x 973.4 :y (/ 48664 15) :w 105 :h 14])))
         ([INLINE :tag SPAN :class (Z3988)]))
        ([MAGIC :tag LI :x 223.4 :y (/ 48958 15) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (new)]
          ([TEXT :x 223.4 :y (/ 49036 15) :w 113 :h 14]))
         ([TEXT :x 336.4 :y (/ 49036 15) :w 8 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 344.4 :y (/ 49006 15) :w 264 :h 16]))
         ([TEXT :x 608.4 :y (/ 49036 15) :w 236 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 9866 3) :w 1480.6 :h 23.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (new)]
          ([TEXT :x 223.4 :y (/ 49408 15) :w 138 :h 14]))
         ([TEXT :x 361.4 :y (/ 49408 15) :w 8 :h 14])
         ([INLINE :tag I]
          ([TEXT :x 369.4 :y (/ 49378 15) :w 313 :h 16]))
         ([TEXT :x 682.4 :y (/ 49408 15) :w 241 :h 14])))
       ([BLOCK :tag H2 :x 201 :y (/ 49996 15) :w 1503 :h 28.3]
        ([ANON]
         ([LINE]
          ([INLINE :tag SPAN :id External_links :class (mw-headline)]
           ([TEXT :x 201 :y 3126.25 :w 129 :h 24]))))
        ([MAGIC :tag SPAN :x 343 :y 3134.75 :w 40.5 :h 13 :mt 0 :mr 0 :mb 0 :ml 13 :class (mw-editsection)]
         ([INLINE :tag SPAN :id e10012 :class (mw-editsection-bracket)]
          ([TEXT :x 343 :y 3134.75 :w 5 :h 13]))
         ([INLINE :tag A]
          ([TEXT :x 351.25 :y 3134.75 :w 24 :h 13]))
         ([INLINE :tag SPAN :id e10024 :class (mw-editsection-bracket)]
          ([TEXT :x 378.5 :y 3134.75 :w 5 :h 13]))))
       ([BLOCK :tag UL :x 223.4 :y (/ 50499 15) :w 1480.6 :h 117.6]
        ([MAGIC :tag LI :x 223.4 :y (/ 50499 15) :w 1480.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (external text)]
          ([TEXT :x 223.4 :y (/ 40450 12) :w 217 :h 14]))
         ([TEXT :x 453.4 :y (/ 40450 12) :w 111 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 40685 12) :w 1480.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (external text)]
          ([TEXT :x 223.4 :y (/ 50919 15) :w 247 :h 14]))
         ([TEXT :x 483.4 :y (/ 50919 15) :w 112 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 102426 30) :w 1480.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (external text)]
          ([TEXT :x 223.4 :y (/ 41021 12) :w 446 :h 14]))
         ([TEXT :x 682.4 :y (/ 41021 12) :w 220 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y 3438 :w 1480.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (external text)]
          ([TEXT :x 223.4 :y (/ 103266 30) :w 178 :h 14]))
         ([TEXT :x 414.4 :y (/ 103266 30) :w 226 :h 14]))
        ([MAGIC :tag LI :x 223.4 :y (/ 41542 12) :w 1480.6 :h 22.4 :mt 0 :mr 0 :mb 1.4 :ml 0]
         ([INLINE :tag A :class (external text)]
          ([TEXT :x 223.4 :y 3466 :w 116 :h 14]))
         ([TEXT :x 352.4 :y 3466 :w 8 :h 14])
         ([INLINE :tag A]
          ([TEXT :x 360.4 :y 3466 :w 159 :h 14]))
         ([TEXT :x 519.4 :y 3466 :w 263 :h 14])))
       ([MAGIC :tag TABLE :x 598.7 :y (/ 52363 15) :w (/ 8491 12) :h (/ 1589 12) :mt 6.65 :mr 0 :mb 6.65 :ml 0 :id e10068 :class (wikitable succession-box)]
        ([MAGIC :tag TBODY :x 599.7 :y (/ 52408 15) :w (/ 8479 12) :h (/ 1553 12) :mt 0 :mr 0 :mb 0 :ml 0]
         ([MAGIC :tag TR :x 599.7 :y (/ 52408 15) :w (/ 8479 12) :h (/ 444 15) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TH :x 599.7 :y (/ 52408 15) :w (/ 8479 12) :h (/ 444 15) :mt 0 :mr 0 :mb 0 :ml 0 :id e10069]
           ([TEXT :x 905 :y (/ 10505 3) :w 125 :h 15])))
         ([MAGIC :tag TR :x 599.7 :y (/ 105705 30) :w (/ 8479 12) :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10070]
          ([MAGIC :tag TD :x 599.7 :y (/ 105705 30) :w (/ 6359 30) :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10071]
           ([TEXT :x (/ 1997 3) :y 3309.625 :w 79 :h 13])
           ([INLINE :tag BR])
           ([INLINE :tag SPAN :id e10072]
            ([INLINE :tag A]
             ([TEXT :x 653.7 :y (/ 106517 30) :w 103 :h 15]))))
          ([MAGIC :tag TD :x (/ 2435 3) :y (/ 105705 30) :w 282.65 :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10074]
           ([INLINE :tag B]
            ([INLINE :tag A :class (mw-redirect)]
             ([TEXT :x 831 :y 3308.75 :w 271 :h 15])))
           ([INLINE :tag BR])
           ([TEXT :x 866 :y (/ 106577 30) :w 201 :h 13]))
          ([MAGIC :tag TD :x 1094.3 :y (/ 105705 30) :w (/ 6359 30) :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10075]
           ([TEXT :x (/ 34643 30) :y 3309.625 :w 90 :h 13])
           ([INLINE :tag BR])
           ([INLINE :tag SPAN :id e10076]
            ([INLINE :tag A]
             ([TEXT :x 1141.8 :y (/ 106517 30) :w 116 :h 15])))))
         ([MAGIC :tag TR :x 599.7 :y (/ 53601 15) :w (/ 8479 12) :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10078]
          ([MAGIC :tag TD :x 599.7 :y (/ 53601 15) :w (/ 6359 30) :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10079]
           ([TEXT :x (/ 1997 3) :y (/ 42962 12) :w 79 :h 13])
           ([INLINE :tag BR])
           ([INLINE :tag SPAN :id e10080]
            ([INLINE :tag A]
             ([TEXT :x (/ 7766 12) :y (/ 54007 15) :w 116 :h 15]))))
          ([MAGIC :tag TD :x (/ 2435 3) :y (/ 53601 15) :w 282.65 :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10082]
           ([INLINE :tag B]
            ([INLINE :tag A :class (mw-redirect)]
             ([TEXT :x 831 :y (/ 42950 12) :w 271 :h 15])))
           ([INLINE :tag BR])
           ([TEXT :x 858 :y (/ 54037 15) :w 217 :h 13]))
          ([MAGIC :tag TD :x 1094.3 :y (/ 53601 15) :w (/ 6359 30) :h 49.9 :mt 0 :mr 0 :mb 0 :ml 0 :id e10083]
           ([TEXT :x (/ 34643 30) :y (/ 42962 12) :w 90 :h 13])
           ([INLINE :tag BR])
           ([INLINE :tag SPAN :id e10084]
            ([INLINE :tag A]
             ([TEXT :x 1136.8 :y (/ 54007 15) :w 126 :h 15])))))))
       ([MAGIC :tag TABLE :x 201 :y 3635.6 :w 1503 :h (/ 5623 30) :mt 12.3 :mr 0 :mb 0 :ml 0 :id e10086 :class (navbox)]
        ([MAGIC :tag TBODY :x 203 :y 3637.6 :w 1499 :h (/ 5503 30) :mt 0 :mr 0 :mb 0 :ml 0]
         ([MAGIC :tag TR :x 203 :y 3637.6 :w 1499 :h (/ 5503 30) :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x 203 :y 3637.6 :w 1499 :h (/ 5503 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10087]
           ([MAGIC :tag TABLE :x 205 :y 3639.6 :w 1495 :h (/ 5383 30) :mt 0 :mr 0 :mb 0 :ml 0 :id collapsibleTable0 :class (nowraplinks collapsible autocollapse navbox-inner)]
            ([MAGIC :tag TBODY :x 205 :y 3639.6 :w 1495 :h (/ 5383 30) :mt 0 :mr 0 :mb 0 :ml 0]
             ([MAGIC :tag TR :x 205 :y 3639.6 :w 1495 :h 25.65 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TH :x 205 :y 3639.6 :w 1495 :h 25.65 :mt 0 :mr 0 :mb 0 :ml 0 :class (navbox-title)]
               ([BLOCK :tag SPAN :x (/ 48413 30) :y 3642.7 :w 73.9 :h (/ 555 30) :class (collapseButton)]
                ([LINE]
                 ([TEXT :x 1650.7 :y (/ 43751 12) :w 5 :h 12])
                 ([INLINE :tag A :id collapseButton0]
                  ([TEXT :x 1655.7 :y (/ 43751 12) :w 27 :h 12]))
                 ([TEXT :x 1682.7 :y (/ 43751 12) :w 5 :h 12])))
               ([BLOCK :tag DIV :x 217.3 :y 3642.7 :w 73.9 :h (/ 585 30) :class (plainlinks hlist navbar mini)]
                ([LINE]
                 ([INLINE :tag UL]
                  ([INLINE :tag LI :class (nv-view)]
                   ([INLINE :tag A]
                    ([INLINE :tag ABBR :id e10025]
                     ([TEXT :x 217.3 :y (/ 43763 12) :w 7 :h 12]))))
                  ([INLINE :tag LI :class (nv-talk)]
                   ([INLINE :tag A :class (new)]
                    ([INLINE :tag ABBR :id e10026]
                     ([TEXT :x 234.25 :y (/ 43763 12) :w 5 :h 12]))))
                  ([INLINE :tag LI :class (nv-edit)]
                   ([INLINE :tag A :class (external text)]
                    ([INLINE :tag ABBR :id e10027]
                     ([TEXT :x (/ 2990 12) :y (/ 43763 12) :w 7 :h 12])))))))
               ([BLOCK :tag DIV :x 217.3 :y 3642.7 :w (/ 44111 30) :h (/ 281 15) :id e10091]
                ([LINE]
                 ([INLINE :tag SPAN :class (flagicon)]
                  ([INLINE :tag IMG :class (thumbborder)]))
                 ([TEXT :x 800 :y (/ 43727 12) :w 5 :h 16])
                 ([INLINE :tag A]
                  ([TEXT :x 805 :y (/ 43727 12) :w 295 :h 16]))
                 ([TEXT :x 1100 :y (/ 43727 12) :w 5 :h 16])
                 ([INLINE :tag SPAN :class (flagicon)]
                  ([INLINE :tag A]
                   ([INLINE :tag IMG :class (thumbborder)])))))))
             ([MAGIC :tag TR :x 205 :y 3665.25 :w 1495 :h 2 :mt 0 :mr 0 :mb 0 :ml 0 :id e10092]
              ([MAGIC :tag TD :x 205 :y 3665.25 :w 1495 :h 2 :mt 0 :mr 0 :mb 0 :ml 0]))
             ([MAGIC :tag TR :x 205 :y 3667.25 :w 1495 :h (/ 1845 30) :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TH :x 205 :y 3667.25 :w (/ 6499 30) :h (/ 1845 30) :mt 0 :mr 0 :mb 0 :ml 0 :class (navbox-group)]
               ([TEXT :x 274.3 :y 3681.75 :w 135 :h 14])
               ([INLINE :tag BR])
               ([INLINE :tag A]
                ([TEXT :x 217.3 :y (/ 111007 30) :w 108 :h 14]))
               ([TEXT :x 325.3 :y (/ 111007 30) :w 84 :h 14]))
              ([MAGIC :tag TD :x (/ 12649 30) :y 3667.25 :w (/ 38351 30) :h (/ 1845 30) :mt 0 :mr 0 :mb 0 :ml 0 :id e10093 :class (navbox-list navbox-odd hlist)]
               ([BLOCK :tag DIV :x (/ 12709 30) :y 3667.25 :w (/ 38291 30) :h (/ 1845 30) :id e10094]
                ([BLOCK :tag UL :x 400 :y 3667.25 :w 1270.2 :h (/ 1845 30)]
                 ([LINE]
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 400 :y 3673 :w 33 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 443.125 :y 3673 :w 34 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 487.25 :y 3673 :w 42 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 538.75 :y 3673 :w 43 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 591.25 :y 3673 :w 48 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 648.5 :y 3673 :w 57 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 714.125 :y 3673 :w 61 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 783.5 :y 3673 :w 59 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 851 :y 3673 :w 63 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 922.25 :y 3673 :w 62 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 992.5 :y 3673 :w 42 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1044.125 :y 3673 :w 25 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1079.75 :y 3673 :w 38 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1127.5 :y 3673 :w 75 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1210 :y 3673 :w 29 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1249.375 :y 3673 :w 53 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1311.25 :y 3673 :w 38 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1359.125 :y 3673 :w 38 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1406.875 :y 3673 :w 54 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1469.75 :y 3673 :w 48 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1526.875 :y 3673 :w 56 :h 12]))))
                 ([LINE]
                  ([INLINE :tag LI]
                   ([INLINE :tag STRONG :class (selflink)]
                    ([TEXT :x 400 :y 3690.5 :w 30 :h 14])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 440.375 :y 3692.5 :w 56 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag STRONG :class (selflink)]
                    ([TEXT :x 505 :y 3690.5 :w 30 :h 14])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 545.375 :y 3692.5 :w 49 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 603.5 :y 3692.5 :w 46 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 658.75 :y 3692.5 :w 37 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 705.625 :y 3692.5 :w 19 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 735.625 :y 3692.5 :w 34 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 779.75 :y 3692.5 :w 36 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 825.625 :y 3692.5 :w 66 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 899.75 :y 3692.5 :w 40 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 949.375 :y 3692.5 :w 30 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 989.75 :y 3692.5 :w 50 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1048.75 :y 3692.5 :w 22 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1081.625 :y 3692.5 :w 44 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1135 :y 3692.5 :w 48 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1192.25 :y 3692.5 :w 26 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1228.75 :y 3692.5 :w 26 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1265.375 :y 3692.5 :w 35 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1310.375 :y 3692.5 :w 35 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1355.375 :y 3692.5 :w 78 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1440.625 :y 3692.5 :w 61 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1510 :y 3692.5 :w 35 :h 12]))))
                 ([LINE]
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 400 :y 3775 :w 66 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 474.125 :y 3775 :w 37 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 521 :y 3775 :w 38 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 568.75 :y 3775 :w 46 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 624.125 :y 3775 :w 31 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A :class (new)]
                    ([TEXT :x 665.375 :y 3775 :w 41 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 716 :y 3775 :w 37 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 762.875 :y 3775 :w 44 :h 12]))))))))
             ([MAGIC :tag TR :x 205 :y (/ 111863 30) :w 1495 :h 2 :mt 0 :mr 0 :mb 0 :ml 0 :id e10095]
              ([MAGIC :tag TD :x 205 :y (/ 111863 30) :w 1495 :h 2 :mt 0 :mr 0 :mb 0 :ml 0]))
             ([MAGIC :tag TR :x 205 :y (/ 111923 30) :w 1495 :h (/ 647 15) :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TH :x 205 :y (/ 111923 30) :w (/ 6499 30) :h (/ 647 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (navbox-group)]
               ([TEXT :x 274.3 :y (/ 44833 12) :w 135 :h 14])
               ([INLINE :tag BR])
               ([INLINE :tag A]
                ([TEXT :x 236.3 :y (/ 112637 30) :w 89 :h 14]))
               ([TEXT :x 325.3 :y (/ 112637 30) :w 84 :h 14]))
              ([MAGIC :tag TD :x (/ 12649 30) :y (/ 111923 30) :w (/ 38351 30) :h (/ 647 15) :mt 0 :mr 0 :mb 0 :ml 0 :id e10096 :class (navbox-list navbox-even hlist)]
               ([BLOCK :tag DIV :x (/ 12709 30) :y 3741.05 :w (/ 38291 30) :h 22.55 :id e10097]
                ([BLOCK :tag UL :x 400 :y 3741.05 :w 1270.2 :h 22.55]
                 ([LINE]
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 400 :y (/ 44962 12) :w 35 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 445 :y (/ 44962 12) :w 41 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 495.625 :y (/ 44962 12) :w 66 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 569.75 :y (/ 44962 12) :w 54 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 632.5 :y (/ 44962 12) :w 57 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 698.125 :y (/ 44962 12) :w 35 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 743.125 :y (/ 44962 12) :w 22 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 776 :y (/ 44962 12) :w 46 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 831.25 :y (/ 44962 12) :w 43 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 883.75 :y (/ 44962 12) :w 65 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 956.875 :y (/ 44962 12) :w 38 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1004.75 :y (/ 44962 12) :w 65 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1077.875 :y (/ 44962 12) :w 35 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1122.875 :y (/ 44962 12) :w 54 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1185.625 :y (/ 44962 12) :w 29 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1225 :y (/ 44962 12) :w 46 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1280.375 :y (/ 44962 12) :w 54 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1343.125 :y (/ 44962 12) :w 48 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 1400.375 :y (/ 44962 12) :w 48 :h 12]))))))))
             ([MAGIC :tag TR :x 205 :y 3773.9 :w 1495 :h 2 :mt 0 :mr 0 :mb 0 :ml 0 :id e10098]
              ([MAGIC :tag TD :x 205 :y 3773.9 :w 1495 :h 2 :mt 0 :mr 0 :mb 0 :ml 0]))
             ([MAGIC :tag TR :x 205 :y 3775.9 :w 1495 :h (/ 647 15) :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TH :x 205 :y 3775.9 :w (/ 6499 30) :h (/ 647 15) :mt 0 :mr 0 :mb 0 :ml 0 :class (navbox-group)]
               ([TEXT :x 302.3 :y (/ 113436 30) :w 107 :h 14])
               ([INLINE :tag BR])
               ([TEXT :x 254.3 :y 3799.7 :w 155 :h 14]))
              ([MAGIC :tag TD :x (/ 12649 30) :y 3775.9 :w (/ 38351 30) :h (/ 647 15) :mt 0 :mr 0 :mb 0 :ml 0 :id e10099 :class (navbox-list navbox-odd hlist)]
               ([BLOCK :tag DIV :x (/ 12709 30) :y (/ 45434 12) :w (/ 38291 30) :h 22.55 :id e10100]
                ([BLOCK :tag UL :x 400 :y (/ 45434 12) :w 1270.2 :h 22.55]
                 ([LINE]
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 400 :y 3791.95 :w 57 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 465.625 :y 3791.95 :w 40 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 515.375 :y 3791.95 :w 60 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 583.75 :y 3791.95 :w 36 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 629.75 :y 3791.95 :w 38 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 677.5 :y 3791.95 :w 42 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 729.125 :y 3791.95 :w 26 :h 12]))))))))))))))
       ([MAGIC :tag TABLE :x 201 :y (/ 114661 30) :w 1503 :h 32.65 :mt -1 :mr 0 :mb 0 :ml 0 :id e10031 :class (navbox)]
        ([MAGIC :tag TBODY :x 203 :y (/ 114721 30) :w 1499 :h 28.65 :mt 0 :mr 0 :mb 0 :ml 0]
         ([MAGIC :tag TR :x 203 :y (/ 114721 30) :w 1499 :h 28.65 :mt 0 :mr 0 :mb 0 :ml 0]
          ([MAGIC :tag TD :x 203 :y (/ 114721 30) :w 1499 :h 28.65 :mt 0 :mr 0 :mb 0 :ml 0 :id e10101]
           ([MAGIC :tag TABLE :x 205 :y (/ 114781 30) :w 1495 :h 24.65 :mt 0 :mr 0 :mb 0 :ml 0 :id e10102 :class (nowraplinks hlist navbox-inner)]
            ([MAGIC :tag TBODY :x 205 :y (/ 114781 30) :w 1495 :h 24.65 :mt 0 :mr 0 :mb 0 :ml 0]
             ([MAGIC :tag TR :x 205 :y (/ 114781 30) :w 1495 :h 24.65 :mt 0 :mr 0 :mb 0 :ml 0]
              ([MAGIC :tag TH :x 205 :y (/ 114781 30) :w (/ 4339 30) :h 24.65 :mt 0 :mr 0 :mb 0 :ml 0 :class (navbox-group)]
               ([INLINE :tag A]
                ([TEXT :x 217.3 :y 3831.35 :w 120 :h 14])))
              ([MAGIC :tag TD :x (/ 10489 30) :y (/ 114781 30) :w (/ 40511 30) :h 24.65 :mt 0 :mr 0 :mb 0 :ml 0 :id e10103 :class (navbox-list navbox-odd)]
               ([BLOCK :tag DIV :x (/ 10549 30) :y (/ 45925 12) :w (/ 40451 30) :h 22.55 :id e10104]
                ([BLOCK :tag UL :x 332.5 :y (/ 45925 12) :w 1342.2 :h 22.55]
                 ([LINE]
                  ([INLINE :tag LI]
                   ([INLINE :tag A :class (external text)]
                    ([TEXT :x 332.5 :y 3832.85 :w 55 :h 12])))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 408.5 :y 3832.85 :w 25 :h 12]))
                   ([TEXT :x 431.875 :y 3832.85 :w 8 :h 12])
                   ([INLINE :tag SPAN :class (uid)]
                    ([INLINE :tag A :class (external text)]
                     ([TEXT :x 439.375 :y 3832.85 :w 64 :h 12]))))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 523.75 :y 3832.85 :w 31 :h 12]))
                   ([TEXT :x 552.875 :y 3832.85 :w 8 :h 12])
                   ([INLINE :tag SPAN :class (uid)]
                    ([INLINE :tag A :class (external text)]
                     ([TEXT :x 560.375 :y 3832.85 :w 72 :h 12]))))
                  ([INLINE :tag LI]
                   ([INLINE :tag A]
                    ([TEXT :x 652.25 :y 3832.85 :w 23 :h 12]))
                   ([TEXT :x 673.75 :y 3832.85 :w 8 :h 12])
                   ([INLINE :tag SPAN :class (uid)]
                    ([INLINE :tag A :class (external text)]
                     ([TEXT :x 681.25 :y 3832.85 :w 140 :h 12]))))))))))))))))
      ([MAGIC :tag DIV :x 201 :y 3868.7 :w 1503 :h 56.8 :mt 14 :mr 0 :mb 0 :ml 0 :id catlinks :class (catlinks)]
       ([BLOCK :tag DIV :x 207 :y 3874.7 :w 1491 :h 44.8 :id mw-normal-catlinks :class (mw-normal-catlinks)]
        ([ANON]
         ([LINE]
          ([INLINE :tag A]
           ([TEXT :x 207 :y 3878.9 :w 75 :h 14]))
          ([TEXT :x 282 :y 3878.9 :w 9 :h 14])))
        ([MAGIC :tag LI :x 291 :y (/ 58157 15) :w 89.5 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0 :id e10028]
         ([INLINE :tag A]
          ([TEXT :x 294.5 :y 3878.9 :w 79 :h 14])))
        ([MAGIC :tag LI :x 380.5 :y (/ 58157 15) :w 103 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 388.5 :y 3878.9 :w 88 :h 14])))
        ([MAGIC :tag LI :x 483.5 :y (/ 58157 15) :w 165 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 491.5 :y 3878.9 :w 150 :h 14])))
        ([MAGIC :tag LI :x 648.5 :y (/ 58157 15) :w 284 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 656.5 :y 3878.9 :w 269 :h 14])))
        ([MAGIC :tag LI :x 932.5 :y (/ 58157 15) :w 161 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 940.5 :y 3878.9 :w 146 :h 14])))
        ([MAGIC :tag LI :x 1093.5 :y (/ 58157 15) :w 373 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 1101.5 :y 3878.9 :w 358 :h 14])))
        ([MAGIC :tag LI :x 207 :y (/ 58493 15) :w 317 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 215 :y 3657.5 :w 302 :h 14])))
        ([MAGIC :tag LI :x 524 :y (/ 58493 15) :w 166 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 532 :y 3657.5 :w 151 :h 14])))
        ([MAGIC :tag LI :x 690 :y (/ 58493 15) :w 216 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 698 :y 3657.5 :w 201 :h 14])))
        ([MAGIC :tag LI :x 906 :y (/ 58493 15) :w 164 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 914 :y 3657.5 :w 149 :h 14])))
        ([MAGIC :tag LI :x 1070 :y (/ 58493 15) :w 214 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 1078 :y 3657.5 :w 199 :h 14])))
        ([MAGIC :tag LI :x 1284 :y (/ 58493 15) :w 243 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 1292 :y 3657.5 :w 228 :h 14])))
        ([MAGIC :tag LI :x 1527 :y (/ 58493 15) :w 157 :h 17.5 :mt 1.75 :mr 0 :mb 1.75 :ml 0]
         ([INLINE :tag A]
          ([TEXT :x 1535 :y 3657.5 :w 142 :h 14])))
        ([ANON]
         ([LINE]
          ([INLINE :tag UL])))))
      ([MAGIC :tag DIV :x 201 :y (/ 117765 30) :w 1503 :h 0 :mt 0 :mr 0 :mb 0 :ml 0 :class (visualClear)])))
    ([BLOCK :tag DIV :x 0 :y (/ 118515 30) :w 1728 :h 0 :id mw-navigation]
     ([BLOCK :tag H2 :x 0 :y -9999 :w 204 :h (/ 553 12)]
      ([LINE]
       ([TEXT :x 0 :y -9984.5 :w 204 :h 24])))
     ([BLOCK :tag DIV :x 0 :y 0 :w 1728 :h 80 :id mw-head]
      ([BLOCK :tag DIV :x 1167 :y 5 :w 545 :h 20.7 :id p-personal]
       ([BLOCK :tag UL :x 1167 :y 5 :w 545 :h 0]
        ([MAGIC :tag LI :x 1336 :y 10.625 :w 99 :h 13.5 :mt 6 :mr 0 :mb 1.2 :ml 9 :id pt-anonuserpage]
         ([TEXT :x 1351 :y (/ 361 30) :w 84 :h 12]))
        ([MAGIC :tag LI :x 1444 :y 10.625 :w 23 :h 13.5 :mt 6 :mr 0 :mb 1.2 :ml 9 :id pt-anontalk]
         ([INLINE :tag A]
          ([TEXT :x 1444 :y (/ 361 30) :w 23 :h 12])))
        ([MAGIC :tag LI :x 1476 :y 10.625 :w 84 :h 13.5 :mt 6 :mr 0 :mb 1.2 :ml 9 :id pt-anoncontribs]
         ([INLINE :tag A]
          ([TEXT :x 1476 :y (/ 361 30) :w 84 :h 12])))
        ([MAGIC :tag LI :x 1569 :y 10.625 :w 97 :h 13.5 :mt 6 :mr 0 :mb 1.2 :ml 9 :id pt-createaccount]
         ([INLINE :tag A]
          ([TEXT :x 1569 :y (/ 361 30) :w 97 :h 12])))
        ([MAGIC :tag LI :x 1675 :y 10.625 :w 37 :h 13.5 :mt 6 :mr 0 :mb 1.2 :ml 9 :id pt-login]
         ([INLINE :tag A]
          ([TEXT :x 1675 :y (/ 361 30) :w 37 :h 12])))))
      ([BLOCK :tag DIV :x 176 :y 40 :w 89.6 :h 40 :id left-navigation]
       ([BLOCK :tag DIV :x 176 :y 40 :w 89.6 :h 40 :id p-namespaces :class (vectorTabs)]
        ([BLOCK :tag UL :x 177 :y 40 :w 88.6 :h 40]
         ([BLOCK :tag LI :x 177 :y 40 :w 52.8 :h 40 :id ca-nstab-main :class (selected)]
          ([MAGIC :tag SPAN :x 177 :y 40 :w 52.8 :h 40.3 :mt 0 :mr 0 :mb 0 :ml 0]
           ([BLOCK :tag A :x 177 :y 40 :w 52.8 :h 40.3]
            ([LINE]
             ([TEXT :x 183.4 :y 58.5 :w 40 :h 13])))))
         ([BLOCK :tag LI :x 229.8 :y 40 :w 35.8 :h 40 :id ca-talk]
          ([MAGIC :tag SPAN :x 229.8 :y 40 :w 35.8 :h 40.3 :mt 0 :mr 0 :mb 0 :ml 0]
           ([BLOCK :tag A :x 229.8 :y 40 :w 35.8 :h 40.3]
            ([LINE]
             ([TEXT :x 236.2 :y 58.5 :w 23 :h 13]))))))))
      ([BLOCK :tag DIV :x 1189.2 :y 40 :w 538.8 :h 40 :id right-navigation]
       ([BLOCK :tag DIV :x 1189.2 :y 40 :w 170.4 :h 40 :id p-views :class (vectorTabs)]
        ([BLOCK :tag UL :x 1190.2 :y 40 :w 169.4 :h 40]
         ([BLOCK :tag LI :x 1190.2 :y 40 :w 43.8 :h 40 :id ca-view :class (selected)]
          ([MAGIC :tag SPAN :x 1190.2 :y 40 :w 43.8 :h 40.3 :mt 0 :mr 0 :mb 0 :ml 0]
           ([BLOCK :tag A :x 1190.2 :y 40 :w 43.8 :h 40.3]
            ([LINE]
             ([TEXT :x 1196.6 :y 58.5 :w 31 :h 13])))))
         ([BLOCK :tag LI :x 1234 :y 40 :w 36.8 :h 40 :id ca-edit]
          ([MAGIC :tag SPAN :x 1234 :y 40 :w 36.8 :h 40.3 :mt 0 :mr 0 :mb 0 :ml 0]
           ([BLOCK :tag A :x 1234 :y 40 :w 36.8 :h 40.3]
            ([LINE]
             ([TEXT :x 1240.4 :y 58.5 :w 24 :h 13])))))
         ([BLOCK :tag LI :x 1270.8 :y 40 :w 88.8 :h 40 :id ca-history :class (collapsible)]
          ([MAGIC :tag SPAN :x 1270.8 :y 40 :w 88.8 :h 40.3 :mt 0 :mr 0 :mb 0 :ml 0]
           ([BLOCK :tag A :x 1270.8 :y 40 :w 88.8 :h 40.3]
            ([LINE]
             ([TEXT :x 1277.2 :y 58.5 :w 76 :h 13])))))))
       ([BLOCK :tag DIV :x 1367.6 :y 40 :w 344.4 :h 34.8 :id p-search]
        ([BLOCK :tag FORM :x 1367.6 :y 50.4 :w 344.4 :h 24.4 :id searchform]
         ([BLOCK :tag DIV :x 1367.6 :y 50.4 :w 344.4 :h 24.4 :id simpleSearch]
          ([ANON]
           ([LINE]
            ([INLINE :tag INPUT :id searchInput])))
          ([BLOCK :tag INPUT :x 1688.1 :y 51.4 :w 22.9 :h 22.4 :id searchButton :class (searchButton)]))))))
     ([BLOCK :tag DIV :x 0 :y 160 :w 168 :h 695.5 :id mw-panel]
      ([BLOCK :tag DIV :x 8 :y 0 :w 160 :h 160 :id p-logo]
       ([BLOCK :tag A :x 8 :y 0 :w 160 :h 160 :class (mw-wiki-logo)]))
      ([BLOCK :tag DIV :x 19.2 :y 176 :w 139.2 :h 144.5 :id p-navigation :class (portal)]
       ([BLOCK :tag DIV :x 27.2 :y 180 :w 131.2 :h 136.5 :id e10030 :class (body)]
        ([BLOCK :tag UL :x 27.2 :y 180 :w 131.2 :h 136.5]
         ([MAGIC :tag LI :x 27.2 :y 180 :w 131.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-mainpage-description]
          ([INLINE :tag A]
           ([TEXT :x 27.2 :y 183.75 :w 65 :h 12])))
         ([MAGIC :tag LI :x 27.2 :y 199.5 :w 131.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-contents]
          ([INLINE :tag A]
           ([TEXT :x 27.2 :y 203.25 :w 57 :h 12])))
         ([MAGIC :tag LI :x 27.2 :y 219 :w 131.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-featuredcontent]
          ([INLINE :tag A]
           ([TEXT :x 27.2 :y 222.75 :w 109 :h 12])))
         ([MAGIC :tag LI :x 27.2 :y 238.5 :w 131.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-currentevents]
          ([INLINE :tag A]
           ([TEXT :x 27.2 :y 242.25 :w 93 :h 12])))
         ([MAGIC :tag LI :x 27.2 :y 258 :w 131.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-randompage]
          ([INLINE :tag A]
           ([TEXT :x 27.2 :y 261.75 :w 94 :h 12])))
         ([MAGIC :tag LI :x 27.2 :y 277.5 :w 131.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-sitesupport]
          ([INLINE :tag A]
           ([TEXT :x 27.2 :y 281.25 :w 126 :h 12])))
         ([MAGIC :tag LI :x 27.2 :y 297 :w 131.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-shoplink]
          ([INLINE :tag A]
           ([TEXT :x 27.2 :y 300.75 :w 96 :h 12]))))))
      ([BLOCK :tag DIV :x 19.2 :y 320.5 :w 139.2 :h 125.5 :id p-interaction :class (portal)]
       ([BLOCK :tag H3 :x 19.2 :y 324.5 :w 139.2 :h 20 :id p-interaction-label]
        ([LINE]
         ([TEXT :x 22.2 :y 328.5 :w 68 :h 12])))
       ([BLOCK :tag DIV :x 39.2 :y 344.5 :w 119.2 :h 97.5 :class (body)]
        ([BLOCK :tag UL :x 39.2 :y 344.5 :w 119.2 :h 97.5]
         ([MAGIC :tag LI :x 39.2 :y 344.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-help]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 348.25 :w 28 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 364 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-aboutsite]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 367.75 :w 100 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 383.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-portal]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 387.25 :w 109 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 403 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-recentchanges]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 406.75 :w 101 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 422.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id n-contactpage]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 426.25 :w 85 :h 12]))))))
      ([BLOCK :tag DIV :x 19.2 :y 446 :w 139.2 :h 184 :id p-tb :class (portal)]
       ([BLOCK :tag H3 :x 19.2 :y 450 :w 139.2 :h 20 :id p-tb-label]
        ([LINE]
         ([TEXT :x 22.2 :y 454 :w 31 :h 12])))
       ([BLOCK :tag DIV :x 39.2 :y 470 :w 119.2 :h 156 :class (body)]
        ([BLOCK :tag UL :x 39.2 :y 470 :w 119.2 :h 156]
         ([MAGIC :tag LI :x 39.2 :y 470 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-whatlinkshere]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 473.75 :w 97 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 489.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-recentchangeslinked]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 493.25 :w 105 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 509 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-upload]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 512.75 :w 66 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 528.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-specialpages]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 532.25 :w 88 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 548 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-permalink]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 551.75 :w 94 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 567.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-info]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 571.25 :w 106 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 587 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-wikibase]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 590.75 :w 84 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 606.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-cite]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 610.25 :w 87 :h 12]))))))
      ([BLOCK :tag DIV :x 19.2 :y 630 :w 139.2 :h 86.5 :id p-coll-print_export :class (portal)]
       ([BLOCK :tag H3 :x 19.2 :y 634 :w 139.2 :h 20 :id p-coll-print_export-label]
        ([LINE]
         ([TEXT :x 22.2 :y 638 :w 73 :h 12])))
       ([BLOCK :tag DIV :x 39.2 :y 654 :w 119.2 :h 58.5 :class (body)]
        ([BLOCK :tag UL :x 39.2 :y 654 :w 119.2 :h 58.5]
         ([MAGIC :tag LI :x 39.2 :y 654 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id coll-create_a_book]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 657.75 :w 89 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 673.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id coll-download-as-rdf2latex]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 677.25 :w 108 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 693 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :id t-print]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 696.75 :w 105 :h 12]))))))
      ([BLOCK :tag DIV :x 19.2 :y 716.5 :w 139.2 :h 139 :id p-lang :class (portal)]
       ([BLOCK :tag SPAN :x 144.4 :y 723.5 :w 14 :h 16 :class (uls-settings-trigger)])
       ([BLOCK :tag H3 :x 19.2 :y 720.5 :w 125.2 :h 20 :id p-lang-label]
        ([LINE]
         ([TEXT :x 22.2 :y 724.5 :w 69 :h 12])))
       ([BLOCK :tag DIV :x 39.2 :y 740.5 :w 119.2 :h 111 :class (body)]
        ([BLOCK :tag UL :x 39.2 :y 740.5 :w 119.2 :h 97.5]
         ([MAGIC :tag LI :x 39.2 :y 740.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (interlanguage-link interwiki-de)]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 744.25 :w 52 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 760 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (interlanguage-link interwiki-es)]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 763.75 :w 50 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 779.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (interlanguage-link interwiki-fr)]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 783.25 :w 52 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 799 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (interlanguage-link interwiki-pl)]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 802.75 :w 36 :h 12])))
         ([MAGIC :tag LI :x 39.2 :y 818.5 :w 119.2 :h 19.5 :mt 0 :mr 0 :mb 0 :ml 0 :class (interlanguage-link interwiki-sv)]
          ([INLINE :tag A]
           ([TEXT :x 39.2 :y 822.25 :w 52 :h 12]))))
        ([BLOCK :tag DIV :x 39.2 :y 838 :w 119.2 :h 13.5 :class (after-portlet after-portlet-lang)]
         ([BLOCK :tag SPAN :x 85.4 :y 838 :w 73 :h 13.5 :class (wb-langlinks-edit wb-langlinks-link)]
          ([LINE]
           ([INLINE :tag A :class (wbc-editpage)]
            ([TEXT :x 96.4 :y 838.75 :w 56 :h 12])))))))))
    ([BLOCK :tag DIV :x 176 :y (/ 118515 30) :w 1552 :h 151.65 :id footer]
     ([BLOCK :tag UL :x 196 :y (/ 119115 30) :w 1512 :h 69.45 :id footer-info]
      ([MAGIC :tag LI :x 196 :y (/ 119115 30) :w 1512 :h 26.9 :mt 0 :mr 0 :mb 0 :ml 0 :id footer-info-lastmod]
       ([TEXT :x 196 :y (/ 47741 12) :w 334 :h 11]))
      ([MAGIC :tag LI :x 196 :y (/ 119921 30) :w 1512 :h (/ 1277 30) :mt 0 :mr 0 :mb 0 :ml 0 :id footer-info-copyright]
       ([TEXT :x 196 :y 4005.3 :w 153 :h 11])
       ([INLINE :tag A]
        ([TEXT :x 349 :y 4005.3 :w 282 :h 11]))
       ([TEXT :x 631 :y 4005.3 :w 374 :h 11])
       ([INLINE :tag A]
        ([TEXT :x 1005 :y 4005.3 :w 76 :h 11]))
       ([TEXT :x 1081 :y 4005.3 :w 29 :h 11])
       ([INLINE :tag A]
        ([TEXT :x 1110 :y 4005.3 :w 74 :h 11]))
       ([TEXT :x 1184 :y 4005.3 :w 263 :h 11])
       ([INLINE :tag A]
        ([TEXT :x 1447 :y 4005.3 :w 150 :h 11]))
       ([TEXT :x 1597 :y 4005.3 :w 74 :h 11])
       ([TEXT :x 196 :y 4089 :w 73 :h 11])))
     ([BLOCK :tag UL :x 196 :y (/ 60599 15) #|:w 637.4 :h 33.6|# :id footer-places]
      ([MAGIC :tag LI :x 196 :y (/ 60599 15) :w 76 :h 33.6 :mt 0 :mr 11.2 :mb 0 :ml 0 :id footer-places-privacy]
       ([INLINE :tag A]
        ([TEXT :x 196 :y (/ 121537 30) :w 76 :h 11])))
      ([MAGIC :tag LI :x 283.2 :y (/ 60599 15) :w 88 :h 33.6 :mt 0 :mr 11.2 :mb 0 :ml 0 :id footer-places-about]
       ([INLINE :tag A]
        ([TEXT :x 283.2 :y (/ 121537 30) :w 88 :h 11])))
      ([MAGIC :tag LI :x 382.4 :y (/ 60599 15) :w 67 :h 33.6 :mt 0 :mr 11.2 :mb 0 :ml 0 :id footer-places-disclaimer]
       ([INLINE :tag A]
        ([TEXT :x 382.4 :y (/ 121537 30) :w 67 :h 11])))
      ([MAGIC :tag LI :x 460.6 :y (/ 60599 15) :w 99 :h 33.6 :mt 0 :mr 11.2 :mb 0 :ml 0 :id footer-places-contact]
       ([INLINE :tag A]
        ([TEXT :x 460.6 :y (/ 121537 30) :w 99 :h 11])))
      ([MAGIC :tag LI :x 570.8 :y (/ 60599 15) :w 64 :h 33.6 :mt 0 :mr 11.2 :mb 0 :ml 0 :id footer-places-developers]
       ([INLINE :tag A]
        ([TEXT :x 570.8 :y (/ 121537 30) :w 64 :h 11])))
      ([MAGIC :tag LI :x 646 :y (/ 60599 15) :w 100 :h 33.6 :mt 0 :mr 11.2 :mb 0 :ml 0 :id footer-places-cookiestatement]
       ([INLINE :tag A]
        ([TEXT :x 646 :y (/ 121537 30) :w 100 :h 11])))
      ([MAGIC :tag LI :x 757.2 :y (/ 60599 15) :w 65 :h 33.6 :mt 0 :mr 11.2 :mb 0 :ml 0 :id footer-places-mobileview]
       ([INLINE :tag A :class (noprint stopMobileRedirectToggle)]
        ([TEXT :x 757.2 :y (/ 121537 30) :w 65 :h 11]))))
     ([BLOCK :tag UL :x 1520.8 :y (/ 60599 15) :w 187.2 :h 42.2 :id footer-icons :class (noprint)]
      ([MAGIC :tag LI :x 1526.4 :y (/ 60599 15) :w 88 :h 42.2 :mt 0 :mr 0 :mb 0 :ml 5.6 :id footer-copyrightico]
       ([INLINE :tag A]
        ([INLINE :tag IMG])))
      ([MAGIC :tag LI :x 1620 :y (/ 60599 15) :w 88 :h 42.2 :mt 0 :mr 0 :mb 0 :ml 5.6 :id footer-poweredbyico]
       ([INLINE :tag A]
        ([INLINE :tag IMG]))))
     ([MAGIC :tag DIV :x 196 :y (/ 61232 15) :w 1512 :h 0 :mt 0 :mr 0 :mb 0 :ml 0 :id e10106])))))

(define-problem verify
  #:test (forall (a b)
                 (=>
                  (and
                   (not (= a b))
                   (is-box/text (type a))
                   (is-box/text (type b)))
                  (not (overlaps a b))))
  #:sheet doc-1
  #:documents doc-1)
