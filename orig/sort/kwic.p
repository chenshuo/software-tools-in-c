{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ kwic -- make keyword in context index }
procedure kwic;
const
	FOLD = DOLLAR;
var
	buf : string;
#include "putrot.p"
begin
	while (getline(buf, STDIN, MAXSTR)) do 
		putrot(buf)
end;
