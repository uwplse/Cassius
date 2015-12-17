#!/bin/python2

import json
import collections
import sys

# Generate this with
# k = {}; a = $$("td a"); for (var i = 0; i < a.length; i++) { p = a[i].parentNode; while (p.tagName!="TBODY") p = p.parentNode; k[a[i].textContent] = p.id }; p = document.createElement("pre"); document.body.appendChild(p); p.textContent = JSON.stringify(k)

TESTS = {}
for sec in json.load(open("tests.json")):
    for k, v in sec.items():
        TESTS[k.rsplit("-", 1)[0]] = v
RESULTS = {}
for f in sys.argv[1:]:
    for res in json.load(open(f)):
        RESULTS[res["test"]] = res["status"]

MAP = {}
for t, status in RESULTS.items():
    t_ = t
    t = t.split(".")[0]
    if t.endswith("-ref"):
        t = t[:-len("-ref")]
    sec = TESTS.get(t, "unknown")
    MAP.setdefault(sec, []).append(t_)

for sec, ts in sorted(MAP.items()):
    cnt = collections.Counter([RESULTS[t] for t in ts])
    print("{}: {} / {}".format(sec, cnt["success"], cnt["fail"]))
    #if sec == "unknown":
    #    for t in sorted(ts):
    #        print("  {}".format(t))
