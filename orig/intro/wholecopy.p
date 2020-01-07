{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ complete copy -- to show one possible implementation }
program copyprog (input, output);
const
	ENDFILE = -1;
	NEWLINE = 10;	{ ASCII value }
type
	character = -1..127;	{ ASCII, plus ENDFILE }

{ getc -- get one character from standard input }
function getc (var c : character) : character;
var
	ch : char;
begin
	if (eof) then
		c := ENDFILE
	else if (eoln) then begin
		readln;
		c := NEWLINE
	end
	else begin
		read(ch);
		c := ord(ch)
	end;
	getc := c
end;

{ putc -- put one character on standard output }
procedure putc (c : character);
begin
	if (c = NEWLINE) then
		writeln
	else
		write(chr(c))
end;

{ copy -- copy input to output }
procedure copy;
var
	c : character;
begin
	while (getc(c) <> ENDFILE) do
		putc(c)
end;

begin	{ main program }
	copy
end.
