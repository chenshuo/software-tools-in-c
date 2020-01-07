{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ find -- find patterns in text }
procedure find;
#include "findcons.p"
var
	arg, lin, pat : string;
#include "getpat.p"
#include "match.p"
begin
	if (not getarg(1, arg, MAXSTR)) then 
		error('usage: find pattern');
	if (not getpat(arg, pat)) then 
		error('find: illegal pattern');
	while (getline(lin, STDIN, MAXSTR)) do 
		if (match(lin, pat)) then 
			putstr(lin, STDOUT)
end;
