{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ update -- update existing files, add new ones at end }
procedure update (var aname : string; cmd : character);
var
	i : integer;
	afd, tfd : filedesc;
begin
	tfd := mustcreate(archtemp, IOWRITE);
	if (cmd = ord('u')) then begin
		afd := mustopen(aname, IOREAD);
		replace(afd, tfd, ord('u'));	{ update existing }
		close(afd)
	end;
	for i := 1 to nfiles do		{ add new ones }
		if (fstat[i] = false) then begin
			addfile(fname[i], tfd);
			fstat[i] := true
		end;
	close(tfd);
	if (errcount = 0) then 
		fmove(archtemp, aname)
	else
		message('fatal errors - archive not altered');
	remove(archtemp)
end;
