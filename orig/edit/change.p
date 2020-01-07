{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ change -- change "from" into "to" on each line }
procedure change;
#include "findcons.p"
	DITTO = -1;
var
	lin, pat, sub, arg : string;
#include "getpat.p"
#include "getsub.p"
#include "subline.p"
begin
	if (not getarg(1, arg, MAXSTR)) then 
		error('usage: change from [to]');
	if (not getpat(arg, pat)) then 
		error('change: illegal "from" pattern');
	if (not getarg(2, arg, MAXSTR)) then 
		arg[1] := ENDSTR;
	if (not getsub(arg, sub)) then 
		error('change: illegal "to" string');
	while (getline(lin, STDIN, MAXSTR)) do
		subline(lin, pat, sub)
end;
