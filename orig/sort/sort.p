{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ sort -- external sort of text lines }
procedure sort;
const
	MAXCHARS = 10000;	{ maximum # of text characters }
	MAXLINES = 300;		{ maximum # of lines }
	MERGEORDER = 5;
type
	charpos = 1..MAXCHARS;
	charbuf = array [1..MAXCHARS] of character;
	posbuf = array [1..MAXLINES] of charpos;
	pos = 0..MAXLINES;
	fdbuf = array [1..MERGEORDER] of filedesc;
var
	linebuf : charbuf;
	linepos : posbuf;
	nlines : pos;
	infile : fdbuf;
	outfile : filedesc;
	high, low, lim : integer;
	done : boolean;
	name : string;
#include "sortproc.p"
begin
	high := 0;
	repeat	{ initial formation of runs }
		done := gtext(linepos, nlines, linebuf, STDIN);
		quick(linepos, nlines, linebuf);
		high := high + 1;
		outfile := makefile(high);
		ptext(linepos, nlines, linebuf, outfile);
		close(outfile)
	until (done);
	low := 1;
	while (low < high) do begin	{ merge runs }
		lim := min(low+MERGEORDER-1, high);
		gopen(infile, low, lim);
		high := high + 1;
		outfile := makefile(high);
		merge(infile, lim-low+1, outfile);
		close(outfile);
		gremove(infile, low, lim);
		low := low + MERGEORDER
	end;
	gname(high, name);	{ final cleanup }
	outfile := open(name, IOREAD);
	fcopy(outfile, STDOUT);
	close(outfile);
	remove(name)
end;
