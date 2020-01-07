{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ reverse -- reverse buf[n1]...buf[n2] }
procedure reverse (n1, n2 : integer);
var
	temp : buftype;
begin
	while (n1 < n2) do begin
		temp := buf[n1];
		buf[n1] := buf[n2];
		buf[n2] := temp;
		n1 := n1 + 1;
		n2 := n2 - 1
	end
end;
