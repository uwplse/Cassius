"""
Benchmark creator, for Cassius.

Uses Selenium Webdriver to download new benchmarks for Casssius.
Opens a page in Firefox, causes it to execute get_bench.js, and saves the result.
"""

from selenium import webdriver
import SimpleHTTPServer, SocketServer, socket
import threading
import os, sys, shutil
import urlparse, urllib
import collections

PORT=8000
PATH="/home/pavpan/cassius"

class ScriptServer(threading.Thread):
    def __init__(self):
        global PORT
        threading.Thread.__init__(self)
        os.chdir(PATH)
        handler = SimpleHTTPServer.SimpleHTTPRequestHandler
        while True:
            try:
                self.httpd = SocketServer.TCPServer(("", PORT), handler)
            except socket.error:
                PORT += 1
            else:
                break

    def run(self):
        self.httpd.serve_forever()

    def quit(self):
        self.httpd.shutdown()

def make_server():
    server = ScriptServer()
    server.start()
    return server

def make_browser():
    return webdriver.Firefox()

class CassiusInput():
    def __init__(self, fd):
        self.fd = fd
        self.fd.write("""#lang racket
(require "../cassius/main.rkt")

(define header
"")

(define sheet (stylesheet 'main.css 5))

""")
        self.fd.flush()
        self.ids = []

    def write(self, id, text):
        self.fd.write(text + "\n\n")
        self.fd.flush()
        self.ids.append(id)
        
    def close(self):
        self.fd.write("""(print-rules #:stylesheet sheet #:header header
             (solve #:debug #f
              (append
               (make-preamble)
               (stylesheet-constraints sheet)\n""")
        for id in self.ids:
            self.fd.write("               (dom-constraints {})\n".format(id))
        self.fd.write("               (list '(check-sat)))))\n")
        self.fd.flush()

def get_bench_output(browser, letter, url, file):
    js = """window.LETTER = arguments[0]; (function(x){x.src = "http://localhost:""" + str(PORT) + """/get_bench.js"; document.querySelector("head").appendChild(x)})(document.createElement("script"));"""

    browser.get(url)
    browser.execute_script(js, letter)
    elt = browser.find_element_by_id("--cassius-output-block");
    text = elt.text.decode("utf8")
    file.write("dom" + letter, text)

def main(urls):
    server = make_server()
    browser = make_browser()

    site_to_pages = collections.defaultdict(list)
    for url in urls:
        scheme, netloc, _, _, _, _ = urlparse.urlparse(url)
        if scheme != "http":
            warnings.warn("Only http scheme supported (not {})".format(url), UserWarning)
        else:
            site_to_pages[netloc].append(url)

    for (netloc, urls) in site_to_pages.items():
        fname = "bench/{}.rkt".format(netloc)
        print "Saving layout to {}".format(fname)
        with open(fname, "wb") as f:
            fi = CassiusInput(f)
            for i, url in enumerate(urls):
                letter = chr(ord('a') + i)
                get_bench_output(browser, letter, url, fi)
                src = urllib.urlopen(url)
                fname2 = "bench/{}-{}.html".format(netloc, letter)
                print "Saving source to {}".format(fname2)
                with open(fname2, "wb") as f2:
                    shutil.copyfileobj(src, f2)
            fi.close()

    browser.quit()
    server.quit()

if __name__ == "__main__":
    main(sys.argv[1:])
