{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ exchange -- exchange linebuf[lp1] with linebuf[lp2] }
procedure exchange (var lp1, lp2 : charpos);
var
	temp : charpos;
begin
	temp := lp1;
	lp1 := lp2;
	lp2 := temp
end;
