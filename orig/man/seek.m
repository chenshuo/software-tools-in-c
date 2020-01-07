{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.ds n PRIMITIVE
.NM seek position file for reading or writing
.SY
.Q1
	pos : integer;
	fd : filedesc;

	seek(pos, fd);
.Q2
.FU
.UL seek
arranges that the next input-output operation
that uses
.UL fd
will affect the file at the position specified
by
.UL pos .
.BU
The units for
.UL pos
are not specified.
In particular, characters and records
both have things to recommend them.
