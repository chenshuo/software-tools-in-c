{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ print (default input STDIN) -- print files with headings }
procedure print;
var
	name : string;
	null : string;	{ value '' }
	i : integer;
	fin : filedesc;
	junk : boolean;
#include "fprint.p"
begin
	{ setstring(null, ''); }
		null[1] := ENDSTR;
	if (nargs = 0) then
		fprint(null, STDIN)
	else
		for i := 1 to nargs do begin
			junk := getarg(i, name, MAXSTR);
			fin := mustopen(name, IOREAD);
			fprint(name, fin);
			close(fin)
		end
end;
