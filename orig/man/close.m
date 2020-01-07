{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.ds n PRIMITIVE
.NM close close an open file
.SY
.Q1
	fd : filedesc;

	close(fd);
.Q2
.FU
.UL close
releases the file descriptor and any associated resources
for a file opened by
.UL open
or
.UL create .
.BU
Behavior is undefined for closing a file that is not open.
