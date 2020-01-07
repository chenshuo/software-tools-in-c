{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ optpat -- get optional pattern from lin[i], increment i }
function optpat (var lin : string; var i : integer) : stcode;
#include "makepat.p"
begin
	if (lin[i] = ENDSTR) then 
		i := 0
	else if (lin[i+1] = ENDSTR) then 
		i := 0
	else if (lin[i+1] = lin[i]) then  { repeated delimiter }
		i := i + 1	{ leave existing pattern alone }
	else
		i := makepat(lin, i+1, lin[i], pat);
	if (pat[1] = ENDSTR) then 
		i := 0;
	if (i = 0) then begin
		pat[1] := ENDSTR;
		optpat := ERR
	end
	else
		optpat := OK
end;
