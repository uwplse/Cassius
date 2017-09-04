#lang info

(define collection "cassius")
(define version "2.0")

;; Packaging information

(define pkg-desc "Automated reasoning about web page layout")
(define pkg-authors
  '("Pavel Panchekha"
    "Adam Timothy Geller"
    "Shoaib Kamil"
    "Zachary Tatlock"
    "Michael Ernst"))

;; The `cassius` command-line tool

(define racket-launcher-names '("cassius"))
(define racket-launcher-libraries '("run.rkt"))

;; Dependencies

(define deps
  '(("base" #:version "6.3")
    "math-lib"
    "rackunit-lib"))

(define build-deps
  '("rackunit-lib"))

(define compile-omit-paths '("old"))
(define test-omit-paths '("old"))
