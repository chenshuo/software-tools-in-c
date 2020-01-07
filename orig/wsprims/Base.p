{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ prims -- external declarations for Whitesmiths primitives }
program xxx (input, output, errout);
#include <tools.h>

{ Environment supplied primitives ... }
procedure close (fd : filedesc);
	external;
procedure exit (status : boolean);
	external;
function getarg (n : integer; var str : string;
		maxsize : integer) : boolean;
	external;
function nargs : integer;
	external;
procedure remove (name : string);
	external;

{ Externally supplied primitive interfaces ... }
function getc (var c : character) : character;
	external;
function getcf (var c : character; fd : filedesc)
		: character;
	external;
function getline (var str : string; fd : filedesc) : boolean;
	external;
function pcreate (var name : string; mode : integer)
		: filedesc;
	external;
function popen (var name : string; mode : integer) : filedesc;
	external;
procedure pputstr (var str : string; fd : filedesc);
	external;
procedure putc (c : character);
	external;
procedure putcf (c : character; fd : filedesc);
	external;

{ Externally supplied utilities ... }
function addstr (c : character; var outset : string;
		var j : integer; maxset : integer) : boolean;
	external;
function ctoi (var s : string; var i : integer) : integer;
	external;
function equal (var str1, str2 : string) : boolean;
	external;
function esc (var s : string; var i : integer) : character;
	external;
procedure fcopy (fin, fout : filedesc);
	external;
function index (var s : string; c : character) : integer;
	external;
function isalphanum (c : character) : boolean;
	external;
function isletter (c : character) : boolean;
	external;
function islower (c : character) : boolean;
	external;
function isupper (c : character) : boolean;
	external;
function itoc (n : integer; var str : string; i : integer)
		: integer;
	external;
function length (var s : string) : integer;
	external;
function max (x, y : integer) : integer;
	external;
function min (x, y : integer) : integer;
	external;
procedure putdec (n, w : integer);
	external;
procedure scopy (var src : string; i : integer;
		var dest : string; j : integer);
	external;

{ Internally supplied primitives ... }
function create (var name : string; mode : integer)
		: filedesc;
begin
	create := pcreate(name, mode)
end;

function open (var name : string; mode : integer) : filedesc;
begin
	open := popen(name, mode)
end;

procedure putstr (var str : string; fd : filedesc);
begin
	pputstr(str, fd)
end;

#include <mustcreate.p>
#include <mustopen.p>

{ The body in question ... }
