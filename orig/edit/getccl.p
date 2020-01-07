{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getccl -- expand char class at arg[i] into pat[j] }
function getccl (var arg : string; var i : integer;
		 var pat : string; var j : integer) : boolean;
var
	jstart : integer;
	junk : boolean;
#include "dodash.p"
begin
	i := i + 1;	{ skip over '[' }
	if (arg[i] = NEGATE) then begin
		junk := addstr(NCCL, pat, j, MAXPAT);
		i := i + 1
	end
	else
		junk := addstr(CCL, pat, j, MAXPAT);
	jstart := j;
	junk := addstr(0, pat, j, MAXPAT);	{ room for count }
	dodash(CCLEND, arg, i, pat, j, MAXPAT);
	pat[jstart] := j - jstart - 1;
	getccl := (arg[i] = CCLEND)
end;
