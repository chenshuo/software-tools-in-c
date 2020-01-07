{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ filearg -- check if name matches argument list }
function filearg (var name : string) : boolean;
var
	i : integer;
	found : boolean;
begin
	if (nfiles <= 0) then
		filearg := true
	else begin
		found := false;
		i := 1;
		while (not found) and (i <= nfiles) do begin
			if (equal(name, fname[i])) then begin
				fstat[i] := true;
				found := true
			end;
			i := i + 1
		end;
		filearg := found
	end
end;
