{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ center -- center a line by setting tival }
procedure center (var buf : string);
begin
	tival := max((rmval+tival-width(buf)) div 2, 0)
end;
