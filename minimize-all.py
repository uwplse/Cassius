#!/bin/python3

import sys
import subprocess
import json

if __name__ == "__main__":
    args = sys.argv[1:]

    data = json.load(sys.stdin)
    print('<!DOCTYPE html>')
    print('<html>')
    print('<style>')
    print('\ttbody td, tbody th { padding: 0 0.5em 0.5em; text-align: left; }')
    print('\ttd:nth-child(3), td:nth-child(4), td:nth-child(5) { text-align:right; }')
    print('\tthead th { padding: 0 0.5em; text-align: center; }')
    print('</style>')
    print('<body>')
    print('\t<table>')
    print('\t\t<thead><tr>')
    print('\t\t\t<th></th>')
    print('\t\t\t<th></th>')
    print('\t\t\t<th colspan="2"># Boxes</th>')
    print('\t\t\t<th></th>')
    print('\t\t</tr></thead>')
    print('\t\t<tbody>')
    print('\t\t<tr>')
    print('\t\t\t<th>Website</th>')
    print('\t\t\t<th>Problem</th>')
    print('\t\t\t<th>Before</th>')
    print('\t\t\t<th>After</th>')
    print('\t\t\t<th>Time (s)</th>')
    print('\t\t</tr>')

    for fwt in data['problems']:
        if fwt['status'] == "fail":
            sys.stderr.write("Running minimizer on {}".format(fwt['problem']))
            sys.stderr.flush()
            proc = subprocess.run(
                ["python3", "minimize.py", "--json"] + args + [fwt['problem'], fwt['url']],
                stdout=subprocess.PIPE)
            result = json.loads(proc.stdout.decode("utf-8"))
            print("<tr>")
            print("\t<td>{}</td>".format(fwt["description"]))
            print("\t<td>{}</td>".format(result["name"]))
            print("\t<td>{}</td>".format(result["before"]))
            print("\t<td>{}</td>".format(result["after"]))
            print("\t<td>{0:.2f}</td>".format(result["time"]))
            print("</tr>")

    print('\t\t</tbody>')
    print('\t</table>')
    print('</body>')
    print('</html>')
    
