{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ length -- compute length of string }
function length (var s : string) : integer;
var
	n : integer;
begin
	n := 1;
	while (s[n] <> ENDSTR) do
		n := n + 1;
	length := n - 1
end;
