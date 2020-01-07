{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ fprint -- print file "name" from fin }
procedure fprint (var name : string; fin : filedesc);
const
	MARGIN1 = 2;
	MARGIN2 = 2;
	BOTTOM = 64;
	PAGELEN = 66;
var
	line : string;
	lineno, pageno : integer;
#include "skip.p"
#include "head.p"
begin
	pageno := 1;
	skip(MARGIN1);
	head(name, pageno);
	skip(MARGIN2);
	lineno := MARGIN1 + MARGIN2 + 1;
	while (getline(line, fin, MAXSTR)) do begin
		if (lineno = 0) then begin
			skip(MARGIN1);
			pageno := pageno + 1;
			head(name, pageno);
			skip(MARGIN2);
			lineno := MARGIN1 + MARGIN2 + 1
		end;
		putstr(line, STDOUT);
		lineno := lineno + 1;
		if (lineno >= BOTTOM) then begin
			skip(PAGELEN-lineno);
			lineno := 0
		end
	end;
	if (lineno > 0) then 
		skip(PAGELEN-lineno)
end;
