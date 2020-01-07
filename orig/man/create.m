{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.ds n PRIMITIVE
.NM create initialize a file for writing
.SY
.Q1
	name : string;
	fd : filedesc;
	mode : IOREAD..IOWRITE;

	fd := create(name, mode);
.Q2
.FU
.UL create
arranges for access to file
.UL name
with the specified access mode,
which is generally
.UL IOWRITE .
It returns a file descriptor
if the access succeeds, and
.UL IOERROR
if not.
.UL fd 
may be used in subsequent calls to
.UL putcf ,
.UL putstr ,
etc.
.IP
.UL create
creates the file if it does not exist already.
If the file does exist, the effect is to remove it
and create it anew; it is
.ul
not
an error.
