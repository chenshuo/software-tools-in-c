{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putcf (UCSD) -- put a single character on fd }
procedure putcf (c : character; fd : filedesc);
begin
	case (cmdfil[fd]) of
	STDIO:
		fputcf(c, output);
	FIL1:
		fputcf(c, file1);
	FIL2:
		fputcf(c, file2);
	FIL3:
		fputcf(c, file3);
	FIL4:
		fputcf(c, file4)
	end
end;
