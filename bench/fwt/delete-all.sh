#!/bin/sh

set -e

MYARG="$1"
shift

hash fuse-zip &>/dev/null || (echo "You need fuse-zip to use the get-all script"; exit 1)

tmpdir="$MYARG"

for FILE in "$@"; do
    NAME=`basename "$FILE" .zip`
    fusermount -u $tmpdir/$NAME
    rmdir $tmpdir/$NAME
done

rmdir $tmpdir