#!/bin/python3.5

import sys
import argparse
import subprocess
import json
import time
import collections

import capture

Done = collections.namedtuple("Done", ["size"])
Backtrack = collections.namedtuple("Backtrack", [])
Continue = collections.namedtuple("Continue", ["stats", "runtime", "elts"])

def run_accept(filename, cache_name, backtracked, maxtime=600):
    start = time.time()
    args = []
    if cache_name: args += ["--cache", cache_name]
    elts = "[{}]".format(",".join(backtracked))

    try:
        cassius = subprocess.run(["racket", "src/run.rkt", "minimize"] + args + [filename, "doc-1", elts], stdout=subprocess.PIPE, timeout=maxtime)
    except subprocess.TimeoutExpired:
            return Backtrack()
    runtime = time.time() - start

    result = cassius.stdout.decode("utf8")
    if cassius.returncode > 0:
        raise Exception("Cassius encountered an error")

    if "Accepted" in result:
        return Backtrack()
    elif "Rejected" in result:
        lines = result.split()
        stats = json.loads(lines[1])
        stats["runtime"] = runtime
        return Continue(stats, runtime, lines[2:])
    elif "Minimized" in result:
        lines = result.split()
        remaining_boxes = int(lines[1])
        return Done(remaining_boxes)
    else:
        raise Exception("Unknown result from Cassius:\n"+result)

def get_minimized(url, elts, filename):
    # Sadly, something seems to go wrong if the browser is cached between calls
    browser = capture.make_browser()
    prerun = "; ".join(["document.getElementsByTagName({}.tag)[{}.index].remove()".format(elt, elt) for elt in elts])
    with open(filename, "w") as f:
        f.write(capture.capture(browser, url, "doc-1", prerun=prerun))
    browser.quit()

def minimize(name, url, cache=None, timeout=None):
    STATISTICS = []

    start = time.time()
    iterations = 0
    eliminated = []
    # Don't ever try to delete head, meta, title
    backtracked = [u'{"tag":"head","index":0}', u'{"tag":"meta","index":0}', u'{"tag":"title","index":0}']
    minimized = False
    initial = None
    size = None

    while not minimized:
        filename = "bench/{}-{}-minimized.rkt".format(name, iterations)
        print("Running Cassius:", file=sys.stderr)
        get_minimized(url, eliminated, filename)
        res = run_accept(filename, args.cache, backtracked, maxtime=args.timeout)
        minimized = isinstance(res, Done)
        if isinstance(res, Continue):
            print("Cassius rejected the minimized version, continuing...", file=sys.stderr)
            if initial is None: initial = res.stats["total"]
            size = res.stats["total"]

            eliminated.extend(res.elts)
            STATISTICS.append(res.stats)
        elif isinstance(res, Backtrack):
            print("Cassius accepted the minimized version, backtracking...", file=sys.stderr)
            if iterations == 0:
                raise Exception("Full FWT accepted")
            backtracked.append(eliminated.pop())
            STATISTICS.pop()
        elif isinstance(res, Done):
            print("Minimized!", file=sys.stderr)
            if initial is None: initial = res.size
            size = res.size
        iterations += 1

    total_time = time.time() - start
    return {
        "path": filename
        "stats": STATISTICS,
        "initial": initial,
        "final": size,
        "time": total_time,
        "iterations": iterations,
        "name": name,
    }

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Minimize a failing Cassius input")
    p.add_argument("json", type=str, help="JSON input of a Cassius report")
    p.add_argument("--timeout", default=600, type=int, help="Timeout for each running instance of Cassius/.")
    p.add_argument("--cache", default=None, type=str, help="Cache file")
    args = p.parse_args()

    with open(args.json) as f: data = json.load(f)

    data["minimized"] = results = {}
    for fwt in data["problems"]:
        if fwt["status"] = 'fail':
            name, url = fwt["problem"], fwt["url"]
            results[name] = minimize(name, url, cache=args.cache, timeout=args.timeout)
            fwt["minimized"] = results[name]["path"]
            print("{name:>9} {initial:<4} -> {final:<4} in {time: 8.2f}".format(**results[name]))

    with open(args.json, "w") as f: json.dump(data, f)
