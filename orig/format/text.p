{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ text -- process text lines (final version) }
procedure text (var inbuf : string);
var
	wordbuf : string;
	i : integer;
begin
	if (inbuf[1] = BLANK) or (inbuf[1] = NEWLINE) then 
		leadbl(inbuf);	{ move left, set tival }
	if (ulval > 0) then begin	{ underlining }
		underln(inbuf, MAXSTR);
		ulval := ulval - 1
	end;
	if (ceval > 0) then begin	{ centering }
		center(inbuf);
		put(inbuf);
		ceval := ceval - 1
	end
	else if (inbuf[1] = NEWLINE) then 	{ all-blank line }
		put(inbuf)
	else if (not fill) then 	{ unfilled text }
		put(inbuf)
	else begin	{ filled text }
		i := 1;
		repeat
			i := getword(inbuf, i, wordbuf);
			if (i > 0) then
				putword(wordbuf)
		until (i = 0)
	end
end;
