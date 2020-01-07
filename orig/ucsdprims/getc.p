{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getc (UCSD) -- get one character from standard input }
function getc (var c : character) : character;
begin
	getc := getcf(c, STDIN)
end;
