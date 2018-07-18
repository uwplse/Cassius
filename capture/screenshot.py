#!/bin/python3

"""
Screenshot taker, for Cassius.

Uses Selenium Webdriver to take screenshots of web pages.
"""

from selenium import webdriver
import os, sys
import warnings
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

def main(urls, fnames, prerun=None):
    browser = make_browser()

    try:
        for url in urls:
            scheme, _, _, _, _, _ = parse.urlparse(url)
            if scheme not in ["http", "https", "file"]:
                warnings.warn("Only http and file scheme supported (not {})".format(scheme))
    
        for url, fname in zip(urls, fnames):
            try:
                browser.get(url)
                if prerun: browser.execute_script(prerun)
                print("Saving {} to {}".format(url, fname))
                browser.save_screenshot(fname)
            except:
                import traceback
                traceback.print_exc()
                continue
    finally:
        browser.quit()

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Download a website as Cassius test cases")
    p.add_argument("urls", metavar="URLs", type=str, nargs="+", help="URLs to dowload")
    p.add_argument("--prerun", dest="prerun", type=argparse.FileType('r'), default=None, help="JS file to run before capturing.")
    args = p.parse_args()
    
    prerun = args.prerun.read() if args.prerun else None
    urls = args.urls[::2]
    names = args.urls[1::2]

    main(urls, names, prerun=prerun)
