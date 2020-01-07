{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putc (UCB) -- put one character on standard output }
procedure putc (c : character);
begin
	if c = NEWLINE then
		writeln
	else
		write(chr(c))
end;
