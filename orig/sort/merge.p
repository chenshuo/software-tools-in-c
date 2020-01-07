{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ merge -- merge infile[1] ... infile[nf] onto outfile }
procedure merge (var infile : fdbuf; nf : integer;
		outfile : filedesc);
var
	i, j : integer;
	lbp : charpos;
	temp : string;
#include "reheap.p"
#include "sccopy.p"
#include "cscopy.p"
begin
	j := 0;
	for i := 1 to nf do	{ get one line from each file }
		if (getline(temp, infile[i], MAXSTR)) then begin
			lbp := (i-1)*MAXSTR + 1; { room for longest }
			sccopy(temp, linebuf, lbp);
			linepos[i] := lbp;
			j := j + 1
		end;
	nf := j;
	quick(linepos, nf, linebuf);	{ make initial heap }
	while (nf > 0) do begin
		lbp := linepos[1];	{ lowest line }
		cscopy(linebuf, lbp, temp);
		putstr(temp, outfile);
		i := lbp div MAXSTR + 1;	{ compute file index }
		if (getline(temp, infile[i], MAXSTR)) then
			sccopy(temp, linebuf, lbp)
		else begin	{ one less input file }
			linepos[1] := linepos[nf];
			nf := nf - 1
		end;
		reheap(linepos, nf, linebuf)
	end
end;
