{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getrhs -- get right hand side of "s" command }
function getrhs (var lin : string; var i : integer;
		 var sub : string; var gflag : boolean) : stcode;
begin
	getrhs := OK;
	if (lin[i] = ENDSTR) then 
		getrhs := ERR
	else if (lin[i+1] = ENDSTR) then 
		getrhs := ERR
	else begin
		i := makesub(lin, i+1, lin[i], sub);
		if (i = 0) then 
			getrhs := ERR
		else if (lin[i+1] = ord('g')) then begin
			i := i + 1;
			gflag := true
		end
		else
			gflag := false
	end
end;
