{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ format -- text formatter main program (final version) }
procedure format;
#include "fmtcons.p"
type
	cmdtype = (BP, BR, CE, FI, FO, HE, IND, LS, NF, PL,
				RM, SP, TI, UL, UNKNOWN);
var
	{ page parameters }
	curpage : integer;	{ current output page number; init = 0 }
	newpage : integer;	{ next output page number; init = 1 }
	lineno : integer;	{ next line to be printed; init = 0 }
	plval : integer;	{ page length in lines; init = PAGELEN = 66 }
	m1val : integer;	{ margin before and including header }
	m2val : integer;	{ margin after header }
	m3val : integer;	{ margin after last text line }
	m4val : integer;	{ bottom margin, including footer }
	bottom : integer;	{ last live line on page, = plval-m3val-m4val }
	header : string;	{ top of page title; init = NEWLINE }
	footer : string;	{ bottom of page title; init = NEWLINE }

	{ global parameters }
	fill : boolean;		{ fill if true; init = true }
	lsval : integer;	{ current line spacing; init = 1 }
	spval : integer;	{ next space }
	inval : integer;	{ current indent; >= 0; init = 0 }
	rmval : integer;	{ current right margin; init = PAGEWIDTH = 60 }
	tival : integer;	{ current temporary indent; init = 0 }
	ceval : integer;	{ number of lines to center; init = 0 }
	ulval : integer;	{ number of lines to underline; init = 0 }

	{ output area }
	outp : integer;		{ last char position in outbuf; init = 0 }
	outw : integer;		{ width of text currently in outbuf; init = 0 }
	outwds : integer;	{ number of words in outbuf; init = 0 }
	outbuf : string;	{ lines to be filled collect here }

	dir : 0..1;

	inbuf : string;		{ input line }

#include "fmtproc.p"

begin
	initfmt;
	while (getline(inbuf, STDIN, MAXSTR)) do 
		if (inbuf[1] = CMD) then
			command(inbuf)
		else
			text(inbuf)
end;
