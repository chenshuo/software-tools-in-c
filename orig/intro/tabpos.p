{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ tabpos -- return true if col is a tab stop }
function tabpos (col : integer; var tabstops : tabtype)
		: boolean;
begin
	if (col > MAXLINE) then
		tabpos := true
	else
		tabpos := tabstops[col]
end;
