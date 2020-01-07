{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ dodash - expand set at src[i] into dest[j], stop at delim }
procedure dodash (delim : character; var src : string;
		var i : integer; var dest : string;
		var j : integer; maxset : integer);
var
	k : integer;
	junk : boolean;
begin
	while (src[i] <> delim) and (src[i] <> ENDSTR) do begin
		if (src[i] = ESCAPE) then 
			junk := addstr(esc(src, i), dest, j, maxset)
		else if (src[i] <> DASH) then 
			junk := addstr(src[i], dest, j, maxset)
		else if (j <= 1) or (src[i+1] = ENDSTR) then
			junk := addstr(DASH,dest,j,maxset) { literal - }
		else if (isalphanum(src[i-1]))
		  and (isalphanum(src[i+1]))
		  and (src[i-1] <= src[i+1]) then begin
			for k := src[i-1]+1 to src[i+1] do
				junk := addstr(k, dest, j, maxset);
			i := i + 1
		end
		else
			junk := addstr(DASH, dest, j, maxset);
		i := i + 1
	end
end;
