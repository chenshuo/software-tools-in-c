{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ gopen -- open group of files f1 ... f2 }
procedure gopen (var infile : fdbuf; f1, f2 : integer);
var
	name : string;
	i : 1..MERGEORDER;
begin
	for i := 1 to f2-f1+1 do begin
		gname(f1+i-1, name);
		infile[i] := mustopen(name, IOREAD)
	end
end;
