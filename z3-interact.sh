#!/bin/sh

cat "$1" - \
| stdbuf -o0 grep -v '^(set-option :print-success true)$' \
| stdbuf -o0 grep -v '^(get-model)$' \
| stdbuf -o0 grep -v '^(get-unsat-core)$' \
| z3 -smt2 -in
