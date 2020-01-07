{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ inithash -- initialize hash table to nil }
procedure inithash;
var
	i : 1..HASHSIZE;
begin
	nexttab := 1;	{ first free slot in table }
	for i := 1 to HASHSIZE do
		hashtab[i] := nil
end;
