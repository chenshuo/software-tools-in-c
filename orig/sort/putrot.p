{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putrot -- create lines with keyword at front }
procedure putrot (var buf : string);
var
	i : integer;
#include "rotate.p"
begin
	i := 1;
	while (buf[i] <> NEWLINE) and (buf[i] <> ENDSTR) do begin
		if (isalphanum(buf[i])) then begin
			rotate(buf, i);	{ token starts at "i" }
			repeat
				i := i + 1
			until (not isalphanum(buf[i]))
		end;
		i := i + 1
	end
end;
