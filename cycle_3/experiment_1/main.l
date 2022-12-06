/* YACC program to recognise a^nb^n */

%{
#include "y.tab.h"

%}

/* These tokens(A, B) would be passed to the YACC file */
%%
[aA]    { return A; }
[bB]    { return B; }

\n      { return NL; }
.       { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
