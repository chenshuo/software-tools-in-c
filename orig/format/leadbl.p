{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ leadbl -- delete leading blanks, set tival }
procedure leadbl (var buf : string);
var
	i, j : integer;
begin
	break;
	i := 1;
	while (buf[i] = BLANK) do	{ find 1st non-blank }
		i := i + 1;
	if (buf[i] <> NEWLINE) then 
		tival := tival + i - 1;
	for j := i to length(buf)+1 do	{ move line to left }
		buf[j-i+1] := buf[j]
end;
