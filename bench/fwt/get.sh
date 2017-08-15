#!/bin/sh

NAME=$1
shift

if [ ! -f bench/fwt/"$NAME".zip ]; then
    curl -L -s https://freewebsitetemplates.com/download/"$NAME"/ > bench/fwt/"$NAME".zip
fi

if [ ! -s bench/fwt/"$NAME".zip ]; then
    printf "ERROR! Downloaded empty file in %s\n" bench/fwt/"$NAME".zip
    rm bench/fwt/"$NAME".zip
    exit 1
fi

tmpdir=$(mktemp -d /tmp/cassius-get-bench.XXXXXX.zip)
unzip -q bench/fwt/"$NAME".zip -d $tmpdir
loc=$(find "$tmpdir" -name 'index.html' | head -n1)
xvfb-run -s '-screen 0 1920x10800x24' python2 get_bench.py "file://$loc" --name fwt/"$NAME" "$@"
rm -r $tmpdir
if [ -f bench/fwt/"$NAME".patch ]; then
    patch bench/fwt/"$NAME".rkt bench/fwt/"$NAME".patch
fi
