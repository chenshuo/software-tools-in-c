{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ entab -- replace blanks by tabs and blanks }
procedure entab;
const
	MAXLINE = 1000;	{ or whatever }
type
	tabtype = array [1..MAXLINE] of boolean;
var
	c : character;
	col, newcol : integer;
	tabstops : tabtype;
#include "tabpos.p"
#include "settabs.p"
begin
	settabs(tabstops);
	col := 1;
	repeat
		newcol := col;
		while (getc(c) = BLANK) do begin  { collect blanks }
			newcol := newcol + 1;
			if (tabpos(newcol, tabstops)) then begin
				putc(TAB);
				col := newcol
			end
		end;
		while (col < newcol) do begin
			putc(BLANK);		{ output leftover blanks }
			col := col + 1
		end;
		if (c <> ENDFILE) then begin
			putc(c);
			if (c = NEWLINE) then
				col := 1
			else
				col := col + 1
		end
	until (c = ENDFILE)
end;
