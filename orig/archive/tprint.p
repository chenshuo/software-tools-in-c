{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ tprint -- print table entry for one member }
procedure tprint (var buf : string);
var
	i : integer;
	temp : string;
begin
	i := getword(buf, 1, temp);	{ header }
	i := getword(buf, i, temp);	{ name }
	putstr(temp, STDOUT);
	putc(BLANK);
	i := getword(buf, i, temp);	{ size }
	putstr(temp, STDOUT);
	putc(NEWLINE)
end;
