#!/bin/python2.7

"""
Benchmark creator, for Cassius.

Uses Selenium Webdriver to download new benchmarks for Casssius.
Opens a page in Firefox, causes it to execute get_bench.js, and saves the result.
"""

from selenium import webdriver
import os, sys
import warnings
import collections
#import argparse
import subprocess
import json

if __name__ == "__main__":
    raw = sys.stdin.readline()
    data = json.loads(raw)

    failing = []

    if os.path.isfile("reports/minimized.html"):
        os.remove("reports/minimized.html")
    
    with open("reports/minimized.html", "w") as out:
        out.write('<!DOCTYPE html>\n')
        out.write('<html>\n')
        out.write('<style>\n')
        out.write('\ttbody td, tbody th { padding: 0 0.5em 0.5em; text-align: left; }\n')
        out.write('\ttd:nth-child(3), td:nth-child(4), td:nth-child(5) { text-align:right; }\n')
        out.write('\tthead th { padding: 0 0.5em; text-align: center; }\n')
        out.write('</style>\n')
        out.write('<body>\n')
        out.write('\t<table>\n')
        out.write('\t\t<thead><tr>\n')
        out.write('\t\t\t<th></th>\n')
        out.write('\t\t\t<th></th>\n')
        out.write('\t\t\t<th colspan="2"># Boxes</th>\n')
        out.write('\t\t\t<th></th>\n')
        out.write('\t\t</tr></thead>\n')
        out.write('\t\t<tbody>\n')
        out.write('\t\t<tr>\n')
        out.write('\t\t\t<th>Website</th>\n')
        out.write('\t\t\t<th>Problem</th>\n')
        out.write('\t\t\t<th>Before</th>\n')
        out.write('\t\t\t<th>After</th>\n')
        out.write('\t\t\t<th>Time (s)</th>\n')
        out.write('\t\t</tr>\n')

    for fwt in data:
        if fwt[u'status'] == u"fail":
            #print("python2 minimize.py {} {}".format(fwt[u'problem'], fwt[u'url']))
            os.system("python2 minimize.py {} {} --website=\"{}\"".format(fwt[u'problem'], fwt[u'url'], fwt[u'description']))

    with open("reports/minimized.html", "a") as out:
        out.write('\t\t</tbody>\n')
        out.write('\t</table>\n')
        out.write('</body>\n')
        out.write('</html>\n')
    