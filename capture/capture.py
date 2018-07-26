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

def jsfile(name):
    return open(os.path.join(os.path.dirname(__file__), name), "rt").read()

def measure_scrollbar(browser):
    browser.get("about:blank");
    browser.execute_script(jsfile("scrollbar.js") + "; estimate_scrollbar()");

def make_browser():
    profile = webdriver.FirefoxProfile()
    profile.set_preference("security.mixed_content.block_active_content", False)
    profile.set_preference("security.mixed_content.block_display_content", False)
    return webdriver.Firefox(firefox_profile=profile)

def main(urls, prerun=None, fd=None):
    urls = sorted([url if "://" in url else "file://" + os.path.abspath(url)
                   for url in urls])

    for url in urls:
        scheme, _, _, _, _, _ = parse.urlparse(url)
        if scheme not in ["http", "https", "file"]:
            warnings.warn("Only http and file scheme supported (not {})".format(scheme))
    
    try:
        browser = make_browser()
        measure_scrollbar(browser)
    
        print("Saving layout to {}:".format(fd.name), file=sys.stderr, end=" ")
        for i, url in enumerate(urls):
            id = str(i+1).rjust(len(str(len(urls))), "0")
            try:
                browser.get(url)
                if prerun: browser.execute_script(prerun)
                text = browser.execute_script(jsfile("all.js") + "; return page2text(arguments[0]);", "doc-" + id).encode("utf8")
                fd.write(";; From ")
                fd.write(url)
                fd.write("\n\n")
                fd.write(text.decode("latin1")) # Latin1 will always succeed
                fd.write("\n\n")
                print(id, file=sys.stderr, end=" ")
            except:
                import traceback
                traceback.print_exc()
                continue
    finally:
        browser.quit()

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Download a website as Cassius test cases")
    p.add_argument("urls", metavar="URLs", type=str, nargs="+", help="URLs to dowload")
    p.add_argument("--output", type=argparse.FileType('w'), help="File name under bench/.")
    p.add_argument("--prerun", type=argparse.FileType('r'), help="JS file to run before capturing.")
    args = p.parse_args()
    
    prerun = args.prerun.read() if args.prerun else None
    main(args.urls, prerun=prerun, fd=args.output)
