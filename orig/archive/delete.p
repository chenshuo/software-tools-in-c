{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ delete -- delete files from archive }
procedure delete (var aname : string);
var
	afd, tfd : filedesc;
begin
	if (nfiles <= 0) then 	{ protect innocents }
		error('archive: -d requires explicit file names');
	afd := mustopen(aname, IOREAD);
	tfd := mustcreate(archtemp, IOWRITE);
	replace(afd, tfd, ord('d'));
	notfound;
	close(afd);
	close(tfd);
	if (errcount = 0) then 
		fmove(archtemp, aname)
	else
		message('fatal errors - archive not altered');
	remove(archtemp)
end;
