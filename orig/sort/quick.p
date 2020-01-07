{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ quick -- quicksort for lines }
procedure quick (var linepos : posbuf; nlines : pos;
		var linebuf : charbuf);
#include "rquick.p"
begin
	rquick(1, nlines)
end;
