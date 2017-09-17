#!/bin/sh

set -e

hash fuse-zip &>/dev/null || (echo "You need fuse-zip to use the get-all script"; exit 1)

tmpdir=$(mktemp -d /tmp/cassius-get-bench.XXXXXX.zip)
loc=

for FILE in "$@"; do
    NAME=`basename "$FILE" .zip`
    if [ ! -f "$FILE" ]; then
        curl -L -s https://freewebsitetemplates.com/download/"$NAME"/ > "$FILE"
    fi

    if [ ! -s "$FILE" ]; then
        printf "ERROR! Downloaded empty file in %s\n" "$FILE"
        rm "$FILE"
        exit 1
    fi

    mkdir $tmpdir/$NAME

    fuse-zip -r "$FILE" $tmpdir/$NAME
    loc="$loc $(find "$tmpdir/$NAME" -name 'index.html' | head -n1)"
done

xvfb-run -a -s '-screen 0 1920x1080x24' python2 get_bench.py --name fwt $loc

for FILE in "$@"; do
    NAME=`basename "$FILE" .zip`
    fusermount -u $tmpdir/$NAME
    rmdir $tmpdir/$NAME
done

rmdir $tmpdir
