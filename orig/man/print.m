{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM print print files with headings
.SY
.UL "print [ file ... ]"
.FU
.UL print
copies each of its argument files in turn to its output, inserting page
headers and footers and filling the last page of each file to full length.
A header consists of two blank lines, a line giving the filename and
page number, and two more blank lines;
a footer consists of two blank lines.
Pages for each file are numbered starting at one.
If no arguments are specified,
.UL print
prints its standard input;
the file name is null.
.IP
The text of each file is unmodified \(em
no attempt is made to fold long lines or expand tabs to spaces.
.EG
.Q1
print print.p fprint.p
.Q2
