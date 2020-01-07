{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ unique -- remove adjacent duplicate lines }
procedure unique;
var
	buf : array [0..1] of string;
	cur : 0..1;
begin
	cur := 1;
	buf[1-cur][1] := ENDSTR;
	while (getline(buf[cur], STDIN, MAXSTR)) do
		if (not equal(buf[cur], buf[1-cur])) then begin
			putstr(buf[cur], STDOUT);
			cur := 1 - cur
		end
end;
