
Cassius
=======

Cassius synthesizes CSS from examples of how a website should look.
Unlike WYSIWYG tools like Dreamweaver or Photoshop,
  Cassius can generate responsive designs
  that work well even when the content or screen size change.

Current Status
--------------

Cassius implementation has just begun;
  for now, it supports only a part of CSS2.1.
For now, the focus is on implementing the CSS box model.

Cassius currently models:
+ Widths, padding, and margins, including `auto` margins
+ Margin collapsing
+ Floats

Cassius does not model:
+ Percentage margins, widths, or padding
+ Borders
+ Positioning

Cassius development is tracked
[on Trello](https://trello.com/b/ylAVgJh3/cassius).
Email [Emina Torlak](mailto:emina@cs.washington.edu)
to be added to the project.

Installing
----------

Cassius requires Racket 6.1 or later and Z3 4.3 or later.
It works best on Linux.

Running Tests
-------------

Run `make reports/margin-padding-clear.html` to run tests,
  generating a report into `reports/margin-padding-clear.html`.
These tests are extracted from the
  [official W3C conformance tests for CSS](http://www.w3.org/Style/CSS/Test/Overview.en.html);
  use `make bench/css/margin-padding-clear.rkt` to re-extract the tests.
