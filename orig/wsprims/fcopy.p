{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ fcopy -- copy file fin to file fout }
function getcf (var c : character; fd : filedesc) : character;
	external;

procedure putcf (c : character; fd : filedesc);
	external;

procedure fcopy (fin, fout : filedesc);
var
	c : character;
begin
	while (getcf(c, fin) <> ENDFILE) do
		putcf(c, fout)
end;
