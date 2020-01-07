{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ default -- set defaulted line numbers }
function default (def1, def2 : integer;
		var status : stcode) : stcode;
begin
	if (nlines = 0) then begin
		line1 := def1;
		line2 := def2
	end;
	if (line1 > line2) or (line1 <= 0) then
		status := ERR
	else
		status := OK;
	default := status
end;
