{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ unrotate -- unrotate lines rotated by kwic }
procedure unrotate;
const
	MAXOUT = 80;
	MIDDLE = 40;
	FOLD = DOLLAR;
var
	inbuf, outbuf : string;
	i, j, f : integer;
begin
	while (getline(inbuf, STDIN, MAXSTR)) do begin
		for i := 1 to MAXOUT-1 do
			outbuf[i] := BLANK;
		f := index(inbuf, FOLD);
		j := MIDDLE - 1;
		for i := length(inbuf)-1 downto f+1 do begin
			outbuf[j] := inbuf[i];
			j := j - 1;
			if (j <= 0) then
				j := MAXOUT - 1
		end;
		j := MIDDLE + 1;
		for i := 1 to f-1 do begin
			outbuf[j] := inbuf[i];
			j := j mod (MAXOUT-1) + 1
		end;
		for j := 1 to MAXOUT-1 do
			if (outbuf[j] <> BLANK) then
				i := j;
		outbuf[i+1] := ENDSTR;
		putstr(outbuf, STDOUT);
		putc(NEWLINE)
	end
end;
