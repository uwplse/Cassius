Gettings Started with the Cassius OOPSLA'16 Artifact
=====================================================

The Cassius artifact for OOPSLA'16 is available in two formats: source
and virtual machine. Both should have identical functionality, but the
substantial setup costs involved may make reviewers prefer the virtual
machine.

Both can be downloaded from
https://www.dropbox.com/sh/8aa5lva58pak5zd/AAADr8Z3CmKuWNtP6wlJWAWFa?dl=0

To get started, download the source archive or the virtual machine.
The virtual machine should log in automatically, but in any case the
username and password are both `aec`. Both the source archive and the
virtual machine ought to contain the `AEC.html` file, which contains
detailed instructions for reproducing the experiments in the paper.

Cassius (OOPSLA'16 Paper #69) is a mechanized formalization of a
substantial fragment of the semantics of CSS 2.1. As such, the most
important aspect of the artifact is its correct and efficient
formalization of the CSS 2.1 standard.

Evaluations included in this artifact
-------------------------------------

This artifact is thus chiefly concerned with replicating the
*acceptance* and *rejection* tests in §5.1.1 and §5.1.2 of the paper.
These tests can be examined and automatically rerun.

This artifact also includes the 5 web sites discussed in §5.2, and
describes how to run acceptance, verification, debugging, and
synthesis tasks for each web site.

This artifact does not include a formalization of CSS without the
restrictions to floating boxes that allow a linear number of
constraints, so there is no possibility of testing the experiments
discussed in §5.3.

Installing Cassius
------------------

This section may be skipped if you are working from the virtual
machine image. Otherwise, Cassius can be installed and run from
source.

Before installing Cassius, please install Racket (6.3 or higher) and
Z3 (4.4.2).

Racket can be installed from
[its website](https://download.racket-lang.org/), while Z3 must be
[built from source](https://github.com/Z3Prover/z3). To extract web
pages to Cassius format, you will also need
[Python 2.7](https://python.org),
[Selenium 2.45](http://www.seleniumhq.org/), Xvfb, and
[Firefox 38+](https://firefox.com) but none of the artifact evaluation
steps require these components.

Please also install the `unstable` package for Racket:

    raco pkg install --auto unstable

Enter the directory containing the Cassius source.

Cassius must be able to find the Z3 binary; please edit the file
`z3.sh` to give a full absolute path name to the Z3 binary, like so:

    #!/bin/bash
    /usr/local/bin/z3 "$@"

With all these steps completed, you should be able to use Cassius.
Please test that this is so by executing

    ./cassius accept bench/css/borders.rkt doc-0002

You should see results similar to these:

    ~/cassius $ ./cassius accept bench/css/borders.rkt doc-0002
    ;; 3 rules, 4 elements, 7 boxes
    [   0.050s] Produced 402 constraints of 11285 terms
    [   1.878s] Prepared 1443 constraints of 32935 terms
    [   0.141s] Solved constraints
    Accepted!

Times in brackets may differ.

Running Cassius
---------------

Use the `./cassius` script to run Cassius. It takes three arguments: a
tool to run (options: `accept`, `rsketch`, `rdebug`, `verify`, `smt2`,
`dump`), a file to draw input from, and a particular input in that file.

Writing your own Cassius files
------------------------------

To write your own Cassius input files, use `bench/test.rkt` as an
example. It defines a tiny page. This definition has two parts (the
stylesheet and the document). The stylesheet is defined by the
`define-stylesheet` line, which uses the format

    (define-stylesheet <name>
      (<selector>
       [<property> <value>] ...)
      ...)

The selector can be `(tag <tagname>)`, `(id <idname>)`, or `*`, or it
can be one of a larger, expanded set that is automatically translated
by Cassius into identifier selectors as described in the text. This
expanded set includes the descendent `(desc <selector> ...)`, class
`(class <classname>)`, direct child `(child <selector> ...)`, and
comma `(or <selector> ...)` selectors.

The document is defined for Cassius by the `define-document` line:

    (define-document (<name> #:width <width> #:browser firefox)
      <elements>)

The `#:browser firefox` bit can be omitted to tell Cassius not to load
the Firefox browser stylesheet. Elements are written

    ([<type> :<property> <value> ...]
     <elements>)

The type can be `BLOCK`, `INLINE`, `TEXT`, or `LINE` (for the
different types of boxes), as well as `MAGIC` for opaque boxes and
`ANON` for anonymous block boxes. The available properties are `:w`,
`:h`, `:x`, and `:y`, to which define those measurements of the *box*
being described, and `:tag`, `:id`, and `:class`, which define those
properties of the associated *element*.

You must that all `BLOCK` and `INLINE` boxes have `:tag`s, and that no
`TEXT`, `LINE`, or `ANON` boxes do.

After defining the document and the stylesheet, you must have a
`define-problem` and `define-header` line like those in
`bench/test.rkt`, listing the names of the stylesheet and document.

Extracting websites to Cassius files
------------------------------------

The `get_bench.py` script that comes with Cassius uses Firefox and Selenium
to render a page and run the `get_bench.js` JavaScript snippet, which
extracts box positions from a live web page. This process is
imperfect, but accurate for most pages. To extract a web page, run

    xvfb-run -a -s '-screen 0 1920x10800x24' python2 get_bench.py --name <file> <url>

Note that the URL must have either the `file://` or the `http://`
scheme. In particular, the `https://` scheme is not supported. Getting
Xvfb to work on a given machine is tricky, and not all Firefox
versions interact well with a given Selenium version, but if all goes
well, a Cassius input file should be generated in the given file name.

Source code layout
------------------

Cassius is a total of approximately 4000 lines of code in `src/`. This
code formalizes CSS, generates constraints for input files, grounds
those constraints, interacts with the solver, and implements several
prototype tools.

The formalization lives, by and large, in `spec/`. `spec/tree.rkt`
defines the element and box types and describes functions that set up
both tree structures. `spec/layout.rkt` formalizes the CSS 2.1 layout
algorithm. Both these files contain only function and definitions,
which are referred to by the constraint generator. `spec/cascade.rkt`
houses the implementation of CSS selectors and cascading. Additional
bits that could arguably be part of the formalization live in
`css-properties.rkt`, `css-rules.rkt`, and `browser-style.rkt`.

The constraint generator lives in `main.rkt` and `frontend.rkt`.

Constraints are partly grounded manually in the formalization files
above, and partly by the Z3 optimizer in `z3o.rkt`.

Interaction with the solver is in `z3.rkt`.

Tools are implemented in `src/tools/`; in the version submitted to the
AEC, not all of them work; embarrassingly, some have syntax errors.
The random sketching, debugging, acceptance testing, dumping, and
verification tools all work, however.

Detailed instructions
---------------------

Check the `AEC.html` file for how to replicate experiments from the
paper.
