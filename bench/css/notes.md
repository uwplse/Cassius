
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

# Mutant problems

Unknown problems:

- borders: 0718 0820 0978
- margin-padding-clear: 057 071 086 221 242 414 532 545 547 668 699 753
- normal-flow: 157 737 928 960

Line height problems:

- borders: 0114 0170 0193 0196 0232 0262 0414 0654 0713 0758 0891 0941
  0951 1070 1317 1488
- linebox: 009 041 165 259
- margin-padding-clear: 152 428 724
- normal-flow: 002 017 021 044 048 059 067 075 089 095 116 155 171 177
  202 251 258 267 310 338 339 402 421 447 459 476 499 514 566 577 677
  721 757 758 823 864 865 911 921 932 939

# Bugs

- *normal-flow:doc-951*: Need to implement specified→computed dance to correctly
  handle percentage heights with `auto` parent height.
- *floats:doc-02*
- *borders:doc-0190*: Need to handle margin collapsing more correctly
  than I do now.
- *margin-padding-clear:doc-517*
- *normal-flow:doc-474*: Incorrect extraction when anonymous block boxes are
  involved; need to extract the box and element hierarchies separately.
