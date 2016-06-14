Evaluating the Cassius OOPSLA'16 Artifact
=========================================

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

The Cassius source can be downloaded from Github:

    git clone https://github.com/uwplse/cassius

The `master` branch of Cassius, on the other hand, has had substantial
development in pursuit of new projects. Please use the `aec` branch
instead, which should be more comparable to the paper:

    git checkout aec

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

Running acceptance tests
------------------------

To run acceptance tests, run

    make reports/csswg.html

or the longer but equivalent command

    racket src/report.rkt  --sections sections.json --index tests.json -o reports/csswg bench/css/*.rkt

This command asks Cassius to attempt every test in `bench/css/` which
comes from one of the sections of the CSS standard listed in
`sections.json`, as indexed by `tests.json`.

This command will take a few hours to run (less on a machine with a
fast CPU) and produce the HTML file `reports/csswg.html` as output.

The results can be compared to Table 1 of the paper; "unsupported"
tests are those which use features not supported by Cassius, most
commonly tables (a full list can be found at the bottom of the
generated report). This artifact uses a slightly larger collection of
tests; there are 2700 or instead of the approximately 2000 in the
paper. There should be a comparable number of failures and more
successes.

As described in the paper, a few tests should fail. These can be
investigated manually. Each test is identified by a source file (such
as `bench/css/borders.rkt`) and a name (such as `doc-0002`). Going to
that file and searching for that name should take you to the correct
part of the file.

Running rejection tests
-----------------------

To run rejection tests, run

    racket src/mutation-test.rkt --repeat 10 --index tests.json -o reports/mut bench/css/*.rkt

This command asks Cassius to attempt 10 random rejection queries to
each test in `bench/css`.

This command will take roughly 10 times as long to run as the previous
command, so may be best run overnight (or at a smaller `--repeat`
count). It produces output to the file `reports/mut.html`.

Since rejection testing is randomized, your number of failures may not
match the number of failures reported in the paper, but it ought to be close.

Acceptance tests for real-world websites
----------------------------------------

Each of the real-world websites must be truncated; the following
truncation levels were used in the paper:

| Site  | Amazon | Baidu | Google | Wikipedia | Yahoo |
| Level |      4 |     5 |      5 |         4 |     6 |

Cassius can generate wireframes from each truncation, like that in
Figure 9, using the command

    ./cassius dump --truncate <level> --screenshot bench/alexa/<site>-1.png bench/alexa/<site>.rkt doc-1 > <site>.html
    
The generated HTML page can then be viewed in any recent browser. Note
that the original HTML page is located in `bench/alexa/<site>.html`.
Your browser's rendering will not look identical to the skeleton,
however, because the skeleton was likely rendered using a different
screen size, font setting, browser version, and so on.

For each site, you can test that Cassius accepts Firefox's rendering
of that site with

    ./cassius accept --truncate <level> bench/alexa/<site>.rkt doc-1

The results can be compared to those in Table 2. The runtime numbers
can be read directly from Cassius's output. The Elts, Boxes, and Rules
figures are printed directly by Cassius. The Time figure is split into
setup and solve time; Cassius reports the time to generate
constraints, ground them, and solve them separately, and the
generation and grounding time were summed to create the Table 2 results.

Tool tests for real-world websites
----------------------------------

The tool tests for real-world websites are substantially harder to
reproduce than the previous. The main claim of the tool tests is that
the tools run fast; inside a virtual machine this claim will be
near-meaningless. No claims were made that the tools are usable by
others; in fact, they are prototypes, testing the guts of our CSS
semantics, and are hard to use even for the authors. Nonetheless,
basic tests of these tools can be conducted.

You can use the prototype verification, debugging, and synthesis tools
built atop Cassius on all five of the websites mentioned in the
previous section. To run the verification tool, run

    ./cassius verify --truncate <level> bench/alexa/<site>.rkt verify

The runtimes should approximate those in Table 3, keeping in mind that
runtimes inside the virtual machine will be substantially longer.

To run the debugger, use

    ./cassius rdebug --truncate <level> bench/alexa/<site>.rkt doc-1

Each invocation is randomized, but very roughly similar results to
those in Table 3 should be seen. Rather often the debugger negates a
constraint and Cassius is able to find another solution, so no debug
info is produced (it prints `Different renderings possible`). This is
due to the opaque boxes introduced by truncation. These cases were
ignored when formulating Table 3.

Cassius prints "problematic" properties in red, and does
not print rule bodies without problematic properties, so the last two
columns in Table 3 are simply the number of rules and highlighted
properties printed.

To run the sketcher, use

    ./cassius rksetch --holes <num> --truncate <level> bench/alexa/<site>.rkt doc-1

For the sketcher, the `--holes` parameter accepts the number of rule
bodies to replace with holes; each invocation is randomized (randomly
chosen rules are replaced with holes), but very broadly similar
results to those in Figure 10 should be seen.

**This concludes the part of this document reproducing results
from the paper.**

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
