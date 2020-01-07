{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ deftype -- type definitions for define }
type
	charpos = 1..MAXCHARS;
	charbuf = array [1..MAXCHARS] of character;
	sttype = (DEFTYPE, MACTYPE);	{ symbol table types }
	ndptr = ^ndblock;	{ pointer to a name-defn block }
	ndblock =
		record		{ name-defn block }
			name : charpos;
			defn : charpos;
			kind : sttype;
			nextptr : ndptr
		end;
