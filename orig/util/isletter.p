{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ isletter -- true if c is a letter of either case }
function isletter (c : character) : boolean;
begin
	isletter :=
		c in [ord('a')..ord('z')] + [ord('A')..ord('Z')]
end;
