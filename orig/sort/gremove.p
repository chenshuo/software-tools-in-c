{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ gremove -- remove group of files f1 ... f2 }
procedure gremove (var infile : fdbuf; f1, f2 : integer);
var
	name : string;
	i : 1..MERGEORDER;
begin
	for i := 1 to f2-f1+1 do begin
		close(infile[i]);
		gname(f1+i-1, name);
		remove(name)
	end
end;
