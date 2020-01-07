{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getmark -- get mark from nth line }
function getmark (n : integer) : boolean;
begin
	getmark := buf[n].mark
end;
