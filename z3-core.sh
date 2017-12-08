#!/bin/sh

echo "(get-unsat-core)" \
| cat "$1" - \
| z3 -smt2 -in \
| grep -v error \
| grep -v sat \
| tr -d '()' \
| tr ' ' '\n' \
| xargs -n1 -I '{}' grep '{})' "$1" \
| sed 's/(assert (! //g' \
| sed 's/ :named .*$//g'
