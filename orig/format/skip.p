{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ skip -- output  n  blank lines }
procedure skip (n : integer);
var
	i : integer;
begin
	for i := 1 to n do
		putc(NEWLINE)
end;
