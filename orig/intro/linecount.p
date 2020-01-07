{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ linecount -- count lines in standard input }
procedure linecount;
var
	nl : integer;
	c : character;
begin
	nl := 0;
	while (getc(c) <> ENDFILE) do
		if (c = NEWLINE) then
			nl := nl + 1;
	putdec(nl, 1);
	putc(NEWLINE)
end;
