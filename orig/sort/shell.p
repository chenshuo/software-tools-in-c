{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ shell -- ascending Shell sort for lines }
procedure shell (var linepos : posbuf; nlines : integer;
		var linebuf : charbuf);
var
	gap, i, j, jg : integer;
#include "cmp.p"
#include "exchange.p"
begin
	gap := nlines div 2;
	while (gap > 0) do begin
		for i := gap+1 to nlines do begin
			j := i - gap;
			while (j > 0) do begin
				jg := j + gap;
				if (cmp(linepos[j],linepos[jg],linebuf)<=0) then
					j := 0	{ force loop termination }
				else
					exchange(linepos[j], linepos[jg]);
				j := j - gap
			end
		end;
		gap := gap div 2
	end
end;
