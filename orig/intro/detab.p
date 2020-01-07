{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ detab -- convert tabs to equivalent number of blanks }
procedure detab;
const
	MAXLINE = 1000;	{ or whatever }
type
	tabtype = array [1..MAXLINE] of boolean;
var
	c : character;
	col : integer;
	tabstops : tabtype;
#include "tabpos.p"
#include "settabs.p"
begin
	settabs(tabstops);	{ set initial tab stops }
	col := 1;
	while (getc(c) <> ENDFILE) do
		if (c = TAB) then
			repeat
				putc(BLANK);
				col := col + 1
			until (tabpos(col, tabstops))
		else if (c = NEWLINE) then begin
			putc(NEWLINE);
			col := 1
		end
		else begin
			putc(c);
			col := col + 1
		end
end;
