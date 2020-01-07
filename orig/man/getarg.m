{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.ds n PRIMITIVE
.NM getarg,\ nargs command-line argument handling
.SY
.Q1
	arg : string;
	n : integer;
	b : boolean;

	b := getarg(n, arg, MAXSTR);
	n := nargs;
.Q2
.UL getarg
accesses the
.UL n -th
command-line argument, returns it in
.UL arg ,
and sets
.UL b
to 
.UL true .
If there is no such argument,
.UL b
is 
.UL false .
The argument will be at most
.UL MAXSTR
characters long,
including the terminating
.UL ENDSTR .
.IP
The function
.UL nargs
returns the total number of available arguments.
