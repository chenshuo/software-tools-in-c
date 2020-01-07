{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ remove (UCB) -- remove file s from file system }
{	this version just prints a message }
procedure remove (var s : string);
begin
	message('If we had remove, we would be removing ');
	putcf(TAB, STDERR);
	putstr(s, STDERR);
	putcf(NEWLINE, STDERR);
	flush(openlist[STDERR].filevar)
end;
