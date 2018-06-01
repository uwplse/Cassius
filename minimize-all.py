#!/bin/python2.7

import sys
import subprocess
import json

if __name__ == "__main__":
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

    for fwt in data[u'problems']:
        if fwt[u'status'] == u"fail":
            sys.stderr.write("Running minimizer on {}".format(fwt[u'problem']))
            sys.stderr.flush()
            proc = subprocess.run(
                ["python2", "minimize.py", fwt[u'problem'], fwt[u'url'], "--website", fwt[u'description']],
                stdout=subprocess.PIPE)
            website, name, before, after, time = proc.stdout.split("\n")[-5:]
            print("<tr>")
            print("\t<td>{}</td>".format(website))
            print("\t<td>{}</td>".format(name))
            print("\t<td>{}</td>".format(before))
            print("\t<td>{}</td>".format(after))
            print("\t<td>{0:.2f}</td>".format(time))
            print("</tr>")

    print('\t\t</tbody>')
    print('\t</table>')
    print('</body>')
    print('</html>')
    
