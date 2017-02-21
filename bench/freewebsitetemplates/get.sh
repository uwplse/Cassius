#!/bin/sh

NAME=$1
shift

tmpdir=$(mktemp -d /tmp/cassius-get-bench.XXXXXX.zip)
curl -L -s https://freewebsitetemplates.com/download/"$NAME"/ > $tmpdir/zip.zip
unzip -q $tmpdir/zip.zip -d $tmpdir
loc=$(find "$tmpdir" -name 'index.html' | head -n1)
xvfb-run -s '-screen 0 1920x10800x24' python get_bench.py "file://$loc" --name freewebsitetemplates/"$NAME" "$@"
rm -r $tmpdir
if [ -f bench/freewebsitetemplates/"$NAME".patch ]; then
    patch bench/freewebsitetemplates/"$NAME".rkt bench/freewebsitetemplates/"$NAME".patch
fi
