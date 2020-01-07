{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ ftalloc -- allocate a file }
function ftalloc : filtyp;
var
	done : boolean;
	ft : filtyp;
begin
	ft := FIL1;
	repeat
		done := (not cmdopen[ft] or (ft = FIL4));
		if (not done) then
			ft := succ(ft)
	until (done);
	if (cmdopen[ft]) then
		ftalloc := CLOSED
	else
		ftalloc := ft
end;
