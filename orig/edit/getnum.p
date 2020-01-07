{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getnum -- get single line number component }
function getnum (var lin : string;  var i, num : integer;
		var status : stcode) : stcode;
begin
	status := OK;
	skipbl(lin, i);
	if (isdigit(lin[i])) then begin
		num := ctoi(lin, i);
		i := i - 1	{ move back; to be advanced at end }
	end
	else if (lin[i] = CURLINE) then 
		num := curln
	else if (lin[i] = LASTLINE) then 
		num := lastln
	else if (lin[i] = SCAN) or (lin[i] = BACKSCAN) then begin
		if (optpat(lin, i) = ERR) then 	{ build pattern }
			status := ERR
		else
			status := patscan(lin[i], num)
	end
	else
		status := ENDDATA;
	if (status = OK) then 
		i := i + 1;	{ next character to be examined }
	getnum := status
end;
