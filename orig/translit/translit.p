{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ translit -- map characters }
procedure translit;
const
	NEGATE = CARET;	{ ^ }
var
	arg, fromset, toset : string;
	c : character;
	i, lastto : 0..MAXSTR;
	allbut, squash : boolean;
#include "makeset.p"
#include "xindex.p"
begin
	if (not getarg(1, arg, MAXSTR)) then 
		error('usage: translit from to');
	allbut := (arg[1] = NEGATE);
	if (allbut) then
		i := 2
	else
		i := 1;
	if (not makeset(arg, i, fromset, MAXSTR)) then 
		error('translit: "from" set too large');
	if (not getarg(2, arg, MAXSTR)) then 
		toset[1] := ENDSTR
	else if (not makeset(arg, 1, toset, MAXSTR)) then 
		error('translit: "to" set too large') 
	else if (length(fromset) < length(toset)) then
		error('translit: "from" shorter than "to"');

	lastto := length(toset);
	squash := (length(fromset) > lastto) or (allbut); 
	repeat
		i := xindex(fromset, getc(c), allbut, lastto);
		if (squash) and (i>=lastto) and (lastto>0) then begin
			putc(toset[lastto]);
			repeat
				i := xindex(fromset, getc(c), allbut, lastto)
			until (i < lastto)
		end;
		if (c <> ENDFILE) then begin
			if (i > 0) and (lastto > 0) then 	{ translate }
				putc(toset[i])
			else if (i = 0) then 	{ copy }
				putc(c)
			{ else delete }
		end
	until (c = ENDFILE)
end;
