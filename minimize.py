#!/bin/python3.5

import sys
import argparse
import subprocess
import json
import time

from get_bench import main as get_bench

STATISTICS = []

def run_accept(name, cache_name, backtracked, maxtime=600):
    try:
        print("Running Cassius:", file=sys.stderr)
        cassius = subprocess.run(["racket", "src/run.rkt", "minimize", "--cache", cache_name, "bench/"+name+".rkt", "doc-1", "[{}]".format(",".join(backtracked))], stdout=subprocess.PIPE, timeout=maxtime)
    except subprocess.TimeoutExpired:
            return (True, False, [], -1)

    result = cassius.stdout

    if "Accepted" in result:
        print("Cassius accepted the minimized version, backtracking...", file=sys.stderr)
        return (True, False, [], -1)
    elif "Rejected" in result:
        print("Cassius rejected the minimized version, continuing...", file=sys.stderr)
        lines = result.split()
        stats = json.loads(lines[1])
        STATISTICS.append((stats, i))
        return (False, False, lines[2:], stats["total"])
    elif "Minimized" in result:
        print("Minimized!", file=sys.stderr)
        lines = result.split()
        remaining_boxes = int(lines[1])
        return (False, True, [], remaining_boxes)
    elif "Error" in result:
        print("Cassius encountered an error, terminating", file=sys.stderr)
        raise Exception()

    return (False, i)

def get_minimized(url, elts, name):
    prerun = "; ".join(["document.getElementsByTagName({}.tag)[{}.index].remove()".format(elt, elt) for elt in elts])
    get_bench(url, name=name, prerun=prerun)

if __name__ == "__main__":
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

    get_minimized(args.urls, eliminated, args.name)
    accepted, minimized, elts, initial = run_accept(args.name, args.name, backtracked, maxtime=args.timeout)
    if accepted:
        raise Exception("Full FWT accepted")
    else:
        iterations += 1

    while not minimized:
        eliminated.extend(elts)
        name = "{}-{}-minimized".format(args.name, iterations)
        get_minimized(args.urls, eliminated, name)
        accepted, minimized, elts, _ = run_accept(name, args.name, backtracked, maxtime=args.timeout)

        if accepted:
            backtracked.append(eliminated.pop())
            STATISTICS.pop()

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
