
import sys
import json
import sys
import math

DEBUG = False
NAME = ["Instance Size (constraints)", "Instance Size (terms)", "Model Size (variables)", "Proof Size (constraints)"]


def get_data(file):
    data = {}
    LAST = None
    for line in file:
        if "doc-" in line:
            LAST = line.split()[2]
        else:
            consts, terms, vars, cores = data.setdefault(LAST, ([], [], [], []))
            if "Prepared" in line:
                cs, _, _, ts, _ = line.split("Prepared")[1].strip().split()
                consts.append(int(cs))
                terms.append(int(ts))
            elif "Found model" in line:
                _, vs, _ = line.split("Found model")[1].strip().split()
                vars.append(int(vs))
            elif "Found core" in line:
                _, cs, _ = line.split("Found core")[1].strip().split()
                cores.append(int(cs))
            else:
                pass
    return data

from common import *

def draw_graph(data, which=0):

    Mi = 1000
    Ma = -1
    for k, t in data.items():
        if data[k][which]:
            if Ma < transform(max(data[k][which])):
                Ma = transform(max(data[k][which]))
                allmax = max(data[k][which])
            if Mi > transform(min(data[k][which])):
                Mi = transform(min(data[k][which]))
                allmin = min(data[k][which])
        list.sort(data[k][which])
#    Mi = math.floor(Mi)
#    Ma = math.ceil(Ma)

    #Mi =  math.floor(min([transform(x[which]) for x in data[k] for k, t in data.items()])) #math.floor(min([transform(x[which]) for k, t in data.items() for x in t]))
    #Ma =  math.floor(max([transform(x[which]) for x in data[k] for k, t in data.items()])) #math.ceil(max([transform(x[which]) for k, t in data.items() for x in t]))
#    Ma -= 1
    N = max(len(t[which]) for k, t in data.items())

    print("%max: ", Ma)
    print("%min: ", Mi)

    if DEBUG: print(r"\documentclass{article}\usepackage{tikz}\begin{document}")
    print("{")
    print(colors)
    print(r"\begin{tikzpicture}[xscale=%f,yscale=%f]" % (3.1 / (Ma - Mi), 2.8 / N))

    def gridline(at):
        location = transform(at) - Mi
        thickness = "very thin,gray"
        print(r"\draw[{2}] ({0},0) -- ({0},{1});".format(location, N, thickness))
        print(r"\draw ({0},0) node[anchor=north] {{ \tiny ${1}k$ }};".format(location, int(at/1000)))

    print("% GRID")
    [gridline(i) for i in [1000*math.floor((x * (allmax-allmin) + allmin)/1000) for x in (0.20, 0.5, 0.8)]] #(5, 10, 30, 100, 300, 1000)]

    for i in range(0, 101, 25):
        print(r"\draw[gray,very thin] (0,{1}) -- ({0},{1});".format(Ma - Mi, i * N / 100))
        print(r"\draw (0,{}) node[anchor=east] {{ \tiny ${}\%$ }};".format(i * N / 100, i))

    def cdf(l, pat):
        a_ = 0
        ifactor = N / len(l)
        for i, a in enumerate(l):
            print(r"\draw[{4}] ({0}, {1}) -- ({2}, {1}) -- ({2}, {3});".format(a_, i*ifactor, transform(a) - Mi, (i+1)*ifactor, pat))
            a_ = transform(a) - Mi
        print(r"\draw[{3}] ({0}, {1}) -- ({2}, {1});".format(a_, (i + 1)*ifactor, Ma - Mi, pat))

    for k, t in data.items():
        print("% CDF for", k)
        if t[which]: cdf(t[which], patterns[k])

    print("% Label")
#    print(r"\draw ({}, -4) node[anchor=north] {{ \footnotesize size }};".format((Ma - Mi) / 2))
    print(r"\draw ({}, {}) node[anchor=south] {{ \small {} }};".format((Ma - Mi) / 2, N, NAME[which]))

    print("% Legend")
    def legend(number, name):
        locx = (Ma - Mi) * .6 + (Ma - Mi) * .4 / (len(patterns) / 2) * (number % 3)
        locy = 8. if number < 3 else .5
        print("%locx, locy", locx, locy)
        print(r"\node at ({0}, {1}) [color=black!60!{3},rectangle,fill={3}!20,draw,anchor=south,node contents={{ \footnotesize {2} }}];".format(locx, locy, number + 1, patterns[name]))

    #if which == 1:
    #    for i, name in enumerate(["text-size", "interactive-onscreen", "line-width",
    #                              "accessible-offscreen", "no-horizontal-scroll", "heading-size"]):
    #        legend(i, name)

    print(r"\end{tikzpicture}%")
    print("}")
    if DEBUG: print(r"\end{document}")

# def draw_graph(data, which=0):
    # sorted_data = sorted(data["text-size"][0])

    # print(r"\begin{tikzpicture}")
    # print(r"\begin{axis}[")
    # print(r"clip=false, scale only axis=true, width=0.9\textwidth, height=0.3\textwidth,")
    # print(r"xmin={0}, xmax={1}, ymin=0, ymax=1,".format(sorted_data[0], sorted_data[-1]+1))
    # print(r"table/create on use/cumulative distribution/.style={")
    # print(r"    create col/expr={\pgfmathaccuma + \thisrow{f(x)}}")
    # print(r"}]")

    # print(r"\addplot [red] table [y=cumulative distribution]{")
    # print(r"x f(x)")

    # for i in range(len(sorted_data)):
        # print(r"{1} {0}".format(1.0/len(sorted_data), sorted_data[i]))
    # print(r"};")
    
    # print(r"\end{axis}")
    # print(r"\end{tikzpicture}")


if __name__ == "__main__":

    if len(sys.argv) <= 1:
        print("USAGE: python insts.py all.log")
        sys.exit(1)
    else:
        transform = lambda x: x / 10000
        if sys.argv[1] == "--debug":
            DEBUG = True
            file = sys.argv[2]
        else:
            file = sys.argv[1]
        with open(file) as f:
            data = get_data(f)
        draw_graph(data, 1)
        #draw_graph(data, 2)
        draw_graph(data, 3)
