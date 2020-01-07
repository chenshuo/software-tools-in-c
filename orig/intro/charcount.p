{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ charcount -- count characters in standard input }
procedure charcount;
var
	nc : integer;
	c : character;
begin
	nc := 0;
	while (getc(c) <> ENDFILE) do
		nc := nc + 1;
	putdec(nc, 1);
	putc(NEWLINE)
end;
