{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ editvar -- variables for edit }
var
	buf : array [0..MAXLINES] of buftype;
	scrout : filedesc;	{ scratch input fd }
	scrin : filedesc;	{ scratch output fd }
	recin : integer;	{ next record to read from scrin }
	recout : integer;	{ next record to write on scrout }
	edittemp : string;	{ temp file name 'edtemp' }

	line1 : integer;	{ first line number }
	line2 : integer;	{ second line number }
	nlines : integer;	{ # of line numbers specified }
	curln : integer;	{ current line -- value of dot }
	lastln : integer;	{ last line -- value of $ }

	pat : string;		{ pattern }
	lin : string;		{ input line }
	savefile : string;	{ remembered file name }
