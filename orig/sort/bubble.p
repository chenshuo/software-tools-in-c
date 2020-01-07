{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ bubble -- bubble sort v[1] ... v[n] increasing }
procedure bubble (var v : intarray; n : integer);
var
	i, j, k : integer;
begin
	for i := n downto 2 do
		for j := 1 to i-1 do
			if (v[j] > v[j+1]) then begin	{ compare }
				k := v[j];	{ exchange }
				v[j] := v[j+1];
				v[j+1] := k
			end
end;
