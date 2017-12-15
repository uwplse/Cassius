#!/usr/bin/env bash

HARD=false

download () {
    FLAGS="--checksum --inplace --ignore-existing"
    if [[ $HARD = "true" ]]; then
        FLAGS="--checksum"
    fi
    rsync --include '*.json' --include "*/" --exclude '*' \
           $FLAGS --recursive uwplse.org:/var/www/cassius/reports/ previous/
}

index () {
    if [[ $HARD = "true" ]]; then
        rm -f previous/index.cache
    fi
    racket infra/make-index.rkt --cache previous/index.cache previous/
}

upload () {
    rsync -q --chmod=644 previous/* uwplse.org:/var/www/cassius/reports/
}

while getopts "h" opt; do
    case $opt in
        h) HARD=true ;;
        \?) echo "Invalid option -$OPTARG" >&2; ;;
    esac
done

CMD=${@:$OPTIND}

for cmd in $CMD; do
    $cmd
done
