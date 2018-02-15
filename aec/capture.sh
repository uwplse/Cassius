#!/bin/sh

set -e

FWT_PATH=${1:-$HOME/src/fwt/}
CSSWG_PATH=${2:-$HOME/src/web-platform-tests/}css/CSS2
THREADS=${THREADS:-2}

for CSSWG in \
    abspos borders box-display box cascade floats-clear \
    floats linebox margin-padding-clear normal-flow positioning text;
do
    echo bench/css/$CSSWG.rkt
done | xargs make -j$THREADS bench/fwt.rkt
