#!/bin/python3.5

import os, sys
import argparse
import subprocess
import json
import time
import collections

from get_bench import main as get_bench

Done = collections.namedtuple("Done", ["size"])
Backtrack = collections.namedtuple("Backtrack", [])
Continue = collections.namedtuple("Continue", ["stats", "runtime", "elts"])

def run_assertion(name, cache_name, backtracked, assertfile, assertname, maxtime=600):
    start = time.time()
    args = []
    if cache_name: args += ["--cache", cache_name]
    elts = "[{}]".format(",".join(backtracked))

    res = run_accept(name, cache_name + "accept", backtracked, maxtime)
    # Cassius must accept for VizAssert to make sense
    if not isinstance(res, Backtrack):
        return Backtrack()

    print("Running VizAssert:")

    try:
        cassius = subprocess.run(["racket", "src/run.rkt", "minimize-assertion"] + args +
                                 [assertfile, assertname, "bench/"+name+".rkt",
                                  "doc-1", elts], stdout=subprocess.PIPE, timeout=maxtime)
    except subprocess.TimeoutExpired:
            return Backtrack()
    runtime = time.time() - start

    result = cassius.stdout.decode("utf8")
    if cassius.returncode > 0:
        raise Exception("Cassius encountered an error")

    if "Verified" in result:
        return Backtrack()
    elif "Rejected" in result:
        lines = result.split()
        stats = json.loads(lines[1])
        return Continue(stats, runtime, lines[2:])
    elif "Minimized" in result:
        lines = result.split()
        remaining_boxes = int(lines[1])
        return Done(remaining_boxes)
    elif "Error" in result:
        raise Exception("VizAssert encountered an error:\n" + result)

def run_accept(name, cache_name, backtracked, maxtime=600):
    start = time.time()
    args = []
    if cache_name: args += ["--cache", cache_name]
    elts = "[{}]".format(",".join(backtracked))

    try:
        cassius = subprocess.run(["racket", "src/run.rkt", "minimize"] + args + ["bench/"+name+".rkt", "doc-1", elts], stdout=subprocess.PIPE, timeout=maxtime)
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
        return Continue(stats, runtime, lines[2:])
    elif "Minimized" in result:
        lines = result.split()
        remaining_boxes = int(lines[1])
        return Done(remaining_boxes)
    else:
        raise Exception("Unknown result from Cassius:\n"+result)

def get_minimized(url, elts, name):
    prerun = "; ".join(["document.getElementsByTagName({}.tag)[{}.index].remove()".format(elt, elt) for elt in elts])
    get_bench([url], name=name, prerun=prerun)

def minimize(args, run, afile, aname):
    STATISTICS = []

    iterations = 0
    eliminated = []
    # Don't ever try to delete head, meta, title
    backtracked = ['{"tag":"head","index":0}', '{"tag":"meta","index":0}', '{"tag":"title","index":0}']
    start = time.time()
    minimized = False
    initial = None
    size = None

    while not minimized:
        name = "{}-{}-minimized".format(args.name, iterations)
        print("Running Cassius:", file=sys.stderr)
        get_minimized(args.urls, eliminated, name)
        if afile == False:
            res = run_accept(name, args.cache, backtracked, maxtime=args.timeout)
        else:
            res = run_assertion(name, args.cache, backtracked, afile, aname, maxtime=args.timeout)
        minimized = isinstance(res, Done)
        if isinstance(res, Continue):
            print("Cassius rejected the minimized version, continuing...", file=sys.stderr)
            if initial is None: initial = res.stats["total"]
            size = res.stats["total"]

            eliminated.extend(res.elts)
            STATISTICS.append((res.stats, res.runtime))
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

    if not args.json:
        i = 0
        print("\n\nStatistics:")

        print("Iteration\tBeginning #\t# Removed (%)\t# Remaining")
        for (stats,i_time) in STATISTICS:
            print("{0}\t\t{1}\t\t{2} ({3:.2f})\t\t{4}".format(i,stats["total"], stats["removed"], float(stats["efficiency"]), stats["total"] - stats["removed"]))
            i += 1

        total_removed = initial - size
        print('\nIn total, {0} boxes were removed in {1} iteration(s), taking {2:.2f} seconds.'.format(total_removed, iterations, total_time))
        print('A total of {0} boxes remained for a {1:.2f}% reduction overall.'.format(initial - total_removed, (total_removed * 100.0) / initial))
    else:
        print(json.dumps({ "name": args.name, "before": initial, "after": size, "time": total_time}))

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Minimize a failing Cassius input")
    p.add_argument("name", type=str, help="File name under bench/.")
    p.add_argument("urls", metavar="URLs", type=str, help="URLs to dowload")
    p.add_argument("--timeout", default=600, type=int, help="Timeout for each running instance of Cassius/.")
    p.add_argument("--json", action="store_true", help="Use machine-readable JSON output")
    p.add_argument("--cache", default=None, type=str, help="Cache file")
    p.add_argument("-a", dest="assertion", default=False, type=str, nargs="*", help="Run provided assertion from provided assertion file, usage: minimize.py <name> <url> -a <filename> <assertion name>")
    args = p.parse_args()

    if (args.assertion == False):
        print("Running minimizer on Cassius")
        minimize(args, run_accept, False, False)
    elif (len(args.assertion) != 2):
        print("Usage: minimize.py <name> <url> -a <filename> <assertion name>")
    elif not os.path.exists(args.assertion[0]):
        print("Could not find assertion file: {}".format(args.assertion[0]))
    else:
        print("Running minimizer on VizAssert")
        minimize(args, run_assertion, args.assertion[0], args.assertion[1])
