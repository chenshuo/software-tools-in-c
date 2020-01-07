{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ islower -- true if c is lower case letter }
function islower (c : character) : boolean;
begin
	islower := c in [ord('a')..ord('z')]
end;
