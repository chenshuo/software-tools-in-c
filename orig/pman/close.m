{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM close close a file descriptor
.SY
.UL "procedure close (fd : filedesc);"
.FU
.UL close
releases the file descriptor and any associated resources
for a file opened by
.UL open
or
.UL create .
.RE
Nothing.
