
Notes on failing tests
----------------------

# Known bugs

Rounding error:

- margin-padding-clear: 545, 844
- normal-flow: 157, 282

Border rounding:

- borders: 0718, 0771

# Bugs

- *normal-flow:doc-043*: Extracting selection boundaries is not extracting text node
  boundaries, leading to a problem where centered text is extracted as
  not quite centered
- *normal-flow:doc-951*: Need to implement specified→computed dance to correctly
  handle percentage heights with `auto` parent height.
- *borders:doc-0939*: Needs the specified→computed dance to handle the
  interaction of border style and border width.
  
# Bugs

- floats:doc-02
- borders:doc-0190
- margin-padding-clear:doc-517
- *normal-flow:doc-474*: Incorrect extraction when anonymous block boxes are
  involved; need to extract the box and element hierarchies separately.
