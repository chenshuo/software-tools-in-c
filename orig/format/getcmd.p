{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getcmd -- decode command type }
function getcmd (var buf : string) : cmdtype;
var
	cmd : packed array [1..2] of char;
begin
	cmd[1] := chr(buf[2]);
	cmd[2] := chr(buf[3]);
	if (cmd = 'fi') then  
		getcmd := FI
	else if (cmd = 'nf') then  
		getcmd := NF
	else if (cmd = 'br') then  
		getcmd := BR
	else if (cmd = 'ls') then  
		getcmd := LS
	else if (cmd = 'bp') then  
		getcmd := BP
	else if (cmd = 'sp') then  
		getcmd := SP
	else if (cmd = 'in') then  
		getcmd := IND
	else if (cmd = 'rm') then  
		getcmd := RM
	else if (cmd = 'ti') then  
		getcmd := TI
	else if (cmd = 'ce') then  
		getcmd := CE
	else if (cmd = 'ul') then  
		getcmd := UL
	else if (cmd = 'he') then  
		getcmd := HE
	else if (cmd = 'fo') then  
		getcmd := FO
	else if (cmd = 'pl') then  
		getcmd := PL
	else
		getcmd := UNKNOWN
end;
