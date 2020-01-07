{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getarg (UCB) -- copy n-th command line argument into s }
{	uses the Berkeley function argv(i,s), }
{	which returns the 0th to argc-1th argument in s. }
function getarg (n : integer; var s : string;
		maxs : integer) : boolean;
var
	arg : array [1..MAXSTR] of char;
	i, lnb : integer;
begin
	lnb := 0;
	if (n >= 0) and (n < argc) then begin	{ in the list }
		argv(n, arg);	{ get the argument }
		for i := 1 to MAXSTR-1 do begin
			s[i] := ord(arg[i]);
			if arg[i] <> ' ' then
				lnb := i
		end;
		getarg := true
	end
	else
		getarg := false;
	s[lnb+1] := ENDSTR
end;
