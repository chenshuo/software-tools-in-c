{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ print -- print files with headings }
procedure print;
var
	name : string;
	i : integer;
	fin : filedesc;
	junk : boolean;
#include "fprint.p"
begin
	for i := 1 to nargs do begin
		junk := getarg(i, name, MAXSTR);
		fin := mustopen(name, IOREAD);
		fprint(name, fin);
		close(fin)
	end
end;
