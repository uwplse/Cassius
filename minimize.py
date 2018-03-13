#!/bin/python2.7

"""
Benchmark creator, for Cassius.

Uses Selenium Webdriver to download new benchmarks for Casssius.
Opens a page in Firefox, causes it to execute get_bench.js, and saves the result.
"""

from selenium import webdriver
import os, sys
import warnings
import urlparse
import collections
import argparse
import subprocess
import json
import time

SCRIPT=open("get_bench.js").read()
MINIMIZER=open("minimize.js").read()
STATISTICS=[]

def measure_scrollbar(browser):
    browser.get("about:blank");
    with open("capture/scrollbar.js") as f:
        script = f.read()
    browser.execute_script(script + "; estimate_scrollbar()");

def make_browser():
    profile = webdriver.FirefoxProfile()
    profile.set_preference("security.mixed_content.block_active_content", False)
    profile.set_preference("security.mixed_content.block_display_content", False)
    return webdriver.Firefox(firefox_profile=profile)

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

def get_bench(urls, elts, name=None):
    browser = make_browser()

    try:
        urls = sorted(["file://" + url if url.startswith("/") else url for url in urls])

        for url in urls:
            scheme, _, _, _, _, _ = urlparse.urlparse(url)
            if scheme not in ["http", "file"]:
                warnings.warn("Only http and file scheme supported (not {})".format(scheme))
    
        if name:
            site_to_pages = {name:urls}
        else:
            site_to_pages = collections.defaultdict(list)
            for url in urls:
                _, netloc, _, _, _, _ = urlparse.urlparse(url)
                site_to_pages[netloc].append(url)

        measure_scrollbar(browser)
    
        for (netloc, urls) in sorted(site_to_pages.items()):
            fname = "reports/minimized/{}-minimized.rkt".format(netloc)
            with open(fname, "wb") as fi:
                print "Saving layout to {}:".format(fname),
                sys.stdout.flush()
                for i, url in enumerate(urls):
                    id = str(i+1).rjust(len(str(len(urls))), "0")
                    try:
                        browser.get(url)
                        browser.execute_script('window.TAGLIST = [{}];'.format(",".join(elts)))
                        browser.execute_script(MINIMIZER)
                        browser.execute_script("window.LETTER = arguments[0];", "doc-" + id)
                        browser.execute_script(SCRIPT + "; cassius(LETTER)")
                        elt = browser.find_element_by_id("-x-cassius-output-block")
                        text = elt.text.encode("utf8")
                        fi.write(";; From {}\n\n{}\n\n".format(url, text))
                        print "{}".format(id),
                        sys.stdout.flush()
                    except:
                        import traceback
                        traceback.print_exc()
                        continue
                print("")
    finally:
        try:
            browser.quit()
        except Exception:
            pass


if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Download a website as Cassius test cases")
    p.add_argument("name", type=str, help="File name under bench/.")
    p.add_argument("urls", metavar="URLs", type=str, nargs="+", help="URLs to dowload")
    p.add_argument("--website", dest="website", default="", type=str, help="File name under bench/.")
    args = p.parse_args()
    
    eliminated = []
    start = time.time()
    get_bench(args.urls, eliminated, name=args.name)
    result, elts = run_accept(name=args.name)
    while result == 0:
        eliminated.extend(elts)
        get_bench(args.urls, eliminated, name=args.name)
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
