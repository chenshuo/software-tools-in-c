{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ shell -- Shell sort v[1]...v[n] increasing }
procedure shell (var v : intarray; n : integer);
var
	gap, i, j, jg, k : integer;
begin
	gap := n div 2;
	while (gap > 0) do begin
		for i := gap+1 to n do begin
			j := i - gap;
			while (j > 0) do begin
				jg := j + gap;
				if (v[j] <= v[jg]) then 	{ compare }
					j := 0	{ force loop termination }
				else begin
					k := v[j];	{ exchange }
					v[j] := v[jg];
					v[jg] := k
				end;
				j := j - gap
			end
		end;
		gap := gap div 2
	end
end;
