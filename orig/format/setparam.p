{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ setparam -- set parameter and check range }
procedure setparam (var param : integer;
		val, argtype, defval, minval, maxval : integer);
begin
	if (argtype = NEWLINE) then 	{ defaulted }
		param := defval
	else if (argtype = PLUS) then 	{ relative + }
		param := param + val
	else if (argtype = MINUS) then 	{ relative - }
		param := param - val
	else	{ absolute }
		param := val;
	param := min(param, maxval);
	param := max(param, minval)
end;
