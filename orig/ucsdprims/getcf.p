{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getcf (UCSD) -- get one character from file }
function getcf (var c : character; fd : filedesc)
		 : character;
begin
	case (cmdfil[fd]) of
	STDIO:
		c := getkbd(c);
	FIL1:
		c := fgetcf(file1);
	FIL2:
		c := fgetcf(file2);
	FIL3:
		c := fgetcf(file3);
	FIL4:
		c := fgetcf(file4)
	end;
	getcf := c
end;
