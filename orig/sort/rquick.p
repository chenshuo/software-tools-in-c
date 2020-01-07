{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ rquick -- recursive quicksort }
procedure rquick (lo, hi: integer);
var
	i, j : integer;
	pivline : charpos;
begin
	if (lo < hi) then begin
		i := lo;
		j := hi;
		pivline := linepos[j];	{ pivot line }
		repeat
			while (i < j)
			  and (cmp(linepos[i],pivline,linebuf) <= 0) do
				i := i + 1;
			while (j > i)
			  and (cmp(linepos[j],pivline,linebuf) >= 0) do
				j := j - 1;
			if (i < j) then 	{ out of order pair }
				exchange(linepos[i], linepos[j])
		until (i >= j);
		exchange(linepos[i], linepos[hi]); { move pivot to i }
		if (i - lo < hi - i) then begin
			rquick(lo, i-1);
			rquick(i+1, hi)
		end
		else begin
			rquick(i+1, hi);
			rquick(lo, i-1)
		end
	end
end;
