{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ archive -- file maintainer }
procedure archive;
const
	MAXFILES = 100;	{ or whatever }
var
	aname : string;		{ archive name }
	cmd : string;		{ command type }
	fname : array [1..MAXFILES] of string;	{ filename args }
	fstat : array [1..MAXFILES] of boolean;	{ true=in archive }
	nfiles : integer;	{ number of filename arguments }
	errcount : integer;	{ number of errors }
	archtemp : string;	{ temp file name 'artemp' }
	archhdr : string;	{ header string '-h-' }
#include "archproc.p"
begin
	initarch;
	if (not getarg(1, cmd, MAXSTR))
	  or (not getarg(2, aname, MAXSTR)) then
		help;
	getfns;
	if (length(cmd) <> 2) or (cmd[1] <> ord('-')) then
		help
	else if (cmd[2] = ord('c')) or (cmd[2] = ord('u')) then 
		update(aname, cmd[2])
	else if (cmd[2] = ord('t')) then 
		table(aname)
	else if (cmd[2] = ord('x')) or (cmd[2] = ord('p')) then 
		extract(aname, cmd[2])
	else if (cmd[2] = ord('d')) then 
		delete(aname)
	else
		help
end;
