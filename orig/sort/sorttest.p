{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
procedure sorttest;
type	intarray = array [1..100] of integer;
var
	v : intarray;
	buf : string;
	i, j : integer;
#include "shell0.p"
#include "ctoi.p"
begin
	j := 0;
	while (getline(buf, STDIN, MAXSTR)) do begin
		j := j + 1;
		i := 1;
		v[j] := ctoi(buf, i)
		end;
	shell(v, j);
	for i := 1 to j do begin
		putdec(v[i], 1);
		putc(NEWLINE)
	end
end;
