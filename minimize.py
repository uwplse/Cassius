#!/bin/python2.7

"""
Benchmark creator, for Cassius.

Uses Selenium Webdriver to download new benchmarks for Casssius.
Opens a page in Firefox, causes it to execute get_bench.js, and saves the result.
"""

import os, sys
import warnings
import collections
import argparse
import subprocess
import json
import time

STATISTICS=[]

def run_accept(name, cache_name, backtracked, maxtime=600):
    print("Running Cassius:", file=sys.stderr)
    cassius = subprocess.Popen(["racket", "src/run.rkt", "minimize", "--cache", cache_name,
                                "bench/"+name+".rkt",
                                "doc-1", "[{}]".format(",".join(backtracked))], stdout=subprocess.PIPE)
    i = 0

    while cassius.poll() == None:
        if (i >= maxtime):
            print("Cassius timed out, backtracking...", file=sys.stderr)
            cassius.terminate()
            sys.stdout.flush()
            return (True, False, [], -1)
        time.sleep(5)
        i += 5

    result, _ = cassius.communicate()

    if "Accepted" in result:
        print("Cassius accepted the minimized version, backtracking...", file=sys.stderr)
        sys.stdout.flush()
        return (True, False, [], -1)
    elif "Rejected" in result:
        print("Cassius rejected the minimized version, continuing...", file=sys.stderr)
        sys.stdout.flush()
        lines = result.split()
        stats = json.loads(lines[1])
        STATISTICS.append((stats, i))
        return (False, False, lines[2:], stats["total"])
    elif "Minimized" in result:
        print("Minimized!", file=sys.stderr)
        lines = result.split()
        remaining_boxes = int(lines[1])
        sys.stdout.flush()
        return (False, True, [], remaining_boxes)
    elif "Error" in result:
        print("Cassius encountered an error, terminating", file=sys.stderr)
        sys.stdout.flush()
        raise Exception()

    return (False, i)

def get_minimized(url, elts, name):
    p = subprocess.Popen(["python2", "get_bench.py", "--name", name, "--prerun", "-", url], stdin=subprocess.PIPE)
    p.communicate('TAGLIST = [{}];'.format(",".join(elts)) +
                  'for (i in TAGLIST) {' +
                      'var tag = TAGLIST[i].tag;' +
                      'var index = TAGLIST[i].index;' +
                      'document.getElementsByTagName(tag)[index].remove();' +
                  '}')

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
