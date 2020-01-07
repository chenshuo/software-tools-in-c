{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ prims -- external declarations for UCSD primitives }
program xxx (input, output);
{ Copyright (c) 1981 by Bell Telephone Laboratories, Inc.
  and Whitesmiths, Ltd. }

#include <chars.h>
#define error(str)	begin message(str); exit(program) end
#define isdigit(c)	((ord('0') <= c) and (c <= ord('9')))
#define message(str)	writeln(str)

const
	IOERROR = 0;	{ filedesc constants }
	STDIN = 1;
	STDOUT = 2;
	STDERR = 3;
	MAXOPEN = 7;

	IOREAD = 0; 	{ mode constants }
	IOWRITE = 1;

	MAXCMD = 20;	{ limits }
	MAXSTR = 100;
type
	character = -128..127;
	filedesc = IOERROR..MAXOPEN;
	xstring = array [1..MAXSTR] of character;
	filtyp = (CLOSED, STDIO, FIL1, FIL2, FIL3, FIL4);
var
	cmdargs : 0..MAXCMD;
	cmdidx : array [1..MAXCMD] of 1..MAXSTR;
	cmdlin : xstring;
	cmdfil : array [STDIN..MAXOPEN] of filtyp;
	cmdopen : array [filtyp] of boolean;
	file1, file2, file3, file4 : text;
	kbdline : xstring;
	kbdn : integer;
	kbdnext : integer;

procedure scopy (var src : xstring; i : integer;
		var dest : xstring; j : integer);
begin
	while (src[i] <> ENDSTR) do begin
		dest[j] := src[i];
		i := i + 1;
		j := j + 1
	end;
	dest[j] := ENDSTR
end;

{ the primitives }
#include <getkbd.p>
#include <getc.p>
#include <getline.p>
#include <putc.p>
#include <getarg.p>
#include <nargs.p>
#include <close.p>
#include <open.p>
#include <remove.p>

{ alias names that collide }
#define close	xclose
#define string	xstring

{ utilities }
#include <addstr.p>
#include <equal.p>
#include <esc.p>
#include <index.p>
#include <isalphanum.p>
#include <isletter.p>
#include <islower.p>
#include <isupper.p>
#include <itoc.p>
#include <length.p>
#include <max.p>
#include <min.p>
#include <ctoi.p>
#include <fcopy.p>
#include <mustcreate.p>
#include <mustopen.p>
#include <putdec.p>

{ command line input and file redirection }
#include <initcmd.p>
