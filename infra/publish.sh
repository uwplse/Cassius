#!/usr/bin/env bash

download_reports() {
    rsync -v --include '*.json' --include '/*/' --include '/*/*/' --exclude '*' \
          --recursive uwplse.org:/var/www/cassius/reports/ previous/
}

index () {
    racket infra/make-index.rkt --cache reports/previous/index.cache previous/ reports/index.html
}

CMD="$1"

if [[ $CMD = "index" ]]; then
    index
elif [[ $CMD = "download" ]]; then
    download_reports
fi
