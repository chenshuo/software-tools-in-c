{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ docmd -- handle all commands except globals }
function docmd (var lin : string; var i : integer;
		glob : boolean; var status : stcode) : stcode;
var
	fil, sub : string;
	line3 : integer;
	gflag, pflag : boolean;
begin
	pflag := false;	{ may be set by d, m, s }
	status := ERR;
	if (lin[i] = PCMD) then begin
		if (lin[i+1] = NEWLINE) then 
		  if (default(curln, curln, status) = OK) then
			status := doprint(line1, line2)
	end
	else if (lin[i] = NEWLINE) then begin
		if (nlines = 0) then
			line2 := nextln(curln);
		status := doprint(line2, line2)
	end
	else if (lin[i] = QCMD) then begin
		if (lin[i+1]=NEWLINE) and (nlines=0) and (not glob) then 
			status := ENDDATA
	end
	else if (lin[i] = ACMD) then begin
		if (lin[i+1] = NEWLINE) then 
			status := append(line2, glob)
	end
	else if (lin[i] = CCMD) then begin
		if (lin[i+1] = NEWLINE) then 
		  if (default(curln, curln, status) = OK) then
		  if (lndelete(line1, line2, status) = OK) then
			status := append(prevln(line1), glob)
	end
	else if (lin[i] = DCMD) then begin
		if (ckp(lin, i+1, pflag, status) = OK) then 
		  if (default(curln, curln, status) = OK) then
		  if (lndelete(line1, line2, status) = OK) then
		  if (nextln(curln) <> 0) then
			curln := nextln(curln)
	end
	else if (lin[i] = ICMD) then begin
		if (lin[i+1] = NEWLINE) then begin
			if (line2 = 0) then
				status := append(0, glob)
			else
				status := append(prevln(line2), glob)
		end
	end
	else if (lin[i] = EQCMD) then begin
		if (ckp(lin, i+1, pflag, status) = OK) then begin
			putdec(line2, 1);
			putc(NEWLINE)
		end
	end
	else if (lin[i] = MCMD) then begin
		i := i + 1;
		if (getone(lin, i, line3, status) = ENDDATA) then 
			status := ERR;
		if (status = OK) then 
		  if (ckp(lin, i, pflag, status) = OK) then
		  if (default(curln, curln, status) = OK) then
			status := move(line3)
	end
	else if (lin[i] = SCMD) then begin
		i := i + 1;
		if (optpat(lin, i) = OK) then 
		  if (getrhs(lin, i, sub, gflag) = OK) then
		  if (ckp(lin, i+1, pflag, status) = OK) then
		  if (default(curln, curln, status) = OK) then
			status := subst(sub, gflag, glob)
	end
	else if (lin[i] = ECMD) then begin
		if (nlines = 0) then 
		  if (getfn(lin, i, fil) = OK) then begin
			scopy(fil, 1, savefile, 1);
			clrbuf;
			setbuf;
			status := doread(0, fil)
		end
	end
	else if (lin[i] = FCMD) then begin
		if (nlines = 0) then 
		  if (getfn(lin, i, fil) = OK) then begin
			scopy(fil, 1, savefile, 1);
			putstr(savefile, STDOUT);
			putc(NEWLINE);
			status := OK
		end
	end
	else if (lin[i] = RCMD) then begin
		if (getfn(lin, i, fil) = OK) then 
			status := doread(line2, fil)
	end
	else if (lin[i] = WCMD) then begin
		if (getfn(lin, i, fil) = OK) then 
		  if (default(1, lastln, status) = OK) then
			status := dowrite(line1, line2, fil)
	end;
	{ else status is ERR }

	if (status = OK) and (pflag) then 
		status := doprint(curln, curln);
	docmd := status
end;
