{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ sort -- sort text lines in memory }
procedure sort;
const
	MAXCHARS = 1000;	{ maximum number of text characters }
	MAXLINES = 100;	{ maximum number of line pointers }
type
	charpos = 1..MAXCHARS;
	charbuf = array [1..MAXCHARS] of character;
	posbuf = array [1..MAXLINES] of charpos;
	pos = 0..MAXLINES;
var
	linbuf : charbuf;
	linpos : posbuf;
	nlines : pos;

#include "gtext.p"
#include "quick.p"
#include "ptext.p"

begin
	if (gtext(linpos, nlines, linbuf, STDIN) = ENDFILE) then begin
		quick(linpos, nlines, linbuf);
		ptext(linpos, nlines, linbuf, STDOUT)
	end
	else
		error('sort: input too big to sort')
end;
