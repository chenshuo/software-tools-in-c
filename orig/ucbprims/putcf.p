{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putcf (UCB) -- put a single character on file fd }
procedure putcf (c : character; fd : filedesc);
begin
	if (fd = STDOUT) then
		putc(c)
	else if c = NEWLINE then
		writeln(openlist[fd].filevar)
	else
		write(openlist[fd].filevar, chr(c))
end;
