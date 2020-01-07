{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getarg (UCSD) -- get n-th command line argument into s }
function getarg (n : integer; var s : xstring;
		maxsize : integer) : boolean;
begin
	if ((n < 1) or (cmdargs < n)) then
		getarg := false
	else begin
		scopy(cmdlin, cmdidx[n], s, 1);
		getarg := true
	end
end;
