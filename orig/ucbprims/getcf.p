{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getcf (UCB) -- get one character from file }
function getcf (var c: character; fd : filedesc) : character;
var
	ch : char;
begin
	if (fd = STDIN) then
		getcf := getc(c)
	else if eof(openlist[fd].filevar) then
		c := ENDFILE
	else if eoln(openlist[fd].filevar) then begin
		read(openlist[fd].filevar, ch);
		c := NEWLINE
	end
	else begin
		read(openlist[fd].filevar, ch);
		c := ord(ch)
	end;
	getcf := c
end;
