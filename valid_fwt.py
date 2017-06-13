#!/bin/python3

import sys
import json
import urllib.request

def valid_files(url):
    if url.startswith("http"):
        fd = urllib.request.urlopen(url)
    else:
        fd = open(url, "rt")
    data = json.loads(fd.read().decode("utf-8"))
    valid = [rec["file"] for rec in data if rec["status"] == "success"]
    return valid

if __name__ == "__main__":
    for fname in valid_files(sys.argv[1]):
        print(fname)
