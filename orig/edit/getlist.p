{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getlist -- get list of line nums at lin[i], increment i }
function getlist (var lin : string; var i : integer;
	var status : stcode) : stcode;
var
	num : integer;
	done : boolean;
begin
	line2 := 0;
	nlines := 0;
	done := (getone(lin, i, num, status) <> OK);
	while (not done) do begin
		line1 := line2;
		line2 := num;
		nlines := nlines + 1;
		if (lin[i] = SEMICOL) then 
			curln := num;
		if (lin[i] = COMMA) or (lin[i] = SEMICOL) then begin
			i := i + 1;
			done := (getone(lin, i, num, status) <> OK)
		end
		else
			done := true
	end;
	nlines := min(nlines, 2);
	if (nlines = 0) then 
		line2 := curln;
	if (nlines <= 1) then 
		line1 := line2;
	if (status <> ERR) then 
		status := OK;
	getlist := status
end;
