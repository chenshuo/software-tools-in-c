{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ open (UCB) -- open a file for reading or writing }
{	non-portable -- uses the Berkeley interface to Unix }
{	no status can be returned, unfortunately }
function open (var name : string; mode : integer) : filedesc;
var
	i : integer;
	intname : array [1..MAXSTR] of char;
	found : boolean;
begin
	i := 1;
	while (name[i] <> ENDSTR) do begin
		intname[i] := chr(name[i]);
		i := i + 1
	end;
	for i := i to MAXSTR do
		intname[i] := ' ';	{ pad name with blanks }
	{ find a free slot in openlist }
	open := IOERROR;
	found := false;
	i := 1;
	while (i <= MAXOPEN) and (not found) do begin
		if (openlist[i].mode = IOAVAIL) then begin
			openlist[i].mode := mode;
			if (mode = IOREAD) then
				reset(openlist[i].filevar, intname)
			else
				rewrite(openlist[i].filevar, intname);
			open := i;
			found := true
		end;
		i := i + 1
	end
end;
