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

def make_browser(browser):
    if browser == "firefox":
        profile = webdriver.FirefoxProfile()
        profile.set_preference("security.mixed_content.block_active_content", False)
        profile.set_preference("security.mixed_content.block_display_content", False)
        client = webdriver.Firefox(firefox_profile=profile)
        measure_scrollbar(client)
        return client
    elif browser == "chrome":
        from selenium.webdriver.chrome.options import Options
        opts = Options()
        opts.add_argument("--disable-web-security")
        opts.add_argument("--start-maximized")
        opts.add_argument("--allow-running-insecure-content")
        opts.add_argument('--headless')
        return webdriver.Chrome(chrome_options=opts)
    else:
        raise ValueError("Unknown browser" + browser)

def capture(client, browser, url, id, prerun=None):
    client.get(url)
    if prerun: client.execute_script(prerun)
    text = client.execute_script(jsfile("all.js") + "; return page2text(arguments[0], arguments[1]);", id, browser)
    return ";; From {}\n\n{}\n\n".format(url, text)

def main(urls, prerun=None, fd=None, browser="firefox"):
    urls = sorted([url if "://" in url else "file://" + os.path.abspath(url)
                   for url in urls])

    for url in urls:
        scheme, _, _, _, _, _ = parse.urlparse(url)
        if scheme not in ["http", "https", "file"]:
            warnings.warn("Only http and file scheme supported (not {})".format(scheme))
    
    try:
        client = make_browser(browser)
    
        print("Saving {} layout to {}:".format(browser, fd.name), file=sys.stderr, end=" ")
        for i, url in enumerate(urls):
            id = str(i+1).rjust(len(str(len(urls))), "0")
            try:
                fd.write(capture(client, browser, url, "doc-" + id, prerun=prerun))
                print(id, file=sys.stderr, end=" ")
            except:
                import traceback
                traceback.print_exc()
                continue
        print(file=sys.stderr)
    finally:
        client.quit()

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Download a website as Cassius test cases")
    p.add_argument("urls", metavar="URLs", type=str, nargs="+", help="URLs to dowload")
    p.add_argument("--browser", default="firefox", help="Which browser to use")
    p.add_argument("--output", type=argparse.FileType('w'), default=sys.stdout, help="File name under bench/.")
    p.add_argument("--prerun", type=argparse.FileType('r'), help="JS file to run before capturing.")
    args = p.parse_args()
    
    prerun = args.prerun.read() if args.prerun else None
    main(args.urls, prerun=prerun, fd=args.output, browser=args.browser)
