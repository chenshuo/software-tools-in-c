{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ notfound -- print "not found" warning }
procedure notfound;
var
	i : integer;
begin
	for i := 1 to nfiles do
		if (fstat[i] = false) then begin
			putstr(fname[i], STDERR);
			message(': not in archive');
			errcount := errcount + 1
		end
end;
