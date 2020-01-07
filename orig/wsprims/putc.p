{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putc and putcf (WS) -- put one character of output }
procedure write (fd : filedesc; var c : character;
		size : integer);
	external;

procedure putc (c : character);
begin
	write(STDOUT, c, 1)
end;

procedure putcf(c : character; fd : filedesc);
begin
	write(fd, c, 1)
end;
