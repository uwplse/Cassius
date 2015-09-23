#!/bin/sh
set -e

MAX=0

run() {
    local START=`date +%s%N | cut -b1-13`
    if nice racket cassius/run.rkt bench/$fname.rkt $pname >/dev/null 2>/tmp/cassius.test; then
        local NOW=`date +%s%N | cut -b1-13`
        echo $fname $pname `tput setaf 2`✔`tput sgr0` "["$((NOW-START))ms"]" 1>&2
        echo $fname $pname 1
    else
        local NOW=`date +%s%N | cut -b1-13`
        echo $fname $pname `tput setaf 1`✘`tput sgr0` "["$((NOW-START))ms"]" 1>&2
        echo $fname $pname 0
    fi
}

wait() {
    GOING=1
    while [[ $GOING = 1 ]]; do
        sleep .2
        A=`wc -l <$OFILE`
        B=`wc -l <$IFILE`
        if [[ $((B-A)) -lt $MAX ]]; then GOING=0; fi
    done
}

while getopts "j:" flag; do
    case "${flag}" in
        j) MAX="${OPTARG}"; shift ;;
        *) break ;;
    esac
done


if [[ $MAX = 0 ]]; then
    for arg in "$@"; do
        out=`echo $arg | tr : \ `
        fname=$(echo $out | cut -d\  -f1)
        pname=$(echo $out | cut -d\  -f2)
        run $fname $pname >/dev/null
    done
else
    IFILE=`mktemp /tmp/tmp.XXXXXXXXXX`
    OFILE=`mktemp /tmp/tmp.XXXXXXXXXX`
    for arg in "$@"; do
        out=`echo $arg | tr : \ `
        fname=$(echo $out | cut -d\  -f1)
        pname=$(echo $out | cut -d\  -f2)
        echo $fname $pname >> $IFILE
        run $fname $pname >> $OFILE &
        wait
    done
    wait
    rm $OFILE
fi
