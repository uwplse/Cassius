#!/bin/sh

FILE=$1
shift

NAME=`basename "$FILE" .zip`

if [ ! -f "$FILE" ]; then
    curl -L -s https://freewebsitetemplates.com/download/"$NAME"/ > "$FILE"
fi

if [ ! -s "$FILE" ]; then
    printf "ERROR! Downloaded empty file in %s\n" "$FILE"
    rm "$FILE"
    exit 1
fi

tmpdir=$(mktemp -d /tmp/vizassert-get-bench.XXXXXX.zip)
unzip -q "$FILE" -d $tmpdir
loc=$(find "$tmpdir" -name 'index.html' | head -n1)
xvfb-run -a -s '-screen 0 1920x10800x24' python2 get_bench.py "file://$loc" --name fwt/"$NAME" "$@"
rm -r $tmpdir
