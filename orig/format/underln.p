{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ underln -- underline a line }
procedure underln (var buf : string; size : integer);
var
	i, j : integer;
	tbuf : string;
begin
	j := 1;	{ expand into tbuf }
	i := 1;
	while (buf[i] <> NEWLINE) and (j < size-1) do begin
		if (isalphanum(buf[i])) then begin
			tbuf[j] := UNDERLINE;
			tbuf[j+1] := BACKSPACE;
			j := j + 2
		end;
		tbuf[j] := buf[i];
		j := j + 1;
		i := i + 1
	end;
	tbuf[j] := NEWLINE;
	tbuf[j+1] := ENDSTR;
	scopy(tbuf, 1, buf, 1)	{ copy it back to buf }
end;
