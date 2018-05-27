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

def run_assertion(name, cache_name, backtracked, assertfile, assertname, maxtime=600):
    print("Running VizAssert:")
    cassius = subprocess.Popen(["racket", "src/run.rkt", "minimize-assertion", "--cache", cache_name,
                                assertfile, assertname,
                                "bench/"+name+".rkt",
                                "doc-1", "[{}]".format(",".join(backtracked))], stdout=subprocess.PIPE)
    i = 0

    accepted, _, _, _ = run_accept(name, cache_name + "accept", backtracked, assertfile, assertname, maxtime)

    if not accepted:
        print("Cassius rejected minimized version, backtracking")
        cassius.terminate()
        return (True, False, [], -1)

    while cassius.poll() == None:
        if (i >= maxtime):
            print("VizAssert timed out, backtracking...")
            cassius.terminate()
            sys.stdout.flush()
            return (True, False, [], -1)
        time.sleep(5)
        i += 5

    result, _ = cassius.communicate()

    if "Verified" in result:
        print("VizAssert verified the minimized version, backtracking...")
        sys.stdout.flush()
        return (True, False, [], -1)
    elif "Rejected" in result:
        print("VizAssert rejected the minimized version, continuing...")
        sys.stdout.flush()
        lines = result.split()
        stats = json.loads(lines[1])
        STATISTICS.append((stats, i))
        return (False, False, lines[2:], stats["total"])
    elif "Minimized" in result:
        print("Minimized!")
        lines = result.split()
        remaining_boxes = int(lines[1])
        sys.stdout.flush()
        return (False, True, [], remaining_boxes)
    elif "Error" in result:
        print("VizAssert encountered an error, terminating")
        sys.stdout.flush()
        raise Exception()

    return (False, i)

def run_accept(name, cache_name, backtracked, assertfile, assertname, maxtime=600):
    print("Running Cassius:")
    cassius = subprocess.Popen(["racket", "src/run.rkt", "minimize", "--cache", cache_name,
                                "bench/"+name+".rkt",
                                "doc-1", "[{}]".format(",".join(backtracked))], stdout=subprocess.PIPE)
    i = 0

    while cassius.poll() == None:
        if (i >= maxtime):
            print("Cassius timed out, backtracking...")
            cassius.terminate()
            sys.stdout.flush()
            return (True, False, [], -1)
        time.sleep(5)
        i += 5

    result, _ = cassius.communicate()

    if "Accepted" in result:
        print("Cassius accepted the minimized version, backtracking...")
        sys.stdout.flush()
        return (True, False, [], -1)
    elif "Rejected" in result:
        print("Cassius rejected the minimized version, continuing...")
        sys.stdout.flush()
        lines = result.split()
        stats = json.loads(lines[1])
        STATISTICS.append((stats, i))
        return (False, False, lines[2:], stats["total"])
    elif "Minimized" in result:
        print("Minimized!")
        lines = result.split()
        remaining_boxes = int(lines[1])
        sys.stdout.flush()
        return (False, True, [], remaining_boxes)
    elif "Error" in result:
        print("Cassius encountered an error, terminating")
        sys.stdout.flush()
        raise Exception()

    return (False, False, [], i)

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

def minimize(args, run, afile, aname):
    iterations = 0
    eliminated = []
    backtracked = [u'{"tag":"head","index":0}', u'{"tag":"meta","index":0}', u'{"tag":"title","index":0}']
    start = time.time()
    name = args.name

    get_minimized(args.urls, eliminated, name)
    accepted, minimized, elts, initial = run(name, args.name, backtracked, afile, aname, maxtime=args.timeout)
    if accepted:
        raise Exception("Full FWT accepted")
    else:
        iterations += 1

    while not minimized:
        eliminated.extend(elts)
        name = "{}-{}-minimized".format(args.name, iterations)
        get_minimized(args.urls, eliminated, name)
        accepted, minimized, elts, _ = run(name, args.name, backtracked, afile, aname, maxtime=args.timeout)

        if accepted:
            backtracked.append(eliminated.pop())
            STATISTICS.pop()

        iterations += 1

    print(eliminated)

    total_time = time.time() - start

    if minimized == True:
        total_removed = 0
        i = 0
        print("\n\nStatistics:")

        print("Iteration\tBeginning #\t# Removed (%)\t# Remaining")
        for (stats,i_time) in STATISTICS:
            print("{0}\t\t{1}\t\t{2} ({3:.2f})\t\t{4}".format(i,stats["total"], stats["removed"], float(stats["efficiency"]), stats["total"] - stats["removed"]))
            total_removed += stats["removed"]
            sys.stdout.flush()
            i += 1

        print('\nIn total, {0} boxes were removed in {1} iteration(s), taking {2:.2f} seconds.'.format(total_removed, iterations, total_time))
        print('A total of {0} boxes remained for a {1:.2f}% reduction overall.'.format(initial - total_removed, (total_removed * 100.0) / initial))

        write_output(args.website, args.name, initial, initial - total_removed, total_time)
        sys.stdout.flush()

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Download a website as Cassius test cases")
    p.add_argument("name", type=str, help="File name under bench/.")
    p.add_argument("urls", metavar="URLs", type=str, help="URLs to dowload")
    p.add_argument("--website", dest="website", default="", type=str, help="File name under bench/.")
    p.add_argument("--timeout", dest="timeout", default=600, type=int, help="Timeout for each running instance of Cassius/.")
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
    sys.stdout.flush()