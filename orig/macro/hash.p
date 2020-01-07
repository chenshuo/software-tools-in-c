{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ hash -- compute hash function of a name }
function hash (var name : string) : integer;
var
	i, h : integer;
begin
	h := 0;
	for i := 1 to length(name) do
		h := (3 * h + name[i]) mod HASHSIZE;
	hash := h + 1
end;
