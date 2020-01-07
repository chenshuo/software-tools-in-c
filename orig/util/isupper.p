{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ isupper -- true if c is upper case letter }
function isupper (c : character) : boolean;
begin
	isupper := c in [ord('A')..ord('Z')]
end;
