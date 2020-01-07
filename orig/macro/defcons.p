{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ defcons -- const declarations for define }
const
	BUFSIZE = 500;		{ size of pushback buffer }
	MAXCHARS = 5000;	{ size of name-defn table }
	MAXDEF = MAXSTR;	{ max chars in a defn }
	MAXTOK = MAXSTR;	{ max chars in a token }
	HASHSIZE = 53;		{ size of hash table }
