#!/usr/bin/env bash

HARD=false

download_reports() {
    FLAGS="--checksum --inplace --ignore-existing"
    if [[ $HARD = "true" ]]; then
        FLAGS="--checksum"
    fi
    rsync --include '*.json' --include '/*/' --include '/*/*/' --exclude '*' \
           $FLAGS --recursive uwplse.org:/var/www/cassius/reports/ previous/
}

index () {
    if [[ $HARD = "true" ]]; then
        rm -f previous/index.cache
    fi
    racket infra/make-index.rkt --cache previous/index.cache previous/ previous/index.html
}

while getopts "h" opt; do
    case $opt in
        h) HARD=true ;;
        \?) echo "Invalid option -$OPTARG" >&2; ;;
    esac
done

CMD=${@:$OPTIND:1}

if [[ $CMD = "index" ]]; then
    index
elif [[ $CMD = "download" ]]; then
    download_reports
fi
