import sys
from common import *

def get_data(file):
    elts, boxes, rules = [], [], []
    for line in file:
        if "Read 1 documents with" in line:
            elt, _, box, _, _, rule, _ = line.split("with")[1].strip().split()
            elts.append(int(elt))
            boxes.append(int(box))
            rules.append(int(rule))
    print("% Elts: {} average, {}--{} IQR" .format(sum(elts) / len(elts), sorted(elts)[len(elts) // 4], sorted(elts)[len(elts) * 3 // 4]))
    print("% Boxes: {} average, {}--{} IQR".format(sum(boxes) / len(boxes), sorted(boxes)[len(boxes) // 4], sorted(boxes)[len(boxes) * 3 // 4]))
    print("% Rules: {} average, {}--{} IQR".format(sum(rules) / len(rules), sorted(rules)[len(rules) // 4], sorted(rules)[len(rules) * 3 // 4]))
    return elts, boxes, rules

def prep_hist(title, l, mi, ma, skip):
    if any(x for x in l if ma <= x):
        raise Exception("Too low a maximum value for {}; is {}".format(title, max(l)))
    counts = []
    for bl, br in zip(range(mi, ma, skip), range(mi + skip, ma + skip, skip)):
        counts.append(len([x for x in l if bl <= x < br]) / float(len(patterns)))
    return {"title": title, "min": mi, "max": ma, "counts": counts, "interval": skip}

def makeplot(data):
    print(r"\begin{tikzpicture}[xscale=0.5,yscale=0.5]")
    print(r"\begin{{axis}}[area style, width=2\linewidth, height=1.5\linewidth, xmin={1}, xmax={2}, ymin=0, xlabel={{{0}}}]".format(data["title"], data["min"] - data["interval"], data["max"] + data["interval"]))
    print(r"\addplot+[ybar interval, mark=no] plot coordinates {", end="")
    for i,c  in enumerate(data['counts']):
        print(r"({0}, {1}) ".format(data["min"] + i * data["interval"], c), end="")
    print(r"};")
    print(r"\end{axis}")
    print(r"\end{tikzpicture}")

if __name__ == "__main__":
    if "--debug" == sys.argv[1]:
        DEBUG = True
        del sys.argv[1]
    if DEBUG: print(r"\documentclass{article}\usepackage{pgfplots}\begin{document}")
    elts, boxes, rules = get_data(open(sys.argv[1]))
    print(r"{\pgfplotsset{every tick label/.append style={font=\large}}")
    print(r"\pgfplotsset{every axis/.append style={font=\LARGE}}")
    print(r"\centering")
    print(r"\begin{minipage}{.5\linewidth}%")
    print(r"\centering%")
    makeplot(prep_hist("Boxes", boxes, 70, 350, 28))
    print(r"\end{minipage}%")
    print(r"\begin{minipage}{.5\linewidth}%")
    print(r"\centering%")
    makeplot(prep_hist("Rules", rules, 50, 470, 42))
    print(r"\end{minipage}")
    print(r"}")
    if DEBUG: print(r"\end{document}")

