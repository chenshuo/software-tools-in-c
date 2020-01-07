{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ append -- append lines after "line" }
function append (line : integer; glob : boolean) : stcode;
var
	inline : string;
	stat : stcode;
	done : boolean;
begin
	if (glob) then 
		stat := ERR
	else begin
		curln := line;
		stat := OK;
		done := false;
		while (not done) and (stat = OK) do
			if (not getline(inline, STDIN, MAXSTR)) then 
				stat := ENDDATA
			else if (inline[1] = PERIOD)
			  and (inline[2] = NEWLINE) then 
				done := true
			else if (puttxt(inline) = ERR) then 
				stat := ERR
	end;
	append := stat
end;
