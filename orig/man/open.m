{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.ds n PRIMITIVE
.NM open open a file for reading or writing
.SY
.Q1
	name : string;
	fd : filedesc;
	mode : IOREAD..IOWRITE;

	fd := open(name, mode);
.Q2
.FU
.UL open
arranges for access to file
.UL name
with the specified access mode.
It returns a file descriptor
if the access succeeds, and
.UL IOERROR
if not.
.UL fd 
may be used in subsequent calls to
.UL getcf,
.UL getline ,
.UL putcf ,
.UL putstr ,
etc.
