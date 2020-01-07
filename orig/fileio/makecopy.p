{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ makecopy -- copy one file to another }
procedure makecopy;
var
	inname, outname : string;
	fin, fout : filedesc;
begin
	if (not getarg(1, inname, MAXSTR))
	  or (not getarg(2, outname, MAXSTR)) then
		error('usage: makecopy old new');
	fin := mustopen(inname, IOREAD);
	fout := mustcreate(outname, IOWRITE);
	fcopy(fin, fout);
	close(fin);
	close(fout)
end;
