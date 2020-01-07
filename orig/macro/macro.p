{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ macro -- expand macros with arguments }
procedure macro;
#include "maccons.p"
#include "mactype.p"
#include "macvar.p"
	defn : string;
	token : string;
	toktype : sttype;
	t : character;
	nlpar : integer;
#include "macproc.p"
begin
	initmacro;
	install(defname, null, DEFTYPE);
	install(exprname, null, EXPRTYPE);
	install(subname, null, SUBTYPE);
	install(ifname, null, IFTYPE);
	install(lenname, null, LENTYPE);
	install(chqname, null, CHQTYPE);

	cp := 0;
	ap := 1;
	ep := 1;
	while (gettok(token, MAXTOK) <> ENDFILE) do
		if (isletter(token[1])) then begin
			if (not lookup(token, defn, toktype)) then 
				puttok(token)
			else begin	{ defined; put it in eval stack }
				cp := cp + 1;
				if (cp > CALLSIZE) then 
					error('macro: call stack overflow');
				callstk[cp] := ap;
				typestk[cp] := toktype;
				ap := push(ep, argstk, ap);
				puttok(defn);	{ push definition }
				putchr(ENDSTR);
				ap := push(ep, argstk, ap);
				puttok(token);	{ stack name }
				putchr(ENDSTR);
				ap := push(ep, argstk, ap);
				t := gettok(token, MAXTOK);	{ peek at next }
				pbstr(token);
				if (t <> LPAREN) then begin	{ add () }
					putback(RPAREN);
					putback(LPAREN)
				end;
				plev[cp] := 0
			end
		end
		else if (token[1] = lquote) then begin	{ strip quotes }
			nlpar := 1;
			repeat
				t := gettok(token, MAXTOK);
				if (t = rquote) then 
					nlpar := nlpar - 1
				else if (t = lquote) then
					nlpar := nlpar + 1
				else if (t = ENDFILE) then 
					error('macro: missing right quote');
				if (nlpar > 0) then
					puttok(token)
			until (nlpar = 0)
		end
		else if (cp = 0) then 	{ not in a macro at all }
			puttok(token)
		else if (token[1] = LPAREN) then begin
			if (plev[cp] > 0) then 
				puttok(token);
			plev[cp] := plev[cp] + 1
		end
		else if (token[1] = RPAREN) then begin
			plev[cp] := plev[cp] - 1;
			if (plev[cp] > 0) then 
				puttok(token)
			else begin	{ end of argument list }
				putchr(ENDSTR);
				eval(argstk, typestk[cp], callstk[cp], ap-1);
				ap := callstk[cp];	{ pop eval stack }
				ep := argstk[ap];
				cp := cp - 1
			end
		end
		else if (token[1]=COMMA) and (plev[cp]=1) then begin
			putchr(ENDSTR);	{ new argument }
			ap := push(ep, argstk, ap)
		end
		else
			puttok(token);	{ just stack it }
	if (cp <> 0) then 
		error('macro: unexpected end of input')
end;
