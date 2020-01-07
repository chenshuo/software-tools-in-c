{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ ctoi -- convert string at s[i] to integer, increment i }
function ctoi (var s : string; var i : integer) : integer;
var
	n, sign : integer;
begin
	while (s[i] = BLANK) or (s[i] = TAB) do
		i := i + 1;
	if (s[i] = MINUS) then
		sign := -1
	else
		sign := 1;
	if (s[i] = PLUS) or (s[i] = MINUS) then
		i := i + 1;
	n := 0;
	while (isdigit(s[i])) do begin
		n := 10 * n + s[i] - ord('0');
		i := i + 1
	end;
	ctoi := sign * n
end;
