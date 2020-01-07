{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM concat concatenate files
.SY
.UL "concat file ..."
.FU
.UL concat
writes the contents of each of its file arguments in turn to its output,
thus concatenating them into one larger file.
Since
.UL concat
performs no reformatting or interpretation of the input files,
it is useful for displaying the contents of a file.
.EG
To examine a file:
.Q1
concat file
.Q2
