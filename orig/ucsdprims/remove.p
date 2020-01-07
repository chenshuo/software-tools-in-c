{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ remove -- remove a file }
procedure remove (name : xstring);
var
	fd : filedesc;
begin
	fd := open(name, IOREAD);
	if (fd = IOERROR) then
		message('can''t remove file')
	else begin
		case (cmdfil[fd]) of
		FIL1:
			close(file1, PURGE);
		FIL2:
			close(file2, PURGE);
		FIL3:
			close(file3, PURGE);
		FIL4:
			close(file4, PURGE)
		end
	end;
	cmdfil[fd] := CLOSED
end;
