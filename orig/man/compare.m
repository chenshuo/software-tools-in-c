{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM compare compare files for equality
.SY
.UL "compare file1 file2"
.FU
.UL compare
performs a line-by-line comparison of
.UL file1
and
.UL file2 ,
printing each pair of differing lines, preceded
by a line containing the offending line number and a colon.
If the files are identical, no output is produced.
If one file is a prefix of the other,
.UL compare
reports end of file on the shorter file.
.EG
.Q1
compare old new
.Q2
.BU
.UL compare
can produce voluminous output for small differences.
