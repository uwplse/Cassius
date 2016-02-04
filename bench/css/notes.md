
Notes on failing tests
----------------------

# Known bugs

Rounding error:

- margin-padding-clear: 545, 844
- normal-flow: 157, 282

Border rounding:

- borders: 0718, 0771

Text position rounding:

- normal-flow: 043

# Bugs

- *normal-flow:doc-951*: Need to implement specified→computed dance to correctly
  handle percentage heights with `auto` parent height.
- *floats:doc-02*
- *borders:doc-0190*: Need to handle margin collapsing more correctly
  than I do now.
- *margin-padding-clear:doc-517*
- *normal-flow:doc-474*: Incorrect extraction when anonymous block boxes are
  involved; need to extract the box and element hierarchies separately.
