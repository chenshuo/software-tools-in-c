{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ ckp -- check for "p" after command }
function ckp (var lin : string; i : integer; 
		var pflag : boolean; var status : stcode) : stcode;
begin
	skipbl(lin, i);
	if (lin[i] = PCMD) then begin
		i := i + 1;
		pflag := true
	end
	else
		pflag := false;
	if (lin[i] = NEWLINE) then 
		status := OK
	else
		status := ERR;
	ckp := status
end;
