#!/bin/sh
set -e

FWT_PATH=${FWT_PATH:-$HOME/src/fwt/}
CSSWG_PATH=${CSSWG_PATH:-$HOME/src/web-platform-tests/css/CSS2}
THREADS=6

mkdir -p "$FWT_PATH"
mkdir -p "$CSSWG_PATH"

for FWT in `cat bench/fwt/all.txt`; do
    FILE=$FWT_PATH/$FWT.zip
    DIR=$FWT_PATH/$FWT/$FWT

    if [ ! -f "$FILE" ]; then
        curl -L -s https://freewebsitetemplates.com/download/"$FWT"/ > "$FILE"
    fi

    if [ ! -s "$FILE" ]; then
        printf "ERROR! Downloaded empty file in %s\n" "$FILE"
        rm "$FILE"
        exit 1
    fi

    if [ ! -d "$DIR" ]; then
        mkdir -p "$FWT_PATH/$FWT"
        if hash fuse-zip &>/dev/null; then
            fuse-zip -r "$FILE" "$FWT_PATH/$FWT"
        else
            unzip "$FILE" -d "$FWT_PATH/$FWT"
        fi
    fi
done

make clean
rm -f reports/rkt/* reports/json/*

for CSSWG in \
    abspos borders box-display box cascade floats-clear \
    floats linebox margin-padding-clear normal-flow positioning text;
do
    echo bench/css/$CSSWG.rkt
done | xargs make -j$THREADS bench/fwt.rkt

make FWT_PATH="$FWT_PATH" FLAGS="--verbose --threads $THREADS --cache reports/run.cache" \
     reports/fwt.html reports/vizassert.html reports/csswg.html reports/specific.html \
     reports/modular.html reports/minimized.html

mkdir -p reports/rkt/
mkdir -p reports/json/
cp bench/fwt.rkt bench/css/*.rkt reports/rkt/
mv reports/*.json reports/json/
