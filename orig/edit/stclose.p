{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ stclose -- insert closure entry at pat[j] }
procedure stclose (var pat : string; var j : integer;
		lastj : integer);
var
	jp, jt : integer;
	junk : boolean;
begin
	for jp := j-1 downto lastj do begin
		jt := jp + CLOSIZE;
		junk := addstr(pat[jp], pat, jt, MAXPAT)
	end;
	j := j + CLOSIZE;
	pat[lastj] := CLOSURE  { where original pattern began }
end;
