#!/bin/python3

import sys
import subprocess
import argparse
import json

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Minimize all failing Cassius test cases")
    p.add_argument("--cache", default=None, type=str, help="Cache file")
    p.add_argument("json", type=argparse.FileType("r"), help="JSON input of a Cassius report")
    p.add_argument("html", type=argparse.FileType("w"), help="HTML output of minimizer report")
    args = p.parse_args()

    data = json.load(args.json)
    print('<!DOCTYPE html>', file=args.html)
    print('<html>', file=args.html)
    print('<style>', file=args.html)
    print('\ttbody td, tbody th { padding: 0 0.5em 0.5em; text-align: left; }', file=args.html)
    print('\ttd:nth-child(3), td:nth-child(4), td:nth-child(5) { text-align:right; }', file=args.html)
    print('\tthead th { padding: 0 0.5em; text-align: center; }', file=args.html)
    print('</style>', file=args.html)
    print('<body>', file=args.html)
    print('\t<table>', file=args.html)
    print('\t\t<thead><tr>', file=args.html)
    print('\t\t\t<th></th>', file=args.html)
    print('\t\t\t<th></th>', file=args.html)
    print('\t\t\t<th colspan="2"># Boxes</th>', file=args.html)
    print('\t\t\t<th></th>', file=args.html)
    print('\t\t</tr></thead>', file=args.html)
    print('\t\t<tbody>', file=args.html)
    print('\t\t<tr>', file=args.html)
    print('\t\t\t<th>Website</th>', file=args.html)
    print('\t\t\t<th>Problem</th>', file=args.html)
    print('\t\t\t<th>Before</th>', file=args.html)
    print('\t\t\t<th>After</th>', file=args.html)
    print('\t\t\t<th>Time (s)</th>', file=args.html)
    print('\t\t</tr>', file=args.html)

    for fwt in data['problems']:
        if fwt['status'] == "fail":
            print("Running minimizer on {}".format(fwt['problem']), file=sys.stderr)
            proc = subprocess.run(
                ["python3", "minimize.py", "--json"] +
                (["--cache", args.cache] if args.cache else []) +
                [fwt['problem'], fwt['url']],
                stdout=subprocess.PIPE)
            if proc.returncode > 0:
                raise Exception("Minimizer process failed!")
            result = json.loads(proc.stdout.decode("utf-8"))
            print("<tr>", file=args.html)
            print("\t<td>{}</td>".format(fwt["description"]), file=args.html)
            print("\t<td>{}</td>".format(result["name"]), file=args.html)
            print("\t<td>{}</td>".format(result["before"]), file=args.html)
            print("\t<td>{}</td>".format(result["after"]), file=args.html)
            print("\t<td>{0:.2f}</td>".format(result["time"]), file=args.html)
            print("</tr>", file=args.html)

    print('\t\t</tbody>', file=args.html)
    print('\t</table>', file=args.html)
    print('</body>', file=args.html)
    print('</html>', file=args.html)
    
