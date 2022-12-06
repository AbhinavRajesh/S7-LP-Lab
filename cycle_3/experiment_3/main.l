/* YACC program to implement arithmetic expression */

letters [a-zA-Z]
digits [0-9]
arithmetic [+|-|*|/|%]

%{
#include "y.tab.h"
%}

%%
\n                                  { return NL; }

[ \t\n]                             {}
"++"|"--"                           { return INR_DCR; }
{arithmetic}                        { return ARITHMETIC; }
{letters}({letters}|{digits}|_)*    { return ID; }
{digits}+                           { return NUMBER; }
"="                                 { return EQ; }
.                                   { return yytext[0]; }
%%

int yywrap(void) {
    return 1;
}


