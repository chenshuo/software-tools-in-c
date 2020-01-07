{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getfn -- get file name from lin[i]... }
function getfn (var lin : string; var i : integer; 
		var fil : string) : stcode;
var
	k : integer;
	stat : stcode;
#include "getword.p"
begin
	stat := ERR;
	if (lin[i+1] = BLANK) then begin
		k := getword(lin, i+2, fil);	{ get new filename }
		if (k > 0) then
			if (lin[k] = NEWLINE) then
				stat := OK
	end
	else if (lin[i+1] = NEWLINE)
	  and (savefile[1] <> ENDSTR) then begin
		scopy(savefile, 1, fil, 1);
		stat := OK
	end;
	if (stat = OK) and (savefile[1] = ENDSTR) then 
		scopy(fil, 1, savefile, 1);	{ save if no old one }
	getfn := stat
end;
