{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ copy -- copy input to output }
procedure copy;
var
	c : character;
begin
	while (getc(c) <> ENDFILE) do
		putc(c)
end;
