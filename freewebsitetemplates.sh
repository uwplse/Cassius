#!/bin/sh

name=$1
shift

tmpdir=$(mktemp -d /tmp/cassius-get-bench.XXXXXX.zip)
curl -L -s https://freewebsitetemplates.com/download/$name/ > $tmpdir/zip.zip
unzip -q $tmpdir/zip.zip -d $tmpdir
loc=$(find "$tmpdir" -name 'index.html' | head -n1)
python get_bench.py "file://$loc" --name freewebsitetemplates/"$name" "$@"
rm -r $tmpdir
