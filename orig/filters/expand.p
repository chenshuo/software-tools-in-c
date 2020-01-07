{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ expand -- uncompress standard input }
procedure expand;
const
	WARNING = TILDE;	{ ~ }
var
	c : character;
	n : integer;
begin
	while (getc(c) <> ENDFILE) do
		if (c <> WARNING) then
			putc(c)
		else if (isupper(getc(c))) then begin
			n := c - ord('A') + 1;
			if (getc(c) <> ENDFILE) then
				for n := n downto 1 do
					putc(c)
			else begin
				putc(WARNING);
				putc(n - 1 + ord('A'))
			end
		end
		else begin
			putc(WARNING);
			if (c <> ENDFILE) then
				putc(c)
		end
end;
