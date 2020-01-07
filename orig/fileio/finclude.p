{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ finclude -- include file desc f }
procedure finclude (f : filedesc);
var
	line, str : string;
	loc, i : integer;
	f1 : filedesc;
#include "getword.p"
begin
	while (getline(line, f, MAXSTR)) do begin
		loc := getword(line, 1, str);
		if (not equal(str, incl)) then 
			putstr(line, STDOUT)
		else begin
			loc := getword(line, loc, str);
			str[length(str)] := ENDSTR;	{ remove quotes }
			for i := 1 to length(str) do
				str[i] := str[i+1];
			f1 := mustopen(str, IOREAD);
			finclude(f1);
			close(f1)
		end
	end
end;
