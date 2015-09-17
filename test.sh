#!/bin/sh
set -e

IFILE=`mktemp /tmp/tmp.XXXXXXXXXX`
OFILE=`mktemp /tmp/tmp.XXXXXXXXXX`

START=`date +%s%N | cut -b1-13`

run() {
    if racket cassius/run.rkt bench/$fname.rkt $pname >/dev/null 2>/tmp/cassius.test; then
        NOW=`date +%s%N | cut -b1-13`
        echo $fname $pname `tput setaf 2`✔`tput sgr0` "["$((NOW-START))ms"]"
        echo $fname $pname 1 >> $OFILE
    else
        NOW=`date +%s%N | cut -b1-13`
        echo $fname $pname `tput setaf 1`✘`tput sgr0` "["$((NOW-START))ms"]"
        echo $fname $pname 0 >> $OFILE
    fi
}

for arg in "$@"; do
    out=`echo $arg | tr : \ `
    fname=$(echo $out | cut -d\  -f1)
    pname=$(echo $out | cut -d\  -f2)
    echo $fname $pname >> $IFILE
    run $fname $pname &
done

GOING=1
while [[ $GOING = 1 ]]; do
    sleep .2
    A=`wc -l <$OFILE`
    B=`wc -l <$IFILE`
    if [[ $A = $B ]]; then GOING=0; fi
done

rm $OFILE
