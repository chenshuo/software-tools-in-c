{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ ptext -- output text lines from linebuf }
procedure ptext (var linepos : posbuf; nlines : integer;
		var linebuf : charbuf; outfile : filedesc);
var
	i, j : integer;
begin
	for i := 1 to nlines do begin
		j := linepos[i];
		while (linebuf[j] <> ENDSTR) do begin
			putcf(linebuf[j], outfile);
			j := j + 1
		end
	end
end;
