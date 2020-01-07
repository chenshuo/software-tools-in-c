{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ edit -- main routine for text editor }
procedure edit;
#include "editcons.p"
#include "edittype.p"
#include "editvar.p"
	cursave, i : integer;
	status : stcode;
	more : boolean;
#include "editproc.p"
begin
	setbuf;
	pat[1] := ENDSTR;
	savefile[1] := ENDSTR;
	if (getarg(1, savefile, MAXSTR)) then 
		if (doread(0, savefile) = ERR) then 
			message('?');
	more := getline(lin, STDIN, MAXSTR);
	while (more) do begin
		i := 1;
		cursave := curln;
		if (getlist(lin, i, status) = OK) then begin
			if (ckglob(lin, i, status) = OK) then 
				status := doglob(lin, i, cursave, status)
			else if (status <> ERR) then 
				status := docmd(lin, i, false, status)
			{ else ERR, do nothing }
		end;
		if (status = ERR) then begin
			message('?');
			curln := min(cursave, lastln)
		end
		else if (status = ENDDATA) then 
			more := false;
		{ else OK }
		if (more) then
			more := getline(lin, STDIN, MAXSTR)
	end;
	clrbuf
end;
