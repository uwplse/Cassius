#!/bin/python3.5

import sys
import argparse
import subprocess
import json
import time
import collections

from get_bench import main as get_bench

Done = collections.namedtuple("Done", ["size"])
Backtrack = collections.namedtuple("Backtrack", [])
Continue = collections.namedtuple("Continue", ["stats", "runtime", "elts"])

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

if __name__ == "__main__":
    STATISTICS = []

    p = argparse.ArgumentParser(description="Minimize a failing Cassius input")
    p.add_argument("name", type=str, help="File name under bench/.")
    p.add_argument("urls", metavar="URLs", type=str, help="URLs to dowload")
    p.add_argument("--timeout", default=600, type=int, help="Timeout for each running instance of Cassius/.")
    p.add_argument("--json", action="store_true", help="Use machine-readable JSON output")
    p.add_argument("--cache", default=None, type=str, help="Cache file")
    args = p.parse_args()

    iterations = 0
    eliminated = []
    # Don't ever try to delete head, meta, title
    backtracked = [u'{"tag":"head","index":0}', u'{"tag":"meta","index":0}', u'{"tag":"title","index":0}']
    start = time.time()
    minimized = False
    initial = None
    size = None

    while not minimized:
        name = "{}-{}-minimized".format(args.name, iterations)
        print("Running Cassius:", file=sys.stderr)
        get_minimized(args.urls, eliminated, name)
        res = run_accept(name, args.cache, backtracked, maxtime=args.timeout)
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
        for (stats,time) in STATISTICS:
            print("{0}\t\t{1}\t\t{2} ({3:.2f})\t\t{4}".format(i,stats["total"], stats["removed"], float(stats["efficiency"]), stats["total"] - stats["removed"]))
            i += 1

        total_removed = initial - size
        print('\nIn total, {0} boxes were removed in {1} iteration(s), taking {2:.2f} seconds.'.format(total_removed, iterations, total_time))
        print('A total of {0} boxes remained for a {1:.2f}% reduction overall.'.format(initial - total_removed, (total_removed * 100.0) / initial))
    else:
        print(json.dumps({ "name": args.name, "before": initial, "after": size, "time": total_time}))
