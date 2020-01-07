{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM expand expand compressed input
.SY
.UL "expand"
.FU
.UL expand
copies its input, which has presumably been encoded by
.UL compress ,
to its output, replacing code sequences
.UI ~n c
by the repeated characters they stand
for so that the text output exactly matches that which was originally encoded.
The occurrence of the warning character
.UL ~
in the input means that the next character
is a repetition count;
.UL A ' `
calls for one instance
of the following character,
.UL B ' `
calls for
two, and so on
up to
.UL Z .' `
.EG
.Q1
expand
Item~D Name~I Value
.S "Item    Name         Value"
1~G car~J ~A~$7,000.00
.S "1       car          ~$7,000.00"
<ENDFILE>
