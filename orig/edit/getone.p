{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getone -- get one line number expression }
function getone (var lin : string; var i, num : integer;
		var status : stcode) : stcode;
var
	istart, mul, pnum : integer;
begin
	istart := i;
	num := 0;
	if (getnum(lin, i, num, status) = OK) then 	{ 1st term }
		repeat	{ + or - terms }
			skipbl(lin, i);
			if (lin[i] <> PLUS) and (lin[i] <> MINUS) then
				status := ENDDATA
			else begin
				if (lin[i] = PLUS) then 
					mul := +1
				else
					mul := -1;
				i := i + 1;
				if (getnum(lin, i, pnum, status) = OK) then 
					num := num + mul * pnum;
				if (status = ENDDATA) then 
					status := ERR
			end
		until (status <> OK);
	if (num < 0) or (num > lastln) then 
		status := ERR;
	if (status <> ERR) then begin
		if (i <= istart) then 
			status := ENDDATA
		else
			status := OK
	end;
	getone := status
end;
