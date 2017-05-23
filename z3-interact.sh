#!/bin/sh

cat "$1" - \
| z3 -smt2 -in
