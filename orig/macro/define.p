{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ define -- simple string replacement macro processor }
procedure define;
#include "defcons.p"
#include "deftype.p"
#include "defvar.p"
	defn : string;
	token : string;
	toktype : sttype;	{ type returned by lookup }
	defname : string;	{ value is 'define' }
	null : string;		{ value is '' }
#include "defproc.p"
begin
	null[1] := ENDSTR;
	initdef;
	install(defname, null, DEFTYPE);
	while (gettok(token, MAXTOK) <> ENDFILE) do
		if (not isletter(token[1])) then 
			putstr(token, STDOUT)
		else if (not lookup(token, defn, toktype)) then
			putstr(token, STDOUT)	{ undefined }
		else if (toktype = DEFTYPE) then begin	{ defn }
			getdef(token, MAXTOK, defn, MAXDEF);
			install(token, defn, MACTYPE)
		end
		else
			pbstr(defn)	{ push replacement onto input }
end;
