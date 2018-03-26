from selenium import webdriver
import os, sys
import warnings
import urlparse
import collections
import argparse

SCRIPT=open("get_bench.js").read()
MINIMIZER=open("minimize.js").read()

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

def get_minimized(url, elts, name):
    browser = make_browser()

    try:        
        scheme, _, _, _, _, _ = urlparse.urlparse(url)
        if scheme not in ["http", "file"]:
            warnings.warn("Only http and file scheme supported (not {})".format(scheme))
    
        _, netloc, _, _, _, _ = urlparse.urlparse(url)
        print(netloc)

        measure_scrollbar(browser)
    
        fname = "reports/minimized/{}-minimized.rkt".format(name)
        with open(fname, "wb") as fi:
            print "Saving layout to {}:".format(fname),
            sys.stdout.flush()
            id = "1"
            try:
                browser.get(url)
                browser.execute_script('window.TAGLIST = [{}];'.format(",".join(elts)))
                browser.execute_script(MINIMIZER)
                browser.execute_script("window.LETTER = arguments[0];", "doc-" + id)
                browser.execute_script(SCRIPT + "; cassius(LETTER)")
                elt = browser.find_element_by_id("-x-cassius-output-block")
                text = elt.text.encode("utf8")
                fi.write(";; From {}\n\n{}\n\n".format(url, text))
                print "{}".format(id),
                sys.stdout.flush()
            except:
                import traceback
                traceback.print_exc()
            print("")
    finally:
        try:
            browser.quit()
        except Exception:
            return

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Download a website as Cassius test cases")
    p.add_argument("name", type=str, help="File name under reports/minimized.")
    p.add_argument("url", metavar="URLs", type=str, help="URLs to dowload")
    p.add_argument("elts", type=str, nargs="*", help="List of elts to remove (from Cassius)")
    args = p.parse_args()

    print(args.url)
    
    get_minimized(args.url, args.elts, args.name)