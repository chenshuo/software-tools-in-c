{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ makehdr -- make header line for archive member }
procedure makehdr (var name, head : string);
var
	i : integer;
#include "fsize.p"
begin
	scopy(archhdr, 1, head, 1);
	i := length(head) + 1;
	head[i] := BLANK;
	scopy(name, 1, head, i+1);
	i := length(head) + 1;
	head[i] := BLANK;
	i := itoc(fsize(name), head, i+1);
	head[i] := NEWLINE;
	head[i+1] := ENDSTR
end;
