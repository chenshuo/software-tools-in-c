{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ dcompare -- drive simple version of compare }
procedure dcompare;
var
	arg1, arg2 : string;
	infile1, infile2 : filedesc;
#include "compare0.p"
begin
	if (not getarg(1, arg1, MAXSTR))
	  or (not getarg(2, arg2, MAXSTR)) then
		error('usage: compare file1 file2');
	infile1 := mustopen(arg1, IOREAD);
	infile2 := mustopen(arg2, IOREAD);
	compare
end;
