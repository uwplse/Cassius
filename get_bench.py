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

SCRIPT=open("get_bench.js").read()

def measure_scrollbar(browser):
    browser.get("about:blank");
    with open("capture/scrollbar.js") as f:
        script = f.read()
    browser.execute_script(script + "; exfiltrate(estimate_scrollbar())");
    elt = browser.find_element_by_id("-x-cassius-output-block");
    return int(elt.text)

def make_browser():
    profile = webdriver.FirefoxProfile()
    profile.set_preference("security.mixed_content.block_active_content", False)
    profile.set_preference("security.mixed_content.block_display_content", False)
    return webdriver.Firefox(firefox_profile=profile)

def main(urls, name=None, screenshot=False):
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

        scrollbar = measure_scrollbar(browser)
        print "Scrollbar:", scrollbar
    
        for (netloc, urls) in sorted(site_to_pages.items()):
            fname = "bench/{}.rkt".format(netloc)
            with open(fname, "wb") as fi:
                print "Saving layout to {}:".format(fname),
                sys.stdout.flush()
                for i, url in enumerate(urls):
                    id = str(i+1).rjust(len(str(len(urls))), "0")
                    try:
                        browser.get(url)
                        if screenshot:
                            iname = "bench/{}-{}.png".format(netloc, id)
                            print "Saving screenshot to", iname
                            browser.save_screenshot(iname)
                        browser.execute_script("window.LETTER = arguments[0];", "doc-" + id)
                        browser.execute_script("window.SCROLLBAR = arguments[0];", scrollbar)
                        browser.execute_script(SCRIPT + "; cassius(LETTER, SCROLLBAR)")
                        elt = browser.find_element_by_id("-x-cassius-output-block");
                        text = elt.text.encode("utf8")
                        fi.write(";; From {}\n\n{}\n\n".format(url, text))
                        print "{}".format(id),
                        sys.stdout.flush()
                    except:
                        import traceback
                        traceback.print_exc()
                        continue
    finally:
        browser.quit()

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Download a website as Cassius test cases")
    p.add_argument("urls", metavar="URLs", type=str, nargs="+", help="URLs to dowload")
    p.add_argument("--name", dest="name", default=None, type=str, help="File name under bench/.")
    p.add_argument("--screenshot", dest="screenshot", default=False, action="store_true", help="File name under bench/.")
    args = p.parse_args()
    
    main(args.urls, name=args.name, screenshot=args.screenshot)
