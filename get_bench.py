#!/bin/python3

from __future__ import print_function

"""
Benchmark creator, for Cassius.

Uses Selenium Webdriver to download new benchmarks for Cassius.
Opens a page in Firefox, causes it to execute get_bench.js, and saves the result.
"""

from selenium import webdriver
import os, sys
import warnings
try:
    import urllib.parse as parse
except:
    import urlparse as parse
import collections
import argparse

SCRIPT=open("get_bench.js", "rt").read()

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

def main(urls, prerun=None, name=None):
    browser = make_browser()

    try:
        urls = sorted([url if "://" in url else "file://" + os.path.abspath(url)
                       for url in urls])

        for url in urls:
            scheme, _, _, _, _, _ = parse.urlparse(url)
            if scheme not in ["http", "https", "file"]:
                warnings.warn("Only http and file scheme supported (not {})".format(scheme))
    
        if name:
            site_to_pages = {name:urls}
        else:
            site_to_pages = collections.defaultdict(list)
            for url in urls:
                _, netloc, _, _, _, _ = parse.urlparse(url)
                site_to_pages[netloc].append(url)

        measure_scrollbar(browser)
    
        for (netloc, urls) in sorted(site_to_pages.items()):
            fname = "bench/{}.rkt".format(netloc)
            with open(fname, "wb") as fi:
                print("Saving layout to {}:".format(fname), file=sys.stderr, end=" ")
                for i, url in enumerate(urls):
                    id = str(i+1).rjust(len(str(len(urls))), "0")
                    try:
                        browser.get(url)
                        if prerun: browser.execute_script(prerun)
                        browser.execute_script("window.LETTER = arguments[0];", "doc-" + id)
                        text = browser.execute_script(SCRIPT + "; return page2text(LETTER);").encode("utf8")
                        fi.write(b";; From ")
                        fi.write(url.encode("utf-8"))
                        fi.write(b"\n\n")
                        fi.write(text)
                        fi.write(b"\n\n")
                        print(id, file=sys.stderr, end=" ")
                    except:
                        import traceback
                        traceback.print_exc()
                        continue
            print(file=sys.stderr)
    finally:
        browser.quit()

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Download a website as Cassius test cases")
    p.add_argument("urls", metavar="URLs", type=str, nargs="+", help="URLs to dowload")
    p.add_argument("--name", dest="name", default=None, type=str, help="File name under bench/.")
    p.add_argument("--prerun", dest="prerun", type=argparse.FileType('r'), default=None, help="JS file to run before capturing.")
    args = p.parse_args()
    
    prerun = args.prerun.read() if args.prerun else None
    main(args.urls, prerun=prerun, name=args.name)
