#!/bin/sh

NAME=$1
shift
xvfb-run -s '-screen 0 1920x10800x24' python2 get_bench.py --name css/"$NAME" "$@"
if [ -f bench/css/"$NAME".patch ]; then
    patch bench/css/"$NAME".rkt bench/css/"$NAME".patch
fi
