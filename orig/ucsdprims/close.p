{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ xclose (UCSD) -- interface to file close }
procedure xclose (fd : filedesc);
begin
	case (cmdfil[fd]) of
	CLOSED, STDIO:
		;	{ do nothing }
	FIL1:
		close(file1, LOCK);
	FIL2:
		close(file2, LOCK);
	FIL3:
		close(file3, LOCK);
	FIL4:
		close(file4, LOCK)
	end;
	cmdopen[cmdfil[fd]] := false;
	cmdfil[fd] := CLOSED
end;
