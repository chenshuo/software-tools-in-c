{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ command -- perform formatting command }
procedure command (var buf : string);
var
	cmd : cmdtype;
	argtype, spval, val : integer;
begin
	cmd := getcmd(buf);
	if (cmd <> UNKNOWN) then 
		val := getval(buf, argtype);
	case cmd of
	FI: begin
		break;
		fill := true
		end;
	NF: begin
		break;
		fill := false
		end;
	BR:
		break;
	LS:
		setparam(lsval, val, argtype, 1, 1, HUGE);
	CE: begin
		break;
		setparam(ceval, val, argtype, 1, 0, HUGE)
		end;
	UL:
		setparam(ulval, val, argtype, 1, 0, HUGE);
	HE:
		gettl(buf, header);
	FO:
		gettl(buf, footer);
	BP: begin
		page;
		setparam(curpage,val,argtype,curpage+1,-HUGE,HUGE);
		newpage := curpage
		end;
	SP: begin
		setparam(spval, val, argtype, 1, 0, HUGE);
		space(spval)
		end;
	IND:
		setparam(inval, val, argtype, 0, 0, rmval-1);
	RM:
		setparam(rmval, val, argtype, PAGEWIDTH,
		  inval+tival+1, HUGE);
	TI: begin
		break;
		setparam(tival, val, argtype, 0, -HUGE, rmval)
		end;
	PL: begin
		setparam(plval, val, argtype, PAGELEN,
		  m1val+m2val+m3val+m4val+1, HUGE);
		bottom := plval - m3val - m4val
		end;
	UNKNOWN:
		{ ignore }
	end
end;
