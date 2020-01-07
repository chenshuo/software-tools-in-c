{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ initio (UCB) -- initialize open file list }
procedure initio;
var
	i : filedesc;
begin
	openlist[STDIN].mode := IOREAD;
	openlist[STDOUT].mode := IOWRITE;
	openlist[STDERR].mode := IOWRITE;

	{ connect STDERR to user's terminal ... }
	rewrite(openlist[STDERR].filevar, '/dev/tty ');

	for i := STDERR+1 to MAXOPEN do
		openlist[i].mode := IOAVAIL;
end;
