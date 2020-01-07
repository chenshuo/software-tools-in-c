{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ reheap -- put linebuf[linepos[1]] in proper place in heap }
procedure reheap (var linepos : posbuf; nf : pos;
		var linebuf : charbuf);
var
	i, j : integer;
begin
	i := 1;
	j := 2 * i;
	while (j <= nf) do begin
		if (j < nf) then 	{ find smaller child }
			if (cmp(linepos[j],linepos[j+1],linebuf)>0) then 
				j := j + 1;
		if (cmp(linepos[i], linepos[j], linebuf)<=0) then 
			i := nf	{ proper position found; terminate loop }
		else
			exchange(linepos[i], linepos[j]);	{ percolate }
		i := j;
		j := 2 * i
	end
end;
