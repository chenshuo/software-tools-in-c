{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ open (UCSD) -- open a file for reading or writing }
(*$I-*)
function open (var name : xstring; mode : integer) : filedesc;
var
	fd : filedesc;
	snm : string;
begin
	fd := fdalloc;
	if (fd <> IOERROR) then begin
		strname(snm, name);
		case (cmdfil[fd]) of
		FIL1:
			reset(file1, snm);
		FIL2:
			reset(file2, snm);
		FIL3:
			reset(file3, snm);
		FIL4:
			reset(file4, snm)
		end;
		if (ioresult <> 0) then begin
			xclose(fd);
			fd := IOERROR
		end
	end;
	open := fd
end;
(*$I+*)
