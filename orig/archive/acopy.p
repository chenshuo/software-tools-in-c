{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ acopy -- copy n characters from fdi to fdo }
procedure acopy (fdi, fdo : filedesc; n : integer);
var
	c : character;
	i : integer;
begin
	for i := 1 to n do
		if (getcf(c, fdi) = ENDFILE) then
			error('archive: end of file in acopy')
		else
			putcf(c, fdo)
end;
