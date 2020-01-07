{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM compress compress input by encoding repeated characters
.SY
.UL "compress"
.FU
.UL compress
copies its input to its output, replacing strings of four or more identical
characters by a code sequence so that the output generally contains
fewer characters than the input.
A run of
.UL x 's
is encoded as
.UL ~nx ,
where the count
.UL n
is a character:
.UL A ' `
calls for a repetition of one
.UL x ,
.UL B ' `
a repetition of two
.UL x 's,
and so on.
Runs longer than 26 are broken into several shorter ones.
Runs of
.UL ~ 's
of any length are encoded.
.EG
.Q1
compress
Item    Name         Value
.S "Item~D Name~I Value"
1       car          ~$7,000.00
.S "1~G car~J ~A~$7,000.00"
<ENDFILE>
.BU
The implementation assumes 26 legal characters beginning with
.UL A .
