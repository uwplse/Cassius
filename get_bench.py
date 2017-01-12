#!/bin/python2.7

"""
Benchmark creator, for Cassius.

Uses Selenium Webdriver to download new benchmarks for Casssius.
Opens a page in Firefox, causes it to execute get_bench.js, and saves the result.
"""

from selenium import webdriver
import warnings
import threading
import os, sys, shutil
import urlparse, urllib
import collections
import argparse

PORT=8000
PATH="."
SCREENSHOT=False
SCRIPT=open("get_bench.js").read()

def make_browser():
    profile = webdriver.FirefoxProfile()
    profile.set_preference("security.mixed_content.block_active_content", False)
    profile.set_preference("security.mixed_content.block_display_content", False)
    return webdriver.Firefox(firefox_profile=profile)

class CassiusInput():
    def __init__(self, fd, urls, name):
        self.fd = fd
        self.fd.write(""";; python get_bench.py --name {} {}
""".format(name, " ".join("'{}'".format(url) for url in urls)))
        self.fd.flush()
        self.ids = []

    def write(self, id, text):
        self.fd.write(text + "\n\n")
        self.fd.flush()
        self.ids.append(id)

    def close(self):
        self.fd.flush()

def get_bench_output(browser, letter, url, file):
    browser.execute_script("window.LETTER = arguments[0];", letter)
    browser.execute_script(SCRIPT)
    elt = browser.find_element_by_id("-x-cassius-output-block");
    text = elt.text.encode("utf8")
    file.write("doc-" + letter, ";; From {}\n\n{}".format(url, text))

def main(urls, name=None):
    browser = make_browser()

    try:
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
    
        for (netloc, urls) in sorted(site_to_pages.items()):
            fname = "bench/{}.rkt".format(netloc)
            with open(fname, "wb") as f:
                fi = CassiusInput(f, urls, netloc)
                for i, url in enumerate(urls):
                    letter = str(i+1).rjust(len(str(len(urls))), "0")
                    iname = "bench/{}-{}.png".format(netloc, letter)
                    try:
                        browser.get(url)
                        if SCREENSHOT:
                            print "Saving screenshot to", iname
                            browser.save_screenshot(iname)
                        print "Saving layout to {}".format(fname)
                        get_bench_output(browser, letter, url, fi)
                    except:
                        continue
                    scheme, _, _, _, _, _ = urlparse.urlparse(url)
                    #if scheme == "http":
                    #    src = urllib.urlopen(url)
                    #    fname2 = "bench/{}-{}.html".format(netloc, letter)
                    #    print "Saving source to {}".format(fname2)
                    #    with open(fname2, "wb") as f2:
                    #        shutil.copyfileobj(src, f2)
                fi.close()
    finally:
        browser.quit()

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Download a website as Cassius test cases")
    p.add_argument("urls", metavar="URLs", type=str, nargs="+", help="URLs to dowload")
    p.add_argument("--name", dest="name", default=None, type=str, help="File name under bench/.")
    p.add_argument("--screenshot", dest="screenshot", default=False, action="store_true", help="File name under bench/.")
    args = p.parse_args()
    
    SCREENSHOT = args.screenshot

    main(args.urls, name=args.name)
