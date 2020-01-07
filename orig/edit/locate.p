{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ locate -- look for c in character class at pat[offset] }
function locate (c : character; var pat : string; 
		offset : integer) : boolean;
var
	i : integer;
begin
	{ size of class is at pat[offset], characters follow }
	locate := false;
	i := offset + pat[offset];	{ last position }
	while (i > offset) do
		if (c = pat[i]) then begin
			locate := true;
			i := offset	{ force loop termination }
		end
		else
			i := i - 1
end;
