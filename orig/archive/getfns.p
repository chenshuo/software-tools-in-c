{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getfns -- get filenames into fname, look for duplicates }
procedure getfns;
var
	i, j : integer;
	junk : boolean;
begin
	errcount := 0;
	nfiles := nargs - 2;
	if (nfiles > MAXFILES) then
		error('archive: too many file names');
	for i := 1 to nfiles do
		junk := getarg(i+2, fname[i], MAXSTR);
	for i := 1 to nfiles do
		fstat[i] := false;
	for i := 1 to nfiles - 1 do
		for j := i + 1 to nfiles do
			if (equal(fname[i], fname[j])) then begin
				putstr(fname[i], STDERR);
				error(': duplicate file name')
			end
end;
