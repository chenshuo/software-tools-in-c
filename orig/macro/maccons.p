{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ maccons -- const declarations for macro }
const
	BUFSIZE = 1000;		{ size of pushback buffer }
	MAXCHARS = 5000;	{ size of name-defn table }
	MAXPOS = 500;		{ size of position arrays }
	CALLSIZE = MAXPOS;
	ARGSIZE = MAXPOS;
	EVALSIZE = MAXCHARS;
	MAXDEF = MAXSTR;	{ max chars in a defn }
	MAXTOK = MAXSTR;	{ max chars in a token }
	HASHSIZE = 53;		{ size of hash table }
	ARGFLAG = DOLLAR;	{ macro invocation character }
