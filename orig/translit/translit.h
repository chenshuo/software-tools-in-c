#pragma once

// dodash - expand set at src[i] into dest[j], stop at delim
void dodash(character delim, string& src, integer& i, string& dest, integer& j, integer maxset);

// makeset -- make set from inset[k] in outset
boolean makeset(string& inset, integer k, string& outset, integer maxset);

// xindex -- conditionally invert value from index
integer xindex(string& inset, character c, boolean allbut, integer lastto);
