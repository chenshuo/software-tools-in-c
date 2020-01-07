{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ create (UCSD) -- create a file }
(*$I-*)
function create (var name : xstring; mode : integer) : filedesc;
var
	fd : filedesc;
	snm : string;
begin
	fd := fdalloc;
	if (fd <> IOERROR) then begin
		strname(snm, name);
		case (cmdfil[fd]) of
		FIL1:
			rewrite(file1, snm);
		FIL2:
			rewrite(file2, snm);
		FIL3:
			rewrite(file3, snm);
		FIL4:
			rewrite(file4, snm)
		end;
		if (ioresult <> 0) then begin
			xclose(fd);
			fd := IOERROR
		end
	end;
	create := fd
end;
(*$I+*)
