{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.ds n PRIMITIVE
.NM remove remove file from secondary storage
.SY
.Q1
	name : string;

	remove(name);
.Q2
.FU
.UL remove
removes the named file from secondary storage,
thus making the name and space available for another use.
