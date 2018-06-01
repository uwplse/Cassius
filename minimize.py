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
Continue = collection.namedtuple("Continue", ["stats", "runtime", "elts"])

def run_accept(name, cache_name, backtracked, maxtime=600):
    start = time.time()
    try:
        cassius = subprocess.run(["racket", "src/run.rkt", "minimize", "--cache", cache_name, "bench/"+name+".rkt", "doc-1", "[{}]".format(",".join(backtracked))], stdout=subprocess.PIPE, timeout=maxtime)
    except subprocess.TimeoutExpired:
            return Backtrack()
    runtime = time.time() - start

    result = cassius.stdout

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
    elif "Error" in result:
        raise Exception("Cassius encountered an error:\n" + result)

def get_minimized(url, elts, name):
    prerun = "; ".join(["document.getElementsByTagName({}.tag)[{}.index].remove()".format(elt, elt) for elt in elts])
    get_bench(url, name=name, prerun=prerun)

if __name__ == "__main__":
    STATISTICS = []

    p = argparse.ArgumentParser(description="Download a website as Cassius test cases")
    p.add_argument("name", type=str, help="File name under bench/.")
    p.add_argument("urls", metavar="URLs", type=str, help="URLs to dowload")
    p.add_argument("--timeout", default=600, type=int, help="Timeout for each running instance of Cassius/.")
    p.add_argument("--json", default=False, type=bool, action="store_true", help="Use machine-readable JSON output")
    args = p.parse_args()

    iterations = 0
    eliminated = []
    # Don't ever try to delete head, meta, title
    backtracked = [u'{"tag":"head","index":0}', u'{"tag":"meta","index":0}', u'{"tag":"title","index":0}']
    start = time.time()
    minimized = False

    while not minimized:
        name = "{}-{}-minimized".format(args.name, iterations)
        print("Running Cassius:", file=sys.stderr)
        get_minimized(args.urls, eliminated, name)
        res = run_accept(name, args.name, backtracked, maxtime=args.timeout)
        minimized = instanceof(res, Done)
        if instanceof(res, Continue):
            print("Cassius rejected the minimized version, continuing...", file=sys.stderr)
            if iterations == 0: initial = res.stats["total"]
            eliminated.extend(res.elts)
            STATISTICS.append((res.stats, res.runtime))
        elif instanceof(res, Backtrack):
            print("Cassius accepted the minimized version, backtracking...", file=sys.stderr)
            if iterations == 0:
                raise Exception("Full FWT accepted")
            backtracked.append(eliminated.pop())
            STATISTICS.pop()
        elif instanceof(res, Done):
            print("Minimized!", file=sys.stderr)
            if iterations == 0: initial = res.size
        iterations += 1

    total_time = time.time() - start

    if not args.json:
        total_removed = 0
        i = 0
        print("\n\nStatistics:")

        print("Iteration\tBeginning #\t# Removed (%)\t# Remaining")
        for (stats,time) in STATISTICS:
            print("{0}\t\t{1}\t\t{2} ({3:.2f})\t\t{4}".format(i,stats["total"], stats["removed"], float(stats["efficiency"]), stats["total"] - stats["removed"]))
            total_removed += stats["removed"]
            sys.stdout.flush()
            i += 1

        print('\nIn total, {0} boxes were removed in {1} iteration(s), taking {2:.2f} seconds.'.format(total_removed, iterations, total_time))
        print('A total of {0} boxes remained for a {1:.2f}% reduction overall.'.format(initial - total_removed, (total_removed * 100.0) / initial))
    else:
        total_removed = 0
        for (stats,time) in STATISTICS:
            total_removed += stats["removed"]

        json.dump({ "name": args.name, "before": initial, "after": initial - total_removed, "time": total_time})
