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

def run_accept(name=None):
    print("Running Cassius:")
    start = time.time()
    result = subprocess.check_output(["racket", "src/run.rkt", "minimize", "reports/minimized/"+name+"-minimized.rkt", "doc-1"], shell=True, stderr=subprocess.STDOUT)
    end = time.time()
    if "Rejected" in result:
        print("Cassius rejected the minimized version, continuing...")
        sys.stdout.flush()
        lines = result.split()
        stats = json.loads(lines[1])
        STATISTICS.append((stats, end - start))
        return (0, lines[2:])
    elif "Accepted" in result:
        print("Cassius accepted the minimized version, backtracking...")
        sys.stdout.flush()
        return (1, [])
    else:
        print("Minimized!")
        sys.stdout.flush()
        return (2, [])

def get_minimized(url, elts, name):
    args = []
    if sys.platform.startswith("linux"):
        args.append('xvfb-run')
        args.append("-s -a '-screen 0, 1920x1080x24'")
    args.append('python2')
    args.append('get_minimized.py')
    args.append(name)
    args.append(url)
    for elt in elts:
        args.append(elt)
    subprocess.check_output(args, shell=True)

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Download a website as Cassius test cases")
    p.add_argument("name", type=str, help="File name under bench/.")
    p.add_argument("urls", metavar="URLs", type=str, help="URLs to dowload")
    p.add_argument("--website", dest="website", default="", type=str, help="File name under bench/.")
    args = p.parse_args()
    
    eliminated = []
    start = time.time()
    get_minimized(args.urls, eliminated, args.name)
    result, elts = run_accept(name=args.name)
    while result == 0:
        eliminated.extend(elts)
        get_minimized(args.urls, eliminated, args.name)
        result, elts = run_accept(name=args.name)
    end = time.time()

    if (result == 2):
        i = 0
        initial = None
        total_time = end - start
        total_removed = 0
        print("\n\nStatistics:")

        print("Iteration\tBeginning #\t# Removed (%)\t# Remaining")
        for (stats,time) in STATISTICS:
            print("{0}\t\t{1}\t\t{2} ({3:.2f})\t\t{4}".format(i,stats["total"], stats["removed"], float(stats["efficiency"]), stats["total"] - stats["removed"]))
            if initial is None:
                initial = stats["total"]
            total_removed += stats["removed"]
            i += 1
            sys.stdout.flush()

        print('\nIn total, {0} boxes were removed in {1} iteration(s), taking {2:.2f} seconds.'.format(total_removed, i, total_time))
        print('A total of {0} boxes remained for a {1:.2f}% reduction overall.'.format(initial - total_removed, (total_removed * 100.0) / initial))
        sys.stdout.flush()

        # Write statistics to file
        with open("reports/minimized.html", "a") as out:
            out.write("<tr>\n")
            out.write("\t<td>{}</td>\n".format(args.website))
            out.write("\t<td>{}</td>\n".format(args.name))
            out.write("\t<td>{}</td>\n".format(initial))
            out.write("\t<td>{}</td>\n".format(initial - total_removed))
            out.write("\t<td>{0:.2f}</td>\n".format(total_time))
            out.write("</tr>\n")
