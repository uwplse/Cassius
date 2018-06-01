#!/bin/python2.7

import sys
import subprocess
import json

if __name__ == "__main__":
    data = json.load(sys.stdin)

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

    for fwt in data[u'problems']:
        if fwt[u'status'] == u"fail":
            subprocess.run(["python2", "minimize.py", fwt[u'problem'], fwt[u'url'], "--website", fwt[u'description']])

    with open("reports/minimized.html", "a") as out:
        out.write('\t\t</tbody>\n')
        out.write('\t</table>\n')
        out.write('</body>\n')
        out.write('</html>\n')
    
