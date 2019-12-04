; Firefox is flatly incorrect on these next four (check the ref example)
("bench/css/floats.rkt" floats-rule3-outside-left-002)
("bench/css/floats.rkt" floats-rule3-outside-right-002)
("bench/css/floats.rkt" floats-rule7-outside-left-001)
("bench/css/floats.rkt" floats-rule7-outside-right-001)

; Firefox has a maximum distance left you can go, and this saturates it
("bench/css/text.rkt" text-indent-010)

; Firefox rounds borders to whole pixel widths
("bench/css/borders.rkt" border-bottom-width-014)
("bench/css/borders.rkt" border-bottom-width-036)
("bench/css/borders.rkt" border-bottom-width-047)
("bench/css/borders.rkt" border-left-width-036)
("bench/css/borders.rkt" border-left-width-047)
("bench/css/borders.rkt" border-right-width-036)
("bench/css/borders.rkt" border-right-width-047)
("bench/css/borders.rkt" border-top-width-014)
("bench/css/borders.rkt" border-top-width-036)
("bench/css/borders.rkt" border-top-width-047)

; Firefox is flatly incorrect on this one as well
("bench/css/margin-padding-clear.rkt" margin-collapse-038)
