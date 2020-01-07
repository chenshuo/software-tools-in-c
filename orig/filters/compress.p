{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ compress -- compress standard input }
procedure compress;
const
	WARNING = TILDE;	{ ~ }
var
	c, lastc : character;
	n : integer;
#include "putrep.p"
begin
	n := 1;
	lastc := getc(lastc);
	while (lastc <> ENDFILE) do begin
		if (getc(c) = ENDFILE) then begin
			if (n > 1) or (lastc = WARNING) then
				putrep(n, lastc)
			else
				putc(lastc)
		end
		else if (c = lastc) then
			n := n + 1
		else if (n > 1) or (lastc = WARNING) then begin
			putrep(n, lastc);
			n := 1
		end
		else
			putc(lastc);
		lastc := c
	end
end;
