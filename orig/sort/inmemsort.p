{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ sort -- sort text lines in memory }
procedure inmemsort;
const
	MAXCHARS = 10000;	{ maximum # of text characters }
	MAXLINES = 300;		{ maximum # of lines }
type
	charbuf = array [1..MAXCHARS] of character;
	charpos = 1..MAXCHARS;
	posbuf = array [1..MAXLINES] of charpos;
	pos = 0..MAXLINES;
var
	linebuf : charbuf;
	linepos : posbuf;
	nlines : pos;
#include "gtext.p"
#include "shell.p"
#include "ptext.p"
begin
	if (gtext(linepos, nlines, linebuf, STDIN)) then begin
		shell(linepos, nlines, linebuf);
		ptext(linepos, nlines, linebuf, STDOUT)
	end
	else
		error('sort: input too big to sort')
end;
