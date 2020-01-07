{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ overstrike -- convert backspaces into multiple lines }
procedure overstrike;
const
	SKIP = BLANK;
	NOSKIP = PLUS;
var
	c : character;
	col, newcol, i : integer;
begin
	col := 1;
	repeat
		newcol := col;
		while (getc(c) = BACKSPACE) do 	{ eat backspaces }
			newcol := max(newcol-1, 1);
		if (newcol < col) then begin
			putc(NEWLINE);	{ start overstrike line }
			putc(NOSKIP);
			for i := 1 to newcol-1 do
				putc(BLANK);
			col := newcol
		end
		else if (col = 1) and (c <> ENDFILE) then
			putc(SKIP);	{ normal line }
		{ else middle of line }
		if (c <> ENDFILE) then begin
			putc(c);				{ normal character }
			if (c = NEWLINE) then 
				col := 1
			else
				col := col + 1
		end
	until (c = ENDFILE)
end;
