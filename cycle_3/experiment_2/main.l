/* YACC program to implement IF-THEN-ELSE */

letters [a-zA-Z]
digits [0-9]
relational <|>|<=|>=|==
arithmetic "++"|"--"|[+|-|*|/|%]

%{
#include "y.tab.h"
%}

%%
[ \t\n]                             {}
if                                  { return IF; }
then                                { return THEN; }
else                                { return ELSE; }
{arithmetic}                        {return ARITHMETIC; }
{relational}                        { return RELATIONAL; }
{letters}({letters}|{digits}|_)*    { return ID; }
{digits}+                           { return NUMBER; }
"="                                 { return EQ; }
.                                   { return yytext[0]; }
%%

int yywrap(void) {
    return 1;
}


