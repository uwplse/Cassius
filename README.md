VizAssert Artifact Evaluation
=============================

VizAssert automatically checks formal properties about the possible
renderings of a web page. Its main contributions are (§1.3):

1. A language to express visual layout properties
2. A formalization of line height, margin collapsing, and floating
   layout
3. And encoding of this formalization to SMT
4. An implementation of this encoding into an automated tool

In support of these contributions, the VizAssert evaluation centers on
two experiments:

+ Automatically verifying or finding counterexamples for 14
  industry-standard assertions on 51 professionally-designed web
  pages, demonstrating the flexibility of the assertion language
  (contribution 1) and the usability of the tool (contribution 4).
  Since the tool uses its encoding to SMT to verify counterexamples
  this also demonstrates the efficiency of that encoding (contribution
  3).
+ Testing that VizAssert's formalization of line height, margin
  collapsing, and floating layout agree's with Mozilla Firefox's,
  demonstrating that this formalization is correct (contribution 2).

This document guides the artifact evaluator through setting up
VizAssert, running the two main experiments, and verifying various
additional claims made in the paper's evaluation (§6). The document
then gives a brief description of the VizAssert code base, allowing
the evaluator to check that it (roughly) corresponds to the
description in the paper, and also explains how to run additional
experiments of the evaluator's choosing (including writing new
assertions, using those assertions on new web pages, and evaluating
other portions of the semantics).

Setting up VizAssert
--------------------

VizAssert is provided to the artifact evaluator in two formats:

+ A tarball containing the source code
+ A virtual machine image

In the virtual machine image, all of the setup steps described below
have been done. Evaluators using the virtual machine image can skip
this section. Evaluators can choose to use the following instructions
instead, but the authors will not necessarily be able help debug
installation problems on all systems, so the virtual machine is
recommended.

### Prerequisites

VizAssert is written in Racket, with bits of glue code written in
JavaScript and Python. It also uses the Z3 SMT solver, the Firefox web
browser, and the Selenium Python package. Finally, its associated
scripts also use the `xvfb-run`, `curl`, and `fuse-zip` commands, and
some versions of Selenium and Firefox additionally require the
`geckodriver` binary. The PIP package manager is also recommended.
This section guides the evaluator through installing all of these
prerequisites.

VizAssert has been observed to work on several different Linux
distributions, macOS, and Windows. However, this section describes
installation instructions only on Linux; evaluators on other operating
systems will have to modify them. Note that several of the scripting
prerequisites are not available on macOS and Windows. The reproduction
experiments will describe workarounds where available, but the
artifact is not optimized for this use case. The VM uses Ubuntu
16.04.3 LTS.

We have also seen reports that Retina and other Hi-DPI displays cause
problems when capturing pages in VizAssert. We've not been able to
investigate these reports, and cannot confirm them. Evaluators on
devices with Hi-DPI screens may want to use the VM, where the capture
step has already been completed on a device with a Lo-DPI screen.

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
  error messages. We do not recommending building pre-release Z3
  versions from source; they are often unstable. The VM uses 4.6.0,
  while the paper's evaluation environment used 4.5.1.
+ Firefox 52 or later should all work. Earlier versions will also
  work, but used a different protocol for communicating with Selenium,
  so need to be carefully matched to Selenium versions. The VM uses
  Firefox 58, while the paper's evaluation environment used Firefox
  52.5.2.

Note that Racket, Python, Z3, and Firefox must all be available on
your PATH (as `racket`, `python2`, `z3`, and `firefox`). On Windows,
modifying one's PATH is fairly complicated; the authors don't remember
how to do it, and we hope that the evaluators do. <!-- TODO --> The
utilities listed below must also be available on the PATH.

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
down the scripts by hitting disk much more often. In can be installed
from package managers, but it will likely require a reboot and
possibly some group manipulations to allow the user to access FUSE. We
ask the evaluator to consult their distribution's guidelines on FUSE;
on Windows or macOS we recommend workarounds below. 
<!-- TODO -->
If `xvfb-run` is not present, delete the code `xvfb-run -a -s '-screen
0 1920x1080x24' ` from `bench/fwt/get.sh`, `bench/fwt/get_all.sh`, and
`bench/css/get.sh`. This just causes `xvfb-run` not to be called. (The
named files are just all uses of `xvfb-run` in the VizAssert
codebase). Note that removing the `xvfb-run` invocation means that a
different screen size is used to capture web pages (see below). This
is unlikely to change the results, but could in principle lead to a
few FWT or CSSWG tests no longer passing.

`xvfb-run` allows rendering GUI applications to a virtual screen; the
VizAssert scripts use this to run Firefox without opening a physical
window. This script can be installed from package managers (it may be
in a package called `xvfb` or `xvfb-xorg` or similar) or, if not
available, use workarounds described below.
<!-- TODO -->
If `fuse-zip` is not present, delete the line that begins with `hash
fuse-zip` at the top of `get-all.sh` and then replace `fuse-zip -r
"$FILE" $tmpdir/$NAME` with `unzip "$FILE" -d $tmpdir/$NAME` and the
line `fusermount -u $tmpdir/$NAME` with `rm -rf $tmpdir/$NAME`.

`curl` is available online or from its website and runs on pretty much
every system.

### Downloading the CSSWG test suite and the FWTs

Download the CSSWG test suite from Github using:

    git clone https://github.com/w3c/web-platform-tests.git

Suppose this repository is located in `DIR/web-platform-tests/`.
Create the directory `DIR/fwts/`. The FWTs will be stored here.

Now, from the source code directory, execute:

<!-- TODO -->

    bash aec/download.sh "DIR/fwts/"

This script will download all of the FWTs (this will take minutes to
an hour, depending on your connection, and require about 500MB of
storage). If you look at the script, you can see the list of 100 FWTs
downloaded. These are the 100 most recent FWTs, as can be verified on
the [FWT website](https://freewebsitetemplates.com).

After downloading the FWT pages, the FWT pages and the CSSWG unit
tests need to be *captured*. Capturing converts these pages to
VizAssert's representation of HTML and CSS, plus capturing the shape
of the *render tree* (or *box tree*) from Firefox. The CSSWG unit
tests are likewise captured. Capturing uses a Python script to
remote-control a Firefox instance to run a large and complex
JavaScript file (`get_bench.js`) that extracts rendering information
from Firefox. To capture websites, run:

    bash aec/capture.sh "DIR/fwts/" "DIR/web-platform-tests/"

This will produce the file `bench/fwt.rkt` and several files in
`bench/css/` with the `.rkt` extension. These correspond to the FWTs
and CSSWG files; comments in those files indicate which captured entry
corresponds to which file. (The evaluator is free to verify that the
capturing behaved correctly.)

Note that capture script only captures files named `index.html`; each
FWT contains a single file with this name. This name is the customary
name for the main page of a website. FWTs contain other pages as well,
but these are not captured and thus not used for the remaining
experiments.

#### Selecting supported FWTs

VizAssert does not support all 100 FWTs. First, some are too
complicated; second, some use unsupported portions of CSS, like the
`vertical-align` property or the `:before` and `:after` selector;
third, some FWTs may trigger bugs in the capture script or the
VizAssert semantics. (Further experiments will show that these bugs do
not exist in the portions of the semantics that are contributions of
this paper.) Some of these semantics bugs have since been fixed, but
these fixes are not included in the code submitted for artifact
evaluation, to ensure that the artifact corresponds to the submitted
paper.

To select the supported FWTs, we check that for a particular screen
size, VizAssert "accepts" Firefox's rendering. This step can be done
by executing:

    make bench/fwt.working.rkt

This step will take from a few hours to potentially a day or two
depending on your machine, the available RAM, and possibly the version
of Z3 used. This step asks VizAssert to check, for each FWT, whether
Firefox's rendering (as captured in the previous step) is allowed by
its semantics, with a timeout of 15 minutes. (Verifying assertions
takes longer than checking a particular rendering, so this timeout is
lower than the timeout of 30 minutes for verifying assertions.)

VizAssert produces the file `reports/fwt.html` describing the results,
which the evaluator should examine. The main table, with colored check
marks and Xs, should contain many green checkmarks (the table at the
top should list the number, in the "success" column). If, instead, it
only has white-on-black exclamation marks, some part of the setup did
not work, and VizAssert is running into errors. (See below.) On the
paper evaluation machine, 51 FWTs passed this stage; evaluators may
see a different number due to different machine speed (affecting
timeouts) or different fonts (affecting the rendering). We believe
that numbers in the 40–60 range are sufficiently close to achieve
comparable results in the remainder of the artifact evaluation.

Then, using the data in this file (and its associated JSON version
`reports/fwt.json`) it produces a filtered version
`bench/fwt.working.rkt` with only those FWTs that passed the check.

### Debugging

VizAssert can be run on an individual FWT with this command:

    racket src/run.rkt accept bench/fwt.rkt doc-080

Here, `doc-080` names an FWT, which are numbered from `doc-001` to
`doc-100`. (`doc-080` is the yoga website in Figure 7.)

Running individual FWTs may help evaluators debug problems they face
setting up Racket, Z3, or the other components above. We do not
recommend evaluators 

### Conclusion

After following these steps, the evaluator should have the file
`bench/fwt.working.rkt` and several files `bench/css/*.rkt`, plus a
working installation of VizAssert. These are sufficient to move on to
artifact evaluation.
