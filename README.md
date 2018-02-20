VizAssert Artifact Evaluation
=============================

VizAssert automatically checks formal properties about the possible
renderings of a web page. Its main contributions are (Section 1.3):

1. A language to express visual layout properties.
2. A formalization of line height, margin collapsing, and floating
   layout.
3. An encoding of this formalization to SMT.
4. An implementation of this encoding into an automated tool.

In support of these contributions, the VizAssert evaluation centers on
two experiments:

+ Automatically verifying or finding counterexamples for 14
  industry-standard assertions on 51 professionally-designed web
  pages, demonstrating the flexibility of the assertion language
  (contribution 1) and the usability of the tool (contribution 4).
  Since the tool uses an SMT solver to verify counterexamples, this
  also demonstrates the efficiency of that encoding (contribution 3).
+ Testing that VizAssert's formalization of line height, margin
  collapsing, and floating layout agrees with Mozilla Firefox's,
  demonstrating that this formalization is correct (contribution 2).

This document contains the following parts:
+ How to run each of the two main experiments.  Each one only
  requires running one command.
+ How to verify various additional claims made in the evaluation
  (Section 6 in the paper).
+ How to run additional experiments of the reviewer's choosing
  (including writing new assertions, using those assertions on new
  web pages, and evaluating other portions of the semantics).
+ A brief description of the VizAssert code base, allowing the
  reviewer to check that it corresponds to the simplified description
  in the paper.
+ How to set up VizAssert, enabling the reviewer to recreate the
  provided VM or to install VizAssert elsewhere.

*Note*: The two commands that reproduce the main experiments can take
a few days to run. You may wish to run each of the main experiments
overnight (or over multiple nights if you need to pause the virtual
machine during the day).  The provided virtual machine includes
outputs, so you can examine those outputs even before re-running the
experiments.


Downloading the Virtual Machine
-------------------------------

VizAssert is provided to the artifact reviewer in two formats:

+ A virtual machine image
+ A tarball containing the source code

The authors recommend that you use the virtual machine image. Most of
this guide assumes the use of the virtual machine image. However, the
final section describes how the VM image was created, enabling
reviewers to verify the VM contents and permitting VizAssert to be
installed on other machines. VizAssert also runs faster when not run
in a VM, which may allow a closer correspondence to the numbers in the
paper (which were gathered on a fast machine, run natively).

The Virtual Machine image is available from:

<!-- TODO -->


Verifying Assertions on the FreeWebsiteTemplates
------------------------------------------------

The first major experiment in the VizAssert paper is an evaluation of
VizAssert on 51 professionally-designed web pages from the
FreeWebsiteTemplates community (FWTs).

Due to differing machines and VM overhead, the setup step may have
left the reviewer with slightly more or slightly fewer than 51 FWTs in
the file `bench/fwt.working.rkt`. The VM has 46 FWTs selected (since
the VM is slower than the paper evaluation computer and thus more
timeouts were hit). The authors believe that as few as 40 or as many as 60 FWTs
supported would represent substantially similar results to those in
the paper.

The to test each FWT against all 8 general assertions, and then test
the additional 6 specific assertions, run the command:

    make reports/general.html reports/specific.html

This will generate `reports/general.html` with the results of running
the 8 general assertions on all 51 FWTs and `reports/specific.html`
with the results of running the 6 specific assertions each on their
particular FWT. (If you installed VizAssert yourself you may need to
change the `FWT_PATH` Make variable.)

This command will run for several hours or perhaps up to a day. The VM
contains pre-generated versions of these two files, which the reviewer
can examine while the above command is running. (The reviewer can then
check, once the commands complete, that the reproduced results are
similar.)

Each of these pages will contain two parts: a summary table at the top
(listing the successful verifications "success", false positives
"fail", timeouts "timeout", and true positives "expected"); and a
detailed table below (listing each FWT and an icon for every
assertion).

The results can be compared to Table 2 in the paper. Due to variation
between machines, some numbers, especially the number of timeouts, may
change somewhat from run to run. The authors would consider variations with as
many as 30 timeouts expected given the expected slowdown from running
inside a virtual machine; the paper's evaluation was done on a very
fast machine.

Note that true positives are verified by hand (all manual
verifications are recorded in `bench/fwt/expected.sexp`). If you set
up VizAssert yourself rather than using the provided virtual machine,
setup might have chosen a slightly different set of supported FWTs, so
you may see a different number of "false positives".

### Validating the experiment

This section describes in more detail the commands being executed, so
the reviewer can be certain that the experiment reproduced corresponds
to the text of the paper.

The `make` command above executes `racket src/report.rkt`, which runs
VizAssert on multiple input files and produces HTML reports. This
command takes multiple arguments.

To produce `reports/general.html`, it is run in `assertions` mode with
two arguments:

+ `bench/assertions/general.vizassert`, a file containing the 8
  general assertions. This file can be read by the reviewers to ensure
  correspondence to visual logic, as described in the paper, and that
  the assertions implement the described guidelines. The supplementary
  material in Appendix A describes details of the formalization. The
  assertions are written in that appendix with inline function
  definitions and various shorthand; thus the assertions in this file
  differ in cosmetic ways from Appendix A.
+ `bench/fwt.working.rkt`, a file containing the 51 FWTs selected as
  fitting within VizAssert's supported subset of CSS.

To produce `reports/specific.html`, `report.rkt` is run in directory
`specific-assertions` and takes an additional argument,
`bench/fwt/specific.sexp`. This file specifies FWT-assertion pairs.
These assertions are drawn from `bench/assertions/specific.vizassert`.

Several additional arguments are passed:

+ `--expected bench/fwt/expected.sexp` names the file containing
  manually-verified true positives.
+ `--timeout 1800` sets the timeout to half an hour.
+ `--show-all` shows successful verifications on the report.
+ `-o reports/general.html` sets the output name.

The reviewer can pass additional flags using the `FLAGS` make
variable, as in `make FLAGS="--threads 6"`. The reviewer may wish to
set the `--threads` option, which allows the reports to be generated
in parallel. The paper evaluation server ran with 6 threads.

### Verifying a single assertion-FWT combination

To verify a true or false positive, a single assertion-FWT combination
can be run. The command to do this is:

    racket src/run.rkt assertion bench/assertions/general.vizassert \
      <assertion-name> bench/fwt.working.rkt <document-name>

(To run one of the specific assertions, change `general.vizassert`
to `specific.vizassert`.)

This will print basic timing information and then output a
counterexample rendering followed by the rendering parameters for this
rendering. The counterexample rendering will also have (in red if your
terminal supports it) a tag such as `:cex b` on one of the boxes in
the rendering. Here `b` is the variable which, when bound to that box,
causes the assertion to fail.

The best way to verify whether the counterexample is a true or false
positive is to open the responsible FWT in a browser. This is tricky.
Suppose you are verifying a failed assertion on `doc-080`.

1. First, search `fwt.working.rkt` for `define-problem doc-080`. Two
   lines down will be a path such as
   `file:///tmp/vizassert-get-bench.fKaFdo.zip/rehabilitation-yoga/rehabilitation-yoga/upload/index.html`.
   Extract from this path the name of this FWT, in this case
   `rehabilitation-yoga`.
2. Run `make /tmp/rehabilitation-yoga/`. The final slash is necessary.
3. Change directory to `/tmp/rehabilitation-yoga/` and run
   `find -name index.html` to find the main page of the site.
4. Open this file in Firefox.

To find, in the browser, HTML element responsible for the assertion
failing:

+ The box with the `:cex b` tag will likely also have a tag such as
  `:elt 12`. (If the box in question does not, one of its siblings or
  ancestors will.) Remember this number.
+ Search `fwt.working.rkt` for `define-document doc-080`
+ Search *from that point forward* for `:num 12`.
+ That identifies the HTML element in VizAssert's encoding of the
  HTML. The corresponding element can be identified in the browser.

VizAssert could do most of these steps automatically if it had tighter
integration into the user's workflow, and since the paper we have made
some of these changes. However, these changes are not included in this
artifact, in order to faithfully reflect the tool described in the
paper.


Checking Instance and Proof Sizes, and Run Time
-----------------------------------------------

The artifact contains the code necessary to regenerate Figures 8, 9,
and 10 of the paper. These plots are generated as TeX code and then
rendered to a PDF. The raw data for the plots is also available, and
code is included to reproduce the broad summary statistics given in
Section 6.1 that run parallel to Figure 8.

#### Figure 8

Figure 8 examines the captured web pages and simply counts the number
of rules, boxes, and elements. Rough statistics about these sizes can
be found by running:

    racket aec/histogram.rkt bench/fwt.working.rkt

This outputs the averages, IQRs, and total ranges for the sets of
elements, boxes, and rules. Also output are data for drawing a
histogram, such as:

    Histogram: "min": 53, "max":468, "interval": 42, "counts": [10,39,29,8,6,3,3,1,1,1]

This represents a histogram that ranges from 53 to 468 with buckets of
size 42, where the first bucket (53–95) contains 10 entries, the
second contains 39 entries, and so on.

The histograms can be rendered with:

    make reports/hists.pdf

Note that the given command uses the supported web pages, which may be
a slightly different set than on the paper evaluation server. However,
the result should be roughly comparable.

#### Figure 9

Figure 9 tracks the size of instances and unsatisfiability cores.
These are output by VizAssert every time it verifies a web page, and
are recorded in `reports/general.txt`. Each log entry looks something
like this:

    bench/fwt.working.rkt	doc-021	interactive-onscreen
    [   0.001s] Read 1 documents with 75 elements, 186 boxes, and 87 rules
    [   1.789s] Produced 7757 constraints of 82108 terms
    [  12.274s] Prepared 28623 constraints of 677318 terms
    [  35.239s] Found core with 11920 constraints
    success

In this log entry, the instance has 677,318 terms, and the proof size
is 11,920 constraints.

The CDFs of Figure 9 can be regenerated with:

    make reports/insts.pdf

Like with Figure 8, this may not exactly match the paper, but should
be similar.

#### Figure 10

Figure 10 tracks the time needed to verify assertions on the FWT
pages. This figure draws data from `general.json`.

The CDFs of Figure 10 can be regenerated with:

    make reports/runtime.pdf

Just as Figure 8 and 9, the generated figure may not exactly match the
paper. In particular, the slowdown due to virtualization overhead will
likely shift the plot to the right, compared to the plot in the paper.

Verifying the Semantics on the CSSWG Test Suite
-----------------------------------------------

The second major VizAssert experiment tests that VizAssert's
formalization of line height, margin collapsing, and floating layout
is correct. The experiment can be run with:

    make reports/csswg.html

Like the first experiment, the `FLAGS` Make variable can be passed to
run this experiment with multiple threads. With a single thread it
takes several hours to complete. (As in `make FLAGS="--threads 6"`.)

This command generates `reports/csswg.html`, which the reviewer can
open in a web browser and compare to Table 3, columns 3 and 4, of the
paper. The "success" column on the report corresponds to the "Pass"
column in the paper, while "unsupported" and "timeout" are added
together to compute the "Unsup" column.

As with the other experiments, different computer setups may cause
slightly more or slightly fewer tests to time out than on the paper
evaluation machine. The authors would consider as few as 900 or as many as 924
passing tests to substantially correspond to the numbers in Table 3.

Note that unlike the prior experiment, the reviewer will see few green
check marks (or red cross marks) on this report, because this report
is generated without the `--show-all` flag set, and thus hides passing
tests. The reviewer will, however, see a new section listing
"unsupported features". This table is generated during capturing (see
the "Setting up VizAssert" section of this README) and indicates
features used by the page.  It is not an exhaustive list of all
supported or unsupported features, but it does provide some guidance
explaining why tests end up in the "unsupported" column. (In this
table, the "# Necessary" column lists the number of failing tests that
are unsupported and use this feature, while the "# Blocking" column
lists the number of failing tests that are unsupported and use *only*
this feature.)

As described in the paper, four tests are expected failures (and so do
not count as failures in the report). These are `doc-13`, `doc-17`,
`doc-19`, and `doc-21` in `floats.rkt`, or, in the CSSWG tests
(located in `~/src/csswg` in the VM):

+ `css/CSS2/floats/floats-rule3-outside-left-002.xht`
+ `css/CSS2/floats/floats-rule3-outside-right-002.xht`
+ `css/CSS2/floats/floats-rule7-outside-left-001.xht`
+ `css/CSS2/floats/floats-rule7-outside-right-001.xht`

To verify that Firefox's rendering is incorrect, and thus that
VizAssert's failure is expected, the reviewer can add `-ref` just
before the `.xht` to any of those file names to see the test's
reference example; Firefox will render the test and the reference
differently, demonstrating that its rendering is incorrect. (The paper
cites a relevant bug report.)

### Validating the experiment

This section describes in more detail the commands being executed, so
the reviewer can verify that the experiment reproduced corresponds
to the text of the paper.

The `make` command above uses information in the `Makefile` to execute
the experiment. It executes `report.rkt` in the `regression` mode,
which tests whether VizAssert accepts Firefox's rendering. In
addition, it passes the arguments:

+ `--index bench/css/index.json`, which points VizAssert to a JSON
  file giving the section of the standard any particular unit test was
  drawn from, according to the [CSSWG's
  site](http://test.csswg.org/suites/css2.1/20110323/html4/toc.html).
+ `--expected bench/css/expected.sexp` describes expected failures
+ `--sections ...` lists all of the sections of the CSS standard
  tested in this experiment.

### Running an individual test

Unlike the FWT tests, the CSSWG tests are organized into multiple
files, reflecting the structure of the test suite. For example, most
of the tests for floating layout are located in the `floats` and
`floats-clear` collections. Each collection's tests are numbered
sequentially, but a collection also contains tests corresponding to
multiple sections of the standard. (The authors don't know why the CSSWG uses
this organization scheme.) To reference a test, you must know both its
collection (like `floats`) and the test name (like `doc-13`).

An individual test can be reproduced with:

    racket src/run.rkt accept bench/css/<collection>.rkt <test>

This will either print "Accepted.", which means that VizAssert agreed
that Firefox's rendering was correct, or "Rejected." followed by a
visualization of the unsatisfiability core of VizAssert's rejection of
Firefox's rendering. On the provided tests, this unsatisfiability core
is rarely useful, because the underlying reason for the failure is
more often "VizAssert doesn't understand tables" and less often "this
element shouldn't have width 100px".

To produce some rendering that VizAssert believes is valid, without
using any information about Firefox's rendering, run:

    racket src/run.rkt render -d bench/css/<collection>.rkt <test>

VizAssert's can accept multiple renderings, because VizAssert's CSS
semantics are mildly non-deterministic. However, the semantics are
fairly tight, as demonstrated by the first experiment: if too many
renderings were accepted, VizAssert would produce many false
positives. In some cases, VizAssert may print "Failed to render",
indicating that no valid renderings could be found. This indicates a
bug.

The `-d` flag places VizAssert in "debug mode", whose most important
consequence is that VizAssert does not apply "fuzzing" to font
measurements (see Footnote 13 in the paper). It also causes VizAssert
to write out its SMT query to `/tmp/out.z3`. The reviewer may read
that file to see the character of queries produced by VizAssert.

### Running further CSSWG tests

The reviewer can run:

    make reports/csswg-extra.html

This generates a larger report that evaluates VizAssert not only on
the sections described in the paper but also on a variety of other
CSSWG tests. The authors stress that these tests apply to aspects of
the CSS semantics not discussed in the paper, and do not evaluate any
of the paper's core contributions.

The reviewer will likely see 100-200 test failures out of 5000 tests.
The authors have not examined them all. Some may be due to errors in
the semantics, others are due to errors in the capture script, and
some may represent expected failures (that is, Firefox bugs). Note
also that some of these tests are intended to be applied only on
machines with certain properties, such as certain font setups, and so
are simply not applicable. This report does not make such
distinctions.

Reviewers who are interested in exploring this broader scope of tests
are encouraged to use the `accept` and `render` commands above to
explore some of the failing tests.

The relatively low rate of test failures (roughly 2% of tests)
suggests that even in the unevaluated portions of the CSS standard,
VizAssert's semantics is largely correct. Neither could VizAssert
have successfully passed the two main experiments without largely
correct semantics for the core of CSS.


Running VizAssert on new inputs
-------------------------------

Reviewers may run VizAssert on new web pages and new assertions. Keep
in mind that VizAssert's formalization of CSS is limited to a subset
of the full features and that visual logic does not at the moment have
comprehensive and comprehensible error reporting.

To run VizAssert, one fundamentally needs two things: a web page and
an assertion. Reviewers may write a web page or choose any public page
on the Internet; VizAssert can be used either on files on disk or on
HTTP-accessible (but not HTTPS-accessible) pages. VizAssert can have
surprising and unpredictable results on JavaScript-heavy web pages,
because the capture scripts that import web pages into VizAssert's
input format are themselves written in JavaScript, and will run at an
unpredictable time and may conflict in their use of global
variables. The authors recommend reviewers choose pages with minimal
JavaScript.

Reviewers who wish to run VizAssert on JavaScript-heavy or
HTTPS-accessible pages can use their browser's "save page" feature to
save a static version of the page on disk. (Some browsers will save and
later run JavaScript on such pages; we recommend simply deleting the
relevant JavaScript file if it causes problems.)

Once a page is chosen, run:

    python2 get_bench.py --name test <url>

Here, `test` is any name; the script will create `bench/test.rkt`
by going to the chosen URL (it may also be a Unix path), running the
capture script, and recording the results. Multiple URLs can be given,
but we do not recommend reviewers do this.

The resulting `bench/test.rkt` file will contain a single VizAssert
input, named `doc-1`.

Given an input file, run:

    racket src/run.rkt accept bench/test.rkt doc-1

You should see the text `Accepted` if your page is supported by
VizAssert. Note that this process can take a long time for large, for
even some moderate-sized pages. VizAssert cannot be run, for example,
on the CNN or New York Times front pages—these pages are simply too
big. VizAssert has been successfully run on <!-- TODO -->.

Given a supported input file and an assertion, run:

    racket src/run.rkt assertion <assertion-file> <assertion-name> bench/test.rkt doc-1

This asks VizAssert to verify that the page satisfies the assertion.
If this page cannot be verified, VizAssert will produce a
counterexample. These counterexamples were described in detail when
discussing the first experiment.

### New assertions

You can re-use an existing assertion or create your own.

A new assertion can be written by creating an empty file and filling
it with this template:

    (define-test (<name> <forall-quantified-vars> ...)
      <assertion>)

For example, the simplest of the 8 general-purpose assertions is
defined by:

    (define-test (interactive-onscreen b)
      (=> (is-interactive b) (onscreen b)))

Note that `is-interactive` and `onscreen` are shorthands built into
the assertion language. Consult `general.vizassert` for more
examples. <!-- TODO better examples -->

The syntax of the assertion language is defined in
`src/assertions.rkt` and largely follows the visual logic in the
paper. It incorporates some but not all of the shorthands used in
the supplementary Appendix A.

Note that though we encourage reviewers to experiment with VizAssert,
specifying new assertions can be tricky and it may be difficult for us
to help troubleshoot reviewers' web pages and assertions.


The VizAssert Codebase
----------------------

VizAssert is a total of approximately 7000 lines of code in `src/`.
This code formalizes CSS, including the formalizations of line height,
margin collapsing, and floating layout described in the paper;
generates SMT queries for web pages using this formalization; and
interacts with the solver.

Visual logic is implemented by `assertions.rkt`.

The constraint generator lives in `main.rkt` and `frontend.rkt` and
refers to functions defined in the formalization.

The formalization lives, by and large, in `spec/`. `spec/utils.rkt`
defines the element and box types, and `spec/tree.rkt` describes
functions that set up both tree structures. `spec/layout.rkt`
formalizes the CSS 2.1 layout algorithm. `spec/float.rkt` implements
the exclusion zone data structure, and includes formal properties
describing its correctness. (These properties can be checked with
`raco test`.) `spec/css-properties.rkt` houses the implementation of
CSS properties, `spec/compute-style.rkt` of inheritance, and
`selectors.rkt` of selectors and cascading. Other files in `spec/`
contain utility functions.

Constraints are simplified by a Z3 optimizer in `z3o.rkt`. Interaction
with the solver is in `z3.rkt`.

`run.rkt` and `report.rkt` implement the VizAssert frontend.

The various other files define various data structures and helper
functions.

As this paper emphasizes the formalizations of line height, margin
collapsing, and floating layout, reviewers may want to directly look
at the code implementing these features. All three features are
implemented in `spec/layout.rkt` and, due to the need to implement the
features in a way that makes solving them efficient, are more
fragmented than the description in the paper.

Line height computation is implemented in lines 879–896 (which
computes the position and height of lines) and supported by lines
751–770 and 825–833 (which propagate the `above-baseline` and
`below-baseline` properties for inline and text boxes). In this code,
`b` generally refers to the particular box whose values are being
computed, `l` is its last child, and `v` is its previous sibling. Note
that the full implementation is more complex than the paper sketch,
due to details like zero-height line boxes that were elided from the
paper for simplicity.

Margin collapsing is implemented in lines 224–270. It follows the
sketch in the paper; the variable `mtp` and `mtn` are the variables
`mt+` and `mt-` (likewise `mbp`/`mbn`), `mtn-up` the variable `mt↑`,
and `mb-clear` the boolean `mb?`. The `b`, `l`, and `v` variables are
as above, with `f` for the first child and `n` for the next
child. This implementation of margin collapsing is supported by lines
121–131, which uses the results of the margin collapsing code to
implement placement for in-flow block boxes.

Floating layout is implemented in lines 639–659 (which place floating
boxes and update exclusion zones) and supported by lines 858–871
(which places line boxes to avoid floats). Exclusion zones themselves
are implemented in `spec/floats.rkt`.

These implementations cannot be easily read on their own, since they
tie into the larger formalization of floating layout and also since
they include special cases not discussed in the paper yet important
for correctly implementing the relevant behavior. (For example, the
paper simply did not have room to discuss clearance, an important
component of CSS layout that is intimately related to floating
layout.) However, we hope that reviewers will be able to see some
rough correspondence to the descriptions in the paper, at least
relating common variables and a rough understanding of data flow.


Setting up VizAssert on another machine
---------------------------------------

Setting up VizAssert on your own machine is labor-intensive.
The authors will not necessarily be able help debug installation
problems on all systems.

### Prerequisites

VizAssert is written in Racket, with bits of glue code written in
JavaScript and Python. It also uses the Z3 SMT solver, the Firefox web
browser, and the Selenium Python package. Finally, its associated
scripts also involve minor prerequisites: the `xvfb-run`, `curl`, and
`fuse-zip` commands, and (for some some versions of Selenium and
Firefox) the `geckodriver` binary. The PIP package manager is also
recommended. This section guides the reviewer through installing all
of these prerequisites.

VizAssert runs on several different Linux distributions, macOS, and
Windows. However, this section describes installation instructions
only on Linux; you will have to modify them for other operating
systems. Note that several of the minor prerequisites are not
available on macOS and Windows. The following instructions describe
workarounds where available, but the artifact is not optimized for
this use case. The VM uses Ubuntu 16.04.3 LTS.

Users have reported that Retina and other Hi-DPI displays cause
problems when capturing pages in VizAssert. The authors have not been
able to confirm these reports. Reviewers on devices with Hi-DPI
screens may want to use the VM, where the capture step has already
been completed on a device with a Lo-DPI screen.

### Installing Prerequisites

Racket, Python, Z3, and Firefox can all be installed from their
respective websites or from package managers. The version requirements
are:

+ Racket 6.7 and up has been observed to work, and Racket 6.3+ likely
  will too. However, Racket 6.10 has a bug in its IO subsystem that
  prevents it from interacting properly with Z3; it is fixed in Racket
  6.10.1. The VM uses Racket 6.10.1, while the paper's evaluation
  environment used Racket 6.7.
+ Python 2.7 is required. The VM uses 2.7.12, while the paper's
  evaluation environment used Python 2.7.13.
+ Z3 4.4.1, 4.5.1, and 4.6.0 have all been tested. Likely any version
  will work; however, some versions have bugs that cause spurious
  error messages. The authors do not recommending building pre-release Z3
  versions from source; they are often unstable. The VM uses 4.6.0,
  while the paper's evaluation environment used 4.5.1.
+ Firefox 52 or later should all work. Earlier versions will also
  work, but used a different protocol for communicating with Selenium,
  so need to be carefully matched to Selenium versions. The VM uses
  Firefox 58, while the paper's evaluation environment used Firefox
  52.5.2.

Note that Racket, Python, Z3, Firefox, and the utilities below must
all be available on your PATH (as `racket`, `python2`, `z3`,
`firefox`, etc.). On Windows, modifying one's PATH is complicated;
[this
guide](https://helpdeskgeek.com/windows-10/add-windows-path-environment-variable/)
may be helpful.

Selenium is best installed from PIP (the Python package manager). PIP
can be installed from its website or from a package manager (any
version should work). Remember to use the version of PIP that
corresponds to your Python 2.7 installation (if you have multiple
Python versions on your machine). Selenium can then be installed with
`sudo pip install selenium`. (If recent versions of Selenium are
available through a package manager, that can also work, but often
the available version is too old.) The VM uses Selenium version 3.9.0
while the paper's evaluation environment used Selenium 2.53.2.

For Selenium to communicate properly with Firefox, you may need to
install a binary named `geckodriver` and place it on your path. This
binary is sometimes available in package managers, named
`geckodriver`, `firefoxdriver`, or `firefox-webdriver`. It may also be
part of the Firefox installation. You can check by executing, in a
Python REPL (`python`),

    import selenium.webdriver
    f = selenium.webdriver.Firefox()

Note that this command starts Firefox—if no GUI is available (if you
are on a remote machine over SSH and are not forwarding X), it will
fail. If this command issues an exception complaining about not
finding a `geckodriver` or `webdriver` binary, then you will need to
install `geckodriver`. It can be found on Github; it comes in a
tarball which decompresses into a single binary. This binary must be
placed on your PATH.

The VizAssert scripting also uses the `fuse-zip` and `xvfb-run`
commands. `fuse-zip` allows mounting ZIP files as a file system; the
scripting uses this because the FWT web pages compress really well,
and decompressing them would make the VM download much bigger and slow
down the scripts by hitting disk much more often. It can be installed
from package managers, but it will likely require a reboot and
possibly some group manipulations to allow the user to access FUSE.
The authors ask the reviewer to consult their distribution's
guidelines on FUSE. If `fuse-zip` is not present (e.g., on Windows or
macOS), delete the line that begins with `hash fuse-zip` at the top of
`get-all.sh` and then replace `fuse-zip -r "$FILE" $tmpdir/$NAME` with
`unzip "$FILE" -d $tmpdir/$NAME` and the line `fusermount -u
$tmpdir/$NAME` with `rm -rf $tmpdir/$NAME`.

`xvfb-run` allows rendering GUI applications to a virtual screen; the
VizAssert scripts use this to run Firefox without opening a physical
window. This script can be installed from package managers (it may be
in a package called `xvfb` or `xvfb-xorg` or similar).
If `xvfb-run` is not available, delete the code `xvfb-run -a -s '-screen
0 1920x1080x24' ` from `bench/fwt/get.sh`, `bench/fwt/get_all.sh`, and
`bench/css/get.sh`. This just causes `xvfb-run` not to be called. (The
named files are just all uses of `xvfb-run` in the VizAssert
codebase.) Note that removing the `xvfb-run` invocation means that a
different screen size is used to capture web pages (see below). This
is unlikely to change the results, but could in principle lead to a
few tests no longer passing.

`curl` is available online or from its website and runs on pretty much
every system.

### Downloading the CSSWG test suite and the FWTs

Choose a directory `DIR` to obtain the CSSWG test suite and the FWTs,
then obtain them by running (the VM uses `~/src/`):

    mkdir DIR
    cd DIR
    git clone https://github.com/w3c/web-platform-tests.git
    mkdir fwts
    cd <source directory>
    bash aec/download-fwts.sh "DIR/fwts/"

The `aec/download.sh` script will take minutes to an hour, depending
on your connection, and require about 500MB of storage. The script
contains the list of 100 FWTs downloaded. These are the 100 most
recent FWTs, as can be verified on the [FWT
website](https://freewebsitetemplates.com).

Next, *capture* the CSSWG unit tests and the FWT pages.  Capturing
converts these pages to VizAssert's representation of HTML and CSS,
plus capturing the shape of the *render tree* (or *box tree*) from
Firefox. Capturing uses a Python script to remote-control a Firefox
instance to run a large and complex JavaScript file (`get_bench.js`)
that extracts rendering information from Firefox. To capture websites,
run:

    bash aec/capture.sh "DIR/fwts/" "DIR/web-platform-tests/"

This will produce the file `bench/fwt.rkt` and several files
`bench/css/*.rkt`.  Comments in those files indicate which captured
entry corresponds to which test file. (The reviewer is free to verify
that the capturing behaved correctly.)

Note that capture script only captures files named `index.html`; each
FWT contains a single file with this name. This name is the customary
name for the main page of a website. FWTs contain other pages as well,
but these are not captured and thus not used for the remaining
experiments.

#### Selecting supported FWTs

VizAssert does not support all 100 FWTs. First, some are too large and
time out; second, some use unsupported portions of CSS, like the
`vertical-align` property or the `:before` and `:after` selector;
third, some FWTs may trigger bugs in the capture script or the
VizAssert semantics. (Experiment two shows that these bugs do not
exist in the portions of the semantics that are contributions of this
paper.) The authors have already fixed some of these semantics bugs,
but these fixes are not included in the code submitted for artifact
evaluation, to ensure that the artifact corresponds to the submitted
paper.

To select the supported FWTs, check that for a particular screen size,
VizAssert "accepts" Firefox's rendering by executing:

    make bench/fwt.working.rkt

This step will take from a few hours to potentially a day or two
depending on your machine, the available RAM, and possibly the version
of Z3 used. This step asks VizAssert to check, for each FWT, whether
Firefox's rendering (as captured in the previous step) is allowed by
its semantics, with a timeout of 15 minutes. (Verifying assertions
takes longer than checking a particular rendering, so this timeout is
lower than the timeout of 30 minutes for verifying assertions.)

VizAssert produces the file `reports/fwt.html` describing the results,
which the reviewer should examine. The main table, with colored check
marks and Xs, should contain many green checkmarks (the table at the
top should list the number, in the "success" column). If, instead, it
only has white-on-black exclamation marks, some part of the setup did
not work, and VizAssert is running into errors. (See below.) On the
paper evaluation machine, 51 FWTs passed this stage; reviewers may
see a different number due to different machine speed (affecting
timeouts) or different fonts (affecting the rendering). The authors believe
that numbers in the 40–60 range are sufficiently close to achieve
comparable results in the remainder of the artifact evaluation.

Then, using the data in this file (and its associated JSON version
`reports/fwt.json`) it produces a filtered version
`bench/fwt.working.rkt` with only those FWTs that passed the check.

### Prerequisites for generating plotting code

Python 3.6+ is required to run the plotting code. The VM uses <!--
TODO VM version -->, while the paper's evaluation environment used
Python 3.6.3.

A TeX installation is also required; any modern TeX installation that
includes the `tikz` package should suffice; the VM uses TeXLive <!--
TODO VM version -->, while the paper's evaluation environment used
TexLive 2016.

### Debugging

VizAssert can be run on an individual FWT with this command:

    racket src/run.rkt accept bench/fwt.rkt doc-080

Here, `doc-080` names an FWT, which are numbered from `doc-001` to
`doc-100`. (`doc-080` is the yoga website in Figure 7.)

Running individual FWTs may help reviewers debug problems they face
setting up Racket, Z3, or the other components above.

### Conclusion

After following these steps, the reviewer should have the file
`bench/fwt.working.rkt` and several files `bench/css/*.rkt`, plus a
working installation of VizAssert. These are sufficient to move on to
artifact evaluation.
