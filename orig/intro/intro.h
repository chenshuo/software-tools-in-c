#pragma once

using tabtype = boolean[MAXLINE + 1];

void settabs(tabtype& tabstops);
boolean tabpos(integer col, tabtype& tabstops);
