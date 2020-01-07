{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ fsize -- size of file in characters }
function fsize (var name : string) : integer;
var
	c : character;
	fd : filedesc;
	n : integer;
begin
	n := 0;
	fd := mustopen(name, IOREAD);
	while (getcf(c, fd) <> ENDFILE) do
		n := n + 1;
	close(fd);
	fsize := n
end;
