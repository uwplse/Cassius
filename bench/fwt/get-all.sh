#!/bin/sh

hash fuse-zip &>/dev/null || (echo "You need fuse-zip to use the get-all script"; exit 1)

tmpdir=$(mktemp -d /tmp/cassius-get-bench.XXXXXX.zip)
loc=

for NAME in "$@"; do
    if [ ! -f bench/fwt/"$NAME".zip ]; then
        curl -L -s https://freewebsitetemplates.com/download/"$NAME"/ > bench/fwt/"$NAME".zip
    fi

    if [ ! -s bench/fwt/"$NAME".zip ]; then
        printf "ERROR! Downloaded empty file in %s\n" bench/fwt/"$NAME".zip
        rm bench/fwt/"$NAME".zip
        exit 1
    fi

    mkdir $tmpdir/$NAME

    fuse-zip -r bench/fwt/"$NAME".zip $tmpdir/$NAME
    loc="$loc $(find "$tmpdir" -name 'index.html' | head -n1)"
done

xvfb-run -s '-screen 0 1920x1080x24' python2 get_bench.py --name fwt $loc

for NAME in "$@"; do
    fusermount -u $tmpdir/$NAME
done
