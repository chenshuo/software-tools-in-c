{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ install -- add name, definition and type to table }
procedure install (var name, defn : string; t : sttype);
var
	h, dlen, nlen : integer;
	p : ndptr;
begin
	nlen := length(name) + 1;	{ 1 for ENDSTR }
	dlen := length(defn) + 1;
	if (nexttab + nlen + dlen > MAXCHARS) then begin
		putstr(name, STDERR);
		error(': too many definitions')
	end
	else begin	{ put it at front of chain }
		h := hash(name);
		new(p);
		p^.nextptr := hashtab[h];
		hashtab[h] := p;
		p^.name := nexttab;
		sccopy(name, ndtable, nexttab);
		nexttab := nexttab + nlen;
		p^.defn := nexttab;
		sccopy(defn, ndtable, nexttab);
		nexttab := nexttab + dlen;
		p^.kind := t
	end
end;
