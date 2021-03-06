#!/bin/python3

"""
Random tester, for Cassius.

Uses Selenium Webdriver to test assertions on web pages.
"""

from selenium import webdriver
import capture
import os, sys
import warnings
import random
import itertools
try:
    import urllib.parse as parse
except:
    import urlparse as parse
import argparse

def all_params(params, num, exhaustive=False):
    if not exhaustive:
        for i in range(num):
            w = random.randint(*params.width)
            h = random.randint(*params.height)
            fs = random.randint(*params.font) / 16.
            yield w, h, fs
    else:
        wi, wa = params.width
        hi, ha = params.height
        fi, fa = params.font
        for i in itertools.product(range(wi, wa+1), range(hi, ha+1), range(fi, fa+1)):
            yield i

def main(num, urls, code, params):
    browser = capture.Browser()

    try:
        for url in urls:
            scheme, _, _, _, _, _ = parse.urlparse(url)
            if scheme not in ["http", "https", "file"]:
                warnings.warn("Only http and file scheme supported (not {})".format(scheme))
    
        for url in urls:
            for w, h, fs in all_params(params, args.num, args.exhaustive):
                try:
                    browser["w"] = w
                    browser["h"] = h
                    browser["fs"] = fs
                    if not browser.execute(code):
                        browser.quit()
                        print(":w", w)
                        print(":h", h)
                        print(":fs", fs)
                        sys.exit(1)
                except:
                    import traceback
                    traceback.print_exc()
                    continue
    finally:
        browser.quit()

    sys.exit(0)

def parse_range(s):
    if "--" in s:
        a, b = s.split("--", 1)
        return (int(a), int(b))
    else:
        return (int(s), int(s))

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Cassius random tester")
    p.add_argument("urls", metavar="URLs", type=str, nargs="+", help="URLs to test")
    p.add_argument("--num", "-n", type=int, default=1, help="How many tests to run")
    p.add_argument("--width", type=parse_range, default=(1024,1920), help="The range of browser widths")
    p.add_argument("--height", type=parse_range, default=(800,1280), help="The range of browser heights")
    p.add_argument("--font", type=parse_range, default=(16,32), help="The range of browser font sizes")
    p.add_argument("--exhaustive", action="store_true", help="Whether to test across all possible params")
    args = p.parse_args()
    code = sys.stdin.read()
    
    main(args.num, args.urls, code, args)
