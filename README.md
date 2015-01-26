
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
+ Widths, padding, and margins
+ `auto` margins
+ Margin collapse

Cassius does not model:
+ Percentage margins, widths, or padding
+ Borders
+ Floats
+ Positioning

Cassius development is tracked
[https://trello.com/b/ylAVgJh3/cassius](on Trello).
Email [mailto:emina@cs.washington.edu](Emina Torlak)
to be added to the project.

Installing
----------

Cassius requires Racket 6.1 or later and Z3 4.3 or later.
It works best on Linux.

Running Tests
-------------

We don’t have tests yet.
