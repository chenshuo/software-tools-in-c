{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ gethdr -- get header info from fd }
function gethdr (fd : filedesc; var buf, name : string;
		var size : integer) : boolean;
var
	temp : string;
	i : integer;
begin
	if (getline(buf, fd, MAXSTR) = false) then
		gethdr := false
	else begin
		i := getword(buf, 1, temp);
		if (not equal(temp, archhdr)) then 
			error('archive not in proper format');
		i := getword(buf, i, name);
		size := ctoi(buf, i);
		gethdr := true
	end
end;
