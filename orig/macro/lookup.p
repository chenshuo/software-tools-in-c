{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ lookup -- locate name, get defn and type from table }
function lookup (var name, defn : string; var t : sttype)
		: boolean;
var
	p : ndptr;
begin
	p := hashfind(name);
	if (p = nil) then
		lookup := false
	else begin
		lookup := true;
		cscopy(ndtable, p^.defn, defn);
		t := p^.kind
	end
end;
