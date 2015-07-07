#lang racket
(require "../cassius/main.rkt")
        
;; python get_bench.py 'http://homes.cs.washington.edu/~emina/index.html' 'http://homes.cs.washington.edu/~emina/projects.html' 'http://homes.cs.washington.edu/~emina/talks.html'

(define header
"")

;; From http://homes.cs.washington.edu/~emina/index.html

(define doc-a
 '(; 15 flows
  ([PAGE ea0001 :w 1920 :h 985]
   ([BLOCK ea0002 :tag HTML :x 0 :y 0 :w 1920 :h (/ 5434 12) :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
    ([TEXT ea0003 :x 0 :y 0 :w 0 :h 0 :text " "])
    ([BLOCK ea0004 :tag BODY :x 0 :y 0 :w 1920 :h 0 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ea0005 :x 0 :y 0 :w 0 :h 0 :text " "])
     ([BLOCK ea0006 :tag DIV :x 480 :y 0 :w 960 :h 0 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0 :id container]
      ([TEXT ea0007 :x 1440 :y 0 :w 0 :h 0 :text " "])
      ([BLOCK ea0009 :of ea0008])
      ([TEXT ea0059 :x 1440 :y 0 :w 0 :h 0 :text " "])
      ([BLOCK ea0061 :of ea0060])
      ([TEXT ea0080 :x 1440 :y 0 :w 0 :h 0 :text " "])
      ([BLOCK ea0082 :of ea0081])
      ([TEXT ea0126 :x 1440 :y 0 :w 0 :h 0 :text " "])
      ([BLOCK ea0128 :of ea0127])
      ([TEXT ea0133 :x 1440 :y 0 :w 0 :h 0 :text " "]))
     ([TEXT ea0134 :x 1440 :y 0 :w 0 :h 0 :text " "]))))
  ([BLOCK ea0008 :tag DIV :x 490 :y 20 :w 940 :h 31.8 :mt 20 :mr 10 :mb 0 :ml 10 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 1 :bl 0 :id header]
   ([TEXT ea0010 :x 654 :y 20 :w 0 :h 0 :text " "])
   ([BLOCK ea0012 :of ea0011])
   ([TEXT ea0014 :x 654 :y 20 :w 0 :h 0 :text " "])
   ([BLOCK ea0016 :of ea0015])
   ([TEXT ea0058 :x 654 :y 20 :w 0 :h 0 :text " "]))
  ([BLOCK ea0011 :tag H1 :x 490 :y 20 :w 164 :h 30.8 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 2.8 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
   ([TEXT ea0013 :x 490 :y 17.5 :w 164 :h 33 :text "emina torlak"]))
  ([BLOCK ea0015 :tag UL :x (/ 26227 30) :y 24.9 :w (/ 16673 30) :h 21 :mt 4.9 :mr 0 :mb 4.9 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 1 :bb 0 :bl 0]
   ([TEXT ea0017 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ea0018 :tag LI]
    ([BLOCK ea0020 :of ea0019]))
   ([TEXT ea0022 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ea0023 :tag LI]
    ([BLOCK ea0025 :of ea0024]))
   ([TEXT ea0027 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ea0028 :tag LI]
    ([BLOCK ea0030 :of ea0029]))
   ([TEXT ea0032 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ea0033 :tag LI]
    ([BLOCK ea0035 :of ea0034]))
   ([TEXT ea0037 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ea0038 :tag LI]
    ([BLOCK ea0040 :of ea0039]))
   ([TEXT ea0042 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ea0043 :tag LI]
    ([BLOCK ea0045 :of ea0044]))
   ([TEXT ea0047 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ea0048 :tag LI]
    ([BLOCK ea0050 :of ea0049]))
   ([TEXT ea0052 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ea0053 :tag LI]
    ([BLOCK ea0055 :of ea0054]))
   ([TEXT ea0057 :x 1429 :y 24.9 :w 0 :h 0 :text " "]))
  ([BLOCK ea0019 :tag A :x (/ 26227 30) :y 24.9 :w (/ 730 12) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ea0021 :x (/ 10637 12) :y 27.4 :w (/ 449 12) :h 16 :text "about"]))
  ([BLOCK ea0024 :tag A :x (/ 28051 30) :y 24.9 :w (/ 1109 30) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ea0026 :x (/ 28417 30) :y 27.4 :w (/ 407 30) :h 16 :text "cv"]))
  ([BLOCK ea0029 :tag A :x 972 :y 24.9 :w (/ 227 3) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ea0031 :x 984.2 :y 27.4 :w (/ 784 15) :h 16 :text "projects"]))
  ([BLOCK ea0034 :tag A :x (/ 3143 3) :y 24.9 :w 102.8 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ea0036 :x (/ 15898 15) :y 27.4 :w 79.4 :h 16 :text "publications"]))
  ([BLOCK ea0039 :tag A :x (/ 17257 15) :y 24.9 :w (/ 646 12) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ea0041 :x (/ 3488 3) :y 27.4 :w (/ 365 12) :h 16 :text "talks"]))
  ([BLOCK ea0044 :tag A :x 1129 :y 24.9 :w (/ 233 3) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ea0046 :x (/ 36495 30) :y 27.4 :w (/ 814 15) :h 16 :text "teaching"]))
  ([BLOCK ea0049 :tag A :x 1281.95 :y 24.9 :w (/ 236 3) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ea0051 :x 1294.15 :y 27.4 :w (/ 829 15) :h 16 :text "students"]))
  ([BLOCK ea0054 :tag A :x (/ 20409 15) :y 24.9 :w (/ 1026 15) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ea0056 :x (/ 16474 12) :y 27.4 :w 46 :h 16 :text "service"]))
  ([BLOCK ea0060 :tag DIV :x 480 :y 71.8 :w 300 :h 309 :mt 20 :mr 10 :mb 0 :ml 0 :pt 20 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0 :id contact]
   ([TEXT ea0062 :x 480 :y 91.8 :w 0 :h 0 :text " "])
   ([BLOCK ea0063 :tag DIV :x 480 :y 91.8 :w 300 :h 289 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
    ([TEXT ea0064 :x 480 :y 91.8 :w 0 :h 0 :text " "])
    ([BLOCK ea0065 :tag IMG :x 487 :y 91.8 :w 165 :h 212 :mt 0 :mr 0 :mb 0 :ml 7 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0])
    ([TEXT ea0066 :x 480 :y (/ 3646 12) :w 0 :h 0 :text " "])
    ([BLOCK ea0067 :tag SPAN :x 487 :y (/ 3814 12) :w 293 :h 21 :mt 14 :mr 0 :mb 0 :ml 7 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ea0068 :x 487 :y 320.3 :w (/ 1333 12) :h 16 :text "Assistant Professor"]))
    ([TEXT ea0069 :x 480 :y (/ 4066 12) :w 0 :h 0 :text " "])
    ([BLOCK ea0070 :tag SPAN :x 487 :y (/ 4066 12) :w 293 :h 21 :mt 0 :mr 0 :mb 0 :ml 7 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ea0071 :tag A]
      ([TEXT ea0072 :x 487 :y 341.3 :w 190.5 :h 16 :text "Computer Science & Engineering"])))
    ([TEXT ea0073 :x 480 :y (/ 4318 12) :w 0 :h 0 :text " "])
    ([BLOCK ea0074 :tag SPAN :x 487 :y (/ 4318 12) :w 293 :h 21 :mt 0 :mr 0 :mb 0 :ml 7 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ea0075 :tag SPAN]
      ([INLINE ea0076 :tag A]
       ([TEXT ea0077 :x 487 :y 362.3 :w 148 :h 16 :text "University of Washington"]))))
    ([TEXT ea0078 :x 480 :y (/ 4570 12) :w 0 :h 0 :text " "]))
   ([TEXT ea0079 :x 480 :y (/ 4570 12) :w 0 :h 0 :text " "]))
  ([BLOCK ea0081 :tag DIV :x 810 :y 71.8 :w 620 :h 293 :mt 20 :mr 10 :mb 0 :ml 0 :pt 20 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0 :id main]
   ([TEXT ea0083 :x 810 :y 91.8 :w 0 :h 0 :text " "])
   ([BLOCK ea0084 :tag P :x 831 :y 91.8 :w 578 :h 147 :mt 0 :mr 21 :mb 21 :ml 21 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
    ([TEXT ea0085 :x 831 :y 94.3 :w (/ 8331 15) :h 16 :text " I am a computer scientist at the University of Washington, working on tools and "])
    ([TEXT ea0086 :x 831 :y 115.3 :w (/ 6550 12) :h 16 :text "methodologies that help people build better software more easily. My research "])
    ([TEXT ea0087 :x 831 :y 136.3 :w (/ 7971 15) :h 16 :text "focuses on automatic analysis and synthesis of all kinds of software artifacts, "])
    ([TEXT ea0088 :x 831 :y 157.3 :w (/ 419 6) :h 16 :text "including "])
    ([INLINE ea0089 :tag A]
     ([TEXT ea0090 :x (/ 5405 6) :y 157.3 :w (/ 2789 30) :h 16 :text "specifications"]))
    ([TEXT ea0091 :x 993.8 :y 157.3 :w (/ 227 30) :h 16 :text ", "])
    ([INLINE ea0092 :tag A]
     ([TEXT ea0093 :x (/ 30041 30) :y 157.3 :w (/ 1024 15) :h 16 :text "programs"]))
    ([TEXT ea0094 :x (/ 32089 30) :y 157.3 :w (/ 227 30) :h 16 :text ", "])
    ([INLINE ea0095 :tag A]
     ([TEXT ea0096 :x 1077.2 :y 157.3 :w (/ 437 6) :h 16 :text "executions"]))
    ([TEXT ea0097 :x (/ 34501 30) :y 157.3 :w (/ 227 30) :h 16 :text ", "])
    ([INLINE ea0098 :tag A]
     ([TEXT ea0099 :x 1157.6 :y 157.3 :w 59.55 :h 16 :text "test data"]))
    ([TEXT ea0100 :x 1217.15 :y 157.3 :w 38.7 :h 16 :text ", and "])
    ([INLINE ea0101 :tag A]
     ([TEXT ea0102 :x 1255.85 :y 157.3 :w 110.7 :h 16 :text "memory models"]))
    ([TEXT ea0103 :x (/ 20498 15) :y 157.3 :w 39.7 :h 16 :text ". I am "])
    ([TEXT ea0104 :x 831 :y 178.3 :w 153.95 :h 16 :text "currently working on "])
    ([INLINE ea0105 :tag A]
     ([TEXT ea0106 :x 984.95 :y 178.3 :w 50 :h 16 :text "Rosette"]))
    ([TEXT ea0107 :x (/ 15509 15) :y 178.3 :w (/ 799 15) :h 16 :text ", a new "])
    ([INLINE ea0108 :tag I]
     ([TEXT ea0109 :x 1087.2 :y 178.3 :w 247.35 :h 16 :text "solver-aided programming language"]))
    ([TEXT ea0110 :x 1334.55 :y 178.3 :w (/ 389 12) :h 16 :text " that "])
    ([TEXT ea0111 :x 831 :y 199.3 :w 529.7 :h 16 :text "enables programmers to create their own domain-specific tools for program "])
    ([TEXT ea0112 :x 831 :y 220.3 :w (/ 11803 30) :h 16 :text "verification, synthesis, debugging, and angelic execution. "]))
   ([TEXT ea0113 :x 810 :y 259.8 :w 0 :h 0 :text " "])
   ([BLOCK ea0114 :tag P :x 831 :y 259.8 :w 578 :h 84 :mt 0 :mr 21 :mb 21 :ml 21 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
    ([TEXT ea0115 :x 831 :y 262.3 :w (/ 5801 30) :h 16 :text " emina at cs.washington.edu "])
    ([INLINE ea0116 :tag BR])
    ([TEXT ea0117 :x 831 :y 296.3 :w 0 :h 0 :text " "])
    ([INLINE ea0118 :tag A]
     ([TEXT ea0119 :x 831 :y 283.3 :w (/ 416 3) :h 16 :text "Paul G. Allen Center"]))
    ([TEXT ea0120 :x (/ 2909 3) :y 283.3 :w (/ 455 6) :h 16 :text ", Room 596"])
    ([INLINE ea0121 :tag BR])
    ([TEXT ea0122 :x 831 :y 304.3 :w (/ 8243 30) :h 16 :text " AC101 Paul G. Allen Center, Box 352350"])
    ([INLINE ea0123 :tag BR])
    ([TEXT ea0124 :x 831 :y 325.3 :w 287.05 :h 16 :text " 185 Stevens Way, Seattle, WA 98195-2350 "]))
   ([TEXT ea0125 :x 810 :y 364.8 :w 0 :h 0 :text " "]))
  ([BLOCK ea0127 :tag DIV :x 490 :y (/ 4810 12) :w 940 :h 52 :mt 20 :mr 10 :mb 0 :ml 10 :pt 10 :pr 0 :pb 20 :pl 0 :bt 1 :br 0 :bb 0 :bl 0 :id footer]
   ([TEXT ea0129 :x 490 :y (/ 4990 12) :w 196 :h 13 :text " © 2011-present Emina Torlak. Built on the "])
   ([INLINE ea0130 :tag A]
    ([TEXT ea0131 :x 686 :y (/ 4990 12) :w 67 :h 13 :text "Not Just a Grid"]))
   ([TEXT ea0132 :x 753 :y (/ 4990 12) :w (/ 166 3) :h 13 :text " framework. "]))))

;; From http://homes.cs.washington.edu/~emina/projects.html

(define doc-b
 '(; 22 flows
  ([PAGE eb0001 :w 1920 :h 985]
   ([BLOCK eb0002 :tag HTML :x 0 :y 0 :w 1920 :h 842.8 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
    ([TEXT eb0003 :x 0 :y 0 :w 0 :h 0 :text " "])
    ([BLOCK eb0004 :tag BODY :x 0 :y 0 :w 1920 :h 0 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT eb0005 :x 0 :y 0 :w 0 :h 0 :text " "])
     ([BLOCK eb0006 :tag DIV :x 480 :y 0 :w 960 :h 0 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0 :id container]
      ([TEXT eb0007 :x 1440 :y 0 :w 0 :h 0 :text " "])
      ([BLOCK eb0009 :of eb0008])
      ([TEXT eb0059 :x 1440 :y 0 :w 0 :h 0 :text " "])
      ([BLOCK eb0061 :of eb0060])
      ([TEXT eb0070 :x 1440 :y 0 :w 0 :h 0 :text " "]))
     ([TEXT eb0071 :x 1440 :y 0 :w 0 :h 0 :text " "])
     ([BLOCK eb0073 :of eb0072])
     ([TEXT eb0210 :x 1440 :y 0 :w 0 :h 0 :text " "])
     ([BLOCK eb0212 :of eb0211])
     ([TEXT eb0217 :x 1440 :y 0 :w 0 :h 0 :text " "]))))
  ([BLOCK eb0008 :tag DIV :x 490 :y 20 :w 940 :h 31.8 :mt 20 :mr 10 :mb 0 :ml 10 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 1 :bl 0 :id header]
   ([TEXT eb0010 :x 654 :y 20 :w 0 :h 0 :text " "])
   ([BLOCK eb0012 :of eb0011])
   ([TEXT eb0014 :x 654 :y 20 :w 0 :h 0 :text " "])
   ([BLOCK eb0016 :of eb0015])
   ([TEXT eb0058 :x 654 :y 20 :w 0 :h 0 :text " "]))
  ([BLOCK eb0011 :tag H1 :x 490 :y 20 :w 164 :h 30.8 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 2.8 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
   ([TEXT eb0013 :x 490 :y 17.5 :w 164 :h 33 :text "emina torlak"]))
  ([BLOCK eb0015 :tag UL :x (/ 26227 30) :y 24.9 :w (/ 16673 30) :h 21 :mt 4.9 :mr 0 :mb 4.9 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 1 :bb 0 :bl 0]
   ([TEXT eb0017 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE eb0018 :tag LI]
    ([BLOCK eb0020 :of eb0019]))
   ([TEXT eb0022 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE eb0023 :tag LI]
    ([BLOCK eb0025 :of eb0024]))
   ([TEXT eb0027 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE eb0028 :tag LI]
    ([BLOCK eb0030 :of eb0029]))
   ([TEXT eb0032 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE eb0033 :tag LI]
    ([BLOCK eb0035 :of eb0034]))
   ([TEXT eb0037 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE eb0038 :tag LI]
    ([BLOCK eb0040 :of eb0039]))
   ([TEXT eb0042 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE eb0043 :tag LI]
    ([BLOCK eb0045 :of eb0044]))
   ([TEXT eb0047 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE eb0048 :tag LI]
    ([BLOCK eb0050 :of eb0049]))
   ([TEXT eb0052 :x 1429 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE eb0053 :tag LI]
    ([BLOCK eb0055 :of eb0054]))
   ([TEXT eb0057 :x 1429 :y 24.9 :w 0 :h 0 :text " "]))
  ([BLOCK eb0019 :tag A :x (/ 26227 30) :y 24.9 :w (/ 730 12) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT eb0021 :x (/ 10637 12) :y 27.4 :w (/ 449 12) :h 16 :text "about"]))
  ([BLOCK eb0024 :tag A :x (/ 28051 30) :y 24.9 :w (/ 1109 30) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT eb0026 :x (/ 28417 30) :y 27.4 :w (/ 407 30) :h 16 :text "cv"]))
  ([BLOCK eb0029 :tag A :x 972 :y 24.9 :w (/ 227 3) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT eb0031 :x 984.2 :y 27.4 :w (/ 784 15) :h 16 :text "projects"]))
  ([BLOCK eb0034 :tag A :x (/ 3143 3) :y 24.9 :w 102.8 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT eb0036 :x (/ 15898 15) :y 27.4 :w 79.4 :h 16 :text "publications"]))
  ([BLOCK eb0039 :tag A :x (/ 17257 15) :y 24.9 :w (/ 646 12) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT eb0041 :x (/ 3488 3) :y 27.4 :w (/ 365 12) :h 16 :text "talks"]))
  ([BLOCK eb0044 :tag A :x 1129 :y 24.9 :w (/ 233 3) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT eb0046 :x (/ 36495 30) :y 27.4 :w (/ 814 15) :h 16 :text "teaching"]))
  ([BLOCK eb0049 :tag A :x 1281.95 :y 24.9 :w (/ 236 3) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT eb0051 :x 1294.15 :y 27.4 :w (/ 829 15) :h 16 :text "students"]))
  ([BLOCK eb0054 :tag A :x (/ 20409 15) :y 24.9 :w (/ 1026 15) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT eb0056 :x (/ 16474 12) :y 27.4 :w 46 :h 16 :text "service"]))
  ([BLOCK eb0060 :tag DIV :x 1130 :y 71.8 :w 300 :h (/ 2833 12) :mt 20 :mr 10 :mb 0 :ml 10 :pt 20 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0 :id sidebar]
   ([TEXT eb0062 :x 1130 :y 91.8 :w 0 :h 0 :text " "])
   ([INLINE eb0063 :tag A]
    ([TEXT eb0064 :x 1130 :y 91.8 :w 0 :h 0 :text " "])
    ([BLOCK eb0065 :tag IMG :x 1192.5 :y 119.8 :w 175 :h (/ 637 15) :mt 28 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]))
   ([TEXT eb0066 :x 1130 :y (/ 2434 15) :w 0 :h 0 :text " "])
   ([INLINE eb0067 :tag A]
    ([BLOCK eb0068 :tag IMG :x 1237.5 :y (/ 3064 15) :w 85 :h (/ 1554 15) :mt 42 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]))
   ([TEXT eb0069 :x 1130 :y 307.9 :w 0 :h 0 :text " "]))
  ([BLOCK eb0072 :tag DIV :x 490 :y 71.8 :w 620 :h 699 :mt 20 :mr 10 :mb 0 :ml 0 :pt 20 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0 :id main]
   ([TEXT eb0074 :x 490 :y 91.8 :w 0 :h 0 :text " "])
   ([BLOCK eb0075 :tag H2 :x 490 :y 91.8 :w 620 :h 33.6 :mt 0 :mr 0 :mb 8.4 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
    ([TEXT eb0076 :x 490 :y 98.6 :w 61 :h 20 :text "projects"]))
   ([TEXT eb0077 :x 490 :y 133.8 :w 0 :h 0 :text " "])
   ([BLOCK eb0078 :tag DL :x 490 :y 133.8 :w 620 :h 308 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
    ([TEXT eb0079 :x 595 :y 133.8 :w 0 :h 0 :text " "])
    ([BLOCK eb0081 :of eb0080])
    ([TEXT eb0083 :x 595 :y 133.8 :w 0 :h 0 :text " "])
    ([BLOCK eb0084 :tag DD :x 595 :y 133.8 :w 515 :h 126 :mt 0 :mr 0 :mb 7 :ml 105 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT eb0085 :x 595 :y 136.3 :w 502.4 :h 16 :text "A new specification language that aids in the construction of formal and "])
     ([TEXT eb0086 :x 595 :y 157.3 :w (/ 5055 30) :h 16 :text "mechanically checkable "])
     ([INLINE eb0087 :tag I]
      ([TEXT eb0088 :x (/ 22905 30) :y 157.3 :w (/ 1941 15) :h 16 :text "dependability cases"]))
     ([TEXT eb0089 :x 892.9 :y 157.3 :w (/ 4567 30) :h 16 :text ". A dependability case "])
     ([TEXT eb0090 :x 595 :y 178.3 :w 396.875 :h 16 :text "establishes end-to-end safety properties for a system through "])
     ([TEXT eb0091 :x 595 :y 199.3 :w 499.55 :h 16 :text "evidence-based arguments. DCL has been used to reason about safety of "])
     ([TEXT eb0092 :x 595 :y 220.3 :w (/ 392 15) :h 16 :text "the "])
     ([INLINE eb0093 :tag A]
      ([TEXT eb0094 :x (/ 9317 15) :y 220.3 :w (/ 6894 30) :h 16 :text "Clinical Neutron Therapy System"]))
     ([TEXT eb0095 :x (/ 10211 12) :y 220.3 :w 229.35 :h 16 :text " at the University of Washington. "])
     ([INLINE eb0096 :tag BR])
     ([TEXT eb0097 :x 595 :y 241.3 :w (/ 287 30) :h 16 :text " [ "])
     ([INLINE eb0098 :tag A]
      ([TEXT eb0099 :x (/ 18137 30) :y 241.3 :w (/ 1009 15) :h 16 :text "SNAPL'15"]))
     ([TEXT eb0100 :x (/ 4031 6) :y 241.3 :w (/ 287 30) :h 16 :text " ] "]))
    ([TEXT eb0101 :x 595 :y 266.8 :w 0 :h 0 :text " "])
    ([BLOCK eb0103 :of eb0102])
    ([TEXT eb0106 :x 595 :y 266.8 :w 0 :h 0 :text " "])
    ([BLOCK eb0107 :tag DD :x 595 :y 266.8 :w 515 :h 105 :mt 0 :mr 0 :mb 7 :ml 105 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT eb0108 :x 595 :y 269.3 :w 47.7 :h 16 :text "A new "])
     ([INLINE eb0109 :tag I]
      ([TEXT eb0110 :x 642.7 :y 269.3 :w 147.95 :h 16 :text "solver-aided language"]))
     ([TEXT eb0111 :x 790.65 :y 269.3 :w (/ 2819 30) :h 16 :text " that extends "])
     ([INLINE eb0112 :tag A]
      ([TEXT eb0113 :x (/ 13269 15) :y 269.3 :w 45.7 :h 16 :text "Racket"]))
     ([TEXT eb0114 :x 930.3 :y 269.3 :w (/ 365 3) :h 16 :text " with facilities for "])
     ([TEXT eb0115 :x 595 :y 290.3 :w 497.1 :h 16 :text "program synthesis, verification, debugging and angelic execution, using "])
     ([TEXT eb0116 :x 595 :y 311.3 :w (/ 2987 6) :h 16 :text "SAT and SMT solvers. Rosette makes it easy to develop new solver-aided "])
     ([TEXT eb0117 :x 595 :y 332.3 :w 479.55 :h 16 :text "languages for specific domains, by simply writing an interpreter or a "])
     ([TEXT eb0118 :x 595 :y 353.3 :w 67.1 :h 16 :text "library. [ "])
     ([INLINE eb0119 :tag A]
      ([TEXT eb0120 :x 662.1 :y 353.3 :w 76.55 :h 16 :text "Onward'13"]))
     ([TEXT eb0121 :x (/ 2216 3) :y 353.3 :w 16.85 :h 16 :text " | "])
     ([INLINE eb0122 :tag A]
      ([TEXT eb0123 :x (/ 22665 30) :y 353.3 :w 54 :h 16 :text "PLDI'14"]))
     ([TEXT eb0124 :x 808.5 :y 353.3 :w (/ 287 30) :h 16 :text " ] "]))
    ([TEXT eb0125 :x 595 :y 378.8 :w 0 :h 0 :text " "])
    ([BLOCK eb0127 :of eb0126])
    ([TEXT eb0130 :x 595 :y 378.8 :w 0 :h 0 :text " "])
    ([BLOCK eb0131 :tag DD :x 595 :y 378.8 :w 515 :h 63 :mt 0 :mr 0 :mb 7 :ml 105 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT eb0132 :x 595 :y 381.3 :w 504.25 :h 16 :text "An efficient constraint solver for relational logic with many applications, "])
     ([TEXT eb0133 :x 595 :y 402.3 :w 466 :h 16 :text "including design analysis, code checking, test-case generation, and "])
     ([TEXT eb0134 :x 595 :y 423.3 :w (/ 5826 30) :h 16 :text "declarative configuration. [ "])
     ([INLINE eb0135 :tag A]
      ([TEXT eb0136 :x (/ 23677 30) :y 423.3 :w 27.85 :h 16 :text "PhD"]))
     ([TEXT eb0137 :x (/ 12256 15) :y 423.3 :w 16.85 :h 16 :text " | "])
     ([INLINE eb0138 :tag A]
      ([TEXT eb0139 :x (/ 10007 12) :y 423.3 :w (/ 497 12) :h 16 :text "FM'08"]))
     ([TEXT eb0140 :x (/ 2626 3) :y 423.3 :w 16.85 :h 16 :text " | "])
     ([INLINE eb0141 :tag A]
      ([TEXT eb0142 :x (/ 10706 12) :y 423.3 :w (/ 1009 15) :h 16 :text "TACAS'07"]))
     ([TEXT eb0143 :x 959.45 :y 423.3 :w (/ 287 30) :h 16 :text " ]"]))
    ([TEXT eb0144 :x 490 :y 448.8 :w 0 :h 0 :text " "]))
   ([TEXT eb0145 :x 490 :y 448.8 :w 0 :h 0 :text " "])
   ([BLOCK eb0146 :tag H2 :x 490 :y 448.8 :w 620 :h 33.6 :mt 0 :mr 0 :mb 8.4 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
    ([TEXT eb0147 :x 490 :y 455.6 :w 97.5 :h 20 :text "past projects"]))
   ([TEXT eb0148 :x 490 :y 490.8 :w 0 :h 0 :text " "])
   ([BLOCK eb0149 :tag DL :x 490 :y 490.8 :w 620 :h 273 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
    ([TEXT eb0150 :x 595 :y 490.8 :w 0 :h 0 :text " "])
    ([BLOCK eb0152 :of eb0151])
    ([TEXT eb0154 :x 595 :y 490.8 :w 0 :h 0 :text " "])
    ([BLOCK eb0155 :tag DD :x 595 :y 490.8 :w 515 :h 105 :mt 0 :mr 0 :mb 7 :ml 105 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT eb0156 :x 595 :y 493.3 :w 514.7 :h 16 :text "A language and a solver for specifying and instantiating multidimensional "])
     ([TEXT eb0157 :x 595 :y 514.3 :w (/ 2807 6) :h 16 :text "data models. Given a set of model constraints and a set of statistical "])
     ([TEXT eb0158 :x 595 :y 535.3 :w 491.4 :h 16 :text "constraints, TestBlox produces a large sample database that satisfies (a "])
     ([TEXT eb0159 :x 595 :y 556.3 :w 449.7 :h 16 :text "maximal subset of) the model, and that has the desired statistical "])
     ([TEXT eb0160 :x 595 :y 577.3 :w (/ 2699 30) :h 16 :text "properties. [ "])
     ([INLINE eb0161 :tag A]
      ([TEXT eb0162 :x (/ 20549 30) :y 577.3 :w 45.7 :h 16 :text "FSE'12"]))
     ([TEXT eb0163 :x (/ 2192 3) :y 577.3 :w 16.85 :h 16 :text " | "])
     ([INLINE eb0164 :tag A]
      ([TEXT eb0165 :x (/ 22425 30) :y 577.3 :w (/ 1763 15) :h 16 :text "Technical Report"]))
     ([TEXT eb0166 :x 865.05 :y 577.3 :w (/ 287 30) :h 16 :text " ]"]))
    ([TEXT eb0167 :x 595 :y 602.8 :w 0 :h 0 :text " "])
    ([BLOCK eb0169 :of eb0168])
    ([TEXT eb0171 :x 595 :y 602.8 :w 0 :h 0 :text " "])
    ([BLOCK eb0172 :tag DD :x 595 :y 602.8 :w 515 :h 42 :mt 0 :mr 0 :mb 7 :ml 105 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT eb0173 :x 595 :y 605.3 :w 504.1 :h 16 :text "A debugging tool that uses an angelic oracle, implemented by a symbolic "])
     ([TEXT eb0174 :x 595 :y 626.3 :w (/ 6092 15) :h 16 :text "execution engine, to identify likely causes of test failures. [ "])
     ([INLINE eb0175 :tag A]
      ([TEXT eb0176 :x (/ 15017 15) :y 626.3 :w 53 :h 16 :text "ICSE'11"]))
     ([TEXT eb0177 :x 1053.1 :y 626.3 :w (/ 287 30) :h 16 :text " ]"]))
    ([TEXT eb0178 :x 595 :y 651.8 :w 0 :h 0 :text " "])
    ([BLOCK eb0180 :of eb0179])
    ([TEXT eb0183 :x 595 :y 651.8 :w 0 :h 0 :text " "])
    ([BLOCK eb0184 :tag DD :x 595 :y 651.8 :w 515 :h 63 :mt 0 :mr 0 :mb 7 :ml 105 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT eb0185 :x 595 :y 654.3 :w 508.55 :h 16 :text "A SAT-based framework for checking axiomatic specifications of memory "])
     ([TEXT eb0186 :x 595 :y 675.3 :w 414 :h 16 :text "models. MemSAT is the first tool to automatically check the "])
     ([INLINE eb0187 :tag A]
      ([TEXT eb0188 :x 1009 :y 675.3 :w 92.1 :h 16 :text "Java Memory "])
      ([TEXT eb0189 :x 595 :y 696.3 :w (/ 509 12) :h 16 :text "Model"]))
     ([TEXT eb0190 :x (/ 7649 12) :y 696.3 :w (/ 4545 30) :h 16 :text " against its published "])
     ([INLINE eb0191 :tag A]
      ([TEXT eb0192 :x (/ 11834 15) :y 696.3 :w 96.25 :h 16 :text "causality tests"]))
     ([TEXT eb0193 :x (/ 10622 12) :y 696.3 :w (/ 272 15) :h 16 :text ". [ "])
     ([INLINE eb0194 :tag A]
      ([TEXT eb0195 :x 903.3 :y 696.3 :w 54 :h 16 :text "PLDI'10"]))
     ([TEXT eb0196 :x 956.3 :y 696.3 :w (/ 287 30) :h 16 :text " ]"]))
    ([TEXT eb0197 :x 595 :y 721.8 :w 0 :h 0 :text " "])
    ([BLOCK eb0199 :of eb0198])
    ([TEXT eb0201 :x 595 :y 721.8 :w 0 :h 0 :text " "])
    ([BLOCK eb0202 :tag DD :x 595 :y 721.8 :w 515 :h 42 :mt 0 :mr 0 :mb 7 :ml 105 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT eb0203 :x 595 :y 724.3 :w 511.25 :h 16 :text "An efficient tool for finding resource leaks in Java programs, which scales "])
     ([TEXT eb0204 :x 595 :y 745.3 :w (/ 2971 15) :h 16 :text "to millions of lines of code. [ "])
     ([INLINE eb0205 :tag A]
      ([TEXT eb0206 :x (/ 11896 15) :y 745.3 :w 53 :h 16 :text "ICSE'10"]))
     ([TEXT eb0207 :x 845.05 :y 745.3 :w (/ 287 30) :h 16 :text " ]"]))
    ([TEXT eb0208 :x 490 :y 770.8 :w 0 :h 0 :text " "]))
   ([TEXT eb0209 :x 490 :y 770.8 :w 0 :h 0 :text " "]))
  ([BLOCK eb0080 :tag DT :x 511 :y 133.8 :w 70 :h 21 :mt 0 :mr 14 :mb 0 :ml 21 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
   ([TEXT eb0082 :x 511 :y 136.3 :w 29 :h 16 :text "DCL"]))
  ([BLOCK eb0102 :tag DT :x 511 :y 266.8 :w 70 :h 21 :mt 0 :mr 14 :mb 0 :ml 21 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
   ([INLINE eb0104 :tag A]
    ([TEXT eb0105 :x 511 :y 269.3 :w 54 :h 16 :text "Rosette"])))
  ([BLOCK eb0126 :tag DT :x 511 :y 378.8 :w 70 :h 21 :mt 0 :mr 14 :mb 0 :ml 21 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
   ([INLINE eb0128 :tag A]
    ([TEXT eb0129 :x 511 :y 381.3 :w 55 :h 16 :text "Kodkod"])))
  ([BLOCK eb0151 :tag DT :x 511 :y 490.8 :w 70 :h 21 :mt 0 :mr 14 :mb 0 :ml 21 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
   ([TEXT eb0153 :x 511 :y 493.3 :w 62 :h 16 :text "TestBlox"]))
  ([BLOCK eb0168 :tag DT :x 511 :y 602.8 :w 70 :h 21 :mt 0 :mr 14 :mb 0 :ml 21 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
   ([TEXT eb0170 :x 511 :y 605.3 :w 63 :h 16 :text "Angelina"]))
  ([BLOCK eb0179 :tag DT :x 511 :y 651.8 :w 70 :h 21 :mt 0 :mr 14 :mb 0 :ml 21 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
   ([INLINE eb0181 :tag A]
    ([TEXT eb0182 :x 511 :y 654.3 :w 63 :h 16 :text "MemSAT"])))
  ([BLOCK eb0198 :tag DT :x 511 :y 721.8 :w 70 :h 21 :mt 0 :mr 14 :mb 0 :ml 21 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
   ([TEXT eb0200 :x 511 :y 724.3 :w 55 :h 16 :text "Tracker"]))
  ([BLOCK eb0211 :tag DIV :x 10 :y 790.8 :w 940 :h 52 :mt 20 :mr 10 :mb 0 :ml 10 :pt 10 :pr 0 :pb 20 :pl 0 :bt 1 :br 0 :bb 0 :bl 0 :id footer]
   ([TEXT eb0213 :x 10 :y 805.8 :w 196 :h 13 :text " © 2011-present Emina Torlak. Built on the "])
   ([INLINE eb0214 :tag A]
    ([TEXT eb0215 :x 206 :y 805.8 :w 67 :h 13 :text "Not Just a Grid"]))
   ([TEXT eb0216 :x 273 :y 805.8 :w (/ 166 3) :h 13 :text " framework. "]))))

;; From http://homes.cs.washington.edu/~emina/talks.html

(define doc-c
 '(; 15 flows
  ([PAGE ec0001 :w 1920 :h 985]
   ([BLOCK ec0002 :tag HTML :x 0 :y 0 :w 1907 :h 1695.4 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
    ([TEXT ec0003 :x 0 :y 0 :w 0 :h 0 :text " "])
    ([BLOCK ec0004 :tag BODY :x 0 :y 0 :w 1907 :h 0 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0005 :x 0 :y 0 :w 0 :h 0 :text " "])
     ([BLOCK ec0006 :tag DIV :x 473.5 :y 0 :w 960 :h 0 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0 :id container]
      ([TEXT ec0007 :x 1433.5 :y 0 :w 0 :h 0 :text " "])
      ([BLOCK ec0009 :of ec0008])
      ([TEXT ec0059 :x 1433.5 :y 0 :w 0 :h 0 :text " "])
      ([BLOCK ec0061 :of ec0060])
      ([TEXT ec0063 :x 1433.5 :y 0 :w 0 :h 0 :text " "])
      ([BLOCK ec0065 :of ec0064])
      ([TEXT ec0340 :x 1433.5 :y 0 :w 0 :h 0 :text " "])
      ([BLOCK ec0342 :of ec0341])
      ([TEXT ec0347 :x 1433.5 :y 0 :w 0 :h 0 :text " "])))))
  ([BLOCK ec0008 :tag DIV :x 483.5 :y 20 :w 940 :h 31.8 :mt 20 :mr 10 :mb 0 :ml 10 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 1 :bl 0 :id header]
   ([TEXT ec0010 :x 647.5 :y 20 :w 0 :h 0 :text " "])
   ([BLOCK ec0012 :of ec0011])
   ([TEXT ec0014 :x 647.5 :y 20 :w 0 :h 0 :text " "])
   ([BLOCK ec0016 :of ec0015])
   ([TEXT ec0058 :x 647.5 :y 20 :w 0 :h 0 :text " "]))
  ([BLOCK ec0011 :tag H1 :x 483.5 :y 20 :w 164 :h 30.8 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 2.8 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
   ([TEXT ec0013 :x 483.5 :y 17.5 :w 164 :h 33 :text "emina torlak"]))
  ([BLOCK ec0015 :tag UL :x 813.5 :y 24.9 :w (/ 16673 30) :h 21 :mt 4.9 :mr 0 :mb 4.9 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 1 :bb 0 :bl 0]
   ([TEXT ec0017 :x 1422.5 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ec0018 :tag LI]
    ([BLOCK ec0020 :of ec0019]))
   ([TEXT ec0022 :x 1422.5 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ec0023 :tag LI]
    ([BLOCK ec0025 :of ec0024]))
   ([TEXT ec0027 :x 1422.5 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ec0028 :tag LI]
    ([BLOCK ec0030 :of ec0029]))
   ([TEXT ec0032 :x 1422.5 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ec0033 :tag LI]
    ([BLOCK ec0035 :of ec0034]))
   ([TEXT ec0037 :x 1422.5 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ec0038 :tag LI]
    ([BLOCK ec0040 :of ec0039]))
   ([TEXT ec0042 :x 1422.5 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ec0043 :tag LI]
    ([BLOCK ec0045 :of ec0044]))
   ([TEXT ec0047 :x 1422.5 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ec0048 :tag LI]
    ([BLOCK ec0050 :of ec0049]))
   ([TEXT ec0052 :x 1422.5 :y 24.9 :w 0 :h 0 :text " "])
   ([INLINE ec0053 :tag LI]
    ([BLOCK ec0055 :of ec0054]))
   ([TEXT ec0057 :x 1422.5 :y 24.9 :w 0 :h 0 :text " "]))
  ([BLOCK ec0019 :tag A :x 813.5 :y 24.9 :w (/ 730 12) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ec0021 :x (/ 10559 12) :y 27.4 :w (/ 449 12) :h 16 :text "about"]))
  ([BLOCK ec0024 :tag A :x (/ 13928 15) :y 24.9 :w (/ 1109 30) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ec0026 :x (/ 14111 15) :y 27.4 :w (/ 407 30) :h 16 :text "cv"]))
  ([BLOCK ec0029 :tag A :x 965.5 :y 24.9 :w (/ 227 3) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ec0031 :x 977.7 :y 27.4 :w (/ 784 15) :h 16 :text "projects"]))
  ([BLOCK ec0034 :tag A :x (/ 6247 6) :y 24.9 :w 102.8 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ec0036 :x (/ 31601 30) :y 27.4 :w 79.4 :h 16 :text "publications"]))
  ([BLOCK ec0039 :tag A :x (/ 34319 30) :y 24.9 :w (/ 646 12) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ec0041 :x (/ 6937 6) :y 27.4 :w (/ 365 12) :h 16 :text "talks"]))
  ([BLOCK ec0044 :tag A :x (/ 35933 30) :y 24.9 :w (/ 233 3) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ec0046 :x 1230 :y 27.4 :w (/ 814 15) :h 16 :text "teaching"]))
  ([BLOCK ec0049 :tag A :x 1275.45 :y 24.9 :w (/ 236 3) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ec0051 :x 1287.65 :y 27.4 :w (/ 829 15) :h 16 :text "students"]))
  ([BLOCK ec0054 :tag A :x 1354.1 :y 24.9 :w (/ 1026 15) :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 3.5 :pr 11.2 :pb 3.5 :pl 11.2 :bt 0 :br 0 :bb 0 :bl 1]
   ([TEXT ec0056 :x 1366.3 :y 27.4 :w 46 :h 16 :text "service"]))
  ([BLOCK ec0060 :tag DIV :x 1203.5 :y 71.8 :w 220 :h 20 :mt 20 :mr 10 :mb 0 :ml 10 :pt 20 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0 :id sidebar]
   ([TEXT ec0062 :x 1203.5 :y 91.8 :w 0 :h 0 :text " "]))
  ([BLOCK ec0064 :tag DIV :x 483.5 :y 71.8 :w 700 :h 1551.6 :mt 20 :mr 10 :mb 0 :ml 0 :pt 20 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0 :id main]
   ([TEXT ec0066 :x 483.5 :y 91.8 :w 0 :h 0 :text " "])
   ([BLOCK ec0067 :tag H2 :x 483.5 :y 91.8 :w 700 :h 33.6 :mt 0 :mr 0 :mb 8.4 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
    ([INLINE ec0068 :tag A]
     ([TEXT ec0069 :x 483.5 :y 98.6 :w 310 :h 20 :text "conference talks, seminars, and lectures"])))
   ([TEXT ec0070 :x 483.5 :y 133.8 :w 0 :h 0 :text " "])
   ([BLOCK ec0071 :tag DL :x 497.5 :y 139.4 :w 686 :h 1463 :mt 7 :mr 0 :mb 21 :ml 14 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
    ([TEXT ec0072 :x 497.5 :y 139.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0073 :tag DT :x 483.5 :y 139.4 :w 700 :h 21 :mt 14 :mr 0 :mb 0 :ml -14 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0074 :x 483.5 :y 141.9 :w (/ 19095 30) :h 16 :text "A Lightweight Dependability Case Language for Checking End-to-End Safety Properties"]))
    ([TEXT ec0075 :x 497.5 :y 160.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0076 :tag DD :x 497.5 :y 160.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0077 :tag A]
      ([TEXT ec0078 :x 497.5 :y 162.9 :w 176.8 :h 16 :text "56th IFIP WG 2.3 meeting"]))
     ([TEXT ec0079 :x 674.3 :y 162.9 :w (/ 5441 30) :h 16 :text ", Invited Talk, March 2015"]))
    ([TEXT ec0080 :x 497.5 :y 181.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0081 :tag DT :x 483.5 :y 195.4 :w 700 :h 21 :mt 14 :mr 0 :mb 0 :ml -14 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0082 :x 483.5 :y 197.9 :w (/ 8041 12) :h 16 :text "Programming for Everyone: Languages That Automate Coding, Verification, and Debugging"]))
    ([TEXT ec0083 :x 497.5 :y 216.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0084 :tag DD :x 497.5 :y 216.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0085 :tag A]
      ([TEXT ec0086 :x 497.5 :y 218.9 :w 97.4 :h 16 :text "TTI/Vanguard"]))
     ([TEXT ec0087 :x 594.9 :y 218.9 :w (/ 227 30) :h 16 :text ", "])
     ([INLINE ec0088 :tag A]
      ([TEXT ec0089 :x (/ 9037 15) :y 218.9 :w (/ 2569 12) :h 16 :text "Reprogramming Programming"]))
     ([TEXT ec0090 :x 816.55 :y 218.9 :w (/ 1793 15) :h 16 :text ", September 2014"]))
    ([TEXT ec0091 :x 497.5 :y 237.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0092 :tag DT :x 483.5 :y 251.4 :w 700 :h 21 :mt 14 :mr 0 :mb 0 :ml -14 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0093 :x 483.5 :y 253.9 :w 596.25 :h 16 :text "Programming for Everyone: From Solvers to Solver-Aided Languages and Beyond"]))
    ([TEXT ec0094 :x 497.5 :y 272.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0095 :tag DD :x 497.5 :y 272.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0096 :x 497.5 :y 274.9 :w 406.15 :h 16 :text "Stanford University, Stanford Software Seminar, July 2014"]))
    ([TEXT ec0097 :x 497.5 :y 293.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0098 :tag DD :x 497.5 :y 293.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0099 :tag A]
      ([TEXT ec0100 :x 497.5 :y 295.9 :w (/ 4794 15) :h 16 :text "Fourth Summer School on Formal Techniques"]))
     ([TEXT ec0101 :x 817.1 :y 295.9 :w 188.65 :h 16 :text ", Invited Lecture, May 2014"]))
    ([TEXT ec0102 :x 497.5 :y 314.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0103 :tag DD :x 497.5 :y 314.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0104 :x 497.5 :y 316.9 :w 370.45 :h 16 :text "University of Washington, Invited Seminar, May 2014"]))
    ([TEXT ec0105 :x 497.5 :y 335.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0106 :tag DD :x 497.5 :y 335.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0107 :x 497.5 :y 337.9 :w 342.6 :h 16 :text "Samsung Electronics, Invited Seminar, April 2014"]))
    ([TEXT ec0108 :x 497.5 :y 356.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0109 :tag DD :x 497.5 :y 356.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0110 :x 497.5 :y 358.9 :w 433.85 :h 16 :text "University of Texas at Austin, ECE, Invited Seminar, April 2014"]))
    ([TEXT ec0111 :x 497.5 :y 377.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0112 :tag DD :x 497.5 :y 377.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0113 :x 497.5 :y 379.9 :w (/ 4603 12) :h 16 :text "University of Pennsylvania, Invited Seminar, April 2014"]))
    ([TEXT ec0114 :x 497.5 :y 398.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0115 :tag DD :x 497.5 :y 398.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0116 :x 497.5 :y 400.9 :w 350.9 :h 16 :text "Princeton University, Invited Seminar, March 2014"]))
    ([TEXT ec0117 :x 497.5 :y 419.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0118 :tag DD :x 497.5 :y 419.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0119 :x 497.5 :y 421.9 :w (/ 13187 30) :h 16 :text "University of Southern California, Invited Seminar, March 2014"]))
    ([TEXT ec0120 :x 497.5 :y 440.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0121 :tag DD :x 497.5 :y 440.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0122 :x 497.5 :y 442.9 :w (/ 6223 15) :h 16 :text "Microsoft Research, Redmond, Invited Seminar, March 2014"]))
    ([TEXT ec0123 :x 497.5 :y 461.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0124 :tag DD :x 497.5 :y 461.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0125 :x 497.5 :y 463.9 :w 436 :h 16 :text "University of Wisconsin-Madison, Invited Seminar, March 2014"]))
    ([TEXT ec0126 :x 497.5 :y 482.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0127 :tag DD :x 497.5 :y 482.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0128 :x 497.5 :y 484.9 :w 354.9 :h 16 :text "Purdue University, Invited Seminar, February 2014"]))
    ([TEXT ec0129 :x 497.5 :y 503.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0130 :tag DD :x 497.5 :y 503.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0131 :x 497.5 :y 505.9 :w 457.7 :h 16 :text "University of California, Berkeley, Invited Seminar, February 2014"]))
    ([TEXT ec0132 :x 497.5 :y 524.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0133 :tag DD :x 497.5 :y 524.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0134 :x 497.5 :y 526.9 :w (/ 4759 12) :h 16 :text "Northeastern University, Invited Seminar, February 2014"]))
    ([TEXT ec0135 :x 497.5 :y 545.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0136 :tag DD :x 497.5 :y 545.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0137 :x 497.5 :y 547.9 :w 452.85 :h 16 :text "IBM T. J. Watson Research Center, Invited Seminar, January 2014"]))
    ([TEXT ec0138 :x 497.5 :y 566.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0139 :tag DD :x 497.5 :y 566.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0140 :x 497.5 :y 568.9 :w (/ 7054 15) :h 16 :text "University of California, Los Angeles, Invited Seminar, January 2014"]))
    ([TEXT ec0141 :x 497.5 :y 587.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0142 :tag DT :x 483.5 :y 601.4 :w 700 :h 21 :mt 14 :mr 0 :mb 0 :ml -14 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0143 :x 483.5 :y 603.9 :w (/ 3251 6) :h 16 :text "A Lightweight Symbolic Virtual Machine for Solver-Aided Host Languages"]))
    ([TEXT ec0144 :x 497.5 :y 622.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0145 :tag DD :x 497.5 :y 622.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0146 :tag A]
      ([TEXT ec0147 :x 497.5 :y 624.9 :w 54 :h 16 :text "PLDI'14"]))
     ([TEXT ec0148 :x (/ 16515 30) :y 624.9 :w (/ 2939 15) :h 16 :text ", Conference Talk, June 2014"]))
    ([TEXT ec0149 :x 497.5 :y 643.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0150 :tag DD :x 497.5 :y 643.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0151 :tag A]
      ([TEXT ec0152 :x 497.5 :y 645.9 :w 176.8 :h 16 :text "54th IFIP WG 2.4 meeting"]))
     ([TEXT ec0153 :x 674.3 :y 645.9 :w (/ 6036 30) :h 16 :text ", Invited Talk, February 2014"]))
    ([TEXT ec0154 :x 497.5 :y 664.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0155 :tag DT :x 483.5 :y 678.4 :w 700 :h 21 :mt 14 :mr 0 :mb 0 :ml -14 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0156 :x 483.5 :y 680.9 :w (/ 4082 12) :h 16 :text "Growing Solver-Aided Languages with Rosette"]))
    ([TEXT ec0157 :x 497.5 :y 699.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0158 :tag DD :x 497.5 :y 699.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0159 :x 497.5 :y 701.9 :w 342.9 :h 16 :text "Kestrel Institute, Invited Seminar, December 2013"]))
    ([TEXT ec0160 :x 497.5 :y 720.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0161 :tag DD :x 497.5 :y 720.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0162 :x 497.5 :y 722.9 :w 410 :h 16 :text "Viewpoints Research Institute, Invited Seminar, December 2013"]))
    ([TEXT ec0163 :x 497.5 :y 741.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0164 :tag DD :x 497.5 :y 741.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0165 :tag A]
      ([TEXT ec0166 :x 497.5 :y 743.9 :w 76.55 :h 16 :text "Onward'13"]))
     ([TEXT ec0167 :x 574.05 :y 743.9 :w (/ 7009 30) :h 16 :text ", Conference Talk, October 2013 [ "])
     ([INLINE ec0168 :tag A]
      ([TEXT ec0169 :x 807.7 :y 743.9 :w 37.7 :h 16 :text "slides"]))
     ([TEXT ec0170 :x (/ 12681 15) :y 743.9 :w (/ 287 30) :h 16 :text " ]"]))
    ([TEXT ec0171 :x 497.5 :y 762.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0172 :tag DD :x 497.5 :y 762.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0173 :tag A]
      ([TEXT ec0174 :x 497.5 :y 764.9 :w 176.8 :h 16 :text "54th IFIP WG 2.3 meeting"]))
     ([TEXT ec0175 :x 674.3 :y 764.9 :w (/ 2005 12) :h 16 :text ", Invited Talk, June 2013"]))
    ([TEXT ec0176 :x 497.5 :y 783.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0177 :tag DD :x 497.5 :y 783.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0178 :x 497.5 :y 785.9 :w (/ 5501 15) :h 16 :text "Northeastern University, Invited Seminar, April 2013"]))
    ([TEXT ec0179 :x 497.5 :y 804.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0180 :tag DD :x 497.5 :y 804.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0181 :tag A]
      ([TEXT ec0182 :x 497.5 :y 806.9 :w (/ 5077 30) :h 16 :text "Dagstuhl Seminar 13061"]))
     ([TEXT ec0183 :x (/ 10001 15) :y 806.9 :w (/ 6036 30) :h 16 :text ", Invited Talk, February 2013"]))
    ([TEXT ec0184 :x 497.5 :y 825.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0185 :tag DT :x 483.5 :y 839.4 :w 700 :h 21 :mt 14 :mr 0 :mb 0 :ml -14 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0186 :x 483.5 :y 841.9 :w 345.75 :h 16 :text "Synthesizing Programs with Constraint Solvers"]))
    ([TEXT ec0187 :x 497.5 :y 860.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0188 :tag DD :x 497.5 :y 860.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0189 :tag A]
      ([TEXT ec0190 :x 497.5 :y 862.9 :w (/ 503 3) :h 16 :text "ExCAPE Summer School"]))
     ([TEXT ec0191 :x (/ 3991 6) :y 862.9 :w (/ 6113 30) :h 16 :text ", Invited Lecture Series (with "])
     ([INLINE ec0192 :tag A]
      ([TEXT ec0193 :x 868.95 :y 862.9 :w 104.25 :h 16 :text "Rastislav Bodik"]))
     ([TEXT ec0194 :x 973.2 :y 862.9 :w 81.4 :h 16 :text "), June 2013"]))
    ([TEXT ec0195 :x 497.5 :y 881.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0196 :tag DD :x 497.5 :y 881.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0197 :tag A]
      ([TEXT ec0198 :x 497.5 :y 883.9 :w 48.7 :h 16 :text "CAV'12"]))
     ([TEXT ec0199 :x 546.2 :y 883.9 :w (/ 1945 12) :h 16 :text ", Invited Tutorial (with "])
     ([INLINE ec0200 :tag A]
      ([TEXT ec0201 :x 664 :y 883.9 :w 104.25 :h 16 :text "Rastislav Bodik"]))
     ([TEXT ec0202 :x (/ 12188 15) :y 883.9 :w 91.25 :h 16 :text "), July 2012 [ "])
     ([INLINE ec0203 :tag A]
      ([TEXT ec0204 :x (/ 27113 30) :y 883.9 :w 26.85 :h 16 :text "PDF"]))
     ([TEXT ec0205 :x (/ 27919 30) :y 883.9 :w 16.85 :h 16 :text " | "])
     ([INLINE ec0206 :tag A]
      ([TEXT ec0207 :x (/ 28425 30) :y 883.9 :w (/ 527 15) :h 16 :text "PPTX"]))
     ([TEXT ec0208 :x (/ 14739 15) :y 883.9 :w 16.85 :h 16 :text " | "])
     ([INLINE ec0209 :tag A]
      ([TEXT ec0210 :x (/ 14992 15) :y 883.9 :w (/ 431 6) :h 16 :text "screencast"]))
     ([TEXT ec0211 :x 1071.3 :y 883.9 :w (/ 287 30) :h 16 :text " ]"]))
    ([TEXT ec0212 :x 497.5 :y 902.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0213 :tag DT :x 483.5 :y 916.4 :w 700 :h 42 :mt 14 :mr 0 :mb 0 :ml -14 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0214 :x 483.5 :y 918.9 :w (/ 19901 30) :h 16 :text "Programming with Constraint Solvers: Toward a Shared Infrastructure for Code Checking, "])
     ([TEXT ec0215 :x 483.5 :y 939.9 :w (/ 3938 12) :h 16 :text "Angelic Execution, Debugging, and Synthesis"]))
    ([TEXT ec0216 :x 497.5 :y 958.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0217 :tag DD :x 497.5 :y 958.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0218 :x 497.5 :y 960.9 :w 225.35 :h 16 :text "Georgia Institute of Technology, "])
     ([INLINE ec0219 :tag A]
      ([TEXT ec0220 :x 722.85 :y 960.9 :w 111.25 :h 16 :text "Invited Seminar"]))
     ([TEXT ec0221 :x 834.1 :y 960.9 :w 117.25 :h 16 :text ", November 2012"]))
    ([TEXT ec0222 :x 497.5 :y 979.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0223 :tag DD :x 497.5 :y 979.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0224 :x 497.5 :y 981.9 :w 329.3 :h 16 :text "SRI International, Invited Talk, September 2012"]))
    ([TEXT ec0225 :x 497.5 :y 1000.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0226 :tag DD :x 497.5 :y 1000.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0227 :tag A]
      ([TEXT ec0228 :x 497.5 :y 1002.9 :w 74.55 :h 16 :text "BOOGIE'12"]))
     ([TEXT ec0229 :x 572.05 :y 1002.9 :w (/ 2654 15) :h 16 :text ", Invited Talk, July 2012 [ "])
     ([INLINE ec0230 :tag A]
      ([TEXT ec0231 :x 762 :y 1002.9 :w 37.7 :h 16 :text "slides"]))
     ([TEXT ec0232 :x 786.7 :y 1002.9 :w (/ 287 30) :h 16 :text " ]"]))
    ([TEXT ec0233 :x 497.5 :y 1021.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0234 :tag DT :x 483.5 :y 1035.4 :w 700 :h 21 :mt 14 :mr 0 :mb 0 :ml -14 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0235 :x 483.5 :y 1037.9 :w (/ 13633 30) :h 16 :text "Scalable Test Data Generation from Multidimensional Models"]))
    ([TEXT ec0236 :x 497.5 :y 1056.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0237 :tag DD :x 497.5 :y 1056.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0238 :tag A]
      ([TEXT ec0239 :x 497.5 :y 1058.9 :w 45.7 :h 16 :text "FSE'12"]))
     ([TEXT ec0240 :x 543.2 :y 1058.9 :w (/ 3011 12) :h 16 :text ", Conference Talk, November 2012 [ "])
     ([INLINE ec0241 :tag A]
      ([TEXT ec0242 :x 794.1 :y 1058.9 :w 37.7 :h 16 :text "slides"]))
     ([TEXT ec0243 :x (/ 9982 12) :y 1058.9 :w (/ 287 30) :h 16 :text " ]"]))
    ([TEXT ec0244 :x 497.5 :y 1077.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0245 :tag DD :x 497.5 :y 1077.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0246 :tag A]
      ([TEXT ec0247 :x 497.5 :y 1079.9 :w 180.8 :h 16 :text "52nd IFIP WG 2.4 meeting"]))
     ([TEXT ec0248 :x 678.3 :y 1079.9 :w 165.8 :h 16 :text ", Invited Talk, May 2012"]))
    ([TEXT ec0249 :x 497.5 :y 1098.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0250 :tag DD :x 497.5 :y 1098.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0251 :x 497.5 :y 1100.9 :w (/ 3722 12) :h 16 :text "Berkeley OSQP Retreat, Short Talk, May 2011"]))
    ([TEXT ec0252 :x 497.5 :y 1119.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0253 :tag DT :x 483.5 :y 1133.4 :w 700 :h 21 :mt 14 :mr 0 :mb 0 :ml -14 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0254 :x 483.5 :y 1135.9 :w (/ 3293 6) :h 16 :text "Kodkod by Example: Code Checking, Data Repair, Debugging and Synthesis"]))
    ([TEXT ec0255 :x 497.5 :y 1154.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0256 :tag DD :x 497.5 :y 1154.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0257 :tag A]
      ([TEXT ec0258 :x 497.5 :y 1156.9 :w (/ 5077 30) :h 16 :text "Dagstuhl Seminar 12152"]))
     ([TEXT ec0259 :x (/ 10001 15) :y 1156.9 :w 211.35 :h 16 :text ", Invited Tutorial, April 2012 [ "])
     ([INLINE ec0260 :tag A]
      ([TEXT ec0261 :x (/ 10537 12) :y 1156.9 :w 37.7 :h 16 :text "slides"]))
     ([TEXT ec0262 :x (/ 27473 30) :y 1156.9 :w (/ 287 30) :h 16 :text " ]"]))
    ([TEXT ec0263 :x 497.5 :y 1175.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0264 :tag DT :x 483.5 :y 1189.4 :w 700 :h 21 :mt 14 :mr 0 :mb 0 :ml -14 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0265 :x 483.5 :y 1191.9 :w (/ 14083 30) :h 16 :text "MemSAT: Checking Axiomatic Specifications of Memory Models"]))
    ([TEXT ec0266 :x 497.5 :y 1210.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0267 :tag DD :x 497.5 :y 1210.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0268 :tag A]
      ([TEXT ec0269 :x 497.5 :y 1212.9 :w 175.95 :h 16 :text "SAT/SMT Summer School"]))
     ([TEXT ec0270 :x 673.45 :y 1212.9 :w (/ 6114 30) :h 16 :text ", Invited Lecture, June 2011 [ "])
     ([INLINE ec0271 :tag A]
      ([TEXT ec0272 :x (/ 26317 30) :y 1212.9 :w 37.7 :h 16 :text "slides"]))
     ([TEXT ec0273 :x (/ 13724 15) :y 1212.9 :w (/ 287 30) :h 16 :text " ]"]))
    ([TEXT ec0274 :x 497.5 :y 1231.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0275 :tag DD :x 497.5 :y 1231.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0276 :x 497.5 :y 1233.9 :w 487.7 :h 16 :text "Purdue University, Secure Software Systems Seminar, September 2010 "]))
    ([TEXT ec0277 :x 497.5 :y 1252.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0278 :tag DD :x 497.5 :y 1252.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0279 :tag A]
      ([TEXT ec0280 :x 497.5 :y 1254.9 :w 54 :h 16 :text "PLDI'10"]))
     ([TEXT ec0281 :x (/ 16515 30) :y 1254.9 :w (/ 2939 15) :h 16 :text ", Conference Talk, June 2010 "]))
    ([TEXT ec0282 :x 497.5 :y 1273.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0283 :tag DD :x 497.5 :y 1273.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0284 :x 497.5 :y 1275.9 :w (/ 4747 15) :h 16 :text "U.C. Berkeley, Par Lab Seminar, October 2009 "]))
    ([TEXT ec0285 :x 497.5 :y 1294.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0286 :tag DT :x 483.5 :y 1308.4 :w 700 :h 21 :mt 14 :mr 0 :mb 0 :ml -14 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0287 :x 483.5 :y 1310.9 :w 374.9 :h 16 :text "Effective Interprocedural Resource Leak Detection"]))
    ([TEXT ec0288 :x 497.5 :y 1329.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0289 :tag DD :x 497.5 :y 1329.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0290 :tag A]
      ([TEXT ec0291 :x 497.5 :y 1331.9 :w 53 :h 16 :text "ICSE'10"]))
     ([TEXT ec0292 :x (/ 16485 30) :y 1331.9 :w 208.5 :h 16 :text ", Conference Talk, May 2010 [ "])
     ([INLINE ec0293 :tag A]
      ([TEXT ec0294 :x 771 :y 1331.9 :w 37.7 :h 16 :text "slides"]))
     ([TEXT ec0295 :x 795.7 :y 1331.9 :w (/ 287 30) :h 16 :text " ]"]))
    ([TEXT ec0296 :x 497.5 :y 1350.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0297 :tag DT :x 483.5 :y 1364.4 :w 700 :h 21 :mt 14 :mr 0 :mb 0 :ml -14 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0298 :x 483.5 :y 1366.9 :w 360.6 :h 16 :text "Kodkod: A Constraint Solver for Relational Logic"]))
    ([TEXT ec0299 :x 497.5 :y 1385.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0300 :tag DD :x 497.5 :y 1385.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0301 :tag A]
      ([TEXT ec0302 :x 497.5 :y 1387.9 :w 56 :h 16 :text "LaSh'10"]))
     ([TEXT ec0303 :x (/ 16575 30) :y 1387.9 :w (/ 2654 15) :h 16 :text ", Invited Talk, July 2010 [ "])
     ([INLINE ec0304 :tag A]
      ([TEXT ec0305 :x (/ 8753 12) :y 1387.9 :w 37.7 :h 16 :text "slides"]))
     ([TEXT ec0306 :x 767.1 :y 1387.9 :w (/ 287 30) :h 16 :text " ]"]))
    ([TEXT ec0307 :x 497.5 :y 1406.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0308 :tag DD :x 497.5 :y 1406.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0309 :x 497.5 :y 1408.9 :w (/ 2999 15) :h 16 :text "Thesis Defense, October 2008 "]))
    ([TEXT ec0310 :x 497.5 :y 1427.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0311 :tag DD :x 497.5 :y 1427.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0312 :x 497.5 :y 1429.9 :w 387 :h 16 :text "IBM Research (Hawthorne), Invited Seminar, April 2008 "]))
    ([TEXT ec0313 :x 497.5 :y 1448.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0314 :tag DD :x 497.5 :y 1448.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0315 :x 497.5 :y 1450.9 :w 412.15 :h 16 :text "Microsoft Research (Redmond), Invited Seminar, April 2008 "]))
    ([TEXT ec0316 :x 497.5 :y 1469.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0317 :tag DD :x 497.5 :y 1469.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0318 :x 497.5 :y 1471.9 :w (/ 7429 15) :h 16 :text "NASA JPL (Lab for Reliable Software), Invited Seminar, November 2007 "]))
    ([TEXT ec0319 :x 497.5 :y 1490.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0320 :tag DT :x 483.5 :y 1504.4 :w 700 :h 21 :mt 14 :mr 0 :mb 0 :ml -14 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0321 :x 483.5 :y 1506.9 :w (/ 5801 12) :h 16 :text "Finding Minimal Unsatisfiable Cores of Declarative Specifications"]))
    ([TEXT ec0322 :x 497.5 :y 1525.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0323 :tag DD :x 497.5 :y 1525.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0324 :tag A]
      ([TEXT ec0325 :x 497.5 :y 1527.9 :w (/ 497 12) :h 16 :text "FM'08"]))
     ([TEXT ec0326 :x (/ 6467 12) :y 1527.9 :w 208.5 :h 16 :text ", Conference Talk, May 2008 [ "])
     ([INLINE ec0327 :tag A]
      ([TEXT ec0328 :x (/ 8969 12) :y 1527.9 :w 37.7 :h 16 :text "slides"]))
     ([TEXT ec0329 :x 785.1 :y 1527.9 :w (/ 287 30) :h 16 :text " ]"]))
    ([TEXT ec0330 :x 497.5 :y 1546.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0331 :tag DT :x 483.5 :y 1560.4 :w 700 :h 21 :mt 14 :mr 0 :mb 0 :ml -14 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([TEXT ec0332 :x 483.5 :y 1562.9 :w 259.35 :h 16 :text "Kodkod: A Relational Model Finder"]))
    ([TEXT ec0333 :x 497.5 :y 1581.4 :w 0 :h 0 :text " "])
    ([BLOCK ec0334 :tag DD :x 497.5 :y 1581.4 :w 686 :h 21 :mt 0 :mr 0 :mb 0 :ml 0 :pt 0 :pr 0 :pb 0 :pl 0 :bt 0 :br 0 :bb 0 :bl 0]
     ([INLINE ec0335 :tag A]
      ([TEXT ec0336 :x 497.5 :y 1583.9 :w (/ 1009 15) :h 16 :text "TACAS'07"]))
     ([TEXT ec0337 :x (/ 16943 30) :y 1583.9 :w (/ 6307 30) :h 16 :text ", Conference Talk, March 2007"]))
    ([TEXT ec0338 :x 497.5 :y 1602.4 :w 0 :h 0 :text " "]))
   ([TEXT ec0339 :x 483.5 :y 1623.4 :w 0 :h 0 :text " "]))
  ([BLOCK ec0341 :tag DIV :x 483.5 :y 1643.4 :w 940 :h 52 :mt 20 :mr 10 :mb 0 :ml 10 :pt 10 :pr 0 :pb 20 :pl 0 :bt 1 :br 0 :bb 0 :bl 0 :id footer]
   ([TEXT ec0343 :x 483.5 :y 1658.4 :w 196 :h 13 :text " © 2011-present Emina Torlak. Built on the "])
   ([INLINE ec0344 :tag A]
    ([TEXT ec0345 :x 679.5 :y 1658.4 :w 67 :h 13 :text "Not Just a Grid"]))
   ([TEXT ec0346 :x 746.5 :y 1658.4 :w (/ 166 3) :h 13 :text " framework. "]))))

(cassius-solve #:rules 5 #:header header doma domb domc)
