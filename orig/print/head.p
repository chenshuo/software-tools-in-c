{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ head -- print top of page header }
procedure head (var name : string; pageno : integer);
var
	page : string;	{ set to ' Page ' }
begin
	{ setstring(page, ' Page '); }
		page[1] := ord(' ');
		page[2] := ord('P');
		page[3] := ord('a');
		page[4] := ord('g');
		page[5] := ord('e');
		page[6] := ord(' ');
		page[7] := ENDSTR;
	putstr(name, STDOUT);
	putstr(page, STDOUT);
	putdec(pageno, 1);
	putc(NEWLINE)
end;
