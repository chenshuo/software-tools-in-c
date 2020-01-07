{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getc (UCB) -- get one character from standard input }
function getc (var c : character) : character;
var
	ch : char;
begin
	if eof then
		c := ENDFILE
	else if eoln then begin
		readln;
		c := NEWLINE
	end
	else begin
		read(ch);
		c := ord(ch)
	end;
	getc := c
end;
