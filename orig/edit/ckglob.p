{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ ckglob -- if global prefix, mark lines to be affected }
function ckglob (var lin : string; var i : integer;
		var status : stcode) : stcode;
var
	n : integer;
	gflag : boolean;
	temp : string;
begin
	if (lin[i] <> GCMD) and (lin[i] <> XCMD) then 
		status := ENDDATA
	else begin
		gflag := (lin[i] = GCMD);
		i := i + 1;
		if (optpat(lin, i) = ERR) then
			status := ERR
		else if (default(1,lastln,status) <> ERR) then begin
			i := i + 1;	{ mark affected lines }
			for n := line1 to line2 do begin
				gettxt(n, temp);
				putmark(n, (match(temp, pat) = gflag))
			end;
			for n := 1 to line1-1 do	{ erase other marks }
				putmark(n, false);
			for n := line2+1 to lastln do
				putmark(n, false);
			status := OK
		end
	end;
	ckglob := status
end;
