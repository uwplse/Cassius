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

def run_accept(name, backtracked, maxtime=600):
    print("Running Cassius:")
    start = time.time()
    process = subprocess.Popen(["racket", "src/run.rkt", "minimize",
                                    "reports/minimized/"+name+"-minimized.rkt",
                                    "doc-1", "["+",".join(backtracked)+"]"], stdout=subprocess.PIPE)
    i = 0
    while process.poll() == None:
        if (i >= maxtime):
            process.terminate()
            print("Cassius timed out, backtracking...")
            sys.stdout.flush()
            return (1, [], -1)
        time.sleep(5)
        i += 5

    result, _ = process.communicate()
    end = time.time()

    if "Rejected" in result:
        print("Cassius rejected the minimized version, continuing...")
        sys.stdout.flush()
        lines = result.split()
        stats = json.loads(lines[1])
        STATISTICS.append((stats, end - start))
        return (0, lines[2:], stats["total"])
    elif "Accepted" in result:
        print("Cassius accepted the minimized version, backtracking...")
        sys.stdout.flush()
        return (1, [], -1)
    else:
        print("Minimized!")
        lines = result.split()
        remaining_boxes = int(lines[1])
        sys.stdout.flush()
        return (2, [], remaining_boxes)

def get_minimized(url, elts, name):
    args = ["python2", "get_minimized.py", name, url] + elts
    result = subprocess.check_output(args)

# Write statistics to file
def write_output(website, name, before, after, time):
    with open("reports/minimized.html", "a") as out:
        out.write("<tr>\n")
        out.write("\t<td>{}</td>\n".format(website))
        out.write("\t<td>{}</td>\n".format(name))
        out.write("\t<td>{}</td>\n".format(before))
        out.write("\t<td>{}</td>\n".format(after))
        out.write("\t<td>{0:.2f}</td>\n".format(time))
        out.write("</tr>\n")

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Download a website as Cassius test cases")
    p.add_argument("name", type=str, help="File name under bench/.")
    p.add_argument("urls", metavar="URLs", type=str, help="URLs to dowload")
    p.add_argument("--website", dest="website", default="", type=str, help="File name under bench/.")
    p.add_argument("--timeout", dest="timeout", default=600, type=int, help="Timeout for each running instance of Cassius/.")
    args = p.parse_args()

    iterations = 0
    eliminated = []
    backtracked = []
    start = time.time()
    get_minimized(args.urls, eliminated, args.name)
    result, elts, initial = run_accept(args.name, backtracked, maxtime=args.timeout)
    while result == 0:
        eliminated.extend(elts)
        get_minimized(args.urls, eliminated, args.name + "-" + str(iterations))
        result, elts, _ = run_accept(args.name + "-" + str(iterations), backtracked, maxtime=args.timeout)
        iterations += 1

        if result == 1:
            backtracked.append(eliminated.pop())
            STATISTICS.pop()
            result = 0

    total_time = time.time() - start

    if result == 2:
        i = 0
        total_removed = 0
        print("\n\nStatistics:")

        print("Iteration\tBeginning #\t# Removed (%)\t# Remaining")
        for (stats,time) in STATISTICS:
            print("{0}\t\t{1}\t\t{2} ({3:.2f})\t\t{4}".format(i,stats["total"], stats["removed"], float(stats["efficiency"]), stats["total"] - stats["removed"]))
            total_removed += stats["removed"]
            i += 1
            sys.stdout.flush()

        print('\nIn total, {0} boxes were removed in {1} iteration(s), taking {2:.2f} seconds.'.format(total_removed, i, total_time))
        print('A total of {0} boxes remained for a {1:.2f}% reduction overall.'.format(initial - total_removed, (total_removed * 100.0) / initial))
        sys.stdout.flush()

        write_output(args.website, args.name, initial, initial - total_removed, total_time)
