/* YACC program to recognise a^nb^n */

%{
#include<stdio.h>
#include<string.h>
%}

%token A B NL

/*
    Grammar:
        STMT    => S
        S       => ASB
        A       => a
        B       => b
*/

%%
STMT:
    S NL   { printf("\nValid string!"); }
    ;

S:  A S B
    |
    ;
%%

int yyerror(char *error) {
    printf("Invalid string!");
    exit(0);
}

main() {
    printf("\nEnter the string: ");
    yyparse();
}