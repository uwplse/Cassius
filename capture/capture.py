#!/bin/python3

from __future__ import print_function

"""
Benchmark creator, for Cassius.

Uses Selenium Webdriver to download new benchmarks for Cassius.
Opens a page in Firefox, causes it to execute get_bench.js, and saves the result.
"""

import selenium, selenium.webdriver
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

class Browser:
    def __init__(self):
        self.w, self.h, self.fs = 1280, 1024, 16
        self._make_browser()

    def _make_browser(self):
        while True:
            self.profile = selenium.webdriver.FirefoxProfile()
            self.profile.set_preference("security.mixed_content.block_active_content", False)
            self.profile.set_preference("security.mixed_content.block_display_content", False)
            self.options = selenium.webdriver.firefox.options.Options()
            self.options.headless = True
            if self._reset_browser(): return

    def _reset_browser(self):
        try:
            self.browser = selenium.webdriver.Firefox(options=self.options, firefox_profile=self.profile)
            self.browser.set_window_size(self.w, self.h)
            self.browser.profile.set_preference("layout.css.devPixelsPerPx", self.fs / 16)
            self.browser.profile.update_preferences()
            self.browser.get("about:blank");
            self.browser.execute_script(jsfile("scrollbar.js") + "; estimate_scrollbar()");
        except selenium.common.exceptions.JavascriptException:
            raise
        except selenium.common.exceptions.WebDriverException as e:
            warnings.warn("Restarting browser during reset due to exception:\n  {}".format(str(e)))
            return False
        else:
            return True

    def execute(self, url, code, *args):
        while True:
            try:
                self.browser.get(url)
                return self.browser.execute_script(code, *args)
            except selenium.common.exceptions.JavascriptException:
                raise
            except selenium.common.exceptions.WebDriverException as e:
                warnings.warn("Restarting browser on {} due to exception:\n  {}".format(url, str(e)))
                self._make_browser()

    def capture(self, url, id, prerun=None):
        code = ""
        if prerun: code += "; " + prerun
        code += "; " + jsfile("all.js")
        code += "; return page2text(arguments[0]);"
        text = self.execute(url, code, id)
        return ";; From {}\n\n{}\n\n".format(url, text)

    def __setitem__(self, key, value):
        if key == "w":
            self.w = value
        elif key == "h":
            self.h = value
        elif key == "fs":
            self.fs = value
        self._reset_browser()

    def quit(self):
        self.browser.quit()

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
    
    browser = Browser()
    
    try:
        captured = 0
        for n, url in name(urls):
            try:
                text = browser.capture(url, n, prerun=prerun)
            except selenium.common.exceptions.JavascriptException as e:
                print("JS Exception in {}: {}".format(n, e.msg), file=sys.stderr)
            else:
                fd.write(text)
                captured += 1
        print("Captured {}/{} layouts to {}".format(captured, len(urls), fd.name), file=sys.stderr)
    finally:
        browser.quit()

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Download a website as Cassius test cases")
    p.add_argument("urls", metavar="URLs", type=str, nargs="+", help="URLs to dowload")
    p.add_argument("--output", type=argparse.FileType('w'), default=sys.stdout, help="File name under bench/.")
    p.add_argument("--prerun", type=argparse.FileType('r'), help="JS file to run before capturing.")
    args = p.parse_args()
    
    prerun = args.prerun.read() if args.prerun else None
    if os.path.exists("geckodriver.log"):
        open("geckodriver.log", "w").close() # truncate
    main(args.urls, prerun=prerun, fd=args.output)
