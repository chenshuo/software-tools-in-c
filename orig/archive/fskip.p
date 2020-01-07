{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ fskip -- skip n characters on file fd }
procedure fskip (fd : filedesc; n : integer);
var
	c : character;
	i : integer;
begin
	for i := 1 to n do
		if (getcf(c, fd) = ENDFILE) then
			error('archive: end of file in fskip')
end;
