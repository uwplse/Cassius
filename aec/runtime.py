#!/bin/python3

import json
import sys
import math

DEBUG = False
NAME = "Verification time"

from common import *

transform = math.log10

# Highlight this one
patterns["line-width"] = "thick";

def draw_graph(data):
    times = {}
    for rec in data:
        times.setdefault(rec["subproblem"], []).append(rec["time"] / 1000)
    for name in times:
        times[name].sort()

    Mi = transform(8) # math.floor(min([transform(x) for k, t in times.items() for x in t]))
    Ma = transform(1800) # math.ceil(max([transform(x) for k, t in times.items() for x in t]))
    N = max(len(t) for k, t in times.items())

    if DEBUG: print(r"\documentclass{article}\usepackage{tikz}\begin{document}")
    print("{")
    print(colors)
    print(r"\begin{tikzpicture}[xscale=%f,yscale=%f]" % (7.5 / (Ma - Mi), 5.0 / N))

    def gridline(at):
        location = transform(at) - Mi
        thickness = "very thin,gray"
        print(r"\draw[{2}] ({0},0) -- ({0},{1});".format(location, N, thickness))
        print(r"\draw ({0},0) node[anchor=north] {{ \tiny ${1}s$ }};".format(location, at))

    print("% GRID")
    [gridline(i) for i in (10, 30, 100, 300, 1000)]

    for i in range(0, 101, 25):
        print(r"\draw[gray,very thin] (0,{1}) -- ({0},{1});".format(Ma - Mi, i * N / 100))
        print(r"\draw (0,{}) node[anchor=east] {{ \tiny ${}\%$ }};".format(i * N / 100, i))

    def cdf(l, pat):
        a_ = 0
        for i, a in enumerate(l):
            print(r"\draw[{4}] ({0}, {1}) -- ({2}, {1}) -- ({2}, {3});".format(a_, i, transform(a) - Mi, i + 1, pat))
            a_ = transform(a) - Mi
        print(r"\draw[{3}] ({0}, {1}) -- ({2}, {1});".format(a_, i + 1, Ma - Mi, pat))

    print("% CDF")
    for k, t in times.items():
        cdf(t, patterns[k])

    print("% Label")
    print(r"\draw ({}, -4) node[anchor=north] {{ \footnotesize Time (s; log scale) }};".format((Ma - Mi) / 2))
    print(r"\draw ({}, {}) node[anchor=south] {{ \small {} }};".format((Ma - Mi) / 2, N, NAME))

    print("% Legend")
    def legend(number, name):
        locx = (Ma - Mi) * .8 + (Ma - Mi) * .21 / (len(patterns) / 2) * (number % 4)
        locy = 7.5 if number < 4 else .5
        color = patterns[name] if patterns[name] != "thick" else "black"
        print(r"\node at ({0}, {1}) [color=black!60!{3},rectangle,fill={3}!20,draw,anchor=south,node contents={{ \footnotesize {2} }}];".format(locx, locy, number + 1, color))

    for i, name in enumerate(["text-size", "interactive-onscreen", "line-width",
                              "accessible-offscreen", "no-horizontal-scroll", "heading-size",
                              "overlapping-text", "line-spacing"]):
        legend(i, name)

    print(r"\end{tikzpicture}")
    print("}")
    if DEBUG: print(r"\end{document}")

if __name__ == "__main__":
    if len(sys.argv) <= 1:
        print("USAGE: python runtime.py vizassert.json")
        sys.exit(1)
    else:
        if sys.argv[1] == "--debug":
            DEBUG = True
            file = sys.argv[2]
        else:
            file = sys.argv[1]
        with open(file) as f:
            data = json.load(f)
        draw_graph(data)
