#!/bin/python3

"""
Random tester, for Cassius.

Uses Selenium Webdriver to test assertions on web pages.
"""

from selenium import webdriver
import os, sys
import warnings
import random
try:
    import urllib.parse as parse
except:
    import urlparse as parse
import argparse

def make_browser():
    profile = webdriver.FirefoxProfile()
    profile.set_preference("security.mixed_content.block_active_content", False)
    profile.set_preference("security.mixed_content.block_display_content", False)
    return webdriver.Firefox(firefox_profile=profile)

def sample_range((mi, ma)):
    return random.randint(mi, ma)

def main(num, urls, code, params):
    browser = make_browser()

    try:
        for url in urls:
            scheme, _, _, _, _, _ = parse.urlparse(url)
            if scheme not in ["http", "https", "file"]:
                warnings.warn("Only http and file scheme supported (not {})".format(scheme))
    
        for url in urls:
            try:
                for i in range(num):
                    w = sample_range(params.width)
                    h = sample_range(params.height)
                    fs = sample_range(params.font) / 16.
                    browser.set_window_size(w, h)
                    browser.profile.set_preference("layout.css.devPixelsPerPx", fs)
                    browser.profile.update_preferences()
                    browser.get(url)
                    if not browser.execute_script(code):
                        browser.quit()
                        print(":width " + str(w))
                        print(":height " + str(h))
                        print(":font " + str(fs))
                        sys.exit(1)
            except:
                import traceback
                traceback.print_exc()
                continue
    finally:
        browser.quit()

    sys.exit(0)

def parse_range(s):
    a, b = s.split("--", 1)
    return (int(a), int(b))

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Cassius random tester")
    p.add_argument("urls", metavar="URLs", type=str, nargs="+", help="URLs to test")
    p.add_argument("--num", "-n", type=int, default=1, help="How many tests to run")
    p.add_argument("--width", type=parse_range, default=(1024,1920), help="The range of browser widths")
    p.add_argument("--height", type=parse_range, default=(800,1280), help="The range of browser heights")
    p.add_argument("--font", type=parse_range, default=(16,32), help="The range of browser font sizes")
    args = p.parse_args()
    code = sys.stdin.read()
    
    main(args.num, args.urls, code, args)
