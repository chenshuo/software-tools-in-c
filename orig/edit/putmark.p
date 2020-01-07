{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putmark -- put mark m on nth line }
procedure putmark(n : integer; m : boolean);
begin
	buf[n].mark := m
end;
