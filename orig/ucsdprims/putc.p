{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putc (UCSD) -- put one character on standard output }
procedure putc (c : character);
begin
	putcf(c, STDOUT)
end;
