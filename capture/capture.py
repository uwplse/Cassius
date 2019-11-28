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
    options = webdriver.firefox.options.Options()
    options.headless = True
    browser = webdriver.Firefox(options=options, firefox_profile=profile)
    measure_scrollbar(browser)
    return browser

def capture(browser, url, id, prerun=None):
    browser.get(url)
    if prerun: browser.execute_script(prerun)
    text = browser.execute_script(jsfile("all.js") + "; return page2text(arguments[0]);", id)
    return ";; From {}\n\n{}\n\n".format(url, text)

def name(urls):
    fns = [url.rsplit("/", 1)[1].rsplit(".", 1)[0] for url in urls]
    if len(fns) == len(set(fns)):
        return zip(fns, urls)
    else:
        out = []
        for i, url in enumerate(urls):
            id = str(i+1).rjust(len(str(len(urls))), "0")
            out.append(("doc-" + id, url))
        return out

def main(urls, prerun=None, fd=None):
    urls = sorted([url if "://" in url else "file://" + os.path.abspath(url)
                   for url in urls])

    for url in urls:
        scheme, _, _, _, _, _ = parse.urlparse(url)
        if scheme not in ["http", "https", "file"]:
            warnings.warn("Only http and file scheme supported (not {})".format(scheme))
    
    browser = make_browser()
    
    try:
        print("Saving layout to {}:".format(fd.name), file=sys.stderr, end=" ")
        for n, url in name(urls):
            try:
                fd.write(capture(browser, url, n, prerun=prerun))
                print(n, file=sys.stderr, end=" ")
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
    p.add_argument("--output", type=argparse.FileType('w'), default=sys.stdout, help="File name under bench/.")
    p.add_argument("--prerun", type=argparse.FileType('r'), help="JS file to run before capturing.")
    args = p.parse_args()
    
    prerun = args.prerun.read() if args.prerun else None
    main(args.urls, prerun=prerun, fd=args.output)
