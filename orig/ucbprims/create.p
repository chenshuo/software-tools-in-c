{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ create (UCB) -- create a file }
{	non-portable -- uses the Berkeley interface to Unix }
{	no status can be returned, unfortunately }
function create (var name : string; mode : integer) : filedesc;
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
	create := IOERROR;
	found := false;
	i := 1;
	while (i <= MAXOPEN) and (not found) do begin
		if (openlist[i].mode = IOAVAIL) then begin
			openlist[i].mode := mode;
			rewrite(openlist[i].filevar, intname);
			if (mode = IOREAD) then
				reset(openlist[i].filevar, intname);
			create := i;
			found := true
		end;
		i := i + 1
	end
end;
