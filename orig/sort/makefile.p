{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ makefile -- make new file for number n }
function makefile (n : integer) : filedesc;
var
	name : string;
begin
	gname(n, name);
	makefile := mustcreate(name, IOWRITE)
end;
