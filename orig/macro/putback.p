{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putback -- push character back onto input }
procedure putback (c : character);
begin
	if (bp >= BUFSIZE) then 
		error('too many characters pushed back');
	bp := bp + 1;
	buf[bp] := c
end;
