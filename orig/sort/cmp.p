{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ cmp -- compare linebuf[i] with linebuf[j] }
function cmp (i, j : charpos; var linebuf : charbuf)
		: integer;
begin
	while (linebuf[i] = linebuf[j])
	  and (linebuf[i] <> ENDSTR) do begin
		i := i + 1;
		j := j + 1
	end;
	if (linebuf[i] = linebuf[j]) then
		cmp := 0
	else if (linebuf[i] = ENDSTR) then	{ 1st is shorter }
		cmp := -1
	else if (linebuf[j] = ENDSTR) then	{ 2nd is shorter }
		cmp := +1
	else if (linebuf[i] < linebuf[j]) then 
		cmp := -1
	else
		cmp := +1
end;
