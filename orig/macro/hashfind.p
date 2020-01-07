{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ hashfind -- find name in hash table }
function hashfind (var name : string) : ndptr;
var
	p : ndptr;
	tempname : string;
	found : boolean;
begin
	found := false;
	p := hashtab[hash(name)];
	while (not found) and (p <> nil) do begin
		cscopy(ndtable, p^.name, tempname);
		if (equal(name, tempname)) then
			found := true
		else
			p := p^.nextptr
	end;
	hashfind := p
end;
