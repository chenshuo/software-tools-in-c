{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ gtext -- get text lines into linebuf }
function gtext (var linepos : posbuf; var nlines : pos;
		var linebuf : charbuf; infile : filedesc) : boolean;
var
	i, len, nextpos : integer;
	temp : string;
	done : boolean;
begin
	nlines := 0;
	nextpos := 1;
	repeat
		done := (getline(temp, infile, MAXSTR) = false);
		if (not done) then begin
			nlines := nlines + 1;
			linepos[nlines] := nextpos;
			len := length(temp);
			for i := 1 to len do
				linebuf[nextpos+i-1] := temp[i];
			linebuf[nextpos+len] := ENDSTR;
			nextpos := nextpos + len + 1  { 1 for ENDSTR }
		end
	until (done) or (nextpos >= MAXCHARS-MAXSTR)
			or (nlines >= MAXLINES);
	gtext := done
end;
