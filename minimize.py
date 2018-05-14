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

def run_minimizer(name, backtracked, i, cache_name):
    print("Running Minimizer:")
    minimizer = subprocess.Popen(["racket", "minimizer/minimize.rkt", "rendering",
                                  "minimizer/{}.rkt".format(cache_name), "["+",".join(backtracked)+"]"],
                                  stdout=subprocess.PIPE)

    result, _ = minimizer.communicate()

    if "Rejected" in result:
        print("Cassius rejected the minimized version, continuing...")
        sys.stdout.flush()
        lines = result.split()
        stats = json.loads(lines[1])
        STATISTICS.append((stats, i))
        return (False, lines[2:], stats["total"])
    elif "Minimized" in result:
        print("Minimized!")
        lines = result.split()
        remaining_boxes = int(lines[1])
        sys.stdout.flush()
        return (True, [], remaining_boxes)
    else:
        raise Exception()

def run_accept(name, cache_name, maxtime=600):
    print("Running Cassius:")
    cassius = subprocess.Popen(["racket", "src/run.rkt", "minimize",
                                "bench/"+name+".rkt",
                                "doc-1", "minimizer/{}.rkt".format(cache_name)], stdout=subprocess.PIPE)
    i = 0

    while cassius.poll() == None:
        if (i >= maxtime):
            print("Cassius timed out, backtracking...")
            cassius.terminate()
            sys.stdout.flush()
            return (True, -1)
        time.sleep(5)
        i += 5

    result, _ = cassius.communicate()

    if "Accepted" in result:
        print("Cassius accepted the minimized version, backtracking...")
        sys.stdout.flush()
        return (True, -1)
    elif "Error" in result:
        print("Cassius encountered an error, terminating")
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
    initial = -1
    name = args.name

    get_minimized(args.urls, eliminated, name)
    accepted, t = run_accept(name, args.name, maxtime=args.timeout)
    if accepted:
        raise Exception("Full FWT accepted")
    else:
        iterations += 1

    while True:
        minimized, elts, x = run_minimizer(name, backtracked, t, args.name)

        if initial == -1:
            initial = x

        if minimized:
            break

        eliminated.extend(elts)
        name = "{}-{}-minimized".format(args.name, iterations)
        get_minimized(args.urls, eliminated, name)
        accepted, t = run_accept(name, args.name, maxtime=args.timeout)
        if accepted:
            backtracked.append(eliminated.pop())
            STATISTICS.pop()
        else:
            iterations += 1

    total_time = time.time() - start

    if minimized == True:
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

        write_output(args.website, args.name, initial, initial - total_removed, total_time)
        sys.stdout.flush()
