{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ mactype -- type declarations for macro }
type
	charpos = 1..MAXCHARS;
	charbuf = array [1..MAXCHARS] of character;
	posbuf = array [1..MAXPOS] of charpos;
	pos = 0..MAXPOS;
	sttype = (DEFTYPE, MACTYPE, IFTYPE, SUBTYPE,
		EXPRTYPE, LENTYPE, CHQTYPE); { symbol table types }
	ndptr = ^ndblock;
	ndblock =
		record
			name : charpos;
			defn : charpos;
			kind : sttype;
			nextptr : ndptr
		end;
